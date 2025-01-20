@interface APSDNSCacheIPAddress
- (APSDNSCacheIPAddress)initWithIPAddress:(id)a3 addressFamily:(unint64_t)a4 timeToLive:(double)a5;
- (NSDate)expirationTime;
- (NSString)ipAddress;
- (unint64_t)addressFamily;
- (void)updateExpirationTime:(double)a3;
@end

@implementation APSDNSCacheIPAddress

- (APSDNSCacheIPAddress)initWithIPAddress:(id)a3 addressFamily:(unint64_t)a4 timeToLive:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APSDNSCacheIPAddress;
  v10 = [(APSDNSCacheIPAddress *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ipAddress, a3);
    v11->_addressFamily = a4;
    [(APSDNSCacheIPAddress *)v11 updateExpirationTime:a5];
  }

  return v11;
}

- (void)updateExpirationTime:(double)a3
{
  v4 = (NSDate *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:a3];
  expirationTime = self->_expirationTime;
  self->_expirationTime = v4;
  _objc_release_x1(v4, expirationTime);
}

- (NSString)ipAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)addressFamily
{
  return self->_addressFamily;
}

- (NSDate)expirationTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

@end