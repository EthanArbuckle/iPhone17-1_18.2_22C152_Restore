@interface PMLLogisticRegressionModel(Equivalence)
- (uint64_t)isEqual:()Equivalence;
- (uint64_t)isEqualToPMLLogisticRegressionModel:()Equivalence;
@end

@implementation PMLLogisticRegressionModel(Equivalence)

- (uint64_t)isEqual:()Equivalence
{
  id v4 = a3;
  v5 = v4;
  if (v4 == a1)
  {
    uint64_t v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [a1 isEqualToPMLLogisticRegressionModel:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)isEqualToPMLLogisticRegressionModel:()Equivalence
{
  id v4 = a3;
  v5 = [a1 weights];
  uint64_t v6 = [v5 asMutableDenseVector];
  v7 = [v4 weights];

  v8 = [v7 asMutableDenseVector];
  uint64_t v9 = [v6 isEqual:v8];

  return v9;
}

@end