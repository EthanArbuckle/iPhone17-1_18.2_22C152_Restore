@interface FPTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTag:(id)a3;
- (FPTag)initWithCoder:(id)a3;
- (FPTag)initWithLabel:(id)a3 color:(int)a4;
- (NSString)label;
- (id)description;
- (int)color;
- (int64_t)localizedStandardCompare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTag

- (NSString)label
{
  return self->_label;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"_label"];
  [v5 encodeInt:self->_color forKey:@"_color"];
}

- (void).cxx_destruct
{
}

- (FPTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPTag;
  id v5 = [(FPTag *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_color = [v4 decodeIntForKey:@"_color"];
  }

  return v5;
}

- (FPTag)initWithLabel:(id)a3 color:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPTag;
  v8 = [(FPTag *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_label, a3);
    v9->_color = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(FPTag *)self label];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FPTag *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(FPTag *)self isEqualToTag:v4];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<l:%@, c:%i>", self->_label, self->_color];
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FPTag *)self label];
  uint64_t v6 = [v4 label];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (int64_t)localizedStandardCompare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FPTag *)self label];
  uint64_t v6 = [v4 label];

  int64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (int)color
{
  return self->_color;
}

@end