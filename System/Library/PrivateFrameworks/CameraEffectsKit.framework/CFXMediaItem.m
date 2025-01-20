@interface CFXMediaItem
- (BOOL)adjustmentsDataWasSet;
- (BOOL)initializedWithoutSettingAllProperties;
- (CFXClip)clip;
- (CFXMediaItem)init;
- (CFXMediaItem)initWithCameraMode:(int64_t)a3 clip:(id)a4 assetMediaURL:(id)a5 assetMetadataURL:(id)a6 cameraPosition:(int64_t)a7;
- (CFXMediaItem)initWithType:(int64_t)a3 originalAssetURL:(id)a4 adjustmentsData:(id)a5;
- (NSData)adjustmentsData;
- (NSURL)adjustedAssetURL;
- (NSURL)metadataURL;
- (NSURL)originalAssetURL;
- (int64_t)cameraMode;
- (int64_t)cameraPosition;
- (int64_t)type;
- (void)CFX_updateCameraPositionForPhotoType;
- (void)adjustmentsData;
- (void)createClipForMediaType:(int64_t)a3 assetURL:(id)a4 cameraMode:(int64_t)a5 effectStack:(id)a6;
- (void)setAdjustedAssetURL:(id)a3;
- (void)setAdjustmentsData:(id)a3;
- (void)setAdjustmentsDataWasSet:(BOOL)a3;
- (void)setInitializedWithoutSettingAllProperties:(BOOL)a3;
- (void)setOriginalAssetURL:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CFXMediaItem

- (CFXMediaItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)CFXMediaItem;
  result = [(CFXMediaItem *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_type = xmmword_234D613F0;
    result->_cameraPosition = 0;
    result->_initializedWithoutSettingAllProperties = 1;
  }
  return result;
}

- (CFXMediaItem)initWithCameraMode:(int64_t)a3 clip:(id)a4 assetMediaURL:(id)a5 assetMetadataURL:(id)a6 cameraPosition:(int64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CFXMediaItem;
  v16 = [(CFXMediaItem *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_cameraMode = a3;
    objc_storeStrong((id *)&v16->_clip, a4);
    v17->_type = [v13 isVideo];
    objc_storeStrong((id *)&v17->_originalAssetURL, a5);
    objc_storeStrong((id *)&v17->_metadataURL, a6);
    v17->_cameraPosition = a7;
  }

  return v17;
}

- (CFXMediaItem)initWithType:(int64_t)a3 originalAssetURL:(id)a4 adjustmentsData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CFXMediaItem;
  v11 = [(CFXMediaItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_originalAssetURL, a4);
    [(CFXMediaItem *)v12 setAdjustmentsData:v10];
    if (!(v12->_cameraPosition | a3)) {
      [(CFXMediaItem *)v12 CFX_updateCameraPositionForPhotoType];
    }
  }

  return v12;
}

- (NSData)adjustmentsData
{
  int64_t v3 = [(CFXMediaItem *)self cameraMode];
  v4 = [(CFXMediaItem *)self clip];
  v5 = [v4 effectStack];

  v6 = [CFXMediaItemAdjustmentsData alloc];
  v7 = [(CFXMediaItem *)self metadataURL];
  v8 = [(CFXMediaItemAdjustmentsData *)v6 initWithCameraMode:v3 metadataURL:v7 cameraPosition:[(CFXMediaItem *)self cameraPosition] effectStack:v5];

  id v13 = 0;
  id v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v13];
  id v10 = v13;
  if (v10)
  {
    v11 = JFXLog_core();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(CFXMediaItem *)(uint64_t)v10 adjustmentsData];
    }
  }
  return (NSData *)v9;
}

- (void)setAdjustmentsData:(id)a3
{
  id v4 = a3;
  [(CFXMediaItem *)self setAdjustmentsDataWasSet:1];
  if (v4)
  {
    v5 = (void *)MEMORY[0x263F08928];
    v6 = +[CFXMediaItemAdjustmentsData secureCodingClassWhitelist];
    id v14 = 0;
    v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v14];
    id v8 = v14;

    self->_cameraMode = [v7 cameraMode];
    id v9 = [v7 metadataURL];
    metadataURL = self->_metadataURL;
    self->_metadataURL = v9;

    self->_cameraPosition = [v7 cameraPosition];
    v11 = [v7 effectStack];
  }
  else
  {
    v11 = 0;
  }
  int64_t v12 = [(CFXMediaItem *)self type];
  id v13 = [(CFXMediaItem *)self originalAssetURL];
  [(CFXMediaItem *)self createClipForMediaType:v12 assetURL:v13 cameraMode:[(CFXMediaItem *)self cameraMode] effectStack:v11];
}

- (void)setOriginalAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalAssetURL, a3);
  id v5 = a3;
  int64_t v6 = [(CFXMediaItem *)self type];
  int64_t v7 = [(CFXMediaItem *)self cameraMode];
  id v9 = [(CFXMediaItem *)self clip];
  id v8 = [v9 effectStack];
  [(CFXMediaItem *)self createClipForMediaType:v6 assetURL:v5 cameraMode:v7 effectStack:v8];
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  id v8 = [(CFXMediaItem *)self originalAssetURL];
  int64_t v5 = [(CFXMediaItem *)self cameraMode];
  int64_t v6 = [(CFXMediaItem *)self clip];
  int64_t v7 = [v6 effectStack];
  [(CFXMediaItem *)self createClipForMediaType:a3 assetURL:v8 cameraMode:v5 effectStack:v7];
}

- (void)createClipForMediaType:(int64_t)a3 assetURL:(id)a4 cameraMode:(int64_t)a5 effectStack:(id)a6
{
  unint64_t v10 = (unint64_t)a4;
  id v11 = a6;
  if (v10 | (unint64_t)self->_clip)
  {
    if (![(CFXMediaItem *)self initializedWithoutSettingAllProperties]
      || a3 != 2 && v10 && [(CFXMediaItem *)self adjustmentsDataWasSet])
    {
      uint64_t v12 = JFXMaximumVideoDimensionForCameraMode(a5);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __71__CFXMediaItem_createClipForMediaType_assetURL_cameraMode_effectStack___block_invoke;
      v15[3] = &unk_264C0B820;
      v15[4] = self;
      +[CFXClip createClipWithLocalURL:v10 effectStack:v11 isVideo:a3 == 1 maximumImageDimension:v12 completionHandler:v15];
      if (!self->_cameraPosition && !self->_type) {
        [(CFXMediaItem *)self CFX_updateCameraPositionForPhotoType];
      }
    }
  }
  else
  {
    id v13 = +[CFXClip createCaptureClip];
    clip = self->_clip;
    self->_clip = v13;

    [(CFXClip *)self->_clip addEffectStack:v11];
  }
}

void __71__CFXMediaItem_createClipForMediaType_assetURL_cameraMode_effectStack___block_invoke(uint64_t a1, void *a2)
{
}

- (void)CFX_updateCameraPositionForPhotoType
{
  int64_t v3 = CGImageSourceCreateWithURL((CFURLRef)self->_originalAssetURL, 0);
  if (v3)
  {
    id v4 = v3;
    CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    if (v5)
    {
      uint64_t v6 = *MEMORY[0x263F0F248];
      uint64_t v7 = *MEMORY[0x263F0F2B0];
      CFDictionaryRef v8 = v5;
      id v9 = [(__CFDictionary *)v8 objectForKeyedSubscript:v6];
      unint64_t v10 = [v9 objectForKeyedSubscript:v7];
      int v11 = [v10 containsString:@"front"];
      int64_t v12 = [v10 containsString:@"back"];
      if (v11) {
        int64_t v12 = 2;
      }
      self->_cameraPosition = v12;
      CFRelease(v8);
    }
    CFRelease(v4);
  }
}

- (CFXClip)clip
{
  return self->_clip;
}

- (BOOL)initializedWithoutSettingAllProperties
{
  return self->_initializedWithoutSettingAllProperties;
}

- (void)setInitializedWithoutSettingAllProperties:(BOOL)a3
{
  self->_initializedWithoutSettingAllProperties = a3;
}

- (NSURL)adjustedAssetURL
{
  return self->_adjustedAssetURL;
}

- (void)setAdjustedAssetURL:(id)a3
{
}

- (NSURL)originalAssetURL
{
  return self->_originalAssetURL;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)adjustmentsDataWasSet
{
  return self->_adjustmentsDataWasSet;
}

- (void)setAdjustmentsDataWasSet:(BOOL)a3
{
  self->_adjustmentsDataWasSet = a3;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_originalAssetURL, 0);
  objc_storeStrong((id *)&self->_adjustedAssetURL, 0);
  objc_storeStrong((id *)&self->_clip, 0);
}

- (void)adjustmentsData
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "Error encoding adjustments data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end