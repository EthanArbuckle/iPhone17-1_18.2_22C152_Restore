@interface GEOLinkedService
- (GEOFeatureStyleAttributes)styleAttributes;
- (GEOLinkedService)initWithGEOPDLinkedService:(id)a3 timeZone:(id)a4;
- (NSArray)businessHours;
- (NSString)localizedCategoryName;
- (NSTimeZone)timeZone;
- (void)setBusinessHours:(id)a3;
- (void)setLocalizedCategoryName:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation GEOLinkedService

- (GEOLinkedService)initWithGEOPDLinkedService:(id)a3 timeZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOLinkedService;
  v9 = [(GEOLinkedService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_linkedService, a3);
    objc_storeStrong((id *)&v10->_timeZone, a4);
  }

  return v10;
}

- (NSArray)businessHours
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_checkedForBusinessHoursAlready)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v3 = -[GEOPDLinkedService hours]((id *)&self->_linkedService->super.super.isa);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v10 = [GEOBusinessHours alloc];
          v11 = -[GEOBusinessHours initWithGEOPDBusinessHours:timeZone:](v10, "initWithGEOPDBusinessHours:timeZone:", v9, self->_timeZone, (void)v17);
          if ([(GEOBusinessHours *)v11 hoursType])
          {
            if (!v6) {
              v6 = objc_opt_new();
            }
            [v6 addObject:v11];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    objc_super v12 = (void *)[v6 copy];
    v13 = [MEMORY[0x1E4F1C9C8] date];
    v14 = +[GEOBusinessHours prioritizeBusinessHours:v12 compareDate:v13];

    if ([v14 count]) {
      objc_storeStrong((id *)&self->_cachedBusinessHours, v14);
    }
    self->_checkedForBusinessHoursAlready = 1;
  }
  cachedBusinessHours = self->_cachedBusinessHours;

  return cachedBusinessHours;
}

- (NSString)localizedCategoryName
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v19 = -[GEOPDLinkedService entity]((id *)&self->_linkedService->super.super.isa);
  [v19 localizedCategorys];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v26;
    int v6 = -1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v9 = [v8 level];
        if (v6 < v9)
        {
          int v10 = v9;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          v11 = [v8 localizedNames];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v22;
LABEL_9:
            uint64_t v15 = 0;
            v16 = v4;
            while (1)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v4 = [*(id *)(*((void *)&v21 + 1) + 8 * v15) stringValue];

              if ([v4 length]) {
                break;
              }
              ++v15;
              v16 = v4;
              if (v13 == v15)
              {
                uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
                if (v13) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }

          int v6 = v10;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v17 = v4;

  return (NSString *)v17;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  uint64_t v3 = [GEOFeatureStyleAttributes alloc];
  uint64_t v4 = -[GEOPDLinkedService entity]((id *)&self->_linkedService->super.super.isa);
  uint64_t v5 = [v4 styleAttributes];
  int v6 = [(GEOFeatureStyleAttributes *)v3 initWithPlaceDataStyleAttributes:v5];

  return v6;
}

- (void)setBusinessHours:(id)a3
{
}

- (void)setLocalizedCategoryName:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void)setStyleAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_cachedBusinessHours, 0);

  objc_storeStrong((id *)&self->_linkedService, 0);
}

@end