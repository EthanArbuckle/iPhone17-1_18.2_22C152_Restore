@interface AVCScreenCaptureConfiguration
- (AVCScreenCaptureConfiguration)init;
- (AVCScreenCaptureConfiguration)initWithHeight:(unsigned int)a3 width:(unsigned int)a4 framerate:(unsigned int)a5 screenCaptureDisplayID:(unsigned int)a6;
- (BOOL)isCursorCaptured;
- (BOOL)isWindowed;
- (BOOL)shouldRunInProcess;
- (NSArray)excludedApplicationBundleIDs;
- (NSString)selectiveScreenUUID;
- (unsigned)displayMode;
- (unsigned)frameRate;
- (unsigned)height;
- (unsigned)screenCaptureDisplayID;
- (unsigned)selectiveSharingPort;
- (unsigned)width;
- (void)dealloc;
- (void)setDisplayMode:(unsigned int)a3;
- (void)setExcludedApplicationBundleIDs:(id)a3;
- (void)setFrameRate:(unsigned int)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setIsCursorCaptured:(BOOL)a3;
- (void)setIsWindowed:(BOOL)a3;
- (void)setScreenCaptureDisplayID:(unsigned int)a3;
- (void)setSelectiveScreenUUID:(id)a3;
- (void)setSelectiveSharingPort:(unsigned int)a3;
- (void)setShouldRunInProcess:(BOOL)a3;
- (void)setWidth:(unsigned int)a3;
@end

@implementation AVCScreenCaptureConfiguration

- (AVCScreenCaptureConfiguration)initWithHeight:(unsigned int)a3 width:(unsigned int)a4 framerate:(unsigned int)a5 screenCaptureDisplayID:(unsigned int)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      v18 = "-[AVCScreenCaptureConfiguration initWithHeight:width:framerate:screenCaptureDisplayID:]";
      __int16 v19 = 1024;
      int v20 = 16;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCScreenCaptureConfiguration;
  result = [(AVCScreenCaptureConfiguration *)&v14 init];
  if (result)
  {
    result->_height = a3;
    result->_width = a4;
    result->_frameRate = a5;
    result->_screenCaptureDisplayID = a6;
  }
  return result;
}

- (AVCScreenCaptureConfiguration)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[AVCScreenCaptureConfiguration init]";
      __int16 v11 = 1024;
      int v12 = 29;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCScreenCaptureConfiguration;
  result = [(AVCScreenCaptureConfiguration *)&v6 init];
  if (result)
  {
    result->_isCursorCaptured = 1;
    result->_excludedApplicationBundleIDs = 0;
    result->_displayMode = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVCScreenCaptureConfiguration dealloc]";
      __int16 v10 = 1024;
      int v11 = 40;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCScreenCaptureConfiguration;
  [(AVCScreenCaptureConfiguration *)&v5 dealloc];
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (BOOL)isWindowed
{
  return self->_isWindowed;
}

- (void)setIsWindowed:(BOOL)a3
{
  self->_isWindowed = a3;
}

- (unsigned)screenCaptureDisplayID
{
  return self->_screenCaptureDisplayID;
}

- (void)setScreenCaptureDisplayID:(unsigned int)a3
{
  self->_screenCaptureDisplayID = a3;
}

- (BOOL)isCursorCaptured
{
  return self->_isCursorCaptured;
}

- (void)setIsCursorCaptured:(BOOL)a3
{
  self->_isCursorCaptured = a3;
}

- (NSArray)excludedApplicationBundleIDs
{
  return self->_excludedApplicationBundleIDs;
}

- (void)setExcludedApplicationBundleIDs:(id)a3
{
}

- (BOOL)shouldRunInProcess
{
  return self->_shouldRunInProcess;
}

- (void)setShouldRunInProcess:(BOOL)a3
{
  self->_shouldRunInProcess = a3;
}

- (unsigned)selectiveSharingPort
{
  return self->_selectiveSharingPort;
}

- (void)setSelectiveSharingPort:(unsigned int)a3
{
  self->_selectiveSharingPort = a3;
}

- (NSString)selectiveScreenUUID
{
  return self->_selectiveScreenUUID;
}

- (void)setSelectiveScreenUUID:(id)a3
{
}

- (unsigned)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unsigned int)a3
{
  self->_displayMode = a3;
}

@end