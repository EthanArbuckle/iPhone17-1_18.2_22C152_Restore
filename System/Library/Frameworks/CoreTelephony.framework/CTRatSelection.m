@interface CTRatSelection
+ (BOOL)supportsSecureCoding;
- (CTRatSelection)initWithCoder:(id)a3;
- (NSString)preferred;
- (NSString)selection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)mask;
- (void)encodeWithCoder:(id)a3;
- (void)setMask:(unsigned __int8)a3;
- (void)setPreferred:(id)a3;
- (void)setSelection:(id)a3;
@end

@implementation CTRatSelection

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", mask=0x%08x", -[CTRatSelection mask](self, "mask")];
  v4 = [(CTRatSelection *)self selection];
  [v3 appendFormat:@", selection=%@", v4];

  v5 = [(CTRatSelection *)self preferred];
  [v3 appendFormat:@", preferred=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMask:", -[CTRatSelection mask](self, "mask"));
  v5 = [(CTRatSelection *)self selection];
  v6 = (void *)[v5 copy];
  [v4 setSelection:v6];

  v7 = [(CTRatSelection *)self preferred];
  v8 = (void *)[v7 copy];
  [v4 setPreferred:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[CTRatSelection mask](self, "mask"), @"mask");
  v5 = [(CTRatSelection *)self selection];
  [v4 encodeObject:v5 forKey:@"selection"];

  id v6 = [(CTRatSelection *)self preferred];
  [v4 encodeObject:v6 forKey:@"preferred"];
}

- (CTRatSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTRatSelection;
  v5 = [(CTRatSelection *)&v11 init];
  if (v5)
  {
    v5->_mask = [v4 decodeInt32ForKey:@"mask"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selection"];
    selection = v5->_selection;
    v5->_selection = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferred"];
    preferred = v5->_preferred;
    v5->_preferred = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)mask
{
  return self->_mask;
}

- (void)setMask:(unsigned __int8)a3
{
  self->_mask = a3;
}

- (NSString)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
}

- (NSString)preferred
{
  return self->_preferred;
}

- (void)setPreferred:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferred, 0);

  objc_storeStrong((id *)&self->_selection, 0);
}

@end