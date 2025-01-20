@interface ASCLockupFeatureMiniProductPage
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureMiniProductPage)initWithCoder:(id)a3;
- (ASCLockupFeatureMiniProductPage)initWithMetadata:(id)a3 description:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)productPageDescription;
- (NSString)productPageMetadata;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureMiniProductPage

- (ASCLockupFeatureMiniProductPage)initWithMetadata:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupFeatureMiniProductPage;
  v8 = [(ASCLockupFeatureMiniProductPage *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    productPageMetadata = v8->_productPageMetadata;
    v8->_productPageMetadata = v9;

    v11 = (NSString *)[v7 copy];
    productPageDescription = v8->_productPageDescription;
    v8->_productPageDescription = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureMiniProductPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productPageMetadata"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productPageDescription"];

  id v7 = [(ASCLockupFeatureMiniProductPage *)self initWithMetadata:v5 description:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupFeatureMiniProductPage *)self productPageMetadata];
  [v4 encodeObject:v5 forKey:@"productPageMetadata"];

  id v6 = [(ASCLockupFeatureMiniProductPage *)self productPageDescription];
  [v4 encodeObject:v6 forKey:@"productPageDescription"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureMiniProductPage *)self productPageMetadata];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockupFeatureMiniProductPage *)self productPageDescription];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureMiniProductPage *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v6 = v5;
      }
      else {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
    v8 = v6;

    if (!v8)
    {
      unsigned __int8 v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v9 = [(ASCLockupFeatureMiniProductPage *)self productPageMetadata];
    uint64_t v10 = [(ASCLockupFeatureMiniProductPage *)v8 productPageMetadata];
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10]) {
        goto LABEL_12;
      }
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      v12 = [(ASCLockupFeatureMiniProductPage *)self productPageDescription];
      uint64_t v13 = [(ASCLockupFeatureMiniProductPage *)v8 productPageDescription];
      objc_super v14 = (void *)v13;
      if (v12 && v13) {
        unsigned __int8 v7 = [v12 isEqual:v13];
      }
      else {
        unsigned __int8 v7 = v12 == (void *)v13;
      }

      goto LABEL_20;
    }
    unsigned __int8 v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  unsigned __int8 v7 = 1;
LABEL_22:

  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureMiniProductPage *)self productPageMetadata];
  [(ASCDescriber *)v3 addObject:v4 withName:@"productPageMetadata"];

  v5 = [(ASCLockupFeatureMiniProductPage *)self productPageDescription];
  [(ASCDescriber *)v3 addObject:v5 withName:@"productPageDescription"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v6;
}

- (NSString)productPageMetadata
{
  return self->_productPageMetadata;
}

- (NSString)productPageDescription
{
  return self->_productPageDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productPageDescription, 0);

  objc_storeStrong((id *)&self->_productPageMetadata, 0);
}

@end