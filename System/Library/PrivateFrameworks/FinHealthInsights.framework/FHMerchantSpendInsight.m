@interface FHMerchantSpendInsight
+ (BOOL)supportsSecureCoding;
- (FHMerchantSpendInsight)initWithCoder:(id)a3;
- (NSString)merchantName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMerchantName:(id)a3;
@end

@implementation FHMerchantSpendInsight

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FHMerchantSpendInsight;
  id v4 = a3;
  [(FHFeatureInsight *)&v6 encodeWithCoder:v4];
  v5 = [(FHMerchantSpendInsight *)self merchantName];
  [v4 encodeObject:v5 forKey:@"merchantName"];
}

- (FHMerchantSpendInsight)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHMerchantSpendInsight;
  v5 = [(FHFeatureInsight *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantName"];
    merchantName = v5->merchantName;
    v5->merchantName = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v6.receiver = self;
  v6.super_class = (Class)FHMerchantSpendInsight;
  id v4 = [(FHFeatureInsight *)&v6 description];
  [v3 appendString:v4];

  [v3 appendFormat:@"%@: '%@'; ", @"merchantName", self->merchantName];
  [v3 appendFormat:@">"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)merchantName
{
  return self->merchantName;
}

- (void)setMerchantName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end