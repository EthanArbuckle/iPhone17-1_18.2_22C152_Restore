@interface PHMutablePTPAsset
- (id)copyWithZone:(_NSZone *)a3;
- (id)updateForTranscodeChoiceWithConversionResult:(id)a3;
- (void)setBurstFavorite:(BOOL)a3;
- (void)setBurstFirstPicked:(BOOL)a3;
- (void)setBurstPicked:(BOOL)a3;
- (void)setBurstUUID:(id)a3;
- (void)setCaptureDateString:(id)a3;
- (void)setCapturedFilename:(id)a3;
- (void)setContentType:(id)a3;
- (void)setConversionGroup:(int64_t)a3;
- (void)setDcfFilename:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDesiredOrientation:(int64_t)a3;
- (void)setDurationString:(id)a3;
- (void)setFileSystemFilename:(id)a3;
- (void)setFingerprint:(id)a3;
- (void)setFullDirectoryPath:(id)a3;
- (void)setGroupUUID:(id)a3;
- (void)setHighFrameRateVideo:(BOOL)a3;
- (void)setImagePixSize:(CGSize)a3;
- (void)setIsHDR:(BOOL)a3;
- (void)setLocationString:(id)a3;
- (void)setModificationDateString:(id)a3;
- (void)setObjectCompressedSize:(id)a3;
- (void)setOriginatingAssetID:(id)a3;
- (void)setOverflowURL:(id)a3;
- (void)setResourceHandle:(id)a3;
- (void)setThumbCompressedSize:(id)a3;
- (void)setThumbOffset:(id)a3;
- (void)setThumbPixSize:(CGSize)a3;
- (void)setTimeLapseVideo:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)setVideoCodec:(unsigned int)a3;
- (void)updateWithConversionResult:(id)a3;
@end

@implementation PHMutablePTPAsset

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PHPTPAsset alloc];

  return [(PHPTPAsset *)v4 initWithPTPAsset:self];
}

- (void)updateWithConversionResult:(id)a3
{
  id v26 = a3;
  if ([v26 outputVideoCodec]) {
    self->super._videoCodec = [v26 outputVideoCodec];
  }
  v4 = [v26 outputContentType];
  contentType = self->super._contentType;
  self->super._contentType = v4;

  if ([v26 requiresConversion])
  {
    v6 = [PHPTPAssetHandle alloc];
    int64_t v7 = [(PHPTPAssetHandle *)self->super._resourceHandle resourceType];
    uint64_t v8 = [(PHPTPAssetHandle *)self->super._resourceHandle orientation];
    v9 = [(PHPTPAssetHandle *)self->super._resourceHandle localIdentifier];
    v10 = [(PHPTPAssetHandle *)v6 initWithResourceType:v7 orientation:v8 localIdentifier:v9 requiresConversion:1];
    resourceHandle = self->super._resourceHandle;
    self->super._resourceHandle = v10;

    v12 = [(NSString *)self->super._dcfFilename stringByDeletingPathExtension];
    v13 = [v26 pathExtension];
    v14 = [v12 stringByAppendingPathExtension:v13];
    dcfFilename = self->super._dcfFilename;
    self->super._dcfFilename = v14;

    v16 = [(NSString *)self->super._capturedFilename stringByDeletingPathExtension];
    v17 = [v26 pathExtension];
    v18 = [v16 stringByAppendingPathExtension:v17];
    capturedFilename = self->super._capturedFilename;
    self->super._capturedFilename = v18;

    v20 = [(NSString *)self->super._fileSystemFilename stringByDeletingPathExtension];
    v21 = [v26 pathExtension];
    v22 = [v20 stringByAppendingPathExtension:v21];
    fileSystemFilename = self->super._fileSystemFilename;
    self->super._fileSystemFilename = v22;

    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v26, "estimatedFileLength"));
    v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objectCompressedSize = self->super._objectCompressedSize;
    self->super._objectCompressedSize = v24;
  }
}

- (id)updateForTranscodeChoiceWithConversionResult:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->super._videoCodec = [v4 inputVideoCodec];
  v5 = [v4 inputContentType];
  contentType = self->super._contentType;
  self->super._contentType = v5;

  if ([v4 requiresConversion])
  {
    self->super._conversionGroup = 1;
    int64_t v7 = (void *)[(PHMutablePTPAsset *)self mutableCopy];
    if (v7)
    {
      uint64_t v8 = [PHPTPAssetHandle alloc];
      int64_t v9 = [(PHPTPAssetHandle *)self->super._resourceHandle resourceType];
      uint64_t v10 = [(PHPTPAssetHandle *)self->super._resourceHandle orientation];
      v11 = [(PHPTPAssetHandle *)self->super._resourceHandle localIdentifier];
      v12 = [(PHPTPAssetHandle *)v8 initWithResourceType:v9 orientation:v10 localIdentifier:v11 requiresConversion:1];
      [v7 setResourceHandle:v12];

      [v7 setConversionGroup:2];
      v13 = [(NSString *)self->super._capturedFilename stringByDeletingPathExtension];
      v14 = [v4 pathExtension];
      v15 = [v13 stringByAppendingPathExtension:v14];
      [v7 setCapturedFilename:v15];

      v16 = [(NSString *)self->super._dcfFilename stringByDeletingPathExtension];
      v17 = [v4 pathExtension];
      v18 = [v16 stringByAppendingPathExtension:v17];
      [v7 setDcfFilename:v18];

      v19 = [(NSString *)self->super._fileSystemFilename stringByDeletingPathExtension];
      v20 = [v4 pathExtension];
      v21 = [v19 stringByAppendingPathExtension:v20];
      [v7 setFileSystemFilename:v21];

      v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "estimatedFileLength"));
      [v7 setObjectCompressedSize:v22];

      objc_msgSend(v7, "setVideoCodec:", objc_msgSend(v4, "outputVideoCodec"));
      v23 = [v4 outputContentType];
      [v7 setContentType:v23];

      id v24 = v7;
    }
    else
    {
      v25 = PLPTPGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v27 = 138412290;
        v28 = self;
        _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "Expected a successful copy of %@", (uint8_t *)&v27, 0xCu);
      }
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setResourceHandle:(id)a3
{
}

- (void)setOverflowURL:(id)a3
{
}

- (void)setURL:(id)a3
{
}

- (void)setIsHDR:(BOOL)a3
{
  self->super._isHDR = a3;
}

- (void)setContentType:(id)a3
{
}

- (void)setVideoCodec:(unsigned int)a3
{
  self->super._videoCodec = a3;
}

- (void)setConversionGroup:(int64_t)a3
{
  self->super._conversionGroup = a3;
}

- (void)setTimeLapseVideo:(BOOL)a3
{
  self->super._timeLapseVideo = a3;
}

- (void)setHighFrameRateVideo:(BOOL)a3
{
  self->super._highFrameRateVideo = a3;
}

- (void)setBurstFirstPicked:(BOOL)a3
{
  self->super._burstFirstPicked = a3;
}

- (void)setBurstFavorite:(BOOL)a3
{
  self->super._burstFavorite = a3;
}

- (void)setBurstPicked:(BOOL)a3
{
  self->super._burstPicked = a3;
}

- (void)setBurstUUID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  burstUUID = self->super._burstUUID;
  self->super._burstUUID = v4;
}

- (void)setGroupUUID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  groupUUID = self->super._groupUUID;
  self->super._groupUUID = v4;
}

- (void)setLocationString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  locationString = self->super._locationString;
  self->super._locationString = v4;
}

- (void)setDurationString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  durationString = self->super._durationString;
  self->super._durationString = v4;
}

- (void)setCaptureDateString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  captureDateString = self->super._captureDateString;
  self->super._captureDateString = v4;
}

- (void)setModificationDateString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  modificationDateString = self->super._modificationDateString;
  self->super._modificationDateString = v4;
}

- (void)setDesiredOrientation:(int64_t)a3
{
  self->super._desiredOrientation = a3;
}

- (void)setThumbPixSize:(CGSize)a3
{
  self->super._thumbPixSize = a3;
}

- (void)setImagePixSize:(CGSize)a3
{
  self->super._imagePixSize = a3;
}

- (void)setThumbCompressedSize:(id)a3
{
  id v4 = (NSNumber *)[a3 copy];
  thumbCompressedSize = self->super._thumbCompressedSize;
  self->super._thumbCompressedSize = v4;
}

- (void)setThumbOffset:(id)a3
{
  id v4 = (NSNumber *)[a3 copy];
  thumbOffset = self->super._thumbOffset;
  self->super._thumbOffset = v4;
}

- (void)setOriginatingAssetID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  originatingAssetID = self->super._originatingAssetID;
  self->super._originatingAssetID = v4;
}

- (void)setFingerprint:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  fingerprint = self->super._fingerprint;
  self->super._fingerprint = v4;
}

- (void)setObjectCompressedSize:(id)a3
{
  id v4 = (NSNumber *)[a3 copy];
  objectCompressedSize = self->super._objectCompressedSize;
  self->super._objectCompressedSize = v4;
}

- (void)setFullDirectoryPath:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  fullDirectoryPath = self->super._fullDirectoryPath;
  self->super._fullDirectoryPath = v4;
}

- (void)setFileSystemFilename:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  fileSystemFilename = self->super._fileSystemFilename;
  self->super._fileSystemFilename = v4;
}

- (void)setDeleted:(BOOL)a3
{
  self->super._deleted = a3;
}

- (void)setCapturedFilename:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  capturedFilename = self->super._capturedFilename;
  self->super._capturedFilename = v4;
}

- (void)setDcfFilename:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  dcfFilename = self->super._dcfFilename;
  self->super._dcfFilename = v4;
}

@end