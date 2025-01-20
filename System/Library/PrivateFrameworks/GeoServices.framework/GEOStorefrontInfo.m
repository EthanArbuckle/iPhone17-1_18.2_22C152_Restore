@interface GEOStorefrontInfo
- (GEOStorefrontInfo)init;
- (GEOStorefrontInfo)initWithStorefront:(id)a3;
- (NSArray)bundleIds;
@end

@implementation GEOStorefrontInfo

- (GEOStorefrontInfo)init
{
  result = (GEOStorefrontInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOStorefrontInfo)initWithStorefront:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  if (v4
    && (v25.receiver = self,
        v25.super_class = (Class)GEOStorefrontInfo,
        (self = [(GEOStorefrontInfo *)&v25 init]) != 0))
  {
    v5 = (void *)MEMORY[0x1E4F1CA48];
    id v6 = v4[1];
    v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v4[1];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          v14 = [GEOStorefrontBundleId alloc];
          uint64_t v15 = -[GEOStorefrontBundleId initWithBundleId:](v14, "initWithBundleId:", v13, (void)v21);
          if (!v15)
          {

            v19 = 0;
            goto LABEL_14;
          }
          v16 = (void *)v15;
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v17 = (NSArray *)[v7 copy];
    bundleIds = self->_bundleIds;
    self->_bundleIds = v17;

    v19 = self;
LABEL_14:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void).cxx_destruct
{
}

@end