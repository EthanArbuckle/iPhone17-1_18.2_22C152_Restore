@interface HMDNetworkRouterAdvertisementProtocol
+ (id)parsedFromData:(id)a3 error:(id *)a4;
+ (id)protocolFromFirewallRuleAdvertisingProtocol:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterAdvertisementProtocol)init;
- (HMDNetworkRouterAdvertisementProtocol)initWithAdvertisementProtocol:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)advertisementProtocol;
- (void)setAdvertisementProtocol:(int64_t)a3;
@end

@implementation HMDNetworkRouterAdvertisementProtocol

+ (id)protocolFromFirewallRuleAdvertisingProtocol:(unsigned __int8)a3
{
  if (!a3)
  {
    uint64_t v3 = 0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v3 = 1;
LABEL_5:
    v4 = [[HMDNetworkRouterAdvertisementProtocol alloc] initWithAdvertisementProtocol:v3];
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:
  return v4;
}

- (void)setAdvertisementProtocol:(int64_t)a3
{
  self->_advertisementProtocol = a3;
}

- (int64_t)advertisementProtocol
{
  return self->_advertisementProtocol;
}

- (NSString)description
{
  v2 = NSString;
  int64_t v3 = [(HMDNetworkRouterAdvertisementProtocol *)self advertisementProtocol];
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = @"HMDNetworkRouterAdvertisementProtocolTypeSSDP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDNetworkRouterAdvertisementProtocolType %ld", v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"HMDNetworkRouterAdvertisementProtocolTypeDNSSD";
  }
  v5 = [v2 stringWithFormat:@"<HMDNetworkRouterAdvertisementProtocol advertisementProtocol=%@>", v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNetworkRouterAdvertisementProtocol *)a3;
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
      int64_t v6 = [(HMDNetworkRouterAdvertisementProtocol *)self advertisementProtocol];
      uint64_t v7 = [(HMDNetworkRouterAdvertisementProtocol *)v5 advertisementProtocol];

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
  v4 = +[HMDNetworkRouterAdvertisementProtocol allocWithZone:a3];
  int64_t v5 = [(HMDNetworkRouterAdvertisementProtocol *)self advertisementProtocol];
  return [(HMDNetworkRouterAdvertisementProtocol *)v4 initWithAdvertisementProtocol:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDNetworkRouterAdvertisementProtocol *)self advertisementProtocol];
  return (id)MEMORY[0x1F4113D68](v3);
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
    [(HMDNetworkRouterAdvertisementProtocol *)self setAdvertisementProtocol:HAPTLVParseUInt64()];
    goto LABEL_7;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];
  BOOL v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (HMDNetworkRouterAdvertisementProtocol)initWithAdvertisementProtocol:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterAdvertisementProtocol;
  result = [(HMDNetworkRouterAdvertisementProtocol *)&v5 init];
  if (result) {
    result->_advertisementProtocol = a3;
  }
  return result;
}

- (HMDNetworkRouterAdvertisementProtocol)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterAdvertisementProtocol;
  result = [(HMDNetworkRouterAdvertisementProtocol *)&v3 init];
  if (result) {
    result->_advertisementProtocol = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterAdvertisementProtocol);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterAdvertisementProtocol *)v6 parseFromData:v5 error:&v10];
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