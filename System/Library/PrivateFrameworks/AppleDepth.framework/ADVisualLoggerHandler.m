@interface ADVisualLoggerHandler
- (ADVisualLoggerHandler)initWithName:(id)a3;
- (id)name;
- (int64_t)removeFileSettings;
- (int64_t)removeHostSettings;
- (int64_t)setHostName:(id)a3;
- (int64_t)setLogFolder:(id)a3;
- (uint64_t)logMatrix4x3:(double)a3 name:(double)a4 timestamp:(double)a5;
- (void)dealloc;
- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6;
- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)postDisable;
- (void)preEnable;
@end

@implementation ADVisualLoggerHandler

- (id)name
{
  return *(id *)&self->_synchronousFileLogging;
}

- (ADVisualLoggerHandler)initWithName:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!MEMORY[0x263F84C50])
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Skipping VisualLogger creation as it is not availiable on this platform", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Skipping VisualLogger creation as it is not availiable on this platform", buf, 2u);
    }
    goto LABEL_12;
  }
  v12.receiver = self;
  v12.super_class = (Class)ADVisualLoggerHandler;
  v5 = [(ADVisualLoggerHandler *)&v12 init];
  self = v5;
  if (v5)
  {
    *(&v5->super._humanReadableFormat + 1) = 0;
    uint64_t v6 = [NSString stringWithFormat:@"appledepth.vz.%@", v4];
    v7 = *(void **)&self->_synchronousFileLogging;
    *(void *)&self->_synchronousFileLogging = v6;

    v8 = (NSString *)MEMORY[0x2166C5B60]();
    self->_loggerName = v8;
    if (!v8)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)&self->_synchronousFileLogging;
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "created logger handler %@", buf, 0xCu);
    }
  }
  self = self;
  v10 = self;
LABEL_13:

  return v10;
}

- (void).cxx_destruct
{
}

- (uint64_t)logMatrix4x3:(double)a3 name:(double)a4 timestamp:(double)a5
{
  return objc_msgSend(a1, "logMatrix4x4:name:timestamp:", a3, a4, a5, a6);
}

- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  if (a3)
  {
    obj = self;
    objc_sync_enter(obj);
    objc_sync_exit(obj);
  }
}

- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8 = a3;
  if (v8)
  {
    id v10 = v8;
    uint64_t v9 = [v8 dictionaryRepresentation];
    [(ADVisualLoggerHandler *)self logDictionary:v9 name:a4 timestamp:a5];

    id v8 = v10;
  }
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    VZDataInfoCreate();
    VZDataInfoSetTimestampMachContinuousNanoseconds();
    VZDataInfoSetName();
    id v10 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
    uint64_t BlobWithCFData = VZDataCreateBlobWithCFData();
    if (BlobWithCFData)
    {
      objc_msgSend(*(id *)&v9->_synchronousFileLogging, "stringByAppendingFormat:", @".%s", a5);
      id v12 = objc_claimAutoreleasedReturnValue();
      [v12 UTF8String];
      VZLoggerLogData();
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v14 = BlobWithCFData;
      __int16 v15 = 2114;
      uint64_t v16 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADVisualLoggerHandler failed logging raw buffer. data:%p, Error: %{public}@", buf, 0x16u);
    }
    VZRelease();
    VZRelease();

    objc_sync_exit(v9);
  }
}

- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  v12[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    v11 = @"value";
    v12[0] = v8;
    id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(ADVisualLoggerHandler *)self logDictionary:v10 name:a4 timestamp:a5];
  }
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8 = a3;
  if (v8)
  {
    id v10 = v8;
    uint64_t v9 = [v8 dictionaryRepresentation];
    [(ADVisualLoggerHandler *)self logDictionary:v9 name:a4 timestamp:a5];

    id v8 = v10;
  }
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v7 = self;
    objc_sync_enter(v7);
    CVPixelBufferRef texture = a3;
    v19 = 0;
    unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (CVPixelBufferIsPlanar(a3)
      && (CVPixelBufferRef texture = PixelBufferUtils::createConvertedPixelBufferFormat(a3, (__CVBuffer *)0x42475241, (__CVBuffer *)1)) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
        uint64_t v17 = v23 >= 0 ? buf : *(unsigned char **)buf;
        *(_DWORD *)v24 = 136446210;
        v25 = v17;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADVisualLoggerHandler failed logging pixel buffer with format %{public}s", v24, 0xCu);
        if (v23 < 0) {
          operator delete(*(void **)buf);
        }
      }
    }
    else
    {
      if (PixelFormatType == 825306677
        || PixelFormatType == 1932996149
        || PixelFormatType == 825437747)
      {
        CVPixelBufferRetain(a3);
        CVPixelBufferLockBaseAddress(a3, 1uLL);
        size_t Width = CVPixelBufferGetWidth(a3);
        size_t Height = CVPixelBufferGetHeight(a3);
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x62313667u, BaseAddress, BytesPerRow, (CVPixelBufferReleaseBytesCallback)pixelBufferDeallocator, a3, 0, &texture);
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      }
      VZDataInfoCreate();
      VZDataInfoSetTimestampMachContinuousNanoseconds();
      VZDataInfoSetName();
      uint64_t ImageWithCVPixelBuffer = VZDataCreateImageWithCVPixelBuffer();
      uint64_t v14 = ImageWithCVPixelBuffer;
      __int16 v15 = v19;
      if (v19 || !ImageWithCVPixelBuffer)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v14;
          __int16 v21 = 2114;
          v22 = v15;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADVisualLoggerHandler failed logging pixel buffer. data:%p, Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        objc_msgSend(*(id *)&v7->_synchronousFileLogging, "stringByAppendingFormat:", @".%s", a4);
        id v16 = objc_claimAutoreleasedReturnValue();
        [v16 UTF8String];
        VZLoggerLogData();
      }
      VZRelease();
      VZRelease();
      if (texture != a3) {
        CVPixelBufferRelease(texture);
      }
    }
    objc_sync_exit(v7);
  }
}

- (int64_t)removeHostSettings
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!self->_loggerName) {
    return -22961;
  }
  if (!self->_fileDestination) {
    return 0;
  }
  v3 = self;
  objc_sync_enter(v3);
  VZLoggerRemoveDestination();
  VZRelease();
  int64_t v4 = 0;
  self->_fileDestination = 0;
  objc_sync_exit(v3);

  return v4;
}

- (int64_t)setHostName:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    if (v5->_fileDestination)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADLogManager cannot start network logging, network destination already set", buf, 2u);
      }
      int64_t v6 = -22961;
    }
    else
    {
      VZClientOptionsCreate();
      [v4 UTF8String];
      VZClientOptionsSetTcpIpAddress();
      v5->_fileDestination = (VZDestination *)VZDestinationCreateWithClient();
      VZRelease();
      VZLoggerAddDestination();
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = [(ADVisualLoggerHandler *)v5 removeHostSettings];
  }
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)removeFileSettings
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_loggerName && v2->_visualLogger)
  {
    VZLoggerRemoveDestination();
    VZRelease();
    v2->_visualLogger = 0;
  }
  objc_sync_exit(v2);

  return 0;
}

- (int64_t)setLogFolder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  int64_t v6 = [(ADVisualLoggerHandler *)v5 removeFileSettings];
  if (!v6)
  {
    if (v4)
    {
      v7 = [MEMORY[0x263F08850] defaultManager];
      id v15 = 0;
      char v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v9 = v15;
      if (v8)
      {
        id v10 = [v4 stringByAppendingPathComponent:@"sequence.csv"];
        [v7 removeItemAtPath:v10 error:0];

        v11 = [v4 stringByAppendingPathComponent:@"info.json"];
        [v7 removeItemAtPath:v11 error:0];

        id v12 = [*(id *)&v5->_synchronousFileLogging stringByReplacingOccurrencesOfString:@"." withString:@"/"];
        v13 = [v4 stringByAppendingPathComponent:v12];
        [v7 removeItemAtPath:v13 error:0];

        if (v5->_visualLogger)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot start file logging. destination already set", buf, 2u);
          }
          int64_t v6 = -22961;
        }
        else
        {
          VZFileExportOptionsCreate();
          if (*(&v5->super._humanReadableFormat + 1)) {
            VZFileExportOptionsSetAsyncQueueMaxElementCount();
          }
          VZLogMessageFilterCreate();
          VZDataGetDictionaryDataTypeID();
          VZLogMessageFilterRequireDataTypeIDExact();
          VZFileExportOptionsAddFilteredStoragePreference();
          VZLogMessageFilterCreate();
          VZDataGetMeshDataTypeID();
          VZLogMessageFilterRequireDataTypeIDExact();
          VZFileExportOptionsAddFilteredStoragePreference();
          VZLogMessageFilterCreate();
          VZFileExportOptionsAddFilteredStoragePreference();
          [v4 UTF8String];
          v5->_visualLogger = (VZLogger *)VZDestinationCreateWithFileExporter();
          VZRelease();
          VZRelease();
          VZRelease();
          VZRelease();
          VZLoggerAddDestination();
          int64_t v6 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v17 = v4;
          __int16 v18 = 2114;
          id v19 = v9;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADLogManager cannot create logger directory \"%{public}@\". Error: %{public}@", buf, 0x16u);
        }
        int64_t v6 = -22950;
      }
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)postDisable
{
  obj = self;
  objc_sync_enter(obj);
  [*(id *)&obj->_synchronousFileLogging UTF8String];
  VZLoggerDisable();
  objc_sync_exit(obj);
}

- (void)preEnable
{
  obj = self;
  objc_sync_enter(obj);
  [*(id *)&obj->_synchronousFileLogging UTF8String];
  VZLoggerEnable();
  objc_sync_exit(obj);
}

- (void)dealloc
{
  if (MEMORY[0x263F84C50])
  {
    [(ADVisualLoggerHandler *)self removeFileSettings];
    [(ADVisualLoggerHandler *)self removeHostSettings];
    VZRelease();
    VZRelease();
    VZRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)ADVisualLoggerHandler;
  [(ADVisualLoggerHandler *)&v3 dealloc];
}

@end