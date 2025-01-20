@interface __HMDRegisteredAccountIdentity
- (HMDAccount)account;
- (__HMDRegisteredAccountIdentity)initWithIdentity:(id)a3;
- (__HMDRegisteredAccountIdentity)initWithIdentity:(id)a3 account:(id)a4;
@end

@implementation __HMDRegisteredAccountIdentity

- (void).cxx_destruct
{
}

- (HMDAccount)account
{
  return (HMDAccount *)objc_getProperty(self, a2, 24, 1);
}

- (__HMDRegisteredAccountIdentity)initWithIdentity:(id)a3 account:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMDRegisteredAccountIdentity;
    v8 = [(__HMDRegisteredIdentity *)&v12 initWithIdentity:a3];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_account, a4);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (__HMDRegisteredAccountIdentity)initWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end