@interface PHPTPAsset
+ (BOOL)isMovieType:(int64_t)a3;
+ (BOOL)isPhotoType:(int64_t)a3;
+ (BOOL)isSupportedResourceType:(int64_t)a3;
+ (int64_t)ptpTrashedStateForResourceType:(int64_t)a3;
- (BOOL)isBurstFavorite;
- (BOOL)isBurstFirstPicked;
- (BOOL)isBurstPicked;
- (BOOL)isDeleted;
- (BOOL)isHDR;
- (BOOL)isHighFrameRateVideo;
- (BOOL)isMovie;
- (BOOL)isPartOfLivePhoto;
- (BOOL)isPhoto;
- (BOOL)isPrimary;
- (BOOL)isRender;
- (BOOL)isTimeLapseVideo;
- (CGSize)imagePixSize;
- (CGSize)thumbPixSize;
- (NSNumber)objectCompressedSize;
- (NSNumber)thumbCompressedSize;
- (NSNumber)thumbOffset;
- (NSString)burstUUID;
- (NSString)captureDateString;
- (NSString)capturedFilename;
- (NSString)createdFilename;
- (NSString)dcfFilename;
- (NSString)durationString;
- (NSString)fileSystemFilename;
- (NSString)filename;
- (NSString)fingerprint;
- (NSString)fullDirectoryPath;
- (NSString)groupUUID;
- (NSString)locationString;
- (NSString)modificationDateString;
- (NSString)originalFilename;
- (NSString)originatingAssetID;
- (NSString)relatedUUID;
- (NSString)spatialOverCaptureGroupIdentifier;
- (NSURL)overflowURL;
- (NSURL)url;
- (PHPTPAsset)initWithPTPAsset:(id)a3;
- (PHPTPAsset)initWithPhotosAsset:(id)a3 photosResource:(id)a4;
- (PHPTPAsset)initWithPhotosAsset:(id)a3 url:(id)a4 resourceType:(int64_t)a5 orientation:(unsigned int)a6;
- (PHPTPAssetHandle)assetHandle;
- (PHPTPAssetHandle)resourceHandle;
- (UTType)contentType;
- (id)_prettyDescriptionWithIndent:(int64_t)a3;
- (id)_resourceFilenameForFilename:(id)a3 assetResource:(id)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)conversionGroup;
- (int64_t)desiredOrientation;
- (unsigned)videoCodec;
@end

@implementation PHPTPAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialOverCaptureGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_capturedFilename, 0);
  objc_storeStrong((id *)&self->_fileSystemFilename, 0);
  objc_storeStrong((id *)&self->_dcfFilename, 0);
  objc_storeStrong((id *)&self->_resourceHandle, 0);
  objc_storeStrong((id *)&self->_overflowURL, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_burstUUID, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_durationString, 0);
  objc_storeStrong((id *)&self->_captureDateString, 0);
  objc_storeStrong((id *)&self->_modificationDateString, 0);
  objc_storeStrong((id *)&self->_thumbCompressedSize, 0);
  objc_storeStrong((id *)&self->_thumbOffset, 0);
  objc_storeStrong((id *)&self->_originatingAssetID, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_objectCompressedSize, 0);

  objc_storeStrong((id *)&self->_fullDirectoryPath, 0);
}

- (NSString)capturedFilename
{
  return self->_capturedFilename;
}

- (NSString)fileSystemFilename
{
  return self->_fileSystemFilename;
}

- (NSString)dcfFilename
{
  return self->_dcfFilename;
}

- (PHPTPAssetHandle)resourceHandle
{
  return self->_resourceHandle;
}

- (NSURL)overflowURL
{
  return self->_overflowURL;
}

- (BOOL)isPartOfLivePhoto
{
  return self->_isPartOfLivePhoto;
}

- (NSString)spatialOverCaptureGroupIdentifier
{
  return self->_spatialOverCaptureGroupIdentifier;
}

- (NSNumber)objectCompressedSize
{
  return self->_objectCompressedSize;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (unsigned)videoCodec
{
  return self->_videoCodec;
}

- (int64_t)conversionGroup
{
  return self->_conversionGroup;
}

- (BOOL)isTimeLapseVideo
{
  return self->_timeLapseVideo;
}

- (BOOL)isHighFrameRateVideo
{
  return self->_highFrameRateVideo;
}

- (BOOL)isBurstFirstPicked
{
  return self->_burstFirstPicked;
}

- (BOOL)isBurstFavorite
{
  return self->_burstFavorite;
}

- (BOOL)isBurstPicked
{
  return self->_burstPicked;
}

- (NSString)burstUUID
{
  return self->_burstUUID;
}

- (NSString)groupUUID
{
  return self->_groupUUID;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (NSString)durationString
{
  return self->_durationString;
}

- (NSString)modificationDateString
{
  return self->_modificationDateString;
}

- (NSString)captureDateString
{
  return self->_captureDateString;
}

- (int64_t)desiredOrientation
{
  return self->_desiredOrientation;
}

- (CGSize)thumbPixSize
{
  double width = self->_thumbPixSize.width;
  double height = self->_thumbPixSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)imagePixSize
{
  double width = self->_imagePixSize.width;
  double height = self->_imagePixSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSNumber)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (NSNumber)thumbOffset
{
  return self->_thumbOffset;
}

- (NSString)originatingAssetID
{
  return self->_originatingAssetID;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (id)_prettyDescriptionWithIndent:(int64_t)a3
{
  v4 = [MEMORY[0x1E4F8A7A8] prettyMultiLineDescriptionBuilderWithObject:self indent:a3];
  [v4 appendName:@"resourceHandle" typeCode:"@" value:&self->_resourceHandle];
  [v4 appendName:@"dcfFilename" typeCode:"@" value:&self->_dcfFilename];
  [v4 appendName:@"capturedFilename" typeCode:"@" value:&self->_capturedFilename];
  [v4 appendName:@"deleted" typeCode:"B" value:&self->_deleted];
  [v4 appendName:@"fileSystemFilename" typeCode:"@" value:&self->_fileSystemFilename];
  [v4 appendName:@"fullDirectoryPath" typeCode:"@" value:&self->_fullDirectoryPath];
  [v4 appendName:@"objectCompressedSize" typeCode:"@" value:&self->_objectCompressedSize];
  [v4 appendName:@"fingerprint" typeCode:"@" value:&self->_fingerprint];
  [v4 appendName:@"originatingAssetID" typeCode:"@" value:&self->_originatingAssetID];
  [v4 appendName:@"thumbOffset" typeCode:"@" value:&self->_thumbOffset];
  [v4 appendName:@"thumbCompressedSize" typeCode:"@" value:&self->_thumbCompressedSize];
  [v4 appendName:@"imagePixSize" typeCode:"{CGSize=dd}" value:&self->_imagePixSize];
  [v4 appendName:@"thumbPixSize" typeCode:"{CGSize=dd}" value:&self->_thumbPixSize];
  [v4 appendName:@"desiredOrientation" typeCode:"q" value:&self->_desiredOrientation];
  [v4 appendName:@"modificationDateString" typeCode:"@" value:&self->_modificationDateString];
  [v4 appendName:@"captureDateString" typeCode:"@" value:&self->_captureDateString];
  [v4 appendName:@"durationString" typeCode:"@" value:&self->_durationString];
  [v4 appendName:@"locationString" typeCode:"@" value:&self->_locationString];
  [v4 appendName:@"groupUUID" typeCode:"@" value:&self->_groupUUID];
  [v4 appendName:@"burstUUID" typeCode:"@" value:&self->_burstUUID];
  [v4 appendName:@"burstPicked" typeCode:"B" value:&self->_burstPicked];
  [v4 appendName:@"burstFavorite" typeCode:"B" value:&self->_burstFavorite];
  [v4 appendName:@"burstFirstPicked" typeCode:"B" value:&self->_burstFirstPicked];
  [v4 appendName:@"highFrameRateVideo" typeCode:"B" value:&self->_highFrameRateVideo];
  [v4 appendName:@"timeLapseVideo" typeCode:"B" value:&self->_timeLapseVideo];
  [v4 appendName:@"relatedUUID" typeCode:"@" value:&self->_relatedUUID];
  [v4 appendName:@"conversionGroup" typeCode:"q" value:&self->_conversionGroup];
  [v4 appendName:@"videoCodec" typeCode:"I" value:&self->_videoCodec];
  [v4 appendName:@"contentType" typeCode:"@" value:&self->_contentType];
  v5 = [v4 build];

  return v5;
}

- (id)description
{
  return [(PHPTPAsset *)self _prettyDescriptionWithIndent:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [PHMutablePTPAsset alloc];

  return [(PHPTPAsset *)v4 initWithPTPAsset:self];
}

+ (BOOL)isSupportedResourceType:(int64_t)a3
{
  BOOL result = 1;
  if ((unint64_t)a3 <= 0x14)
  {
    if (((1 << a3) & 0x31FFE) != 0) {
      return result;
    }
    if (((1 << a3) & 0x18E000) != 0) {
      return 0;
    }
  }
  if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PHPTPAsset.m", 505, @"Unhandled resource type (%lu) in %s", a3, "+[PHPTPAsset isSupportedResourceType:]");

    return 0;
  }
  return result;
}

+ (int64_t)ptpTrashedStateForResourceType:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 > 107)
  {
    switch(a3)
    {
      case 'l':
        v8 = PLPTPGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = [NSNumber numberWithInteger:108];
          *(_DWORD *)buf = 138412290;
          int64_t v12 = (int64_t)v9;
          _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, "Unexpected request for trashed state of resource type %@", buf, 0xCu);
        }
        break;
      case 'n':
        return 0x10000;
      case 'q':
        return 0x8000;
      default:
LABEL_28:
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PHPTPAsset.m", 472, @"Unhandled resource type (%lu) in %s", a3, "+[PHPTPAsset ptpTrashedStateForResourceType:]");

        break;
    }
    return 0;
  }
  else
  {
    int64_t result = 1;
    switch(a3)
    {
      case 1:
      case 2:
        return result;
      case 3:
        int64_t result = 512;
        break;
      case 4:
        int64_t result = 2048;
        break;
      case 5:
        int64_t result = 4;
        break;
      case 6:
        int64_t result = 8;
        break;
      case 7:
        int64_t result = 2;
        break;
      case 8:
        int64_t result = 128;
        break;
      case 9:
        int64_t result = 4096;
        break;
      case 10:
        int64_t result = 1024;
        break;
      case 11:
        int64_t result = 0x4000;
        break;
      case 12:
        int64_t result = 256;
        break;
      case 13:
      case 14:
      case 15:
      case 19:
      case 20:
        v7 = PLPTPGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          int64_t v12 = a3;
          _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
        }

        return 0;
      case 16:
        int64_t result = 64;
        break;
      case 17:
        int64_t result = 0x2000;
        break;
      default:
        goto LABEL_28;
    }
  }
  return result;
}

+ (BOOL)isMovieType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 0x14) {
    goto LABEL_9;
  }
  if (((1 << a3) & 0x301BA) == 0)
  {
    if (((1 << a3) & 0x1E44) != 0) {
      return 1;
    }
    if (((1 << a3) & 0x18E000) != 0)
    {
      v7 = PLPTPGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v10 = a3;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
LABEL_9:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PHPTPAsset.m", 387, @"Unhandled resource type (%lu) in %s", a3, "+[PHPTPAsset isMovieType:]");
    }
  }
  return 0;
}

+ (BOOL)isPhotoType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 0x14) {
    goto LABEL_9;
  }
  if (((1 << a3) & 0x31ECC) == 0)
  {
    if (((1 << a3) & 0x18E000) != 0)
    {
      v6 = PLPTPGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v10 = a3;
        _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << a3) & 0x132) != 0) {
      return 1;
    }
LABEL_9:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PHPTPAsset.m", 348, @"Unhandled resource type (%lu) in %s", a3, "+[PHPTPAsset isPhotoType:]");
    }
  }
  return 0;
}

- (BOOL)isRender
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(PHPTPAssetHandle *)self->_resourceHandle resourceType];
  if (v4 > 0x14) {
    goto LABEL_9;
  }
  if (((1 << v4) & 0x31B9E) == 0)
  {
    if (((1 << v4) & 0x18E000) != 0)
    {
      v5 = PLPTPGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int64_t v6 = [(PHPTPAssetHandle *)self->_resourceHandle resourceType];
        *(_DWORD *)buf = 134217984;
        int64_t v11 = v6;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << v4) & 0x460) != 0) {
      return 1;
    }
LABEL_9:
    if (v4 - 108 > 5 || ((1 << (v4 - 108)) & 0x25) == 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAsset.m", 422, @"Unhandled resource type (%lu) in %s", -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType"), "-[PHPTPAsset isRender]");
    }
  }
  return 0;
}

- (BOOL)isMovie
{
  int64_t v2 = [(PHPTPAssetHandle *)self->_resourceHandle resourceType];

  return +[PHPTPAsset isMovieType:v2];
}

- (BOOL)isPhoto
{
  int64_t v2 = [(PHPTPAssetHandle *)self->_resourceHandle resourceType];

  return +[PHPTPAsset isPhotoType:v2];
}

- (BOOL)isPrimary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(PHPTPAssetHandle *)self->_resourceHandle resourceType];
  if (v4 > 0x14) {
    goto LABEL_9;
  }
  if (((1 << v4) & 0x31FF8) == 0)
  {
    if (((1 << v4) & 0x18E000) != 0)
    {
      v5 = PLPTPGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int64_t v6 = [(PHPTPAssetHandle *)self->_resourceHandle resourceType];
        *(_DWORD *)buf = 134217984;
        int64_t v11 = v6;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << v4) & 6) != 0) {
      return 1;
    }
LABEL_9:
    if (v4 - 108 > 5 || ((1 << (v4 - 108)) & 0x25) == 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAsset.m", 309, @"Unhandled resource type (%lu) in %s", -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType"), "-[PHPTPAsset isPrimary]");
    }
  }
  return 0;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)createdFilename
{
  return self->_capturedFilename;
}

- (NSString)originalFilename
{
  return self->_fileSystemFilename;
}

- (NSString)filename
{
  return self->_dcfFilename;
}

- (NSString)fullDirectoryPath
{
  int64_t v2 = [(PHPTPAsset *)self url];
  v3 = [v2 URLByDeletingLastPathComponent];
  unint64_t v4 = [v3 path];

  return (NSString *)v4;
}

- (NSString)relatedUUID
{
  return [(PHPTPAssetHandle *)self->_resourceHandle localIdentifier];
}

- (PHPTPAssetHandle)assetHandle
{
  return self->_resourceHandle;
}

- (PHPTPAsset)initWithPTPAsset:(id)a3
{
  unint64_t v4 = (id *)a3;
  v32.receiver = self;
  v32.super_class = (Class)PHPTPAsset;
  v5 = [(PHPTPAsset *)&v32 init];
  int64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_url, v4[30]);
    objc_storeStrong((id *)&v6->_resourceHandle, v4[26]);
    uint64_t v7 = [v4[14] copy];
    captureDateString = v6->_captureDateString;
    v6->_captureDateString = (NSString *)v7;

    uint64_t v9 = [v4[13] copy];
    modificationDateString = v6->_modificationDateString;
    v6->_modificationDateString = (NSString *)v9;

    uint64_t v11 = [v4[4] copy];
    fingerprint = v6->_fingerprint;
    v6->_fingerprint = (NSString *)v11;

    uint64_t v13 = [v4[5] copy];
    originatingAssetID = v6->_originatingAssetID;
    v6->_originatingAssetID = (NSString *)v13;

    objc_storeStrong((id *)&v6->_contentType, v4[23]);
    uint64_t v15 = [v4[29] copy];
    capturedFilename = v6->_capturedFilename;
    v6->_capturedFilename = (NSString *)v15;

    uint64_t v17 = [v4[27] copy];
    dcfFilename = v6->_dcfFilename;
    v6->_dcfFilename = (NSString *)v17;

    uint64_t v19 = [v4[28] copy];
    fileSystemFilename = v6->_fileSystemFilename;
    v6->_fileSystemFilename = (NSString *)v19;

    objc_storeStrong((id *)&v6->_overflowURL, v4[25]);
    uint64_t v21 = [v4 objectCompressedSize];
    objectCompressedSize = v6->_objectCompressedSize;
    v6->_objectCompressedSize = (NSNumber *)v21;

    objc_storeStrong((id *)&v6->_thumbCompressedSize, v4[7]);
    objc_storeStrong((id *)&v6->_thumbOffset, v4[6]);
    v6->_thumbPixSize = (CGSize)*((_OWORD *)v4 + 5);
    uint64_t v23 = [v4[18] copy];
    burstUUID = v6->_burstUUID;
    v6->_burstUUID = (NSString *)v23;

    v6->_burstPicked = *((unsigned char *)v4 + 152);
    v6->_burstFavorite = *((unsigned char *)v4 + 153);
    v6->_burstFirstPicked = *((unsigned char *)v4 + 154);
    v6->_imagePixSize = (CGSize)*((_OWORD *)v4 + 4);
    v6->_desiredOrientation = (int64_t)v4[12];
    uint64_t v25 = [v4[15] copy];
    durationString = v6->_durationString;
    v6->_durationString = (NSString *)v25;

    uint64_t v27 = [v4[16] copy];
    locationString = v6->_locationString;
    v6->_locationString = (NSString *)v27;

    uint64_t v29 = [v4[17] copy];
    groupUUID = v6->_groupUUID;
    v6->_groupUUID = (NSString *)v29;

    v6->_highFrameRateVideo = *((unsigned char *)v4 + 155);
    v6->_timeLapseVideo = *((unsigned char *)v4 + 156);
    v6->_isPartOfLivePhoto = *((unsigned char *)v4 + 248);
    v6->_deleted = *((unsigned char *)v4 + 8);
    v6->_videoCodec = [v4 videoCodec];
    objc_storeStrong((id *)&v6->_contentType, v4[23]);
    v6->_isHDR = *((unsigned char *)v4 + 192);
    v6->_conversionGroup = (int64_t)v4[21];
  }

  return v6;
}

- (PHPTPAsset)initWithPhotosAsset:(id)a3 url:(id)a4 resourceType:(int64_t)a5 orientation:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHPTPAsset;
  int64_t v10 = [(PHPTPAsset *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [PHPTPAssetHandle alloc];
    uint64_t v12 = [v9 localIdentifier];
    uint64_t v13 = [(PHPTPAssetHandle *)v11 initWithResourceType:a5 orientation:v6 localIdentifier:v12 requiresConversion:0];
    resourceHandle = v10->_resourceHandle;
    v10->_resourceHandle = (PHPTPAssetHandle *)v13;
  }
  return v10;
}

- (PHPTPAsset)initWithPhotosAsset:(id)a3 photosResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 privateFileURL];
  id v9 = -[PHPTPAsset initWithPhotosAsset:url:resourceType:orientation:](self, "initWithPhotosAsset:url:resourceType:orientation:", v6, v8, [v7 type], objc_msgSend(v7, "orientation"));

  if (v9)
  {
    uint64_t v10 = [v7 privateFileURL];
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    if (v9->_url)
    {
      uint64_t v12 = [v6 ptpProperties];
      uint64_t v13 = [v12 fingerprint];
      fingerprint = v9->_fingerprint;
      v9->_fingerprint = (NSString *)v13;

      uint64_t v15 = [v6 ptpProperties];
      uint64_t v16 = [v15 originatingAssetIdentifier];
      originatingAssetID = v9->_originatingAssetID;
      v9->_originatingAssetID = (NSString *)v16;

      v18 = (void *)MEMORY[0x1E4F8CDF8];
      uint64_t v19 = [v7 uniformTypeIdentifier];
      uint64_t v20 = [v18 typeWithIdentifier:v19];
      contentType = v9->_contentType;
      v9->_contentType = (UTType *)v20;

      v22 = [v6 ptpProperties];
      [v22 originalFilename];
      v24 = uint64_t v23 = v7;
      uint64_t v25 = v24;
      if (!v24)
      {
        v109 = [v6 ptpProperties];
        uint64_t v25 = [v109 filename];
      }
      v111 = v6;
      v26 = [v6 ptpProperties];
      uint64_t v27 = [v26 dateCreated];
      uint64_t v28 = [v23 fileSize];
      uint64_t v29 = [(PHPTPAssetHandle *)v9->_resourceHandle auxiliaryResourceFilenameMarker];
      v30 = +[PHDCFUtilities dcfCompliantFileNameForFileName:v25 createDate:v27 fileSize:v28 filenameMarker:v29];

      if (!v24)
      {
      }
      uint64_t v31 = [(PHPTPAsset *)v9 _resourceFilenameForFilename:v30 assetResource:v23];
      dcfFilename = v9->_dcfFilename;
      v9->_dcfFilename = (NSString *)v31;

      id v7 = v23;
      id v6 = v111;
      if (v9->_dcfFilename)
      {
        v33 = [(PHPTPAsset *)v9 url];
        uint64_t v34 = [v33 lastPathComponent];
        fileSystemFilename = v9->_fileSystemFilename;
        v9->_fileSystemFilename = (NSString *)v34;

        if ([(PHPTPAsset *)v9 isPrimary])
        {
          v36 = [v23 originalFilename];
          uint64_t v37 = [(PHPTPAsset *)v9 _resourceFilenameForFilename:v36 assetResource:v23];
          capturedFilename = v9->_capturedFilename;
          v9->_capturedFilename = (NSString *)v37;
        }
        else
        {
          v36 = v9->_capturedFilename;
          v9->_capturedFilename = 0;
        }

        v40 = [v111 ptpProperties];
        uint64_t v41 = [v40 dateCreated];

        v42 = [v111 ptpProperties];
        [v42 timeZoneOffset];
        double v44 = v43;

        uint64_t v45 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:(uint64_t)v44];
        v46 = PFStringFromDateTimeZoneFormat();
        objc_storeStrong((id *)&v9->_modificationDateString, v46);
        objc_storeStrong((id *)&v9->_captureDateString, v46);
        uint64_t v47 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "fileSize"));
        objectCompressedSize = v9->_objectCompressedSize;
        v9->_objectCompressedSize = (NSNumber *)v47;

        v107 = v46;
        if ([(PHPTPAsset *)v9 isPrimary])
        {
          v49 = [v111 ptpProperties];
          v50 = [v49 embeddedThumbnailLength];
          uint64_t v51 = [v50 integerValue];
          if (v51) {
            uint64_t v52 = v51;
          }
          else {
            uint64_t v52 = 0x10000;
          }

          uint64_t v53 = [NSNumber numberWithUnsignedLong:v52];
          thumbCompressedSize = v9->_thumbCompressedSize;
          v9->_thumbCompressedSize = (NSNumber *)v53;

          v55 = [v111 ptpProperties];
          v56 = [v55 embeddedThumbnailOffset];
          unint64_t v57 = [v56 integerValue];
          if (v57 <= 1) {
            uint64_t v58 = 1;
          }
          else {
            uint64_t v58 = v57;
          }

          uint64_t v59 = [NSNumber numberWithUnsignedLong:v58];
          thumbOffset = v9->_thumbOffset;
          v9->_thumbOffset = (NSNumber *)v59;

          v61 = [v111 ptpProperties];
          v62 = [v61 embeddedThumbnailWidth];
          CGFloat v63 = (double)(unint64_t)[v62 unsignedIntegerValue];
          v64 = [v111 ptpProperties];
          v65 = [v64 embeddedThumbnailHeight];
          unint64_t v66 = [v65 unsignedIntegerValue];
          v9->_thumbPixSize.double width = v63;
          v9->_thumbPixSize.double height = (double)v66;

          id v6 = v111;
          v67 = [v111 ptpProperties];
          v68 = [v67 burstIdentifier];
          uint64_t v69 = [v68 copy];
          burstUUID = v9->_burstUUID;
          v9->_burstUUID = (NSString *)v69;

          v71 = [v111 ptpProperties];
          v9->_burstPicked = [v71 isBurstPicked];

          v72 = [v111 ptpProperties];
          v9->_burstFavorite = [v72 isBurstFavorite];

          v73 = [v111 ptpProperties];
          v9->_burstFirstPicked = [v73 isBurstFirstPicked];
        }
        else
        {
          v74 = v9->_thumbCompressedSize;
          v9->_thumbCompressedSize = (NSNumber *)&unk_1EEB24900;

          v73 = v9->_thumbOffset;
          v9->_thumbOffset = (NSNumber *)&unk_1EEB24918;
        }

        CGFloat v75 = (double)[v7 pixelWidth];
        uint64_t v76 = [v7 pixelHeight];
        v9->_imagePixSize.double width = v75;
        v9->_imagePixSize.double height = (double)v76;
        v9->_desiredOrientation = [v7 orientation];
        v108 = (void *)v45;
        v110 = (PHPTPAsset *)v41;
        if ([(PHPTPAsset *)v9 isPrimary])
        {
          v77 = [v6 ptpProperties];
          v78 = [v77 originalDuration];
        }
        else
        {
          v79 = NSNumber;
          [v6 duration];
          v78 = objc_msgSend(v79, "numberWithDouble:");
        }
        uint64_t v80 = [v78 stringValue];
        durationString = v9->_durationString;
        v9->_durationString = (NSString *)v80;

        v82 = [v6 ptpProperties];
        v83 = [v82 location];

        [v83 coordinate];
        uint64_t v85 = v84;
        uint64_t v87 = v86;
        v88 = NSString;
        [v83 altitude];
        uint64_t v90 = objc_msgSend(v88, "stringWithFormat:", @"%+f,%+f,%+f", v85, v87, v89);
        locationString = v9->_locationString;
        v9->_locationString = (NSString *)v90;

        v92 = [v6 ptpProperties];
        v93 = [v92 livePhotoPairingIdentifier];
        uint64_t v94 = [v93 copy];
        groupUUID = v9->_groupUUID;
        v9->_groupUUID = (NSString *)v94;

        v96 = [v6 ptpProperties];
        v9->_highFrameRateVideo = [v96 isHighFrameRateVideo];

        v97 = [v6 ptpProperties];
        v9->_timeLapseVideo = [v97 isTimelapseVideo];

        v98 = [v6 ptpProperties];
        v9->_isPartOfLivePhoto = [v98 isLivePhoto];

        v99 = [v6 ptpProperties];
        v9->_isHDR = [v99 isHDR];

        v100 = [v6 ptpProperties];
        v101 = [v100 codec];

        id v102 = v7;
        if (v101) {
          unsigned int v103 = [MEMORY[0x1E4F8CC38] fourCharCodeFromString:v101];
        }
        else {
          unsigned int v103 = 0;
        }
        v9->_videoCodec = v103;
        id v6 = v111;
        v104 = [v111 ptpProperties];
        uint64_t v105 = [v104 ptpTrashedState];
        v9->_deleted = (objc_msgSend((id)objc_opt_class(), "ptpTrashedStateForResourceType:", -[PHPTPAssetHandle resourceType](v9->_resourceHandle, "resourceType")) & v105) != 0;

        id v7 = v102;
        v39 = v110;
      }
      else
      {
        v39 = v9;
        id v9 = 0;
      }
    }
    else
    {
      v30 = v9;
      id v9 = 0;
    }
  }
  return v9;
}

- (id)_resourceFilenameForFilename:(id)a3 assetResource:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 privateFileURL];
    uint64_t v9 = [v8 pathExtension];
    uint64_t v10 = (void *)v9;
    if (v8)
    {
      if (v9)
      {
        uint64_t v11 = [v7 type];
        if (v11 > 107)
        {
          switch(v11)
          {
            case 'q':
              v22 = @"DBG";
              goto LABEL_38;
            case 'n':
              v22 = @"DAT";
              goto LABEL_38;
            case 'l':
              goto LABEL_7;
          }
        }
        else if ((unint64_t)v11 <= 0x14)
        {
          if (((1 << v11) & 0x31F7E) != 0)
          {
LABEL_7:
            uint64_t v12 = [v10 uppercaseString];
            uint64_t v13 = objc_msgSend(v5, "_pl_stringByReplacingPathExtension:", v12);

LABEL_22:
            goto LABEL_23;
          }
          if (((1 << v11) & 0x18E000) != 0)
          {
            uint64_t v16 = PLPTPGetLog();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
              goto LABEL_21;
            }
            int v23 = 134217984;
            uint64_t v24 = [v7 type];
            uint64_t v17 = "Unexpected resource type %ld";
            v18 = v16;
            os_log_type_t v19 = OS_LOG_TYPE_INFO;
            goto LABEL_29;
          }
          if (v11 == 7)
          {
            v22 = @"AAE";
LABEL_38:
            uint64_t v13 = objc_msgSend(v5, "_pl_stringByReplacingPathExtension:", v22);
            goto LABEL_22;
          }
        }
        uint64_t v16 = PLPTPGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          goto LABEL_21;
        }
        int v23 = 134217984;
        uint64_t v24 = [v7 type];
        uint64_t v17 = "Unhandled resource type (%lu)";
        v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_FAULT;
LABEL_29:
        uint32_t v20 = 12;
        goto LABEL_20;
      }
      uint64_t v16 = PLPTPGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v23) = 0;
        uint64_t v17 = "Unexpected nil extension";
        goto LABEL_16;
      }
    }
    else
    {
      int v14 = [v7 isLocallyAvailable];
      uint64_t v15 = PLPTPGetLog();
      uint64_t v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v23) = 0;
          uint64_t v17 = "Unexpected nil privateFileURL";
LABEL_16:
          v18 = v16;
          os_log_type_t v19 = OS_LOG_TYPE_FAULT;
LABEL_19:
          uint32_t v20 = 2;
LABEL_20:
          _os_log_impl(&dword_19B043000, v18, v19, v17, (uint8_t *)&v23, v20);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        uint64_t v17 = "Resource has been pruned, ignoring";
        v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        goto LABEL_19;
      }
    }
LABEL_21:

    uint64_t v13 = 0;
    goto LABEL_22;
  }
  v8 = PLPTPGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_FAULT, "Unexpected nil assetResource", (uint8_t *)&v23, 2u);
  }
  uint64_t v13 = 0;
LABEL_23:

  return v13;
}

@end