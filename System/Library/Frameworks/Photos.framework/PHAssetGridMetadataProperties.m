@interface PHAssetGridMetadataProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSString)originalFilename;
- (NSString)title;
- (PHAssetGridMetadataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetGridMetadataProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (NSString)title
{
  return self->_title;
}

- (PHAssetGridMetadataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PHAssetGridMetadataProperties;
  v10 = [(PHAssetGridMetadataProperties *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.title";
    }
    else {
      v12 = @"title";
    }
    if (v5) {
      v13 = @"additionalAttributes.originalFilename";
    }
    else {
      v13 = @"originalFilename";
    }
    uint64_t v14 = [v8 objectForKeyedSubscript:v12];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v8 objectForKeyedSubscript:v13];
    originalFilename = v11->_originalFilename;
    v11->_originalFilename = (NSString *)v16;
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_41;

  return v2;
}

void __50__PHAssetGridMetadataProperties_propertiesToFetch__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"title";
  v3[1] = @"originalFilename";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_41;
  propertiesToFetch_pl_once_object_41 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetGridMetadata";
}

@end