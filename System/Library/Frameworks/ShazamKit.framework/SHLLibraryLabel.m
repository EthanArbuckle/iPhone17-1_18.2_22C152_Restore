@interface SHLLibraryLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualLabel:(id)a3;
- (NSString)name;
- (SHLLibraryLabel)initWithCoder:(id)a3;
- (SHLLibraryLabel)initWithName:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHLLibraryLabel

- (SHLLibraryLabel)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLLibraryLabel;
  v6 = [(SHLLibraryLabel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (int64_t)type
{
  v2 = [(SHLLibraryLabel *)self name];
  unsigned int v3 = [v2 hasPrefix:@"platform"];

  return v3 ^ 1;
}

- (SHLLibraryLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryLabelName"];

  v6 = [(SHLLibraryLabel *)self initWithName:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHLLibraryLabel *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(SHLLibraryLabel *)self isEqualLabel:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualLabel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHLLibraryLabel *)self name];
  v6 = [v5 lowercaseString];
  v7 = [v4 name];

  v8 = [v7 lowercaseString];
  unsigned __int8 v9 = [v6 isEqualToString:v8];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(SHLLibraryLabel *)self name];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end