@interface CLSAreaOfInterestQueryPerformer
+ (double)defaultPrecision;
+ (id)categories;
- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4;
- (CLSAreaOfInterestQueryPerformer)initWithAOICache:(id)a3 locationCache:(id)a4;
@end

@implementation CLSAreaOfInterestQueryPerformer

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLSAreaOfInterestQueryPerformer;
  if ([(CLSBusinessItemGenericQueryPerformer *)&v18 shouldQueryItemsForRegion:v6 selectedRegions:a4])
  {
    [(CLSLocationCache *)self->super._locationCache placemarksForLocation:v6];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "areasOfInterest", (void)v14);
          uint64_t v12 = [v11 count];

          if (v12)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (CLSAreaOfInterestQueryPerformer)initWithAOICache:(id)a3 locationCache:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CLSAreaOfInterestQueryPerformer;
  return [(CLSBusinessItemGenericQueryPerformer *)&v5 initWithBusinessCategoryCache:a3 locationCache:a4];
}

+ (id)categories
{
  return +[CLSNewLocationInformant areaOfInterestCategories];
}

+ (double)defaultPrecision
{
  return 6000.0;
}

@end