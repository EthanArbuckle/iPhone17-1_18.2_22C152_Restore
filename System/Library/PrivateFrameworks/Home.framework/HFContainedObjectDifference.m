@interface HFContainedObjectDifference
+ (id)containedObjectDifferenceWithKey:(id)a3 comparisonResult:(id)a4;
- (HFComparisonResult)containedObjectResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilder;
- (void)setContainedObjectResult:(id)a3;
@end

@implementation HFContainedObjectDifference

+ (id)containedObjectDifferenceWithKey:(id)a3 comparisonResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 differences];
  int v9 = objc_msgSend(v8, "na_any:", &__block_literal_global_105);

  if (v9)
  {
    v10 = (void *)[objc_alloc((Class)a1) initWithKey:v6 priority:2];
    [v10 setContainedObjectResult:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __81__HFContainedObjectDifference_containedObjectDifferenceWithKey_comparisonResult___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 priority] != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HFContainedObjectDifference;
  id v4 = [(HFDifference *)&v11 copyWithZone:a3];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  v8 = [(HFContainedObjectDifference *)self containedObjectResult];
  int v9 = (void *)[v8 copy];
  [v7 setContainedObjectResult:v9];

  return v7;
}

- (id)descriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)HFContainedObjectDifference;
  v3 = [(HFDifference *)&v7 descriptionBuilder];
  id v4 = [(HFContainedObjectDifference *)self containedObjectResult];
  id v5 = (id)[v3 appendObject:v4 withName:@"result"];

  return v3;
}

- (HFComparisonResult)containedObjectResult
{
  return self->_containedObjectResult;
}

- (void)setContainedObjectResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end