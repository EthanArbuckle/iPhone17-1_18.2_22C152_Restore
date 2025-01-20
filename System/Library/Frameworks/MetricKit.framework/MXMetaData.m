@interface MXMetaData
+ (BOOL)supportsSecureCoding;
- (BOOL)errorRetrievingAppRecord;
- (BOOL)isTestFlightApp;
- (BOOL)lowPowerModeEnabled;
- (MXMetaData)initWithCoder:(id)a3;
- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6;
- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 bundleID:(id)a7;
- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7;
- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7 bundleID:(id)a8;
- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7 bundleID:(id)a8 pid:(int)a9 isTestFlightApp:(BOOL)a10;
- (NSData)JSONRepresentation;
- (NSDictionary)DictionaryRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBuildVersion;
- (NSString)bundleID;
- (NSString)deviceType;
- (NSString)osVersion;
- (NSString)platformArchitecture;
- (NSString)regionFormat;
- (OS_os_log)logHandle;
- (id)toDictionary;
- (pid_t)pid;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBuildVersion:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setErrorRetrievingAppRecord:(BOOL)a3;
- (void)setIsTestFlightApp:(BOOL)a3;
- (void)setLogHandle:(id)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setPid:(int)a3;
- (void)setPlatformArchitecture:(id)a3;
- (void)setRegionFormat:(id)a3;
@end

@implementation MXMetaData

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MXMetaData;
  v15 = [(MXMetaData *)&v20 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_7;
  }
  v17 = 0;
  if (v11 && v12 && v13 && v14)
  {
    objc_storeStrong((id *)&v15->_regionFormat, a3);
    objc_storeStrong((id *)&v16->_osVersion, a4);
    objc_storeStrong((id *)&v16->_deviceType, a5);
    objc_storeStrong((id *)&v16->_applicationBuildVersion, a6);
    v18 = [MEMORY[0x263F08AB0] processInfo];
    v16->_lowPowerModeEnabled = [v18 isLowPowerModeEnabled];

    v16->_pid = -1;
LABEL_7:
    v17 = v16;
  }

  return v17;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7
{
  id v22 = a3;
  id v21 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MXMetaData;
  v16 = [(MXMetaData *)&v23 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_8;
  }
  v18 = 0;
  if (v22 && v21 && v13 && v14 && v15)
  {
    objc_storeStrong((id *)&v16->_regionFormat, a3);
    objc_storeStrong((id *)&v17->_osVersion, a4);
    objc_storeStrong((id *)&v17->_deviceType, a5);
    objc_storeStrong((id *)&v17->_applicationBuildVersion, a6);
    objc_storeStrong((id *)&v17->_platformArchitecture, a7);
    v19 = [MEMORY[0x263F08AB0] processInfo];
    v17->_lowPowerModeEnabled = [v19 isLowPowerModeEnabled];

    v17->_pid = -1;
LABEL_8:
    v18 = v17;
  }

  return v18;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7 bundleID:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MXMetaData;
  v17 = [(MXMetaData *)&v26 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_8;
  }
  v19 = 0;
  if (v25 && v24 && v23 && v15 && v16)
  {
    objc_storeStrong((id *)&v17->_regionFormat, a3);
    objc_storeStrong((id *)&v18->_osVersion, a4);
    objc_storeStrong((id *)&v18->_deviceType, a5);
    objc_storeStrong((id *)&v18->_applicationBuildVersion, a6);
    objc_storeStrong((id *)&v18->_platformArchitecture, a7);
    objc_storeStrong((id *)&v18->_bundleID, a8);
    objc_super v20 = [MEMORY[0x263F08AB0] processInfo];
    v18->_lowPowerModeEnabled = [v20 isLowPowerModeEnabled];

    v18->_pid = -1;
LABEL_8:
    v19 = v18;
  }

  return v19;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7 bundleID:(id)a8 pid:(int)a9 isTestFlightApp:(BOOL)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v17 = a6;
  id v18 = a7;
  id v24 = a8;
  v28.receiver = self;
  v28.super_class = (Class)MXMetaData;
  v19 = [(MXMetaData *)&v28 init];
  objc_super v20 = v19;
  if (!v19) {
    goto LABEL_8;
  }
  id v21 = 0;
  if (v27 && v26 && v25 && v17 && v18)
  {
    objc_storeStrong((id *)&v19->_regionFormat, a3);
    objc_storeStrong((id *)&v20->_osVersion, a4);
    objc_storeStrong((id *)&v20->_deviceType, a5);
    objc_storeStrong((id *)&v20->_applicationBuildVersion, a6);
    objc_storeStrong((id *)&v20->_platformArchitecture, a7);
    objc_storeStrong((id *)&v20->_bundleID, a8);
    id v22 = [MEMORY[0x263F08AB0] processInfo];
    v20->_lowPowerModeEnabled = [v22 isLowPowerModeEnabled];

    v20->_pid = a9;
    v20->_isTestFlightApp = a10;
LABEL_8:
    id v21 = v20;
  }

  return v21;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 bundleID:(id)a7
{
  id v22 = a3;
  id v21 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MXMetaData;
  id v16 = [(MXMetaData *)&v23 init];
  id v17 = v16;
  if (!v16) {
    goto LABEL_8;
  }
  id v18 = 0;
  if (v22 && v21 && v13 && v14 && v15)
  {
    objc_storeStrong((id *)&v16->_regionFormat, a3);
    objc_storeStrong((id *)&v17->_osVersion, a4);
    objc_storeStrong((id *)&v17->_deviceType, a5);
    objc_storeStrong((id *)&v17->_applicationBuildVersion, a6);
    v19 = [MEMORY[0x263F08AB0] processInfo];
    v17->_lowPowerModeEnabled = [v19 isLowPowerModeEnabled];

    objc_storeStrong((id *)&v17->_bundleID, a7);
    v17->_pid = -1;
LABEL_8:
    id v18 = v17;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  regionFormat = self->_regionFormat;
  id v5 = a3;
  [v5 encodeObject:regionFormat forKey:@"regionFormat"];
  [v5 encodeObject:self->_osVersion forKey:@"osVersion"];
  [v5 encodeObject:self->_deviceType forKey:@"deviceType"];
  [v5 encodeObject:self->_applicationBuildVersion forKey:@"appBuildVersion"];
  [v5 encodeObject:self->_platformArchitecture forKey:@"platformArchitecture"];
  [v5 encodeBool:self->_lowPowerModeEnabled forKey:@"lowPowerModeEnabled"];
  [v5 encodeBool:self->_isTestFlightApp forKey:@"isTestFlightApp"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleIdentifier"];
  id v6 = [NSNumber numberWithInt:self->_pid];
  [v5 encodeObject:v6 forKey:@"pid"];
}

- (MXMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MXMetaData;
  id v5 = [(MXMetaData *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionFormat"];
    regionFormat = v5->_regionFormat;
    v5->_regionFormat = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersion"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceType"];
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBuildVersion"];
    applicationBuildVersion = v5->_applicationBuildVersion;
    v5->_applicationBuildVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformArchitecture"];
    platformArchitecture = v5->_platformArchitecture;
    v5->_platformArchitecture = (NSString *)v14;

    v5->_lowPowerModeEnabled = [v4 decodeBoolForKey:@"lowPowerModeEnabled"];
    v5->_isTestFlightApp = [v4 decodeBoolForKey:@"isTestFlightApp"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
    v5->_pid = [v18 intValue];
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID)
  {
    [v3 setObject:bundleID forKey:@"bundleIdentifier"];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
    v7 = [v6 bundleIdentifier];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = [v8 bundleIdentifier];
      [v4 setObject:v9 forKey:@"bundleIdentifier"];
    }
  }
  regionFormat = self->_regionFormat;
  if (regionFormat) {
    [v4 setObject:regionFormat forKey:@"regionFormat"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v4 setObject:osVersion forKey:@"osVersion"];
  }
  deviceType = self->_deviceType;
  if (deviceType) {
    [v4 setObject:deviceType forKey:@"deviceType"];
  }
  applicationBuildVersion = self->_applicationBuildVersion;
  if (applicationBuildVersion) {
    [v4 setObject:applicationBuildVersion forKey:@"appBuildVersion"];
  }
  platformArchitecture = self->_platformArchitecture;
  if (platformArchitecture) {
    [v4 setObject:platformArchitecture forKey:@"platformArchitecture"];
  }
  id v15 = [NSNumber numberWithBool:self->_lowPowerModeEnabled];
  [v4 setObject:v15 forKey:@"lowPowerModeEnabled"];

  uint64_t v16 = [NSNumber numberWithInt:self->_pid];
  [v4 setObject:v16 forKey:@"pid"];

  id v17 = [NSNumber numberWithBool:self->_isTestFlightApp];
  [v4 setObject:v17 forKey:@"isTestFlightApp"];

  return v4;
}

- (NSData)JSONRepresentation
{
  if ((int)arc4random_uniform(0x64u) <= 9) {
    AnalyticsSendEventLazy();
  }
  id v3 = [(MXMetaData *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v3])
  {
    id v6 = 0;
    id v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v6];
  }
  else
  {
    id v4 = 0;
  }

  return (NSData *)v4;
}

id __32__MXMetaData_JSONRepresentation__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];

  v4[0] = @"bundleID";
  v4[1] = @"metricKitHelperFunctionType";
  v5[0] = v1;
  v5[1] = @"JSONRepresentation";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (NSDictionary)DictionaryRepresentation
{
  if ((int)arc4random_uniform(0x64u) <= 9) {
    AnalyticsSendEventLazy();
  }

  return (NSDictionary *)[(MXMetaData *)self toDictionary];
}

id __38__MXMetaData_DictionaryRepresentation__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];

  v4[0] = @"bundleID";
  v4[1] = @"metricKitHelperFunctionType";
  v5[0] = v1;
  v5[1] = @"DictionaryRepresentation";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (NSDictionary)dictionaryRepresentation
{
  if ((int)arc4random_uniform(0x64u) <= 9) {
    AnalyticsSendEventLazy();
  }

  return (NSDictionary *)[(MXMetaData *)self toDictionary];
}

id __38__MXMetaData_dictionaryRepresentation__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];

  v4[0] = @"bundleID";
  v4[1] = @"metricKitHelperFunctionType";
  v5[0] = v1;
  v5[1] = @"dictionaryRepresentation";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (NSString)regionFormat
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegionFormat:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)deviceType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)applicationBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationBuildVersion:(id)a3
{
}

- (NSString)platformArchitecture
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPlatformArchitecture:(id)a3
{
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (BOOL)isTestFlightApp
{
  return self->_isTestFlightApp;
}

- (void)setIsTestFlightApp:(BOOL)a3
{
  self->_isTestFlightApp = a3;
}

- (pid_t)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)errorRetrievingAppRecord
{
  return self->_errorRetrievingAppRecord;
}

- (void)setErrorRetrievingAppRecord:(BOOL)a3
{
  self->_errorRetrievingAppRecord = a3;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_platformArchitecture, 0);
  objc_storeStrong((id *)&self->_applicationBuildVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_regionFormat, 0);
}

@end