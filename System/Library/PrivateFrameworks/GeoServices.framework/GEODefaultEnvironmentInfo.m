@interface GEODefaultEnvironmentInfo
- (BOOL)isActive;
- (GEODefaultEnvironmentInfo)init;
- (id)_manifestURLString;
- (void)makeActive;
@end

@implementation GEODefaultEnvironmentInfo

- (GEODefaultEnvironmentInfo)init
{
  v18.receiver = self;
  v18.super_class = (Class)GEODefaultEnvironmentInfo;
  v2 = [(GEODefaultEnvironmentInfo *)&v18 init];
  if (v2)
  {
    v3 = +[GEONetworkDefaults sharedNetworkDefaults];
    v4 = [v3 valueForKey:@"CountryProviders"];

    v5 = +[GEOCountryConfiguration sharedConfiguration];
    v6 = [v5 countryCode];
    v7 = [v4 objectForKey:v6];

    v8 = [v7 objectForKey:@"GEOResourceManifestEnvironment"];
    if (![v8 length])
    {
      v9 = +[GEONetworkDefaults sharedNetworkDefaults];
      v10 = [v9 valueForKey:@"GEOResourceManifestEnvironment"];

      if (![v10 length])
      {
        v11 = @"prod";
        goto LABEL_6;
      }
      v8 = v10;
    }
    v11 = v8;
    v10 = v11;
LABEL_6:

    name = v2->super._name;
    v2->super._name = 0;

    uint64_t v13 = [[NSString alloc] initWithFormat:@"Default (%@)", v11];
    displayName = v2->super._displayName;
    v2->super._displayName = (NSString *)v13;

    actualName = v2->super._actualName;
    v2->super._actualName = &v11->isa;

    v16 = v2;
  }

  return v2;
}

- (void)makeActive
{
  _setValue(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1E9114218, 0, 0, 1);
  _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), 0, 0, 1);
  _setValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, 0, 0, 1);
  _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, 0, 0, 1);
  for (uint64_t i = 0; i != 66; ++i)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
    _recordForType(i, (uint64_t)&v6);
    if (DWORD2(v6)) {
      BOOL v4 = (void)v7 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      _setValue(SDWORD2(v6), v7, 0, 0, 0);
    }
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"GEOCountryConfigurationProvidersDidChangeNotification" object:self userInfo:0];

  [(GEOEnvironmentInfo *)self _performActivation];
}

- (BOOL)isActive
{
  v2 = _getValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, 1, 0, 0, 0);
  if (v2)
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    BOOL v4 = _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, 1, 0, &v7, 0);
    if (v4) {
      BOOL v5 = v7 == 4;
    }
    else {
      BOOL v5 = 1;
    }
    BOOL v3 = v5;
  }
  return v3;
}

- (id)_manifestURLString
{
  BOOL v3 = objc_alloc_init(GEOResourceManifestConfiguration);
  [(GEOResourceManifestConfiguration *)v3 setEnvironment:self->super._actualName];
  BOOL v4 = GEOURLDefaultResourceManifestURLTemplate();
  if (v4)
  {
    BOOL v5 = GEOResourceManifestURLTokenQueryItems(v3);
    long long v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "_geo_URLWithString:tokenSubstitutions:", v4, v5);
    uint64_t v7 = [v6 absoluteString];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end