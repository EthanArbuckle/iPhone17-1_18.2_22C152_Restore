@interface CTNetworkList
+ (BOOL)supportsSecureCoding;
- (BOOL)moreComing;
- (CTNetworkList)initWithCoder:(id)a3;
- (NSMutableArray)networks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMoreComing:(BOOL)a3;
- (void)setNetworks:(id)a3;
@end

@implementation CTNetworkList

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTNetworkList *)self networks];
  [v3 appendFormat:@", networks=%@", v4];

  [v3 appendFormat:@", moreComing=%d", -[CTNetworkList moreComing](self, "moreComing")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTNetworkList *)self networks];
  v6 = (void *)[v5 copy];
  [v4 setNetworks:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTNetworkList *)self networks];
  [v4 encodeObject:v5 forKey:@"networks"];
}

- (CTNetworkList)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTNetworkList;
  id v5 = [(CTNetworkList *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"networks"];
    networks = v5->_networks;
    v5->_networks = (NSMutableArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSMutableArray)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (void).cxx_destruct
{
}

@end