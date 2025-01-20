@interface GEOFeatureInfo
- (GEOFeatureInfo)initWithName:(id)a3;
- (NSString)name;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation GEOFeatureInfo

- (GEOFeatureInfo)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOFeatureInfo;
  v5 = [(GEOFeatureInfo *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)state
{
  if (GEOIsFeatureActive(self->_name)) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)setState:(int64_t)a3
{
  v5 = _getValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8, 1, 0, 0, 0);
  id v10 = (id)[v5 mutableCopy];

  uint64_t v6 = [v10 objectForKeyedSubscript:self->_name];
  v7 = (void *)[v6 mutableCopy];

  if (a3 == 1) {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC28];
  }
  [v7 setObject:v8 forKeyedSubscript:@"active"];
  [v7 setObject:v8 forKeyedSubscript:@"userOn"];
  [v10 setObject:v7 forKeyedSubscript:self->_name];
  v9 = (void *)[v10 copy];
  _setValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8, v9, 1, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end