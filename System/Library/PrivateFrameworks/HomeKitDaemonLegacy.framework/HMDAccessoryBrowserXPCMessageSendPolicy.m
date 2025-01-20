@interface HMDAccessoryBrowserXPCMessageSendPolicy
- (BOOL)canSendWithPolicyParameters:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryBrowserXPCMessageSendPolicy)initWithRequiredEntitlements:(unint64_t)a3;
- (id)attributeDescriptions;
- (unint64_t)requiredEntitlements;
@end

@implementation HMDAccessoryBrowserXPCMessageSendPolicy

- (unint64_t)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAccessoryBrowserXPCMessageSendPolicy *)self requiredEntitlements];
  v4 = HMXPCClientEntitlementsShortDescription();
  v5 = (void *)[v3 initWithName:@"Entitlements" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDAccessoryBrowserXPCMessageSendPolicy *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicy;
    if ([(HMDXPCMessageSendPolicy *)&v11 isEqual:v4])
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      if (v7)
      {
        unint64_t v8 = [(HMDAccessoryBrowserXPCMessageSendPolicy *)self requiredEntitlements];
        BOOL v9 = v8 == [(HMDAccessoryBrowserXPCMessageSendPolicy *)v7 requiredEntitlements];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)canSendWithPolicyParameters:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6 && [v6 isBrowsing])
  {
    unint64_t v8 = [(HMDAccessoryBrowserXPCMessageSendPolicy *)self requiredEntitlements];
    uint64_t v9 = [v7 entitlements] & v8;
    BOOL v10 = v9 == [(HMDAccessoryBrowserXPCMessageSendPolicy *)self requiredEntitlements];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (HMDAccessoryBrowserXPCMessageSendPolicy)initWithRequiredEntitlements:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicy;
  result = [(HMDAccessoryBrowserXPCMessageSendPolicy *)&v5 init];
  if (result) {
    result->_requiredEntitlements = a3 | 1;
  }
  return result;
}

@end