@interface HAENLocationGatingHelper
+ (id)sharedInstance;
- ($B3539EB95208BC17E9E1039C55835172)getStats;
- (BOOL)_isHAENFeatureMandatory:(id)a3 dataDisposition:(id)a4;
- (BOOL)_isIPad;
- (BOOL)_isIPod;
- (BOOL)_isMandatoryDeviceClass;
- (BOOL)_regionAndDeviceMandatesFeature:(id)a3;
- (BOOL)_shouldUpdateLocation:(id)a3;
- (BOOL)_validCountryCodeSource:(unsigned int)a3;
- (BOOL)_validDataDisposition:(id)a3;
- (HAENLocationGatingHelper)init;
- (id)_readDeviceDisposition;
- (int)_getMGProductType;
- (void)_contryConfigurationDidChange:(id)a3;
- (void)_donateSignalToTipsKit:(BOOL)a3;
- (void)_donateSignalToTipsKitOnInitialization;
- (void)_loadRegionPlistFile;
- (void)_logLocationGatingFlags;
- (void)_setFeatureMandatoryFlag:(id)a3;
- (void)_setHEANEnabled:(id)a3;
- (void)_updateImpl;
- (void)_updateLocationGatingFlags;
- (void)_updateSampleTransient:(id)a3;
- (void)_updateStatsWithGeoLocation:(id)a3 disposition:(id)a4 andMandatoryFlag:(BOOL)a5;
- (void)dealloc;
- (void)deviceDataDispositionDidChange;
- (void)reloadProductTypeOverride;
- (void)update;
@end

@implementation HAENLocationGatingHelper

- (BOOL)_shouldUpdateLocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = GetDeviceSpecificDefaults(@"HAENFeatureMandatory");
  if (-[HAENLocationGatingHelper _isIPad](self, "_isIPad") && ([v5 BOOLValue] & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v7 = GetDeviceSpecificDefaults(@"HAENGeoLocationSource");
    if (v7) {
      v8 = (void *)v7;
    }
    else {
      v8 = &unk_26D152008;
    }
    uint64_t v6 = -[HAENLocationGatingHelper _validCountryCodeSource:](self, "_validCountryCodeSource:", [v4 source]);
    v9 = HAENotificationsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v4 describeSource];
      v11 = [NSNumber numberWithBool:v6];
      int v13 = 138412802;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_21FABA000, v9, OS_LOG_TYPE_DEFAULT, "Stored geo location source: %@, new source: %@, valid: %@", (uint8_t *)&v13, 0x20u);
    }
    if (v6)
    {
      LODWORD(v6) = [v4 source];
      LOBYTE(v6) = v6 > [v8 intValue];
    }
  }
  return v6;
}

uint64_t __34__HAENLocationGatingHelper_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateImpl];
}

- (void)update
{
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HAENLocationGatingHelper_update__block_invoke;
  block[3] = &unk_2645274F0;
  block[4] = self;
  dispatch_sync(updateQueue, block);
}

- (BOOL)_validCountryCodeSource:(unsigned int)a3
{
  return a3 == 2 || (a3 & 0xFFFFFFFE) == 4;
}

- (void)_updateImpl
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(HAENLocationGatingHelper *)self _logLocationGatingFlags];
  v3 = objc_alloc_init(HAENGeoLocation);
  if ([(HAENGeoLocation *)self->_geoLocation source] == 2)
  {
    id v4 = HAENotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      geoLocation = self->_geoLocation;
      int v11 = 138412546;
      v12 = geoLocation;
      __int16 v13 = 2112;
      v14 = v3;
      uint64_t v6 = "geo location since was overriden: %@, new location: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 22;
LABEL_7:
      _os_log_impl(&dword_21FABA000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  BOOL v9 = [(HAENLocationGatingHelper *)self _shouldUpdateLocation:v3];
  id v4 = HAENotificationsLog();
  BOOL v10 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      int v11 = 138412290;
      v12 = v3;
      uint64_t v6 = "updating to new geo location: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
      goto LABEL_7;
    }
LABEL_8:

    objc_storeStrong((id *)&self->_geoLocation, v3);
    [(HAENLocationGatingHelper *)self _updateLocationGatingFlags];
    goto LABEL_12;
  }
  if (v10)
  {
    int v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "HAEN GeoLocation update skipped for new location: %@", (uint8_t *)&v11, 0xCu);
  }

LABEL_12:
}

- (void)_logLocationGatingFlags
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263F28B98];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F28B98]);
  CFDictionaryRef v3 = CFPreferencesCopyMultiple(0, v2, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFDictionaryRef v6 = v3;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "HAEN flags: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)_isIPad
{
  CFStringRef v2 = (void *)MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (void)_contryConfigurationDidChange:(id)a3
{
  id v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "Received Geo Location Notification from GeoServices", v5, 2u);
  }

  [(HAENLocationGatingHelper *)self update];
}

+ (id)sharedInstance
{
  if (sharedInstance_once_7 != -1) {
    dispatch_once(&sharedInstance_once_7, &__block_literal_global_10);
  }
  CFStringRef v2 = (void *)sharedInstance_instance_7;
  return v2;
}

uint64_t __42__HAENLocationGatingHelper_sharedInstance__block_invoke()
{
  sharedInstance_instance_7 = objc_alloc_init(HAENLocationGatingHelper);
  return MEMORY[0x270F9A758]();
}

- (HAENLocationGatingHelper)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)HAENLocationGatingHelper;
  CFStringRef v2 = [(HAENLocationGatingHelper *)&v18 init];
  if (v2)
  {
    char v3 = objc_alloc_init(HAENGeoLocation);
    geoLocation = v2->_geoLocation;
    v2->_geoLocation = v3;

    int v5 = HAENotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFDictionaryRef v6 = v2->_geoLocation;
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "HAENLocationGating: geo location at init time: %@", buf, 0xCu);
    }

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreaudio.hae.location_gating", v7);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v8;

    id v10 = objc_alloc_init(MEMORY[0x263F28C30]);
    uint64_t v11 = [v10 getPreferenceFor:*MEMORY[0x263F28BC8]];
    productTypeOverride = v2->_productTypeOverride;
    v2->_productTypeOverride = (NSNumber *)v11;

    if ([(HAENGeoLocation *)v2->_geoLocation source] != 2)
    {
      __int16 v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 addObserver:v2 selector:sel__contryConfigurationDidChange_ name:*MEMORY[0x263F41650] object:0];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)GeoLocationDidChange, (CFStringRef)*MEMORY[0x263F28B68], 0, (CFNotificationSuspensionBehavior)0);
    v2->_EUVolumeLimitFlagOn = MGGetBoolAnswer();
    uint64_t v15 = HAENotificationsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [NSNumber numberWithBool:v2->_EUVolumeLimitFlagOn];
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_21FABA000, v15, OS_LOG_TYPE_DEFAULT, "HAENLocationGating: EU Volume Limit behavior: %@", buf, 0xCu);
    }
    [(HAENLocationGatingHelper *)v2 _loadRegionPlistFile];
    [(HAENLocationGatingHelper *)v2 update];
    [(HAENLocationGatingHelper *)v2 _donateSignalToTipsKitOnInitialization];
  }
  return v2;
}

- (void)_setFeatureMandatoryFlag:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "*** setting HAEN feature mandatory flag to %@", (uint8_t *)&v6, 0xCu);
  }

  SetDeviceSpecificDefaultsFor(@"HAENFeatureMandatory", v4);
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F28B98]);
  [(HAENLocationGatingHelper *)self _updateSampleTransient:v4];
  [(HAENLocationGatingHelper *)self _setHEANEnabled:v4];
}

- (void)_updateLocationGatingFlags
{
  char v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HAENGeoLocation source](self->_geoLocation, "source"));
  SetDeviceSpecificDefaultsFor(@"HAENGeoLocationSource", v3);

  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F28B98]);
  id v6 = [(HAENLocationGatingHelper *)self _readDeviceDisposition];
  BOOL v4 = [(HAENLocationGatingHelper *)self _isHAENFeatureMandatory:self->_geoLocation dataDisposition:v6];
  int v5 = [NSNumber numberWithBool:v4];
  [(HAENLocationGatingHelper *)self _setFeatureMandatoryFlag:v5];
}

- (void)_setHEANEnabled:(id)a3
{
  id v5 = a3;
  id v3 = objc_alloc_init(MEMORY[0x263F28C30]);
  id v4 = (id)[v3 setPreferenceFor:*MEMORY[0x263F28BE0] value:v5];
}

- (void)_updateSampleTransient:(id)a3
{
  if ([a3 BOOLValue])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F28C30]);
    [v3 removePreferenceFor:*MEMORY[0x263F28C00]];
    [v3 migrateKeyEnableHAEHKMeasurement:0];
  }
}

- (void)deviceDataDispositionDidChange
{
  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HAENLocationGatingHelper_deviceDataDispositionDidChange__block_invoke;
  block[3] = &unk_2645274F0;
  block[4] = self;
  dispatch_sync(updateQueue, block);
}

uint64_t __58__HAENLocationGatingHelper_deviceDataDispositionDidChange__block_invoke(uint64_t a1)
{
  CFStringRef v2 = HAENotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21FABA000, v2, OS_LOG_TYPE_DEFAULT, "HAEN Location Gating updating device data disposition", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateImpl];
}

- (BOOL)_isMandatoryDeviceClass
{
  if (_isMandatoryDeviceClass_once != -1) {
    dispatch_once(&_isMandatoryDeviceClass_once, &__block_literal_global_87);
  }
  return _isMandatoryDeviceClass_ans;
}

void __51__HAENLocationGatingHelper__isMandatoryDeviceClass__block_invoke()
{
  id v1 = (id)MGGetStringAnswer();
  if (([v1 isEqualToString:@"iPhone"] & 1) != 0
    || ([v1 isEqualToString:@"iPod"] & 1) != 0)
  {
    char v0 = 1;
  }
  else
  {
    char v0 = [v1 isEqualToString:@"Watch"];
  }
  _isMandatoryDeviceClass_ans = v0;
}

- (BOOL)_isHAENFeatureMandatory:(id)a3 dataDisposition:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 countryCode];
  BOOL v9 = [(HAENLocationGatingHelper *)self _regionAndDeviceMandatesFeature:v8];

  unsigned int v10 = !v9 | [v6 isEqualToString:*MEMORY[0x263F28B90]];
  if (self->_EUVolumeLimitFlagOn) {
    unsigned int v11 = 0;
  }
  else {
    unsigned int v11 = v10;
  }
  uint64_t v12 = ([(HAENLocationGatingHelper *)self _isIPad] | v11) ^ 1;
  __int16 v13 = HAENotificationsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [NSNumber numberWithBool:v12];
    uint64_t v15 = [NSNumber numberWithBool:v9];
    v16 = [NSNumber numberWithBool:self->_EUVolumeLimitFlagOn];
    int v18 = 138413058;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_21FABA000, v13, OS_LOG_TYPE_DEFAULT, "*** HAE Feature Regional Status: ** %@ ** [ Mandatory: %@, Dispositon: %@, EUVolumeLimit: %@ ]", (uint8_t *)&v18, 0x2Au);
  }
  [(HAENLocationGatingHelper *)self _updateStatsWithGeoLocation:v7 disposition:v6 andMandatoryFlag:v12];

  [(HAENLocationGatingHelper *)self _donateSignalToTipsKit:v12];
  return v12;
}

- (id)_readDeviceDisposition
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CFStringRef v2 = GetDeviceSpecificDefaults((const __CFString *)*MEMORY[0x263F28BC0]);
  id v3 = HAENotificationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_21FABA000, v3, OS_LOG_TYPE_DEFAULT, "*** Device data disposition is: %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (BOOL)_validDataDisposition:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F28B90]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x263F28B88]];
  }

  return v4;
}

- (BOOL)_isIPod
{
  CFStringRef v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPod"];

  return v3;
}

- (void)_loadRegionPlistFile
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21FABA000, log, OS_LOG_TYPE_ERROR, "Failed to load regional behavior plist", v1, 2u);
}

- (BOOL)_regionAndDeviceMandatesFeature:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(NSDictionary *)self->_regionBehavior objectForKey:v4];
    id v6 = [v5 valueForKey:@"haen"];
    int v7 = [v6 BOOLValue];

    BOOL v8 = [(HAENLocationGatingHelper *)self _isMandatoryDeviceClass];
    BOOL v9 = HAENotificationsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = "optional";
      if (v7) {
        unsigned int v11 = "mandatory";
      }
      else {
        unsigned int v11 = "optional";
      }
      int v14 = 136315650;
      uint64_t v15 = v11;
      if (v8) {
        unsigned int v10 = "mandatory";
      }
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v10;
      _os_log_impl(&dword_21FABA000, v9, OS_LOG_TYPE_DEFAULT, "HAEN is [%s] for country: [%@] with device [%s]", (uint8_t *)&v14, 0x20u);
    }

    BOOL v12 = v7 & v8;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (int)_getMGProductType
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = MGGetProductType();
  productTypeOverride = self->_productTypeOverride;
  if (productTypeOverride)
  {
    int v3 = [(NSNumber *)productTypeOverride unsignedIntValue];
    int v5 = HAENotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = [(NSNumber *)self->_productTypeOverride unsignedLongValue];
      int v8 = 134217984;
      unint64_t v9 = v6;
      _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "HAEN device product type is overriden: 0x%08lx", (uint8_t *)&v8, 0xCu);
    }
  }
  return v3;
}

- (void)dealloc
{
  if ([(HAENGeoLocation *)self->_geoLocation source] != 2)
  {
    int v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F41650] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)HAENLocationGatingHelper;
  [(HAENLocationGatingHelper *)&v4 dealloc];
}

- ($B3539EB95208BC17E9E1039C55835172)getStats
{
  return ($B3539EB95208BC17E9E1039C55835172 *)__copy_constructor_8_8_s0_s8_s16_t24w2((uint64_t)retstr, (uint64_t)&self->_stats);
}

- (void)_updateStatsWithGeoLocation:(id)a3 disposition:(id)a4 andMandatoryFlag:(BOOL)a5
{
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = [v10 countryCode];
  countryCode = self->_stats.countryCode;
  self = (HAENLocationGatingHelper *)((char *)self + 48);
  self->super.isa = v11;

  __int16 v13 = [v10 describeSource];

  geoLocation = self->_geoLocation;
  self->_geoLocation = v13;

  objc_storeStrong((id *)&self->_updateQueue, a4);
  LOBYTE(self->_regionBehavior) = a5;
  BYTE1(self->_regionBehavior) = self[-1]._stats.disposition;
  uint64_t v15 = +[HAENStatistics sharedInstance];
  __copy_constructor_8_8_s0_s8_s16_t24w2((uint64_t)v16, (uint64_t)self);
  if (v15)
  {
    [v15 processStatsForLocationGating:v16];
  }
  else
  {
  }
}

- (void)_donateSignalToTipsKit:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [MEMORY[0x263F2A9C0] discoverabilitySignal];
  objc_super v4 = [v14 source];
  id v5 = objc_alloc(MEMORY[0x263F2A788]);
  if (v3) {
    unint64_t v6 = @"true";
  }
  else {
    unint64_t v6 = @"false";
  }
  int v7 = (void *)[v5 initWithIdentifier:@"com.apple.Health.Hearing.HAENRequired" bundleID:@"com.apple.Health" context:v6];
  [v4 sendEvent:v7];
  if (!v3)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F28C30]);
    id v9 = [v8 getPreferenceFor:*MEMORY[0x263F28BE0]];
    int v10 = [v9 BOOLValue];

    id v11 = objc_alloc(MEMORY[0x263F2A788]);
    if (v10) {
      BOOL v12 = @"true";
    }
    else {
      BOOL v12 = @"false";
    }
    __int16 v13 = (void *)[v11 initWithIdentifier:@"com.apple.Health.Hearing.HAENOptIn" bundleID:@"com.apple.Health" context:v12];
    [v4 sendEvent:v13];
  }
}

- (void)_donateSignalToTipsKitOnInitialization
{
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F28B98]);
  BOOL v3 = GetDeviceSpecificDefaults(@"HAENFeatureMandatory");
  dispatch_time_t v4 = dispatch_time(0, 60000000000);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__HAENLocationGatingHelper__donateSignalToTipsKitOnInitialization__block_invoke;
  v6[3] = &unk_264527518;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x263EF83A0], v6);
}

uint64_t __66__HAENLocationGatingHelper__donateSignalToTipsKitOnInitialization__block_invoke(uint64_t a1)
{
  BOOL v3 = *(void **)(a1 + 32);
  CFStringRef v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    if ([v3 _isMandatoryDeviceClass])
    {
      uint64_t v4 = 1;
      goto LABEL_6;
    }
    CFStringRef v2 = *(void **)(a1 + 40);
  }
  uint64_t v4 = [v2 BOOLValue];
LABEL_6:
  return [v3 _donateSignalToTipsKit:v4];
}

- (void)reloadProductTypeOverride
{
  id v5 = objc_alloc_init(MEMORY[0x263F28C30]);
  BOOL v3 = [v5 getPreferenceFor:*MEMORY[0x263F28BC8]];
  productTypeOverride = self->_productTypeOverride;
  self->_productTypeOverride = v3;
}

- (void).cxx_destruct
{
  __destructor_8_s0_s8_s16((uint64_t)&self->_stats);
  objc_storeStrong((id *)&self->_productTypeOverride, 0);
  objc_storeStrong((id *)&self->_regionBehavior, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
}

@end