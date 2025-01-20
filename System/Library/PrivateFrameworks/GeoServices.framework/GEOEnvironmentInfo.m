@interface GEOEnvironmentInfo
- (BOOL)isActive;
- (GEOEnvironmentInfo)initWithName:(id)a3 displayName:(id)a4 dictionaryRepresentation:(id)a5;
- (GEOResourceManifestDownload)resourceManifest;
- (NSError)lastLoadingError;
- (NSProgress)activationProgress;
- (NSString)actualName;
- (NSString)displayName;
- (NSString)name;
- (NSString)releaseName;
- (id)_manifestURLString;
- (id)overrideURLs;
- (id)serviceURLs;
- (id)urlDictionary;
- (id)useProxyAuth;
- (int64_t)state;
- (void)_performActivation;
- (void)makeActive;
- (void)reloadManifestDataWithCompletionHandler:(id)a3;
@end

@implementation GEOEnvironmentInfo

- (GEOEnvironmentInfo)initWithName:(id)a3 displayName:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)GEOEnvironmentInfo;
  v11 = [(GEOEnvironmentInfo *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    actualName = v11->_actualName;
    v11->_actualName = (NSString *)v16;

    uint64_t v18 = [v10 copy];
    originalDictionaryRepresentation = v11->_originalDictionaryRepresentation;
    v11->_originalDictionaryRepresentation = (NSDictionary *)v18;

    v20 = v11;
  }

  return v11;
}

- (id)urlDictionary
{
  v3 = 0;
  for (uint64_t i = 0; i != 66; ++i)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    _recordForType(i, (uint64_t)&v9);
    if (DWORD2(v9)) {
      BOOL v5 = (void)v10 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      v6 = GEODefaultsKeyStringForConfigKey(SDWORD2(v9), v10);
      v7 = [(NSDictionary *)self->_originalDictionaryRepresentation objectForKey:v6];
      if ([v7 length])
      {
        if (!v3)
        {
          v3 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        [v3 setObject:v7 forKeyedSubscript:v6];
      }
    }
  }

  return v3;
}

- (void)_performActivation
{
  [(GEOEnvironmentInfo *)self willChangeValueForKey:@"activationProgress"];
  v3 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  v4 = +[GEOResourceManifestManager modernManager];
  [v4 openServerConnection];

  [v3 becomeCurrentWithPendingUnitCount:1];
  BOOL v5 = +[GEOResourceManifestManager modernManager];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __40__GEOEnvironmentInfo__performActivation__block_invoke;
  uint64_t v12 = &unk_1E53E33C0;
  v6 = v3;
  v13 = v6;
  uint64_t v14 = self;
  [v5 updateManifest:2 completionHandler:&v9];

  [(NSProgress *)v6 resignCurrent];
  activationProgress = self->_activationProgress;
  self->_activationProgress = v6;
  id v8 = v6;

  [(GEOEnvironmentInfo *)self didChangeValueForKey:@"activationProgress"];
}

void __40__GEOEnvironmentInfo__performActivation__block_invoke(uint64_t a1)
{
  v2 = +[GEOResourceManifestManager modernManager];
  [v2 closeServerConnection];

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__GEOEnvironmentInfo__performActivation__block_invoke_2;
  block[3] = &unk_1E53D8998;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__40__GEOEnvironmentInfo__performActivation__block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[9] == *(void *)(a1 + 40))
  {
    [result willChangeValueForKey:@"activationProgress"];
    uint64_t v3 = *(void *)(a1 + 32);
    int8x16_t v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = 0;

    BOOL v5 = *(void **)(a1 + 32);
    return (void *)[v5 didChangeValueForKey:@"activationProgress"];
  }
  return result;
}

- (void)makeActive
{
  id v7 = [(GEOEnvironmentInfo *)self urlDictionary];
  _setValue(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1E9114218, 0, 0, 0);
  uint64_t v3 = [v7 objectForKeyedSubscript:@"GEOVoltaireResourceManifestURL"];

  if (v3)
  {
    _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), 0, 0, 1);
  }
  else
  {
    int8x16_t v4 = _getValue(GeoServicesConfig_CustomEnvironmentURLFormat, (uint64_t)off_1E91138F8, 1, 0, 0, 0);
    _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), v4, 1, 1);
  }
  BOOL v5 = [(GEOEnvironmentInfo *)self name];
  _setValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, v5, 1, 1);

  _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, v7, 1, 1);
  int8x16_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"GEOCountryConfigurationProvidersDidChangeNotification" object:self userInfo:0];

  [(GEOEnvironmentInfo *)self _performActivation];
}

- (BOOL)isActive
{
  uint64_t v7 = 0;
  uint64_t v3 = _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, 1, 0, &v7, 0);
  if (v3 && (unint64_t)(v7 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    BOOL v5 = [(GEOEnvironmentInfo *)self name];
    char v4 = [v3 isEqualToString:v5];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (GEOResourceManifestDownload)resourceManifest
{
  v2 = [[GEOResourceManifestDownload alloc] initWithResourceManifestData:self->_manifestData];

  return v2;
}

- (id)_manifestURLString
{
  uint64_t v3 = objc_alloc_init(GEOResourceManifestConfiguration);
  char v4 = [(GEOEnvironmentInfo *)self name];
  [(GEOResourceManifestConfiguration *)v3 setEnvironment:v4];

  BOOL v5 = _getValue(GeoServicesConfig_CustomEnvironmentURLFormat, (uint64_t)off_1E91138F8, 1, 0, 0, 0);
  if (v5)
  {
    int8x16_t v6 = GEOResourceManifestURLTokenQueryItems(v3);
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "_geo_URLWithString:tokenSubstitutions:", v5, v6);
    id v8 = [v7 absoluteString];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)reloadManifestDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  lastLoadingError = self->_lastLoadingError;
  self->_lastLoadingError = 0;

  [(GEOEnvironmentInfo *)self willChangeValueForKey:@"state"];
  self->_state = 1;
  [(GEOEnvironmentInfo *)self didChangeValueForKey:@"state"];
  int8x16_t v6 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v7 = [(GEOEnvironmentInfo *)self _manifestURLString];
  id v8 = [v6 URLWithString:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:v8];
  uint64_t v10 = +[GEORequestCounter sharedCounter];
  long long v11 = +[GEOApplicationAuditToken currentProcessAuditToken];
  uint64_t v12 = [v10 requestCounterTicketForType:3 auditToken:v11 traits:0];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__88;
  v29 = __Block_byref_object_dispose__88;
  id v30 = 0;
  v13 = [MEMORY[0x1E4F290E0] sharedSession];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E53ECFE8;
  id v14 = v12;
  v24 = &v25;
  id v20 = v14;
  v21 = self;
  id v15 = v4;
  id v23 = v15;
  id v16 = v8;
  id v22 = v16;
  uint64_t v17 = [v13 dataTaskWithRequest:v9 completionHandler:v19];
  uint64_t v18 = (void *)v26[5];
  v26[5] = v17;

  [v14 startingRequestWithTask:v26[5]];
  [(id)v26[5] resume];
  _Block_object_dispose(&v25, 8);
}

void __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  [*(id *)(a1 + 32) requestCompleted:v7];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E53D7F70;
    void block[4] = *(void *)(a1 + 40);
    id v15 = v7;
    id v16 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], block);

    uint64_t v10 = v15;
  }
  else
  {
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    geo_dispatch_async_qos();

    uint64_t v10 = v11;
  }
}

uint64_t __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) willChangeValueForKey:@"state"];
  *(void *)(*(void *)(a1 + 32) + 40) = 3;
  [*(id *)(a1 + 32) didChangeValueForKey:@"state"];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  BOOL IsValid = GEOResourceManifestDataIsValid(*(void **)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E53ECFC0;
  BOOL v8 = IsValid;
  uint64_t v3 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__GEOEnvironmentInfo_reloadManifestDataWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"state"];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 48));
    *(void *)(*(void *)(a1 + 32) + 40) = 2;
    uint64_t v2 = GEOReleaseInfoForManifestData(*(void **)(a1 + 48));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;

    [*(id *)(a1 + 32) didChangeValueForKey:@"state"];
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
  else
  {
    id v7 = NSString;
    BOOL v8 = [*(id *)(a1 + 32) name];
    uint64_t v9 = [v7 stringWithFormat:@"Invalid manifest data for environment: %@", v8];

    NSLog(&stru_1ED5215D0.isa, v9);
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    id v11 = (id)*MEMORY[0x1E4F1D138];
    uint64_t v12 = *MEMORY[0x1E4F28588];
    v18[0] = v11;
    v18[1] = v12;
    v19[0] = v9;
    v19[1] = @"Invalid Data";
    v18[2] = *MEMORY[0x1E4F289B0];
    v19[2] = *(void *)(a1 + 40);
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    uint64_t v14 = [v10 GEOErrorWithCode:-11 userInfo:v13];
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 56);
    *(void *)(v15 + 56) = v14;

    [*(id *)(a1 + 32) willChangeValueForKey:@"state"];
    *(void *)(*(void *)(a1 + 32) + 40) = 3;
    [*(id *)(a1 + 32) didChangeValueForKey:@"state"];
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
}

- (id)serviceURLs
{
  manifestData = self->_manifestData;
  if (manifestData)
  {
    manifestData = _GEOGetURLInfoFromResourceManifest(manifestData, &__block_literal_global_162);
  }

  return manifestData;
}

- (id)overrideURLs
{
  return 0;
}

- (id)useProxyAuth
{
  manifestData = self->_manifestData;
  if (manifestData)
  {
    manifestData = _GEOGetURLInfoFromResourceManifest(manifestData, &__block_literal_global_124);
  }

  return manifestData;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)releaseName
{
  return self->_releaseName;
}

- (NSString)actualName
{
  return self->_actualName;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)lastLoadingError
{
  return self->_lastLoadingError;
}

- (NSProgress)activationProgress
{
  return self->_activationProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationProgress, 0);
  objc_storeStrong((id *)&self->_originalDictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_lastLoadingError, 0);
  objc_storeStrong((id *)&self->_manifestData, 0);
  objc_storeStrong((id *)&self->_actualName, 0);
  objc_storeStrong((id *)&self->_releaseName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end