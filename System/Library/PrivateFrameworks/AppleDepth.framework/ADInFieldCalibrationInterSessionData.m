@interface ADInFieldCalibrationInterSessionData
+ (id)interSessionDataFromFile:(id)a3;
- (ADInFieldCalibrationInterSessionData)init;
- (ADInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3;
- (BOOL)reset;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (id)persistenceData;
- (int64_t)insertEntryAndCalculate:(id)a3 withWeight:(double)a4 toResult:(id *)a5;
- (unsigned)version;
- (void)setVersion:(unsigned int)a3;
@end

@implementation ADInFieldCalibrationInterSessionData

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (ADInFieldCalibrationInterSessionData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADInFieldCalibrationInterSessionData;
  v2 = [(ADInFieldCalibrationInterSessionData *)&v6 init];
  if (v2)
  {
    v3 = (ADInterSessionFilterParameters *)objc_alloc_init(MEMORY[0x263F26C88]);
    isfParameters = v2->_isfParameters;
    v2->_isfParameters = v3;

    v2->_version = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isf, 0);
  objc_storeStrong((id *)&self->_isfParameters, 0);
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      v8 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
      __int16 v9 = 2082;
      v10 = "-[ADInFieldCalibrationInterSessionData writeToFile:atomically:]";
      v4 = &_os_log_internal;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_215F16000, v4, v5, "Deprecated function was called: %{public}s : %{public}s", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446466;
    v8 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
    __int16 v9 = 2082;
    v10 = "-[ADInFieldCalibrationInterSessionData writeToFile:atomically:]";
    v4 = &_os_log_internal;
    os_log_type_t v5 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
  return 0;
}

- (int64_t)insertEntryAndCalculate:(id)a3 withWeight:(double)a4 toResult:(id *)a5
{
  id v6 = [(ADInterSessionFilter *)self->_isf insertEntryAndCalculate:a3 withWeight:a4];
  *a5 = v6;
  if (v6) {
    return 0;
  }
  else {
    return -22950;
  }
}

- (BOOL)reset
{
  return 0;
}

- (ADInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3
{
  v4 = (ADInFieldCalibrationInterSessionData *)objc_opt_new();

  return v4;
}

- (id)persistenceData
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)interSessionDataFromFile:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      int v7 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
      __int16 v8 = 2082;
      __int16 v9 = "+[ADInFieldCalibrationInterSessionData interSessionDataFromFile:]";
      v3 = &_os_log_internal;
      os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_215F16000, v3, v4, "Deprecated function was called: %{public}s : %{public}s", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446466;
    int v7 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
    __int16 v8 = 2082;
    __int16 v9 = "+[ADInFieldCalibrationInterSessionData interSessionDataFromFile:]";
    v3 = &_os_log_internal;
    os_log_type_t v4 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
  return 0;
}

@end