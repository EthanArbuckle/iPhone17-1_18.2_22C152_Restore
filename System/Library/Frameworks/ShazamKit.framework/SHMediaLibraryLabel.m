@interface SHMediaLibraryLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualLabel:(id)a3;
- (NSString)name;
- (SHMediaLibraryLabel)initWithCoder:(id)a3;
- (SHMediaLibraryLabel)initWithName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMediaLibraryLabel

- (SHMediaLibraryLabel)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibraryLabel;
  v6 = [(SHMediaLibraryLabel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (int64_t)type
{
  v2 = [(SHMediaLibraryLabel *)self name];
  int v3 = [v2 hasPrefix:@"platform"];

  return v3 ^ 1u;
}

- (SHMediaLibraryLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryLabelName"];

  v6 = [(SHMediaLibraryLabel *)self initWithName:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[SHMediaLibraryLabel allocWithZone:](SHMediaLibraryLabel, "allocWithZone:");
  v6 = [(SHMediaLibraryLabel *)self name];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(SHMediaLibraryLabel *)v5 initWithName:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHMediaLibraryLabel *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SHMediaLibraryLabel *)self isEqualLabel:v4];
  }

  return v5;
}

- (BOOL)isEqualLabel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHMediaLibraryLabel *)self name];
  v6 = [v5 lowercaseString];
  v7 = [v4 name];

  v8 = [v7 lowercaseString];
  char v9 = [v6 isEqualToString:v8];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(SHMediaLibraryLabel *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end