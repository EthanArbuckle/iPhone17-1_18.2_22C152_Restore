@interface SAHLShowActivity
- (id)_ad_transformedHealthSuccessResponse;
- (id)_ad_transformedShowActivityRequest;
@end

@implementation SAHLShowActivity

- (id)_ad_transformedHealthSuccessResponse
{
  id v2 = objc_alloc_init((Class)SACommandSucceeded);
  return v2;
}

- (id)_ad_transformedShowActivityRequest
{
  v3 = [(SAHLShowActivity *)self activityDataType];
  if ([v3 isEqualToString:SAHLActivityDataTypeExerciseValue])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:SAHLActivityDataTypeMoveValue])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:SAHLActivityDataTypeStandValue])
  {
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = [(SAHLShowActivity *)self activityView];
  id v6 = objc_msgSend(objc_alloc((Class)STShowActivityRequest), "_initWithDataType:view:", v4, objc_msgSend(v5, "isEqualToString:", SAHLActivityViewDetailValue));

  return v6;
}

@end