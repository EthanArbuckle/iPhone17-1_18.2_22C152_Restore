@interface PHAssetMontageProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSString)montage;
- (PHAssetMontageProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetMontageProperties

- (void).cxx_destruct
{
}

- (NSString)montage
{
  return self->_montage;
}

- (PHAssetMontageProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetMontageProperties;
  v10 = [(PHAssetMontageProperties *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.montage";
    }
    else {
      v12 = @"montage";
    }
    uint64_t v13 = [v8 objectForKeyedSubscript:v12];
    montage = v11->_montage;
    v11->_montage = (NSString *)v13;
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_72;

  return v2;
}

void __45__PHAssetMontageProperties_propertiesToFetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"montage";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_72;
  propertiesToFetch_pl_once_object_72 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetMontage";
}

@end