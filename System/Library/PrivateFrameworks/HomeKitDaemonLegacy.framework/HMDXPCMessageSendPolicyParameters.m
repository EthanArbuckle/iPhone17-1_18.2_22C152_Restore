@interface HMDXPCMessageSendPolicyParameters
- (BOOL)isEqual:(id)a3;
- (HMDXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3;
- (NSString)signature;
- (id)attributeDescriptions;
- (unint64_t)entitlements;
@end

@implementation HMDXPCMessageSendPolicyParameters

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDXPCMessageSendPolicyParameters *)self entitlements];
  v4 = HMXPCClientEntitlementsShortDescription();
  v5 = (void *)[v3 initWithName:@"Entitlements" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDXPCMessageSendPolicyParameters;
  result = [(HMDXPCMessageSendPolicyParameters *)&v5 init];
  if (result) {
    result->_entitlements = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDXPCMessageSendPolicyParameters *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      unint64_t v7 = [(HMDXPCMessageSendPolicyParameters *)self entitlements];
      BOOL v8 = v7 == [(HMDXPCMessageSendPolicyParameters *)v6 entitlements];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (NSString)signature
{
  return (NSString *)&stru_1F2C9F1A8;
}

@end