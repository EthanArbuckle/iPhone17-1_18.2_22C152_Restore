@interface NEIPv6Route
+ (BOOL)supportsSecureCoding;
+ (NEIPv6Route)defaultRoute;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isDefaultRoute;
- (NEIPv6Route)initWithCoder:(id)a3;
- (NEIPv6Route)initWithDestinationAddress:(NSString *)address networkPrefixLength:(NSNumber *)networkPrefixLength;
- (NSNumber)destinationNetworkPrefixLength;
- (NSString)destinationAddress;
- (NSString)gatewayAddress;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGatewayAddress:(NSString *)gatewayAddress;
@end

@implementation NEIPv6Route

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayAddress, 0);
  objc_storeStrong((id *)&self->_destinationNetworkPrefixLength, 0);

  objc_storeStrong((id *)&self->_destinationAddress, 0);
}

- (void)setGatewayAddress:(NSString *)gatewayAddress
{
}

- (NSString)gatewayAddress
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)destinationNetworkPrefixLength
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)destinationAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEIPv6Route *)self destinationAddress];
  unint64_t v9 = a4 | 1;
  [v7 appendPrettyObject:v8 withName:@"destinationAddress" andIndent:v5 options:a4 | 1];

  v10 = [(NEIPv6Route *)self destinationNetworkPrefixLength];
  [v7 appendPrettyObject:v10 withName:@"destinationNetworkPrefixLength" andIndent:v5 options:a4];

  v11 = [(NEIPv6Route *)self gatewayAddress];
  [v7 appendPrettyObject:v11 withName:@"gatewayAddress" andIndent:v5 options:v9];

  return v7;
}

- (id)initFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  uint64_t v5 = [(NEIPv6Route *)self init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = CFDICTIONARY_TYPE;
      if (CFGetTypeID(v4) == v6)
      {
        uint64_t v7 = NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41CF0], CFSTRING_TYPE);
        destinationAddress = v5->_destinationAddress;
        v5->_destinationAddress = (NSString *)v7;

        uint64_t v9 = NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41D08], CFNUMBER_TYPE);
        destinationNetworkPrefixLength = v5->_destinationNetworkPrefixLength;
        v5->_destinationNetworkPrefixLength = (NSNumber *)v9;

        uint64_t v11 = NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41CF8], CFSTRING_TYPE);
        gatewayAddress = v5->_gatewayAddress;
        v5->_gatewayAddress = (NSString *)v11;
      }
    }
  }

  return v5;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CFDictionaryRef v4 = [(NEIPv6Route *)self destinationAddress];

  if (v4)
  {
    uint64_t v5 = [(NEIPv6Route *)self destinationAddress];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F41CF0]];
  }
  uint64_t v6 = [(NEIPv6Route *)self destinationNetworkPrefixLength];

  if (v6)
  {
    uint64_t v7 = [(NEIPv6Route *)self destinationNetworkPrefixLength];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41D08]];
  }
  v8 = [(NEIPv6Route *)self gatewayAddress];

  if (v8)
  {
    uint64_t v9 = [(NEIPv6Route *)self gatewayAddress];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F41CF8]];
  }
  return v3;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  int32x4_t v17 = 0uLL;
  uint64_t v5 = [(NEIPv6Route *)self destinationAddress];

  if (!v5)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing NEIPv6Route Destination address", v4);
    goto LABEL_9;
  }
  id v6 = [(NEIPv6Route *)self destinationAddress];
  int v7 = inet_pton(30, (const char *)[v6 UTF8String], &v17);

  if (!v7)
  {
    v8 = @"Invalid NEIPv6Route Destination address";
LABEL_8:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v8, v4);
    LOBYTE(v5) = 0;
    goto LABEL_9;
  }
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s32(v17, (int32x4_t)xmmword_19DF9BF40)))) & 1) == 0)
  {
    v8 = @"IPv6Route Destination address in loopback";
    goto LABEL_8;
  }
  LOBYTE(v5) = 1;
LABEL_9:
  uint64_t v9 = [(NEIPv6Route *)self destinationNetworkPrefixLength];
  if (!v9
    || (v10 = (void *)v9,
        [(NEIPv6Route *)self destinationNetworkPrefixLength],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 integerValue],
        v11,
        v10,
        v12 >= 129))
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing NEIPv6Route Destination Network Prefix Length", v4);
  }
  v13 = [(NEIPv6Route *)self gatewayAddress];

  if (v13)
  {
    id v14 = [(NEIPv6Route *)self gatewayAddress];
    int v15 = inet_pton(30, (const char *)[v14 UTF8String], &v17);

    if (!v15)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid NEIPv6Route Gateway address", v4);
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEIPv6Route allocWithZone:a3];
  uint64_t v5 = [(NEIPv6Route *)self destinationAddress];
  id v6 = [(NEIPv6Route *)self destinationNetworkPrefixLength];
  int v7 = [(NEIPv6Route *)v4 initWithDestinationAddress:v5 networkPrefixLength:v6];

  v8 = [(NEIPv6Route *)self gatewayAddress];
  [(NEIPv6Route *)v7 setGatewayAddress:v8];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEIPv6Route *)self destinationAddress];
  [v4 encodeObject:v5 forKey:@"DestinationAddress"];

  id v6 = [(NEIPv6Route *)self destinationNetworkPrefixLength];
  [v4 encodeObject:v6 forKey:@"DestinationPrefixLength"];

  id v7 = [(NEIPv6Route *)self gatewayAddress];
  [v4 encodeObject:v7 forKey:@"RouteGatewayAddress"];
}

- (NEIPv6Route)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEIPv6Route;
  uint64_t v5 = [(NEIPv6Route *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationAddress"];
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationPrefixLength"];
    destinationNetworkPrefixLength = v5->_destinationNetworkPrefixLength;
    v5->_destinationNetworkPrefixLength = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteGatewayAddress"];
    gatewayAddress = v5->_gatewayAddress;
    v5->_gatewayAddress = (NSString *)v10;
  }
  return v5;
}

- (BOOL)isDefaultRoute
{
  id v3 = +[NEIPv6Route defaultRoute];
  id v4 = [(NEIPv6Route *)self destinationAddress];
  uint64_t v5 = [v3 destinationAddress];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [(NEIPv6Route *)self destinationNetworkPrefixLength];
    id v7 = [v3 destinationNetworkPrefixLength];
    char v8 = [v6 isEqualToNumber:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NEIPv6Route)initWithDestinationAddress:(NSString *)address networkPrefixLength:(NSNumber *)networkPrefixLength
{
  id v7 = address;
  char v8 = networkPrefixLength;
  v12.receiver = self;
  v12.super_class = (Class)NEIPv6Route;
  uint64_t v9 = [(NEIPv6Route *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationAddress, address);
    objc_storeStrong((id *)&v10->_destinationNetworkPrefixLength, networkPrefixLength);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEIPv6Route)defaultRoute
{
  self;
  if (initGlobals_onceToken_15861 != -1) {
    dispatch_once(&initGlobals_onceToken_15861, &__block_literal_global_15862);
  }
  v2 = (void *)NEIPv6DefaultRoute;

  return (NEIPv6Route *)v2;
}

uint64_t __26__NEIPv6Route_initGlobals__block_invoke()
{
  v0 = [[NEIPv6Route alloc] initWithDestinationAddress:@"::" networkPrefixLength:&unk_1EF08D138];
  uint64_t v1 = NEIPv6DefaultRoute;
  NEIPv6DefaultRoute = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end