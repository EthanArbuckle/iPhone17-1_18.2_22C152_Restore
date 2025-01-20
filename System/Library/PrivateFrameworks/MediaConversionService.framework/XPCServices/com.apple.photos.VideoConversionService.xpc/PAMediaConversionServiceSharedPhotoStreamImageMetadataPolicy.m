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
  v9.receiver = self;
  v9.super_class = (Class)PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy;
  v4 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)&v9 processMetadata:a3];
  if ([(PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy *)self metadataNeedsProcessing:v4])
  {
    id v5 = [v4 mutableCopy];
    [v5 removeObjectForKey:kCGImagePropertyIPTCDictionary];
    v6 = objc_opt_class();
    v10[0] = kCGImagePropertyTIFFMake;
    v10[1] = kCGImagePropertyTIFFModel;
    v10[2] = kCGImagePropertyTIFFCopyright;
    v10[3] = kCGImagePropertyTIFFDateTime;
    v7 = +[NSArray arrayWithObjects:v10 count:4];
    [v6 _filterImageProperties:v5 metadataWithKey:kCGImagePropertyTIFFDictionary preserveProperties:v7];

    v4 = v5;
  }
  return v4;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
  if (v3)
  {
    v4 = +[NSNull null];
    unsigned int v5 = [v3 isEqual:v4] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (void)_filterImageProperties:(id)a3 metadataWithKey:(id)a4 preserveProperties:(id)a5
{
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
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      id v19 = v9;
      v20 = v7;
      v14 = 0;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
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
              v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v11 count]);
            }
            [v14 setObject:v18 forKey:v17];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
  v4 = objc_opt_new();
  unsigned int v5 = v4;
  if (v3)
  {
    id v6 = v4;
  }
  else
  {
    v10[0] = v4;
    id v7 = +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:0];
    v10[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v10 count:2];

    id v6 = +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:v8];
  }
  return v6;
}

@end