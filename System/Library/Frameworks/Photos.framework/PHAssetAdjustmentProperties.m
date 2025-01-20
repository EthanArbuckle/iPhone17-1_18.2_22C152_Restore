@interface PHAssetAdjustmentProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSString)formatIdentifier;
- (NSString)formatVersion;
- (PHAssetAdjustmentProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (unint64_t)originalResourceChoice;
@end

@implementation PHAssetAdjustmentProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);

  objc_storeStrong((id *)&self->_formatIdentifier, 0);
}

- (unint64_t)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (NSString)formatIdentifier
{
  return self->_formatIdentifier;
}

- (PHAssetAdjustmentProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHAssetAdjustmentProperties;
  v10 = [(PHAssetAdjustmentProperties *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    BOOL v12 = !v5;
    if (v5) {
      v13 = @"additionalAttributes.unmanagedAdjustment.adjustmentFormatIdentifier";
    }
    else {
      v13 = @"unmanagedAdjustment.adjustmentFormatIdentifier";
    }
    if (v5) {
      v14 = @"additionalAttributes.unmanagedAdjustment.adjustmentFormatVersion";
    }
    else {
      v14 = @"unmanagedAdjustment.adjustmentFormatVersion";
    }
    if (v12) {
      v15 = @"originalResourceChoice";
    }
    else {
      v15 = @"additionalAttributes.originalResourceChoice";
    }
    uint64_t v16 = [v8 objectForKeyedSubscript:v13];
    formatIdentifier = v11->_formatIdentifier;
    v11->_formatIdentifier = (NSString *)v16;

    uint64_t v18 = [v8 objectForKeyedSubscript:v14];
    formatVersion = v11->_formatVersion;
    v11->_formatVersion = (NSString *)v18;

    v20 = [v8 objectForKeyedSubscript:v15];
    v11->_originalResourceChoice = [v20 unsignedIntegerValue];
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_54;

  return v2;
}

void __48__PHAssetAdjustmentProperties_propertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"unmanagedAdjustment.adjustmentFormatIdentifier";
  v3[1] = @"unmanagedAdjustment.adjustmentFormatVersion";
  v3[2] = @"originalResourceChoice";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_54;
  propertiesToFetch_pl_once_object_54 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetAdjustment";
}

@end