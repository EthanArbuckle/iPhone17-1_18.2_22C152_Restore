@interface HMDHomeManagerXPCMessageSendPolicyParameters
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (HMDHomeManagerXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)signature;
- (unint64_t)options;
- (void)setActive:(BOOL)a3;
@end

@implementation HMDHomeManagerXPCMessageSendPolicyParameters

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
  v3 = [(HMDXPCMessageSendPolicyParameters *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDHomeManagerXPCMessageSendPolicyParameters *)self options];
  v5 = HMHomeManagerOptionsToString();
  v6 = (void *)[v4 initWithName:@"Options" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDHomeManagerXPCMessageSendPolicyParameters *)self isActive];
  v8 = HMFBooleanToString();
  v9 = (void *)[v7 initWithName:@"Active" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(HMDHomeManagerXPCMessageSendPolicyParameters *)+[HMDMutableHomeManagerXPCMessageSendPolicyParameters allocWithZone:a3] initWithEntitlements:[(HMDXPCMessageSendPolicyParameters *)self entitlements] options:[(HMDHomeManagerXPCMessageSendPolicyParameters *)self options]];
  [(HMDHomeManagerXPCMessageSendPolicyParameters *)v4 setActive:[(HMDHomeManagerXPCMessageSendPolicyParameters *)self isActive]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDHomeManagerXPCMessageSendPolicyParameters *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
    if ([(HMDXPCMessageSendPolicyParameters *)&v12 isEqual:v4])
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      id v7 = v6;

      if (v7
        && (unint64_t v8 = [(HMDHomeManagerXPCMessageSendPolicyParameters *)self options],
            v8 == [(HMDHomeManagerXPCMessageSendPolicyParameters *)v7 options]))
      {
        BOOL v9 = [(HMDHomeManagerXPCMessageSendPolicyParameters *)self isActive];
        BOOL v10 = v9 ^ [(HMDHomeManagerXPCMessageSendPolicyParameters *)v7 isActive] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)signature
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
  id v4 = [(HMDXPCMessageSendPolicyParameters *)&v8 signature];
  [(HMDHomeManagerXPCMessageSendPolicyParameters *)self options];
  v5 = HMHomeManagerOptionsShortDescription();
  v6 = [v3 stringWithFormat:@"%@O:%@", v4, v5];

  return v6;
}

- (HMDHomeManagerXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HMDHomeManagerXPCMessageSendPolicyParameters;
  result = [(HMDXPCMessageSendPolicyParameters *)&v6 initWithEntitlements:a3];
  if (result) {
    result->_options = a4;
  }
  return result;
}

@end