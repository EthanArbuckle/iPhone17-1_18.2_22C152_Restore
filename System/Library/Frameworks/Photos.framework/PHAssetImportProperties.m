@interface PHAssetImportProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (PHAssetImportProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int64_t)importedBy;
@end

@implementation PHAssetImportProperties

- (int64_t)importedBy
{
  return self->_importedBy;
}

- (PHAssetImportProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetImportProperties;
  v10 = [(PHAssetImportProperties *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.importedBy";
    }
    else {
      v12 = @"importedBy";
    }
    v13 = [v8 objectForKeyedSubscript:v12];
    unint64_t v14 = [v13 integerValue];

    if (v14 <= 0xE) {
      v11->_importedBy = v14;
    }
  }

  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_63;

  return v2;
}

void __44__PHAssetImportProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"importedBy";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_63;
  propertiesToFetch_pl_once_object_63 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetImport";
}

@end