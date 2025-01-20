@interface HMDAppleMediaAccessorySensorManagerLocalDataStore
- (HMDAppleMediaAccessorySensorManagerLocalDataStore)init;
- (HMDAppleMediaAccessorySensorManagerLocalDataStore)initWithUserDefaults:(id)a3;
- (NSUserDefaults)defaults;
- (void)fetchSensorUUIDWithCompletion:(id)a3;
- (void)saveSensorUUID:(id)a3;
- (void)saveSensorUUID:(id)a3 completion:(id)a4;
- (void)setDefaults:(id)a3;
@end

@implementation HMDAppleMediaAccessorySensorManagerLocalDataStore

- (void).cxx_destruct
{
}

- (void)setDefaults:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)fetchSensorUUIDWithCompletion:(id)a3
{
  v7 = (void (**)(id, void *))a3;
  v4 = [(HMDAppleMediaAccessorySensorManagerLocalDataStore *)self defaults];
  v5 = [v4 stringForKey:@"HMMediaAccessorySensorUUID"];

  if (v5) {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  }
  else {
    v6 = 0;
  }
  v7[2](v7, v6);
}

- (void)saveSensorUUID:(id)a3 completion:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  v7 = [(HMDAppleMediaAccessorySensorManagerLocalDataStore *)self defaults];
  v8 = [v6 UUIDString];

  [v7 setValue:v8 forKey:@"HMMediaAccessorySensorUUID"];
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    v9 = v10;
  }
}

- (void)saveSensorUUID:(id)a3
{
}

- (HMDAppleMediaAccessorySensorManagerLocalDataStore)initWithUserDefaults:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessorySensorManagerLocalDataStore;
  v5 = [(HMDAppleMediaAccessorySensorManagerLocalDataStore *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(HMDAppleMediaAccessorySensorManagerLocalDataStore *)v5 setDefaults:v4];
  }

  return v6;
}

- (HMDAppleMediaAccessorySensorManagerLocalDataStore)init
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(HMDAppleMediaAccessorySensorManagerLocalDataStore *)self initWithUserDefaults:v3];

  return v4;
}

@end