@interface ATXCategoricalFeatureLocationPOICategory
+ (BOOL)ignorePoiCategoryForUsersCurrentLOI:(id)a3;
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXCategoricalFeatureLocationPOICategory

+ (BOOL)ignorePoiCategoryForUsersCurrentLOI:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 type]) {
      BOOL v5 = [v4 type] == 1;
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4 = a3;
  BOOL v5 = [v4 poiCategory];
  v6 = [v4 locationMotionContext];

  v7 = [v6 currentLOI];

  if ([(id)objc_opt_class() ignorePoiCategoryForUsersCurrentLOI:v7])
  {
    v8 = @"POI Category Ignored";
  }
  else if (v5)
  {
    v8 = v5;
  }
  else
  {
    v8 = @"POI Category NA";
  }

  return v8;
}

@end