@interface ASCLockupFeatureShortName
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureShortName)initWithCoder:(id)a3;
- (ASCLockupFeatureShortName)initWithShortName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)shortName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureShortName

- (ASCLockupFeatureShortName)initWithShortName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureShortName;
  v5 = [(ASCLockupFeatureShortName *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    shortName = v5->_shortName;
    v5->_shortName = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureShortName)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortName"];

  uint64_t v6 = [(ASCLockupFeatureShortName *)self initWithShortName:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFeatureShortName *)self shortName];
  [v4 encodeObject:v5 forKey:@"shortName"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureShortName *)self shortName];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureShortName *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    unint64_t v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      objc_super v9 = [(ASCLockupFeatureShortName *)self shortName];
      uint64_t v10 = [(ASCLockupFeatureShortName *)v8 shortName];
      v11 = (void *)v10;
      if (v9 && v10) {
        char v7 = [v9 isEqual:v10];
      }
      else {
        char v7 = v9 == (void *)v10;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureShortName *)self shortName];
  [(ASCDescriber *)v3 addObject:v4 withName:@"shortName"];

  unint64_t v5 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v5;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void).cxx_destruct
{
}

@end