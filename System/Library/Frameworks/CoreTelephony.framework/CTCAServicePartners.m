@interface CTCAServicePartners
+ (BOOL)supportsSecureCoding;
- (CTCAServicePartners)initWithCoder:(id)a3;
- (NSDictionary)partners;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)footnotesToShowMask;
- (void)encodeWithCoder:(id)a3;
- (void)setFootnotesToShowMask:(unint64_t)a3;
- (void)setPartners:(id)a3;
@end

@implementation CTCAServicePartners

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCAServicePartners *)self partners];
  [v3 appendFormat:@", partners=%@", v4];

  [v3 appendFormat:@", footnotesToShowMask=%lu", -[CTCAServicePartners footnotesToShowMask](self, "footnotesToShowMask")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCAServicePartners *)self partners];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setPartners:v7];

  objc_msgSend(v5, "setFootnotesToShowMask:", -[CTCAServicePartners footnotesToShowMask](self, "footnotesToShowMask"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTCAServicePartners *)self partners];
  [v6 encodeObject:v4 forKey:@"partners"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTCAServicePartners footnotesToShowMask](self, "footnotesToShowMask"));
  [v6 encodeObject:v5 forKey:@"footnotesToShowMask"];
}

- (CTCAServicePartners)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTCAServicePartners;
  v5 = [(CTCAServicePartners *)&v15 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"partners"];
    partners = v5->_partners;
    v5->_partners = (NSDictionary *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footnotesToShowMask"];
    v5->_footnotesToShowMask = [v13 unsignedIntegerValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)partners
{
  return self->_partners;
}

- (void)setPartners:(id)a3
{
}

- (unint64_t)footnotesToShowMask
{
  return self->_footnotesToShowMask;
}

- (void)setFootnotesToShowMask:(unint64_t)a3
{
  self->_footnotesToShowMask = a3;
}

- (void).cxx_destruct
{
}

@end