@interface DIVerificationSessionContext
+ (BOOL)supportsSecureCoding;
- (DIVerificationSessionContext)initWithCoder:(id)a3;
- (DIVerificationSessionContext)initWithName:(id)a3 tier:(id)a4 serviceUrl:(id)a5 httpHeaders:(id)a6;
- (NSArray)preferredLanguages;
- (NSDictionary)httpHeaders;
- (NSString)regionCode;
- (NSString)serviceName;
- (NSString)serviceURL;
- (NSString)tier;
- (unint64_t)invocationReason;
- (void)encodeWithCoder:(id)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setInvocationReason:(unint64_t)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceURL:(id)a3;
- (void)setTier:(id)a3;
@end

@implementation DIVerificationSessionContext

- (DIVerificationSessionContext)initWithName:(id)a3 tier:(id)a4 serviceUrl:(id)a5 httpHeaders:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 length])
  {
    v18.receiver = self;
    v18.super_class = (Class)DIVerificationSessionContext;
    v15 = [(DIVerificationSessionContext *)&v18 init];
    v16 = v15;
    if (v15)
    {
      v15->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v15->_serviceName, a3);
      objc_storeStrong((id *)&v16->_tier, a4);
      objc_storeStrong((id *)&v16->_serviceURL, a5);
      objc_storeStrong((id *)&v16->_httpHeaders, a6);
    }
  }
  else
  {

    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeObject:self->_serviceName forKey:@"serviceName"];
  [v5 encodeObject:self->_tier forKey:@"tier"];
  [v5 encodeObject:self->_serviceURL forKey:@"serviceURL"];
  [v5 encodeObject:self->_httpHeaders forKey:@"httpHeaders"];
  [v5 encodeObject:self->_regionCode forKey:@"regionCode"];
  [v5 encodeInteger:self->_invocationReason forKey:@"invocationReason"];
  [v5 encodeObject:self->_preferredLanguages forKey:@"preferredLanguages"];

  os_unfair_lock_unlock(p_lock);
}

- (DIVerificationSessionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceURL"];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"httpHeaders"];

  id v12 = [(DIVerificationSessionContext *)self initWithName:v5 tier:v6 serviceUrl:v7 httpHeaders:v11];
  if (v12)
  {
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionCode"];
    regionCode = v12->_regionCode;
    v12->_regionCode = (NSString *)v13;

    v12->_invocationReason = [v4 decodeIntegerForKey:@"invocationReason"];
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"preferredLanguages"];
    preferredLanguages = v12->_preferredLanguages;
    v12->_preferredLanguages = (NSArray *)v18;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setServiceName:(id)a3
{
  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serviceName != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    serviceName = self->_serviceName;
    self->_serviceName = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setTier:(id)a3
{
  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_tier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    tier = self->_tier;
    self->_tier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setServiceURL:(id)a3
{
  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serviceURL != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    serviceURL = self->_serviceURL;
    self->_serviceURL = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHttpHeaders:(id)a3
{
  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_httpHeaders != v6)
  {
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copyWithZone:0];
    httpHeaders = self->_httpHeaders;
    self->_httpHeaders = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRegionCode:(id)a3
{
  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_regionCode != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    regionCode = self->_regionCode;
    self->_regionCode = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setInvocationReason:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invocationReason = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferredLanguages:(id)a3
{
  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_preferredLanguages != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    preferredLanguages = self->_preferredLanguages;
    self->_preferredLanguages = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)serviceName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_serviceName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)tier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_tier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)serviceURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_serviceURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)httpHeaders
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_httpHeaders;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)regionCode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_regionCode;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)invocationReason
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t invocationReason = self->_invocationReason;
  os_unfair_lock_unlock(p_lock);
  return invocationReason;
}

- (NSArray)preferredLanguages
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_preferredLanguages;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_tier, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end