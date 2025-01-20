@interface AirPodsAudioSystemController
- (ADASManager)audioDataAnalysisSettingsManager;
- (AirPodsAudioSystemInputs)airpodsInputs;
- (BOOL)headphoneExposureNotificationsChanged;
- (BOOL)headphoneExposureNotificationsEnabled;
- (BOOL)isRunning;
- (Class)audioSystemResultClass;
- (DAChamberDetector)chamberDetector;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_semaphore)chamberReadinessSemaphore;
- (OS_dispatch_semaphore)testCompletionSemaphore;
- (OS_dispatch_semaphore)testEndedSemaphore;
- (float)filterDelay;
- (id)archiveNameTemplate;
- (id)createNewTestSequenceWithOutput:(id)a3 andStimulusFile:(id)a4;
- (id)cropAudioData:(id)a3 lengthFromFront:(unsigned int)a4 lengthFromEnd:(unsigned int)a5;
- (id)pathToSoundFile:(id)a3;
- (id)testID;
- (vDSP_biquad_SetupStruct)filterSetup;
- (void)cancel;
- (void)dealloc;
- (void)downloadFilesWithResponder:(id)a3;
- (void)endTesting:(int)a3 immediately:(BOOL)a4;
- (void)freeFilter;
- (void)handleChamberStatus:(int)a3;
- (void)initFilter;
- (void)overrideOriginalHeadphoneExposureNotification;
- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7;
- (void)processCrackleData:(float *)a3 audioRawDataSize:(int)a4 saveResult:(id *)a5;
- (void)processFrequencyAndRearVentOcculusionWithPlayResult:(id)a3 sourceSignalData:(id)a4 dkResult:(id)a5;
- (void)restoreOriginalHeadphoneExposureNotification;
- (void)setAirpodsInputs:(id)a3;
- (void)setAudioDataAnalysisSettingsManager:(id)a3;
- (void)setChamberDetector:(id)a3;
- (void)setChamberReadinessSemaphore:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setFilterDelay:(float *)a3;
- (void)setFilterSetup:(vDSP_biquad_SetupStruct *)a3;
- (void)setHeadphoneExposureNotificationsChanged:(BOOL)a3;
- (void)setHeadphoneExposureNotificationsEnabled:(BOOL)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setTestCompletionSemaphore:(id)a3;
- (void)setTestEndedSemaphore:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)stopAlerts;
- (void)teardown;
- (void)testFinishedSuccessfully;
@end

@implementation AirPodsAudioSystemController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a4;
  [(AirPodsAudioSystemController *)self setAirpodsInputs:a3];
  v7 = [(AirPodsAudioSystemController *)self airpodsInputs];
  unsigned int v8 = [v7 unpairAirPodsOnFinish];
  if (v6 && v8)
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting unpair of current AirPods device on test completion", buf, 2u);
      }

      [v6 unpairSessionAccessoryOnTestCompletion];
    }
  }
  else
  {
  }
  id v11 = objc_alloc_init((Class)ADASManager);
  [(AirPodsAudioSystemController *)self setAudioDataAnalysisSettingsManager:v11];

  [(AirPodsAudioSystemController *)self overrideOriginalHeadphoneExposureNotification];
  [(AirPodsAudioSystemController *)self initFilter];
  v12 = [DAChamberDetector alloc];
  v13 = [(AirPodsAudioSystemController *)self airpodsInputs];
  v14 = [v13 chamberInputs];
  v15 = [(DAChamberDetector *)v12 initWithInputs:v14];
  [(AirPodsAudioSystemController *)self setChamberDetector:v15];

  v16 = [(AirPodsAudioSystemController *)self chamberDetector];
  [v16 setDelegate:self];

  dispatch_queue_t v17 = dispatch_queue_create("AirPodsAudioSystemControllerEventQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  [(AirPodsAudioSystemController *)self setEventQueue:v17];

  v18 = [(AirPodsAudioSystemController *)self airpodsInputs];
  v19.receiver = self;
  v19.super_class = (Class)AirPodsAudioSystemController;
  [(AudioSystemCommon *)&v19 setupWithInputs:v18 responder:v6];
}

- (void)start
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting test....", buf, 2u);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  [(AirPodsAudioSystemController *)self setChamberReadinessSemaphore:v4];

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(AirPodsAudioSystemController *)self setTestCompletionSemaphore:v5];

  id v6 = [(AirPodsAudioSystemController *)self chamberDetector];
  [v6 start];

  v7 = [(AirPodsAudioSystemController *)self chamberReadinessSemaphore];
  unsigned int v8 = [(AirPodsAudioSystemController *)self airpodsInputs];
  char v9 = [v8 chamberInputs];
  dispatch_time_t v10 = dispatch_time(0, 1000000000 * [v9 detectChamberReadyWaitTime]);
  intptr_t v11 = dispatch_semaphore_wait(v7, v10);

  if (v11)
  {
    v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Audio test has timed out while waiting for chamber readiness.", buf, 2u);
    }

    [(AirPodsAudioSystemController *)self endTesting:4294966294 immediately:1];
  }
  else
  {
    [(AirPodsAudioSystemController *)self setIsRunning:1];
    v15.receiver = self;
    v15.super_class = (Class)AirPodsAudioSystemController;
    [(AudioSystemCommon *)&v15 start];
    v13 = [(AirPodsAudioSystemController *)self eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000064B4;
    block[3] = &unk_10001C590;
    block[4] = self;
    dispatch_async(v13, block);
  }
}

- (void)cancel
{
  [(AirPodsAudioSystemController *)self setChamberReadinessSemaphore:0];
  [(AirPodsAudioSystemController *)self setTestCompletionSemaphore:0];
  v3 = [(AirPodsAudioSystemController *)self chamberDetector];
  [v3 stop];

  [(AirPodsAudioSystemController *)self setIsRunning:0];
  [(AirPodsAudioSystemController *)self stopAlerts];
  v4.receiver = self;
  v4.super_class = (Class)AirPodsAudioSystemController;
  [(AudioSystemCommon *)&v4 cancel];
}

- (void)teardown
{
  [(AirPodsAudioSystemController *)self setChamberReadinessSemaphore:0];
  [(AirPodsAudioSystemController *)self setTestCompletionSemaphore:0];
  v3 = [(AirPodsAudioSystemController *)self chamberDetector];
  [v3 stop];

  [(AirPodsAudioSystemController *)self setIsRunning:0];
  [(AirPodsAudioSystemController *)self restoreOriginalHeadphoneExposureNotification];
  [(AirPodsAudioSystemController *)self stopAlerts];
  v4.receiver = self;
  v4.super_class = (Class)AirPodsAudioSystemController;
  [(AudioSystemCommon *)&v4 teardown];
  AAT_cleanUp();
  [(AirPodsAudioSystemController *)self freeFilter];
}

- (void)testFinishedSuccessfully
{
}

- (void)endTesting:(int)a3 immediately:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[AirPodsAudioSystemController] End testing with status: %d", buf, 8u);
  }

  [(AirPodsAudioSystemController *)self setIsRunning:0];
  if (a4
    || ([(AirPodsAudioSystemController *)self airpodsInputs],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 chamberInputs],
        char v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 detectChamberSensor],
        v9,
        v8,
        !v10))
  {
    if (v5 && ![(AudioSystemCommon *)self testFailed])
    {
      v28 = +[NSNumber numberWithInt:v5];
      v29 = [(AirPodsAudioSystemController *)self result];
      [v29 setStatusCode:v28];
    }
    [(AirPodsAudioSystemController *)self setFinished:1];
  }
  else
  {
    intptr_t v11 = [(AirPodsAudioSystemController *)self airpodsInputs];
    v12 = [v11 chamberInputs];
    unsigned int v13 = [v12 testCompleteVibrationAlertEnabled];

    v14 = [(AirPodsAudioSystemController *)self airpodsInputs];
    objc_super v15 = [v14 chamberInputs];
    unsigned int v16 = [v15 testCompleteChimeAlertEnabled];

    if (v13)
    {
      uint64_t v33 = kAudioServicesPlaySystemSoundOptionLoopKey;
      dispatch_queue_t v17 = +[NSNumber numberWithBool:1];
      v34 = v17;
      v18 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

      AudioServicesPlaySystemSoundWithOptions();
      objc_super v19 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[AirPodsAudioSystemController] Start test vibration", buf, 2u);
      }
    }
    if (v16)
    {
      uint64_t v31 = kAudioServicesPlaySystemSoundOptionLoopKey;
      v20 = +[NSNumber numberWithBool:1];
      v32 = v20;
      v21 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];

      AudioServicesPlaySystemSoundWithOptions();
      v22 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[AirPodsAudioSystemController] Start test chime", buf, 2u);
      }
    }
    v23 = [(AirPodsAudioSystemController *)self testCompletionSemaphore];
    dispatch_semaphore_signal(v23);

    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    [(AirPodsAudioSystemController *)self setTestEndedSemaphore:v24];

    if (v5)
    {
      if (![(AudioSystemCommon *)self testFailed])
      {
        v25 = +[NSNumber numberWithInt:v5];
        v26 = [(AirPodsAudioSystemController *)self result];
        [v26 setStatusCode:v25];
      }
    }
    v27 = [(AirPodsAudioSystemController *)self eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006AF4;
    block[3] = &unk_10001C590;
    block[4] = self;
    dispatch_async(v27, block);
  }
}

- (void)stopAlerts
{
  v3 = [(AirPodsAudioSystemController *)self airpodsInputs];
  objc_super v4 = [v3 chamberInputs];
  unsigned int v5 = [v4 testCompleteVibrationAlertEnabled];

  if (v5) {
    AudioServicesStopSystemSound();
  }
  id v6 = [(AirPodsAudioSystemController *)self airpodsInputs];
  v7 = [v6 chamberInputs];
  unsigned int v8 = [v7 testCompleteChimeAlertEnabled];

  if (v8)
  {
    AudioServicesStopSystemSound();
  }
}

- (void)dealloc
{
  [(AirPodsAudioSystemController *)self stopAlerts];
  v3.receiver = self;
  v3.super_class = (Class)AirPodsAudioSystemController;
  [(AirPodsAudioSystemController *)&v3 dealloc];
}

- (void)handleChamberStatus:(int)a3
{
  unsigned int v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received chamber status: %u", (uint8_t *)v9, 8u);
  }

  if (a3 == 3)
  {
    if (![(AirPodsAudioSystemController *)self isRunning])
    {
      v7 = [(AirPodsAudioSystemController *)self testEndedSemaphore];

      if (v7)
      {
        id v6 = [(AirPodsAudioSystemController *)self testEndedSemaphore];
        goto LABEL_10;
      }
    }
    [(AirPodsAudioSystemController *)self endTesting:4294966293 immediately:1];
  }
  else if (a3 == 1 && ![(AirPodsAudioSystemController *)self isRunning])
  {
    id v6 = [(AirPodsAudioSystemController *)self chamberReadinessSemaphore];
LABEL_10:
    unsigned int v8 = v6;
    dispatch_semaphore_signal(v6);
  }
}

- (void)downloadFilesWithResponder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AirPodsAudioSystemController *)self airpodsInputs];
  unsigned __int8 v6 = [v5 useBundledAudioStimulus];

  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skiping file download - useBundledAudioStimulus is enabled", v8, 2u);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AirPodsAudioSystemController;
    [(AudioSystemCommon *)&v9 downloadFilesWithResponder:v4];
  }
}

- (id)pathToSoundFile:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AirPodsAudioSystemController *)self airpodsInputs];
  unsigned int v6 = [v5 useBundledAudioStimulus];

  v7 = DiagnosticLogHandleForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Using bundled stimulus for audio file %@", buf, 0xCu);
    }

    objc_super v9 = [v4 componentsSeparatedByString:@"."];
    unsigned int v10 = [v9 firstObject];

    intptr_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 URLForResource:v10 withExtension:@".wav"];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Using downloaded stimulus for audio file %@", buf, 0xCu);
    }

    v14.receiver = self;
    v14.super_class = (Class)AirPodsAudioSystemController;
    v12 = [(AudioSystemCommon *)&v14 pathToSoundFile:v4];
  }

  return v12;
}

- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v13;
  id v18 = v15;
  [v18 setAudioTestType:[v17 audioTestType]];
  id v19 = [v17 audioTestType];
  if (v19 == (id)1)
  {
    [(AirPodsAudioSystemController *)self processFrequencyAndRearVentOcculusionWithPlayResult:v12 sourceSignalData:v14 dkResult:v18];
LABEL_8:
    id v23 = v18;
    goto LABEL_9;
  }
  if (v19)
  {
    dispatch_semaphore_t v24 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v31 = [v17 audioTestType];
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Unrecognized AirPods audio test type %ld", buf, 0xCu);
    }

    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Unrecognized AirPods audio test type";
    v25 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v26 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-912 userInfo:v25];

    [(AudioSystemCommon *)self failedToExecuteWithError:v26];
    id v16 = (id)v26;
    goto LABEL_8;
  }
  id v20 = [v12 data];
  id v21 = [v20 bytes];
  v22 = [v12 data];
  id v27 = v18;
  -[AirPodsAudioSystemController processCrackleData:audioRawDataSize:saveResult:](self, "processCrackleData:audioRawDataSize:saveResult:", v21, (unint64_t)[v22 length] >> 2, &v27);
  id v23 = v27;

LABEL_9:
}

- (id)createNewTestSequenceWithOutput:(id)a3 andStimulusFile:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AirPodsAudioSystemController;
  id v6 = a3;
  id v7 = [(AudioSystemCommon *)&v12 createNewTestSequenceWithOutput:v6 andStimulusFile:a4];
  id v8 = [v6 numberOfChannels];

  [v7 setNumberOfChannels:v8];
  objc_super v9 = [(AirPodsAudioSystemController *)self airpodsInputs];
  unsigned int v10 = [v9 micBufferNumbers];
  [v7 setMicBufferNumbers:v10];

  [v7 setRequiresBluetoothOutput:1];

  return v7;
}

- (Class)audioSystemResultClass
{
  return (Class)objc_opt_class();
}

- (id)archiveNameTemplate
{
  return @"com.apple.Diagnostics.8290.XXXXXXXX";
}

- (id)testID
{
  return &off_10001D6E8;
}

- (void)processCrackleData:(float *)a3 audioRawDataSize:(int)a4 saveResult:(id *)a5
{
  id v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dumping input data", buf, 2u);
  }

  for (uint64_t i = 0; i != 5; ++i)
  {
    objc_super v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = a3[i];
      *(_DWORD *)buf = 134217984;
      double v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.21g", buf, 0xCu);
    }
  }
  intptr_t v11 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "End dumping input data", buf, 2u);
  }

  *(_DWORD *)buf = 0;
  uint64_t v28 = 0;
  id v27 = [(AirPodsAudioSystemController *)self airpodsInputs];
  objc_super v12 = [v27 crackleSamplingRate];
  int v24 = [v12 intValue];
  id v13 = [(AirPodsAudioSystemController *)self airpodsInputs];
  id v14 = [v13 crackleBaseFrequency];
  int v15 = [v14 intValue];
  id v16 = [(AirPodsAudioSystemController *)self airpodsInputs];
  id v17 = [v16 crackleNeighborDistance];
  AAT_processCrackledData(a3, a4, v24, v15, (int)[v17 intValue], &self->_filterSetup, -[AirPodsAudioSystemController filterDelay](self, "filterDelay"), (float *)buf, (float *)&v28 + 1, &v28);

  LODWORD(v18) = *(_DWORD *)buf;
  id v19 = +[NSNumber numberWithFloat:v18];
  [*a5 setXCorrPeak:v19];

  LODWORD(v20) = HIDWORD(v28);
  id v21 = +[NSNumber numberWithFloat:v20];
  [*a5 setXCorrPNR:v21];

  LODWORD(v22) = v28;
  id v23 = +[NSNumber numberWithFloat:v22];
  [*a5 setXCorrCenter:v23];
}

- (void)processFrequencyAndRearVentOcculusionWithPlayResult:(id)a3 sourceSignalData:(id)a4 dkResult:(id)a5
{
  id v63 = a3;
  id v62 = a4;
  id v61 = a5;
  id v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing rear-vent occlusion/frequency analysis", buf, 2u);
  }

  id v9 = objc_alloc_init((Class)NSMutableArray);
  double v10 = [(AirPodsAudioSystemController *)self airpodsInputs];
  intptr_t v11 = [v10 frequencyBins];
  objc_super v12 = malloc_type_calloc((size_t)[v11 count], 4uLL, 0x100004052888210uLL);

  id v13 = [(AirPodsAudioSystemController *)self airpodsInputs];
  id v14 = [v13 frequencyBins];
  id v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      id v17 = [(AirPodsAudioSystemController *)self airpodsInputs];
      double v18 = [v17 frequencyBins];
      id v19 = [v18 objectAtIndexedSubscript:v16];
      [v19 floatValue];
      v12[v16] = v20;

      ++v16;
      id v21 = [(AirPodsAudioSystemController *)self airpodsInputs];
      double v22 = [v21 frequencyBins];
      id v23 = [v22 count];
    }
    while ((unint64_t)v23 > v16);
  }
  int v24 = [(AirPodsAudioSystemController *)self airpodsInputs];
  v25 = [v24 frequencyBins];
  uint64_t v26 = malloc_type_calloc((unint64_t)[v25 count] >> 1, 4uLL, 0x100004052888210uLL);

  *(void *)buf = v26;
  id v27 = [(AirPodsAudioSystemController *)self airpodsInputs];
  uint64_t v28 = [v27 stimulusFrontCroppingLength];
  id v29 = [v28 unsignedIntValue];
  double v30 = [(AirPodsAudioSystemController *)self airpodsInputs];
  id v31 = [v30 stimulusCroppingLength];
  v32 = -[AirPodsAudioSystemController cropAudioData:lengthFromFront:lengthFromEnd:](self, "cropAudioData:lengthFromFront:lengthFromEnd:", v62, v29, [v31 unsignedIntValue]);

  id v33 = v32;
  v59 = (const float *)[v33 bytes];
  v60 = v33;
  v57 = (OpaqueFFTSetup *)([v33 length] >> 2);
  v34 = [v63 data];
  v35 = [(AirPodsAudioSystemController *)self airpodsInputs];
  int v36 = [v35 dataFrontCroppingLength];
  id v37 = [v36 unsignedIntValue];
  v38 = [(AirPodsAudioSystemController *)self airpodsInputs];
  v39 = [v38 dataCroppingLength];
  v40 = -[AirPodsAudioSystemController cropAudioData:lengthFromFront:lengthFromEnd:](self, "cropAudioData:lengthFromFront:lengthFromEnd:", v34, v37, [v39 unsignedIntValue]);

  id v41 = v40;
  v42 = (float *)[v41 bytes];
  v58 = v41;
  LODWORD(v41) = [v41 length] >> 2;
  AAT_initWithLength(v57);
  v43 = [(AirPodsAudioSystemController *)self airpodsInputs];
  v44 = [v43 frequencyBins];
  LODWORD(v39) = [v44 count];
  [v63 sampleRate];
  AAT_processFrequencyResponseGxx(v59, v57, v42, v41, (uint64_t)v12, v39, v45, buf);

  v46 = [(AirPodsAudioSystemController *)self airpodsInputs];
  v47 = [v46 frequencyBins];
  id v48 = [v47 count];

  if ((unint64_t)v48 >= 2)
  {
    unint64_t v50 = 0;
    do
    {
      LODWORD(v49) = *(_DWORD *)(*(void *)buf + 4 * v50);
      v51 = +[NSNumber numberWithFloat:v49];
      [v9 addObject:v51];

      ++v50;
      v52 = [(AirPodsAudioSystemController *)self airpodsInputs];
      v53 = [v52 frequencyBins];
      unint64_t v54 = (unint64_t)[v53 count];
    }
    while (v50 < v54 >> 1);
  }
  [v61 setEnergyValues:v9];
  free(v12);
  free(*(void **)buf);
  if (![v9 count])
  {
    NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
    CFStringRef v66 = @"Failed to generate Bin Energy Values.";
    v55 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v56 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-65 userInfo:v55];

    [(AudioSystemCommon *)self failedToExecuteWithError:v56];
  }
}

- (id)cropAudioData:(id)a3 lengthFromFront:(unsigned int)a4 lengthFromEnd:(unsigned int)a5
{
  unsigned int v6 = a5 + a4;
  id v7 = a3;
  id v8 = [v7 subdataWithRange:4 * a4, [v7 length] - 4 * v6];

  return v8;
}

- (void)initFilter
{
  id v23 = [(AirPodsAudioSystemController *)self airpodsInputs];
  objc_super v3 = [v23 crackleFilterCoeffs];
  uint64_t v22 = (uint64_t)&v22;
  id v4 = (const double *)((char *)&v22 - ((8 * (void)[v3 count] + 15) & 0xFFFFFFFFFFFFFFF0));
  unsigned int v5 = [(AirPodsAudioSystemController *)self airpodsInputs];
  unsigned int v6 = [v5 crackleFilterCoeffs];
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v9 = 0;
    *(void *)&long long v8 = 67109376;
    long long v24 = v8;
    do
    {
      double v10 = [(AirPodsAudioSystemController *)self airpodsInputs];
      intptr_t v11 = [v10 crackleFilterCoeffs];
      objc_super v12 = [v11 objectAtIndexedSubscript:v9];
      [v12 doubleValue];
      double v14 = v13;
      v4[v9] = v13;

      id v15 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v24;
        int v26 = v9;
        __int16 v27 = 2048;
        double v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Crackle Filter used i=%d with value=%f", buf, 0x12u);
      }

      ++v9;
      unint64_t v16 = [(AirPodsAudioSystemController *)self airpodsInputs];
      id v17 = [v16 crackleFilterCoeffs];
      id v18 = [v17 count];
    }
    while ((unint64_t)v18 > v9);
  }
  id v19 = [(AirPodsAudioSystemController *)self airpodsInputs];
  int v20 = [v19 crackleNumberOfStages];
  signed int v21 = [v20 intValue];

  [(AirPodsAudioSystemController *)self setFilterSetup:vDSP_biquad_CreateSetup(v4, v21)];
  [(AirPodsAudioSystemController *)self setFilterDelay:malloc_type_calloc(3 * v21, 4uLL, 0x100004052888210uLL)];
}

- (void)freeFilter
{
  if ([(AirPodsAudioSystemController *)self filterDelay]) {
    free([(AirPodsAudioSystemController *)self filterDelay]);
  }
  objc_super v3 = [(AirPodsAudioSystemController *)self filterSetup];

  vDSP_biquad_DestroySetup(v3);
}

- (void)overrideOriginalHeadphoneExposureNotification
{
  objc_super v3 = [(AirPodsAudioSystemController *)self audioDataAnalysisSettingsManager];
  uint64_t v4 = ADAFPreferenceKeyHAENotificationFeatureEnabled;
  unsigned int v5 = [v3 getPreferenceFor:ADAFPreferenceKeyHAENotificationFeatureEnabled];
  -[AirPodsAudioSystemController setHeadphoneExposureNotificationsEnabled:](self, "setHeadphoneExposureNotificationsEnabled:", [v5 BOOLValue]);

  if ([(AirPodsAudioSystemController *)self headphoneExposureNotificationsEnabled])
  {
    unsigned int v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Headphone exposure notifications are enabled. Disabling...", v10, 2u);
    }

    [(AirPodsAudioSystemController *)self setHeadphoneExposureNotificationsChanged:1];
    id v7 = [(AirPodsAudioSystemController *)self audioDataAnalysisSettingsManager];
    long long v8 = [v7 setPreferenceFor:v4 value:&__kCFBooleanFalse];

    if (v8)
    {
      unint64_t v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100010200((uint64_t)v8, v9);
      }
    }
  }
}

- (void)restoreOriginalHeadphoneExposureNotification
{
  if ([(AirPodsAudioSystemController *)self headphoneExposureNotificationsChanged])
  {
    objc_super v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restoring original headphone exposure notification state", v9, 2u);
    }

    uint64_t v4 = [(AirPodsAudioSystemController *)self audioDataAnalysisSettingsManager];
    uint64_t v5 = ADAFPreferenceKeyHAENotificationFeatureEnabled;
    unsigned int v6 = +[NSNumber numberWithBool:[(AirPodsAudioSystemController *)self headphoneExposureNotificationsEnabled]];
    id v7 = [v4 setPreferenceFor:v5 value:v6];

    if (v7)
    {
      long long v8 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100010278((uint64_t)v7, v8);
      }
    }
  }
}

- (AirPodsAudioSystemInputs)airpodsInputs
{
  return self->_airpodsInputs;
}

- (void)setAirpodsInputs:(id)a3
{
}

- (DAChamberDetector)chamberDetector
{
  return self->_chamberDetector;
}

- (void)setChamberDetector:(id)a3
{
}

- (vDSP_biquad_SetupStruct)filterSetup
{
  return self->_filterSetup;
}

- (void)setFilterSetup:(vDSP_biquad_SetupStruct *)a3
{
  self->_filterSetup = a3;
}

- (float)filterDelay
{
  return self->_filterDelay;
}

- (void)setFilterDelay:(float *)a3
{
  self->_filterDelay = a3;
}

- (ADASManager)audioDataAnalysisSettingsManager
{
  return self->_audioDataAnalysisSettingsManager;
}

- (void)setAudioDataAnalysisSettingsManager:(id)a3
{
}

- (BOOL)headphoneExposureNotificationsEnabled
{
  return self->_headphoneExposureNotificationsEnabled;
}

- (void)setHeadphoneExposureNotificationsEnabled:(BOOL)a3
{
  self->_headphoneExposureNotificationsEnabled = a3;
}

- (BOOL)headphoneExposureNotificationsChanged
{
  return self->_headphoneExposureNotificationsChanged;
}

- (void)setHeadphoneExposureNotificationsChanged:(BOOL)a3
{
  self->_headphoneExposureNotificationsChanged = a3;
}

- (OS_dispatch_semaphore)chamberReadinessSemaphore
{
  return self->_chamberReadinessSemaphore;
}

- (void)setChamberReadinessSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)testCompletionSemaphore
{
  return self->_testCompletionSemaphore;
}

- (void)setTestCompletionSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)testEndedSemaphore
{
  return self->_testEndedSemaphore;
}

- (void)setTestEndedSemaphore:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_testEndedSemaphore, 0);
  objc_storeStrong((id *)&self->_testCompletionSemaphore, 0);
  objc_storeStrong((id *)&self->_chamberReadinessSemaphore, 0);
  objc_storeStrong((id *)&self->_audioDataAnalysisSettingsManager, 0);
  objc_storeStrong((id *)&self->_chamberDetector, 0);

  objc_storeStrong((id *)&self->_airpodsInputs, 0);
}

@end