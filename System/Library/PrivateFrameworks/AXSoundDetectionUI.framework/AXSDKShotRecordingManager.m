@interface AXSDKShotRecordingManager
+ (BOOL)_cleanupKShotFiles:(id)a3;
+ (id)_retrieveFilesOlderThan:(double)a3;
+ (id)defaults;
+ (id)requestForDetector:(id)a3;
+ (void)cleanupKShotFiles;
- (AXSDKShotDetector)targetDetector;
- (AXSDKShotRecordingManager)initWithSampleLength:(double)a3 bufferSize:(double)a4;
- (AXSDKShotRecordingManagerDelegate)delegate;
- (BOOL)isDetectionInProgress;
- (BOOL)shouldSendSimilarityWarning;
- (NSArray)cachedCurrentAudio;
- (NSDictionary)cachedCurrentResults;
- (NSMutableDictionary)currentDetections;
- (NSString)currentDetectionType;
- (NSTimer)timer;
- (SNDetectionResult)cachedDetectionResult;
- (id)_directory;
- (id)_saveCachedAudioFileTimer:(id)a3;
- (id)audioFileSettings;
- (id)path;
- (int)numNonDetections;
- (int)numObservations;
- (unint64_t)nRecordingsSoFar;
- (void)_cacheResultAndWaitForSave:(id)a3;
- (void)_directory;
- (void)_kShotShouldSaveCurrentSoundDidChange;
- (void)_recordCachedResultToFile;
- (void)listenEngineFailedToStartWithError:(id)a3;
- (void)receivedObservation:(id)a3 forDetector:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)reset;
- (void)saveDetectionResult:(id)a3;
- (void)setCachedCurrentAudio:(id)a3;
- (void)setCachedCurrentResults:(id)a3;
- (void)setCachedDetectionResult:(id)a3;
- (void)setCurrentDetectionType:(id)a3;
- (void)setCurrentDetections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsDetectionInProgress:(BOOL)a3;
- (void)setNumNonDetections:(int)a3;
- (void)setNumObservations:(int)a3;
- (void)setShouldSendSimilarityWarning:(BOOL)a3;
- (void)setTargetDetector:(id)a3;
- (void)setTimer:(id)a3;
- (void)trackBuffer:(id)a3 atTime:(id)a4;
- (void)trackBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5;
- (void)updateShouldSendSimilarityWarning:(id)a3;
@end

@implementation AXSDKShotRecordingManager

- (AXSDKShotRecordingManager)initWithSampleLength:(double)a3 bufferSize:(double)a4
{
  v17.receiver = self;
  v17.super_class = (Class)AXSDKShotRecordingManager;
  v6 = [(AXSDKShotRecordingManager *)&v17 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ax.kshot.file_write_q", 0);
    fileProcessingQueue = v6->_fileProcessingQueue;
    v6->_fileProcessingQueue = (OS_dispatch_queue *)v7;

    v6->_sampleLength = a3;
    v9 = [[AXHARingBuffer alloc] initWithCount:vcvtpd_u64_f64(60.0 / (a3 * a4))];
    audioRingBuffer = v6->_audioRingBuffer;
    v6->_audioRingBuffer = v9;

    v6->_isFile = 0;
    [(AXSDKShotRecordingManager *)v6 reset];
    objc_initWeak(&location, v6);
    v11 = [MEMORY[0x263F21DA0] sharedInstance];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__AXSDKShotRecordingManager_initWithSampleLength_bufferSize___block_invoke;
    v14[3] = &unk_2647F47F8;
    objc_copyWeak(&v15, &location);
    [v11 registerUpdateBlock:v14 forRetrieveSelector:sel_kShotShouldSaveCurrentSound withListener:v6];

    if ([MEMORY[0x263F472B0] isInternalInstall])
    {
      v13 = v6;
      AXPerformBlockOnMainThread();
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __61__AXSDKShotRecordingManager_initWithSampleLength_bufferSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _kShotShouldSaveCurrentSoundDidChange];
}

uint64_t __61__AXSDKShotRecordingManager_initWithSampleLength_bufferSize___block_invoke_2()
{
  v0 = objc_opt_class();
  return [v0 cleanupKShotFiles];
}

- (void)reset
{
  [(AXHARingBuffer *)self->_audioRingBuffer reset];
  v3 = (NSMutableDictionary *)objc_opt_new();
  currentDetections = self->_currentDetections;
  self->_currentDetections = v3;

  v5 = (NSMutableDictionary *)objc_opt_new();
  detectionResultCollection = self->_detectionResultCollection;
  self->_detectionResultCollection = v5;

  self->_isDetectionInProgress = 0;
  self->_numNonDetections = 0;
  self->_numObservations = 0;
}

- (void)setTargetDetector:(id)a3
{
  objc_storeStrong((id *)&self->_targetDetector, a3);
  [(AXSDKShotRecordingManager *)self reset];
}

- (unint64_t)nRecordingsSoFar
{
  v2 = [(AXSDKShotRecordingManager *)self targetDetector];
  v3 = [v2 recordings];
  unint64_t v4 = [v3 count];

  return v4;
}

+ (void)cleanupKShotFiles
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(id)objc_opt_class() defaults];
  unint64_t v4 = [v3 objectForKey:@"com.apple.accessibility.kshot.last_cleanup_key"];

  v5 = [MEMORY[0x263EFF910] now];
  v6 = [v5 dateByAddingTimeInterval:-86400.0];

  if (v4
    && ([v4 laterDate:v6], dispatch_queue_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7 == v4))
  {
    v11 = AXLogUltronKShot();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_226F20000, v11, OS_LOG_TYPE_INFO, "Not cleaning up KShot Files - last cleanup was recent: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v8 = [a1 _retrieveFilesOlderThan:432000.0];
    if ([v8 count]) {
      [a1 _cleanupKShotFiles:v8];
    }
    v9 = [a1 defaults];
    v10 = [MEMORY[0x263EFF910] now];
    [v9 setObject:v10 forKey:@"com.apple.accessibility.kshot.last_cleanup_key"];
  }
}

+ (BOOL)_cleanupKShotFiles:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = AXLogUltronKShot();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v3;
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_INFO, "Cleaning up KShot Files - at paths %@", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    id v9 = 0;
    uint64_t v10 = *(void *)v21;
    char v11 = 1;
    *(void *)&long long v7 = 138412546;
    long long v18 = v7;
    do
    {
      uint64_t v12 = 0;
      v13 = v9;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        id v15 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v18);
        id v19 = v13;
        [v15 removeItemAtPath:v14 error:&v19];
        id v9 = v19;

        if (v9)
        {
          v16 = AXLogUltronKShot();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            id v25 = v14;
            __int16 v26 = 2112;
            id v27 = v9;
            _os_log_error_impl(&dword_226F20000, v16, OS_LOG_TYPE_ERROR, "KShot cleanup: failed to remove: %@. Error: %@", buf, 0x16u);
          }

          char v11 = 0;
        }
        ++v12;
        v13 = v9;
      }
      while (v8 != v12);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
    char v11 = 1;
  }

  return v11 & 1;
}

+ (id)_retrieveFilesOlderThan:(double)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (a3 <= 0.0) {
    double v3 = a3;
  }
  else {
    double v3 = -a3;
  }
  unint64_t v4 = [MEMORY[0x263EFF910] date];
  v31 = [v4 dateByAddingTimeInterval:v3];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [MEMORY[0x263F21DA0] sharedInstance];
  long long v7 = [v6 decodedKShotDetectors];
  uint64_t v8 = [v7 allValues];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v14 isModelReady])
        {
          id v15 = [v14 identifier];
          v16 = [@"/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles" stringByAppendingPathComponent:v15];

          [v5 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v11);
  }
  uint64_t v29 = v9;

  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * j);
        long long v23 = [MEMORY[0x263F08850] defaultManager];
        id v32 = 0;
        v24 = [v23 attributesOfItemAtPath:v22 error:&v32];
        id v25 = v32;
        __int16 v26 = [v24 fileCreationDate];

        if (v25)
        {
          id v27 = AXLogUltronKShot();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v42 = v22;
            __int16 v43 = 2112;
            id v44 = v25;
            _os_log_error_impl(&dword_226F20000, v27, OS_LOG_TYPE_ERROR, "KShot cleanup: failed to find creation date for file %@. error: %@", buf, 0x16u);
          }
        }
        else if ([v26 compare:v31] == -1)
        {
          [v30 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v19);
  }

  return v30;
}

+ (id)defaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Accessibility"];
  return v2;
}

- (void)trackBuffer:(id)a3 atTime:(id)a4
{
  audioRingBuffer = self->_audioRingBuffer;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[AXSDTimedAudioBuffer alloc] initWithBuffer:v7 atTime:v6];

  [(AXHARingBuffer *)audioRingBuffer addObject:v8];
}

- (void)trackBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (self->_isFile != v5)
  {
    uint64_t v10 = AXLogUltronKShot();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226F20000, v10, OS_LOG_TYPE_DEFAULT, "AUTOMATION: RESETTING Audio Recording Buffer since we're recieving audio from a file.", buf, 2u);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_226F20000, v10, OS_LOG_TYPE_DEFAULT, "AUTOMATION: Moving from recording from a file to recording from the mic. Resetting Audio Recording Buffer", v16, 2u);
      }

      uint64_t v10 = [(AXHARingBuffer *)self->_audioRingBuffer content];
      uint64_t v12 = [v10 copy];
      cachedCurrentAudioFile = self->_cachedCurrentAudioFile;
      self->_cachedCurrentAudioFile = v12;
    }
    [(AXHARingBuffer *)self->_audioRingBuffer reset];
    self->_isFile = v5;
  }
  audioRingBuffer = self->_audioRingBuffer;
  id v15 = [[AXSDTimedAudioBuffer alloc] initWithBuffer:v8 atTime:v9];
  [(AXHARingBuffer *)audioRingBuffer addObject:v15];
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  double v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[AXSDKShotRecordingManager listenEngineFailedToStartWithError:]();
  }
}

- (id)path
{
  v2 = [(AXSDKShotRecordingManager *)self targetDetector];
  double v3 = [v2 identifier];
  unint64_t v4 = [@"/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles" stringByAppendingFormat:@"/%@", v3];

  return v4;
}

- (id)_directory
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v15 = *MEMORY[0x263F08040];
  v16[0] = MEMORY[0x263EFFA80];
  double v3 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  char v14 = 1;
  unint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  BOOL v5 = [(AXSDKShotRecordingManager *)self path];
  char v6 = [v4 fileExistsAtPath:v5 isDirectory:&v14];

  if ((v6 & 1) == 0)
  {
    id v7 = AXLogUltronKShot();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AXSDKShotRecordingManager _directory]();
    }

    id v8 = [(AXSDKShotRecordingManager *)self path];
    id v13 = 0;
    [v4 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v3 error:&v13];
    id v9 = v13;

    if (v9)
    {
      uint64_t v10 = AXLogUltronKShot();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXSDKShotRecordingManager _directory]();
      }
    }
  }
  BOOL v11 = [(AXSDKShotRecordingManager *)self path];

  return v11;
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v5 = a3;
  [(AXSDKShotRecordingManager *)self setNumObservations:[(AXSDKShotRecordingManager *)self numObservations] + 1];
  if ([(AXSDKShotRecordingManager *)self numObservations] >= 5)
  {
    char v6 = [MEMORY[0x263F21DA0] sharedInstance];
    if ([v6 soundDetectionKShotListeningState] == 1)
    {
    }
    else
    {
      id v7 = [MEMORY[0x263F21DA0] sharedInstance];
      uint64_t v8 = [v7 soundDetectionKShotListeningState];

      if (v8 != 2) {
        goto LABEL_16;
      }
    }
    if ([v5 detected])
    {
      [(AXSDKShotRecordingManager *)self saveDetectionResult:v5];
      goto LABEL_16;
    }
    id v9 = [v5 identifier];
    uint64_t v10 = [(AXSDKShotRecordingManager *)self currentDetectionType];
    if (![v9 isEqualToString:v10]) {
      goto LABEL_14;
    }
    BOOL v11 = [(AXSDKShotRecordingManager *)self isDetectionInProgress];

    if (v11)
    {
      [(AXSDKShotRecordingManager *)self setNumNonDetections:[(AXSDKShotRecordingManager *)self numNonDetections] + 1];
      if ([(AXSDKShotRecordingManager *)self numNonDetections] == 6)
      {
        uint64_t v12 = [MEMORY[0x263F21DA0] sharedInstance];
        [v12 setSoundDetectionKShotListeningState:3];

        [(AXSDKShotRecordingManager *)self setIsDetectionInProgress:0];
        id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSDKShotRecordingManager nRecordingsSoFar](self, "nRecordingsSoFar"));
        cachedCurrentAudio = self->_cachedCurrentAudio;
        self->_cachedCurrentAudio = 0;

        cachedCurrentResults = self->_cachedCurrentResults;
        self->_cachedCurrentResults = 0;

        cachedDetectionResult = self->_cachedDetectionResult;
        self->_cachedDetectionResult = 0;

        if (!self->_cachedCurrentAudioFile)
        {
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __61__AXSDKShotRecordingManager_receivedObservation_forDetector___block_invoke;
          v18[3] = &unk_2647F4A58;
          v18[4] = self;
          id v19 = v9;
          dispatch_async(MEMORY[0x263EF83A0], v18);

          goto LABEL_15;
        }
        v16 = AXLogUltron();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226F20000, v16, OS_LOG_TYPE_DEFAULT, "AUTOMATION: Audio File Ring Buffer is not nil! Will take recording from file instead of the mic.", buf, 2u);
        }

        uint64_t v10 = [(AXSDKShotRecordingManager *)self currentDetections];
        id v17 = [v10 objectForKey:v9];
        [(AXSDKShotRecordingManager *)self _cacheResultAndWaitForSave:v17];

LABEL_14:
LABEL_15:
      }
    }
  }
LABEL_16:
}

void __61__AXSDKShotRecordingManager_receivedObservation_forDetector___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _saveCachedAudioFileTimer:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTimer:v2];
}

- (id)_saveCachedAudioFileTimer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x263EFFA20];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AXSDKShotRecordingManager__saveCachedAudioFileTimer___block_invoke;
  v9[3] = &unk_2647F4B48;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 scheduledTimerWithTimeInterval:0 repeats:v9 block:5.0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __55__AXSDKShotRecordingManager__saveCachedAudioFileTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_DEFAULT, "KSHOT: Scheduled timer for adding padding to audio recording has fired!", buf, 2u);
  }

  id v5 = (id *)(a1 + 40);
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [v6 currentDetections];
  uint64_t v8 = [v7 objectForKey:*(void *)(a1 + 32)];
  [v6 _cacheResultAndWaitForSave:v8];

  id v9 = [MEMORY[0x263F21DA0] sharedInstance];
  LODWORD(v6) = [v9 kShotShouldSaveCurrentSound];

  if (v6)
  {
    id v10 = AXLogUltronKShot();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_226F20000, v10, OS_LOG_TYPE_DEFAULT, "KSHOT: Saving cached audio file from timer being fired.", v12, 2u);
    }

    id WeakRetained = objc_loadWeakRetained(v5);
    [WeakRetained _recordCachedResultToFile];
  }
  [v3 invalidate];
}

- (void)saveDetectionResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSDKShotRecordingManager nRecordingsSoFar](self, "nRecordingsSoFar"));
  id v7 = AXLogUltronKShot();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_DEFAULT, "KSHOT: Detected an electronic sound, adding audio from detection result: %@", (uint8_t *)&v16, 0xCu);
  }

  [(AXSDKShotRecordingManager *)self setCurrentDetectionType:v5];
  [(AXSDKShotRecordingManager *)self setIsDetectionInProgress:1];
  [(AXSDKShotRecordingManager *)self setNumNonDetections:0];
  uint64_t v8 = [(NSMutableDictionary *)self->_detectionResultCollection objectForKey:v6];

  if (!v8)
  {
    detectionResultCollection = self->_detectionResultCollection;
    id v10 = [[AXHARingBuffer alloc] initWithCount:[(AXHARingBuffer *)self->_audioRingBuffer count]];
    [(NSMutableDictionary *)detectionResultCollection setObject:v10 forKey:v6];
  }
  id v11 = [(NSMutableDictionary *)self->_detectionResultCollection objectForKey:v6];
  [v11 addObject:v4];

  uint64_t v12 = [(NSMutableDictionary *)self->_currentDetections objectForKey:v6];

  if (!v12)
  {
    id v13 = [MEMORY[0x263F21DA0] sharedInstance];
    [v13 setSoundDetectionKShotListeningState:2];

    [(NSMutableDictionary *)self->_currentDetections setObject:v4 forKey:v6];
    char v14 = AXLogUltronKShot();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v4 confidence];
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_DEFAULT, "KSHOT: Beginning audio save for sound number %@ with confidence %f", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)_cacheResultAndWaitForSave:(id)a3
{
  cachedCurrentAudioFile = self->_cachedCurrentAudioFile;
  if (cachedCurrentAudioFile)
  {
    id v6 = a3;
    id v7 = (NSArray *)[(NSArray *)cachedCurrentAudioFile mutableCopy];
    cachedCurrentAudio = self->_cachedCurrentAudio;
    self->_cachedCurrentAudio = v7;

    id v9 = self->_cachedCurrentAudioFile;
    self->_cachedCurrentAudioFile = 0;
  }
  else
  {
    audioRingBuffer = self->_audioRingBuffer;
    id v11 = a3;
    id v9 = [(AXHARingBuffer *)audioRingBuffer content];
    uint64_t v12 = (NSArray *)[v9 mutableCopy];
    id v13 = self->_cachedCurrentAudio;
    self->_cachedCurrentAudio = v12;
  }
  char v14 = [(NSMutableDictionary *)self->_detectionResultCollection ax_deepMutableCopy];
  cachedCurrentResults = self->_cachedCurrentResults;
  self->_cachedCurrentResults = v14;

  int v16 = (SNDetectionResult *)[a3 copy];
  cachedDetectionResult = self->_cachedDetectionResult;
  self->_cachedDetectionResult = v16;
}

- (void)_kShotShouldSaveCurrentSoundDidChange
{
  id v3 = [MEMORY[0x263F21DA0] sharedInstance];
  int v4 = [v3 kShotShouldSaveCurrentSound];

  if (v4)
  {
    id v5 = [(AXSDKShotRecordingManager *)self timer];
    char v6 = [v5 isValid];

    if ((v6 & 1) == 0)
    {
      id v7 = AXLogUltronKShot();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_DEFAULT, "KSHOT: Saving cached audio file from _kShotShouldSaveCurrentSoundDidChange.", buf, 2u);
      }

      [(AXSDKShotRecordingManager *)self _recordCachedResultToFile];
    }
  }
  else
  {
    cachedCurrentAudio = self->_cachedCurrentAudio;
    self->_cachedCurrentAudio = 0;

    cachedCurrentResults = self->_cachedCurrentResults;
    self->_cachedCurrentResults = 0;

    cachedDetectionResult = self->_cachedDetectionResult;
    self->_cachedDetectionResult = 0;

    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSDKShotRecordingManager nRecordingsSoFar](self, "nRecordingsSoFar"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)self->_currentDetections removeObjectForKey:v11];
  }
}

- (void)_recordCachedResultToFile
{
  fileProcessingQueue = self->_fileProcessingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke;
  block[3] = &unk_2647F49E0;
  block[4] = self;
  dispatch_async(fileProcessingQueue, block);
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke(uint64_t a1)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) cachedDetectionResult];
  id v3 = [v2 identifier];

  int v4 = [MEMORY[0x263F21DA0] sharedInstance];
  id v5 = [v4 kShotCategoryForDetectionType:v3];

  if (v5)
  {
    char v6 = [*v1 targetDetector];
    id v7 = [v6 identifier];

    if (v7)
    {
      uint64_t v8 = [*v1 targetDetector];
      uint64_t v9 = [v8 identifier];

      id v10 = [*v1 _directory];
      id v11 = NSString;
      uint64_t v12 = [MEMORY[0x263EFF910] date];
      [v12 timeIntervalSince1970];
      uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", @"%ld", (uint64_t)v13);

      v69 = (void *)v14;
      v68 = [NSString stringWithFormat:@"%@_%@_%@", v9, v3, v14];
      [v68 stringByAppendingPathExtension:@"wav"];
      v67 = v70 = v10;
      v66 = objc_msgSend(v10, "stringByAppendingPathComponent:");
      uint64_t v15 = objc_msgSend(NSURL, "fileURLWithPath:");
      id v16 = objc_alloc(MEMORY[0x263EF9380]);
      id v17 = [*v1 audioFileSettings];
      v65 = (void *)v15;
      v76 = (void *)[v16 initForWriting:v15 settings:v17 commonFormat:1 interleaved:1 error:0];

      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*v1, "nRecordingsSoFar"));
      uint64_t v19 = [*v1 cachedCurrentResults];
      v64 = (void *)v18;
      uint64_t v20 = [v19 objectForKey:v18];
      long long v21 = [v20 content];
      v75 = [v21 reverseObjectEnumerator];

      double v22 = *((double *)*v1 + 1);
      int64_t v23 = vcvtpd_s64_f64(2.0 / v22);
      v24 = [*v1 cachedDetectionResult];
      id v25 = v24;
      if (v24)
      {
        [v24 timeRange];
        int64_t v26 = v96;
      }
      else
      {
        int64_t v26 = 0;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v96 = 0u;
      }
      if (v26 >= v23)
      {
        uint64_t v29 = [*v1 cachedDetectionResult];
        id v30 = v29;
        if (v29)
        {
          [v29 timeRange];
          uint64_t v31 = v93;
        }
        else
        {
          uint64_t v31 = 0;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v93 = 0u;
        }
        uint64_t v28 = v31 - v23;
      }
      else
      {
        uint64_t v28 = 0;
      }

      id v32 = [*v1 cachedDetectionResult];
      long long v33 = v32;
      if (v32)
      {
        [v32 timeRange];
        uint64_t v34 = v90;
      }
      else
      {
        uint64_t v34 = 0;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v90 = 0u;
      }
      double v35 = 5.0 / v22;
      long long v36 = [*v1 cachedDetectionResult];
      long long v37 = v36;
      if (v36)
      {
        [v36 timeRange];
        uint64_t v38 = *((void *)&v88 + 1);
      }
      else
      {
        uint64_t v38 = 0;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v87 = 0u;
      }
      unint64_t v39 = vcvtpd_s64_f64(v35);
      uint64_t v40 = v38 + v34;

      v41 = 0;
      v73 = v5;
      v74 = v3;
      v72 = v9;
      while (1)
      {
        uint64_t v42 = v41;
        v41 = [v75 nextObject];

        if (!v41) {
          break;
        }
        if (([v41 detected] & 1) == 0)
        {
          __int16 v43 = [*v1 cachedDetectionResult];

          if (v41 != v43) {
            continue;
          }
        }
        [v41 timeRange];
        [v41 timeRange];
        uint64_t v40 = v85 + v86;
        break;
      }
      v63 = v41;
      id v44 = AXLogUltronKShot();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_4(v1, v44);
      }

      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      v71 = v1;
      v45 = [*v1 cachedCurrentAudio];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v81 objects:v101 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = v40 + v39;
        uint64_t v49 = *(void *)v82;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v82 != v49) {
              objc_enumerationMutation(v45);
            }
            v51 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            id v52 = [v51 time];
            if ([v52 sampleTime] >= v28)
            {
              v53 = [v51 time];
              uint64_t v54 = [v53 sampleTime];

              if (v54 > v48) {
                continue;
              }
              v55 = [v51 buffer];
              id v80 = 0;
              [v76 writeFromBuffer:v55 error:&v80];
              id v52 = v80;

              if (v52)
              {
                v56 = AXLogUltronKShot();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v100 = v52;
                  _os_log_error_impl(&dword_226F20000, v56, OS_LOG_TYPE_ERROR, "Error writing KShot audio to file: %@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v81 objects:v101 count:16];
        }
        while (v47);
      }

      v57 = AXLogUltronKShot();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_3();
      }

      dispatch_time_t v58 = dispatch_time(0, 1000000000);
      id v59 = *v71;
      v60 = *((void *)*v71 + 2);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_41;
      block[3] = &unk_2647F4AD0;
      block[4] = v59;
      id v78 = v66;
      id v79 = v65;
      id v61 = v65;
      id v62 = v66;
      dispatch_after(v58, v60, block);

      id v5 = v73;
      id v3 = v74;
      id v27 = v72;
    }
    else
    {
      id v27 = AXLogUltronKShot();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v27 = AXLogUltronKShot();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_1();
    }
  }
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_41(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) targetDetector];
  [v2 addRecording:*(void *)(a1 + 40)];

  id v3 = *(id *)(a1 + 48);
  AXPerformBlockOnMainThread();
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) targetDetector];
  id v3 = [v2 recordings];
  uint64_t v4 = [v3 count];

  if (v4 == 1
    && ([*(id *)(a1 + 32) updateShouldSendSimilarityWarning:*(void *)(a1 + 40)],
        [*(id *)(a1 + 32) shouldSendSimilarityWarning]))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.kshot.model.similarity.warning", 0, 0, 1u);
  }
  else
  {
    char v6 = [*(id *)(a1 + 32) delegate];
    id v7 = [*(id *)(a1 + 32) targetDetector];
    [v6 savedTrainingRecordingForDetector:v7];

    id v8 = [MEMORY[0x263F21DA0] sharedInstance];
    [v8 setKShotShouldSaveCurrentSound:0];
  }
}

- (void)updateShouldSendSimilarityWarning:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AXSDKShotRecordingManager *)self setShouldSendSimilarityWarning:0];
  id v5 = [MEMORY[0x263F21DA0] sharedInstance];
  char v6 = [v5 decodedKShotDetectors];
  id v7 = [v6 allValues];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v30;
    *(void *)&long long v10 = 138412290;
    long long v26 = v10;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v14, "isModelReady", v26))
        {
          uint64_t v15 = AXLogUltronKShot();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            double v22 = [v14 name];
            int64_t v23 = [v14 identifier];
            *(_DWORD *)buf = 138412546;
            id v34 = v22;
            __int16 v35 = 2112;
            long long v36 = v23;
            _os_log_debug_impl(&dword_226F20000, v15, OS_LOG_TYPE_DEBUG, "CONFIDENCE FOR DETECTOR %@ %@", buf, 0x16u);
          }
          id v16 = objc_alloc(MEMORY[0x263F179A0]);
          id v28 = 0;
          id v17 = (void *)[v16 initWithURL:v4 error:&v28];
          id v18 = v28;
          if (v18)
          {
            v24 = v18;
            id v25 = AXLogUltronKShot();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
              -[AXSDKShotRecordingManager updateShouldSendSimilarityWarning:]();
            }

            goto LABEL_22;
          }
          uint64_t v19 = +[AXSDKShotRecordingManager requestForDetector:v14];
          id v27 = 0;
          [v17 addRequest:v19 withObserver:self error:&v27];
          id v20 = v27;
          if (v20)
          {
            long long v21 = AXLogUltronKShot();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              id v34 = v20;
              _os_log_debug_impl(&dword_226F20000, v21, OS_LOG_TYPE_DEBUG, "KSHOT MODEL CHECK ERROR adding request %@", buf, 0xCu);
            }
          }
          else
          {
            [v17 analyze];
          }

          if (v20) {
            goto LABEL_22;
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_22:
}

+ (id)requestForDetector:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mlModel];
  if (v4)
  {
    id v21 = 0;
    id v5 = (void *)[objc_alloc(MEMORY[0x263F179D8]) initWithMLModel:v4 error:&v21];
    char v6 = v21;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v18 = [v4 modelDescription];
      uint64_t v11 = [v18 inputDescriptionsByName];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"td_audio"];
      double v13 = [v12 multiArrayConstraint];
      uint64_t v14 = [v13 shape];
      uint64_t v15 = [v14 lastObject];
      int64_t v16 = [v15 int64ValueSafe];

      CMTimeMake(&v20, v16, 16000);
      CMTime v19 = v20;
      [v5 setWindowDuration:&v19];
      [v5 setOverlapFactor:(float)((float)((float)v16 + -7800.0) / (float)v16)];
      id v10 = v5;
    }
    else
    {
      uint64_t v9 = AXLogUltronKShot();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[AXSDKShotRecordingManager requestForDetector:](v3);
      }

      id v10 = 0;
    }
  }
  else
  {
    id v7 = AXLogUltronKShot();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[AXSDKShotRecordingManager requestForDetector:](v3);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(a4, "classifications", a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        if ([v11 isEqualToString:@"1"])
        {
          [v10 confidence];
          double v13 = v12;

          if (v13 > 0.85) {
            [(AXSDKShotRecordingManager *)self setShouldSendSimilarityWarning:1];
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)audioFileSettings
{
  v7[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EF92C8];
  v6[0] = *MEMORY[0x263EF92C0];
  v6[1] = v2;
  v7[0] = &unk_26DB27330;
  v7[1] = &unk_26DB27348;
  uint64_t v3 = *MEMORY[0x263EF92E0];
  v6[2] = *MEMORY[0x263EF92D0];
  v6[3] = v3;
  v7[2] = MEMORY[0x263EFFA88];
  v7[3] = &unk_26DB27360;
  v6[4] = *MEMORY[0x263EF92F8];
  v7[4] = &unk_26DB27378;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];
  return v4;
}

- (AXSDKShotRecordingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSDKShotRecordingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXSDKShotDetector)targetDetector
{
  return self->_targetDetector;
}

- (BOOL)isDetectionInProgress
{
  return self->_isDetectionInProgress;
}

- (void)setIsDetectionInProgress:(BOOL)a3
{
  self->_isDetectionInProgress = a3;
}

- (NSString)currentDetectionType
{
  return self->_currentDetectionType;
}

- (void)setCurrentDetectionType:(id)a3
{
}

- (int)numNonDetections
{
  return self->_numNonDetections;
}

- (void)setNumNonDetections:(int)a3
{
  self->_numNonDetections = a3;
}

- (int)numObservations
{
  return self->_numObservations;
}

- (void)setNumObservations:(int)a3
{
  self->_numObservations = a3;
}

- (NSMutableDictionary)currentDetections
{
  return self->_currentDetections;
}

- (void)setCurrentDetections:(id)a3
{
}

- (NSArray)cachedCurrentAudio
{
  return self->_cachedCurrentAudio;
}

- (void)setCachedCurrentAudio:(id)a3
{
}

- (NSDictionary)cachedCurrentResults
{
  return self->_cachedCurrentResults;
}

- (void)setCachedCurrentResults:(id)a3
{
}

- (SNDetectionResult)cachedDetectionResult
{
  return self->_cachedDetectionResult;
}

- (void)setCachedDetectionResult:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)shouldSendSimilarityWarning
{
  return self->_shouldSendSimilarityWarning;
}

- (void)setShouldSendSimilarityWarning:(BOOL)a3
{
  self->_shouldSendSimilarityWarning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_cachedDetectionResult, 0);
  objc_storeStrong((id *)&self->_cachedCurrentResults, 0);
  objc_storeStrong((id *)&self->_cachedCurrentAudio, 0);
  objc_storeStrong((id *)&self->_currentDetections, 0);
  objc_storeStrong((id *)&self->_currentDetectionType, 0);
  objc_storeStrong((id *)&self->_targetDetector, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedCurrentAudioFile, 0);
  objc_storeStrong((id *)&self->_detectionResultCollection, 0);
  objc_storeStrong((id *)&self->_audioRingBuffer, 0);
  objc_storeStrong((id *)&self->_fileProcessingQueue, 0);
}

- (void)listenEngineFailedToStartWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_226F20000, v0, OS_LOG_TYPE_FAULT, "KShot recording manager: Listen Engine failed to start.", v1, 2u);
}

- (void)_directory
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "Creating KShot Directory", v1, 2u);
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_226F20000, v0, OS_LOG_TYPE_ERROR, "We shouldn't get here unless listening type category wasn't found %@.", v1, 0xCu);
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_226F20000, v0, OS_LOG_TYPE_ERROR, "We shouldn't get here unless we have a target detector to train. Not saving recording.", v1, 2u);
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "KSHOT done recording result to file", v1, 2u);
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_4(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 path];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "KSHOT Recording result to file at path %@.", v4, 0xCu);
}

- (void)updateShouldSendSimilarityWarning:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "KSHOT MODEL CHECK ERROR audioAnalyzer init %@", v1, 0xCu);
}

+ (void)requestForDetector:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 name];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_226F20000, v4, v5, "Unable to create model from compiled model for detector %@ %@. error: %@", v6, v7, v8, v9, 2u);
}

+ (void)requestForDetector:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = [a1 name];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_226F20000, v4, v5, "Unable to create request from detector %@ %@. error: %@", v6, v7, v8, v9, 2u);
}

@end