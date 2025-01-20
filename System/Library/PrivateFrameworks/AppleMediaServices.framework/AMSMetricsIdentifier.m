@interface AMSMetricsIdentifier
+ (id)clientIdKey;
+ (void)cleanupIdentifiers;
+ (void)removeIdentifiersForAccount:(id)a3;
- (ACAccount)account;
- (AMSMetricsIdentifier)init;
- (AMSProcessInfo)clientInfo;
- (NSString)domain;
- (double)duration;
- (id)generateEventFields;
- (id)generateIdentifier;
- (void)setAccount:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDuration:(double)a3;
@end

@implementation AMSMetricsIdentifier

- (void)setDuration:(double)a3
{
}

- (void)setClientInfo:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)generateEventFields
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(AMSMetricsIdentifier *)self generateIdentifier];
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = @"clientGeneratedId";
    v6[1] = @"clientId";
    v7[0] = MEMORY[0x1E4F1CC38];
    v7[1] = v2;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (id)generateIdentifier
{
  store = self->_store;
  v3 = +[AMSMetricsIdentifier clientIdKey];
  v4 = [(AMSMetricsIdentifierStore *)store identifierForKey:v3];

  return v4;
}

+ (id)clientIdKey
{
  if (_MergedGlobals_130 != -1) {
    dispatch_once(&_MergedGlobals_130, &__block_literal_global_91);
  }
  uint64_t v2 = (void *)qword_1EB38DDD8;
  return v2;
}

- (AMSMetricsIdentifier)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSMetricsIdentifier;
  uint64_t v2 = [(AMSMetricsIdentifier *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    store = v2->_store;
    v2->_store = (AMSMetricsIdentifierStore *)v3;

    v5 = +[AMSProcessInfo currentProcess];
    [(AMSMetricsIdentifierStore *)v2->_store setClientInfo:v5];
  }
  return v2;
}

uint64_t __35__AMSMetricsIdentifier_clientIdKey__block_invoke()
{
  qword_1EB38DDD8 = +[AMSMetricsIdentifierKey keyWithName:0x1EDCAE7E8 crossDeviceSync:0];
  return MEMORY[0x1F41817F8]();
}

- (ACAccount)account
{
  return [(AMSMetricsIdentifierStore *)self->_store account];
}

- (AMSProcessInfo)clientInfo
{
  return [(AMSMetricsIdentifierStore *)self->_store clientInfo];
}

- (NSString)domain
{
  return [(AMSMetricsIdentifierStore *)self->_store domain];
}

- (void)setDomain:(id)a3
{
}

- (double)duration
{
  [(AMSMetricsIdentifierStore *)self->_store resetInterval];
  return result;
}

+ (void)cleanupIdentifiers
{
}

+ (void)removeIdentifiersForAccount:(id)a3
{
}

@end