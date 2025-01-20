@interface ADFileLoggerHandler
- (ADFileLoggerHandler)init;
- (ADFileLoggerHandler)initWithName:(id)a3;
- (id)getFullPath:(const char *)a3 timestamp:(double)a4 extension:(const char *)a5;
- (id)name;
- (int64_t)setLogFolder:(id)a3;
- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logMatrix4x3:(__n128)a3 name:(__n128)a4 timestamp:(__n128)a5;
- (void)logMatrix4x4:(__n128)a3 name:(__n128)a4 timestamp:(__n128)a5;
- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6;
- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5;
@end

@implementation ADFileLoggerHandler

- (id)name
{
  return self->_loggerName;
}

- (ADFileLoggerHandler)initWithName:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ADFileLoggerHandler;
  v6 = [(ADFileLoggerHandler *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shortName, a3);
    uint64_t v8 = [NSString stringWithFormat:@"appledepth.fl.%@", v5];
    loggerName = v7->_loggerName;
    v7->_loggerName = (NSString *)v8;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v7->_loggerName;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "created logger handler %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerName, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_logFolder, 0);
}

- (void)logMatrix4x3:(__n128)a3 name:(__n128)a4 timestamp:(__n128)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1[2])
  {
    *(__n128 *)uint64_t v15 = a2;
    *(__n128 *)&v15[16] = a3;
    *(__n128 *)&v15[32] = a4;
    *(__n128 *)&v15[48] = a5;
    if ([a1 humanReadableFormat]) {
      [a1 getFullPath:a8 timestamp:"json" extension:a6];
    }
    else {
    id v11 = [a1 getFullPath:a8 timestamp:"bin" extension:a6];
    }
    objc_super v12 = (ADCommonUtils *)[v11 UTF8String];
    char v14 = ADCommonUtils::extrinsicsToFile(v12, v13, *(simd_float4x4 *)v15);

    if ((v14 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = a8;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to logMatrix4x3 for %s", buf, 0xCu);
    }
  }
}

- (void)logMatrix4x4:(__n128)a3 name:(__n128)a4 timestamp:(__n128)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1[2])
  {
    *(__n128 *)uint64_t v15 = a2;
    *(__n128 *)&v15[16] = a3;
    *(__n128 *)&v15[32] = a4;
    *(__n128 *)&v15[48] = a5;
    if ([a1 humanReadableFormat]) {
      [a1 getFullPath:a8 timestamp:"json" extension:a6];
    }
    else {
    id v11 = [a1 getFullPath:a8 timestamp:"bin" extension:a6];
    }
    objc_super v12 = (ADCommonUtils *)[v11 UTF8String];
    char v14 = ADCommonUtils::extrinsicsToFile(v12, v13, *(simd_float4x4 *)v15);

    if ((v14 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = a8;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to logMatrix4x4 for %s", buf, 0xCu);
    }
  }
}

- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_logFolder)
  {
    v9 = NSURL;
    v10 = [(ADFileLoggerHandler *)self getFullPath:a4 timestamp:"plist" extension:a5];
    id v11 = [v9 fileURLWithPath:v10];
    char v12 = [v8 writeToURL:v11 atomically:1];

    if ((v12 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      char v14 = a4;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to logDictionary for %s", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_logFolder)
  {
    if ([(ADLogManagerHandler *)self humanReadableFormat]) {
      [(ADFileLoggerHandler *)self getFullPath:a4 timestamp:"json" extension:a5];
    }
    else {
    v9 = [(ADFileLoggerHandler *)self getFullPath:a4 timestamp:"plist" extension:a5];
    }
    char v10 = [v8 writeToFile:v9 atomically:1];

    if ((v10 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      char v12 = a4;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to logCalibration for %s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6
{
  if (!self->_logFolder) {
    return;
  }
  id v14 = [(ADFileLoggerHandler *)self getFullPath:a5 timestamp:"raw" extension:a6];
  id v8 = (const char *)[v14 UTF8String];
  size_t v9 = strlen(v8);
  if (v9 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  char v10 = (void *)v9;
  if (v9 >= 0x17)
  {
    uint64_t v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v12 = v9 | 7;
    }
    uint64_t v13 = v12 + 1;
    int v11 = (void **)operator new(v12 + 1);
    __dst[1] = v10;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v11;
  }
  else
  {
    HIBYTE(v16) = v9;
    int v11 = __dst;
    if (!v9) {
      goto LABEL_11;
    }
  }
  memmove(v11, v8, (size_t)v10);
LABEL_11:
  *((unsigned char *)v10 + (void)v11) = 0;
  dumpRawImageFile((uint64_t)__dst, a3, a4);
  if (SHIBYTE(v16) < 0) {
    operator delete(__dst[0]);
  }
}

- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_logFolder)
  {
    size_t v9 = [(ADFileLoggerHandler *)self getFullPath:a4 timestamp:"txt" extension:a5];
    char v10 = [v8 writeToFile:v9 atomically:1 encoding:4 error:0];

    if ((v10 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = a4;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to logString %s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_logFolder)
  {
    if ([(ADLogManagerHandler *)self humanReadableFormat]) {
      [(ADFileLoggerHandler *)self getFullPath:a4 timestamp:"csv" extension:a5];
    }
    else {
    size_t v9 = [(ADFileLoggerHandler *)self getFullPath:a4 timestamp:"plist" extension:a5];
    }
    char v10 = [v8 writeToFile:v9 atomically:1];

    if ((v10 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = a4;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to logPointCloud %s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5
{
  if (self->_logFolder)
  {
    id v8 = [(ADFileLoggerHandler *)self getFullPath:a4 timestamp:0 extension:a5];
    v6 = (PixelBufferUtils *)[v8 UTF8String];
    PixelBufferUtils::pixelBufferToRawFile(v6, a3, v7);
  }
}

- (int64_t)setLogFolder:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stringByAppendingPathComponent:self->_shortName];
  logFolder = self->_logFolder;
  self->_logFolder = v5;

  if (self->_logFolder)
  {
    v7 = [MEMORY[0x263F08850] defaultManager];
    id v8 = self->_logFolder;
    id v14 = 0;
    char v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v10 = v14;
    if (v9)
    {
      int64_t v11 = 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = self->_logFolder;
        *(_DWORD *)buf = 138543618;
        unint64_t v16 = v13;
        __int16 v17 = 2114;
        id v18 = v10;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADFileLoggerHandler cannot create logger directory \"%{public}@\". Error: %{public}@", buf, 0x16u);
      }
      int64_t v11 = -22950;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (ADFileLoggerHandler)init
{
  return [(ADFileLoggerHandler *)self initWithName:@"logger"];
}

- (id)getFullPath:(const char *)a3 timestamp:(double)a4 extension:(const char *)a5
{
  logFolder = self->_logFolder;
  double v6 = a4 * 1000.0;
  if (a5) {
    [NSString stringWithFormat:@"%@/%010llu_%s.%s", logFolder, (unint64_t)v6, a3, a5];
  }
  else {
  v7 = [NSString stringWithFormat:@"%@/%010llu_%s", logFolder, (unint64_t)v6, a3, v9];
  }
  return v7;
}

@end