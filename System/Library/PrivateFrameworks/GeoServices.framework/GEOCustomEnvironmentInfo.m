@interface GEOCustomEnvironmentInfo
- (BOOL)isActive;
- (GEOCustomEnvironmentInfo)initWithName:(id)a3 displayName:(id)a4 dictionaryRepresentation:(id)a5;
- (id)dictionaryRepresentation;
- (id)overrideURLs;
- (void)delete;
- (void)makeActive;
- (void)save;
- (void)updateWithURLs:(id)a3;
@end

@implementation GEOCustomEnvironmentInfo

- (GEOCustomEnvironmentInfo)initWithName:(id)a3 displayName:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOCustomEnvironmentInfo;
  v9 = [(GEOEnvironmentInfo *)&v23 initWithName:a3 displayName:a4 dictionaryRepresentation:v8];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"uuid"];
    uint64_t v11 = [v10 copy];
    uuid = v9->_uuid;
    v9->_uuid = (NSString *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:66];
    overrideURLs = v9->_overrideURLs;
    v9->_overrideURLs = (NSMapTable *)v13;

    for (uint64_t i = 0; i != 66; ++i)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
      _recordForType(i, (uint64_t)&v24);
      if (DWORD2(v24)) {
        BOOL v16 = (void)v25 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16)
      {
        v17 = GEODefaultsKeyStringForConfigKey(SDWORD2(v24), v25);
        v18 = [v8 objectForKeyedSubscript:v17];
        if (v18)
        {
          v19 = v9->_overrideURLs;
          v20 = [NSNumber numberWithUnsignedInteger:i];
          [(NSMapTable *)v19 setObject:v18 forKey:v20];
        }
      }
    }
    v21 = v9;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(GEOEnvironmentInfo *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"GEOResourceManifestEnvironment"];

  v5 = [(GEOEnvironmentInfo *)self displayName];
  [v3 setObject:v5 forKeyedSubscript:@"displayName"];

  [v3 setObject:self->_uuid forKeyedSubscript:@"uuid"];
  for (uint64_t i = 0; i != 66; ++i)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    *(void *)&double v7 = _recordForType(i, (uint64_t)&v15).n128_u64[0];
    int v8 = DWORD2(v15);
    uint64_t v9 = v16;
    overrideURLs = self->_overrideURLs;
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", i, v7);
    v12 = [(NSMapTable *)overrideURLs objectForKey:v11];

    if ([v12 length])
    {
      uint64_t v13 = GEODefaultsKeyStringForConfigKey(v8, v9);
      [v3 setObject:v12 forKeyedSubscript:v13];
    }
  }

  return v3;
}

- (void)save
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 objectForKey:@"CustomEnvironments"];
  id v14 = [v3 arrayWithArray:v5];

  if ([v14 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      double v7 = [v14 objectAtIndexedSubscript:v6];
      int v8 = [v7 objectForKeyedSubscript:@"uuid"];
      if ([v8 isEqualToString:self->_uuid]) {
        break;
      }

      if (++v6 >= (unint64_t)[v14 count]) {
        goto LABEL_5;
      }
    }
    [v14 removeObjectAtIndex:v6];
    uint64_t v9 = [(GEOCustomEnvironmentInfo *)self dictionaryRepresentation];
    [v14 insertObject:v9 atIndex:v6];
  }
  else
  {
LABEL_5:
    double v7 = [(GEOCustomEnvironmentInfo *)self dictionaryRepresentation];
    [v14 addObject:v7];
  }

  v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v10 setObject:v14 forKey:@"CustomEnvironments"];

  uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v11 synchronize];

  if ([(GEOCustomEnvironmentInfo *)self isActive])
  {
    v12 = [(GEOCustomEnvironmentInfo *)self dictionaryRepresentation];
    _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, v12, 1, 0);

    uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"GEOCountryConfigurationProvidersDidChangeNotification" object:self userInfo:0];
  }
}

- (void)delete
{
  if ([(GEOCustomEnvironmentInfo *)self isActive])
  {
    _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, 0, 0, 0);
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"GEOCountryConfigurationProvidersDidChangeNotification" object:self userInfo:0];
  }
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:@"CustomEnvironments"];
  id v11 = [v4 arrayWithArray:v6];

  if ([v11 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = [v11 objectAtIndexedSubscript:v7];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"uuid"];
      if ([v9 isEqualToString:self->_uuid]) {
        break;
      }

      if (++v7 >= (unint64_t)[v11 count]) {
        goto LABEL_9;
      }
    }
    [v11 removeObjectAtIndex:v7];
  }
LABEL_9:
  v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v10 setObject:v11 forKey:@"CustomEnvironments"];
}

- (void)updateWithURLs:(id)a3
{
  v4 = (NSMapTable *)[a3 copy];
  overrideURLs = self->_overrideURLs;
  self->_overrideURLs = v4;

  [(GEOCustomEnvironmentInfo *)self save];
}

- (id)overrideURLs
{
  return self->_overrideURLs;
}

- (void)makeActive
{
  id v8 = [(GEOEnvironmentInfo *)self urlDictionary];
  _setValue(GeoServicesConfig_DisableUpdatingActiveTileGroup, (uint64_t)off_1E9114218, 0, 0, 1);
  v3 = [v8 objectForKeyedSubscript:@"GEOVoltaireResourceManifestURL"];
  if (v3)
  {

LABEL_3:
    _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), 0, 0, 1);
    goto LABEL_6;
  }
  v4 = _getValue(GeoServicesConfig_CustomEnvironmentURLFormat, (uint64_t)off_1E91138F8, 1, 0, 0, 0);
  if (!v4) {
    goto LABEL_3;
  }
  v5 = v4;
  _setValue(GeoServicesConfig_ResourceManifestURL, *((uint64_t *)&GeoServicesConfig_ResourceManifestURL + 1), v4, 1, 1);

LABEL_6:
  _setValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, 0, 0, 1);
  uint64_t v6 = [(GEOCustomEnvironmentInfo *)self dictionaryRepresentation];
  _setValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, v6, 1, 1);

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"GEOCountryConfigurationProvidersDidChangeNotification" object:self userInfo:0];

  [(GEOEnvironmentInfo *)self _performActivation];
}

- (BOOL)isActive
{
  v3 = _getValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, 1, 0, 0, 0);
  v4 = [v3 objectForKeyedSubscript:@"uuid"];
  LOBYTE(self) = [v4 isEqualToString:self->_uuid];

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_overrideURLs, 0);
}

@end