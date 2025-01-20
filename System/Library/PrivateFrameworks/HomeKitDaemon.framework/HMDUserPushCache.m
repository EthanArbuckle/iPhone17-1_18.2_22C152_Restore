@interface HMDUserPushCache
- (BOOL)isExpired;
- (HMDDevice)device;
- (HMDUserPushCache)init;
- (HMDUserPushCache)initWithDevice:(id)a3;
- (NSDate)expirationDate;
- (void)setExpirationDate:(id)a3;
@end

@implementation HMDUserPushCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (HMDDevice)device
{
  return self->_device;
}

- (BOOL)isExpired
{
  v2 = [(HMDUserPushCache *)self expirationDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 < 0.0;

  return v4;
}

- (HMDUserPushCache)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDUserPushCache;
  v6 = [(HMDUserPushCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)(unint64_t)userPushCacheTimeInterval];
    expirationDate = v7->_expirationDate;
    v7->_expirationDate = (NSDate *)v8;
  }
  return v7;
}

- (HMDUserPushCache)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  BOOL v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end