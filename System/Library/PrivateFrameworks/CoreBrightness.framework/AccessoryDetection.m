@interface AccessoryDetection
- (AccessoryDetection)initWithAABC:(void *)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation AccessoryDetection

- (AccessoryDetection)initWithAABC:(void *)a3
{
  v9 = self;
  SEL v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AccessoryDetection;
  v9 = [(AccessoryDetection *)&v6 init];
  os_log_t v3 = os_log_create("com.apple.CoreBrightness.AccessoryDetection", "default");
  v9->_logHandle = (OS_os_log *)v3;
  uint64_t v4 = [MEMORY[0x1E4F5B178] sharedInstance];
  v9->_connection = (ACCConnectionInfo *)v4;
  v9->_aabc = v7;
  return v9;
}

- (void)start
{
  v11 = self;
  SEL v10 = a2;
  char v9 = 0;
  char v9 = [(ACCConnectionInfo *)self->_connection registerDelegate:self] & 1;
  if (!v9)
  {
    SEL v8 = 0;
    if (v11->_logHandle)
    {
      logHandle = v11->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    SEL v8 = logHandle;
    char v7 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v8;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_error_impl(&dword_1BA438000, log, type, "ACCConnectionInfo delegate registration failed", v6, 2u);
    }
  }
}

- (void)stop
{
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27 = self;
  SEL v26 = a2;
  id v25 = a3;
  int v24 = a4;
  int v23 = a5;
  id v22 = a6;
  id v21 = a7;
  os_log_t v20 = 0;
  if (self->_logHandle)
  {
    logHandle = v27->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v20 = logHandle;
  os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v28, [v25 UTF8String], (uint64_t)v22);
    _os_log_debug_impl(&dword_1BA438000, v20, v19, "CoreAccessories endpoint %s attached with properties=%@", v28, 0x16u);
  }
  if (v24 == 13)
  {
    if (v22)
    {
      CFNumberRef v18 = 0;
      CFNumberRef v18 = (CFNumberRef)[v22 objectForKey:*MEMORY[0x1E4F5B1D8]];
      if (v18)
      {
        int valuePtr = 0;
        CFNumberGetValue(v18, kCFNumberIntType, &valuePtr);
        if (valuePtr == 86)
        {
          os_log_t oslog = 0;
          if (v27->_logHandle)
          {
            v11 = v27->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v10 = init_default_corebrightness_log();
            }
            v11 = v10;
          }
          os_log_t oslog = v11;
          os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            SEL v8 = oslog;
            os_log_type_t v9 = v15;
            __os_log_helper_16_0_0(v14);
            _os_log_debug_impl(&dword_1BA438000, v8, v9, "Sleeve attached", v14, 2u);
          }
          char v7 = (NSString *)v25;
          v27->_sleeveUUID = v7;
          AABC::SetDeviceInSleeve((NSObject **)v27->_aabc, 1);
        }
      }
    }
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFNumberRef v18 = self;
  SEL v17 = a2;
  id v16 = a3;
  id v15 = a4;
  os_log_t v14 = 0;
  if (self->_logHandle)
  {
    logHandle = v18->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v14 = logHandle;
  os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v19, [v16 UTF8String]);
    _os_log_debug_impl(&dword_1BA438000, v14, v13, "CoreAccessories endpoint %s detached", v19, 0xCu);
  }
  if (v18->_sleeveUUID && ([v16 isEqualToString:v18->_sleeveUUID] & 1) != 0)
  {

    v18->_sleeveUUID = 0;
    AABC::SetDeviceInSleeve((NSObject **)v18->_aabc, 0);
    v12 = 0;
    if (v18->_logHandle)
    {
      char v7 = v18->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      char v7 = v6;
    }
    v12 = v7;
    char v11 = 2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = v12;
      os_log_type_t v5 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_debug_impl(&dword_1BA438000, v4, v5, "Sleeve detached", v10, 2u);
    }
  }
}

@end