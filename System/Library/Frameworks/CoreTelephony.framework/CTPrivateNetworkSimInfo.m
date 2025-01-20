@interface CTPrivateNetworkSimInfo
+ (BOOL)supportsSecureCoding;
- (CTPrivateNetworkSimInfo)init;
- (CTPrivateNetworkSimInfo)initWithCoder:(id)a3;
- (NSString)csgNetworkIdentifier;
- (NSString)networkIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCsgNetworkIdentifier:(id)a3;
- (void)setNetworkIdentifier:(id)a3;
@end

@implementation CTPrivateNetworkSimInfo

- (CTPrivateNetworkSimInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTPrivateNetworkSimInfo;
  return [(CTPrivateNetworkSimInfo *)&v3 init];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTPrivateNetworkSimInfo *)self csgNetworkIdentifier];
  [v3 appendFormat:@", csgNetworkIdentifier=%@", v4];

  v5 = [(CTPrivateNetworkSimInfo *)self networkIdentifier];
  [v3 appendFormat:@", networkIdentifier=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTPrivateNetworkSimInfo *)self csgNetworkIdentifier];
  [v4 setCsgNetworkIdentifier:v5];

  v6 = [(CTPrivateNetworkSimInfo *)self networkIdentifier];
  [v4 setNetworkIdentifier:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTPrivateNetworkSimInfo *)self csgNetworkIdentifier];
  [v4 encodeObject:v5 forKey:@"csgNetworkIdentifier"];

  id v6 = [(CTPrivateNetworkSimInfo *)self networkIdentifier];
  [v4 encodeObject:v6 forKey:@"networkIdentifier"];
}

- (CTPrivateNetworkSimInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPrivateNetworkSimInfo;
  v5 = [(CTPrivateNetworkSimInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"csgNetworkIdentifier"];
    csgNetworkIdentifier = v5->_csgNetworkIdentifier;
    v5->_csgNetworkIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkIdentifier"];
    networkIdentifier = v5->_networkIdentifier;
    v5->_networkIdentifier = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)csgNetworkIdentifier
{
  return self->_csgNetworkIdentifier;
}

- (void)setCsgNetworkIdentifier:(id)a3
{
}

- (NSString)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkIdentifier, 0);

  objc_storeStrong((id *)&self->_csgNetworkIdentifier, 0);
}

@end