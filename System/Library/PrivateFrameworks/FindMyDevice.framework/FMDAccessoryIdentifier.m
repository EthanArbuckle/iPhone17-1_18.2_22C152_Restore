@interface FMDAccessoryIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (FMDAccessoryIdentifier)initWithAddress:(id)a3;
- (FMDAccessoryIdentifier)initWithCoder:(id)a3;
- (FMDAccessoryIdentifier)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4;
- (FMDAccessoryIdentifier)initWithFMDCoder:(id)a3 error:(id *)a4;
- (FMDAccessoryIdentifier)initWithString:(id)a3;
- (NSString)string;
- (id)computeAccessoryIdentifierWithAddress:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setString:(id)a3;
@end

@implementation FMDAccessoryIdentifier

- (BOOL)isEqual:(id)a3
{
  v4 = (FMDAccessoryIdentifier *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(FMDAccessoryIdentifier *)v4 string];
      v6 = [(FMDAccessoryIdentifier *)self string];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isValid
{
  v3 = [(FMDAccessoryIdentifier *)self string];
  if (v3)
  {
    v4 = [(FMDAccessoryIdentifier *)self string];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(FMDAccessoryIdentifier *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDAccessoryIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAccessoryIdentifier;
  BOOL v5 = [(FMDAccessoryIdentifier *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    char v7 = NSStringFromSelector(sel_string);
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDAccessoryIdentifier *)v5 setString:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(FMDAccessoryIdentifier *)self string];
  BOOL v5 = NSStringFromSelector(sel_string);
  [v4 encodeObject:v6 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[FMDAccessoryIdentifier allocWithZone:a3] init];
  BOOL v5 = [(FMDAccessoryIdentifier *)self string];
  [(FMDAccessoryIdentifier *)v4 setString:v5];

  return v4;
}

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(FMDAccessoryIdentifier *)self string];
  char v7 = NSStringFromSelector(sel_string);
  [v5 encodeString:v6 forKey:v7];

  return 1;
}

- (FMDAccessoryIdentifier)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAccessoryIdentifier;
  id v6 = [(FMDAccessoryIdentifier *)&v10 init];
  if (v6)
  {
    char v7 = NSStringFromSelector(sel_string);
    v8 = [v5 decodeStringForKey:v7];
    [(FMDAccessoryIdentifier *)v6 setString:v8];
  }
  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

- (FMDAccessoryIdentifier)initWithString:(id)a3
{
  id v4 = (__CFString *)a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDAccessoryIdentifier;
  id v5 = [(FMDAccessoryIdentifier *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    if (v4) {
      char v7 = v4;
    }
    else {
      char v7 = &stru_1F26FAA80;
    }
    [(FMDAccessoryIdentifier *)v5 setString:v7];
  }

  return v6;
}

- (FMDAccessoryIdentifier)initWithAddress:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDAccessoryIdentifier;
  id v5 = [(FMDAccessoryIdentifier *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    char v7 = [(FMDAccessoryIdentifier *)v5 computeAccessoryIdentifierWithAddress:v4];
    [(FMDAccessoryIdentifier *)v6 setString:v7];
  }
  return v6;
}

- (id)computeAccessoryIdentifierWithAddress:(id)a3
{
  unint64_t v3 = [NSString stringWithFormat:@"BT_%@", a3];
  id v4 = [v3 dataUsingEncoding:4];
  id v5 = objc_msgSend(v4, "fm_sha256Hash");
  id v6 = objc_msgSend(v5, "fm_hexString");
  char v7 = [v6 lowercaseString];

  return v7;
}

- (FMDAccessoryIdentifier)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDAccessoryIdentifier;
  v8 = [(FMDAccessoryIdentifier *)&v11 init];
  if (v8)
  {
    objc_super v9 = [NSString stringWithFormat:@"%@_%@", v6, v7];
    [(FMDAccessoryIdentifier *)v8 setString:v9];
  }
  return v8;
}

@end