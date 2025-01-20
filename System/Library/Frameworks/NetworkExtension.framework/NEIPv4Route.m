@interface NEIPv4Route
+ (BOOL)supportsSecureCoding;
+ (NEIPv4Route)defaultRoute;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isDefaultRoute;
- (NEIPv4Route)initWithCoder:(id)a3;
- (NEIPv4Route)initWithDestinationAddress:(NSString *)address subnetMask:(NSString *)subnetMask;
- (NSString)destinationAddress;
- (NSString)destinationSubnetMask;
- (NSString)gatewayAddress;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGatewayAddress:(NSString *)gatewayAddress;
@end

@implementation NEIPv4Route

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayAddress, 0);
  objc_storeStrong((id *)&self->_destinationSubnetMask, 0);

  objc_storeStrong((id *)&self->_destinationAddress, 0);
}

- (void)setGatewayAddress:(NSString *)gatewayAddress
{
}

- (NSString)gatewayAddress
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)destinationSubnetMask
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)destinationAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEIPv4Route *)self destinationAddress];
  unint64_t v9 = a4 | 1;
  [v7 appendPrettyObject:v8 withName:@"destinationAddress" andIndent:v5 options:a4 | 1];

  v10 = [(NEIPv4Route *)self destinationSubnetMask];
  [v7 appendPrettyObject:v10 withName:@"destinationSubnetMask" andIndent:v5 options:a4];

  v11 = [(NEIPv4Route *)self gatewayAddress];
  [v7 appendPrettyObject:v11 withName:@"gatewayAddress" andIndent:v5 options:v9];

  return v7;
}

- (id)initFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  uint64_t v5 = [(NEIPv4Route *)self init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = CFDICTIONARY_TYPE;
      if (CFGetTypeID(v4) == v6)
      {
        uint64_t v7 = NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41C88], CFSTRING_TYPE);
        destinationAddress = v5->_destinationAddress;
        v5->_destinationAddress = (NSString *)v7;

        uint64_t v9 = NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41CA0], CFSTRING_TYPE);
        destinationSubnetMask = v5->_destinationSubnetMask;
        v5->_destinationSubnetMask = (NSString *)v9;

        uint64_t v11 = NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41C90], CFSTRING_TYPE);
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
  CFDictionaryRef v4 = [(NEIPv4Route *)self destinationAddress];

  if (v4)
  {
    uint64_t v5 = [(NEIPv4Route *)self destinationAddress];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F41C88]];
  }
  uint64_t v6 = [(NEIPv4Route *)self destinationSubnetMask];

  if (v6)
  {
    uint64_t v7 = [(NEIPv4Route *)self destinationSubnetMask];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41CA0]];
  }
  v8 = [(NEIPv4Route *)self gatewayAddress];

  if (v8)
  {
    uint64_t v9 = [(NEIPv4Route *)self gatewayAddress];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F41C90]];
  }
  return v3;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  int v14 = 0;
  uint64_t v5 = [(NEIPv4Route *)self destinationAddress];

  if (!v5)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing IPv4Route Destination address", v4);
    goto LABEL_9;
  }
  id v6 = [(NEIPv4Route *)self destinationAddress];
  int v7 = inet_pton(2, (const char *)[v6 UTF8String], &v14);

  if (!v7)
  {
    v8 = @"Invalid IPv4Route Destination address";
    goto LABEL_7;
  }
  if (v14 == 127)
  {
    v8 = @"IPv4Route Destination address is loopback";
LABEL_7:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v8, v4);
    LOBYTE(v5) = 0;
    goto LABEL_9;
  }
  LOBYTE(v5) = 1;
LABEL_9:
  uint64_t v9 = [(NEIPv4Route *)self destinationSubnetMask];

  if (!v9) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing IPv4Route Destination subnetmask", v4);
  }
  v10 = [(NEIPv4Route *)self gatewayAddress];

  if (v10)
  {
    id v11 = [(NEIPv4Route *)self gatewayAddress];
    int v12 = inet_pton(2, (const char *)[v11 UTF8String], &v14);

    if (!v12)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid IPv4Route Gateway address", v4);
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEIPv4Route allocWithZone:a3];
  uint64_t v5 = [(NEIPv4Route *)self destinationAddress];
  id v6 = [(NEIPv4Route *)self destinationSubnetMask];
  int v7 = [(NEIPv4Route *)v4 initWithDestinationAddress:v5 subnetMask:v6];

  v8 = [(NEIPv4Route *)self gatewayAddress];
  [(NEIPv4Route *)v7 setGatewayAddress:v8];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEIPv4Route *)self destinationAddress];
  [v4 encodeObject:v5 forKey:@"DestinationAddress"];

  id v6 = [(NEIPv4Route *)self destinationSubnetMask];
  [v4 encodeObject:v6 forKey:@"DestinationSubnetMask"];

  id v7 = [(NEIPv4Route *)self gatewayAddress];
  [v4 encodeObject:v7 forKey:@"RouteGatewayAddress"];
}

- (NEIPv4Route)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEIPv4Route;
  uint64_t v5 = [(NEIPv4Route *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationAddress"];
    destinationAddress = v5->_destinationAddress;
    v5->_destinationAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationSubnetMask"];
    destinationSubnetMask = v5->_destinationSubnetMask;
    v5->_destinationSubnetMask = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteGatewayAddress"];
    gatewayAddress = v5->_gatewayAddress;
    v5->_gatewayAddress = (NSString *)v10;
  }
  return v5;
}

- (BOOL)isDefaultRoute
{
  id v3 = +[NEIPv4Route defaultRoute];
  id v4 = [(NEIPv4Route *)self destinationAddress];
  uint64_t v5 = [v3 destinationAddress];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [(NEIPv4Route *)self destinationSubnetMask];
    id v7 = [v3 destinationSubnetMask];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NEIPv4Route)initWithDestinationAddress:(NSString *)address subnetMask:(NSString *)subnetMask
{
  id v7 = address;
  char v8 = subnetMask;
  v12.receiver = self;
  v12.super_class = (Class)NEIPv4Route;
  uint64_t v9 = [(NEIPv4Route *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationAddress, address);
    objc_storeStrong((id *)&v10->_destinationSubnetMask, subnetMask);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEIPv4Route)defaultRoute
{
  self;
  if (initGlobals_onceToken != -1) {
    dispatch_once(&initGlobals_onceToken, &__block_literal_global_15617);
  }
  v2 = (void *)NEIPv4DefaultRoute;

  return (NEIPv4Route *)v2;
}

uint64_t __26__NEIPv4Route_initGlobals__block_invoke()
{
  v0 = [[NEIPv4Route alloc] initWithDestinationAddress:@"0.0.0.0" subnetMask:@"0.0.0.0"];
  uint64_t v1 = NEIPv4DefaultRoute;
  NEIPv4DefaultRoute = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end