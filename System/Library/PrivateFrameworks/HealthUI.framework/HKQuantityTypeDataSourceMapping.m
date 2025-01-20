@interface HKQuantityTypeDataSourceMapping
@end

@implementation HKQuantityTypeDataSourceMapping

void __40___HKQuantityTypeDataSourceMapping_map___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"HKQuantityTypeDataSource.m" lineNumber:361 description:@"result must be of type HKQuantityTypeDataSourceValue"];
  }
  v3 = -[HKHealthChartPoint initWithDataSourceValue:options:unit:displayType:]([HKHealthChartPoint alloc], "initWithDataSourceValue:options:unit:displayType:", v8, [*(id *)(a1 + 40) statisticsOptions], *(void *)(a1 + 48), *(void *)(a1 + 56));
  v4 = [*(id *)(a1 + 40) userInfoCreationBlock];

  if (v4)
  {
    v5 = [*(id *)(a1 + 40) userInfoCreationBlock];
    v6 = ((void (**)(void, id))v5)[2](v5, v8);
    [(HKHealthChartPoint *)v3 setUserInfo:v6];
  }
  [*(id *)(a1 + 64) addObject:v3];
}

@end