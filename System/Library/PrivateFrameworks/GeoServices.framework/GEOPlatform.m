@interface GEOPlatform
+ (BOOL)isRunningInGeoAPd;
+ (BOOL)isRunningInGeod;
+ (id)sharedPlatform;
+ (void)setIsRunningInGeoAPd:(BOOL)a3;
+ (void)setIsRunningInGeod:(BOOL)a3;
- (BOOL)isCellDataPossible;
- (BOOL)isGUIUser;
- (BOOL)isInternalInstall;
- (BOOL)isMacSetupUser;
- (BOOL)mapsFeatureFreedomEnabled;
- (BOOL)shouldPrefetchVisualResources;
- (BOOL)supportsASTC;
- (BOOL)supportsAdvancedMap;
- (BOOL)supportsForceTouch;
- (BOOL)supportsMultiUser;
- (BOOL)supportsNavigation;
- (BOOL)supportsRealisticTiles;
- (GEOPlatform)init;
- (double)deviceScreenScale;
- (id)buildVersion;
- (id)clientCapabilities;
- (id)deviceCountrySKU;
- (id)deviceCountrySKUForServiceRequests;
- (id)hardwareClass;
- (id)hardwareIdentifier;
- (id)osAndBuildVersion;
- (id)osVersion;
- (id)productName;
- (int64_t)deviceScreenHeightInPixels;
- (int64_t)deviceScreenWidthInPixels;
- (void)setClientCapabilitiesHardwareIdentifier:(id)a3;
@end

@implementation GEOPlatform

+ (id)sharedPlatform
{
  if (qword_1EB2A0098 != -1) {
    dispatch_once(&qword_1EB2A0098, &__block_literal_global_145);
  }
  v2 = (void *)qword_1EB2A00A0;

  return v2;
}

- (BOOL)supportsMultiUser
{
  if (qword_1EB2A0148 != -1) {
    dispatch_once(&qword_1EB2A0148, &__block_literal_global_84);
  }
  return byte_1EB2A008E;
}

- (id)deviceCountrySKUForServiceRequests
{
  v2 = [(GEOPlatform *)self deviceCountrySKU];
  if (v2)
  {
    v3 = _getValue(GeoServicesConfig_SKURegionsServiceAllowlist, (uint64_t)off_1E9114A98, 1, 0, 0, 0);
    id v4 = 0;
    if ([v3 containsObject:v2]) {
      id v4 = v2;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)deviceCountrySKU
{
  if (qword_1EB2A0118 != -1) {
    dispatch_once(&qword_1EB2A0118, &__block_literal_global_36);
  }
  v2 = (void *)qword_1EB2A0110;

  return v2;
}

+ (BOOL)isRunningInGeod
{
  return _sIsRunningInGeod;
}

- (double)deviceScreenScale
{
  if (deviceScreenScale_once != -1) {
    dispatch_once(&deviceScreenScale_once, &__block_literal_global_117);
  }
  return *(double *)&deviceScreenScale__deviceScreenScale;
}

- (BOOL)isInternalInstall
{
  if (qword_1EB2A00A8 != -1) {
    dispatch_once(&qword_1EB2A00A8, &__block_literal_global_3_1);
  }
  return _MergedGlobals_286;
}

- (BOOL)mapsFeatureFreedomEnabled
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"MapsFeatureFreedom"];

  if (!v4) {
    return 0;
  }

  return [(GEOPlatform *)self isInternalInstall];
}

void __32__GEOPlatform_deviceScreenScale__block_invoke()
{
  uint64_t v0 = deviceScreenScale__deviceScreenScale;
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1)
  {
    [v1 doubleValue];
    uint64_t v0 = v3;
  }

  deviceScreenScale__deviceScreenScale = v0;
}

- (id)osVersion
{
  if (qword_1EB2A00C8 != -1) {
    dispatch_once(&qword_1EB2A00C8, &__block_literal_global_9_0);
  }
  v2 = (void *)qword_1EB2A00C0;

  return v2;
}

- (id)buildVersion
{
  if (qword_1EB2A00D8 != -1) {
    dispatch_once(&qword_1EB2A00D8, &__block_literal_global_14);
  }
  v2 = (void *)qword_1EB2A00D0;

  return v2;
}

- (id)productName
{
  if (qword_1EB2A00B8 != -1) {
    dispatch_once(&qword_1EB2A00B8, &__block_literal_global_6_1);
  }
  v2 = (void *)qword_1EB2A00B0;

  return v2;
}

- (id)hardwareClass
{
  if (qword_1EB2A0108 != -1) {
    dispatch_once(&qword_1EB2A0108, &__block_literal_global_31);
  }
  v2 = (void *)qword_1EB2A0100;

  return v2;
}

- (id)osAndBuildVersion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__GEOPlatform_osAndBuildVersion__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  if (qword_1EB2A00E8 != -1) {
    dispatch_once(&qword_1EB2A00E8, block);
  }
  return (id)qword_1EB2A00E0;
}

- (id)hardwareIdentifier
{
  if (qword_1EB2A00F8 != -1) {
    dispatch_once(&qword_1EB2A00F8, &__block_literal_global_23_1);
  }
  v2 = (void *)qword_1EB2A00F0;

  return v2;
}

+ (BOOL)isRunningInGeoAPd
{
  return _sIsRunningInGeoAPd;
}

uint64_t __32__GEOPlatform_supportsMultiUser__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB2A008E = result;
  return result;
}

uint64_t __32__GEOPlatform_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  _MergedGlobals_286 = result;
  return result;
}

void __31__GEOPlatform_deviceCountrySKU__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB2A0110;
  qword_1EB2A0110 = v0;
}

void __29__GEOPlatform_sharedPlatform__block_invoke()
{
  uint64_t v0 = objc_alloc_init(GEOPlatform);
  v1 = (void *)qword_1EB2A00A0;
  qword_1EB2A00A0 = (uint64_t)v0;
}

- (GEOPlatform)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlatform;
  v2 = [(GEOPlatform *)&v6 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create();
    coreTelephonyIsolationQueue = v2->_coreTelephonyIsolationQueue;
    v2->_coreTelephonyIsolationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

void __28__GEOPlatform_hardwareClass__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB2A0100;
  qword_1EB2A0100 = v0;
}

void __27__GEOPlatform_buildVersion__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB2A00D0;
  qword_1EB2A00D0 = v0;
}

void __26__GEOPlatform_productName__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB2A00B0;
  qword_1EB2A00B0 = v0;
}

void __24__GEOPlatform_osVersion__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB2A00C0;
  qword_1EB2A00C0 = v0;
}

void __33__GEOPlatform_clientCapabilities__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(GEOClientCapabilities);
  uint64_t v3 = (void *)qword_1EB2A0160;
  qword_1EB2A0160 = (uint64_t)v2;

  id v15 = [*(id *)(a1 + 32) hardwareClass];
  objc_msgSend((id)qword_1EB2A0160, "setHardwareClass:");
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPopulateFakeHardwareIdentifier, (uint64_t)off_1E9115068))
  {
    int v4 = [v15 stringByAppendingString:@"0,0"];
    [(id)qword_1EB2A0160 setHardwareModel:v4];
  }
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v6 = [v5 infoDictionary];

  v7 = [v6 objectForKey:*MEMORY[0x1E4F1CC70]];
  [(id)qword_1EB2A0160 setAppMajorVersion:v7];

  v8 = [v6 objectForKey:*MEMORY[0x1E4F1D020]];
  [(id)qword_1EB2A0160 setAppMinorVersion:v8];

  if ([*(id *)(a1 + 32) isInternalInstall]) {
    [(id)qword_1EB2A0160 setInternalInstall:1];
  }
  v9 = +[GEOPlatform sharedPlatform];
  uint64_t v10 = [v9 supportsAdvancedMap];
  [(id)qword_1EB2A0160 setSupportsAdvancedMap:v10];

  [(id)qword_1EB2A0160 setMaxManeuverTypeSupported:81];
  [(id)qword_1EB2A0160 setMaxTrafficSpeedSupported:4];
  [(id)qword_1EB2A0160 setMaxFormatterSupported:13];
  [(id)qword_1EB2A0160 setClusteredTransitRoutesSupported:1];
  [(id)qword_1EB2A0160 setRouteOptionsSupported:1];
  [(id)qword_1EB2A0160 setTransitMarketSupport:3];
  [(id)qword_1EB2A0160 setMaxSupportedTransitFareVersion:2];
  v11 = objc_alloc_init(GEOFormattedStringClientCapabilities);
  [(id)qword_1EB2A0160 setFormattedStringClientCapabilities:v11];

  v12 = [(id)qword_1EB2A0160 formattedStringClientCapabilities];
  [v12 setConcatenatingFormatStringsSupported:1];

  v13 = [(id)qword_1EB2A0160 formattedStringClientCapabilities];
  [v13 setTimestampFormatPatternSupported:1];

  v14 = [(id)qword_1EB2A0160 formattedStringClientCapabilities];
  [v14 setStyleSupported:1];

  [(id)qword_1EB2A0160 setSnapToClosestStopSupported:1];
  [(id)qword_1EB2A0160 setIncludeCrossLanguagePhonetics:1];
  [(id)qword_1EB2A0160 setSupportsLongShieldStrings:1];
  [(id)qword_1EB2A0160 setMaxZilchMessageVersionSupported:4];
}

- (BOOL)supportsAdvancedMap
{
  if (qword_1EB2A0130 != -1) {
    dispatch_once(&qword_1EB2A0130, &__block_literal_global_55_2);
  }
  return byte_1EB2A008B;
}

- (void)setClientCapabilitiesHardwareIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!qword_1EB2A0160)
  {
    id v5 = [(GEOPlatform *)self clientCapabilities];
    id v4 = v7;
  }
  objc_super v6 = (void *)[v4 copy];
  [(id)qword_1EB2A0160 setHardwareModel:v6];
}

- (id)clientCapabilities
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__GEOPlatform_clientCapabilities__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  if (qword_1EB2A0168 != -1) {
    dispatch_once(&qword_1EB2A0168, block);
  }
  v2 = (void *)[(id)qword_1EB2A0160 copy];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v4 = (void *)[v3 mutableCopy];
  [v2 setDisplayLanguages:v4];

  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  objc_super v6 = [v5 objectForKey:*MEMORY[0x1E4F1C400]];
  [v2 setDisplayRegion:v6];

  id v7 = +[GEOCountryConfiguration sharedConfiguration];
  v8 = [v7 countryCode];
  [v2 setDeviceCountryCode:v8];

  v9 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  uint64_t v10 = [v9 name];
  [v2 setUserCurrentTimezone:v10];

  objc_msgSend(v2, "setSupportsArrivalMapRegion:", GEOConfigGetBOOL(GeoServicesConfig_ShouldUseServerArrivalParameters, (uint64_t)off_1E9114398));
  [v2 setSupportsGuidanceEvents:1];
  [v2 setSupportsGuidanceEventsInlineShields:1];
  objc_msgSend(v2, "setSupportsJunctionView:", GEOConfigGetBOOL(GeoServicesConfig_NavdShouldRequestJunctionView, (uint64_t)off_1E9114338));
  [v2 setSupportsNaturalGuidance:1];
  [v2 setSupportsLicensePlateRestrictions:1];
  [v2 setSupportsCongestionZones:1];
  objc_msgSend(v2, "setSupportsElectricVehicleRoutes:", GEOConfigGetBOOL(MapsFeaturesConfig_EnableEVRouting, (uint64_t)off_1E9111BF8));
  [v2 setSupportsWaypointRoutes:1];
  [v2 setSupportsTrafficCameras:1];
  [v2 setSupportsUserIncidentReports:1];
  [v2 setSupportsSpeedTrapAnnouncements:1];
  [v2 setSupportsAreaEventsEnhancements:1];
  [v2 setSupportsSilentRouteUpdates:1];
  [v2 setReplaceAccidentStringWithCrash:1];
  [v2 setSupportsGuidanceEventImportanceInfo:1];
  [v2 setSupportsRoadComplexities:1];
  [v2 setSupportsDisablingProgressBarFromBannerButtons:1];
  v11 = objc_alloc_init(GEOWalkingSupportedFeatures);
  [v2 setWalkingSupportedFeatures:v11];

  v12 = [v2 walkingSupportedFeatures];
  [v12 setSupportsWalkingExperience2022:1];

  objc_msgSend(v2, "setSupportsBannerQueuing:", GEOConfigGetBOOL(GeoServicesConfig_ETATrafficBannerRequestQueuing, (uint64_t)off_1E9114E28));
  objc_msgSend(v2, "setSupportsBannerQueuingDirections:", GEOConfigGetBOOL(GeoServicesConfig_DirectionsTrafficBannerRequestQueuing, (uint64_t)off_1E9114E38));
  [v2 setSupportsRouteNameRanges:1];
  [v2 setSupportsWalkingSuggestionsAfterParking:1];
  [v2 setSupportsEv2:1];
  [v2 setSupportsGenericCombinationsInstructionsForAllModes:1];
  [v2 setSupportsRouteCameraInputUpdates:1];
  if (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1E9111D68)) {
    [v2 addSupportsMultipointRouting:0];
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps420, (uint64_t)off_1E9111D78)) {
    [v2 addSupportsMultipointRouting:3];
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps182, (uint64_t)off_1E9111F48)) {
    [v2 addSupportsMultipointRouting:2];
  }
  if (GEOConfigGetBOOL(MapsFeaturesConfig_FCLWithEmissionsAndETA, (uint64_t)off_1E9111F68))
  {
    v13 = objc_alloc_init(GEOArtworkCapabilities);
    [(GEOArtworkCapabilities *)v13 setSupportSfSymbol:1];
    [v2 setArtworkCapabilities:v13];
    [v2 setSupportEmissionsTagging:1];
  }
  if (GEOConfigGetBOOL(GeoServicesConfig_NavdTransitTextInPlanningArtwork, (uint64_t)off_1E91146D8)) {
    [v2 addSupportedTransitFeature:1];
  }
  if (GEOConfigGetBOOL(GeoServicesConfig_NavdTransitListInstructionTimeText, (uint64_t)off_1E91146E8)) {
    [v2 addSupportedTransitFeature:3];
  }
  [v2 addSupportedTransitFeature:4];
  if (GEOConfigGetBOOL(MapsFeaturesConfig_TransitPayEnabled, (uint64_t)off_1E9111D88)) {
    [v2 addSupportedTransitFeature:5];
  }
  [v2 addSupportedTransitFeature:6];
  v14 = objc_alloc_init(GEOLocalizationCapabilities);
  [(GEOLocalizationCapabilities *)v14 setSupportsLocalizedTrafficControlIcons:1];
  id v15 = _getValue(GeoServicesConfig_LocalizationCapabilitiesSupportedPhoneticTypes, (uint64_t)off_1E9114A18, 1, 0, 0, 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOLocalizationCapabilities addSupportedPhoneticType:](v14, "addSupportedPhoneticType:", [*(id *)(*((void *)&v24 + 1) + 8 * i) unsignedIntegerValue]);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v17);
  }
  [v2 setLocalizationCapabilities:v14];
  v20 = +[GEOPlatform sharedPlatform];
  v21 = [v20 deviceCountrySKUForServiceRequests];
  [v2 setDeviceSku:v21];

  [v2 setWillSendEvDirectionsFeedback:0];
  v22 = objc_alloc_init(GEOAdvisoryClientCapabilities);
  [(GEOAdvisoryClientCapabilities *)v22 setDownloadOfflineMapActionSupported:1];
  [v2 setAdvisoryClientCapabilities:v22];
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1E9114F78)) {
    [v2 addSupportedElevationModel:1];
  }
  [v2 addSupportedElevationModel:0];

  return v2;
}

void __32__GEOPlatform_osAndBuildVersion__block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v6 = [*(id *)(a1 + 32) osVersion];
  uint64_t v3 = [*(id *)(a1 + 32) buildVersion];
  uint64_t v4 = [v2 stringWithFormat:@"%@.%@", v6, v3];
  id v5 = (void *)qword_1EB2A00E0;
  qword_1EB2A00E0 = v4;
}

uint64_t __40__GEOPlatform__deviceSupportsNavigation__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB2A0089 = result;
  return result;
}

- (BOOL)supportsNavigation
{
  if (self)
  {
    if (qword_1EB2A0120 != -1) {
      dispatch_once(&qword_1EB2A0120, &__block_literal_global_41);
    }
    LOBYTE(self) = byte_1EB2A0089 != 0;
  }
  return (char)self;
}

void __33__GEOPlatform_hardwareIdentifier__block_invoke()
{
  uint64_t v0 = MGCopyAnswer();
  v1 = (void *)qword_1EB2A00F0;
  qword_1EB2A00F0 = v0;

  if (![(id)qword_1EB2A00F0 length])
  {
    v2 = (void *)qword_1EB2A00F0;
    qword_1EB2A00F0 = @"unknown";
  }
}

void __34__GEOPlatform_supportsAdvancedMap__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  byte_1EB2A008B = MGGetBoolAnswer();
  uint64_t v0 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlatform");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    if (byte_1EB2A008B) {
      v1 = @"YES";
    }
    else {
      v1 = @"NO";
    }
    int v2 = 138412290;
    uint64_t v3 = v1;
    _os_log_impl(&dword_188D96000, v0, OS_LOG_TYPE_INFO, "Advanced Map Support: %@", (uint8_t *)&v2, 0xCu);
  }
}

+ (void)setIsRunningInGeod:(BOOL)a3
{
  _sIsRunningInGeod = 1;
}

+ (void)setIsRunningInGeoAPd:(BOOL)a3
{
  _sIsRunningInGeoAPd = 1;
}

- (BOOL)supportsRealisticTiles
{
  if (self)
  {
    if (qword_1EB2A0120 != -1) {
      dispatch_once(&qword_1EB2A0120, &__block_literal_global_41);
    }
    LOBYTE(self) = byte_1EB2A0089 != 0;
  }
  return (char)self;
}

- (BOOL)supportsForceTouch
{
  if (qword_1EB2A0128 != -1) {
    dispatch_once(&qword_1EB2A0128, &__block_literal_global_50_1);
  }
  return byte_1EB2A008A;
}

uint64_t __33__GEOPlatform_supportsForceTouch__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB2A008A = result;
  return result;
}

- (BOOL)supportsASTC
{
  if (qword_1EB2A0138 != -1) {
    dispatch_once(&qword_1EB2A0138, &__block_literal_global_67);
  }
  return byte_1EB2A008C;
}

uint64_t __27__GEOPlatform_supportsASTC__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB2A008C = result;
  return result;
}

- (BOOL)isCellDataPossible
{
  if (qword_1EB2A0140 != -1) {
    dispatch_once(&qword_1EB2A0140, &__block_literal_global_76);
  }
  if (!byte_1EB2A008D) {
    return 0;
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  coreTelephonyIsolationQueue = self->_coreTelephonyIsolationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__GEOPlatform_isCellDataPossible__block_invoke_2;
  v6[3] = &unk_1E53D7C00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(coreTelephonyIsolationQueue, v6);
  BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__GEOPlatform_isCellDataPossible__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB2A008D = result;
  return result;
}

void __33__GEOPlatform_isCellDataPossible__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    if (!*(void *)(v2 + 8))
    {
      if (CoreTelephonyLibraryCore()) {
        *(void *)(v2 + 8) = geo_CTServerConnectionCreateOnTargetQueue(0, @"com.apple.GeoServices.GP", *(void **)(v2 + 16), 0);
      }
    }
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3)
  {
    CellularDataIsEnabled = geo_CTServerConnectionGetCellularDataIsEnabled(v3, *(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = @"Unable to retrieve CellularDataIsEnabled";
    if (!v5 || !CellularDataIsEnabled)
    {
LABEL_17:

      return;
    }
    if (CellularDataIsEnabled == 2)
    {
      uint64_t v7 = mach_error_string(SHIDWORD(CellularDataIsEnabled));
    }
    else
    {
      if (CellularDataIsEnabled != 1)
      {
        v8 = "Unknown";
        goto LABEL_14;
      }
      uint64_t v7 = strerror(SHIDWORD(CellularDataIsEnabled));
    }
    v8 = v7;
LABEL_14:
    uint64_t v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlatform");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138413058;
      v11 = @"Unable to retrieve CellularDataIsEnabled";
      __int16 v12 = 1024;
      int v13 = (int)CellularDataIsEnabled;
      __int16 v14 = 1024;
      int v15 = HIDWORD(CellularDataIsEnabled);
      __int16 v16 = 2082;
      uint64_t v17 = v8;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%@. CTError: domain-%i, code-%i, errStr:(%{public}s)", (uint8_t *)&v10, 0x22u);
    }

    goto LABEL_17;
  }
}

- (BOOL)isMacSetupUser
{
  return 0;
}

- (BOOL)isGUIUser
{
  if (qword_1EB2A0150 != -1) {
    dispatch_once(&qword_1EB2A0150, &__block_literal_global_89);
  }
  return byte_1EB2A008F;
}

uint64_t __24__GEOPlatform_isGUIUser__block_invoke()
{
  uint64_t result = getuid();
  byte_1EB2A008F = result > 0x1F4;
  return result;
}

- (BOOL)shouldPrefetchVisualResources
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GEOPlatform_shouldPrefetchVisualResources__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  if (qword_1EB2A0158 != -1) {
    dispatch_once(&qword_1EB2A0158, block);
  }
  return byte_1EB2A0090;
}

uint64_t __44__GEOPlatform_shouldPrefetchVisualResources__block_invoke(uint64_t a1)
{
  unsigned int v2 = MGGetSInt32Answer() + 1;
  if (v2 < 0xE && ((0x2B41u >> v2) & 1) != 0) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = [*(id *)(a1 + 32) isGUIUser];
  }
  byte_1EB2A0090 = result;
  return result;
}

- (int64_t)deviceScreenWidthInPixels
{
  if (deviceScreenWidthInPixels_once != -1) {
    dispatch_once(&deviceScreenWidthInPixels_once, &__block_literal_global_107_0);
  }
  return deviceScreenWidthInPixels__deviceScreenWidthInPixels;
}

void __40__GEOPlatform_deviceScreenWidthInPixels__block_invoke()
{
  uint64_t v0 = deviceScreenWidthInPixels__deviceScreenWidthInPixels;
  v1 = (void *)MGCopyAnswer();
  unsigned int v2 = v1;
  if (v1) {
    uint64_t v0 = [v1 integerValue];
  }

  deviceScreenWidthInPixels__deviceScreenWidthInPixels = v0;
}

- (int64_t)deviceScreenHeightInPixels
{
  if (deviceScreenHeightInPixels_once != -1) {
    dispatch_once(&deviceScreenHeightInPixels_once, &__block_literal_global_112);
  }
  return deviceScreenHeightInPixels__deviceScreenHeightInPixels;
}

void __41__GEOPlatform_deviceScreenHeightInPixels__block_invoke()
{
  uint64_t v0 = deviceScreenHeightInPixels__deviceScreenHeightInPixels;
  v1 = (void *)MGCopyAnswer();
  unsigned int v2 = v1;
  if (v1) {
    uint64_t v0 = [v1 integerValue];
  }

  deviceScreenHeightInPixels__deviceScreenHeightInPixels = v0;
}

- (void).cxx_destruct
{
}

@end