@interface ASCLockupFeatureBuyParams
+ (BOOL)supportsSecureCoding;
- (ASCAppOffer)appOffer;
- (ASCLockupFeatureBuyParams)initWithAppOffer:(id)a3;
- (ASCLockupFeatureBuyParams)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureBuyParams

- (ASCLockupFeatureBuyParams)initWithAppOffer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureBuyParams;
  v5 = [(ASCLockupFeatureBuyParams *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    appOffer = v5->_appOffer;
    v5->_appOffer = (ASCAppOffer *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureBuyParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appOffer"];

  uint64_t v6 = [(ASCLockupFeatureBuyParams *)self initWithAppOffer:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFeatureBuyParams *)self appOffer];
  [v4 encodeObject:v5 forKey:@"appOffer"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureBuyParams *)self appOffer];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureBuyParams *)a3;
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
      objc_super v9 = [(ASCLockupFeatureBuyParams *)self appOffer];
      uint64_t v10 = [(ASCLockupFeatureBuyParams *)v8 appOffer];
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
  id v4 = [(ASCLockupFeatureBuyParams *)self appOffer];
  [(ASCDescriber *)v3 addObject:v4 withName:@"appOffer"];

  unint64_t v5 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v5;
}

- (ASCAppOffer)appOffer
{
  return self->_appOffer;
}

- (void).cxx_destruct
{
}

@end