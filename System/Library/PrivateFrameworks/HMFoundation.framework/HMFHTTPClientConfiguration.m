@interface HMFHTTPClientConfiguration
+ (id)defaultConfiguration;
- (BOOL)allowsAnonymousConnection;
- (BOOL)allowsCellularAccess;
- (BOOL)monitorsReachability;
- (BOOL)requiresEncryption;
- (BOOL)supportsWakeOnLAN;
- (HMFHTTPClientConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowsAnonymousConnection:(BOOL)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setMonitorsReachability:(BOOL)a3;
- (void)setRequiresEncryption:(BOOL)a3;
- (void)setSupportsWakeOnLAN:(BOOL)a3;
@end

@implementation HMFHTTPClientConfiguration

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(HMFHTTPClientConfiguration);
  return v2;
}

- (HMFHTTPClientConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMFHTTPClientConfiguration;
  result = [(HMFHTTPClientConfiguration *)&v3 init];
  if (result)
  {
    result->_requiresEncryption = 0;
    result->_allowsAnonymousConnection = 0;
    result->_allowsCellularAccess = 1;
    result->_supportsWakeOnLAN = 0;
    result->_monitorsReachability = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = [(HMFHTTPClientConfiguration *)self requiresEncryption];
  v4[9] = [(HMFHTTPClientConfiguration *)self allowsAnonymousConnection];
  v4[10] = [(HMFHTTPClientConfiguration *)self allowsCellularAccess];
  v4[11] = [(HMFHTTPClientConfiguration *)self supportsWakeOnLAN];
  v4[12] = [(HMFHTTPClientConfiguration *)self monitorsReachability];
  return v4;
}

- (BOOL)requiresEncryption
{
  return self->_requiresEncryption;
}

- (void)setRequiresEncryption:(BOOL)a3
{
  self->_requiresEncryption = a3;
}

- (BOOL)allowsAnonymousConnection
{
  return self->_allowsAnonymousConnection;
}

- (void)setAllowsAnonymousConnection:(BOOL)a3
{
  self->_allowsAnonymousConnection = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)supportsWakeOnLAN
{
  return self->_supportsWakeOnLAN;
}

- (void)setSupportsWakeOnLAN:(BOOL)a3
{
  self->_supportsWakeOnLAN = a3;
}

- (BOOL)monitorsReachability
{
  return self->_monitorsReachability;
}

- (void)setMonitorsReachability:(BOOL)a3
{
  self->_monitorsReachability = a3;
}

@end