@interface SNKShotFeaturizationStreamResult
- (MLMultiArray)data;
- (SNKShotFeaturizationStreamResult)init;
- (SNKShotLabel)label;
- (int64_t)datasetType;
- (void)setData:(id)a3;
- (void)setDatasetType:(int64_t)a3;
- (void)setLabel:(id)a3;
@end

@implementation SNKShotFeaturizationStreamResult

- (SNKShotFeaturizationStreamResult)init
{
  return (SNKShotFeaturizationStreamResult *)SNKShotFeaturizationStreamResult.init()();
}

- (MLMultiArray)data
{
  v2 = (void *)sub_1DC88FC20();

  return (MLMultiArray *)v2;
}

- (void)setData:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC88FCA4((uint64_t)v4);
}

- (int64_t)datasetType
{
  v2 = self;
  int64_t v3 = sub_1DC88FD80();

  return v3;
}

- (void)setDatasetType:(int64_t)a3
{
}

- (SNKShotLabel)label
{
  v2 = self;
  id v3 = sub_1DC88FE50();

  return (SNKShotLabel *)v3;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC88FEFC(v4);
}

- (void).cxx_destruct
{
}

@end