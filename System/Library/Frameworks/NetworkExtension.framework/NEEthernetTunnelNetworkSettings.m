@interface NEEthernetTunnelNetworkSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEEthernetTunnelNetworkSettings)initWithCoder:(id)a3;
- (NEEthernetTunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address ethernetAddress:(NSString *)ethernetAddress mtu:(NSInteger)mtu;
- (NSString)ethernetAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEthernetAddress:(id)a3;
@end

@implementation NEEthernetTunnelNetworkSettings

- (void).cxx_destruct
{
}

- (void)setEthernetAddress:(id)a3
{
}

- (NSString)ethernetAddress
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)NEEthernetTunnelNetworkSettings;
  v8 = [(NEPacketTunnelNetworkSettings *)&v12 descriptionWithIndent:v5 options:a4];
  v9 = (void *)[v7 initWithString:v8];

  v10 = [(NEEthernetTunnelNetworkSettings *)self ethernetAddress];
  [v9 appendPrettyObject:v10 withName:@"ethernetAddress" andIndent:v5 options:a4];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEEthernetTunnelNetworkSettings;
  BOOL v5 = [(NEPacketTunnelNetworkSettings *)&v13 checkValidityAndCollectErrors:v4];
  v6 = [(NEEthernetTunnelNetworkSettings *)self ethernetAddress];

  if (!v6)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"No MAC address was specified", v4);
    BOOL v5 = 0;
  }
  id v7 = [(NEEthernetTunnelNetworkSettings *)self ethernetAddress];
  v8 = createEthernetAddressFromString(v7);

  if (!v8)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid ethernet address", v4);
    BOOL v5 = 0;
  }
  v9 = [(NEPacketTunnelNetworkSettings *)self MTU];

  if (!v9)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"No MTU was specified", v4);
    BOOL v5 = 0;
  }
  v10 = [(NEPacketTunnelNetworkSettings *)self MTU];
  int v11 = [v10 unsignedIntValue];

  if (!v11)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid MTU, the MTU must be greater than 0", v4);
    BOOL v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NEEthernetTunnelNetworkSettings;
  id v4 = [(NEPacketTunnelNetworkSettings *)&v7 copyWithZone:a3];
  BOOL v5 = [(NEEthernetTunnelNetworkSettings *)self ethernetAddress];
  [v4 setEthernetAddress:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NEEthernetTunnelNetworkSettings;
  id v4 = a3;
  [(NEPacketTunnelNetworkSettings *)&v6 encodeWithCoder:v4];
  BOOL v5 = [(NEEthernetTunnelNetworkSettings *)self ethernetAddress];
  [v4 encodeObject:v5 forKey:@"ethernetAddress"];
}

- (NEEthernetTunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEEthernetTunnelNetworkSettings;
  BOOL v5 = [(NEPacketTunnelNetworkSettings *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ethernetAddress"];
    ethernetAddress = v5->_ethernetAddress;
    v5->_ethernetAddress = (NSString *)v6;
  }
  return v5;
}

- (NEEthernetTunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address ethernetAddress:(NSString *)ethernetAddress mtu:(NSInteger)mtu
{
  objc_super v9 = ethernetAddress;
  v14.receiver = self;
  v14.super_class = (Class)NEEthernetTunnelNetworkSettings;
  v10 = [(NETunnelNetworkSettings *)&v14 initWithTunnelRemoteAddress:address];
  int v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ethernetAddress, ethernetAddress);
    objc_super v12 = [NSNumber numberWithInteger:mtu];
    [(NEPacketTunnelNetworkSettings *)v11 setMTU:v12];
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end