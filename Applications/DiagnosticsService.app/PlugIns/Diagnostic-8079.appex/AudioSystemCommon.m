@interface AudioSystemCommon
+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4;
- (AVAudioDeviceTest)audioTest;
- (AudioSystemInputsCommon)inputs;
- (BOOL)balanceChanged;
- (BOOL)isBalanceChangeRequired;
- (BOOL)isDeviceConnectedToAccessory;
- (BOOL)isDeviceWatch;
- (BOOL)isDeviceiPad;
- (BOOL)isDeviceiPhone;
- (BOOL)isDeviceiPod;
- (BOOL)isMonoChangeRequired;
- (BOOL)isOriginallyMono;
- (BOOL)isSoundRecognitionRequired;
- (BOOL)monoChanged;
- (BOOL)previousAudioChanged;
- (BOOL)soundRecognitionChanged;
- (BOOL)testFailed;
- (Class)audioSystemResultClass;
- (Class)avAudioDeviceTestClass;
- (Class)avAudioDeviceTestSequenceClass;
- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector;
- (DAHeadphonesDetector)headphoneDetector;
- (DAMotionDetector)motionDetector;
- (DAOrientationDetector)orientationDetector;
- (DKResponder)diagnosticResponder;
- (NSMutableArray)audioSystemResults;
- (NSMutableArray)rawRecordings;
- (NSMutableDictionary)fileNameToURL;
- (NSNumber)originalBalance;
- (NSString)deviceName;
- (NSURL)tmpdir;
- (double)startTime;
- (float)previousDeviceVolumeAudioVideo;
- (float)previousDeviceVolumePlayAndRecord;
- (id)archiveNameTemplate;
- (id)createNewTestSequenceWithOutput:(id)a3 andStimulusFile:(id)a4;
- (id)pathToSoundFile:(id)a3;
- (id)testID;
- (id)writeCurrentResultsToJson;
- (int64_t)failedToExecuteOnceToken;
- (int64_t)systemSoundDetectionState;
- (void)cancel;
- (void)deleteTemporaryFiles;
- (void)downloadFilesWithResponder:(id)a3;
- (void)failedToExecuteWithError:(id)a3;
- (void)parseTestResults:(id)a3 fromOutput:(id)a4 withFile:(id)a5 parsedResults:(id)a6 sequenceIndex:(id)a7 error:(id)a8;
- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7;
- (void)receivedInterruptNotification:(id)a3;
- (void)restoreAccesibilityStateIfRequired;
- (void)restoreOriginalVolumes;
- (void)saveOriginalVolumes;
- (void)setAccessibilityStateIfRequired;
- (void)setAccessoryDisconnectDetector:(id)a3;
- (void)setAudioSystemResults:(id)a3;
- (void)setAudioTest:(id)a3;
- (void)setBalanceChanged:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setDiagnosticResponder:(id)a3;
- (void)setFailedToExecuteOnceToken:(int64_t)a3;
- (void)setFileNameToURL:(id)a3;
- (void)setHeadphoneDetector:(id)a3;
- (void)setInputs:(id)a3;
- (void)setIsDeviceWatch:(BOOL)a3;
- (void)setIsDeviceiPad:(BOOL)a3;
- (void)setIsDeviceiPhone:(BOOL)a3;
- (void)setIsDeviceiPod:(BOOL)a3;
- (void)setIsOriginallyMono:(BOOL)a3;
- (void)setMonoChanged:(BOOL)a3;
- (void)setMotionDetector:(id)a3;
- (void)setOrientationDetector:(id)a3;
- (void)setOriginalBalance:(id)a3;
- (void)setPreviousAudioChanged:(BOOL)a3;
- (void)setPreviousDeviceVolumeAudioVideo:(float)a3;
- (void)setPreviousDeviceVolumePlayAndRecord:(float)a3;
- (void)setRawRecordings:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setSystemSoundDetectionState:(int64_t)a3;
- (void)setTestFailed:(BOOL)a3;
- (void)setTmpdir:(id)a3;
- (void)setUpEventNotifications;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
- (void)testFinishedSuccessfully;
- (void)testSequence:(id)a3 completionSemaphore:(id)a4;
@end

@implementation AudioSystemCommon

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  -[AudioSystemCommon setStartTime:](self, "setStartTime:");

  [(AudioSystemCommon *)self setInputs:v7];
  [(AudioSystemCommon *)self setPreviousAudioChanged:0];
  [(AudioSystemCommon *)self setDiagnosticResponder:v6];
  v9 = +[AVAudioSession sharedInstance];
  if ([v9 isOtherAudioPlaying])
  {
    unsigned __int8 v10 = [(AudioSystemCommon *)self isSoundRecognitionRequired];

    if ((v10 & 1) == 0)
    {
      v11 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Background audio is playing at the start of this test", buf, 2u);
      }

      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Audio is already playing in the background at the start of the test.";
      v12 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v13 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-56 userInfo:v12];

      goto LABEL_13;
    }
  }
  else
  {
  }
  v14 = (void *)MGCopyAnswer();
  [(AudioSystemCommon *)self setDeviceName:v14];

  v15 = [(AudioSystemCommon *)self deviceName];
  -[AudioSystemCommon setIsDeviceiPhone:](self, "setIsDeviceiPhone:", [v15 isEqualToString:@"iPhone"]);

  v16 = [(AudioSystemCommon *)self deviceName];
  -[AudioSystemCommon setIsDeviceiPod:](self, "setIsDeviceiPod:", [v16 isEqualToString:@"iPod touch"]);

  v17 = [(AudioSystemCommon *)self deviceName];
  -[AudioSystemCommon setIsDeviceiPad:](self, "setIsDeviceiPad:", [v17 isEqualToString:@"iPad"]);

  v18 = [(AudioSystemCommon *)self deviceName];
  -[AudioSystemCommon setIsDeviceWatch:](self, "setIsDeviceWatch:", [v18 isEqualToString:@"Apple Watch"]);

  if (![(AudioSystemCommon *)self isDeviceiPhone]
    && ![(AudioSystemCommon *)self isDeviceiPod]
    && ![(AudioSystemCommon *)self isDeviceiPad])
  {
LABEL_16:
    v21 = NSTemporaryDirectory();
    v22 = +[NSURL fileURLWithPath:v21 isDirectory:1];
    [(AudioSystemCommon *)self setTmpdir:v22];

    [(AudioSystemCommon *)self downloadFilesWithResponder:v6];
    goto LABEL_17;
  }
  v19 = [(AudioSystemCommon *)self inputs];
  if (![v19 isAccessoryDetectorActive])
  {

    goto LABEL_15;
  }
  unsigned __int8 v20 = [(AudioSystemCommon *)self isDeviceConnectedToAccessory];

  if (v20)
  {
LABEL_15:
    [(AudioSystemCommon *)self setAccessibilityStateIfRequired];
    [v6 enableVolumeHUD:0];
    goto LABEL_16;
  }
  id v23 = 0;
  +[AudioSystemCommon setCode:-52 forError:&v23];
  id v13 = v23;
LABEL_13:
  [(AudioSystemCommon *)self failedToExecuteWithError:v13];
  [(AudioSystemCommon *)self setFinished:1];

LABEL_17:
}

- (void)start
{
  id v3 = objc_alloc_init([(AudioSystemCommon *)self avAudioDeviceTestClass]);
  [(AudioSystemCommon *)self setAudioTest:v3];

  v4 = [(AudioSystemCommon *)self audioTest];
  [v4 setProcessSequenceAsynchronously:1];

  v5 = [(AudioSystemCommon *)self inputs];
  unsigned int v6 = [v5 saveRawRecording];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    [(AudioSystemCommon *)self setRawRecordings:v7];
  }
  if ([(AudioSystemCommon *)self isDeviceiPhone]
    || [(AudioSystemCommon *)self isDeviceiPod]
    || [(AudioSystemCommon *)self isDeviceiPad]
    || [(AudioSystemCommon *)self isDeviceWatch])
  {
    [(AudioSystemCommon *)self setUpEventNotifications];
  }
  [(AudioSystemCommon *)self saveOriginalVolumes];
  v8 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-8079.audioQueue", 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004F64;
  v9[3] = &unk_1000104C8;
  v9[4] = self;
  char v10 = v6;
  dispatch_async(v8, v9);
}

- (void)teardown
{
  [(AudioSystemCommon *)self restoreAccesibilityStateIfRequired];
  [(AudioSystemCommon *)self restoreOriginalVolumes];
  id v3 = [(AudioSystemCommon *)self inputs];
  unsigned int v4 = [v3 isMotionDetectorActive];

  if (v4)
  {
    v5 = [(AudioSystemCommon *)self motionDetector];
    [v5 stop];
  }
  unsigned int v6 = [(AudioSystemCommon *)self inputs];
  unsigned int v7 = [v6 isAccessoryDetectorActive];

  if (v7)
  {
    v8 = [(AudioSystemCommon *)self accessoryDisconnectDetector];
    [v8 stop];
  }
  v9 = [(AudioSystemCommon *)self inputs];
  unsigned int v10 = [v9 isHeadphonesDetectorActive];

  if (v10)
  {
    v11 = [(AudioSystemCommon *)self headphoneDetector];
    [v11 stop];
  }
  v12 = [(AudioSystemCommon *)self inputs];
  unsigned int v13 = [v12 isOrientationDetectorActive];

  if (v13)
  {
    v14 = [(AudioSystemCommon *)self orientationDetector];
    [v14 stop];
  }
  v15 = +[NSNotificationCenter defaultCenter];
  [v15 removeObserver:self];

  v16 = [(AudioSystemCommon *)self diagnosticResponder];
  [v16 enableVolumeHUD:1];

  id v17 = [(AudioSystemCommon *)self audioTest];
  [v17 cancel];
}

- (void)cancel
{
  id v2 = [(AudioSystemCommon *)self audioTest];
  [v2 cancel];
}

- (void)failedToExecuteWithError:(id)a3
{
  id v4 = a3;
  v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "failedToExecuteWithError called for error %@", buf, 0xCu);
  }

  p_int64_t failedToExecuteOnceToken = &self->_failedToExecuteOnceToken;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005D04;
  v9[3] = &unk_1000104F0;
  v9[4] = self;
  id v10 = v4;
  int64_t failedToExecuteOnceToken = self->_failedToExecuteOnceToken;
  id v8 = v4;
  if (failedToExecuteOnceToken != -1) {
    dispatch_once(p_failedToExecuteOnceToken, v9);
  }
}

- (void)setUpEventNotifications
{
  id v3 = [(AudioSystemCommon *)self inputs];
  unsigned int v4 = [v3 isMotionDetectorActive];

  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"receivedInterruptNotification:" name:@"MotionDetectedNotification" object:0];

    unsigned int v6 = [DAMotionDetector alloc];
    unsigned int v7 = [(AudioSystemCommon *)self inputs];
    id v8 = [v7 motionDetectorThreshold];
    v9 = [(DAMotionDetector *)v6 initWithThreshold:v8];
    [(AudioSystemCommon *)self setMotionDetector:v9];

    id v10 = [(AudioSystemCommon *)self motionDetector];
    [v10 start];
  }
  v11 = [(AudioSystemCommon *)self inputs];
  unsigned int v12 = [v11 isOrientationDetectorActive];

  if (v12)
  {
    unsigned int v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"receivedInterruptNotification:" name:@"IncorrectOrientationNotification" object:0];

    v14 = [DAOrientationDetector alloc];
    v15 = [(AudioSystemCommon *)self inputs];
    v16 = [v15 orientationDetectorXThreshold];
    id v17 = [(AudioSystemCommon *)self inputs];
    v18 = [v17 orientationDetectorZThreshold];
    v19 = [(DAOrientationDetector *)v14 initWithxThreshold:v16 zThreshold:v18];
    [(AudioSystemCommon *)self setOrientationDetector:v19];

    unsigned __int8 v20 = [(AudioSystemCommon *)self orientationDetector];
    [v20 start];
  }
  v21 = [(AudioSystemCommon *)self inputs];
  unsigned int v22 = [v21 isAccessoryDetectorActive];

  if (v22)
  {
    id v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:self selector:"receivedInterruptNotification:" name:@"AccessoryDisconnectedNotification" object:0];

    v24 = [DAAccessoryDisconnectDetector alloc];
    NSErrorUserInfoKey v25 = [(AudioSystemCommon *)self inputs];
    CFStringRef v26 = [v25 accessoryDetectorModelNumbers];
    v27 = [(DAAccessoryDisconnectDetector *)v24 initWithModelNumbers:v26];
    [(AudioSystemCommon *)self setAccessoryDisconnectDetector:v27];

    v28 = [(AudioSystemCommon *)self accessoryDisconnectDetector];
    [v28 start];
  }
  v29 = [(AudioSystemCommon *)self inputs];
  unsigned int v30 = [v29 isHeadphonesDetectorActive];

  if (v30)
  {
    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:self selector:"receivedInterruptNotification:" name:@"HeadphonesConnectedNotification" object:0];

    v32 = objc_alloc_init(DAHeadphonesDetector);
    [(AudioSystemCommon *)self setHeadphoneDetector:v32];

    id v33 = [(AudioSystemCommon *)self headphoneDetector];
    [v33 start];
  }
}

- (void)receivedInterruptNotification:(id)a3
{
  id v4 = a3;
  v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Recieved interrupt notification %@", buf, 0xCu);
  }

  unsigned int v6 = [v4 name];
  unsigned int v7 = [v6 isEqualToString:@"MotionDetectedNotification"];

  if (v7)
  {
    uint64_t v21 = 0;
    id v8 = (id *)&v21;
    v9 = &v21;
    uint64_t v10 = -53;
  }
  else
  {
    v11 = [v4 name];
    unsigned int v12 = [v11 isEqualToString:@"IncorrectOrientationNotification"];

    if (v12)
    {
      uint64_t v20 = 0;
      id v8 = (id *)&v20;
      v9 = &v20;
      uint64_t v10 = -61;
    }
    else
    {
      unsigned int v13 = [v4 name];
      unsigned int v14 = [v13 isEqualToString:@"AccessoryDisconnectedNotification"];

      if (v14)
      {
        uint64_t v19 = 0;
        id v8 = (id *)&v19;
        v9 = &v19;
        uint64_t v10 = -52;
      }
      else
      {
        v15 = [v4 name];
        unsigned int v16 = [v15 isEqualToString:@"HeadphonesConnectedNotification"];

        if (!v16)
        {
          id v17 = 0;
          goto LABEL_12;
        }
        uint64_t v18 = 0;
        id v8 = (id *)&v18;
        v9 = &v18;
        uint64_t v10 = -54;
      }
    }
  }
  +[AudioSystemCommon setCode:forError:](AudioSystemCommon, "setCode:forError:", v10, v9, v18, v19, v20, v21);
  id v17 = *v8;
LABEL_12:
  [(AudioSystemCommon *)self failedToExecuteWithError:v17];
}

- (BOOL)isDeviceConnectedToAccessory
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = +[EAAccessoryManager sharedAccessoryManager];
  id v4 = [v3 connectedAccessories];

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [(AudioSystemCommon *)self inputs];
        unsigned int v12 = [v11 accessoryDetectorModelNumbers];
        unsigned int v13 = [v10 modelNumber];
        unsigned __int8 v14 = [v12 containsObject:v13];

        v7 |= v14;
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4
{
  if (a4)
  {
    *a4 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:a3 userInfo:0];
  }
  return a4 != 0;
}

- (void)downloadFilesWithResponder:(id)a3
{
  id v30 = a3;
  [(AudioSystemCommon *)self deleteTemporaryFiles];
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  id v4 = +[NSMutableDictionary dictionary];
  [(AudioSystemCommon *)self setFileNameToURL:v4];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  id v5 = [(AudioSystemCommon *)self inputs];
  id obj = [v5 sources];

  id v6 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v6)
  {
    uint64_t v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v45;
    *(void *)&long long v7 = 138412546;
    long long v28 = v7;
    while (2)
    {
      v11 = 0;
      unsigned int v12 = v8;
      do
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(obj);
        }
        unsigned int v13 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v11);
        if ([(AudioSystemCommon *)self isCancelled])
        {
          uint64_t v8 = v12;
          goto LABEL_24;
        }
        unsigned __int8 v14 = [(AudioSystemCommon *)self tmpdir];
        uint64_t v8 = [v14 URLByAppendingPathComponent:v13];

        uint64_t v38 = 0;
        v39 = &v38;
        uint64_t v40 = 0x3032000000;
        v41 = sub_100006A74;
        v42 = sub_100006A84;
        id v43 = 0;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100006A8C;
        v35[3] = &unk_100010518;
        v37 = &v38;
        v15 = v31;
        v36 = v15;
        [v30 getAsset:v13 completion:v35];
        long long v16 = [(AudioSystemCommon *)self inputs];
        long long v17 = [v16 fileDownloadTimeout];
        dispatch_time_t v18 = dispatch_time(0, 1000000000 * (void)[v17 unsignedLongValue]);
        dispatch_semaphore_wait(v15, v18);

        if (v39[5])
        {
          long long v19 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v8;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Saving asset data to [%@]", buf, 0xCu);
          }

          uint64_t v20 = (void *)v39[5];
          id v34 = v9;
          unsigned int v21 = [v20 writeToURL:v8 options:268435457 error:&v34];
          id v22 = v34;

          if (v21)
          {
            id v23 = [(AudioSystemCommon *)self fileNameToURL];
            [v23 setObject:v8 forKeyedSubscript:v13];

            int v24 = 1;
            id v9 = v22;
          }
          else
          {
            v27 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              v49 = v8;
              __int16 v50 = 2112;
              id v51 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
            }

            id v33 = v22;
            +[AudioSystemCommon setCode:-59 forError:&v33];
            id v9 = v33;

            [(AudioSystemCommon *)self failedToExecuteWithError:v9];
            [(AudioSystemCommon *)self setFinished:1];
            int v24 = 0;
          }
        }
        else
        {
          NSErrorUserInfoKey v25 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
          }

          id v32 = v9;
          +[AudioSystemCommon setCode:-1 forError:&v32];
          id v26 = v32;

          [(AudioSystemCommon *)self failedToExecuteWithError:v26];
          [(AudioSystemCommon *)self setFinished:1];
          int v24 = 0;
          id v9 = v26;
        }

        _Block_object_dispose(&v38, 8);
        if (!v24) {
          goto LABEL_24;
        }
        v11 = (char *)v11 + 1;
        unsigned int v12 = v8;
      }
      while (v6 != v11);
      id v6 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v6) {
        continue;
      }
      break;
    }
LABEL_24:
  }
  else
  {
    id v9 = 0;
  }
}

- (void)deleteTemporaryFiles
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(AudioSystemCommon *)self tmpdir];
  id v25 = 0;
  long long v19 = v3;
  id v5 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v25];
  id v6 = v25;

  if (v6)
  {
    long long v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100009098(v6);
    }
  }
  dispatch_time_t v18 = v6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unsigned __int8 v14 = [v13 path];
        if (v14)
        {
          v15 = +[NSFileManager defaultManager];
          id v20 = 0;
          [v15 removeItemAtPath:v14 error:&v20];
          long long v16 = v20;

          if (v16)
          {
            long long v17 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100009020(v26, v16, &v27, v17);
            }
          }
        }
        else
        {
          long long v16 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Temporary file %@ does not have a path we can use to clear it. Skipping.", buf, 0xCu);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v10);
  }
}

- (void)testSequence:(id)a3 completionSemaphore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 outputs];
  id v9 = [v8 firstObject];

  id v10 = [(AudioSystemCommon *)self inputs];
  uint64_t v11 = [v10 sources];
  unsigned int v12 = [v9 source];
  unsigned int v13 = [v11 objectAtIndexedSubscript:[v12 integerValue]];

  unsigned __int8 v14 = [(AudioSystemCommon *)self createNewTestSequenceWithOutput:v9 andStimulusFile:v13];
  v15 = [(AudioSystemCommon *)self audioTest];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006F40;
  v21[3] = &unk_100010540;
  v21[4] = self;
  id v22 = v14;
  id v23 = v7;
  id v24 = v9;
  id v25 = v13;
  id v26 = v6;
  id v16 = v6;
  id v17 = v13;
  id v18 = v9;
  id v19 = v7;
  id v20 = v14;
  [v15 startWithSequence:v20 completion:v21];
}

- (id)pathToSoundFile:(id)a3
{
  id v4 = a3;
  id v5 = [(AudioSystemCommon *)self fileNameToURL];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)writeCurrentResultsToJson
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v34 = @"sd";
  CFStringRef v32 = @"$date";
  id v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  id v6 = +[NSNumber numberWithDouble:v5 * 1000.0];
  id v33 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v35 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  [v3 setObject:v8 forKeyedSubscript:@"_id"];

  [v3 setObject:&off_100011088 forKeyedSubscript:@"d"];
  id v9 = [(AudioSystemCommon *)self testID];
  [v3 setObject:v9 forKeyedSubscript:@"k"];

  [v3 setObject:&off_100010FE8 forKeyedSubscript:@"e"];
  id v10 = +[NSDate date];
  [v10 timeIntervalSince1970];
  double v12 = v11;
  [(AudioSystemCommon *)self startTime];
  unsigned __int8 v14 = +[NSNumber numberWithDouble:v12 - v13];
  [v3 setObject:v14 forKeyedSubscript:@"t"];

  v15 = [(AudioSystemCommon *)self result];
  id v16 = [v15 statusCode];
  [v3 setObject:v16 forKeyedSubscript:@"s"];

  id v17 = [(AudioSystemCommon *)self result];
  id v18 = [v17 data];
  [v3 setObject:v18 forKeyedSubscript:@"data"];

  id v29 = 0;
  id v19 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:&v29];
  id v20 = v29;
  if (v20 || !v19)
  {
    long long v21 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to convert result dictionary to JSON with error: [%@]", buf, 0xCu);
    }
    id v25 = 0;
  }
  else
  {
    long long v21 = [objc_alloc((Class)NSString) initWithData:v19 encoding:4];
    id v22 = [(AudioSystemCommon *)self tmpdir];
    id v23 = [v22 URLByAppendingPathComponent:@"results.json"];

    id v28 = 0;
    unsigned __int8 v24 = [v21 writeToURL:v23 atomically:1 encoding:4 error:&v28];
    id v20 = v28;
    if (v20 || (v24 & 1) == 0)
    {
      id v26 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to write result to file with error: [%@]", buf, 0xCu);
      }

      id v25 = 0;
    }
    else
    {
      id v25 = v23;
    }
  }

  return v25;
}

- (void)parseTestResults:(id)a3 fromOutput:(id)a4 withFile:(id)a5 parsedResults:(id)a6 sequenceIndex:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v56 = a6;
  id v52 = a7;
  id v17 = a8;
  v57 = v16;
  id v18 = [(AudioSystemCommon *)self pathToSoundFile:v16];
  v58 = [v18 absoluteString];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v14;
  id v54 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (!v54) {
    goto LABEL_33;
  }
  uint64_t v55 = *(void *)v62;
  id v19 = &DKTemporaryDirectoryURL_ptr;
  v59 = self;
  id v51 = v15;
  while (2)
  {
    for (i = 0; i != v54; i = (char *)i + 1)
    {
      if (*(void *)v62 != v55) {
        objc_enumerationMutation(obj);
      }
      long long v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      id v22 = v19[100];
      [v21 sampleRate];
      id v23 = [v22 numberWithDouble:];
      id v60 = v17;
      unsigned __int8 v24 = +[AudioCrossCorrelation convertWAVtoNSDataWithFileStringURL:v58 withSampleRate:v23 error:&v60];
      id v25 = v60;

      if (!v24)
      {
        if (v25)
        {
          if ([v25 code] == (id)-70)
          {
            long long v47 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_10000925C((uint64_t)v57, v15, v47);
            }
          }
        }
        else
        {
          id v25 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-66 userInfo:0];
        }
        [(AudioSystemCommon *)self failedToExecuteWithError:v25];
        goto LABEL_32;
      }
      id v26 = [(AudioSystemCommon *)self inputs];
      uint64_t v27 = [v26 inputValueToName];
      id v28 = [v19[100] numberWithInteger:[v21 inputID]];
      id v29 = [v27 objectForKey:v28];

      if (!v29)
      {
        v48 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_100009310(v21);
        }

        NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
        CFStringRef v72 = @"Name missing for current microphone.";
        v49 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        __int16 v50 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-68 userInfo:v49];

        [(AudioSystemCommon *)self failedToExecuteWithError:v50];
LABEL_32:
        id v17 = v25;
        goto LABEL_33;
      }
      id v30 = objc_alloc_init([(AudioSystemCommon *)self audioSystemResultClass]);
      [v30 setInput:v29];
      id v31 = [v15 outputDevice];
      [v30 setOutput:v31];

      [v30 setSource:v57];
      [(AudioSystemCommon *)self performAnalysisOnAVResult:v21 fromOutput:v15 withSourceSignalData:v24 intoDKResult:v30 error:v25];
      CFStringRef v32 = [v30 dictionaryValue];
      [v56 addObject:v32];

      id v33 = [(AudioSystemCommon *)self inputs];
      unsigned int v34 = [v33 saveRawRecording];

      if (v34)
      {
        v35 = [v30 output];
        v36 = [v30 source];
        v37 = [v29 stringByAppendingFormat:@"Mic-%@Speaker-File%@-Sequence%@.wav", v35, v36, v52];

        if (([v37 containsString:@".wav"] & 1) == 0)
        {
          uint64_t v38 = [v37 stringByAppendingString:@".wav"];

          v37 = (void *)v38;
        }
        v39 = [(AudioSystemCommon *)self tmpdir];
        uint64_t v40 = [v39 URLByAppendingPathComponent:v37];

        v41 = [v21 data];
        +[AudioCrossCorrelation convertNSDataToWAV:v41 atURL:v40 error:v25];

        v42 = self;
        BOOL v43 = v25 == 0;
        if (v25)
        {
          long long v44 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v68 = v40;
            __int16 v69 = 2112;
            id v70 = v25;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "ERROR save recording data [%@]: %@", buf, 0x16u);
          }

          NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
          CFStringRef v66 = @"Failed to save recording data.";
          long long v45 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          id v17 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-60 userInfo:v45];

          [(AudioSystemCommon *)v59 failedToExecuteWithError:v17];
        }
        else
        {
          long long v46 = [(AudioSystemCommon *)v42 rawRecordings];
          [v46 addObject:v40];

          id v17 = 0;
        }

        id v15 = v51;
      }
      else
      {
        BOOL v43 = 1;
        id v17 = v25;
      }

      id v19 = &DKTemporaryDirectoryURL_ptr;
      if (!v43) {
        goto LABEL_33;
      }
      self = v59;
    }
    id v54 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v54) {
      continue;
    }
    break;
  }
LABEL_33:
}

- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7
{
  id v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_100009388(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (id)createNewTestSequenceWithOutput:(id)a3 andStimulusFile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init([(AudioSystemCommon *)self avAudioDeviceTestSequenceClass]);
  uint64_t v9 = [(AudioSystemCommon *)self inputs];
  uint64_t v10 = [v9 outputSpecifications];
  uint64_t v11 = [v7 outputDevice];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];
  uint64_t v13 = [v12 channel];
  [v8 setOutputID:[v13 integerValue]];

  uint64_t v14 = [v7 volume];
  [v14 floatValue];
  [v8 setVolume:];

  id v15 = [(AudioSystemCommon *)self pathToSoundFile:v6];

  [v8 setStimulusURL:v15];
  id v16 = [(AudioSystemCommon *)self inputs];
  id v17 = [v16 outputSpecifications];
  id v18 = [v7 outputDevice];

  id v19 = [v17 objectForKeyedSubscript:v18];
  id v20 = [v19 mode];
  [v8 setOutputMode:[v20 integerValue]];

  long long v21 = [(AudioSystemCommon *)self inputs];
  [v8 setCalculateCrossCorrelationPeak:[v21 isUsingDBValuesFromSystem]];

  id v22 = [(AudioSystemCommon *)self inputs];
  unsigned int v23 = [v22 isUsingMeasurementMode];
  unsigned __int8 v24 = &AVAudioSessionModeMeasurement;
  if (!v23) {
    unsigned __int8 v24 = (const AVAudioSessionMode *)&AVAudioSessionModeRaw;
  }
  [v8 setMode:*v24];

  [v8 setParallelCrossCorrelationCalculation:[v8 calculateCrossCorrelationPeak]];

  return v8;
}

- (void)testFinishedSuccessfully
{
}

- (Class)audioSystemResultClass
{
  return (Class)objc_opt_class();
}

- (Class)avAudioDeviceTestClass
{
  return (Class)objc_opt_class();
}

- (Class)avAudioDeviceTestSequenceClass
{
  return (Class)objc_opt_class();
}

- (id)archiveNameTemplate
{
  id v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_1000093C0(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return @"com.apple.Diagnostics.AudioSystem.XXXXXXXX";
}

- (id)testID
{
  id v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_1000093F8(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return &off_100010FD0;
}

- (void)restoreAccesibilityStateIfRequired
{
  if ([(AudioSystemCommon *)self monoChanged])
  {
    [(AudioSystemCommon *)self isOriginallyMono];
    _AXSMonoAudioSetEnabled();
  }
  if ([(AudioSystemCommon *)self balanceChanged])
  {
    uint64_t v3 = [(AudioSystemCommon *)self originalBalance];
    [v3 floatValue];
    _AXSSetLeftRightAudioBalance();
  }
  if ([(AudioSystemCommon *)self soundRecognitionChanged])
  {
    id v4 = +[AXSDSettings sharedInstance];
    [v4 setSoundDetectionState:[self systemSoundDetectionState]];
  }
}

- (BOOL)isMonoChangeRequired
{
  return _AXSMonoAudioEnabled() != 0;
}

- (BOOL)isBalanceChangeRequired
{
  _AXSLeftRightAudioBalance();
  return v2 != 0.0;
}

- (BOOL)isSoundRecognitionRequired
{
  float v2 = +[AXSDSettings sharedInstance];
  unsigned __int8 v3 = [v2 soundDetectionEnabled];

  return v3;
}

- (BOOL)soundRecognitionChanged
{
  return [(AudioSystemCommon *)self systemSoundDetectionState] != 0;
}

- (void)setAccessibilityStateIfRequired
{
  [(AudioSystemCommon *)self setMonoChanged:0];
  [(AudioSystemCommon *)self setBalanceChanged:0];
  if ([(AudioSystemCommon *)self isMonoChangeRequired])
  {
    [(AudioSystemCommon *)self setIsOriginallyMono:1];
    _AXSMonoAudioSetEnabled();
    [(AudioSystemCommon *)self setMonoChanged:1];
  }
  if ([(AudioSystemCommon *)self isBalanceChangeRequired])
  {
    id v3 = objc_alloc((Class)NSNumber);
    _AXSLeftRightAudioBalance();
    id v4 = [v3 initWithFloat:];
    [(AudioSystemCommon *)self setOriginalBalance:v4];

    _AXSSetLeftRightAudioBalance();
    [(AudioSystemCommon *)self setBalanceChanged:1];
  }
  if ([(AudioSystemCommon *)self isSoundRecognitionRequired])
  {
    uint64_t v5 = +[AXSDSettings sharedInstance];
    -[AudioSystemCommon setSystemSoundDetectionState:](self, "setSystemSoundDetectionState:", [v5 soundDetectionState]);

    id v6 = +[AXSDSettings sharedInstance];
    [v6 setSoundDetectionState:0];
  }
}

- (void)saveOriginalVolumes
{
  uint64_t v11 = 0;
  id v3 = +[AVSystemController sharedAVSystemController];
  [v3 getVolume:(char *)&v11 + 4 forCategory:@"PlayAndRecord"];

  id v4 = +[AVSystemController sharedAVSystemController];
  [v4 getVolume:&v11 forCategory:@"Audio/Video"];

  LODWORD(v5) = HIDWORD(v11);
  [(AudioSystemCommon *)self setPreviousDeviceVolumePlayAndRecord:v5];
  LODWORD(v6) = v11;
  [(AudioSystemCommon *)self setPreviousDeviceVolumeAudioVideo:v6];
  [(AudioSystemCommon *)self setPreviousAudioChanged:1];
  uint64_t v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [(AudioSystemCommon *)self previousDeviceVolumePlayAndRecord];
    double v9 = v8;
    [(AudioSystemCommon *)self previousDeviceVolumeAudioVideo];
    *(_DWORD *)buf = 134218240;
    double v13 = v9;
    __int16 v14 = 2048;
    double v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Save original volumes previousDeviceVolumePlayAndRecord:%f, previousDeviceVolumeAudioVideo:%f", buf, 0x16u);
  }
}

- (void)restoreOriginalVolumes
{
  if ([(AudioSystemCommon *)self previousAudioChanged])
  {
    id v3 = +[AVSystemController sharedAVSystemController];
    [(AudioSystemCommon *)self previousDeviceVolumePlayAndRecord];
    [v3 setVolumeTo:@"PlayAndRecord" forCategory:];

    id v4 = +[AVSystemController sharedAVSystemController];
    [(AudioSystemCommon *)self previousDeviceVolumeAudioVideo];
    [v4 setVolumeTo:@"Audio/Video" forCategory:];

    double v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [(AudioSystemCommon *)self previousDeviceVolumePlayAndRecord];
      double v7 = v6;
      [(AudioSystemCommon *)self previousDeviceVolumeAudioVideo];
      int v9 = 134218240;
      double v10 = v7;
      __int16 v11 = 2048;
      double v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restore original volumes to previousDeviceVolumePlayAndRecord:%f, previousDeviceVolumeAudioVideo:%f", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (DKResponder)diagnosticResponder
{
  return self->_diagnosticResponder;
}

- (void)setDiagnosticResponder:(id)a3
{
}

- (AudioSystemInputsCommon)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSMutableDictionary)fileNameToURL
{
  return self->_fileNameToURL;
}

- (void)setFileNameToURL:(id)a3
{
}

- (BOOL)testFailed
{
  return self->_testFailed;
}

- (void)setTestFailed:(BOOL)a3
{
  self->_testFailed = a3;
}

- (NSURL)tmpdir
{
  return self->_tmpdir;
}

- (void)setTmpdir:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSMutableArray)audioSystemResults
{
  return self->_audioSystemResults;
}

- (void)setAudioSystemResults:(id)a3
{
}

- (NSMutableArray)rawRecordings
{
  return self->_rawRecordings;
}

- (void)setRawRecordings:(id)a3
{
}

- (AVAudioDeviceTest)audioTest
{
  return self->_audioTest;
}

- (void)setAudioTest:(id)a3
{
}

- (int64_t)failedToExecuteOnceToken
{
  return self->_failedToExecuteOnceToken;
}

- (void)setFailedToExecuteOnceToken:(int64_t)a3
{
  self->_int64_t failedToExecuteOnceToken = a3;
}

- (BOOL)isOriginallyMono
{
  return self->_isOriginallyMono;
}

- (void)setIsOriginallyMono:(BOOL)a3
{
  self->_isOriginallyMono = a3;
}

- (NSNumber)originalBalance
{
  return self->_originalBalance;
}

- (void)setOriginalBalance:(id)a3
{
}

- (BOOL)monoChanged
{
  return self->_monoChanged;
}

- (void)setMonoChanged:(BOOL)a3
{
  self->_monoChanged = a3;
}

- (BOOL)balanceChanged
{
  return self->_balanceChanged;
}

- (void)setBalanceChanged:(BOOL)a3
{
  self->_balanceChanged = a3;
}

- (int64_t)systemSoundDetectionState
{
  return self->_systemSoundDetectionState;
}

- (void)setSystemSoundDetectionState:(int64_t)a3
{
  self->_systemSoundDetectionState = a3;
}

- (DAMotionDetector)motionDetector
{
  return self->_motionDetector;
}

- (void)setMotionDetector:(id)a3
{
}

- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector
{
  return self->_accessoryDisconnectDetector;
}

- (void)setAccessoryDisconnectDetector:(id)a3
{
}

- (DAHeadphonesDetector)headphoneDetector
{
  return self->_headphoneDetector;
}

- (void)setHeadphoneDetector:(id)a3
{
}

- (DAOrientationDetector)orientationDetector
{
  return self->_orientationDetector;
}

- (void)setOrientationDetector:(id)a3
{
}

- (BOOL)isDeviceiPhone
{
  return self->_isDeviceiPhone;
}

- (void)setIsDeviceiPhone:(BOOL)a3
{
  self->_isDeviceiPhone = a3;
}

- (BOOL)isDeviceiPod
{
  return self->_isDeviceiPod;
}

- (void)setIsDeviceiPod:(BOOL)a3
{
  self->_isDeviceiPod = a3;
}

- (BOOL)isDeviceiPad
{
  return self->_isDeviceiPad;
}

- (void)setIsDeviceiPad:(BOOL)a3
{
  self->_isDeviceiPad = a3;
}

- (BOOL)isDeviceWatch
{
  return self->_isDeviceWatch;
}

- (void)setIsDeviceWatch:(BOOL)a3
{
  self->_isDeviceWatch = a3;
}

- (float)previousDeviceVolumePlayAndRecord
{
  return self->_previousDeviceVolumePlayAndRecord;
}

- (void)setPreviousDeviceVolumePlayAndRecord:(float)a3
{
  self->_previousDeviceVolumePlayAndRecord = a3;
}

- (float)previousDeviceVolumeAudioVideo
{
  return self->_previousDeviceVolumeAudioVideo;
}

- (void)setPreviousDeviceVolumeAudioVideo:(float)a3
{
  self->_previousDeviceVolumeAudioVideo = a3;
}

- (BOOL)previousAudioChanged
{
  return self->_previousAudioChanged;
}

- (void)setPreviousAudioChanged:(BOOL)a3
{
  self->_previousAudioChanged = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationDetector, 0);
  objc_storeStrong((id *)&self->_headphoneDetector, 0);
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_storeStrong((id *)&self->_originalBalance, 0);
  objc_storeStrong((id *)&self->_audioTest, 0);
  objc_storeStrong((id *)&self->_rawRecordings, 0);
  objc_storeStrong((id *)&self->_audioSystemResults, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_tmpdir, 0);
  objc_storeStrong((id *)&self->_fileNameToURL, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_diagnosticResponder, 0);
}

@end