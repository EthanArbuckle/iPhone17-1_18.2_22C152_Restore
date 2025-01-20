@interface AXSDUltronInternalRecordingManager
+ (BOOL)_cleanupUltronFiles:(id)a3;
+ (BOOL)isEnrolled;
+ (BOOL)wasPrompted;
+ (id)_directory;
+ (id)_retrieveFilesOlderThan:(double)a3;
+ (id)defaults;
+ (id)path;
+ (void)_directory;
+ (void)_reduceFileDirectorySize;
+ (void)cleanupUltron;
+ (void)enroll;
+ (void)setPrompted;
+ (void)unenroll;
- (AXSDUltronInternalRecordingManager)initWithSampleLength:(double)a3 bufferSize:(double)a4;
- (id)audioFileSettings;
- (id)getDictionaryForListenType;
- (void)_recordResultToFile:(id)a3;
- (void)dealloc;
- (void)listenEngineFailedToStartWithError:(id)a3;
- (void)saveDetectionResult:(id)a3;
- (void)trackBuffer:(id)a3 atTime:(id)a4;
@end

@implementation AXSDUltronInternalRecordingManager

- (AXSDUltronInternalRecordingManager)initWithSampleLength:(double)a3 bufferSize:(double)a4
{
  v27.receiver = self;
  v27.super_class = (Class)AXSDUltronInternalRecordingManager;
  v6 = [(AXSDUltronInternalRecordingManager *)&v27 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ax.ultron.file_write_q", 0);
    fileProcessingQueue = v6->_fileProcessingQueue;
    v6->_fileProcessingQueue = (OS_dispatch_queue *)v7;

    v6->_sampleLength = a3;
    v9 = [[AXHARingBuffer alloc] initWithCount:vcvtpd_u64_f64(20.0 / (a3 * a4))];
    audioRingBuffer = v6->_audioRingBuffer;
    v6->_audioRingBuffer = v9;

    uint64_t v11 = objc_opt_new();
    currentDetections = v6->_currentDetections;
    v6->_currentDetections = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    detectionResultCollection = v6->_detectionResultCollection;
    v6->_detectionResultCollection = (NSMutableDictionary *)v13;

    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke;
    v25 = &unk_2647F49E0;
    v26 = v6;
    AXPerformBlockOnMainThread();
    v15 = (void *)MEMORY[0x263EFFA20];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke_2;
    v20[3] = &unk_2647F4A08;
    v16 = v26;
    v21 = v16;
    uint64_t v17 = [v15 scheduledTimerWithTimeInterval:1 repeats:v20 block:86400.0];
    cleanupTimer = v16->_cleanupTimer;
    v16->_cleanupTimer = (NSTimer *)v17;
  }
  return v6;
}

uint64_t __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke()
{
  v0 = objc_opt_class();
  return [v0 cleanupUltron];
}

void __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThread();
}

uint64_t __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke_3()
{
  v0 = objc_opt_class();
  return [v0 cleanupUltron];
}

- (void)dealloc
{
  [(NSTimer *)self->_cleanupTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AXSDUltronInternalRecordingManager;
  [(AXSDUltronInternalRecordingManager *)&v3 dealloc];
}

+ (id)defaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Accessibility"];
  return v2;
}

+ (BOOL)isEnrolled
{
  v2 = [a1 defaults];
  objc_super v3 = [v2 stringForKey:@"com.apple.accessibility.ultron.user_identifier_key"];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)enroll
{
  id v1 = [a1 defaults];
  v2 = [v1 stringForKey:@"com.apple.accessibility.ultron.user_identifier_key"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v3, v4, "Enrolling in Ultron Data Collection - ID: %@", v5, v6, v7, v8, v9);
}

+ (void)unenroll
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "Unenrolling from Ultron Data Collection", v2, v3, v4, v5, v6);
}

+ (BOOL)wasPrompted
{
  uint64_t v2 = [a1 defaults];
  char v3 = [v2 BOOLForKey:@"com.apple.accessibility.ultron.user_identifier_prompt_key"];

  return v3;
}

+ (void)setPrompted
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "Updating \"User was prompted to join Ultron Data Collection\" defaults to True", v2, v3, v4, v5, v6);
}

+ (void)cleanupUltron
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(id)objc_opt_class() defaults];
  uint64_t v4 = [v3 objectForKey:@"com.apple.accessibility.ultron.last_cleanup_key"];

  uint64_t v5 = [MEMORY[0x263EFF910] now];
  uint8_t v6 = [v5 dateByAddingTimeInterval:-86400.0];

  if (v4
    && ([v4 laterDate:v6], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7 == v4))
  {
    uint64_t v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v4;
      _os_log_impl(&dword_226F20000, v11, OS_LOG_TYPE_INFO, "Not cleaning up Ultron Files - last cleanup was recent: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [a1 _retrieveFilesOlderThan:1209600.0];
    if ([v8 count]) {
      [a1 _cleanupUltronFiles:v8];
    }
    [a1 _reduceFileDirectorySize];
    uint8_t v9 = [a1 defaults];
    v10 = [MEMORY[0x263EFF910] now];
    [v9 setObject:v10 forKey:@"com.apple.accessibility.ultron.last_cleanup_key"];
  }
}

+ (id)path
{
  return @"/var/mobile/Library/Accessibility/DataCollection/SoundFiles";
}

+ (id)_directory
{
  char v10 = 1;
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [a1 path];
  char v5 = [v3 fileExistsAtPath:v4 isDirectory:&v10];

  if ((v5 & 1) == 0)
  {
    uint8_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[AXSDUltronInternalRecordingManager _directory]();
    }

    uint64_t v7 = [a1 path];
    [v3 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  }
  uint64_t v8 = [a1 path];

  return v8;
}

+ (id)_retrieveFilesOlderThan:(double)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a3 <= 0.0) {
    double v4 = a3;
  }
  else {
    double v4 = -a3;
  }
  char v5 = [MEMORY[0x263EFF910] date];
  uint64_t v22 = [v5 dateByAddingTimeInterval:v4];

  uint8_t v6 = [a1 _directory];
  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = [v7 enumeratorAtPath:v6];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = [v8 nextObject];
  if (v10)
  {
    int v12 = (void *)v10;
    *(void *)&long long v11 = 138412546;
    long long v21 = v11;
    do
    {
      uint64_t v13 = objc_msgSend(v6, "stringByAppendingPathComponent:", v12, v21);
      uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
      id v23 = 0;
      v15 = [v14 attributesOfItemAtPath:v13 error:&v23];
      id v16 = v23;
      uint64_t v17 = [v15 fileCreationDate];

      if (v16)
      {
        v18 = AXLogUltron();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v21;
          v25 = v13;
          __int16 v26 = 2112;
          id v27 = v16;
          _os_log_error_impl(&dword_226F20000, v18, OS_LOG_TYPE_ERROR, "Ultron cleanup: failed to find creation date for file %@. error: %@", buf, 0x16u);
        }
      }
      else if ([v17 compare:v22] == -1)
      {
        [v9 addObject:v13];
      }

      uint64_t v19 = [v8 nextObject];

      int v12 = (void *)v19;
    }
    while (v19);
  }

  return v9;
}

- (void)trackBuffer:(id)a3 atTime:(id)a4
{
  audioRingBuffer = self->_audioRingBuffer;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[AXSDTimedAudioBuffer alloc] initWithBuffer:v7 atTime:v6];

  [(AXHARingBuffer *)audioRingBuffer addObject:v8];
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  uint64_t v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[AXSDUltronInternalRecordingManager listenEngineFailedToStartWithError:]();
  }
}

+ (BOOL)_cleanupUltronFiles:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
    char v9 = 1;
    *(void *)&long long v5 = 138412546;
    long long v16 = v5;
    do
    {
      uint64_t v10 = 0;
      long long v11 = v7;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        uint64_t v13 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v16);
        id v17 = v11;
        [v13 removeItemAtPath:v12 error:&v17];
        id v7 = v17;

        if (v7)
        {
          uint64_t v14 = AXLogUltron();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            uint64_t v23 = v12;
            __int16 v24 = 2112;
            id v25 = v7;
            _os_log_error_impl(&dword_226F20000, v14, OS_LOG_TYPE_ERROR, "Ultron cleanup: failed to remove: %@. Error: %@", buf, 0x16u);
          }

          char v9 = 0;
        }
        ++v10;
        long long v11 = v7;
      }
      while (v6 != v10);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    char v9 = 1;
  }

  return v9 & 1;
}

- (void)saveDetectionResult:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 identifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_detectionResultCollection objectForKey:v5];

  if (!v6)
  {
    detectionResultCollection = self->_detectionResultCollection;
    uint64_t v8 = [[AXHARingBuffer alloc] initWithCount:[(AXHARingBuffer *)self->_audioRingBuffer count]];
    [(NSMutableDictionary *)detectionResultCollection setObject:v8 forKey:v5];
  }
  char v9 = [(NSMutableDictionary *)self->_detectionResultCollection objectForKey:v5];
  [v9 addObject:v4];

  if ([v4 detected])
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_currentDetections objectForKey:v5];

    if (!v10)
    {
      long long v11 = AXLogUltron();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        [(AXSDUltronInternalRecordingManager *)(uint64_t)v5 saveDetectionResult:v11];
      }

      uint64_t v12 = (void *)MEMORY[0x263EFFA20];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__AXSDUltronInternalRecordingManager_saveDetectionResult___block_invoke;
      v15[3] = &unk_2647F4A30;
      v15[4] = self;
      id v16 = v4;
      id v13 = v5;
      id v17 = v13;
      uint64_t v14 = [v12 scheduledTimerWithTimeInterval:0 repeats:v15 block:10.0];
      [(NSMutableDictionary *)self->_currentDetections setObject:v14 forKey:v13];
    }
  }
}

void __58__AXSDUltronInternalRecordingManager_saveDetectionResult___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 _recordResultToFile:v4];
  [*(id *)(a1[4] + 48) removeObjectForKey:a1[6]];
  [v5 invalidate];
}

- (void)_recordResultToFile:(id)a3
{
  id v4 = a3;
  id v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDUltronInternalRecordingManager _recordResultToFile:](v4);
  }

  uint64_t v6 = [(AXHARingBuffer *)self->_audioRingBuffer content];
  id v7 = [(NSMutableDictionary *)self->_detectionResultCollection ax_deepMutableCopy];
  fileProcessingQueue = self->_fileProcessingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke;
  v12[3] = &unk_2647F4A80;
  id v13 = v4;
  uint64_t v14 = self;
  id v15 = v7;
  id v16 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v4;
  dispatch_async(fileProcessingQueue, v12);
}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke(id *a1)
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1 + 4;
  uint64_t v2 = [a1[4] identifier];
  id v3 = [(id)objc_opt_class() _directory];
  id v4 = NSString;
  id v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSince1970];
  uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", @"%ld", (uint64_t)v6);

  v80 = (void *)v2;
  uint64_t v8 = [NSString stringWithFormat:@"%@_%@", v2, v7];
  uint64_t v9 = [v8 stringByAppendingPathExtension:@"wav"];
  v82 = v8;
  uint64_t v10 = [v8 stringByAppendingPathExtension:@"txt"];
  id v11 = NSURL;
  uint64_t v12 = [v3 stringByAppendingPathComponent:v9];
  uint64_t v13 = [v11 fileURLWithPath:v12];

  uint64_t v14 = [v3 stringByAppendingPathComponent:v10];
  id v15 = objc_alloc(MEMORY[0x263EF9380]);
  id v16 = [v1[1] audioFileSettings];
  v81 = (void *)[v15 initForWriting:v13 settings:v16 commonFormat:1 interleaved:1 error:0];

  id v17 = v1[2];
  long long v18 = [*v1 identifier];
  long long v19 = [v17 objectForKey:v18];

  v74 = v19;
  long long v20 = [v19 content];
  v83 = [v20 reverseObjectEnumerator];

  uint64_t v21 = vcvtpd_s64_f64(10.0 / *((double *)v1[1] + 1));
  v73 = (void *)v14;
  if (!*v1)
  {
    long long v124 = 0u;
    long long v125 = 0u;
    long long v123 = 0u;
    if (v21 > 0)
    {
      uint64_t v91 = 0;
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  [*v1 timeRange];
  id v22 = *v1;
  if ((uint64_t)v123 >= v21)
  {
    if (v22)
    {
      [v22 timeRange];
      uint64_t v23 = v120;
      id v22 = *v1;
      goto LABEL_10;
    }
LABEL_9:
    id v22 = 0;
    uint64_t v23 = 0;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v120 = 0u;
LABEL_10:
    uint64_t v91 = v23 - v21;
    if (v22) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v24 = 0;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v117 = 0u;
    goto LABEL_14;
  }
  uint64_t v91 = 0;
  if (!v22) {
    goto LABEL_13;
  }
LABEL_11:
  [v22 timeRange];
  uint64_t v24 = v117;
  if (*v1)
  {
    [*v1 timeRange];
    uint64_t v25 = *((void *)&v115 + 1);
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v25 = 0;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v114 = 0u;
LABEL_15:
  __int16 v26 = 0;
  uint64_t v27 = v25 + v24;
  v78 = (void *)v7;
  v79 = v3;
  v76 = (void *)v10;
  v77 = (void *)v9;
  v75 = (void *)v13;
  while (1)
  {
    id v28 = [v83 nextObject];

    __int16 v26 = v28;
    if (!v28) {
      break;
    }
    if (([v28 detected] & 1) != 0 || v28 == *v1)
    {
      [v28 timeRange];
      v72 = v28;
      [v28 timeRange];
      uint64_t v27 = v112 + v113;
      goto LABEL_21;
    }
  }
  v72 = 0;
LABEL_21:
  uint64_t v90 = v27 + v21;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v29 = a1[7];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v108 objects:v128 count:16];
  if (!v30) {
    goto LABEL_32;
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v109;
  do
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (*(void *)v109 != v32) {
        objc_enumerationMutation(v29);
      }
      v34 = *(void **)(*((void *)&v108 + 1) + 8 * i);
      v35 = [v34 time];
      if ([v35 sampleTime] >= v91)
      {
        v36 = [v34 time];
        uint64_t v37 = [v36 sampleTime];

        if (v37 > v90) {
          continue;
        }
        v35 = [v34 buffer];
        [v81 writeFromBuffer:v35 error:0];
      }
    }
    uint64_t v31 = [v29 countByEnumeratingWithState:&v108 objects:v128 count:16];
  }
  while (v31);
LABEL_32:

  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = [a1[6] allKeys];
  uint64_t v86 = [obj countByEnumeratingWithState:&v104 objects:v127 count:16];
  if (v86)
  {
    uint64_t v85 = *(void *)v105;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v105 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v87 = v39;
        uint64_t v40 = *(void *)(*((void *)&v104 + 1) + 8 * v39);
        v41 = [a1[6] objectForKey:v40];
        v42 = [v41 content];

        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id v89 = v42;
        uint64_t v43 = [v89 countByEnumeratingWithState:&v100 objects:v126 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v101;
          do
          {
            for (uint64_t j = 0; j != v44; ++j)
            {
              if (*(void *)v101 != v45) {
                objc_enumerationMutation(v89);
              }
              v47 = *(void **)(*((void *)&v100 + 1) + 8 * j);
              if (v47)
              {
                [*(id *)(*((void *)&v100 + 1) + 8 * j) timeRange];
                uint64_t v48 = v97;
              }
              else
              {
                uint64_t v48 = 0;
                long long v98 = 0u;
                long long v99 = 0u;
                long long v97 = 0u;
              }
              uint64_t v49 = v48 - v91;
              if (v48 >= v91 && v48 <= v90)
              {
                v51 = [v38 objectForKeyedSubscript:v40];

                if (!v51)
                {
                  v52 = [a1[5] getDictionaryForListenType];
                  [v38 setValue:v52 forKey:v40];
                }
                [v47 confidence];
                double v54 = v53;
                [v47 confidence];
                if (v55 < 0.001) {
                  double v54 = 0.0;
                }
                v56 = [v38 objectForKey:v40];
                v57 = [v56 objectForKey:@"confidence"];
                v58 = [NSNumber numberWithDouble:v54];
                [v57 addObject:v58];

                v59 = [v38 objectForKey:v40];
                v60 = [v59 objectForKey:@"timestamp"];
                v61 = [NSNumber numberWithLongLong:v49];
                [v60 addObject:v61];
              }
            }
            uint64_t v44 = [v89 countByEnumeratingWithState:&v100 objects:v126 count:16];
          }
          while (v44);
        }

        uint64_t v39 = v87 + 1;
      }
      while (v87 + 1 != v86);
      uint64_t v86 = [obj countByEnumeratingWithState:&v104 objects:v127 count:16];
    }
    while (v86);
  }

  uint64_t v62 = MGCopyAnswer();
  v63 = [MEMORY[0x263EFF910] date];
  id v64 = objc_alloc_init(MEMORY[0x263F08790]);
  [v64 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v65 = [v64 stringFromDate:v63];
  uint64_t v66 = [v81 length];

  v67 = objc_opt_new();
  v92 = (void *)v62;
  [v67 setSafeObject:v62 forKey:@"buildVersion"];
  [v67 setSafeObject:&unk_26DB272A0 forKey:@"ultronVersion"];
  [v67 setSafeObject:v80 forKey:@"listenType"];
  [v67 setSafeObject:v82 forKey:@"fileName"];
  [v67 setSafeObject:v65 forKey:@"audioStringDate"];
  [v67 setSafeObject:v38 forKey:@"confidenceValues"];
  [v67 setSafeObject:&unk_26DB272B8 forKey:@"userFeedback"];
  v68 = [NSNumber numberWithLongLong:v66];
  [v67 setSafeObject:v68 forKey:@"numberOfSamples"];

  v69 = [MEMORY[0x263F08900] dataWithJSONObject:v67 options:1 error:0];
  if (v69)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_83;
    block[3] = &unk_2647F4A58;
    v70 = v73;
    v95 = v73;
    id v96 = v69;
    dispatch_async(MEMORY[0x263EF83A0], block);

    v71 = v95;
  }
  else
  {
    v71 = AXLogUltron();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_cold_1(v1, v71);
    }
    v70 = v73;
  }

  v93[0] = MEMORY[0x263EF8330];
  v93[1] = 3221225472;
  v93[2] = __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_84;
  v93[3] = &unk_2647F49E0;
  v93[4] = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], v93);
}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_83(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = (uint64_t *)(a1 + 32);
  [v2 createFileAtPath:v3 contents:v4 attributes:0];

  double v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 fileExistsAtPath:*v5];

  uint64_t v8 = AXLogUltron();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_83_cold_1(v7, v5, v8);
  }
}

uint64_t __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_84()
{
  v0 = objc_opt_class();
  return [v0 _reduceFileDirectorySize];
}

- (id)getDictionaryForListenType
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v2 setValue:v3 forKey:@"timestamp"];

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v2 setValue:v4 forKey:@"confidence"];

  return v2;
}

- (id)audioFileSettings
{
  v7[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EF92C8];
  v6[0] = *MEMORY[0x263EF92C0];
  v6[1] = v2;
  v7[0] = &unk_26DB272D0;
  v7[1] = &unk_26DB272E8;
  uint64_t v3 = *MEMORY[0x263EF92E0];
  v6[2] = *MEMORY[0x263EF92D0];
  v6[3] = v3;
  v7[2] = MEMORY[0x263EFFA88];
  v7[3] = &unk_26DB27300;
  v6[4] = *MEMORY[0x263EF92F8];
  v7[4] = &unk_26DB27318;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];
  return v4;
}

+ (void)_reduceFileDirectorySize
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Sorting files by date failed; continuing but may have unpredictable results.\nLast failure: %@",
    (uint8_t *)&v3,
    0xCu);
}

uint64_t __62__AXSDUltronInternalRecordingManager__reduceFileDirectorySize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  char v7 = [v5 stringByAppendingPathComponent:a2];
  uint64_t v8 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v6];

  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v10 + 40);
  id v11 = [v9 attributesOfItemAtPath:v7 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);

  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v20 = *(id *)(v13 + 40);
  uint64_t v14 = [v12 attributesOfItemAtPath:v8 error:&v20];
  objc_storeStrong((id *)(v13 + 40), v20);

  uint64_t v15 = *MEMORY[0x263F08008];
  id v16 = [v11 objectForKey:*MEMORY[0x263F08008]];
  id v17 = [v14 objectForKey:v15];
  uint64_t v18 = [v17 compare:v16];

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDetections, 0);
  objc_storeStrong((id *)&self->_detectionResultCollection, 0);
  objc_storeStrong((id *)&self->_audioRingBuffer, 0);
  objc_storeStrong((id *)&self->_fileProcessingQueue, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
}

+ (void)_directory
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_226F20000, v0, v1, "Creating Ultron Directory", v2, v3, v4, v5, v6);
}

- (void)listenEngineFailedToStartWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_226F20000, v0, OS_LOG_TYPE_ERROR, "Ultron Internal Recording Controller: Listen Engine failed to start.", v1, 2u);
}

- (void)saveDetectionResult:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [a2 confidence];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_226F20000, a3, OS_LOG_TYPE_DEBUG, "Beginning audio save for: %@ with confidence %f", (uint8_t *)&v6, 0x16u);
}

- (void)_recordResultToFile:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v2, v3, "Recording result %@ to file.", v4, v5, v6, v7, v8);
}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 identifier];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Unalbe to create JSON to write file for detection %@", v4, 0xCu);
}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_83_cold_1(char a1, uint64_t *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  v4[0] = 67109378;
  v4[1] = a1 & 1;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_226F20000, log, OS_LOG_TYPE_DEBUG, "Wrote data %d at %@.", (uint8_t *)v4, 0x12u);
}

@end