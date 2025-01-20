@interface HMDXPCMessagePolicy
+ (id)defaultPolicy;
+ (id)policyWithEntitlements:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMDXPCMessagePolicy)init;
- (id)__initWithEntitlements:(unint64_t)a3;
- (unint64_t)entitlements;
@end

@implementation HMDXPCMessagePolicy

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDXPCMessagePolicy *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
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
      unint64_t v7 = [(HMDXPCMessagePolicy *)self entitlements];
      BOOL v8 = v7 == [(HMDXPCMessagePolicy *)v6 entitlements];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)__initWithEntitlements:(unint64_t)a3
{
  unint64_t v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((a3 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1D9452090](self, a2);
    v6 = self;
    unint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Adding missing developer client entitlement requirement", buf, 0xCu);
    }
    v3 |= 1uLL;
  }
  v10.receiver = self;
  v10.super_class = (Class)HMDXPCMessagePolicy;
  id result = [(HMDXPCMessagePolicy *)&v10 init];
  if (result) {
    *((void *)result + 1) = v3;
  }
  return result;
}

- (HMDXPCMessagePolicy)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)defaultPolicy
{
  return (id)[a1 policyWithEntitlements:1];
}

+ (id)policyWithEntitlements:(unint64_t)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "__initWithEntitlements:", a3);
  return v3;
}

@end