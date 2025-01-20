@interface CLSTimeZones
+ (id)sharedInstance;
- (NSArray)timeZonesDB;
- (id)_importDataBaseFromFile:(id)a3;
- (id)closestZoneInfoWithLocation:(id)a3 source:(id)a4;
- (id)filteredTimeZonesWithCountyCode:(id)a3;
- (id)timeZoneWithDictionary:(id)a3;
- (id)timeZoneWithLocation:(id)a3;
- (id)timeZoneWithLocation:(id)a3 countryCode:(id)a4;
- (void)invalidateCaches;
- (void)setTimeZonesDB:(id)a3;
@end

@implementation CLSTimeZones

- (void).cxx_destruct
{
}

- (void)setTimeZonesDB:(id)a3
{
}

- (id)timeZoneWithDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"zone"];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)filteredTimeZonesWithCountyCode:(id)a3
{
  v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"country_code LIKE %@", a3];
  v5 = [(CLSTimeZones *)self timeZonesDB];
  v6 = [v5 filteredArrayUsingPredicate:v4];

  return v6;
}

- (id)closestZoneInfoWithLocation:(id)a3 source:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v20;
    double v11 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = [v13 objectForKeyedSubscript:@"clLocation"];
        [v5 distanceFromLocation:v14];
        if (v15 < v11)
        {
          double v16 = v15;
          id v17 = v13;

          v9 = v17;
          double v11 = v16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_importDataBaseFromFile:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 pathForResource:v3 ofType:0];

  v25 = (void *)v5;
  [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  uint64_t v24 = v30 = 0;
  id v6 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:");
  id v23 = v30;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "objectForKeyedSubscript:", @"latitude", v23);
        [v14 doubleValue];
        double v16 = v15;

        id v17 = [v13 objectForKeyedSubscript:@"longitude"];
        [v17 doubleValue];
        double v19 = v18;

        long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v16 longitude:v19];
        if (v20)
        {
          long long v21 = (void *)[v13 mutableCopy];
          [v21 setObject:v20 forKeyedSubscript:@"clLocation"];
          [v7 addObject:v21];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  return v7;
}

- (NSArray)timeZonesDB
{
  v2 = self;
  objc_sync_enter(v2);
  timeZonesDB = v2->_timeZonesDB;
  if (!timeZonesDB)
  {
    uint64_t v4 = [(CLSTimeZones *)v2 _importDataBaseFromFile:@"timezonesDB.json"];
    uint64_t v5 = v2->_timeZonesDB;
    v2->_timeZonesDB = (NSArray *)v4;

    timeZonesDB = v2->_timeZonesDB;
  }
  id v6 = timeZonesDB;
  objc_sync_exit(v2);

  return v6;
}

- (void)invalidateCaches
{
  obj = self;
  objc_sync_enter(obj);
  timeZonesDB = obj->_timeZonesDB;
  obj->_timeZonesDB = 0;

  objc_sync_exit(obj);
}

- (id)timeZoneWithLocation:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    uint64_t v7 = [(CLSTimeZones *)self filteredTimeZonesWithCountyCode:a4];
    id v8 = [(CLSTimeZones *)self closestZoneInfoWithLocation:v6 source:v7];
    uint64_t v9 = [(CLSTimeZones *)self timeZoneWithDictionary:v8];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(CLSTimeZones *)self timeZoneWithLocation:v6];
    }
    v12 = v11;
  }
  else
  {
    v12 = [(CLSTimeZones *)self timeZoneWithLocation:v6];
  }

  return v12;
}

- (id)timeZoneWithLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CLSTimeZones *)self timeZonesDB];
  id v6 = [(CLSTimeZones *)self closestZoneInfoWithLocation:v4 source:v5];

  if (!v6
    || ([(CLSTimeZones *)self timeZoneWithDictionary:v6],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  }

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_6589);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __30__CLSTimeZones_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(CLSTimeZones);
  return MEMORY[0x1F41817F8]();
}

@end