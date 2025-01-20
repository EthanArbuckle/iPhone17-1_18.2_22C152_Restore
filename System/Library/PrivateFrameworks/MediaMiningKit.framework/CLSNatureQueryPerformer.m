@interface CLSNatureQueryPerformer
+ (double)defaultPrecision;
+ (id)categories;
- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4;
- (CLSNatureQueryPerformer)initWithNatureCache:(id)a3 locationCache:(id)a4;
@end

@implementation CLSNatureQueryPerformer

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSNatureQueryPerformer;
  if ([(CLSBusinessItemGenericQueryPerformer *)&v16 shouldQueryItemsForRegion:v6 selectedRegions:a4])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    [v6 center];
    double v9 = v8;
    double v11 = v10;
    v12 = [v6 identifier];
    v13 = objc_msgSend(v7, "initWithCenter:radius:identifier:", v12, v9, v11, 1000.0);

    BOOL v14 = [(CLSBusinessCategoryCache *)self->super._businessCategoryCache numberOfBusinessItemsForRegion:v13] < 0x96;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (CLSNatureQueryPerformer)initWithNatureCache:(id)a3 locationCache:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CLSNatureQueryPerformer;
  return [(CLSBusinessItemGenericQueryPerformer *)&v5 initWithBusinessCategoryCache:a3 locationCache:a4];
}

+ (id)categories
{
  return +[CLSNewLocationInformant natureCategories];
}

+ (double)defaultPrecision
{
  return 20000.0;
}

@end