@interface OTOperationConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)discretionaryNetwork;
- (BOOL)useCachedAccountStatus;
- (OTOperationConfiguration)init;
- (OTOperationConfiguration)initWithCoder:(id)a3;
- (int64_t)qualityOfService;
- (unint64_t)timeoutWaitForCKAccount;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscretionaryNetwork:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setTimeoutWaitForCKAccount:(unint64_t)a3;
- (void)setUseCachedAccountStatus:(BOOL)a3;
@end

@implementation OTOperationConfiguration

- (void)setUseCachedAccountStatus:(BOOL)a3
{
  self->_useCachedAccountStatus = a3;
}

- (BOOL)useCachedAccountStatus
{
  return self->_useCachedAccountStatus;
}

- (void)setDiscretionaryNetwork:(BOOL)a3
{
  self->_discretionaryNetwork = a3;
}

- (BOOL)discretionaryNetwork
{
  return self->_discretionaryNetwork;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setTimeoutWaitForCKAccount:(unint64_t)a3
{
  self->_timeoutWaitForCKAccount = a3;
}

- (unint64_t)timeoutWaitForCKAccount
{
  return self->_timeoutWaitForCKAccount;
}

- (OTOperationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeoutWaitForCKAccount"];
  self->_timeoutWaitForCKAccount = [v5 unsignedLongLongValue];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qualityOfService"];
  self->_qualityOfService = [v6 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discretionaryNetwork"];
  self->_discretionaryNetwork = [v7 BOOLValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useCachedAccountStatus"];

  self->_useCachedAccountStatus = [v8 BOOLValue];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t timeoutWaitForCKAccount = self->_timeoutWaitForCKAccount;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:timeoutWaitForCKAccount];
  [v6 encodeObject:v7 forKey:@"timeoutWaitForCKAccount"];

  v8 = [NSNumber numberWithInteger:self->_qualityOfService];
  [v6 encodeObject:v8 forKey:@"qualityOfService"];

  v9 = [NSNumber numberWithBool:self->_discretionaryNetwork];
  [v6 encodeObject:v9 forKey:@"discretionaryNetwork"];

  id v10 = [NSNumber numberWithBool:self->_useCachedAccountStatus];
  [v6 encodeObject:v10 forKey:@"useCachedAccountStatus"];
}

- (OTOperationConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)OTOperationConfiguration;
  v2 = [(OTOperationConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_unint64_t timeoutWaitForCKAccount = xmmword_18B414B50;
    *(_WORD *)&v2->_discretionaryNetwork = 0;
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end