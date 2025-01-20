@interface HMDAccessoryBrowserXPCMessageSendPolicyParameters
- (BOOL)isBrowsing;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryBrowserXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3 browsing:(BOOL)a4;
- (id)attributeDescriptions;
- (id)signature;
- (unint64_t)hash;
- (void)setBrowsing:(BOOL)a3;
@end

@implementation HMDAccessoryBrowserXPCMessageSendPolicyParameters

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (BOOL)isBrowsing
{
  return self->_browsing;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
  v3 = [(HMDXPCMessageSendPolicyParameters *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryBrowserXPCMessageSendPolicyParameters *)self isBrowsing];
  v5 = HMFBooleanToString();
  v6 = (void *)[v4 initWithName:@"Browsing" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (unint64_t)hash
{
  return [(HMDAccessoryBrowserXPCMessageSendPolicyParameters *)self isBrowsing];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryBrowserXPCMessageSendPolicyParameters *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
    if ([(HMDXPCMessageSendPolicyParameters *)&v11 isEqual:v4])
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
        BOOL v8 = [(HMDAccessoryBrowserXPCMessageSendPolicyParameters *)self isBrowsing];
        BOOL v9 = v8 ^ [(HMDAccessoryBrowserXPCMessageSendPolicyParameters *)v7 isBrowsing] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (id)signature
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
  id v4 = [(HMDXPCMessageSendPolicyParameters *)&v9 signature];
  BOOL v5 = [(HMDAccessoryBrowserXPCMessageSendPolicyParameters *)self isBrowsing];
  v6 = &stru_26E2EB898;
  if (v5) {
    v6 = @"B";
  }
  v7 = [v3 stringWithFormat:@"%@AB:%@", v4, v6];

  return v7;
}

- (HMDAccessoryBrowserXPCMessageSendPolicyParameters)initWithEntitlements:(unint64_t)a3 browsing:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryBrowserXPCMessageSendPolicyParameters;
  result = [(HMDXPCMessageSendPolicyParameters *)&v6 initWithEntitlements:a3];
  if (result) {
    result->_browsing = a4;
  }
  return result;
}

@end