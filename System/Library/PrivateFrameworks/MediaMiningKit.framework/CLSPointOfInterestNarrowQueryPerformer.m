@interface CLSPointOfInterestNarrowQueryPerformer
+ (double)defaultPrecision;
+ (id)categories;
- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4;
- (CLSPointOfInterestNarrowQueryPerformer)initWithPOICache:(id)a3 locationCache:(id)a4;
@end

@implementation CLSPointOfInterestNarrowQueryPerformer

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 radius];
  if (v8 <= 20.0)
  {
    v11.receiver = self;
    v11.super_class = (Class)CLSPointOfInterestNarrowQueryPerformer;
    BOOL v9 = [(CLSBusinessItemGenericQueryPerformer *)&v11 shouldQueryItemsForRegion:v6 selectedRegions:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (CLSPointOfInterestNarrowQueryPerformer)initWithPOICache:(id)a3 locationCache:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CLSPointOfInterestNarrowQueryPerformer;
  return [(CLSBusinessItemGenericQueryPerformer *)&v5 initWithBusinessCategoryCache:a3 locationCache:a4];
}

+ (id)categories
{
  if (_os_feature_enabled_impl()) {
    +[CLSNewLocationInformant narrowPointOfInterestCategories];
  }
  else {
  v2 = +[CLSNewLocationInformant allPointOfInterestCategories];
  }
  return v2;
}

+ (double)defaultPrecision
{
  return 100.0;
}

@end