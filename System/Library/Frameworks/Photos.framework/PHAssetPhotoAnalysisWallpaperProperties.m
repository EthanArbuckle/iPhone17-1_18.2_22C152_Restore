@interface PHAssetPhotoAnalysisWallpaperProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSData)wallpaperPropertiesData;
- (NSDate)wallpaperPropertiesTimestamp;
- (PHAssetPhotoAnalysisWallpaperProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (unint64_t)wallpaperPropertiesVersion;
@end

@implementation PHAssetPhotoAnalysisWallpaperProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperPropertiesTimestamp, 0);

  objc_storeStrong((id *)&self->_wallpaperPropertiesData, 0);
}

- (unint64_t)wallpaperPropertiesVersion
{
  return self->_wallpaperPropertiesVersion;
}

- (NSDate)wallpaperPropertiesTimestamp
{
  return self->_wallpaperPropertiesTimestamp;
}

- (NSData)wallpaperPropertiesData
{
  return self->_wallpaperPropertiesData;
}

- (PHAssetPhotoAnalysisWallpaperProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHAssetPhotoAnalysisWallpaperProperties;
  v10 = [(PHAssetPhotoAnalysisWallpaperProperties *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    BOOL v12 = !v5;
    if (v5) {
      v13 = @"photoAnalysisAttributes.wallpaperPropertiesTimestamp";
    }
    else {
      v13 = @"wallpaperPropertiesTimestamp";
    }
    if (v5) {
      v14 = @"photoAnalysisAttributes.wallpaperPropertiesVersion";
    }
    else {
      v14 = @"wallpaperPropertiesVersion";
    }
    if (v12) {
      v15 = @"wallpaperPropertiesData";
    }
    else {
      v15 = @"photoAnalysisAttributes.wallpaperPropertiesData";
    }
    uint64_t v16 = [v8 objectForKeyedSubscript:v13];
    wallpaperPropertiesTimestamp = v11->_wallpaperPropertiesTimestamp;
    v11->_wallpaperPropertiesTimestamp = (NSDate *)v16;

    v18 = [v8 objectForKeyedSubscript:v14];
    v11->_wallpaperPropertiesVersion = [v18 unsignedLongLongValue];

    uint64_t v19 = [v8 objectForKeyedSubscript:v15];
    wallpaperPropertiesData = v11->_wallpaperPropertiesData;
    v11->_wallpaperPropertiesData = (NSData *)v19;
  }
  return v11;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_58;

  return v2;
}

void __60__PHAssetPhotoAnalysisWallpaperProperties_propertiesToFetch__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"wallpaperPropertiesData";
  v3[1] = @"wallpaperPropertiesTimestamp";
  v3[2] = @"wallpaperPropertiesVersion";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_58;
  propertiesToFetch_pl_once_object_58 = v1;
}

+ (id)entityName
{
  return @"PhotoAnalysisAssetAttributes";
}

+ (id)keyPathToPrimaryObject
{
  return @"asset";
}

+ (id)keyPathFromPrimaryObject
{
  return @"photoAnalysisAttributes";
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetPhotoAnalysisWallpaperProperties";
}

@end