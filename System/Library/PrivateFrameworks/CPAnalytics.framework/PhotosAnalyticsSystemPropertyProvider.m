@interface PhotosAnalyticsSystemPropertyProvider
- (id)_deviceFreeSpaceDescription;
- (id)deviceModel;
- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5;
- (id)lowPowerModeEnabled;
- (id)osVersion;
- (id)percentageOfFreeSpaceOnDevice;
- (id)process;
- (void)registerSystemProperties:(id)a3;
@end

@implementation PhotosAnalyticsSystemPropertyProvider

- (id)lowPowerModeEnabled
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F08AB0] processInfo];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isLowPowerModeEnabled"));

  return v4;
}

- (id)process
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  v3 = [v2 processName];

  return v3;
}

- (id)osVersion
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  memset(&v5, 0, 512);
  uname(&v5);
  v2 = [MEMORY[0x263F08AB0] processInfo];
  v3 = [v2 operatingSystemVersionString];

  return v3;
}

- (id)deviceModel
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(&v4, 0, 512);
  uname(&v4);
  v2 = [NSString stringWithCString:v4.machine encoding:4];
  return v2;
}

- (id)_deviceFreeSpaceDescription
{
  v2 = [(PhotosAnalyticsSystemPropertyProvider *)self percentageOfFreeSpaceOnDevice];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    if (v4 <= 2.0)
    {
      uint64_t v5 = @"DeviceFreeSpaceCritical";
    }
    else if (v4 > 5.0)
    {
      if (v4 > 15.0)
      {
        if (v4 > 50.0)
        {
          if (v4 > 80.0) {
            uint64_t v5 = @"DeviceFreeSpaceVeryHigh";
          }
          else {
            uint64_t v5 = @"DeviceFreeSpaceHigh";
          }
        }
        else
        {
          uint64_t v5 = @"DeviceFreeSpaceMedium";
        }
      }
      else
      {
        uint64_t v5 = @"DeviceFreeSpaceLow";
      }
    }
    else
    {
      uint64_t v5 = @"DeviceFreeSpaceVeryLow";
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)percentageOfFreeSpaceOnDevice
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 2uLL, 1);
  v3 = [v2 lastObject];
  double v4 = [MEMORY[0x263F08850] defaultManager];
  id v14 = 0;
  uint64_t v5 = [v4 attributesOfFileSystemForPath:v3 error:&v14];
  id v6 = v14;

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    v8 = CPAnalyticsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_215355000, v8, OS_LOG_TYPE_ERROR, "Unable to retrieve file system attributes at path %@ error: %@", buf, 0x16u);
    }

    v10 = 0;
  }
  else
  {
    v9 = [v5 objectForKey:*MEMORY[0x263F080D0]];
    v10 = (void *)[v9 unsignedLongLongValue];

    v11 = [v5 objectForKey:*MEMORY[0x263F080C8]];
    unint64_t v12 = [v11 unsignedLongLongValue];

    if (v10)
    {
      v10 = [NSNumber numberWithDouble:(double)v12 * 100.0 / (double)(unint64_t)v10];
    }
  }

  return v10;
}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  if (objc_msgSend(a3, "isEqualToString:", @"cpa_common_lowPowerModeEnabled", a4, a5))
  {
    id v6 = [(PhotosAnalyticsSystemPropertyProvider *)self lowPowerModeEnabled];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)registerSystemProperties:(id)a3
{
  id v8 = a3;
  double v4 = [(PhotosAnalyticsSystemPropertyProvider *)self _deviceFreeSpaceDescription];
  [v8 addProperty:@"cpa_common_deviceFreeSpace" withValue:v4];

  uint64_t v5 = [(PhotosAnalyticsSystemPropertyProvider *)self deviceModel];
  [v8 addProperty:@"cpa_common_deviceModel" withValue:v5];

  id v6 = [(PhotosAnalyticsSystemPropertyProvider *)self osVersion];
  [v8 addProperty:@"cpa_common_osVersion" withValue:v6];

  BOOL v7 = [(PhotosAnalyticsSystemPropertyProvider *)self process];
  [v8 addProperty:@"cpa_common_processName" withValue:v7];

  [v8 addDynamicProperty:@"cpa_common_lowPowerModeEnabled" withProvider:self];
}

@end