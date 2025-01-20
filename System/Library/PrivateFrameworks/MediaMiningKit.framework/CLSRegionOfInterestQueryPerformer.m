@interface CLSRegionOfInterestQueryPerformer
+ (double)defaultPrecision;
+ (id)categories;
- (CLSRegionOfInterestQueryPerformer)initWithROICache:(id)a3 locationCache:(id)a4;
@end

@implementation CLSRegionOfInterestQueryPerformer

- (CLSRegionOfInterestQueryPerformer)initWithROICache:(id)a3 locationCache:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CLSRegionOfInterestQueryPerformer;
  return [(CLSBusinessItemGenericQueryPerformer *)&v5 initWithBusinessCategoryCache:a3 locationCache:a4];
}

+ (id)categories
{
  return +[CLSNewLocationInformant regionOfInterestCategories];
}

+ (double)defaultPrecision
{
  return 1000.0;
}

@end