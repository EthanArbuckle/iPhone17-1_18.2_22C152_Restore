@interface HMDDeviceSetupSessionInternal
+ (BOOL)isSupported;
+ (id)allowedClasses;
+ (int64_t)role;
- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7;
- (HMDDeviceSetupSessionInternal)initWithHomeManager:(id)a3 userDefaults:(id)a4;
- (HMDHomeManager)homeManager;
- (NSData)sessionData;
- (NSDictionary)userInfo;
- (NSUserDefaults)userDefaults;
- (unint64_t)state;
- (void)setSessionData:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HMDDeviceSetupSessionInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setSessionData:(id)a3
{
}

- (NSData)sessionData
{
  return self->_sessionData;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF940];
  uint64_t v10 = *MEMORY[0x263EFF498];
  v11 = NSString;
  v12 = NSStringFromSelector(a2);
  v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (HMDDeviceSetupSessionInternal)initWithHomeManager:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDDeviceSetupSessionInternal;
  id v8 = [(HMDDeviceSetupSessionInternal *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_homeManager, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    v9->_state = 1;
  }

  return v9;
}

+ (id)allowedClasses
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

+ (BOOL)isSupported
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (int64_t)role
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end