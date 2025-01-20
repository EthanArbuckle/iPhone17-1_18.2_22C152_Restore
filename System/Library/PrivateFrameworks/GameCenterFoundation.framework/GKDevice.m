@interface GKDevice
+ (id)currentDevice;
+ (id)zeroOutVersionWithDeviceType:(id)a3;
- (BOOL)isDevelopmentDevice;
- (BOOL)isFocusDevice;
- (BOOL)isGameKitAvailable;
- (BOOL)isInternalBuild;
- (BOOL)isProductType:(unsigned int)a3;
- (GKDevice)init;
- (NSString)buildVersion;
- (NSString)deviceType;
- (NSString)gameKitVersion;
- (NSString)osVersion;
- (NSString)udid;
- (NSString)versionlessDeviceType;
- (id)_platformUDID;
- (id)buildVersionHeader;
- (id)deviceTypeForUserAgent;
- (id)platformBuildVersion;
- (id)processNameHeader;
- (id)userAgentWithProcessName:(id)a3 protocolVersion:(id)a4;
- (void)_initPlatform;
- (void)setDeviceType:(id)a3;
- (void)setVersionlessDeviceType:(id)a3;
@end

@implementation GKDevice

+ (id)currentDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__GKDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_sDispatchOnceToken != -1) {
    dispatch_once(&currentDevice_sDispatchOnceToken, block);
  }
  v2 = (void *)currentDevice_sCurrentDevice;

  return v2;
}

uint64_t __25__GKDevice_currentDevice__block_invoke(uint64_t a1)
{
  currentDevice_sCurrentDevice = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (GKDevice)init
{
  v12.receiver = self;
  v12.super_class = (Class)GKDevice;
  v2 = [(GKDevice *)&v12 init];
  if (v2)
  {
    v3 = GKGameKitBundle();
    v4 = v3;
    if (v3)
    {
      v5 = [v3 infoDictionary];
      v6 = [v5 objectForKey:*MEMORY[0x1E4F1D020]];

      uint64_t v7 = [[NSString alloc] initWithFormat:@"GameKit-%@", v6];
      gameKitVersion = v2->_gameKitVersion;
      v2->_gameKitVersion = (NSString *)v7;
    }
    v2->_gameKitAvailable = 1;
    [(GKDevice *)v2 _initPlatform];
    if (!v2->_deviceType)
    {
      v2->_deviceType = (NSString *)@"Unknown";
    }
    if (!v2->_buildVersion)
    {
      v2->_buildVersion = (NSString *)@"Unknown";
    }
    if (!v2->_osVersion)
    {
      v2->_osVersion = (NSString *)@"Unknown";
    }
    if (!v2->_gameKitVersion)
    {
      v2->_gameKitVersion = (NSString *)@"Unknown";
    }
    uint64_t v9 = +[GKDevice zeroOutVersionWithDeviceType:v2->_deviceType];
    versionlessDeviceType = v2->_versionlessDeviceType;
    v2->_versionlessDeviceType = (NSString *)v9;
  }
  return v2;
}

- (NSString)udid
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(GKDevice *)self _platformUDID];
    udid = self->_udid;
    self->_udid = v3;
  }
  v5 = self->_udid;

  return v5;
}

- (id)deviceTypeForUserAgent
{
  v3 = +[GKPreferences shared];
  if ([v3 requestHeadersPrivacyEnabled]) {
    [(GKDevice *)self versionlessDeviceType];
  }
  else {
  v4 = [(GKDevice *)self deviceType];
  }

  return v4;
}

- (id)userAgentWithProcessName:(id)a3 protocolVersion:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F28E78];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithCapacity:256];
  [v9 appendString:v8];

  [v9 appendString:@"/"];
  [v9 appendString:v7];

  objc_msgSend(v9, "appendString:", @" (");
  v10 = [(GKDevice *)self deviceTypeForUserAgent];
  [v9 appendString:v10];

  [v9 appendString:@"; "];
  v11 = [(GKDevice *)self osVersion];
  [v9 appendString:v11];

  [v9 appendString:@"; "];
  objc_super v12 = [(GKDevice *)self buildVersion];
  [v9 appendString:v12];

  [v9 appendString:@"; "];
  v13 = [(GKDevice *)self gameKitVersion];
  [v9 appendString:v13];

  [v9 appendString:@""]);

  return v9;
}

- (id)processNameHeader
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 infoDictionary];
    v5 = [v4 objectForKey:*MEMORY[0x1E4F1D008]];
    if (!v5)
    {
      v5 = [v4 objectForKey:*MEMORY[0x1E4F1CC48]];
      if (!v5) {
        v5 = @"GameKit";
      }
    }
  }
  else
  {
    v5 = @"GameKit";
  }

  return v5;
}

- (id)buildVersionHeader
{
  v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:256];
  v4 = [(GKDevice *)self deviceType];
  [v3 appendString:v4];

  [v3 appendString:@"; "];
  v5 = [(GKDevice *)self buildVersion];
  [v3 appendString:v5];

  [v3 appendString:@"; "];
  v6 = [(GKDevice *)self gameKitVersion];
  [v3 appendString:v6];

  return v3;
}

- (id)platformBuildVersion
{
  v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:256];
  [v3 appendString:@"iOS"];
  [v3 appendString:@"."];
  v4 = [(GKDevice *)self osVersion];
  [v3 appendString:v4];

  [v3 appendString:@"."];
  v5 = [(GKDevice *)self buildVersion];
  [v3 appendString:v5];

  return v3;
}

- (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_2);
  }
  return isInternalBuild_isInternalInstall;
}

uint64_t __27__GKDevice_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  isInternalBuild_isInternalInstall = result;
  return result;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)gameKitVersion
{
  return self->_gameKitVersion;
}

- (BOOL)isGameKitAvailable
{
  return self->_gameKitAvailable;
}

- (NSString)versionlessDeviceType
{
  return self->_versionlessDeviceType;
}

- (void)setVersionlessDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionlessDeviceType, 0);
  objc_storeStrong((id *)&self->_gameKitVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);

  objc_storeStrong((id *)&self->_udid, 0);
}

- (void)_initPlatform
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v23[0] = @"ProductType";
  v23[1] = @"ProductVersion";
  v23[2] = @"BuildVersion";
  v23[3] = @"ipad";
  v23[4] = @"gamekit";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
  v4 = (void *)MGCopyMultipleAnswers();
  v5 = [v4 objectForKeyedSubscript:@"ProductType"];
  deviceType = self->_deviceType;
  self->_deviceType = v5;

  id v7 = [v4 objectForKeyedSubscript:@"ProductVersion"];
  osVersion = self->_osVersion;
  self->_osVersion = v7;

  uint64_t v9 = [v4 objectForKeyedSubscript:@"BuildVersion"];
  buildVersion = self->_buildVersion;
  self->_buildVersion = v9;

  v11 = [v4 objectForKeyedSubscript:@"gamekit"];
  self->_gameKitAvailable = [v11 BOOLValue];

  objc_super v12 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v13 = GKOSLoggers();
    objc_super v12 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = self->_deviceType;
    v15 = self->_osVersion;
    v16 = self->_buildVersion;
    int v17 = 138412802;
    v18 = v14;
    __int16 v19 = 2112;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Game Center DeviceType:%@, OS:%@ Build:%@", (uint8_t *)&v17, 0x20u);
  }
}

- (id)_platformUDID
{
  if (_platformUDID_onceToken != -1) {
    dispatch_once(&_platformUDID_onceToken, &__block_literal_global_47);
  }
  if (!self->_udid) {
    objc_storeStrong((id *)&self->_udid, (id)_platformUDID_uuid);
  }
  v3 = (void *)_platformUDID_uuid;

  return v3;
}

uint64_t __44__GKDevice_PlatformDependent___platformUDID__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  uint64_t v1 = _platformUDID_uuid;
  _platformUDID_uuid = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)isDevelopmentDevice
{
  if (isDevelopmentDevice_onceToken != -1) {
    dispatch_once(&isDevelopmentDevice_onceToken, &__block_literal_global_18);
  }
  return isDevelopmentDevice_isDevelopment;
}

void __50__GKDevice_PlatformDependent__isDevelopmentDevice__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  isDevelopmentDevice_isDevelopment = [v0 fileExistsAtPath:@"/Developer"];
}

- (BOOL)isFocusDevice
{
  if (isFocusDevice_onceToken != -1) {
    dispatch_once(&isFocusDevice_onceToken, &__block_literal_global_24);
  }
  return 0;
}

- (BOOL)isProductType:(unsigned int)a3
{
  return MGGetProductType() == a3;
}

+ (id)zeroOutVersionWithDeviceType:(id)a3
{
  uint64_t v3 = sub_1C2E922F8();
  static GKDevice.zeroOutVersion(deviceType:)(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1C2E922C8();
  swift_bridgeObjectRelease();

  return v4;
}

@end