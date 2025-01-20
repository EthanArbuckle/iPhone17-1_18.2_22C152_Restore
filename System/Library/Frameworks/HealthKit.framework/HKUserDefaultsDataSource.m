@interface HKUserDefaultsDataSource
+ (id)ageGatingDataSource;
+ (id)privacyPreferencesDataSource;
+ (id)respiratoryPreferencesDataSource;
+ (id)sharedHealthPreferencesDataSource;
- (HKUserDefaultsDataSource)initWithUserDefaults:(id)a3;
- (NSUserDefaults)userDefaults;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
@end

@implementation HKUserDefaultsDataSource

- (HKUserDefaultsDataSource)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserDefaultsDataSource;
  v6 = [(HKObserverBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
  }

  return v7;
}

+ (id)privacyPreferencesDataSource
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.nanolifestyle.privacy"];
  v4 = (void *)[v2 initWithUserDefaults:v3];

  return v4;
}

+ (id)respiratoryPreferencesDataSource
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.private.health.respiratory"];
  v4 = (void *)[v2 initWithUserDefaults:v3];

  return v4;
}

+ (id)ageGatingDataSource
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.private.health.age-gating"];
  v4 = (void *)[v2 initWithUserDefaults:v3];

  return v4;
}

+ (id)sharedHealthPreferencesDataSource
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.health.shared"];
  v4 = (void *)[v2 initWithUserDefaults:v3];

  return v4;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_HKUserDefaultsBridgedObserver alloc] initWithHandle:v6];

  [(NSUserDefaults *)self->_userDefaults addObserver:v8 forKeyPath:v7 options:1 context:0];

  return v8;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

@end