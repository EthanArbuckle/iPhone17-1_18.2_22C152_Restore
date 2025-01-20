@interface PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithAllowLocation:(BOOL)a3;
+ (void)_filterImageProperties:(id)a3 metadataWithKey:(id)a4 preserveProperties:(id)a5;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy

- (id)processMetadata:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy;
  v4 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)&v12 processMetadata:a3];
  if ([(PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy *)self metadataNeedsProcessing:v4])
  {
    v5 = (void *)[v4 mutableCopy];
    [v5 removeObjectForKey:*MEMORY[0x1E4F2FB80]];
    v6 = objc_opt_class();
    uint64_t v7 = *MEMORY[0x1E4F2FD40];
    uint64_t v8 = *MEMORY[0x1E4F2FD68];
    v13[0] = *MEMORY[0x1E4F2FD60];
    v13[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F2FD38];
    v13[2] = *MEMORY[0x1E4F2FD30];
    v13[3] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    [v6 _filterImageProperties:v5 metadataWithKey:v7 preserveProperties:v10];

    v4 = v5;
  }
  return v4;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F2FB80]];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
    int v5 = [v3 isEqual:v4] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (void)_filterImageProperties:(id)a3 metadataWithKey:(id)a4 preserveProperties:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 objectForKey:v8];
  if (v10)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v19 = v9;
      v20 = v7;
      v14 = 0;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v18 = objc_msgSend(v10, "objectForKey:", v17, v19);
          if (v18)
          {
            if (!v14)
            {
              v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
            }
            [v14 setObject:v18 forKey:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);

      id v9 = v19;
      id v7 = v20;
      if (v14)
      {
        [v20 setObject:v14 forKey:v8];

        goto LABEL_17;
      }
    }
    else
    {
    }
    [v7 removeObjectForKey:v8];
  }
LABEL_17:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithAllowLocation:(BOOL)a3
{
  BOOL v3 = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  int v5 = v4;
  if (v3)
  {
    id v6 = v4;
  }
  else
  {
    v10[0] = v4;
    id v7 = +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:0];
    v10[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

    id v6 = +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:v8];
  }
  return v6;
}

@end