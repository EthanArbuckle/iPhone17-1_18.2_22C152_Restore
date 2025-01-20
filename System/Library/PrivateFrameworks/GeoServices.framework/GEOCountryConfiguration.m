@interface GEOCountryConfiguration
+ (GEOCountryConfiguration)sharedConfiguration;
+ (void)disableServerConnection;
+ (void)setUseLocalProxy:(BOOL)a3;
- (BOOL)_currentCountrySupportsNavigation;
- (BOOL)countryCode:(id)a3 supportsFeature:(int64_t)a4;
- (BOOL)currentCountrySupportsAvoidStairs;
- (BOOL)currentCountrySupportsCarIntegration;
- (BOOL)currentCountrySupportsCommute;
- (BOOL)currentCountrySupportsCuratedRoutes;
- (BOOL)currentCountrySupportsCustomRouteCreation;
- (BOOL)currentCountrySupportsDirections;
- (BOOL)currentCountrySupportsElectricVehicleRouting;
- (BOOL)currentCountrySupportsFeature:(int64_t)a3;
- (BOOL)currentCountrySupportsNavigation;
- (BOOL)currentCountrySupportsRouteGenius;
- (BOOL)currentCountrySupportsTopographicMap;
- (BOOL)currentCountrySupportsTraffic;
- (BOOL)zilchPointsSupported;
- (GEOCountryConfiguration)init;
- (NSString)countryCode;
- (double)urlAuthenticationTimeToLive;
- (id)_defaultForKey:(void *)a3 inCountry:(void *)a4 defaultValue:(unint64_t *)a5 sourcePtr:(void *)a6 decoder:;
- (id)countryCodeWithSource:(unsigned int *)a3 updatedAtTime:(id *)a4;
- (id)defaultForKey:(id)a3 defaultValue:(id)a4;
- (id)defaultForKey:(id)a3 defaultValue:(id)a4 decoder:(id)a5;
- (id)defaultForKey:(id)a3 defaultValue:(id)a4 sourcePtr:(int64_t *)a5;
- (id)defaultForKey:(id)a3 defaultValue:(id)a4 sourcePtr:(int64_t *)a5 decoder:(id)a6;
- (uint64_t)_resetSupportedFeatures;
- (void)_countryCodeOnIsolationQueue;
- (void)dealloc;
- (void)serverProxy:(id)a3 countryCodeDidChange:(id)a4;
- (void)serverProxyProvidersDidChange:(id)a3;
- (void)updateCountryConfiguration:(id)a3;
- (void)updateCountryConfiguration:(id)a3 callbackQueue:(id)a4;
- (void)updateProvidersForCurrentCountry;
@end

@implementation GEOCountryConfiguration

+ (GEOCountryConfiguration)sharedConfiguration
{
  if (qword_1EB29F7C0 != -1) {
    dispatch_once(&qword_1EB29F7C0, &__block_literal_global_42);
  }
  v2 = (void *)qword_1EB29F7B8;

  return (GEOCountryConfiguration *)v2;
}

- (id)countryCodeWithSource:(unsigned int *)a3 updatedAtTime:(id *)a4
{
  geo_assert_not_isolated();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18;
  v18 = __Block_byref_object_dispose__18;
  id v19 = 0;
  geo_isolate_sync();
  v6 = v15;
  if (a3)
  {
    uint64_t v7 = v15[5];
    if (v7) {
      unsigned int v8 = *(_DWORD *)(v7 + 8);
    }
    else {
      unsigned int v8 = 1;
    }
    *a3 = v8;
  }
  if (a4)
  {
    uint64_t v9 = v6[5];
    if (v9)
    {
      id v10 = *(id *)(v9 + 24);
      v6 = v15;
    }
    else
    {
      id v10 = 0;
    }
    *a4 = v10;
  }
  v11 = (void *)v6[5];
  if (v11) {
    v11 = (void *)v11[2];
  }
  v12 = v11;
  _Block_object_dispose(&v14, 8);

  return v12;
}

- (NSString)countryCode
{
  return (NSString *)[(GEOCountryConfiguration *)self countryCodeWithSource:0 updatedAtTime:0];
}

void __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = -[GEOCountryConfiguration _countryCodeOnIsolationQueue](*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __63__GEOCountryConfiguration_countryCodeWithSource_updatedAtTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[GEOCountryConfiguration _countryCodeOnIsolationQueue](*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_countryCodeOnIsolationQueue
{
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = _GEOReadStoredCountryCodeWithFallback();
      v5 = (void *)v2[2];
      v2[2] = v4;

      uint64_t v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4 sourcePtr:(int64_t *)a5
{
  return [(GEOCountryConfiguration *)self defaultForKey:a3 defaultValue:a4 sourcePtr:a5 decoder:0];
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4
{
  return [(GEOCountryConfiguration *)self defaultForKey:a3 defaultValue:a4 sourcePtr:0];
}

uint64_t __50__GEOCountryConfiguration__resetSupportedFeatures__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 57) = 0;
  return result;
}

void __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke_2(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    v12[0] = @"DeviceCountryCode";
    id v3 = *(id *)(v2 + 16);
    v13[0] = v3;
    v12[1] = @"DeviceCountryCodeSource";
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v4) {
      uint64_t v5 = *(unsigned int *)(v4 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = [NSNumber numberWithUnsignedInt:v5];
    v13[1] = v6;
    v12[2] = @"DeviceCountryCodeLastUpdated";
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v7) {
      uint64_t v7 = (void *)v7[3];
    }
    v13[2] = v7;
    unsigned int v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = v7;
    id v10 = [v8 dictionaryWithObjects:v13 forKeys:v12 count:3];
  }
  else
  {
    id v10 = 0;
  }
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"GEOCountryConfigurationCountryCodeDidChangeNotification" object:*(void *)(a1 + 32) userInfo:v10];
}

- (BOOL)currentCountrySupportsElectricVehicleRouting
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:6];
}

- (double)urlAuthenticationTimeToLive
{
  geo_assert_not_isolated();
  uint64_t v4 = 0;
  uint64_t v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  geo_isolate_sync();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __50__GEOCountryConfiguration__resetSupportedFeatures__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
}

- (BOOL)currentCountrySupportsFeature:(int64_t)a3
{
  uint64_t v5 = [(GEOCountryConfiguration *)self countryCode];
  LOBYTE(a3) = [(GEOCountryConfiguration *)self countryCode:v5 supportsFeature:a3];

  return a3;
}

- (BOOL)countryCode:(id)a3 supportsFeature:(int64_t)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  geo_assert_not_isolated();
  uint64_t v6 = 0;
  uint64_t v27 = 1;
  v28 = (uint64_t *)@"supportedCountriesDirections.plist";
  v29[0] = GeoServicesConfig_SupportsDirections;
  uint64_t v7 = &GEOConfigKey_InvalidArray;
  v29[1] = GEOConfigKey_InvalidArray;
  uint64_t v30 = 2;
  v31 = @"supportedCountriesTraffic.plist";
  long long v32 = GeoServicesConfig_SupportsTraffic;
  long long v33 = GEOConfigKey_InvalidArray;
  uint64_t v34 = 3;
  v35 = @"supportedCountriesCarIntegration.plist";
  long long v36 = GeoServicesConfig_SupportsCarIntegration;
  long long v37 = GEOConfigKey_InvalidArray;
  uint64_t v38 = 4;
  v39 = @"supportedCountriesCommute.plist";
  long long v40 = GeoServicesConfig_SupportsCommute;
  long long v41 = GEOConfigKey_InvalidArray;
  uint64_t v42 = 5;
  uint64_t v43 = 0;
  long long v44 = GeoServicesConfig_SupportsMetroTurnByTurn;
  long long v45 = GEOConfigKey_InvalidArray;
  uint64_t v46 = 6;
  v47 = @"supportedCountriesEVDirections.plist";
  long long v48 = GeoServicesConfig_SupportsElectricVehicleRouting;
  long long v49 = GEOConfigKey_InvalidArray;
  uint64_t v50 = 7;
  v51 = @"supportedCountriesAvoidStairs.plist";
  long long v52 = GeoServicesConfig_SupportsAvoidStairs;
  long long v53 = GEOConfigKey_InvalidArray;
  uint64_t v54 = 8;
  uint64_t v55 = 0;
  long long v56 = GeoServicesConfig_SupportsCustomRouteCreation;
  long long v57 = GeoServicesConfig_SupportedCountriesCustomRouteCreation;
  uint64_t v58 = 9;
  v59 = @"supportedCountriesTopographicMap.plist";
  long long v60 = GeoServicesConfig_SupportsTopographicMap;
  long long v61 = GeoServicesConfig_SupportedCountriesTopographicMap;
  uint64_t v62 = 10;
  v63 = @"supportedCountriesCuratedRoutes.plist";
  uint64_t v66 = 11;
  v67 = @"supportedCountriesVisualIntelligenceCamera.plist";
  long long v64 = GeoServicesConfig_SupportsCuratedRoutes;
  long long v65 = GeoServicesConfig_SupportedCountriesCuratedRoutes;
  long long v68 = GeoServicesConfig_SupportsVisualIntelligenceCamera;
  long long v69 = GeoServicesConfig_SupportedCountriesVisualIntelligenceCamera;
  unsigned int v8 = &GEOConfigKey_InvalidBOOL;
  while (*(uint64_t *)((char *)&v27 + v6 * 16) != a4)
  {
    v6 += 3;
    if (v6 == 33)
    {
      uint64_t v9 = 0;
      id v10 = (uint64_t *)&GEOConfigKey_InvalidArray + 1;
      v11 = &qword_1E9118770;
      goto LABEL_6;
    }
  }
  v12 = (char *)&v27 + v6 * 16;
  uint64_t v9 = *(uint64_t *)((char *)&v27 + v6 * 16 + 8);
  unsigned int v8 = (uint64_t *)&v29[v6];
  v11 = (uint64_t *)&v29[v6] + 1;
  uint64_t v7 = (long long *)(v12 + 32);
  id v10 = (uint64_t *)(v12 + 40);
LABEL_6:
  uint64_t v13 = *v10;
  uint64_t v14 = *(void *)v7;
  uint64_t v15 = *v11;
  uint64_t v16 = *v8;
  uint64_t v27 = 0;
  v28 = &v27;
  *(void *)&v29[0] = 0x2020000000;
  BYTE8(v29[0]) = 0;
  if (v16) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    uint64_t v18 = v14;
  }
  else if (_GEOConfigHasValue(v16, v15) || ((uint64_t v18 = v14, v14) ? (v22 = v13 == 0) : (v22 = 1), v22))
  {
    char BOOLForCountryCode = GEOConfigGetBOOLForCountryCode(v16, v15, v5);
    *((unsigned char *)v28 + 24) = BOOLForCountryCode;
    if (!v9) {
      goto LABEL_27;
    }
LABEL_26:
    id v26 = v5;
    geo_isolate_sync();

    goto LABEL_27;
  }
  if (v18) {
    BOOL v19 = v13 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19)
  {
    v20 = _getValue(v14, v13, 1, 0, 0, 0);
    char v21 = [v20 containsObject:v5];
    *((unsigned char *)v28 + 24) = v21;
  }
  if (v9) {
    goto LABEL_26;
  }
LABEL_27:
  BOOL v24 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);

  return v24;
}

void __46__GEOCountryConfiguration_sharedConfiguration__block_invoke()
{
  v0 = objc_alloc_init(GEOCountryConfiguration);
  uint64_t v1 = (void *)qword_1EB29F7B8;
  qword_1EB29F7B8 = (uint64_t)v0;
}

- (GEOCountryConfiguration)init
{
  v19.receiver = self;
  v19.super_class = (Class)GEOCountryConfiguration;
  uint64_t v2 = [(GEOCountryConfiguration *)&v19 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    uint64_t v5 = geo_isolater_create();
    currentCountrySupportsNavigationIsolater = v2->_currentCountrySupportsNavigationIsolater;
    v2->_currentCountrySupportsNavigationIsolater = (geo_isolater *)v5;

    if ((_MergedGlobals_207 & 1) == 0)
    {
      uint64_t v7 = (void *)MEMORY[0x18C1203C0]();
      if (byte_1EB29F7B1)
      {
        unsigned int v8 = [_GEOCountryConfigurationLocalProxy alloc];
        global_workloop = (void *)geo_get_global_workloop();
        uint64_t v10 = [(_GEOCountryConfigurationLocalProxy *)v8 initWithDelegate:v2 delegateQueue:global_workloop];
        serverProxy = v2->_serverProxy;
        v2->_serverProxy = (_GEOCountryConfigurationServerProxy *)v10;

        [(GEOCountryConfiguration *)v2 updateCountryConfiguration:0];
      }
      else
      {
        v12 = [_GEOCountryConfigurationRemoteProxy alloc];
        uint64_t v13 = (void *)geo_get_global_workloop();
        uint64_t v14 = [(_GEOCountryConfigurationRemoteProxy *)v12 initWithDelegate:v2 delegateQueue:v13];
        uint64_t v15 = v2->_serverProxy;
        v2->_serverProxy = (_GEOCountryConfigurationServerProxy *)v14;
      }
      uint64_t v16 = +[GEOResourceManifestManager modernManager];
      BOOL v17 = (void *)geo_get_global_workloop();
      [v16 addTileGroupObserver:v2 queue:v17];
    }
  }
  return v2;
}

void __55__GEOCountryConfiguration_countryCode_supportsFeature___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 40);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void **)(a1[4] + 40);
  }
  uint64_t v6 = [v2 objectForKey:a1[8]];

  if (!v6)
  {
    uint64_t v7 = +[GEOResourceManager sharedManager];
    unsigned int v8 = [v7 pathForResourceWithName:a1[8] fallbackBundle:0];

    if ([v8 length])
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
      v11 = [v9 dictionaryWithContentsOfURL:v10 error:0];

      v12 = *(void **)(a1[4] + 40);
      if (v11)
      {
LABEL_9:
        [v12 setObject:v11 forKey:a1[8]];

        goto LABEL_10;
      }
    }
    else
    {
      v12 = *(void **)(a1[4] + 40);
    }
    v11 = [MEMORY[0x1E4F1C9E8] dictionary];
    goto LABEL_9;
  }
LABEL_10:
  id v17 = [*(id *)(a1[4] + 40) objectForKey:a1[8]];
  uint64_t v13 = [v17 objectForKey:@"SupportedCountries"];
  uint64_t v14 = v13;
  if (v13)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v13 containsObject:a1[5]];
  }
  else
  {
    uint64_t v15 = [v17 objectForKey:@"UnsupportedCountries"];
    uint64_t v16 = v15;
    if (v15) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v15 containsObject:a1[5]] ^ 1;
    }
  }
}

void __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;
  }
  if (a1[6])
  {
    uint64_t v5 = objc_alloc_init(_GEOCountryConfigurationUpdateHandler);
    [(_GEOCountryConfigurationUpdateHandler *)v5 setCallback:a1[6]];
    [(_GEOCountryConfigurationUpdateHandler *)v5 setCallbackQueue:a1[5]];
    [*(id *)(a1[4] + 32) addObject:v5];
  }
}

- (void)updateProvidersForCurrentCountry
{
}

- (BOOL)currentCountrySupportsCarIntegration
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:3];
}

- (void)serverProxy:(id)a3 countryCodeDidChange:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__18;
  void v13[4] = __Block_byref_object_dispose__18;
  id v14 = 0;
  unsigned int v8 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v16 = v7;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Country code changed: %{private}@", buf, 0xCu);
  }

  -[GEOCountryConfiguration _resetSupportedFeatures]((uint64_t)self);
  block[6] = MEMORY[0x1E4F143A8];
  block[7] = 3221225472;
  block[8] = __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke;
  block[9] = &unk_1E53D7BD8;
  block[10] = self;
  id v9 = v7;
  id v11 = v9;
  v12 = v13;
  geo_isolate_sync();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__GEOCountryConfiguration_serverProxy_countryCodeDidChange___block_invoke_2;
  block[3] = &unk_1E53D89C0;
  block[4] = self;
  block[5] = v13;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v13, 8);
}

- (uint64_t)_resetSupportedFeatures
{
  if (result)
  {
    geo_assert_not_isolated();
    geo_isolate_sync_data();
    geo_assert_not_isolated();
    return geo_isolate_sync_data();
  }
  return result;
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4 sourcePtr:(int64_t *)a5 decoder:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(GEOCountryConfiguration *)self countryCode];
  id v14 = -[GEOCountryConfiguration _defaultForKey:inCountry:defaultValue:sourcePtr:decoder:]((uint64_t)self, v12, v13, v11, (unint64_t *)a5, v10);

  return v14;
}

- (id)_defaultForKey:(void *)a3 inCountry:(void *)a4 defaultValue:(unint64_t *)a5 sourcePtr:(void *)a6 decoder:
{
  if (a1)
  {
    id v10 = a6;
    id v11 = a4;
    id v12 = a2;
    id v13 = a3;
    id v14 = (void (**)(id, uint64_t))v10;
    if (v13)
    {
      unint64_t v26 = 0;
      uint64_t v15 = GEOGetDecodedDefaultWithSource(@"CountryProviders", 0, &v26, 0);
      id v16 = [v15 objectForKey:v13];

      uint64_t v17 = [v16 objectForKey:v12];
      uint64_t v18 = (void *)v17;
      if (v14 && v17)
      {
        uint64_t v19 = v14[2](v14, v17);

        uint64_t v18 = (void *)v19;
      }
      if (v18) {
        unint64_t v20 = v26;
      }
      else {
        unint64_t v20 = 0;
      }
    }
    else
    {
      unint64_t v20 = 0;
      uint64_t v18 = 0;
    }

    unint64_t v26 = 0;
    char v21 = GEOGetDecodedDefaultWithSource(v12, v11, &v26, v14);

    id v22 = v18;
    v23 = v22;
    if (!v22) {
      goto LABEL_15;
    }
    if (v20 > 9 || ((1 << v20) & 0x218) == 0)
    {
      id v24 = v22;
      if (!a5) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    id v24 = v22;
    if (v26 - 1 <= 1)
    {
LABEL_15:
      id v24 = v21;

      unint64_t v20 = v26;
    }
    if (!a5)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    *a5 = v20;
    goto LABEL_18;
  }
  id v24 = 0;
LABEL_19:

  return v24;
}

uint64_t __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_72(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v5 removeAllObjects];
}

void __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2_73(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callback];
  v2[2](v2, *(void *)(a1 + 40));
}

void __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__18;
  long long v32 = __Block_byref_object_dispose__18;
  id v33 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_72;
  v25 = &unk_1E53D89C0;
  uint64_t v26 = v4;
  uint64_t v27 = &v28;
  geo_isolate_sync_data();
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 24));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)v29[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 callback];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          id v12 = [v9 callbackQueue];
          id v13 = v12;
          if (v12) {
            global_workloop = v12;
          }
          else {
            global_workloop = geo_get_global_workloop();
          }
          uint64_t v15 = global_workloop;

          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2_73;
          v16[3] = &unk_1E53D8998;
          v16[4] = v9;
          id v17 = v3;
          dispatch_async(v15, v16);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v34 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v28, 8);
}

uint64_t __54__GEOCountryConfiguration_updateCountryConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

- (void)updateCountryConfiguration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__GEOCountryConfiguration_updateCountryConfiguration___block_invoke;
  v6[3] = &unk_1E53DB698;
  id v7 = v4;
  id v5 = v4;
  [(GEOCountryConfiguration *)self updateCountryConfiguration:v6 callbackQueue:MEMORY[0x1E4F14428]];
}

- (void)updateCountryConfiguration:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[5] = MEMORY[0x1E4F143A8];
  v12[6] = 3221225472;
  v12[7] = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke;
  v12[8] = &unk_1E53D8E18;
  v12[9] = self;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v13 = v9;
  geo_isolate_sync_data();
  if ((atomic_exchange(&self->_isUpdating._Value, 1u) & 1) == 0)
  {
    serverProxy = self->_serverProxy;
    global_workloop = (void *)geo_get_global_workloop();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__GEOCountryConfiguration_updateCountryConfiguration_callbackQueue___block_invoke_2;
    void v12[3] = &unk_1E53D9070;
    v12[4] = self;
    [(_GEOCountryConfigurationServerProxy *)serverProxy updateCountryCodeWithCallbackQueue:global_workloop callback:v12];
  }
}

double __54__GEOCountryConfiguration_urlAuthenticationTimeToLive__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 72))
  {
    uint64_t v3 = -[GEOCountryConfiguration _countryCodeOnIsolationQueue](*(void **)(a1 + 32));
    id v4 = (void *)v3;
    if (v3) {
      id v5 = *(void **)(v3 + 16);
    }
    else {
      id v5 = 0;
    }
    id v6 = -[GEOCountryConfiguration _defaultForKey:inCountry:defaultValue:sourcePtr:decoder:](v2, @"GEOURLAuthenticationTTL", v5, 0, 0, 0);

    *(void *)(*(void *)(a1 + 32) + 64) = 0x40B0680000000000;
    if (v6)
    {
      [v6 doubleValue];
      *(void *)(*(void *)(a1 + 32) + 64) = v7;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  double result = *(double *)(v2 + 64);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)zilchPointsSupported
{
  return GEOConfigGetBOOL(GeoServicesConfig_ZilchSupported, (uint64_t)off_1E9113A48);
}

+ (void)disableServerConnection
{
  _MergedGlobals_207 = 1;
}

+ (void)setUseLocalProxy:(BOOL)a3
{
  byte_1EB29F7B1 = a3;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[GEOResourceManifestManager modernManager];
  [v4 removeTileGroupObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)GEOCountryConfiguration;
  [(GEOCountryConfiguration *)&v5 dealloc];
}

- (BOOL)currentCountrySupportsNavigation
{
  BOOL v2 = [(GEOCountryConfiguration *)self _currentCountrySupportsNavigation];
  if (v2)
  {
    uint64_t v3 = +[GEOPlatform sharedPlatform];
    char v4 = [v3 supportsNavigation];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)_currentCountrySupportsNavigation
{
  objc_super v5 = self->_currentCountrySupportsNavigationIsolater;
  _geo_isolate_lock_data();
  if (self->_determinedCurrentCountrySupportsNavigation)
  {
    char currentCountrySupportsNavigation = self->_currentCountrySupportsNavigation;
  }
  else
  {
    char currentCountrySupportsNavigation = GEOConfigGetBOOL(GeoServicesConfig_CanNavigate, (uint64_t)off_1E9113A58);
    self->_char currentCountrySupportsNavigation = currentCountrySupportsNavigation;
    self->_determinedCurrentCountrySupportsNavigation = 1;
  }
  _geo_isolate_unlock();

  return currentCountrySupportsNavigation;
}

- (BOOL)currentCountrySupportsDirections
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:1];
}

- (BOOL)currentCountrySupportsTraffic
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:2];
}

- (BOOL)currentCountrySupportsRouteGenius
{
  BOOL v3 = [(GEOCountryConfiguration *)self currentCountrySupportsTraffic];
  if (v3)
  {
    LOBYTE(v3) = [(GEOCountryConfiguration *)self currentCountrySupportsNavigation];
  }
  return v3;
}

- (BOOL)currentCountrySupportsCommute
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:4];
}

- (BOOL)currentCountrySupportsAvoidStairs
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:7];
}

- (BOOL)currentCountrySupportsCustomRouteCreation
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:8];
}

- (BOOL)currentCountrySupportsTopographicMap
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:9];
}

- (BOOL)currentCountrySupportsCuratedRoutes
{
  return [(GEOCountryConfiguration *)self currentCountrySupportsFeature:10];
}

- (id)defaultForKey:(id)a3 defaultValue:(id)a4 decoder:(id)a5
{
  return [(GEOCountryConfiguration *)self defaultForKey:a3 defaultValue:a4 sourcePtr:0 decoder:a5];
}

- (void)serverProxyProvidersDidChange:(id)a3
{
  char v4 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Providers changed", buf, 2u);
  }

  -[GEOCountryConfiguration _resetSupportedFeatures]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GEOCountryConfiguration_serverProxyProvidersDidChange___block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__GEOCountryConfiguration_serverProxyProvidersDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEOCountryConfigurationProvidersDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_currentCountrySupportsNavigationIsolater, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_updateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_countryCodeInfo, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end