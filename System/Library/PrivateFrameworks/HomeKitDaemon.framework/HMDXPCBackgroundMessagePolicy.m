@interface HMDXPCBackgroundMessagePolicy
+ (id)defaultPolicy;
+ (id)policyWithEntitlementRequirement:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresEntitlement;
- (HMDXPCBackgroundMessagePolicy)init;
- (id)__initWithEntitlementRequirement:(BOOL)a3;
- (unint64_t)hash;
@end

@implementation HMDXPCBackgroundMessagePolicy

- (BOOL)requiresEntitlement
{
  return self->_requiresEntitlement;
}

- (unint64_t)hash
{
  return [(HMDXPCBackgroundMessagePolicy *)self requiresEntitlement];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDXPCBackgroundMessagePolicy *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      BOOL v7 = [(HMDXPCBackgroundMessagePolicy *)self requiresEntitlement];
      BOOL v8 = v7 ^ [(HMDXPCBackgroundMessagePolicy *)v6 requiresEntitlement] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (id)__initWithEntitlementRequirement:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDXPCBackgroundMessagePolicy;
  id result = [(HMDXPCBackgroundMessagePolicy *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (HMDXPCBackgroundMessagePolicy)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)defaultPolicy
{
  return (id)[a1 policyWithEntitlementRequirement:1];
}

+ (id)policyWithEntitlementRequirement:(BOOL)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "__initWithEntitlementRequirement:", a3);
  return v3;
}

@end