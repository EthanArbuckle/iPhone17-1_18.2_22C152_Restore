@interface CLKDevice
+ (BOOL)NRDeviceIsRunningDaytonaOrLater:(id)a3;
+ (CGRect)screenBoundsForSizeClass:(unint64_t)a3;
+ (CLKDevice)currentDevice;
+ (double)screenCornerRadiusForSizeClass:(unint64_t)a3;
+ (double)screenScaleForSizeClass:(unint64_t)a3;
+ (id)CLKDeviceUUIDForNRDevice:(id)a3;
+ (id)_cachedDeviceForUUID:(id)a3;
+ (id)_createCurrentDeviceWithNRDevice:(id)a3;
+ (id)activeNRDevice;
+ (id)deviceForDescriptor:(id)a3;
+ (id)deviceForNRDevice:(id)a3;
+ (id)deviceForNRDevice:(id)a3 forced:(BOOL)a4;
+ (id)nrDeviceForNRDeviceUUID:(id)a3;
+ (unsigned)NRProductVersionForNRDevice:(id)a3;
+ (void)_deviceDidBecomeActive:(id)a3;
+ (void)_handleNRDeviceChanged:(id)a3;
+ (void)_removeCachedDeviceForUUID:(id)a3;
+ (void)activeNRDevice;
+ (void)enumerateSizeClasses:(id)a3;
+ (void)initialize;
+ (void)resetCurrentDevice;
+ (void)setCurrentDevice:(id)a3;
- (BOOL)_checkUpdateFlushCapabilitiesCache_locked;
- (BOOL)_queryAndCacheNanoRegistryDeviceCapabilities;
- (BOOL)_supportsCapabilityUncached:(id)a3;
- (BOOL)hasRichMediaComplications;
- (BOOL)isBridgeActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplorer;
- (BOOL)isLimitedToPreGloryDeviceOfProductType:(int64_t)a3;
- (BOOL)isLocked;
- (BOOL)isLuxo;
- (BOOL)isM8SOCInDeviceOfProductType:(int64_t)a3;
- (BOOL)isPaired;
- (BOOL)isRunningDaytonaOrLater;
- (BOOL)isRunningGloryFOrLater;
- (BOOL)isRunningGloryGMOrLater;
- (BOOL)isRunningGraceOrLater;
- (BOOL)isTinker;
- (BOOL)isZeusBlack;
- (BOOL)limitedToPreGlory;
- (BOOL)limitedToPreHunter;
- (BOOL)supportsCapability:(id)a3;
- (BOOL)supportsCharon;
- (BOOL)supportsCompanionSync;
- (BOOL)supportsPolaris;
- (BOOL)supportsTritium;
- (BOOL)supportsUrsa;
- (BOOL)supportsVictoryFaces;
- (BOOL)supportsWidgetMigration;
- (BOOL)unlockedSinceBoot;
- (CGRect)screenBounds;
- (CLKDevice)initWithNRDevice:(id)a3;
- (CLKDevice)initWithSizeClass:(unint64_t)a3;
- (CLKDeviceDescriptor)descriptor;
- (NRDevice)nrDevice;
- (NSMutableDictionary)supportedCapabilitiesCache;
- (NSNumber)deviceBrand;
- (NSUUID)nrDeviceUUID;
- (double)screenCornerRadius;
- (double)screenScale;
- (int)cachedKeybagLockState;
- (int)pairedDeviceCapabilitiesChangeNotificationToken;
- (int64_t)productFamilyType;
- (int64_t)productType;
- (int64_t)productTypeFromProductTypeString:(id)a3;
- (int64_t)retrieveProductType;
- (os_unfair_lock_s)capabilitiesLock;
- (os_unfair_lock_s)protectedLock;
- (unint64_t)collectionType;
- (unint64_t)deviceCategory;
- (unint64_t)hash;
- (unint64_t)materialType;
- (unint64_t)sizeClass;
- (unint64_t)version;
- (unsigned)nrDeviceVersion;
- (void)_loadDeviceInfo;
- (void)_loadSupportsVictoryFaces;
- (void)customCompanionSetup;
- (void)dealloc;
- (void)handleDeviceDidPairNotification;
- (void)setCachedKeybagLockState:(int)a3;
- (void)setCollectionType:(unint64_t)a3;
- (void)setHasRichMediaComplications:(BOOL)a3;
- (void)setIsBridgeActive:(BOOL)a3;
- (void)setIsExplorer:(BOOL)a3;
- (void)setIsLuxo:(BOOL)a3;
- (void)setIsTinker:(BOOL)a3;
- (void)setMaterialType:(unint64_t)a3;
- (void)setNrDevice:(id)a3;
- (void)setProductType:(int64_t)a3;
- (void)setProtectedLock:(os_unfair_lock_s)a3;
- (void)setScreenBounds:(CGRect)a3;
- (void)setScreenCornerRadius:(double)a3;
- (void)setScreenScale:(double)a3;
- (void)setSizeClass:(unint64_t)a3;
- (void)setSupportedCapabilitiesCache:(id)a3;
- (void)setSupportsCharon:(BOOL)a3;
- (void)setSupportsCompanionSync:(BOOL)a3;
- (void)setSupportsPolaris:(BOOL)a3;
- (void)setSupportsUrsa:(BOOL)a3;
- (void)updateKeybagLockStateCacheWithState:(int)a3;
- (void)updateTinkerState;
@end

@implementation CLKDevice

- (unint64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (BOOL)supportsVictoryFaces
{
  return self->_supportsVictoryFaces;
}

- (unint64_t)version
{
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  unint64_t version = self->_version;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return version;
}

+ (CLKDevice)currentDevice
{
  os_unfair_lock_lock((os_unfair_lock_t)&__deviceLock);
  v3 = (void *)__currentDevice;
  if (!__currentDevice)
  {
    if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1) {
      dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_597);
    }
    if (_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
    {
      v4 = +[CLKDevice activeNRDevice];
    }
    else
    {
      v4 = 0;
    }
    uint64_t v5 = [a1 _createCurrentDeviceWithNRDevice:v4];
    v6 = (void *)__currentDevice;
    __currentDevice = v5;

    v3 = (void *)__currentDevice;
  }
  id v7 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&__deviceLock);

  return (CLKDevice *)v7;
}

+ (id)_createCurrentDeviceWithNRDevice:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CLKDevice _createCurrentDeviceWithNRDevice:](v5);
    }
  }
  v6 = [a1 deviceForNRDevice:v4 forced:1];

  return v6;
}

+ (id)deviceForNRDevice:(id)a3 forced:(BOOL)a4
{
  id v8 = a3;
  v9 = v8;
  if (a4)
  {
    if (v8)
    {
      v10 = [v8 valueForProperty:*MEMORY[0x263F57620]];
      [a1 _removeCachedDeviceForUUID:v10];

LABEL_12:
      v17 = [v9 valueForProperty:*MEMORY[0x263F57620]];
      v18 = [a1 _cachedDeviceForUUID:v17];

      goto LABEL_18;
    }
    goto LABEL_14;
  }
  uint64_t v11 = [a1 currentDevice];
  if (!v11)
  {
    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v12 = (void *)v11;
  if (!v9)
  {
    id v4 = [a1 currentDevice];
    uint64_t v13 = [v4 nrDevice];
    if (!v13)
    {

      goto LABEL_16;
    }
    uint64_t v5 = (void *)v13;
  }
  v14 = [a1 currentDevice];
  v15 = [v14 nrDevice];
  int v16 = [v9 isEqual:v15];

  if (v9)
  {

    if (!v16) {
      goto LABEL_12;
    }
    goto LABEL_16;
  }

  if (v16)
  {
LABEL_16:
    uint64_t v19 = [a1 currentDevice];
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v19 = [a1 _cachedDeviceForUUID:0];
LABEL_17:
  v18 = (void *)v19;
LABEL_18:

  return v18;
}

+ (void)_createCurrentDeviceWithNRDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Creating a CLKDevice without an NRDevice: %@", (uint8_t *)&v1, 0xCu);
}

+ (id)_cachedDeviceForUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  if (cachedDevices)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    v9 = (void *)cachedDevices;
    cachedDevices = v8;

    if (v4) {
      goto LABEL_3;
    }
  }
  id v4 = [MEMORY[0x263EFF9D0] null];
LABEL_3:
  uint64_t v5 = [(id)cachedDevices objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = [a1 nrDeviceForNRDeviceUUID:v4];
    uint64_t v5 = [[CLKDevice alloc] initWithNRDevice:v6];
    [(id)cachedDevices setObject:v5 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v5;
}

- (CLKDevice)initWithNRDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKDevice;
  uint64_t v5 = [(CLKDevice *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_protectedLock._os_unfair_lock_opaque = 0;
    id v7 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 valueForProperty:*MEMORY[0x263F57620]];
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21C599000, v7, OS_LOG_TYPE_DEFAULT, "Creating a CLKDevice. nrDevice: %{public}@", buf, 0xCu);
    }
    [(CLKDevice *)v6 setNrDevice:v4];
    [(CLKDevice *)v6 _loadDeviceInfo];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel_handleDeviceDidPairNotification name:*MEMORY[0x263F576A8] object:0];

    [(CLKDevice *)v6 customCompanionSetup];
  }

  return v6;
}

- (void)setNrDevice:(id)a3
{
}

- (void)customCompanionSetup
{
  self->_unint64_t version = 1;
  self->_capabilitiesLock._os_unfair_lock_opaque = 0;
  uint64_t v3 = (NSMutableDictionary *)objc_opt_new();
  supportedCapabilitiesCache = self->_supportedCapabilitiesCache;
  self->_supportedCapabilitiesCache = v3;

  [(CLKDevice *)self _queryAndCacheNanoRegistryDeviceCapabilities];
  objc_initWeak(&location, self);
  uint64_t v5 = (const char *)[(id)*MEMORY[0x263F576D0] UTF8String];
  v6 = MEMORY[0x263EF83A0];
  id v7 = MEMORY[0x263EF83A0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__CLKDevice_customCompanionSetup__block_invoke;
  v8[3] = &unk_26440E5E0;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch(v5, &self->_pairedDeviceCapabilitiesChangeNotificationToken, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (id)activeNRDevice
{
  if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1) {
    dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_597);
  }
  if (_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
  {
    uint64_t v2 = [MEMORY[0x263F57730] sharedInstance];
    uint64_t v3 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
    id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
    uint64_t v5 = [v4 firstObject];
  }
  else
  {
    v6 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[CLKDevice activeNRDevice](v6);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)nrDeviceForNRDeviceUUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1) {
      dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_597);
    }
    if (_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
    {
      id v4 = [MEMORY[0x263F57730] sharedInstance];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __37__CLKDevice_nrDeviceForNRDeviceUUID___block_invoke;
      v9[3] = &unk_26440E658;
      v10 = v3;
      uint64_t v5 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];

      if ([v5 count])
      {
        v6 = [v5 firstObject];
      }
      else
      {
        v6 = 0;
      }

      id v7 = v10;
    }
    else
    {
      id v7 = CLKLoggingObjectForDomain(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        +[CLKDevice nrDeviceForNRDeviceUUID:](v7);
      }
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_loadDeviceInfo
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Gizmo(%@) has invalid size class! %d", (uint8_t *)&v3, 0x12u);
}

- (NRDevice)nrDevice
{
  return self->_nrDevice;
}

- (BOOL)supportsCapability:(id)a3
{
  id v4 = a3;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  supportedCapabilitiesCache = self->_supportedCapabilitiesCache;
  uint64_t v7 = [v4 UUIDString];
  uint64_t v8 = [(NSMutableDictionary *)supportedCapabilitiesCache objectForKey:v7];

  os_unfair_lock_unlock(&self->_capabilitiesLock);
  if (v8)
  {
    LOBYTE(v9) = [v8 BOOLValue];
  }
  else
  {
    uint64_t v9 = [(CLKDevice *)self _supportsCapabilityUncached:v4];
    os_unfair_lock_lock(&self->_capabilitiesLock);
    v10 = self->_supportedCapabilitiesCache;
    objc_super v11 = [NSNumber numberWithBool:v9];
    v12 = [v4 UUIDString];
    [(NSMutableDictionary *)v10 setObject:v11 forKey:v12];

    os_unfair_lock_unlock(p_capabilitiesLock);
  }

  return v9;
}

- (NSUUID)nrDeviceUUID
{
  uint64_t v2 = [(CLKDevice *)self nrDevice];
  int v3 = [v2 valueForProperty:*MEMORY[0x263F57620]];

  return (NSUUID *)v3;
}

- (BOOL)_supportsCapabilityUncached:(id)a3
{
  nrDevice = self->_nrDevice;
  if (nrDevice) {
    return [(NRDevice *)nrDevice supportsCapability:a3];
  }
  else {
    return 1;
  }
}

- (void)updateTinkerState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_protectedLock = &self->_protectedLock;
  os_unfair_lock_lock(&self->_protectedLock);
  BOOL isTinker = self->_isTinker;
  __int16 v5 = [(CLKDevice *)self nrDevice];
  int v6 = [v5 valueForProperty:*MEMORY[0x263F575B0]];
  self->_BOOL isTinker = [v6 BOOLValue];

  BOOL v7 = self->_isTinker;
  os_unfair_lock_unlock(p_protectedLock);
  if (isTinker != v7)
  {
    uint64_t v8 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      BOOL v10 = v7;
      _os_log_impl(&dword_21C599000, v8, OS_LOG_TYPE_DEFAULT, "Tinker state changed: %lu", (uint8_t *)&v9, 0xCu);
    }

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_6);
  }
}

- (int64_t)retrieveProductType
{
  int v3 = [(CLKDevice *)self nrDevice];
  id v4 = [v3 valueForProperty:*MEMORY[0x263F57628]];

  int64_t v5 = [(CLKDevice *)self productTypeFromProductTypeString:v4];
  return v5;
}

- (int64_t)productTypeFromProductTypeString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (productTypeFromProductTypeString__onceToken != -1) {
      dispatch_once(&productTypeFromProductTypeString__onceToken, &__block_literal_global_54);
    }
    id v4 = [(id)productTypeFromProductTypeString__mapping objectForKeyedSubscript:v3];
    int64_t v5 = v4;
    if (v4) {
      int64_t v6 = [v4 integerValue];
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (BOOL)isM8SOCInDeviceOfProductType:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 7;
}

- (BOOL)isLimitedToPreGloryDeviceOfProductType:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (void)_loadSupportsVictoryFaces
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  if ([(CLKDevice *)self supportsCapability:v3])
  {

LABEL_4:
    self->_supportsVictoryFaces = 1;
    return;
  }
  unint64_t v4 = [(CLKDevice *)self collectionType];

  if (v4 == 6) {
    goto LABEL_4;
  }
  id v6 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"35165B81-461F-4423-8903-A50CEFB1C204"];
  if (-[CLKDevice supportsCapability:](self, "supportsCapability:")) {
    BOOL v5 = [(CLKDevice *)self collectionType] != 5;
  }
  else {
    BOOL v5 = 0;
  }
  self->_supportsVictoryFaces = v5;
}

- (BOOL)_queryAndCacheNanoRegistryDeviceCapabilities
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  lock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  int supportsCompanionSync = self->_supportsCompanionSync;
  unint64_t v4 = [(CLKDevice *)self nrDevice];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"46526F47-0B4B-41FF-A959-AC358550958C"];
  self->_int supportsCompanionSync = [v4 supportsCapability:v5];

  int v6 = self->_supportsCompanionSync;
  int isExplorer = self->_isExplorer;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"Explorer", @"com.apple.ClockKit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue)
  {
    int v9 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C599000, v9, OS_LOG_TYPE_DEFAULT, "OVERRIDE explorer", buf, 2u);
    }

    int v10 = 1;
  }
  else
  {
    uint64_t v11 = [(CLKDevice *)self nrDevice];
    v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
    int v10 = [v11 supportsCapability:v12];
  }
  self->_int isExplorer = v10;
  BOOL hasRichMediaComplications = self->_hasRichMediaComplications;
  uint64_t v14 = [(CLKDevice *)self nrDevice];
  v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"873627CA-D131-46F4-B477-E653F7445DF9"];
  self->_BOOL hasRichMediaComplications = [v14 supportsCapability:v15];

  BOOL v16 = 1;
  if (v6 == supportsCompanionSync && isExplorer == v10) {
    BOOL v16 = self->_hasRichMediaComplications != hasRichMediaComplications;
  }
  int supportsUrsa = self->_supportsUrsa;
  Boolean keyExistsAndHasValidFormat = 0;
  int v18 = CFPreferencesGetAppBooleanValue(@"Ursa", @"com.apple.ClockKit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && v18)
  {
    uint64_t v19 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C599000, v19, OS_LOG_TYPE_DEFAULT, "OVERRIDE ursa", buf, 2u);
    }
  }
  else
  {
    v20 = [(CLKDevice *)self nrDevice];

    if (v20)
    {
      v21 = [(CLKDevice *)self nrDevice];
      v22 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AB764CE8-D4DF-4DB6-991C-3A298E380BD1"];
      int v23 = [v21 supportsCapability:v22];

      goto LABEL_18;
    }
  }
  int v23 = 1;
LABEL_18:
  self->_int supportsUrsa = v23;
  if (supportsUrsa != v23) {
    BOOL v16 = 1;
  }
  int supportsPolaris = self->_supportsPolaris;
  Boolean keyExistsAndHasValidFormat = 0;
  int v25 = CFPreferencesGetAppBooleanValue(@"AbsoluteAltitudeEnabled", @"com.apple.locationd", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && v25)
  {
    v26 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C599000, v26, OS_LOG_TYPE_DEFAULT, "OVERRIDE polaris", buf, 2u);
    }
  }
  else
  {
    v27 = [(CLKDevice *)self nrDevice];

    if (v27)
    {
      v28 = [(CLKDevice *)self nrDevice];
      v29 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FEBBC201-B013-4680-94B0-7F4129F4CCB8"];
      int v30 = [v28 supportsCapability:v29];

      goto LABEL_28;
    }
  }
  int v30 = 1;
LABEL_28:
  self->_int supportsPolaris = v30;
  if (supportsPolaris != v30) {
    BOOL v16 = 1;
  }
  int supportsCharon = self->_supportsCharon;
  v32 = [(CLKDevice *)self nrDevice];

  if (v32)
  {
    v33 = [(CLKDevice *)self nrDevice];
    v34 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E553D9C1-2587-4142-B286-C556E89F51F3"];
    int v35 = [v33 supportsCapability:v34];
  }
  else
  {
    int v35 = 1;
  }
  self->_int supportsCharon = v35;
  int v36 = supportsCharon != v35 || v16;
  int runningGraceOrLater = self->_runningGraceOrLater;
  v38 = [(CLKDevice *)self nrDevice];
  if (v38)
  {
    v39 = [(CLKDevice *)self nrDevice];
    v40 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"887DC9F2-A55D-41F6-8639-64776A041BF1"];
    self->_int runningGraceOrLater = [v39 supportsCapability:v40];
  }
  else
  {
    self->_int runningGraceOrLater = 1;
  }

  if (v36)
  {
    [(CLKDevice *)self _checkUpdateFlushCapabilitiesCache_locked];
  }
  else
  {
    int v41 = self->_runningGraceOrLater;
    if (![(CLKDevice *)self _checkUpdateFlushCapabilitiesCache_locked]
      && v41 == runningGraceOrLater)
    {
      BOOL v42 = 0;
      goto LABEL_45;
    }
  }
  ++self->_version;
  BOOL v42 = 1;
LABEL_45:
  os_unfair_lock_unlock(locka);
  v43 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v44 = self->_isExplorer;
    *(_DWORD *)buf = 67109120;
    BOOL v61 = v44;
    _os_log_impl(&dword_21C599000, v43, OS_LOG_TYPE_DEFAULT, "CLKDevice isExplorer: %u", buf, 8u);
  }

  v45 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v46 = self->_hasRichMediaComplications;
    *(_DWORD *)buf = 67109120;
    BOOL v61 = v46;
    _os_log_impl(&dword_21C599000, v45, OS_LOG_TYPE_DEFAULT, "CLKDevice hasRichMediaComplications: %u", buf, 8u);
  }

  v47 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v48 = self->_runningGraceOrLater;
    *(_DWORD *)buf = 67109120;
    BOOL v61 = v48;
    _os_log_impl(&dword_21C599000, v47, OS_LOG_TYPE_DEFAULT, "CLKDevice runningGraceOrLater: %u", buf, 8u);
  }

  v49 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v50 = self->_supportsUrsa;
    *(_DWORD *)buf = 67109120;
    BOOL v61 = v50;
    _os_log_impl(&dword_21C599000, v49, OS_LOG_TYPE_DEFAULT, "CLKDevice supportsUrsa: %u", buf, 8u);
  }

  v51 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v52 = self->_supportsPolaris;
    *(_DWORD *)buf = 67109120;
    BOOL v61 = v52;
    _os_log_impl(&dword_21C599000, v51, OS_LOG_TYPE_DEFAULT, "CLKDevice supportsPolaris: %u", buf, 8u);
  }

  v53 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v54 = self->_supportsCharon;
    *(_DWORD *)buf = 67109120;
    BOOL v61 = v54;
    _os_log_impl(&dword_21C599000, v53, OS_LOG_TYPE_DEFAULT, "CLKDevice supportsCharon: %u", buf, 8u);
  }

  v55 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v61 = v42;
    _os_log_impl(&dword_21C599000, v55, OS_LOG_TYPE_DEFAULT, "CLKDevice capabilityChanged: %u", buf, 8u);
  }

  return v42;
}

- (BOOL)_checkUpdateFlushCapabilitiesCache_locked
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(NSMutableDictionary *)self->_supportedCapabilitiesCache allKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
        int v10 = [(NSMutableDictionary *)self->_supportedCapabilitiesCache objectForKeyedSubscript:v8];
        int v11 = [v10 BOOLValue];

        BOOL v12 = [(CLKDevice *)self _supportsCapabilityUncached:v9];
        if (v11 != v12)
        {
          BOOL v13 = v12;
          uint64_t v14 = [NSNumber numberWithBool:v12];
          [(NSMutableDictionary *)self->_supportedCapabilitiesCache setObject:v14 forKeyedSubscript:v8];

          v15 = CLKLoggingObjectForDomain(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v23 = v8;
            __int16 v24 = 1024;
            BOOL v25 = v13;
            _os_log_impl(&dword_21C599000, v15, OS_LOG_TYPE_DEFAULT, "CLKDevice _checkUpdateFlushCapabilitiesCache_locked: [%{public}@] changed to [%d]", buf, 0x12u);
          }

          char v5 = 1;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

+ (double)screenScaleForSizeClass:(unint64_t)a3
{
  return 2.0;
}

+ (double)screenCornerRadiusForSizeClass:(unint64_t)a3
{
  double result = 28.0;
  if (a3 <= 8) {
    return dbl_21C614A90[a3];
  }
  return result;
}

+ (CGRect)screenBoundsForSizeClass:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 170.0;
      uint64_t v5 = 0x4061000000000000;
      goto LABEL_11;
    case 1uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 195.0;
      double v6 = 156.0;
      break;
    case 2uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 197.0;
      double v6 = 162.0;
      break;
    case 3uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 224.0;
      uint64_t v5 = 0x4067000000000000;
      goto LABEL_11;
    case 4uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 215.0;
      uint64_t v5 = 0x4066000000000000;
      goto LABEL_11;
    case 5uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 242.0;
      double v6 = 198.0;
      break;
    case 6uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 251.0;
      double v6 = 205.0;
      break;
    case 7uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 223.0;
      double v6 = 187.0;
      break;
    case 8uLL:
      long long v3 = *MEMORY[0x263F00148];
      double v4 = 248.0;
      uint64_t v5 = 0x406A000000000000;
LABEL_11:
      double v6 = *(double *)&v5;
      break;
    default:
      break;
  }
  double v7 = *((double *)&v3 + 1);
  result.origin.x = *(double *)&v3;
  result.size.height = v4;
  result.size.width = v6;
  result.origin.y = v7;
  return result;
}

- (void)setIsBridgeActive:(BOOL)a3
{
  self->_isBridgeActive = a3;
}

- (double)screenCornerRadius
{
  return self->_screenCornerRadius;
}

- (BOOL)isBridgeActive
{
  return self->_isBridgeActive;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    long long v3 = [MEMORY[0x263F08AB0] processInfo];
    double v4 = [v3 processName];
    char v5 = [v4 isEqualToString:@"Bridge"];

    if ((v5 & 1) == 0)
    {
      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 addObserver:a1 selector:sel__deviceDidBecomeActive_ name:*MEMORY[0x263F57688] object:0];
    }
  }
}

- (BOOL)isRunningGraceOrLater
{
  uint64_t v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_runningGraceOrLater;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

+ (id)deviceForDescriptor:(id)a3
{
  double v4 = [a3 nrDeviceUUID];
  char v5 = [a1 deviceForNRDeviceUUID:v4];

  return v5;
}

- (CLKDeviceDescriptor)descriptor
{
  long long v3 = [CLKDeviceDescriptor alloc];
  double v4 = [(NRDevice *)self->_nrDevice pairingID];
  char v5 = [(CLKDeviceDescriptor *)v3 initWithNRDeviceUUID:v4];

  return v5;
}

+ (void)setCurrentDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = [v3 nrDevice];
    id v6 = [v5 valueForProperty:*MEMORY[0x263F57620]];
    int v8 = 138543618;
    id v9 = v3;
    __int16 v10 = 2114;
    int v11 = v6;
    _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "Setting new current device. %{public}@, %{public}@", (uint8_t *)&v8, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__deviceLock);
  double v7 = (void *)__currentDevice;
  __currentDevice = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&__deviceLock);
}

+ (void)resetCurrentDevice
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (_CLKDeviceHasNanoRegistryEntitlement_onceToken != -1) {
    dispatch_once(&_CLKDeviceHasNanoRegistryEntitlement_onceToken, &__block_literal_global_597);
  }
  uint64_t v3 = _CLKDeviceHasNanoRegistryEntitlement_hasEntitlement;
  if (_CLKDeviceHasNanoRegistryEntitlement_hasEntitlement)
  {
    double v4 = +[CLKDevice activeNRDevice];
  }
  else
  {
    double v4 = 0;
  }
  char v5 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 valueForProperty:*MEMORY[0x263F57620]];
    int v8 = 138543874;
    id v9 = v6;
    __int16 v10 = 2048;
    BOOL v11 = v4 == 0;
    __int16 v12 = 2048;
    uint64_t v13 = v3;
    _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "Resetting current device with nrdevice %{public}@ - isNil:%lu hasEntitlement:%lu", (uint8_t *)&v8, 0x20u);
  }
  double v7 = [a1 _createCurrentDeviceWithNRDevice:v4];
  [a1 setCurrentDevice:v7];
}

+ (void)enumerateSizeClasses:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void (**)(id, uint64_t, unsigned char *))a3;
  char v12 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [&unk_26CCDC5D0 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(&unk_26CCDC5D0);
      }
      if (v12) {
        break;
      }
      v3[2](v3, [*(id *)(*((void *)&v8 + 1) + 8 * v7++) integerValue], &v12);
      if (v5 == v7)
      {
        uint64_t v5 = [&unk_26CCDC5D0 countByEnumeratingWithState:&v8 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __33__CLKDevice_customCompanionSetup__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = WeakRetained;
      _os_log_impl(&dword_21C599000, v2, OS_LOG_TYPE_DEFAULT, "Got NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification refresh CLKDevice: %@", (uint8_t *)&v5, 0xCu);
    }

    if ([WeakRetained _queryAndCacheNanoRegistryDeviceCapabilities])
    {
      uint64_t v3 = CLKLoggingObjectForDomain(0);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        id v6 = WeakRetained;
        _os_log_impl(&dword_21C599000, v3, OS_LOG_TYPE_DEFAULT, "NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification capabilities changed sending CLKActiveDeviceChangedNotification for CLKDevice: %@", (uint8_t *)&v5, 0xCu);
      }

      uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
      [v4 postNotificationName:@"CLKActiveDeviceChangedNotification" object:WeakRetained];
    }
  }
}

- (void)handleDeviceDidPairNotification
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CLKDevice *)self nrDevice];
  uint64_t v4 = [v3 valueForProperty:*MEMORY[0x263F57620]];

  int v5 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v11 = v4;
    _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "Received device paired notification: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CLKDevice_handleDeviceDidPairNotification__block_invoke;
  v7[3] = &unk_26440E608;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __44__CLKDevice_handleDeviceDidPairNotification__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = [*(id *)(a1 + 40) nrDevice];
    [v2 _handleNRDeviceChanged:v3];
  }
  else
  {
    uint64_t v4 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__CLKDevice_handleDeviceDidPairNotification__block_invoke_cold_1(v4);
    }
  }
  return [*(id *)(a1 + 40) updateTinkerState];
}

+ (void)_deviceDidBecomeActive:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 userInfo];
  int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F57680]];

  id v6 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 valueForProperty:*MEMORY[0x263F57620]];
    int v8 = 138543362;
    long long v9 = v7;
    _os_log_impl(&dword_21C599000, v6, OS_LOG_TYPE_DEFAULT, "new NRDevice became active - %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [a1 _handleNRDeviceChanged:v5];
}

+ (void)_handleNRDeviceChanged:(id)a3
{
  uint64_t v4 = [a1 _createCurrentDeviceWithNRDevice:a3];
  [a1 setCurrentDevice:v4];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"CLKActiveDeviceChangedNotification" object:0];
}

- (void)dealloc
{
  notify_cancel(self->_pairedDeviceCapabilitiesChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)CLKDevice;
  [(CLKDevice *)&v3 dealloc];
}

- (BOOL)isTinker
{
  uint64_t v2 = self;
  p_protectedLock = &self->_protectedLock;
  os_unfair_lock_lock(&self->_protectedLock);
  LOBYTE(v2) = v2->_isTinker;
  os_unfair_lock_unlock(p_protectedLock);
  return (char)v2;
}

void __30__CLKDevice_updateTinkerState__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"CLKActiveDeviceChangedTinkerState" object:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 nrDevice];
    if (v5)
    {
    }
    else
    {
      uint64_t v7 = [(CLKDevice *)self nrDevice];

      if (!v7)
      {
        char v6 = 1;
        goto LABEL_7;
      }
    }
    int v8 = [v4 nrDevice];
    long long v9 = [(CLKDevice *)self nrDevice];
    char v6 = [v8 isEqual:v9];
  }
  else
  {
    char v6 = 0;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return [(NRDevice *)self->_nrDevice hash];
}

void __46__CLKDevice_productTypeFromProductTypeString___block_invoke()
{
  id v0 = (void *)productTypeFromProductTypeString__mapping;
  productTypeFromProductTypeString__mapping = (uint64_t)&unk_26CCDC580;
}

- (int64_t)productFamilyType
{
  unint64_t productType = self->_productType;
  if (productType > 0x32) {
    return -1;
  }
  else {
    return qword_21C6148F8[productType];
  }
}

- (BOOL)isExplorer
{
  uint64_t v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_isExplorer;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)hasRichMediaComplications
{
  uint64_t v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_hasRichMediaComplications;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)supportsUrsa
{
  uint64_t v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_supportsUrsa;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)supportsPolaris
{
  uint64_t v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_supportsPolaris;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)supportsCharon
{
  uint64_t v2 = self;
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  LOBYTE(v2) = v2->_supportsCharon;
  os_unfair_lock_unlock(p_capabilitiesLock);
  return (char)v2;
}

- (BOOL)isLocked
{
  if (_RegisterForLockedStatusChangeIfNecessary_onceToken != -1) {
    dispatch_once(&_RegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_637);
  }
  uint64_t v3 = MKBGetDeviceLockState();
  [(CLKDevice *)self updateKeybagLockStateCacheWithState:v3];
  if (v3) {
    BOOL v4 = v3 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (BOOL)unlockedSinceBoot
{
  if (_RegisterForLockedStatusChangeIfNecessary_onceToken != -1) {
    dispatch_once(&_RegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_637);
  }
  uint64_t v3 = MKBGetDeviceLockState();
  [(CLKDevice *)self updateKeybagLockStateCacheWithState:v3];
  return v3 == 3 || MKBDeviceUnlockedSinceBoot() == 1;
}

- (void)updateKeybagLockStateCacheWithState:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__CLKDevice_updateKeybagLockStateCacheWithState___block_invoke;
  v3[3] = &unk_26440E630;
  int v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __49__CLKDevice_updateKeybagLockStateCacheWithState___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) cachedKeybagLockState])
  {
    [*(id *)(a1 + 32) setCachedKeybagLockState:*(unsigned int *)(a1 + 40)];
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"CLKDeviceLockStateChangedNotification" object:0];
  }
}

+ (id)deviceForNRDevice:(id)a3
{
  return (id)[a1 deviceForNRDevice:a3 forced:0];
}

+ (void)_removeCachedDeviceForUUID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (cachedDevices)
    {
      [(id)cachedDevices removeObjectForKey:v3];
      int v4 = CLKLoggingObjectForDomain(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [v3 UUIDString];
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "Purged CLKDevice with UUID %@", (uint8_t *)&v6, 0xCu);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  }
}

+ (unsigned)NRProductVersionForNRDevice:(id)a3
{
  return NRWatchOSVersionForRemoteDevice();
}

+ (BOOL)NRDeviceIsRunningDaytonaOrLater:(id)a3
{
  return NRWatchOSVersionForRemoteDevice() >> 16 > 2;
}

- (unsigned)nrDeviceVersion
{
  int v2 = [(CLKDevice *)self nrDevice];
  unsigned int v3 = NRWatchOSVersionForRemoteDevice();

  return v3;
}

uint64_t __37__CLKDevice_nrDeviceForNRDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 valueForProperty:*MEMORY[0x263F57620]];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (id)CLKDeviceUUIDForNRDevice:(id)a3
{
  return (id)[a3 valueForProperty:*MEMORY[0x263F57620]];
}

- (BOOL)isPaired
{
  int v2 = +[CLKDevice activeNRDevice];
  unsigned int v3 = [v2 valueForProperty:*MEMORY[0x263F57620]];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)supportsWidgetMigration
{
  return self->_nrDevice != 0;
}

- (void)setSizeClass:(unint64_t)a3
{
  self->_sizeClass = a3;
}

- (CGRect)screenBounds
{
  double x = self->_screenBounds.origin.x;
  double y = self->_screenBounds.origin.y;
  double width = self->_screenBounds.size.width;
  double height = self->_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (void)setScreenCornerRadius:(double)a3
{
  self->_screenCornerRadius = a3;
}

- (BOOL)isLuxo
{
  return self->_isLuxo;
}

- (void)setIsLuxo:(BOOL)a3
{
  self->_isLuxo = a3;
}

- (void)setIsExplorer:(BOOL)a3
{
  self->_int isExplorer = a3;
}

- (void)setHasRichMediaComplications:(BOOL)a3
{
  self->_BOOL hasRichMediaComplications = a3;
}

- (void)setSupportsUrsa:(BOOL)a3
{
  self->_int supportsUrsa = a3;
}

- (BOOL)supportsTritium
{
  return self->_supportsTritium;
}

- (BOOL)isZeusBlack
{
  return self->_isZeusBlack;
}

- (void)setIsTinker:(BOOL)a3
{
  self->_BOOL isTinker = a3;
}

- (void)setSupportsPolaris:(BOOL)a3
{
  self->_int supportsPolaris = a3;
}

- (void)setSupportsCharon:(BOOL)a3
{
  self->_int supportsCharon = a3;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (unint64_t)materialType
{
  return self->_materialType;
}

- (void)setMaterialType:(unint64_t)a3
{
  self->_materialType = a3;
}

- (int64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(int64_t)a3
{
  self->_unint64_t productType = a3;
}

- (NSNumber)deviceBrand
{
  return self->_deviceBrand;
}

- (BOOL)isRunningDaytonaOrLater
{
  return self->_isRunningDaytonaOrLater;
}

- (BOOL)isRunningGloryFOrLater
{
  return self->_isRunningGloryFOrLater;
}

- (BOOL)isRunningGloryGMOrLater
{
  return self->_isRunningGloryGMOrLater;
}

- (BOOL)limitedToPreGlory
{
  return self->_limitedToPreGlory;
}

- (BOOL)limitedToPreHunter
{
  return self->_limitedToPreHunter;
}

- (int)pairedDeviceCapabilitiesChangeNotificationToken
{
  return self->_pairedDeviceCapabilitiesChangeNotificationToken;
}

- (os_unfair_lock_s)capabilitiesLock
{
  return self->_capabilitiesLock;
}

- (NSMutableDictionary)supportedCapabilitiesCache
{
  return self->_supportedCapabilitiesCache;
}

- (void)setSupportedCapabilitiesCache:(id)a3
{
}

- (int)cachedKeybagLockState
{
  return self->_cachedKeybagLockState;
}

- (void)setCachedKeybagLockState:(int)a3
{
  self->_cachedKeybagLockState = a3;
}

- (os_unfair_lock_s)protectedLock
{
  return self->_protectedLock;
}

- (void)setProtectedLock:(os_unfair_lock_s)a3
{
  self->_protectedLock = a3;
}

- (BOOL)supportsCompanionSync
{
  return self->_supportsCompanionSync;
}

- (void)setSupportsCompanionSync:(BOOL)a3
{
  self->_int supportsCompanionSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCapabilitiesCache, 0);
  objc_storeStrong((id *)&self->_nrDevice, 0);

  objc_storeStrong((id *)&self->_deviceBrand, 0);
}

- (CLKDevice)initWithSizeClass:(unint64_t)a3
{
  CGRect result = [(CLKDevice *)self initWithNRDevice:0];
  if (result) {
    result->_sizeClass = a3;
  }
  return result;
}

void __44__CLKDevice_handleDeviceDidPairNotification__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Received device paired notification, but skipping NRDevice update because UUID is nil", v1, 2u);
}

+ (void)nrDeviceForNRDeviceUUID:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "+[CLKDevice nrDeviceForNRDeviceUUID:]";
  _os_log_fault_impl(&dword_21C599000, log, OS_LOG_TYPE_FAULT, "Calls to %s require NanoRegistry entitlement!", (uint8_t *)&v1, 0xCu);
}

+ (void)activeNRDevice
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "+[CLKDevice activeNRDevice]";
  _os_log_fault_impl(&dword_21C599000, log, OS_LOG_TYPE_FAULT, "Calls to %s require NanoRegistry entitlement!", (uint8_t *)&v1, 0xCu);
}

@end