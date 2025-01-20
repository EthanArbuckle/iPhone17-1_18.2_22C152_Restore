@interface ASCLockupFeatureAppDistribution
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureAppDistribution)initWithCoder:(id)a3;
- (ASCLockupFeatureAppDistribution)initWithDistributorBundleId:(id)a3 appVersionId:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)appVersionId;
- (NSString)description;
- (NSString)distributorBundleId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureAppDistribution

- (ASCLockupFeatureAppDistribution)initWithDistributorBundleId:(id)a3 appVersionId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupFeatureAppDistribution;
  v8 = [(ASCLockupFeatureAppDistribution *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    distributorBundleId = v8->_distributorBundleId;
    v8->_distributorBundleId = v9;

    v11 = (NSString *)[v7 copy];
    appVersionId = v8->_appVersionId;
    v8->_appVersionId = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureAppDistribution)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distributorBundleId"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appVersionId"];

  id v7 = [(ASCLockupFeatureAppDistribution *)self initWithDistributorBundleId:v5 appVersionId:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupFeatureAppDistribution *)self distributorBundleId];
  [v4 encodeObject:v5 forKey:@"distributorBundleId"];

  id v6 = [(ASCLockupFeatureAppDistribution *)self appVersionId];
  [v4 encodeObject:v6 forKey:@"appVersionId"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureAppDistribution *)self distributorBundleId];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockupFeatureAppDistribution *)self appVersionId];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureAppDistribution *)a3;
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
    v9 = [(ASCLockupFeatureAppDistribution *)self distributorBundleId];
    uint64_t v10 = [(ASCLockupFeatureAppDistribution *)v8 distributorBundleId];
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
      v12 = [(ASCLockupFeatureAppDistribution *)self appVersionId];
      uint64_t v13 = [(ASCLockupFeatureAppDistribution *)v8 appVersionId];
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
  id v4 = [(ASCLockupFeatureAppDistribution *)self distributorBundleId];
  [(ASCDescriber *)v3 addObject:v4 withName:@"distributorBundleId"];

  v5 = [(ASCLockupFeatureAppDistribution *)self appVersionId];
  [(ASCDescriber *)v3 addObject:v5 withName:@"appVersionId"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v6;
}

- (NSString)distributorBundleId
{
  return self->_distributorBundleId;
}

- (NSString)appVersionId
{
  return self->_appVersionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersionId, 0);

  objc_storeStrong((id *)&self->_distributorBundleId, 0);
}

@end