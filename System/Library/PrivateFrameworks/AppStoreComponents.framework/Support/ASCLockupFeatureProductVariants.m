@interface ASCLockupFeatureProductVariants
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureProductVariants)initWithCoder:(id)a3;
- (ASCLockupFeatureProductVariants)initWithProductVariantID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)productVariantID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureProductVariants

- (ASCLockupFeatureProductVariants)initWithProductVariantID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureProductVariants;
  v5 = [(ASCLockupFeatureProductVariants *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    productVariantID = v5->_productVariantID;
    v5->_productVariantID = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureProductVariants)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVariantID"];

  v6 = [(ASCLockupFeatureProductVariants *)self initWithProductVariantID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFeatureProductVariants *)self productVariantID];
  [v4 encodeObject:v5 forKey:@"productVariantID"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureProductVariants *)self productVariantID];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureProductVariants *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    unint64_t v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      objc_super v9 = [(ASCLockupFeatureProductVariants *)self productVariantID];
      uint64_t v10 = [(ASCLockupFeatureProductVariants *)v8 productVariantID];
      v11 = (void *)v10;
      if (v9 && v10) {
        unsigned __int8 v7 = [v9 isEqual:v10];
      }
      else {
        unsigned __int8 v7 = v9 == (void *)v10;
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureProductVariants *)self productVariantID];
  [(ASCDescriber *)v3 addObject:v4 withName:@"productVariantID"];

  unint64_t v5 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v5;
}

- (NSString)productVariantID
{
  return self->_productVariantID;
}

- (void).cxx_destruct
{
}

@end