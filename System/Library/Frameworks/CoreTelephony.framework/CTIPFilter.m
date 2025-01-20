@interface CTIPFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)isAnyIpFamilyProtocol;
- (BOOL)isAnyIpProtocol;
- (BOOL)isIpv4;
- (BOOL)isIpv6;
- (BOOL)isTcp;
- (BOOL)isUdp;
- (CTIPFilter)initWithCoder:(id)a3;
- (CTIPFilterEndpoint)dst;
- (CTIPFilterEndpoint)src;
- (NSNumber)flowLabel;
- (NSNumber)tos;
- (NSNumber)tosMask;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)filterId;
- (unint64_t)ipFamilyProtocol;
- (unint64_t)ipProtocol;
- (unint64_t)precedence;
- (void)encodeWithCoder:(id)a3;
- (void)setDst:(id)a3;
- (void)setFilterId:(unint64_t)a3;
- (void)setFlowLabel:(id)a3;
- (void)setIpFamilyProtocol:(unint64_t)a3;
- (void)setIpProtocol:(unint64_t)a3;
- (void)setPrecedence:(unint64_t)a3;
- (void)setSrc:(id)a3;
- (void)setTos:(id)a3;
- (void)setTosMask:(id)a3;
@end

@implementation CTIPFilter

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", id=%lu", -[CTIPFilter filterId](self, "filterId")];
  [v3 appendFormat:@", precedence=%lu", -[CTIPFilter precedence](self, "precedence")];
  [v3 appendFormat:@", ipProtocol=%lu", -[CTIPFilter ipProtocol](self, "ipProtocol")];
  [v3 appendFormat:@", ipFamilyProtocol=%lu", -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol")];
  v4 = [(CTIPFilter *)self tos];

  if (v4)
  {
    v5 = [(CTIPFilter *)self tos];
    [v3 appendFormat:@", tos=%@", v5];
  }
  v6 = [(CTIPFilter *)self tosMask];

  if (v6)
  {
    v7 = [(CTIPFilter *)self tosMask];
    [v3 appendFormat:@", tosMask=%@", v7];
  }
  v8 = [(CTIPFilter *)self src];

  if (v8)
  {
    v9 = [(CTIPFilter *)self src];
    [v3 appendFormat:@", src=%@", v9];
  }
  v10 = [(CTIPFilter *)self dst];

  if (v10)
  {
    v11 = [(CTIPFilter *)self dst];
    [v3 appendFormat:@", dst=%@", v11];
  }
  v12 = [(CTIPFilter *)self flowLabel];

  if (v12)
  {
    v13 = [(CTIPFilter *)self flowLabel];
    [v3 appendFormat:@", flowLabel=%@", v13];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFilterId:", -[CTIPFilter filterId](self, "filterId"));
  objc_msgSend(v4, "setPrecedence:", -[CTIPFilter precedence](self, "precedence"));
  objc_msgSend(v4, "setIpProtocol:", -[CTIPFilter ipProtocol](self, "ipProtocol"));
  objc_msgSend(v4, "setIpFamilyProtocol:", -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol"));
  v5 = [(CTIPFilter *)self tos];
  v6 = (void *)[v5 copy];
  [v4 setTos:v6];

  v7 = [(CTIPFilter *)self tosMask];
  v8 = (void *)[v7 copy];
  [v4 setTosMask:v8];

  v9 = [(CTIPFilter *)self src];
  v10 = (void *)[v9 copy];
  [v4 setSrc:v10];

  v11 = [(CTIPFilter *)self dst];
  v12 = (void *)[v11 copy];
  [v4 setDst:v12];

  v13 = [(CTIPFilter *)self flowLabel];
  v14 = (void *)[v13 copy];
  [v4 setFlowLabel:v14];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter filterId](self, "filterId"), @"id");
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter precedence](self, "precedence"), @"precedence");
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter ipProtocol](self, "ipProtocol"), @"ipProtocol");
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol"), @"ipFamilyProtocol");
  v5 = [(CTIPFilter *)self tos];
  [v4 encodeObject:v5 forKey:@"tos"];

  v6 = [(CTIPFilter *)self tosMask];
  [v4 encodeObject:v6 forKey:@"tosMask"];

  v7 = [(CTIPFilter *)self src];
  [v4 encodeObject:v7 forKey:@"src"];

  v8 = [(CTIPFilter *)self dst];
  [v4 encodeObject:v8 forKey:@"dst"];

  id v9 = [(CTIPFilter *)self flowLabel];
  [v4 encodeObject:v9 forKey:@"flowLabel"];
}

- (CTIPFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTIPFilter;
  v5 = [(CTIPFilter *)&v17 init];
  if (v5)
  {
    v5->_filterId = (int)[v4 decodeIntForKey:@"id"];
    v5->_precedence = (int)[v4 decodeIntForKey:@"precedence"];
    v5->_ipProtocol = (int)[v4 decodeIntForKey:@"ipProtocol"];
    v5->_ipFamilyProtocol = (int)[v4 decodeIntForKey:@"ipFamilyProtocol"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tos"];
    tos = v5->_tos;
    v5->_tos = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tosMask"];
    tosMask = v5->_tosMask;
    v5->_tosMask = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"src"];
    src = v5->_src;
    v5->_src = (CTIPFilterEndpoint *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dst"];
    dst = v5->_dst;
    v5->_dst = (CTIPFilterEndpoint *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowLabel"];
    flowLabel = v5->_flowLabel;
    v5->_flowLabel = (NSNumber *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isTcp
{
  return [(CTIPFilter *)self ipProtocol] == 6 || [(CTIPFilter *)self ipProtocol] == 0;
}

- (BOOL)isUdp
{
  return [(CTIPFilter *)self ipProtocol] == 17 || [(CTIPFilter *)self ipProtocol] == 0;
}

- (BOOL)isAnyIpProtocol
{
  return [(CTIPFilter *)self ipProtocol] == 0;
}

- (BOOL)isIpv4
{
  return [(CTIPFilter *)self ipFamilyProtocol] == 4
      || [(CTIPFilter *)self ipFamilyProtocol] == 0;
}

- (BOOL)isIpv6
{
  return [(CTIPFilter *)self ipFamilyProtocol] == 41
      || [(CTIPFilter *)self ipFamilyProtocol] == 0;
}

- (BOOL)isAnyIpFamilyProtocol
{
  return [(CTIPFilter *)self ipFamilyProtocol] == 0;
}

- (unint64_t)filterId
{
  return self->_filterId;
}

- (void)setFilterId:(unint64_t)a3
{
  self->_filterId = a3;
}

- (unint64_t)precedence
{
  return self->_precedence;
}

- (void)setPrecedence:(unint64_t)a3
{
  self->_precedence = a3;
}

- (unint64_t)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(unint64_t)a3
{
  self->_ipProtocol = a3;
}

- (unint64_t)ipFamilyProtocol
{
  return self->_ipFamilyProtocol;
}

- (void)setIpFamilyProtocol:(unint64_t)a3
{
  self->_ipFamilyProtocol = a3;
}

- (CTIPFilterEndpoint)src
{
  return self->_src;
}

- (void)setSrc:(id)a3
{
}

- (CTIPFilterEndpoint)dst
{
  return self->_dst;
}

- (void)setDst:(id)a3
{
}

- (NSNumber)tos
{
  return self->_tos;
}

- (void)setTos:(id)a3
{
}

- (NSNumber)tosMask
{
  return self->_tosMask;
}

- (void)setTosMask:(id)a3
{
}

- (NSNumber)flowLabel
{
  return self->_flowLabel;
}

- (void)setFlowLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLabel, 0);
  objc_storeStrong((id *)&self->_tosMask, 0);
  objc_storeStrong((id *)&self->_tos, 0);
  objc_storeStrong((id *)&self->_dst, 0);

  objc_storeStrong((id *)&self->_src, 0);
}

@end