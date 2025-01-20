@interface PHAssetDescriptionProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSString)accessibilityDescription;
- (NSString)assetDescription;
- (NSString)title;
- (PHAssetDescriptionProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetDescriptionProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_assetDescription, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (NSString)assetDescription
{
  return self->_assetDescription;
}

- (NSString)title
{
  return self->_title;
}

- (PHAssetDescriptionProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PHAssetDescriptionProperties;
  v10 = [(PHAssetDescriptionProperties *)&v26 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    BOOL v12 = !v5;
    if (v5) {
      v13 = @"additionalAttributes.title";
    }
    else {
      v13 = @"title";
    }
    if (v5) {
      v14 = @"additionalAttributes.assetDescription.longDescription";
    }
    else {
      v14 = @"assetDescription.longDescription";
    }
    if (v12) {
      v15 = @"accessibilityDescription";
    }
    else {
      v15 = @"additionalAttributes.accessibilityDescription";
    }
    v16 = [v8 objectForKeyedSubscript:v13];
    uint64_t v17 = [v16 copy];
    title = v11->_title;
    v11->_title = (NSString *)v17;

    v19 = [v8 objectForKeyedSubscript:v14];
    uint64_t v20 = [v19 copy];
    assetDescription = v11->_assetDescription;
    v11->_assetDescription = (NSString *)v20;

    v22 = [v8 objectForKeyedSubscript:v15];
    uint64_t v23 = [v22 copy];
    accessibilityDescription = v11->_accessibilityDescription;
    v11->_accessibilityDescription = (NSString *)v23;
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_48;

  return v2;
}

void __49__PHAssetDescriptionProperties_propertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"title";
  v3[1] = @"assetDescription.longDescription";
  v3[2] = @"accessibilityDescription";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_48;
  propertiesToFetch_pl_once_object_48 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetDescription";
}

@end