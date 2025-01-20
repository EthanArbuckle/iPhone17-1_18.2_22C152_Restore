@interface __HMDRegisteredIdentity
- (HMFPairingIdentity)identity;
- (NSMutableArray)registeredObjects;
- (__HMDRegisteredIdentity)init;
- (__HMDRegisteredIdentity)initWithIdentity:(id)a3;
- (id)debugDescription;
- (id)description;
@end

@implementation __HMDRegisteredIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredObjects, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (NSMutableArray)registeredObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMFPairingIdentity)identity
{
  return (HMFPairingIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v2 = [(__HMDRegisteredIdentity *)self identity];
  v3 = [v2 description];

  return v3;
}

- (id)debugDescription
{
  v2 = [(__HMDRegisteredIdentity *)self identity];
  v3 = [v2 debugDescription];

  return v3;
}

- (__HMDRegisteredIdentity)initWithIdentity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMDRegisteredIdentity;
    v5 = [(__HMDRegisteredIdentity *)&v12 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      identity = v5->_identity;
      v5->_identity = (HMFPairingIdentity *)v6;

      uint64_t v8 = [MEMORY[0x263EFF980] array];
      registeredObjects = v5->_registeredObjects;
      v5->_registeredObjects = (NSMutableArray *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (__HMDRegisteredIdentity)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end