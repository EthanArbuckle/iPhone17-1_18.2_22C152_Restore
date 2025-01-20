@interface HFCondition
+ (Class)homeKitRepresentationClass;
- (BOOL)isEqual:(id)a3;
- (HFCondition)initWithPredicate:(id)a3;
- (NSPredicate)predicate;
- (NSString)description;
- (id)hf_naturalLanguageSummaryWithOptions:(id)a3;
- (unint64_t)hash;
@end

@implementation HFCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSLog(&cfstr_DoesnTImplemen.isa, v4);

  return 0;
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFCondition)initWithPredicate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCondition;
  v6 = [(HFCondition *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_predicate, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HFCondition *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(HFCondition *)self predicate];
      v6 = [(HFCondition *)v4 predicate];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HFCondition *)self predicate];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFCondition *)self predicate];
  id v5 = (id)[v3 appendObject:v4 withName:@"predicate"];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
}

@end