@interface PHAssetPTPProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (BOOL)deferredProcessingNeeded;
- (BOOL)isBurstFavorite;
- (BOOL)isBurstFirstPicked;
- (BOOL)isBurstPicked;
- (BOOL)isHDR;
- (BOOL)isHighFrameRateVideo;
- (BOOL)isLivePhoto;
- (BOOL)isTimelapseVideo;
- (CLLocation)location;
- (NSDate)dateCreated;
- (NSNumber)embeddedThumbnailHeight;
- (NSNumber)embeddedThumbnailLength;
- (NSNumber)embeddedThumbnailOffset;
- (NSNumber)embeddedThumbnailWidth;
- (NSNumber)originalDuration;
- (NSString)burstIdentifier;
- (NSString)codec;
- (NSString)exifTimestampString;
- (NSString)filename;
- (NSString)fingerprint;
- (NSString)livePhotoPairingIdentifier;
- (NSString)originalFilename;
- (NSString)originatingAssetIdentifier;
- (PHAssetPTPProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
- (double)timeZoneOffset;
- (int64_t)ptpTrashedState;
- (unint64_t)originalFilesize;
- (unint64_t)originalHeight;
- (unint64_t)originalWidth;
@end

@implementation PHAssetPTPProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_originalDuration, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailHeight, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailWidth, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailLength, 0);
  objc_storeStrong((id *)&self->_embeddedThumbnailOffset, 0);
  objc_storeStrong((id *)&self->_originatingAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_exifTimestampString, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_locationData, 0);
}

- (BOOL)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (NSString)codec
{
  return self->_codec;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (double)timeZoneOffset
{
  return self->_timeZoneOffset;
}

- (int64_t)ptpTrashedState
{
  return self->_ptpTrashedState;
}

- (NSNumber)originalDuration
{
  return self->_originalDuration;
}

- (NSNumber)embeddedThumbnailHeight
{
  return self->_embeddedThumbnailHeight;
}

- (NSNumber)embeddedThumbnailWidth
{
  return self->_embeddedThumbnailWidth;
}

- (NSNumber)embeddedThumbnailLength
{
  return self->_embeddedThumbnailLength;
}

- (NSNumber)embeddedThumbnailOffset
{
  return self->_embeddedThumbnailOffset;
}

- (NSString)originatingAssetIdentifier
{
  return self->_originatingAssetIdentifier;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (NSString)exifTimestampString
{
  return self->_exifTimestampString;
}

- (unint64_t)originalHeight
{
  return self->_originalHeight;
}

- (unint64_t)originalWidth
{
  return self->_originalWidth;
}

- (unint64_t)originalFilesize
{
  return self->_originalFilesize;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (NSString)filename
{
  return self->_filename;
}

- (BOOL)isHDR
{
  return self->_hdrType != 0;
}

- (CLLocation)location
{
  locationData = self->_locationData;
  if (locationData) {
    v3 = (void *)[MEMORY[0x1E4F8A950] newLocationFromLocationData:locationData timestampIfMissing:self->_dateCreated];
  }
  else {
    v3 = 0;
  }

  return (CLLocation *)v3;
}

- (BOOL)isHighFrameRateVideo
{
  return self->_kind == 1 && self->_kindSubType == 101;
}

- (BOOL)isLivePhoto
{
  return !self->_kind && self->_kindSubType == 2;
}

- (BOOL)isBurstFavorite
{
  return self->_burstPickType == 8;
}

- (BOOL)isBurstFirstPicked
{
  return self->_burstPickType == 32;
}

- (BOOL)isBurstPicked
{
  return self->_burstPickType == 4;
}

- (BOOL)isTimelapseVideo
{
  return self->_kindSubType == 102;
}

- (PHAssetPTPProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v52.receiver = self;
  v52.super_class = (Class)PHAssetPTPProperties;
  v9 = [(PHAssetPTPProperties *)&v52 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = [v7 objectForKeyedSubscript:@"kindSubtype"];
    v10->_kindSubType = [v11 integerValue];

    v12 = [v7 objectForKeyedSubscript:@"kind"];
    v10->_kind = [v12 integerValue];

    v13 = [v7 objectForKeyedSubscript:@"avalanchePickType"];
    v10->_burstPickType = [v13 integerValue];

    uint64_t v14 = [v7 objectForKeyedSubscript:@"mediaGroupUUID"];
    livePhotoPairingIdentifier = v10->_livePhotoPairingIdentifier;
    v10->_livePhotoPairingIdentifier = (NSString *)v14;

    uint64_t v16 = [v7 objectForKeyedSubscript:@"filename"];
    filename = v10->_filename;
    v10->_filename = (NSString *)v16;

    uint64_t v18 = [v7 objectForKeyedSubscript:@"avalancheUUID"];
    burstIdentifier = v10->_burstIdentifier;
    v10->_burstIdentifier = (NSString *)v18;

    uint64_t v20 = [v7 objectForKeyedSubscript:@"locationData"];
    locationData = v10->_locationData;
    v10->_locationData = (NSData *)v20;

    v22 = [v7 objectForKeyedSubscript:@"hdrType"];
    v10->_hdrType = [v22 integerValue];

    v23 = [v7 objectForKeyedSubscript:@"deferredProcessingNeeded"];
    v10->_deferredProcessingNeeded = [v23 BOOLValue];

    uint64_t v24 = [v7 objectForKeyedSubscript:@"additionalAttributes.originalFilename"];
    originalFilename = v10->_originalFilename;
    v10->_originalFilename = (NSString *)v24;

    v26 = [v7 objectForKeyedSubscript:@"additionalAttributes.originalFilesize"];
    v10->_originalFilesize = [v26 integerValue];

    v27 = [v7 objectForKeyedSubscript:@"additionalAttributes.originalWidth"];
    v10->_originalWidth = [v27 integerValue];

    v28 = [v7 objectForKeyedSubscript:@"additionalAttributes.originalHeight"];
    v10->_originalHeight = [v28 integerValue];

    uint64_t v29 = [v7 objectForKeyedSubscript:@"additionalAttributes.exifTimestampString"];
    exifTimestampString = v10->_exifTimestampString;
    v10->_exifTimestampString = (NSString *)v29;

    v31 = [v7 objectForKeyedSubscript:@"additionalAttributes.ptpTrashedState"];
    v10->_ptpTrashedState = [v31 integerValue];

    uint64_t v32 = [v7 objectForKeyedSubscript:@"additionalAttributes.originatingAssetIdentifier"];
    originatingAssetIdentifier = v10->_originatingAssetIdentifier;
    v10->_originatingAssetIdentifier = (NSString *)v32;

    uint64_t v34 = [v7 objectForKeyedSubscript:@"additionalAttributes.embeddedThumbnailOffset"];
    embeddedThumbnailOffset = v10->_embeddedThumbnailOffset;
    v10->_embeddedThumbnailOffset = (NSNumber *)v34;

    uint64_t v36 = [v7 objectForKeyedSubscript:@"additionalAttributes.embeddedThumbnailLength"];
    embeddedThumbnailLength = v10->_embeddedThumbnailLength;
    v10->_embeddedThumbnailLength = (NSNumber *)v36;

    uint64_t v38 = [v7 objectForKeyedSubscript:@"additionalAttributes.embeddedThumbnailWidth"];
    embeddedThumbnailWidth = v10->_embeddedThumbnailWidth;
    v10->_embeddedThumbnailWidth = (NSNumber *)v38;

    uint64_t v40 = [v7 objectForKeyedSubscript:@"additionalAttributes.embeddedThumbnailHeight"];
    embeddedThumbnailHeight = v10->_embeddedThumbnailHeight;
    v10->_embeddedThumbnailHeight = (NSNumber *)v40;

    uint64_t v42 = [v7 objectForKeyedSubscript:@"additionalAttributes.originalStableHash"];
    fingerprint = v10->_fingerprint;
    v10->_fingerprint = (NSString *)v42;

    v44 = [v7 objectForKeyedSubscript:@"additionalAttributes.timeZoneOffset"];
    v10->_timeZoneOffset = (double)[v44 integerValue];

    uint64_t v45 = [v7 objectForKeyedSubscript:@"extendedAttributes.dateCreated"];
    dateCreated = v10->_dateCreated;
    v10->_dateCreated = (NSDate *)v45;

    uint64_t v47 = [v7 objectForKeyedSubscript:@"extendedAttributes.duration"];
    originalDuration = v10->_originalDuration;
    v10->_originalDuration = (NSNumber *)v47;

    uint64_t v49 = [v7 objectForKeyedSubscript:@"extendedAttributes.codec"];
    codec = v10->_codec;
    v10->_codec = (NSString *)v49;
  }
  return v10;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_76;

  return v2;
}

void __41__PHAssetPTPProperties_propertiesToFetch__block_invoke()
{
  v3[25] = *MEMORY[0x1E4F143B8];
  v3[0] = @"filename";
  v3[1] = @"mediaGroupUUID";
  v3[2] = @"kind";
  v3[3] = @"kindSubtype";
  v3[4] = @"avalanchePickType";
  v3[5] = @"avalancheUUID";
  v3[6] = @"locationData";
  v3[7] = @"hdrType";
  v3[8] = @"deferredProcessingNeeded";
  v3[9] = @"additionalAttributes.originalFilename";
  v3[10] = @"additionalAttributes.originalFilesize";
  v3[11] = @"additionalAttributes.originalWidth";
  v3[12] = @"additionalAttributes.originalHeight";
  v3[13] = @"additionalAttributes.exifTimestampString";
  v3[14] = @"additionalAttributes.ptpTrashedState";
  v3[15] = @"additionalAttributes.originatingAssetIdentifier";
  v3[16] = @"additionalAttributes.embeddedThumbnailOffset";
  v3[17] = @"additionalAttributes.embeddedThumbnailLength";
  v3[18] = @"additionalAttributes.embeddedThumbnailWidth";
  v3[19] = @"additionalAttributes.embeddedThumbnailHeight";
  v3[20] = @"additionalAttributes.originalStableHash";
  v3[21] = @"additionalAttributes.timeZoneOffset";
  v3[22] = @"extendedAttributes.dateCreated";
  v3[23] = @"extendedAttributes.duration";
  v3[24] = @"extendedAttributes.codec";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:25];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_76;
  propertiesToFetch_pl_once_object_76 = v1;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return (id)[MEMORY[0x1E4F8A950] entityName];
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetPTP";
}

@end