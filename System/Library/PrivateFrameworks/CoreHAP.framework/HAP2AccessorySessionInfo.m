@interface HAP2AccessorySessionInfo
- (HAP2AccessorySessionInfo)init;
- (HAP2AccessorySessionInfo)initWithNumIPs:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5;
- (unint64_t)numBonjourNames;
- (unint64_t)numIPAddresses;
- (unint64_t)numIPAddressesTried;
- (void)resetWithNumIPs:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5;
@end

@implementation HAP2AccessorySessionInfo

- (unint64_t)numBonjourNames
{
  return self->_numBonjourNames;
}

- (unint64_t)numIPAddressesTried
{
  return self->_numIPAddressesTried;
}

- (unint64_t)numIPAddresses
{
  return self->_numIPAddresses;
}

- (void)resetWithNumIPs:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5
{
  self->_numIPAddresses = a3;
  self->_numIPAddressesTried = a4;
  self->_numBonjourNames = a5;
}

- (HAP2AccessorySessionInfo)initWithNumIPs:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessorySessionInfo;
  v8 = [(HAP2AccessorySessionInfo *)&v11 init];
  v9 = v8;
  if (v8) {
    [(HAP2AccessorySessionInfo *)v8 resetWithNumIPs:a3 numIPsTried:a4 numBonjourNames:a5];
  }
  return v9;
}

- (HAP2AccessorySessionInfo)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end