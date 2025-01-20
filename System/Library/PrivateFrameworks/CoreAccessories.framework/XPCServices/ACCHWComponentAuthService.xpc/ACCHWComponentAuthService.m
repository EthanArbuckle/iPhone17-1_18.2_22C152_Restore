unint64_t systemInfo_getCurrentUnixTime()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  v2 = v1;

  v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

void __systemInfo_isInternalBuild_block_invoke(id a1)
{
  systemInfo_isInternalBuild_internalBuild = MGGetBoolAnswer();
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_3);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke(id a1)
{
  double v1 = (const void *)MGCopyAnswer();
  if (v1)
  {
    double v2 = v1;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v1, @"Beta") != 0;
    CFRelease(v2);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_11);
  }
  return systemInfo_systemSupportsPearl_supportsPearl;
}

void __systemInfo_systemSupportsPearl_block_invoke(id a1)
{
  systemInfo_systemSupportsPearl_supportsPearl = MGGetBoolAnswer();
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_16);
  }
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

void __systemInfo_systemSupportsWAPI_block_invoke(id a1)
{
  systemInfo_systemSupportsWAPI_supportsWAPI = MGGetBoolAnswer();
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

id systemInfo_isHomePod()
{
  v0 = (void *)MGCopyAnswer();
  id v1 = [v0 isEqualToString:@"AudioAccessory"];

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  if (systemInfo_copyRegionCode_onceToken != -1) {
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_24);
  }
  if (systemInfo_copyRegionCode_regionCode)
  {
    CFTypeID v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID()) {
      return systemInfo_copyRegionCode_regionCode;
    }
  }
  uint64_t result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

void __systemInfo_copyRegionCode_block_invoke(id a1)
{
  systemInfo_copyRegionCode_regionCode = MGCopyAnswer();
}

const void *systemInfo_copyProductType()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    id v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    id v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  init_logging();
  AMFDRLogSetHandler();
  uint64_t v3 = gLogObjects;
  int v4 = gNumLogObjects;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      main_cold_1(v3, v4);
    }
    v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting xpc service", v11, 2u);
  }

  v8 = objc_opt_new();
  v9 = +[NSXPCListener serviceListener];
  [v9 setDelegate:v8];
  [v9 resume];

  return 0;
}

void _AMFDRLogHandler(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  CFTypeID v2 = objc_msgSend_setCertificate_;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = "<Undefined>";
        }
      }
      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    CFTypeID v2 = objc_msgSend_setCertificate_;
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 173);
    LODWORD(v12) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v10;
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 9, (uint64_t)_kLoggingModuleEntries);

  init_logging_signposts();
}

CFNumberRef acc_analytics_createBucketizedAnalyticEventDuration(unint64_t a1)
{
  if ((uint64_t)a1 > 299)
  {
    if (a1 > 0x258)
    {
      if (a1 > 0x708)
      {
        if (a1 > 0xE10)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0xA8C0)
            {
              if (a1 > 0x15180)
              {
                if (a1 > 0x3F480)
                {
                  if (a1 > 0x93A80) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedUnlockDialogAnalyticEventTime(unint64_t a1)
{
  if ((uint64_t)a1 > 3599)
  {
    if (a1 > 0x1518)
    {
      if (a1 > 0x1C20)
      {
        if (a1 > 0x2A30)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0x7080)
            {
              if (a1 > 0xA8C0)
              {
                if (a1 > 0x15180)
                {
                  if (a1 > 0x3F480) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedWiredAuthDuration(unint64_t a1)
{
  if (a1 > 0x1F3)
  {
    if (a1 > 0x3E8)
    {
      if (a1 > 0x5DC)
      {
        if (a1 > 0x7D0)
        {
          if (a1 > 0x1388)
          {
            if (a1 > 0x2710)
            {
              if (a1 > 0x3A98)
              {
                if (a1 > 0x4E20)
                {
                  if (a1 > 0x7530) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedInductiveAuthDuration(unint64_t a1)
{
  if (a1 > 0xE)
  {
    if (a1 > 0x1E)
    {
      if (a1 > 0x2D)
      {
        if (a1 > 0x3C)
        {
          if (a1 > 0x5A)
          {
            if (a1 > 0x78)
            {
              if (a1 > 0x96)
              {
                if (a1 > 0xB4)
                {
                  if (a1 > 0xFA) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeLevel(unsigned int a1)
{
  if ((int)a1 > 9)
  {
    if (a1 > 0x14)
    {
      if (a1 > 0x1E)
      {
        if (a1 > 0x28)
        {
          if (a1 > 0x32)
          {
            if (a1 > 0x3C)
            {
              if (a1 > 0x46)
              {
                if (a1 > 0x50)
                {
                  if (a1 > 0x5A) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeDelta(int a1)
{
  if (a1 > -90)
  {
    if (a1 > -80)
    {
      if (a1 > -70)
      {
        if (a1 > -60)
        {
          if (a1 > -50)
          {
            if (a1 > -40)
            {
              if (a1 > -30)
              {
                if (a1 > -20)
                {
                  if (a1 > -10)
                  {
                    if (a1 <= 0)
                    {
                      char v1 = 10;
                    }
                    else if (a1 > 0xA)
                    {
                      if (a1 > 0x14)
                      {
                        if (a1 > 0x1E)
                        {
                          if (a1 > 0x28)
                          {
                            if (a1 > 0x32)
                            {
                              if (a1 > 0x3C)
                              {
                                if (a1 > 0x46)
                                {
                                  if (a1 > 0x50)
                                  {
                                    if (a1 > 0x5A) {
                                      char v1 = 20;
                                    }
                                    else {
                                      char v1 = 19;
                                    }
                                  }
                                  else
                                  {
                                    char v1 = 18;
                                  }
                                }
                                else
                                {
                                  char v1 = 17;
                                }
                              }
                              else
                              {
                                char v1 = 16;
                              }
                            }
                            else
                            {
                              char v1 = 15;
                            }
                          }
                          else
                          {
                            char v1 = 14;
                          }
                        }
                        else
                        {
                          char v1 = 13;
                        }
                      }
                      else
                      {
                        char v1 = 12;
                      }
                    }
                    else
                    {
                      char v1 = 11;
                    }
                  }
                  else
                  {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizeBatteryPackConnectionDuration(unint64_t a1)
{
  if (a1 > 0x1B773F)
  {
    if (a1 > 0x36F267)
    {
      if (a1 > 0x6DE0E7)
      {
        if (a1 > 0xDBBDE7)
        {
          if (a1 > 0x1B777E7)
          {
            if (a1 > 0x29331E7)
            {
              if (a1 > 0x5265FE7)
              {
                if (a1 > 0xF7317E7)
                {
                  if (a1 > 0x240C87E7) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizePowerSourceChargingTime(unint64_t a1)
{
  if (a1 > 0x3E7)
  {
    if (a1 > 0xDBB9F)
    {
      if (a1 > 0x1B7B27)
      {
        if (a1 > 0x36F267)
        {
          if (a1 > 0x6DE0E7)
          {
            if (a1 > 0xDBBDE7)
            {
              if (a1 > 0x1B777E7)
              {
                if (a1 > 0x29331E7)
                {
                  if (a1 > 0x5265FE7)
                  {
                    if (a1 > 0xF7317E7)
                    {
                      if (a1 > 0x240C87E7) {
                        char v1 = 12;
                      }
                      else {
                        char v1 = 11;
                      }
                    }
                    else
                    {
                      char v1 = 10;
                    }
                  }
                  else
                  {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

void init_logging_signposts()
{
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  CFTypeID v2 = objc_msgSend_setCertificate_;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = "<Undefined>";
        }
      }
      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    CFTypeID v2 = objc_msgSend_setCertificate_;
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 173);
    LODWORD(v12) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v10;
}

CFDataRef copyCertificateForFDRData(const __CFData *Copy)
{
  init_logging();
  if (Copy)
  {
    CFIndex Length = CFDataGetLength(Copy);
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects <= 3;
    }
    else {
      BOOL v3 = 1;
    }
    int v4 = !v3;
    if (Length < 611)
    {
      if (v4)
      {
        v7 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          copyCertificateForFDRData_cold_1();
        }
        v7 = &_os_log_default;
        id v12 = &_os_log_default;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "dataLength matches Roswell data length, return copy of fdr data", (uint8_t *)&v26, 2u);
      }

      Copy = CFDataCreateCopy(kCFAllocatorDefault, Copy);
    }
    else
    {
      uint64_t v5 = Length;
      if (v4)
      {
        uint64_t v6 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          copyCertificateForFDRData_cold_1();
        }
        uint64_t v6 = &_os_log_default;
        id v8 = &_os_log_default;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Have a custom Roswell data structure", (uint8_t *)&v26, 2u);
      }

      if (gLogObjects) {
        BOOL v9 = gNumLogObjects <= 3;
      }
      else {
        BOOL v9 = 1;
      }
      int v10 = !v9;
      if (v5 == 704)
      {
        if (v10)
        {
          v11 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            copyCertificateForFDRData_cold_1();
          }
          v11 = &_os_log_default;
          id v14 = &_os_log_default;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Have a match for (t_bpFDRData_v1)", (uint8_t *)&v26, 2u);
        }

        v15 = (UInt8 *)malloc_type_calloc(1uLL, 0x2C0uLL, 0x100004033510130uLL);
        BytePtr = CFDataGetBytePtr(Copy);
        memcpy(v15, BytePtr, 0x2C0uLL);
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v17 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            copyCertificateForFDRData_cold_1();
          }
          v17 = &_os_log_default;
          id v19 = &_os_log_default;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *((unsigned __int16 *)v15 + 30);
          int v26 = 67109120;
          LODWORD(v27) = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "pRoswellDataStructure->roswell_cert_len = %d", (uint8_t *)&v26, 8u);
        }

        Copy = CFDataCreate(kCFAllocatorDefault, v15 + 62, *((unsigned __int16 *)v15 + 30));
        free(v15);
      }
      else
      {
        if (v10)
        {
          __int16 v13 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            copyCertificateForFDRData_cold_1();
          }
          __int16 v13 = &_os_log_default;
          id v18 = &_os_log_default;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          copyCertificateForFDRData_cold_4(v5, v13);
        }

        Copy = 0;
      }
    }
  }
  if (gLogObjects) {
    BOOL v21 = gNumLogObjects < 4;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      copyCertificateForFDRData_cold_1();
    }
    v23 = &_os_log_default;
    id v22 = &_os_log_default;
  }
  else
  {
    v23 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    if (Copy) {
      CFIndex v24 = CFDataGetLength(Copy);
    }
    else {
      CFIndex v24 = 0;
    }
    int v26 = 134217984;
    CFIndex v27 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Returning Roswell data of length %ld", (uint8_t *)&v26, 0xCu);
  }

  return Copy;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id acc_userDefaults_BOOLForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

id acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

id acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

id acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

id acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  CFTypeID v2 = +[ACCUserDefaults sharedDefaultsLogging];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

id logObjectForModule()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 4;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }

  return v10;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t cpGetDeviceInfo(io_registry_entry_t entry, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v11 = 3758097084;
  if (a2)
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"DeviceVersion", kCFAllocatorDefault, 0);
    if (!CFProperty) {
      return 3758097136;
    }
    CFNumberRef v14 = CFProperty;
    int Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, a2);
    CFRelease(v14);
    if (!Value) {
      return v11;
    }
  }
  if (a3)
  {
    CFNumberRef v16 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"FirmwareVersion", kCFAllocatorDefault, 0);
    if (!v16) {
      return 3758097136;
    }
    CFNumberRef v17 = v16;
    int v18 = CFNumberGetValue(v16, kCFNumberSInt8Type, a3);
    CFRelease(v17);
    if (!v18) {
      return v11;
    }
  }
  if (a4)
  {
    CFNumberRef v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AuthMajorVersion", kCFAllocatorDefault, 0);
    if (!v19) {
      return 3758097136;
    }
    CFNumberRef v20 = v19;
    int v21 = CFNumberGetValue(v19, kCFNumberSInt8Type, a4);
    CFRelease(v20);
    if (!v21) {
      return v11;
    }
  }
  if (a5)
  {
    CFNumberRef v22 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AuthMinorVersion", kCFAllocatorDefault, 0);
    if (!v22) {
      return 3758097136;
    }
    CFNumberRef v23 = v22;
    int v24 = CFNumberGetValue(v22, kCFNumberSInt8Type, a5);
    CFRelease(v23);
    if (!v24) {
      return v11;
    }
  }
  if (!a6) {
    return 0;
  }
  CFNumberRef v25 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"DeviceID", kCFAllocatorDefault, 0);
  if (!v25) {
    return 3758097136;
  }
  CFNumberRef v26 = v25;
  int v27 = CFNumberGetValue(v25, kCFNumberSInt32Type, a6);
  CFRelease(v26);
  if (v27) {
    return 0;
  }
  return v11;
}

uint64_t cpGetDeviceIDSN(io_registry_entry_t a1, UInt8 **a2, CFIndex *a3)
{
  uint64_t v3 = 3758097090;
  if (a2)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, @"IDSN", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFDataRef v7 = CFProperty;
      CFIndex Length = CFDataGetLength(CFProperty);
      uint64_t v9 = (UInt8 *)malloc_type_malloc(Length, 0xC0846878uLL);
      if (v9)
      {
        id v10 = v9;
        v12.location = 0;
        v12.length = Length;
        CFDataGetBytes(v7, v12, v9);
        uint64_t v3 = 0;
        *a2 = v10;
        *a3 = Length;
      }
      else
      {
        uint64_t v3 = 3758097115;
      }
      CFRelease(v7);
    }
    else
    {
      return 3758097136;
    }
  }
  return v3;
}

CFTypeRef cpCopyCertificate(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"AccessoryCertificate", kCFAllocatorDefault, 0);
}

uint64_t cpClearCertificate(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0xDu, 0, 0, 0, 0);
}

CFTypeRef cpCopyCertificateSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"AccessoryCertificateSerialNumber", kCFAllocatorDefault, 0);
}

uint64_t cpGetChallengeSignatureLengths(mach_port_t a1, uint64_t *a2, void *a3)
{
  uint64_t output = 0;
  uint64_t v10 = 0;
  uint32_t outputCnt = 2;
  puts("cpGetChallengeSignatureLengths");
  uint64_t result = IOConnectCallScalarMethod(a1, 0x14u, 0, 0, &output, &outputCnt);
  uint64_t v7 = v10;
  *a2 = output;
  *a3 = v7;
  return result;
}

uint64_t cpCreateFormattedChallengeFromServerRequest(mach_port_t a1, const __CFData *a2, CFDataRef *a3)
{
  puts("cpCreateFormattedChallengeFromServerRequest");
  memset(outputStruct, 0, sizeof(outputStruct));
  size_t outputStructCnt = 128;
  BytePtr = CFDataGetBytePtr(a2);
  size_t Length = CFDataGetLength(a2);
  uint64_t v8 = IOConnectCallStructMethod(a1, 0x15u, BytePtr, Length, outputStruct, &outputStructCnt);
  if (!v8 && outputStructCnt) {
    *a3 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)outputStruct, outputStructCnt);
  }
  return v8;
}

uint64_t cpCreateFormattedResponseForServerResponse(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t a4)
{
  uint64_t input = a4;
  puts("cpCreateFormattedResponseForServerResponse");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)bytes = 0u;
  long long v14 = 0u;
  CFIndex length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  size_t v8 = CFDataGetLength(a2);
  uint64_t v9 = IOConnectCallMethod(a1, 0x16u, &input, 1u, BytePtr, v8, 0, 0, bytes, (size_t *)&length);
  if (!v9) {
    *a3 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  }
  return v9;
}

uint64_t cpCreateSignature(mach_port_t a1, CFDataRef theData, CFDataRef *a3)
{
  CFIndex length = 128;
  BytePtr = CFDataGetBytePtr(theData);
  size_t v7 = CFDataGetLength(theData);
  uint64_t v8 = IOConnectCallStructMethod(a1, 0, BytePtr, v7, outputStruct, (size_t *)&length);
  if (!v8) {
    *a3 = CFDataCreate(kCFAllocatorDefault, outputStruct, length);
  }
  return v8;
}

uint64_t cpCreateSignatureWithIndexAndToken(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t *a4, int a5)
{
  puts("cpCreateSignatureWithIndexAndToken");
  if (a2)
  {
    CFIndex v10 = CFDataGetLength(a2);
    if (v10) {
      CFDataGetBytePtr(a2);
    }
  }
  else
  {
    CFIndex v10 = 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)bytes = 0u;
  long long v19 = 0u;
  input[0] = a5;
  input[1] = v10;
  input[2] = 128;
  uint32_t outputCnt = 1;
  CFIndex length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  size_t v12 = CFDataGetLength(a2);
  uint64_t v13 = IOConnectCallMethod(a1, 0x13u, input, 3u, BytePtr, v12, a4, &outputCnt, bytes, (size_t *)&length);
  if (!v13) {
    *a3 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  }
  return v13;
}

CFTypeRef cpCopyDeviceNonce(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceNonce", kCFAllocatorDefault, 0);
}

uint64_t cpSetAuthStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatusForUI(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 9u, &input, 1u, 0, 0);
}

uint64_t cpSetFdrValidationStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0, 0);
}

uint64_t cpSetAuthFullPass(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0);
}

uint64_t cpSetAuthErrorDescription(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4 = 3758097085;
  CFIndex v5 = CFStringGetLength(theString) + 1;
  uint64_t v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    size_t v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u)) {
      uint64_t v4 = IOConnectCallStructMethod(a1, 0xBu, v7, v5, 0, 0);
    }
    else {
      uint64_t v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpSetAuthError(mach_port_t a1, unsigned int a2)
{
  uint64_t v3 = a2;
  printf("cpSetAuthError %d\n", a2);
  uint64_t input = v3;
  return IOConnectCallScalarMethod(a1, 0xCu, &input, 1u, 0, 0);
}

uint64_t cpCopyDownstreamCertificateSerialNumber(mach_port_t a1, CFStringRef *a2)
{
  size_t outputStructCnt = 33;
  uint64_t v3 = IOConnectCallStructMethod(a1, 1u, 0, 0, outputStruct, &outputStructCnt);
  CFStringRef v4 = 0;
  if (!v3) {
    CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, outputStruct, 0x600u);
  }
  *a2 = v4;
  return v3;
}

uint64_t cpSetDownstreamRevokeStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 2u, &input, 1u, 0, 0);
}

uint64_t cpGetDownstreamAuthMajorVer(mach_port_t a1, unsigned char *a2)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(a1, 3u, 0, 0, &output, &outputCnt);
  *a2 = output;
  return result;
}

uint64_t cpClearAuthState(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
}

uint64_t cpRequestAuthRestart(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 7u, 0, 0, 0, 0);
}

uint64_t cpSetExpectedPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4 = 3758097085;
  CFIndex v5 = CFStringGetLength(theString) + 1;
  uint64_t v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    size_t v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      uint64_t v4 = IOConnectCallStructMethod(a1, 0x11u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetExpectedPairedCertSN: !CFStringGetCString");
      uint64_t v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpSetActualPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4 = 3758097085;
  CFIndex v5 = CFStringGetLength(theString) + 1;
  uint64_t v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    size_t v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      uint64_t v4 = IOConnectCallStructMethod(a1, 0x12u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetActualPairedCertSN: !CFStringGetCString");
      uint64_t v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpGetTransportEntryId(mach_port_t a1, uint64_t *a2)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod(a1, 0x10u, 0, 0, &output, &outputCnt);
  uint64_t v4 = v3;
  if (v3) {
    printf("cpGetTransportEntryId: IOConnectCallScalarMethod failed: 0x%x\n", v3);
  }
  else {
    *a2 = output;
  }
  return v4;
}

uint64_t cpGetUpstreamAccessoryManager(io_registry_entry_t a1)
{
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(a1, "IOAccessory", &parent)) {
    return 0;
  }
  else {
    return parent;
  }
}

uint64_t cpGetInternalComponents(__CFArray **a1)
{
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  CFStringRef v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  CFBooleanRef cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  uint64_t v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    uint64_t v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, @"InternalComponent", kCFBooleanTrue);
    uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v3, &existing);
    if (MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      long long v25 = a1;
      CFAllocatorRef v5 = kCFAllocatorDefault;
      theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      io_object_t v6 = IOIteratorNext(existing);
      if (v6)
      {
        io_registry_entry_t v7 = v6;
        do
        {
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, @"InternalComponent", v5, 0);
          if (!CFProperty)
          {
            long long v23 = 0;
LABEL_38:
            long long v16 = -536870206;
            goto LABEL_40;
          }
          CFBooleanRef v9 = CFProperty;
          char valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            long long v23 = 0;
            Mutable = 0;
            long long v22 = v9;
            long long v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (!Mutable) {
            goto LABEL_45;
          }
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            long long v16 = RegistryEntryID;
            long long v23 = 0;
LABEL_49:
            long long v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          size_t v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            long long v23 = 0;
            long long v16 = -536870181;
            goto LABEL_49;
          }
          uint64_t v13 = v12;
          CFDictionaryAddValue(Mutable, @"IORegistryEntryID", v12);
          long long v14 = IORegistryEntryCreateCFProperty(v7, @"flags", v5, 0);
          if (v14) {
            CFDictionaryAddValue(Mutable, @"flags", v14);
          }
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          long long v15 = BYTE2(valuePtr) << 16;
          long long v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            long long v17 = @"Battery";
          }
          else
          {
            if (v15 != 196608)
            {
              long long v23 = 0;
              long long v19 = 0;
              long long v21 = 0;
              long long v22 = 0;
              long long v18 = 0;
              goto LABEL_25;
            }
            long long v17 = @"TouchController";
          }
          CFDictionaryAddValue(Mutable, @"ComponentName", v17);
          long long v18 = IORegistryEntryCreateCFProperty(v7, @"authErrorDescription", v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, @"authErrorDescription", v18);
            long long v19 = IORegistryEntryCreateCFProperty(v7, @"AuthPassed", v5, 0);
            if (v19) {
              CFDictionaryAddValue(Mutable, @"AuthPassed", v19);
            }
            long long v20 = IORegistryEntryCreateCFProperty(v7, @"isTrusted", v5, 0);
            long long v21 = v20;
            if (v20) {
              CFDictionaryAddValue(Mutable, @"isTrusted", v20);
            }
            long long v22 = IORegistryEntryCreateCFProperty(v7, @"isTrustedForUI", v5, 0);
            if (v22) {
              CFDictionaryAddValue(Mutable, @"isTrustedForUI", v22);
            }
            long long v16 = 0;
            long long v23 = Mutable;
          }
          else
          {
            long long v23 = 0;
            long long v19 = 0;
            long long v21 = 0;
            long long v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14) {
            CFRelease(v14);
          }
          if (v18) {
            CFRelease(v18);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (v21) {
            CFRelease(v21);
          }
          if (v22) {
            goto LABEL_34;
          }
LABEL_35:
          if (Mutable)
          {
            CFAllocatorRef v5 = kCFAllocatorDefault;
            if (!v16) {
              goto LABEL_40;
            }
            CFRelease(Mutable);
            goto LABEL_38;
          }
          CFAllocatorRef v5 = kCFAllocatorDefault;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          io_registry_entry_t v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      uint64_t v1 = 0;
      *long long v25 = theArray;
    }
  }
  return v1;
}

uint64_t AuthCPI2CRead(mach_port_t a1, char a2, unsigned int a3, void *outputStruct)
{
  LOBYTE(input) = a2;
  size_t outputStructCnt = a3;
  return IOConnectCallMethod(a1, 0xEu, &input, 1u, 0, 0, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t AuthCPI2CWrite(mach_port_t a1, char a2, size_t inputStructCnt, void *inputStruct)
{
  LOBYTE(input) = a2;
  return IOConnectCallMethod(a1, 0xFu, &input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  CFAllocatorRef v5 = &v4[v3];
  io_object_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    size_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      long long v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    size_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  CFAllocatorRef v5 = &v4[v3];
  io_object_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    size_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      long long v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    size_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  memset(v8, 170, sizeof(v8));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  memset(v12, 170, sizeof(v12));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  memset(v4, 170, sizeof(v4));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Local_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Sham_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, long long *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6)) {
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              long long v16 = 0u;
              long long v17 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!result)
              {
                if (v18 != 0x2000000000000011) {
                  return 2;
                }
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if (result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010) {
                    return 2;
                  }
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if (result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      long long v13 = 0uLL;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!result)
      {
        if (v9 != 0x2000000000000010) {
          return 2;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if (result) {
          return result;
        }
        if (v14 != 22) {
          return 2;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if (result) {
          return result;
        }
        if ((v8 | 0xE000000000000000) != a2) {
          return 2;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result != 1) {
          return 2;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0;
  unint64_t v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  long long v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7)) {
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
  }
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void DERImg4DecodeParseManifestPropertiesInternal(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  unint64_t v15 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010) {
            return 2;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if (result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                uint64_t result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  uint64_t result = 1;
  if (!a2) {
    return result;
  }
LABEL_7:
  if (result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1;
    goto LABEL_14;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  uint64_t result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if (result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(void, void, long long *), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  BOOL v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9) {
    goto LABEL_9;
  }
  if (*(unsigned char *)a1)
  {
    long long v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    long long v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&long long v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(unsigned char *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 1))
  {
    long long v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(void *)&long long v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          long long v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(unsigned char *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      uint64_t v4 = v6;
      if (!v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 6;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!result) {
        *a2 = (void)v8 != 0;
      }
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        long long v10 = 0uLL;
        long long v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0uLL;
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        long long v19 = 0uLL;
        long long v20 = 0uLL;
        long long v17 = 0uLL;
        long long v18 = 0uLL;
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        long long v13 = 0uLL;
        long long v14 = 0uLL;
        long long v11 = 0uLL;
        long long v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  if (!a1) {
    return 6;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!result)
      {
        if ((void)v9)
        {
          uint64_t result = 0;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      long long v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    unint64_t v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    unint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v14 = 0;
    long long v13 = 0uLL;
    long long v12 = 0uLL;
    long long v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0;
  v14[1] = 0;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    long long v12 = 0uLL;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0;
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) == 1)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t result = 6;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!result)
    {
      if (*((void *)&v14 + 1) == 4)
      {
        uint64_t result = 0;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      uint64_t result = 2;
    }
    int v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void Img4DecodeEvaluateCertificatePropertiesInternal(void *a1, _OWORD *a2)
{
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v19 = 0;
  long long v18 = 0uLL;
  size_t __n = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __s1 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s2 = 0uLL;
  long long v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17)) {
        return;
      }
      uint64_t v4 = (long long *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          long long v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9)) {
              return;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }
            else if (*((void *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001 || v6 != 1) {
                return;
              }
              int v6 = 0;
            }
            if (v6) {
              return;
            }
          }
          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50:
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&long long v13 = &default_manifest_property_exclude;
        *((void *)&v13 + 1) = 156;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        Img4DecodeEvaluateCertificatePropertiesInternal(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              long long v12 = v17;
              if (!((unsigned int (*)(void, unsigned char **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))_Img4DecodeValidateManifestPropertyInterposer, (uint64_t)v11)&& !((unsigned int (*)(void, unsigned char **, uint64_t, unsigned char *))v15[2])(*(void *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  if (!a3) {
    return 6;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if (result == 1) {
        return 0;
      }
      if (result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if (result) {
        return result;
      }
      uint64_t result = 2;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if (result) {
        return result;
      }
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&long long v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796429);
}

uint64_t Img4DecodeInitManifestCommon(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4(*(void *)(a2 + 296), *(unsigned int *)(a2 + 304), *(void *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(unsigned char *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(unsigned char *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = 0;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t result = 6;
  long long v17 = 0u;
  long long v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (Img4DecodeInitManifestCommon(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)(*((void *)&v33 + 1), v34, (char *)v40 + 8, **(void **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))(a1, a2, *((void *)&v34 + 1), v35, (char *)v40 + 8, **(void **)(a9 + 32), a9, a10, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19,
           *((void *)&v19 + 1),
           v20,
           *((void *)&v20 + 1),
           v21,
           *((void *)&v21 + 1),
           v22,
           *((void *)&v22 + 1),
           v23,
           *((void *)&v23 + 1),
           v24,
           *((void *)&v24 + 1),
           v25,
           *((void *)&v25 + 1),
           v26,
           *((void *)&v26 + 1),
           v27,
           *((void *)&v27 + 1),
           v28,
           *((void *)&v28 + 1),
           v29,
           *((void *)&v29 + 1),
           v30,
           *((void *)&v30 + 1),
           v31,
           *((void *)&v31 + 1),
           v32,
           *((void *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void _Img4DecodePerformTrustEvaluationWithCallbacksInternal(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(unsigned char *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(void *)(a2 + 296), *(void *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(void **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(void, void, uint64_t))a4)(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(void *)(a2 + 280), *(void *)(a2 + 288), a2 + 376,
                               **(void **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        int v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        long long v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000;
                        long long v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6)) {
                            return;
                          }
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184, **(void **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(unsigned char *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t _Img4DecodeValidateManifestPropertyInterposer(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void **)a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(void *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 3072);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_pkcs1_sig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v18[2] = 0;
  v18[3] = 0;
  unint64_t v6 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  long long v8 = (unint64_t *)((char *)v17 - v7);
  bzero((char *)v17 - v7, v7);
  unint64_t *v8 = v6;
  uint64_t v9 = *(unsigned int *)(a1 + 8);
  v18[0] = *(void *)a1;
  v18[1] = v9;
  memset(v17, 0, sizeof(v17));
  uint64_t result = DERParseSequenceToObject((uint64_t)v18, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v17, 0x20uLL, 0x20uLL);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v11 = *((void *)&v17[0] + 1);
  for (i = *(unsigned char **)&v17[0]; v11; --v11)
  {
    if (*i) {
      break;
    }
    if (i == (unsigned char *)-1) {
      __break(0x5513u);
    }
    ++i;
  }
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  unint64_t v13 = (v11 + 7) >> 3;
  if (v13 > *v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t *v8 = v13;
  if (ccrsa_make_pub()) {
    return 0xFFFFFFFFLL;
  }
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v14 = &CCRSA_PKCS1_FAULT_CANARY == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    int v16 = ccrsa_verify_pkcs1v15_digest();
    if (!v16 && !cc_cmp_safe()) {
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v17[0]) = 0;
  int v15 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v15 && LOBYTE(v17[0])) {
    return 0;
  }
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 4096);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                uint64_t v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6) {
                    verify_ecdsa_sig();
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void verify_ecdsa_sig()
{
  v10[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp();
    uint64_t v1 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v1, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      uint64_t v2 = 24 * v1;
      BOOL v3 = __CFADD__(v2, 16);
      uint64_t v4 = v2 + 16;
      if (!v3)
      {
        BOOL v3 = __CFADD__(v4, 16);
        uint64_t v5 = v4 + 16;
        if (!v3)
        {
          unint64_t v6 = cp;
          unint64_t v7 = v5 - 1;
          __chkstk_darwin();
          uint64_t v9 = &v10[-v8];
          bzero(&v10[-v8], v8);
          if (v7 < 0x10)
          {
            __break(1u);
          }
          else
          {
            void *v9 = v6;
            if (!ccec_import_pub()) {
              ccec_verify();
            }
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!_crack_chain_with_anchor(v26, (uint64_t)v27, 3u)
          && !parse_chain((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          long long v24 = a6;
          uint64_t v15 = 0;
          int v16 = (const void **)v32;
          long long v17 = &v30;
          unint64_t v18 = (const void **)v32;
          while (1)
          {
            long long v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v34[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              long long v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              unint64_t v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42)) {
                return 0xFFFFFFFFLL;
              }
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                unint64_t v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                long long v43 = 0u;
                long long v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  long long v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&verify_chain_img4_v1_sboot_item, (uint64_t)&v25);
                  if (!result) {
                    return 0xFFFFFFFFLL;
                  }
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  if (!v38) {
                    return 0;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0;
                  }
                  uint64_t result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0;
                      *a5 = v38;
                      *long long v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2 || *(unsigned char *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1) {
        break;
      }
      if (*(unsigned char *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if (result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = parse_extensions(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_signatures(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2 || *(unsigned char *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(unsigned char *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(void *)(a3 + 40))) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)(*a2, a2[1], v13, **(void **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(void **)(a3 + 32), a3, 0);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_x86);
}

uint64_t verify_chain_img4_v2_with_crack_callback(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = parse_chain((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if (result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          char v16 = 1;
          uint64_t v17 = 1;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = verify_chain_signatures(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2;
              if (!result) {
                continue;
              }
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0;
            if (a5 && a6)
            {
              uint64_t result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t crack_chain_rsa4k_sha384_x86(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi);
}

uint64_t crack_chain_rsa4k_sha384_ddi(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_avp);
}

uint64_t crack_chain_rsa4k_sha384_avp(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa3k_sha384);
}

uint64_t crack_chain_rsa3k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384);
}

uint64_t crack_chain_rsa4k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_AWG1);
}

uint64_t crack_chain_rsa4k_sha384_AWG1(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_rsa4k_sha384_PED);
}

uint64_t crack_chain_rsa4k_sha384_PED(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !parse_ec_chain((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          long long v25 = a4;
          uint64_t v15 = 0;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = verify_chain_signatures(&v32[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *long long v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_ec_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    char v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    *unint64_t v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = parse_extensions(a4 + v9, (void *)(a7 + v11));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa256_sha256);
}

uint64_t verify_chain_img4_ec_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = parse_ec_chain((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL) {
    goto LABEL_22;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  uint64_t result = verify_chain_signatures(v28, v22, a7);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  if (!v31) {
    return 0;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0;
  }
  uint64_t result = 0;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t crack_chain_ecdsa256_sha256(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t crack_chain_ecdsa384_sha384_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384);
}

uint64_t crack_chain_ecdsa384_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))crack_chain_ecdsa384_sha384_qa);
}

uint64_t crack_chain_ecdsa384_sha384_qa(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1 || !*v1) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!**(void **)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1 && (BOOL v3 = **(unint64_t ***)(a1 + 16)) != 0) {
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void *)v8[2]) != 0 && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1)) {
    return 0xFFFFFFFFLL;
  }
  *a7 = v15;
  *a8 = v16;
  uint64_t result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _crack_chain_with_anchor(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    if (v5 < 16 * (unint64_t)v6) {
      break;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16 * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0;
      }
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t parse_extensions(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  uint64_t v10 = 0;
  unint64_t v8 = 0;
  v9[0] = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(a1 + 152)) {
    return 0;
  }
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011) {
        return 0xFFFFFFFFLL;
      }
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void main_cold_1(uint64_t a1, int a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", (uint8_t *)&v2, 0x12u);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void copyCertificateForFDRData_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void copyCertificateForFDRData_cold_4(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 704;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "auth CFIndex length = %ld, sizeof(t_bpFDRData_v1) = %lu, does not match", (uint8_t *)&v2, 0x16u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AMFDRLogSetHandler()
{
  return _AMFDRLogSetHandler();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return _AMFDRSealingMapCopyLocalDataForClass();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return _CFDataCreateCopy(allocator, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MFAACreateCapsFromAuthCert()
{
  return _MFAACreateCapsFromAuthCert();
}

uint64_t MFAADeallocAuthCertCaps()
{
  return _MFAADeallocAuthCertCaps();
}

uint64_t MFAAIsAppleBatteryModule()
{
  return _MFAAIsAppleBatteryModule();
}

uint64_t MFAAIsAppleTouchControllerModule()
{
  return _MFAAIsAppleTouchControllerModule();
}

uint64_t MFAAVerifyCertificateSerialNumber()
{
  return _MFAAVerifyCertificateSerialNumber();
}

uint64_t MFAAVerifyNonceSignature()
{
  return _MFAAVerifyNonceSignature();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SecCertificateCopyComponentAttributes()
{
  return _SecCertificateCopyComponentAttributes();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return _cc_cmp_safe();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccdigest_init()
{
  return _ccdigest_init();
}

uint64_t ccdigest_update()
{
  return _ccdigest_update();
}

uint64_t ccec_get_cp()
{
  return _ccec_get_cp();
}

uint64_t ccec_import_pub()
{
  return _ccec_import_pub();
}

uint64_t ccec_keysize_is_supported()
{
  return _ccec_keysize_is_supported();
}

uint64_t ccec_verify()
{
  return _ccec_verify();
}

uint64_t ccec_x963_import_pub_size()
{
  return _ccec_x963_import_pub_size();
}

uint64_t ccrsa_make_pub()
{
  return _ccrsa_make_pub();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return _ccrsa_verify_pkcs1v15();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return _ccrsa_verify_pkcs1v15_digest();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void free(void *a1)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

id objc_msgSend__notifyComponentAuthFailure(void *a1, const char *a2, ...)
{
  return [a1 _notifyComponentAuthFailure];
}

id objc_msgSend_authFlags(void *a1, const char *a2, ...)
{
  return [a1 authFlags];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return [a1 certificate];
}

id objc_msgSend_certificateInfo(void *a1, const char *a2, ...)
{
  return [a1 certificateInfo];
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return [a1 challenge];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deviceNonce(void *a1, const char *a2, ...)
{
  return [a1 deviceNonce];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_moduleAuthService(void *a1, const char *a2, ...)
{
  return [a1 moduleAuthService];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return [a1 sharedDataAccessor];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedDefaultsIapd(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsIapd];
}

id objc_msgSend_sharedDefaultsLogging(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsLogging];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_skipComms(void *a1, const char *a2, ...)
{
  return [a1 skipComms];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_verifyNonceSignature_nonce_signature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyNonceSignature:nonce:signature:");
}