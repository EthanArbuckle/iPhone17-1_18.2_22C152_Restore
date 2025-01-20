@interface HMDNetworkRouterWANFirewall
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterWANFirewall)init;
- (HMDNetworkRouterWANFirewall)initWithType:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation HMDNetworkRouterWANFirewall

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)description
{
  v2 = NSString;
  int64_t v3 = [(HMDNetworkRouterWANFirewall *)self type];
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = @"HMDNetworkRouterWANFirewallTypeAllowListAccess";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDNetworkRouterWANFirewallType %ld", v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"HMDNetworkRouterWANFirewallTypeFullAccess";
  }
  v5 = [v2 stringWithFormat:@"<HMDNetworkRouterWANFirewall type=%@>", v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNetworkRouterWANFirewall *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(HMDNetworkRouterWANFirewall *)self type];
      uint64_t v7 = [(HMDNetworkRouterWANFirewall *)v5 type];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterWANFirewall allocWithZone:a3];
  int64_t v5 = [(HMDNetworkRouterWANFirewall *)self type];
  return [(HMDNetworkRouterWANFirewall *)v4 initWithType:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDNetworkRouterWANFirewall *)self type];
  return (id)MEMORY[0x270F18D88](v3);
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a4)
  {
    if (![v6 length])
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  *a4 = 0;
  if ([v6 length])
  {
LABEL_5:
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    BOOL v8 = 1;
    [(HMDNetworkRouterWANFirewall *)self setType:HAPTLVParseUInt64()];
    goto LABEL_7;
  }
  [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];
  BOOL v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (HMDNetworkRouterWANFirewall)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterWANFirewall;
  result = [(HMDNetworkRouterWANFirewall *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (HMDNetworkRouterWANFirewall)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterWANFirewall;
  result = [(HMDNetworkRouterWANFirewall *)&v3 init];
  if (result) {
    result->_type = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterWANFirewall);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterWANFirewall *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      uint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  return v7;
}

@end