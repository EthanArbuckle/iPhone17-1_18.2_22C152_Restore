@interface CESRDictationOnDeviceSampling
+ (BOOL)_isInternalInstall;
+ (BOOL)_isSamplingAllowed;
+ (id)_readDictationSampledPlist;
+ (id)sharedManager;
- (BOOL)_isSamplingDateCurrent;
- (BOOL)isDeviceSampledFromConfig;
- (BOOL)isRequestSelectedForSamplingFromConfigForLanguage:(id)a3;
- (CESRDictationOnDeviceSampling)init;
- (NSDate)samplingDate;
- (NSMutableDictionary)dictationSamplingVariables;
- (OS_dispatch_queue)fileQueue;
- (int64_t)numberOfRequestsTillNow;
- (void)_setRequestCount:(int64_t)a3;
- (void)_setSamplingDateToCurrentDate;
- (void)_updateDictationSampledPlist;
- (void)incrementSampledRequestCount;
- (void)setDictationSamplingVariables:(id)a3;
- (void)setFileQueue:(id)a3;
- (void)setIsDeviceSampledFromConfig:(BOOL)a3;
- (void)setNumberOfRequestsTillNow:(int64_t)a3;
- (void)setSamplingDate:(id)a3;
@end

@implementation CESRDictationOnDeviceSampling

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_storeStrong((id *)&self->_dictationSamplingVariables, 0);

  objc_storeStrong((id *)&self->_samplingDate, 0);
}

- (void)setFileQueue:(id)a3
{
}

- (OS_dispatch_queue)fileQueue
{
  return self->_fileQueue;
}

- (void)setIsDeviceSampledFromConfig:(BOOL)a3
{
  self->_isDeviceSampledFromConfig = a3;
}

- (BOOL)isDeviceSampledFromConfig
{
  return self->_isDeviceSampledFromConfig;
}

- (void)setDictationSamplingVariables:(id)a3
{
}

- (NSMutableDictionary)dictationSamplingVariables
{
  return self->_dictationSamplingVariables;
}

- (void)setSamplingDate:(id)a3
{
}

- (NSDate)samplingDate
{
  return self->_samplingDate;
}

- (void)setNumberOfRequestsTillNow:(int64_t)a3
{
  self->_numberOfRequestsTillNow = a3;
}

- (int64_t)numberOfRequestsTillNow
{
  return self->_numberOfRequestsTillNow;
}

- (BOOL)_isSamplingDateCurrent
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  LOBYTE(self) = [v3 isDateInToday:self->_samplingDate];

  return (char)self;
}

- (void)_setSamplingDateToCurrentDate
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  samplingDate = self->_samplingDate;
  self->_samplingDate = v3;

  v6 = self->_samplingDate;
  dictationSamplingVariables = self->_dictationSamplingVariables;
  id v7 = [MEMORY[0x1E4F4E460] sampledCurrentSamplingDateKey];
  [(NSMutableDictionary *)dictationSamplingVariables setObject:v6 forKeyedSubscript:v7];
}

- (void)_setRequestCount:(int64_t)a3
{
  self->_numberOfRequestsTillNow = a3;
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_dictationSamplingVariables setObject:v4 forKeyedSubscript:@"numberOfRequestsTillNow"];
}

- (void)_updateDictationSampledPlist
{
  v3 = (void *)[(NSMutableDictionary *)self->_dictationSamplingVariables copy];
  fileQueue = self->_fileQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CESRDictationOnDeviceSampling__updateDictationSampledPlist__block_invoke;
  block[3] = &unk_1E61C38C0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(fileQueue, block);
}

void __61__CESRDictationOnDeviceSampling__updateDictationSampledPlist__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4E460] createSamplingDirectory];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4E460] sampledPlistFileName];
    id v4 = [v2 stringByAppendingPathComponent:v3];

    id v5 = *(void **)(a1 + 32);
    v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    id v14 = 0;
    int v7 = [v5 writeToURL:v6 error:&v14];
    id v8 = v14;

    v9 = *MEMORY[0x1E4F4E380];
    v10 = *MEMORY[0x1E4F4E380];
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[CESRDictationOnDeviceSampling _updateDictationSampledPlist]_block_invoke";
        __int16 v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Dictation Sampling: Wrote updated sampling variables to plist: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = v9;
      v13 = [v8 description];
      *(_DWORD *)buf = 136315650;
      v16 = "-[CESRDictationOnDeviceSampling _updateDictationSampledPlist]_block_invoke";
      __int16 v17 = 2112;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_error_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Failed to write sampling variables to plist: %@, error: %@", buf, 0x20u);
    }
  }
  else
  {
    v11 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CESRDictationOnDeviceSampling _updateDictationSampledPlist]_block_invoke";
      _os_log_error_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Failed to create the sampling directory.", buf, 0xCu);
    }
  }
}

- (BOOL)isRequestSelectedForSamplingFromConfigForLanguage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!+[CESRDictationOnDeviceSampling _isSamplingAllowed])return 0; {
  if (a3
  }
    && (!self->_numberOfRequestsTillNow
     || ![(CESRDictationOnDeviceSampling *)self _isSamplingDateCurrent]))
  {
    self->_BOOL isDeviceSampledFromConfig = 1;
    id v5 = [NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->_dictationSamplingVariables setObject:v5 forKeyedSubscript:@"isDeviceSampledFromConfig"];

    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      BOOL isDeviceSampledFromConfig = self->_isDeviceSampledFromConfig;
      int v18 = 136315394;
      __int16 v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      __int16 v20 = 1024;
      BOOL v21 = isDeviceSampledFromConfig;
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Dictation Sampling: BOOL isDeviceSampledFromConfig = %d", (uint8_t *)&v18, 0x12u);
    }
  }
  if (!self->_isDeviceSampledFromConfig
    && !+[CESRDictationOnDeviceSampling _isInternalInstall])
  {
    id v14 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      __int16 v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v15 = "%s Dictation Sampling: Device is not participating in sampling today.";
      v16 = v14;
LABEL_25:
      _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, 0xCu);
    }
    return 0;
  }
  if (![(CESRDictationOnDeviceSampling *)self _isSamplingDateCurrent])
  {
    [(CESRDictationOnDeviceSampling *)self _setSamplingDateToCurrentDate];
    [(CESRDictationOnDeviceSampling *)self _setRequestCount:0];
  }
  if (+[CESRDictationOnDeviceSampling _isInternalInstall])
  {
    id v8 = *MEMORY[0x1E4F4E380];
    BOOL v9 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      __int16 v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v10 = "%s Dictation Sampling: Selected for sampling. Sampling from an internal install.";
LABEL_22:
      _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v18, 0xCu);
      return v9;
    }
    return v9;
  }
  int64_t numberOfRequestsTillNow = self->_numberOfRequestsTillNow;
  if (numberOfRequestsTillNow)
  {
    signed int v12 = arc4random_uniform(numberOfRequestsTillNow + 1) + 1;
    id v8 = *MEMORY[0x1E4F4E380];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
    if (v12 <= 1)
    {
      if (!v13) {
        return 1;
      }
      int v18 = 136315138;
      __int16 v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v10 = "%s Dictation Sampling: Selected for sampling.";
      BOOL v9 = 1;
      goto LABEL_22;
    }
    if (v13)
    {
      int v18 = 136315138;
      __int16 v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
      v15 = "%s Dictation Sampling: Not selected for sampling.";
      v16 = v8;
      goto LABEL_25;
    }
    return 0;
  }
  id v8 = *MEMORY[0x1E4F4E380];
  BOOL v9 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    __int16 v19 = "-[CESRDictationOnDeviceSampling isRequestSelectedForSamplingFromConfigForLanguage:]";
    v10 = "%s Dictation Sampling: Selected for sampling. The count of sampled requests was 0.";
    goto LABEL_22;
  }
  return v9;
}

- (void)incrementSampledRequestCount
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  ++self->_numberOfRequestsTillNow;
  -[CESRDictationOnDeviceSampling _setRequestCount:](self, "_setRequestCount:");
  [(CESRDictationOnDeviceSampling *)self _updateDictationSampledPlist];
  v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[CESRDictationOnDeviceSampling incrementSampledRequestCount]";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Dictation Sampling: Incremented the count of sampled requests by 1.", (uint8_t *)&v4, 0xCu);
  }
}

- (CESRDictationOnDeviceSampling)init
{
  v17.receiver = self;
  v17.super_class = (Class)CESRDictationOnDeviceSampling;
  v2 = [(CESRDictationOnDeviceSampling *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("CESRDictationOnDeviceSampling file queue", v3);
    fileQueue = v2->_fileQueue;
    v2->_fileQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [(id)objc_opt_class() _readDictationSampledPlist];
    dictationSamplingVariables = v2->_dictationSamplingVariables;
    v2->_dictationSamplingVariables = (NSMutableDictionary *)v6;

    v2->_char isDeviceSampledFromConfig = 1;
    if ([(NSMutableDictionary *)v2->_dictationSamplingVariables count])
    {
      id v8 = v2->_dictationSamplingVariables;
      BOOL v9 = [MEMORY[0x1E4F4E460] sampledCurrentSamplingDateKey];
      uint64_t v10 = [(NSMutableDictionary *)v8 objectForKey:v9];
      samplingDate = v2->_samplingDate;
      v2->_samplingDate = (NSDate *)v10;

      signed int v12 = [(NSMutableDictionary *)v2->_dictationSamplingVariables objectForKey:@"numberOfRequestsTillNow"];
      v2->_int64_t numberOfRequestsTillNow = [v12 integerValue];

      BOOL v13 = [(NSMutableDictionary *)v2->_dictationSamplingVariables objectForKey:@"isDeviceSampledFromConfig"];
      id v14 = v13;
      if (v13) {
        char isDeviceSampledFromConfig = [v13 BOOLValue];
      }
      else {
        char isDeviceSampledFromConfig = v2->_isDeviceSampledFromConfig;
      }
      v2->_char isDeviceSampledFromConfig = isDeviceSampledFromConfig;
    }
    else
    {
      [(CESRDictationOnDeviceSampling *)v2 _setSamplingDateToCurrentDate];
      [(CESRDictationOnDeviceSampling *)v2 _setRequestCount:0];
    }
  }
  return v2;
}

+ (id)_readDictationSampledPlist
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4E460] sampledLibraryDirectoryPath];
  v3 = [MEMORY[0x1E4F4E460] sampledPlistFileName];
  dispatch_queue_t v4 = [v2 stringByAppendingPathComponent:v3];

  id v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v13 = 0;
  int v7 = [v5 dictionaryWithContentsOfURL:v6 error:&v13];
  id v8 = v13;

  if (v8)
  {
    BOOL v9 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "+[CESRDictationOnDeviceSampling _readDictationSampledPlist]";
      __int16 v16 = 2112;
      objc_super v17 = v4;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Dictation Sampling: Failed to read plist at path: %@, error: %@", buf, 0x20u);
    }
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    uint64_t v10 = [v7 mutableCopy];
  }
  v11 = (void *)v10;

  return v11;
}

+ (BOOL)_isSamplingAllowed
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  if ([v2 isDictationOnDeviceSamplingDisabled])
  {
    v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "+[CESRDictationOnDeviceSampling _isSamplingAllowed]";
      dispatch_queue_t v4 = "%s Dictation Sampling: Not sampling. Sampling is explicitly disabled.";
LABEL_11:
      _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v7, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ([v2 isDictationHIPAACompliant])
  {
    v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "+[CESRDictationOnDeviceSampling _isSamplingAllowed]";
      dispatch_queue_t v4 = "%s Dictation Sampling: Not sampling. Request is HIPAA compliant.";
      goto LABEL_11;
    }
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  if ([v2 siriDataSharingOptInStatus] != 1)
  {
    v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "+[CESRDictationOnDeviceSampling _isSamplingAllowed]";
      dispatch_queue_t v4 = "%s Dictation Sampling: Not sampling. User is not opted-in.";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)_isInternalInstall
{
  if (_isInternalInstall_onceToken != -1) {
    dispatch_once(&_isInternalInstall_onceToken, &__block_literal_global_9);
  }
  return _isInternalInstall_isInternalInstall;
}

uint64_t __51__CESRDictationOnDeviceSampling__isInternalInstall__block_invoke()
{
  uint64_t result = AFIsInternalInstall();
  _isInternalInstall_isInternalInstall = result;
  return result;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_819 != -1) {
    dispatch_once(&sharedManager_onceToken_819, &__block_literal_global_820);
  }
  v2 = (void *)sharedManager_sharedMyManager_821;

  return v2;
}

uint64_t __46__CESRDictationOnDeviceSampling_sharedManager__block_invoke()
{
  sharedManager_sharedMyManager_821 = objc_alloc_init(CESRDictationOnDeviceSampling);

  return MEMORY[0x1F41817F8]();
}

@end