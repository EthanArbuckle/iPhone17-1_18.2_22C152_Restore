@interface PHAssetOriginalMetadataProperties
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSString)originalAssetsUUID;
- (NSString)originalFilename;
- (NSTimeZone)timeZone;
- (PHAssetOriginalMetadataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (int)timeZoneOffset;
- (int64_t)originalHeight;
- (int64_t)originalWidth;
- (signed)originalExifOrientation;
- (unint64_t)originalFilesize;
@end

@implementation PHAssetOriginalMetadataProperties

- (PHAssetOriginalMetadataProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PHAssetOriginalMetadataProperties;
  v10 = [(PHAssetOriginalMetadataProperties *)&v37 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5) {
      v12 = @"additionalAttributes.originalAssetsUUID";
    }
    else {
      v12 = @"originalAssetsUUID";
    }
    if (v5) {
      v13 = @"additionalAttributes.originalHeight";
    }
    else {
      v13 = @"originalHeight";
    }
    if (v5) {
      v14 = @"additionalAttributes.originalWidth";
    }
    else {
      v14 = @"originalWidth";
    }
    if (v5) {
      v15 = @"additionalAttributes.originalFilename";
    }
    else {
      v15 = @"originalFilename";
    }
    if (v5) {
      v16 = @"additionalAttributes.originalOrientation";
    }
    else {
      v16 = @"originalOrientation";
    }
    if (v5) {
      v17 = @"additionalAttributes.originalFilesize";
    }
    else {
      v17 = @"originalFilesize";
    }
    if (v5) {
      v18 = @"additionalAttributes.timeZoneOffset";
    }
    else {
      v18 = @"timeZoneOffset";
    }
    uint64_t v19 = [v8 objectForKeyedSubscript:v12];
    originalAssetsUUID = v11->_originalAssetsUUID;
    v11->_originalAssetsUUID = (NSString *)v19;

    v21 = [v8 objectForKeyedSubscript:v13];
    v11->_originalHeight = [v21 longLongValue];

    v22 = [v8 objectForKeyedSubscript:v14];
    v11->_originalWidth = [v22 longLongValue];

    uint64_t v23 = [v8 objectForKeyedSubscript:v15];
    originalFilename = v11->_originalFilename;
    v11->_originalFilename = (NSString *)v23;

    v25 = [v8 objectForKeyedSubscript:v16];
    v11->_originalExifOrientation = [v25 shortValue];

    v26 = [v8 objectForKeyedSubscript:v17];
    v11->_originalFilesize = [v26 unsignedLongLongValue];

    v27 = [v8 objectForKeyedSubscript:v18];
    v28 = v27;
    if (v27) {
      v11->_timeZoneOffset = [v27 intValue];
    }
    if (v5) {
      v29 = @"additionalAttributes.timeZoneName";
    }
    else {
      v29 = @"timeZoneName";
    }
    v30 = [v8 objectForKeyedSubscript:v29];
    if (v30)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v30];
      timeZone = v11->_timeZone;
      v11->_timeZone = (NSTimeZone *)v31;
    }
    v33 = v11->_timeZone;
    if (!v28 || v33)
    {
      if (v28 || !v33) {
        goto LABEL_37;
      }
      v35 = [v9 creationDate];
      v11->_timeZoneOffset = [(NSTimeZone *)v33 secondsFromGMTForDate:v35];
    }
    else
    {
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", objc_msgSend(v28, "integerValue"));
      v35 = v11->_timeZone;
      v11->_timeZone = (NSTimeZone *)v34;
    }

LABEL_37:
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);

  objc_storeStrong((id *)&self->_originalAssetsUUID, 0);
}

- (int)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (unint64_t)originalFilesize
{
  return self->_originalFilesize;
}

- (signed)originalExifOrientation
{
  return self->_originalExifOrientation;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (int64_t)originalWidth
{
  return self->_originalWidth;
}

- (int64_t)originalHeight
{
  return self->_originalHeight;
}

- (NSString)originalAssetsUUID
{
  return self->_originalAssetsUUID;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_40;

  return v2;
}

void __54__PHAssetOriginalMetadataProperties_propertiesToFetch__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v3[0] = @"originalAssetsUUID";
  v3[1] = @"originalFilename";
  v3[2] = @"originalFilesize";
  v3[3] = @"originalHeight";
  v3[4] = @"originalOrientation";
  v3[5] = @"originalWidth";
  v3[6] = @"timeZoneName";
  v3[7] = @"timeZoneOffset";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:8];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_40;
  propertiesToFetch_pl_once_object_40 = v1;
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetOriginalMetadata";
}

@end