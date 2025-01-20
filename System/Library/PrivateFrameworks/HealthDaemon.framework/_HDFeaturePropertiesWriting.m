@interface _HDFeaturePropertiesWriting
- (_HDFeaturePropertiesWriting)initWithLocalDomain:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation _HDFeaturePropertiesWriting

- (_HDFeaturePropertiesWriting)initWithLocalDomain:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDFeaturePropertiesWriting;
  v6 = [(_HDFeaturePropertiesWriting *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localDomain, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v5];
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (NSUserDefaults *)v8;
  }
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)synchronize
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"FeatureVersion", @"UpdateVersion", @"UDIDeviceIdentifier", @"YearOfRelease", @"AvailableRegions", @"AvailableRegionsVersion", @"AvailableRegionsContentVersion", @"CountrySetProvenance", 0);
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_localDomain, 0);
}

@end