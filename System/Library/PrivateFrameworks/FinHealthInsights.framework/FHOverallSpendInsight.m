@interface FHOverallSpendInsight
+ (BOOL)supportsSecureCoding;
- (FHOverallSpendInsight)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FHOverallSpendInsight

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FHOverallSpendInsight;
  [(FHFeatureInsight *)&v3 encodeWithCoder:a3];
}

- (FHOverallSpendInsight)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FHOverallSpendInsight;
  return [(FHFeatureInsight *)&v4 initWithCoder:a3];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v6.receiver = self;
  v6.super_class = (Class)FHOverallSpendInsight;
  objc_super v4 = [(FHFeatureInsight *)&v6 description];
  [v3 appendString:v4];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end