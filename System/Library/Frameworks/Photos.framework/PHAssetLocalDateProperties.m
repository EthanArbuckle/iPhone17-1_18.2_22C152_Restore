@interface PHAssetLocalDateProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSNumber)inferredTimeZoneOffset;
- (PHAssetLocalDateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int64_t)creationDateSource;
@end

@implementation PHAssetLocalDateProperties

- (void).cxx_destruct
{
}

- (int64_t)creationDateSource
{
  return self->_creationDateSource;
}

- (NSNumber)inferredTimeZoneOffset
{
  return self->_inferredTimeZoneOffset;
}

- (PHAssetLocalDateProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PHAssetLocalDateProperties;
  v10 = [(PHAssetLocalDateProperties *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.inferredTimeZoneOffset";
    }
    else {
      v12 = @"inferredTimeZoneOffset";
    }
    if (v5) {
      v13 = @"additionalAttributes.dateCreatedSource";
    }
    else {
      v13 = @"dateCreatedSource";
    }
    uint64_t v14 = [v8 objectForKeyedSubscript:v12];
    inferredTimeZoneOffset = v11->_inferredTimeZoneOffset;
    v11->_inferredTimeZoneOffset = (NSNumber *)v14;

    v16 = [v8 objectForKeyedSubscript:v13];
    v11->_creationDateSource = [v16 integerValue];
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_43;

  return v2;
}

void __47__PHAssetLocalDateProperties_propertiesToFetch__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"inferredTimeZoneOffset";
  v3[1] = @"dateCreatedSource";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_43;
  propertiesToFetch_pl_once_object_43 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetLocalDate";
}

@end