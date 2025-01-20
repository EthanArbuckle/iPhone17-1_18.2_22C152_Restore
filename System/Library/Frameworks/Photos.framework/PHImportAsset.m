@interface PHImportAsset
+ (BOOL)directoryExists:(id)a3;
+ (BOOL)fileExists:(id)a3;
+ (BOOL)isOriginalAdjustmentData:(id)a3;
+ (BOOL)isValidAsSidecar:(id)a3;
+ (id)assetFileForURL:(id)a3 source:(id)a4;
+ (id)assetFileForURL:(id)a3 source:(id)a4 withUuid:(id)a5;
+ (id)loadDatesForAssetSequence:(id)a3 atEnd:(id)a4;
+ (id)loadDatesForAssets:(id)a3 atEnd:(id)a4;
+ (void)determineIfTIFFIsRAW:(id)a3 url:(id)a4;
+ (void)logImageDateFileDateDifferencesForAsset:(id)a3;
- (AVAssetImageGenerator)imageGenerator;
- (BOOL)_loadMetadataIfNecessaryForURL:(id)a3 options:(unsigned __int16)a4;
- (BOOL)canDelete;
- (BOOL)canPreserveFolderStructure;
- (BOOL)canReference;
- (BOOL)configureWithContentType:(id)a3 supportedMediaType:(unsigned __int8)a4;
- (BOOL)hasAdjustments;
- (BOOL)hasAudioAttachment;
- (BOOL)hasOriginalResourceType;
- (BOOL)isAVCHD;
- (BOOL)isAdjustmentSecondaryData;
- (BOOL)isAppropriateForUI;
- (BOOL)isAudio;
- (BOOL)isBase;
- (BOOL)isBurst;
- (BOOL)isDeviceAsset;
- (BOOL)isDuplicate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImportAsset:(id)a3;
- (BOOL)isGIF;
- (BOOL)isGrouped;
- (BOOL)isHDR;
- (BOOL)isHEIF;
- (BOOL)isImage;
- (BOOL)isJPEG;
- (BOOL)isJPEG2000;
- (BOOL)isJpegPlusRAW;
- (BOOL)isLivePhoto;
- (BOOL)isMovie;
- (BOOL)isOriginalAdjustmentData;
- (BOOL)isPDF;
- (BOOL)isPNG;
- (BOOL)isPSD;
- (BOOL)isPrimary;
- (BOOL)isRAW;
- (BOOL)isRender;
- (BOOL)isRepresentation;
- (BOOL)isSDOF;
- (BOOL)isSidecar;
- (BOOL)isSloMo;
- (BOOL)isSpatialOverCapture;
- (BOOL)isTIFF;
- (BOOL)isTagged;
- (BOOL)isTimelapse;
- (BOOL)isValidForReference;
- (BOOL)isVideoComplementOf:(id)a3;
- (BOOL)isViewable;
- (BOOL)performAdditionalLivePhotoChecksOnImageAsset:(id)a3;
- (BOOL)shouldPreserveUUID;
- (BOOL)sidecarsLoaded;
- (BOOL)treatAsUnsupportedRAW;
- (CGImage)avThumbnailOfSize:(unint64_t)a3 canceler:(id)a4 error:(id *)a5;
- (CGImage)imageThumbnailOfSize:(unint64_t)a3 canceler:(id)a4 error:(id *)a5;
- (CGImage)removeBlackBarsFromExifThumbnail:(CGImage *)a3 fullSize:(CGSize)a4;
- (CGSize)cgImageSize;
- (CGSize)cropEXIFThumbSize:(CGSize)result originalSize:(CGSize)a4;
- (CGSize)exifPixelSize;
- (CGSize)imageSize;
- (CGSize)orientedPixelSize;
- (CGSize)thumbnailSize;
- (CGSize)transformedPixelSize;
- (NSArray)sidecarAssets;
- (NSData)fileData;
- (NSDate)creationDate;
- (NSDate)dateKey;
- (NSDate)fileCreationDate;
- (NSDate)fileModificationDate;
- (NSDate)lastDuplicateCheck;
- (NSDictionary)customAssetProperties;
- (NSMutableArray)relatedBurstAssets;
- (NSMutableDictionary)duplicates;
- (NSMutableDictionary)sidecarAssetsByType;
- (NSNumber)bitrate;
- (NSNumber)digitalZoomRatio;
- (NSNumber)durationTimeInterval;
- (NSNumber)exposureBias;
- (NSNumber)exposureTime;
- (NSNumber)fNumber;
- (NSNumber)flashFired;
- (NSNumber)focalLength;
- (NSNumber)focalLengthIn35mm;
- (NSNumber)fps;
- (NSNumber)iso;
- (NSNumber)meteringMode;
- (NSNumber)sampleRate;
- (NSNumber)trackFormat;
- (NSNumber)whiteBalance;
- (NSObject)redactedFileNameDescription;
- (NSSet)duplicateAssets;
- (NSSet)keywordTitles;
- (NSString)accessibilityDescription;
- (NSString)assetDescription;
- (NSString)burstUUID;
- (NSString)cameraMake;
- (NSString)cameraModel;
- (NSString)codec;
- (NSString)createdFileName;
- (NSString)description;
- (NSString)fileExtension;
- (NSString)fileName;
- (NSString)formattedCameraModel;
- (NSString)importIdentifier;
- (NSString)lensModel;
- (NSString)parentFolderPath;
- (NSString)title;
- (NSString)uuid;
- (NSTimeZone)timeZone;
- (NSURL)securityScopedURL;
- (NSURL)url;
- (OS_dispatch_queue)loadSidecars;
- (PFMetadata)metadata;
- (PHImportAsset)audioAsset;
- (PHImportAsset)base;
- (PHImportAsset)burstPick;
- (PHImportAsset)initWithSource:(id)a3;
- (PHImportAsset)initWithSource:(id)a3 url:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6 uuid:(id)a7;
- (PHImportAsset)largeMovieRender;
- (PHImportAsset)largeRender;
- (PHImportAsset)miniRender;
- (PHImportAsset)rawAsset;
- (PHImportAsset)spatialOverCapture;
- (PHImportAsset)thumbnailRender;
- (PHImportAsset)videoComplement;
- (PHImportAssetFilePresenter)filePresenter;
- (PHImportSource)source;
- (UTType)contentType;
- (id)adjustmentSecondarySidecar;
- (id)adjustmentSidecar;
- (id)avchdAssetId;
- (id)basenameForOriginalAdjustmentData;
- (id)checkForSidecarWithExtension:(id)a3;
- (id)copyFromURL:(id)a3 toURL:(id)a4;
- (id)descriptionWithPrefix:(id)a3;
- (id)duplicateAssetsForLibrary:(id)a3;
- (id)fingerprint;
- (id)groupingUUID;
- (id)importRecordForPrimaryAsset;
- (id)livePhotoPairingIdentifier;
- (id)makeImportIdentifier;
- (id)originalAdjustmentSidecar;
- (id)originatingAssetID;
- (id)relatedAssets;
- (id)resourceTypes;
- (id)sidecarInfoDictionaries;
- (id)sidecarInfoDictionary;
- (id)sizeKey;
- (id)slmSidecar;
- (id)spatialOverCaptureIdentifier;
- (id)stripMarkerFromName:(id)a3 markerLocation:(unint64_t)a4;
- (id)thumbnailForSize:(unint64_t)a3 atEnd:(id)a4;
- (id)thumbnailForSize:(unint64_t)a3 priority:(unsigned __int8)a4 atEnd:(id)a5;
- (id)userInfo;
- (id)userMetadata;
- (id)validateMetadataForImportRecord:(id)a3;
- (id)xmpSidecar;
- (int)burstPickType;
- (int64_t)resourceType;
- (unint64_t)approximateBytesRequiredToImport;
- (unint64_t)assetSizeIncludingRelatedAssets;
- (unint64_t)cachedHash;
- (unint64_t)copyMethod;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (unint64_t)relatedBytes;
- (unint64_t)resourceSubType;
- (unint64_t)sidecarAssetBytes;
- (unsigned)duplicateStateConfidence;
- (unsigned)fileLocation;
- (unsigned)orientation;
- (void)_accessMetadata:(id)a3;
- (void)_addRelatedRecordsToRecord:(id)a3 primaryRecord:(id)a4;
- (void)_loadSidecarFiles;
- (void)_setMetadata:(id)a3;
- (void)addBurstAsset:(id)a3;
- (void)addSidecarAsset:(id)a3;
- (void)configureSidecarTypeForExtension:(id)a3;
- (void)copyToURL:(id)a3 completionHandler:(id)a4;
- (void)loadMetadataAsync:(id)a3;
- (void)loadMetadataSync;
- (void)loadSidecarFiles;
- (void)removeSidecarAsset:(id)a3;
- (void)setAudioAsset:(id)a3;
- (void)setBase:(id)a3;
- (void)setBurstPick:(id)a3;
- (void)setCachedHash:(unint64_t)a3;
- (void)setContentType:(id)a3;
- (void)setCopyMethod:(unint64_t)a3;
- (void)setCreatedFileName:(id)a3;
- (void)setCustomAssetProperties:(id)a3;
- (void)setDuplicateStateConfidence:(unsigned __int8)a3;
- (void)setDuplicates:(id)a3;
- (void)setDuplicates:(id)a3 forLibrary:(id)a4;
- (void)setFileCreationDate:(id)a3;
- (void)setFileData:(id)a3;
- (void)setFileExtension:(id)a3;
- (void)setFileLocation:(unsigned __int8)a3;
- (void)setFileModificationDate:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFilePresenter:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setImageGenerator:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImportIdentifier:(id)a3;
- (void)setIsDuplicate:(BOOL)a3;
- (void)setLargeMovieRender:(id)a3;
- (void)setLargeRender:(id)a3;
- (void)setLastDuplicateCheck:(id)a3;
- (void)setLoadSidecars:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMiniRender:(id)a3;
- (void)setRawAsset:(id)a3;
- (void)setRelatedBurstAssets:(id)a3;
- (void)setResourceSubType:(unint64_t)a3;
- (void)setResourceType:(int64_t)a3;
- (void)setSidecarAssetsByType:(id)a3;
- (void)setSidecarsLoaded:(BOOL)a3;
- (void)setSpatialOverCapture:(id)a3;
- (void)setThumbnailRender:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setTreatAsUnsupportedRAW:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserMetadata:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVideoComplement:(id)a3;
- (void)takeAsVideoComplement:(id)a3;
- (void)thumbnailUsingRequest:(id)a3 atEnd:(id)a4;
- (void)updateIsRAW:(BOOL)a3 contentType:(id)a4;
@end

@implementation PHImportAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAssetProperties, 0);
  objc_storeStrong((id *)&self->_sidecarAssetsByType, 0);
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_filePresenter, 0);
  objc_storeStrong((id *)&self->_importIdentifier, 0);
  objc_storeStrong((id *)&self->_loadSidecars, 0);
  objc_storeStrong((id *)&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_fileModificationDate, 0);
  objc_storeStrong((id *)&self->_fileCreationDate, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_miniRender, 0);
  objc_storeStrong((id *)&self->_thumbnailRender, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_spatialOverCapture, 0);
  objc_storeStrong((id *)&self->_largeMovieRender, 0);
  objc_storeStrong((id *)&self->_largeRender, 0);
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_duplicateAssets, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_createdFileName, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_lastDuplicateCheck, 0);
  objc_storeStrong((id *)&self->_duplicates, 0);
  objc_storeStrong(&self->_avchdAssetId, 0);
  objc_storeStrong((id *)&self->_burstPick, 0);
  objc_storeStrong((id *)&self->_relatedBurstAssets, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_basenameForOriginalAdjustment, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_userMetadata, 0);
  objc_storeStrong((id *)&self->_strongSource, 0);

  objc_destroyWeak((id *)&self->_source);
}

- (void)setCustomAssetProperties:(id)a3
{
}

- (NSDictionary)customAssetProperties
{
  return self->_customAssetProperties;
}

- (void)setSidecarAssetsByType:(id)a3
{
}

- (NSMutableDictionary)sidecarAssetsByType
{
  return self->_sidecarAssetsByType;
}

- (void)setResourceSubType:(unint64_t)a3
{
  self->_resourceSubType = a3;
}

- (unint64_t)resourceSubType
{
  return self->_resourceSubType;
}

- (void)setResourceType:(int64_t)a3
{
  self->_resourceType = a3;
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (PHImportSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (PHImportSource *)WeakRetained;
}

- (void)setFileLocation:(unsigned __int8)a3
{
  self->_fileLocation = a3;
}

- (unsigned)fileLocation
{
  return self->_fileLocation;
}

- (void)setFileData:(id)a3
{
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setCopyMethod:(unint64_t)a3
{
  self->_copyMethod = a3;
}

- (unint64_t)copyMethod
{
  return self->_copyMethod;
}

- (void)setCachedHash:(unint64_t)a3
{
  self->_cachedHash = a3;
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void)setFilePresenter:(id)a3
{
}

- (PHImportAssetFilePresenter)filePresenter
{
  return self->_filePresenter;
}

- (void)setImportIdentifier:(id)a3
{
}

- (void)setSidecarsLoaded:(BOOL)a3
{
  self->_sidecarsLoaded = a3;
}

- (BOOL)sidecarsLoaded
{
  return self->_sidecarsLoaded;
}

- (void)setLoadSidecars:(id)a3
{
}

- (OS_dispatch_queue)loadSidecars
{
  return self->_loadSidecars;
}

- (void)setImageGenerator:(id)a3
{
}

- (AVAssetImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTreatAsUnsupportedRAW:(BOOL)a3
{
  self->_treatAsUnsupportedRAW = a3;
}

- (BOOL)treatAsUnsupportedRAW
{
  return self->_treatAsUnsupportedRAW;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFileModificationDate:(id)a3
{
}

- (NSDate)fileModificationDate
{
  return self->_fileModificationDate;
}

- (void)setFileCreationDate:(id)a3
{
}

- (NSDate)fileCreationDate
{
  return self->_fileCreationDate;
}

- (PHImportAsset)audioAsset
{
  return self->_audioAsset;
}

- (void)setMiniRender:(id)a3
{
}

- (PHImportAsset)miniRender
{
  return self->_miniRender;
}

- (void)setThumbnailRender:(id)a3
{
}

- (PHImportAsset)thumbnailRender
{
  return self->_thumbnailRender;
}

- (PHImportAsset)base
{
  return self->_base;
}

- (PHImportAsset)spatialOverCapture
{
  return self->_spatialOverCapture;
}

- (PHImportAsset)largeMovieRender
{
  return self->_largeMovieRender;
}

- (PHImportAsset)largeRender
{
  return self->_largeRender;
}

- (PHImportAsset)videoComplement
{
  return self->_videoComplement;
}

- (PHImportAsset)rawAsset
{
  return self->_rawAsset;
}

- (NSSet)duplicateAssets
{
  return self->_duplicateAssets;
}

- (void)setFileExtension:(id)a3
{
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setCreatedFileName:(id)a3
{
}

- (NSString)createdFileName
{
  return self->_createdFileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setContentType:(id)a3
{
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setLastDuplicateCheck:(id)a3
{
}

- (NSDate)lastDuplicateCheck
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDuplicates:(id)a3
{
}

- (NSMutableDictionary)duplicates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIsDuplicate:(BOOL)a3
{
  self->_isDuplicate = a3;
}

- (BOOL)isDuplicate
{
  return self->_isDuplicate;
}

- (id)avchdAssetId
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setBurstPick:(id)a3
{
}

- (PHImportAsset)burstPick
{
  return self->_burstPick;
}

- (void)setRelatedBurstAssets:(id)a3
{
}

- (NSMutableArray)relatedBurstAssets
{
  return self->_relatedBurstAssets;
}

- (void)setDuplicateStateConfidence:(unsigned __int8)a3
{
  self->_duplicateStateConfidence = a3;
}

- (unsigned)duplicateStateConfidence
{
  return self->_duplicateStateConfidence;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (BOOL)isEqualToImportAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PHImportAsset *)self hash];
  if (v5 == [v4 hash])
  {
    v6 = [(PHImportAsset *)self relatedAssets];
    v7 = [v4 relatedAssets];
    uint64_t v8 = [v6 count];
    if (v8 == [v7 count] && objc_msgSend(v6, "count"))
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [v6 objectAtIndexedSubscript:v9];
        v11 = [v7 objectAtIndexedSubscript:v9];
        char v12 = [v10 isEqual:v11];

        if ((v12 & 1) == 0) {
          break;
        }
        ++v9;
      }
      while (v9 < [v6 count]);
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHImportAsset *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PHImportAsset *)self isEqualToImportAsset:v5];

  return v6;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

void __21__PHImportAsset_hash__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[37])
  {
    id v6 = [v2 fileName];
    uint64_t v3 = [v6 hash];
    uint64_t v4 = [*(id *)(a1 + 32) fileSize] + v3;
    unint64_t v5 = [*(id *)(a1 + 32) creationDate];
    *(void *)(*(void *)(a1 + 32) + 296) = v4 + [v5 hash];
  }
}

- (void)setUserMetadata:(id)a3
{
}

- (id)userMetadata
{
  return self->_userMetadata;
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (id)duplicateAssetsForLibrary:(id)a3
{
  duplicates = self->_duplicates;
  id v4 = a3;
  unint64_t v5 = [v4 uuid];
  id v6 = [(NSMutableDictionary *)duplicates objectForKeyedSubscript:v5];
  v7 = [v6 valueForKey:@"objectID"];

  uint64_t v8 = [v4 fetchPHObjectsForOIDs:v7];

  return v8;
}

- (void)setDuplicates:(id)a3 forLibrary:(id)a4
{
}

- (id)sizeKey
{
  v2 = NSNumber;
  unint64_t v3 = [(PHImportAsset *)self fileSize];

  return (id)[v2 numberWithUnsignedLongLong:v3];
}

- (NSDate)dateKey
{
  unint64_t v3 = [(PHImportAsset *)self creationDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PHImportAsset *)self fileCreationDate];
  }
  id v6 = v5;

  return (NSDate *)v6;
}

- (NSString)accessibilityDescription
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6586;
  unint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PHImportAsset_accessibilityDescription__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __41__PHImportAsset_accessibilityDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) artworkContentDescription];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)assetDescription
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6586;
  unint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PHImportAsset_assetDescription__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __33__PHImportAsset_assetDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) captionAbstract];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSSet)keywordTitles
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6586;
  unint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__PHImportAsset_keywordTitles__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

void __30__PHImportAsset_keywordTitles__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 72) keywords];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (NSString)title
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6586;
  unint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__PHImportAsset_title__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __22__PHImportAsset_title__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSTimeZone)timeZone
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6586;
  unint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__PHImportAsset_timeZone__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSTimeZone *)v2;
}

void __25__PHImportAsset_timeZone__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) timeZone];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDate)creationDate
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6586;
  unint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_creationDate__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

void __29__PHImportAsset_creationDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) utcCreationDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)originatingAssetID
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6586;
  unint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PHImportAsset_originatingAssetID__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__PHImportAsset_originatingAssetID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) originatingAssetIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fingerprint
{
  return 0;
}

- (void)copyToURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, void))a4;
  uint64_t v8 = [(PHImportAsset *)self filePresenter];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6586;
  v24 = __Block_byref_object_dispose__6587;
  id v25 = 0;
  if (v8)
  {
    [MEMORY[0x1E4F28CA0] addFilePresenter:v8];
    unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:v8];
    id v10 = [(PHImportAsset *)self url];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__PHImportAsset_copyToURL_completionHandler___block_invoke;
    v18[3] = &unk_1E5842B38;
    v18[5] = &v20;
    id v19 = 0;
    v18[4] = self;
    [v9 coordinateReadingItemAtURL:v10 options:1 writingItemAtURL:v6 options:0 error:&v19 byAccessor:v18];
    id v11 = v19;

    if (v11)
    {
      char v12 = [PHImportException alloc];
      v13 = [(PHImportAsset *)self url];
      v14 = [v13 path];
      uint64_t v15 = [(PHImportException *)v12 initWithType:0 path:v14 underlyingError:v11 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m" line:1826];
      v16 = (void *)v21[5];
      v21[5] = v15;
    }
    [MEMORY[0x1E4F28CA0] removeFilePresenter:v8];
  }
  else
  {
    id v11 = [(PHImportAsset *)self url];
    id v17 = [(PHImportAsset *)self copyFromURL:v11 toURL:v6];
    unint64_t v9 = (void *)v21[5];
    v21[5] = (uint64_t)v17;
  }

  v7[2](v7, v6, v21[5]);
  _Block_object_dispose(&v20, 8);
}

void __45__PHImportAsset_copyToURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) copyFromURL:a2 toURL:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)copyFromURL:(id)a3 toURL:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v6 defaultManager];
  id v17 = 0;
  char v10 = [v9 copyItemAtURL:v8 toURL:v7 error:&v17];

  id v11 = v17;
  char v12 = 0;
  if ((v10 & 1) == 0)
  {
    v13 = [PHImportException alloc];
    v14 = [(PHImportAsset *)self url];
    uint64_t v15 = [v14 path];
    char v12 = [(PHImportException *)v13 initWithType:0 path:v15 underlyingError:v11 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m" line:1810];
  }
  return v12;
}

- (void)_addRelatedRecordsToRecord:(id)a3 primaryRecord:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHImportAsset *)self largeRender];

  if (v8)
  {
    unint64_t v9 = [PHImportRecord alloc];
    char v10 = [(PHImportAsset *)self largeRender];
    id v11 = [(PHImportRecord *)v9 initWithImportAsset:v10];

    [v6 addRelatedRecord:v11];
    char v12 = [(PHImportAsset *)self largeRender];
    [v12 _addRelatedRecordsToRecord:v11 primaryRecord:v7];
  }
  v13 = [(PHImportAsset *)self largeMovieRender];

  if (v13)
  {
    v14 = [PHImportRecord alloc];
    uint64_t v15 = [(PHImportAsset *)self largeMovieRender];
    v16 = [(PHImportRecord *)v14 initWithImportAsset:v15];

    [v6 addRelatedRecord:v16];
    id v17 = [(PHImportAsset *)self largeMovieRender];
    [v17 _addRelatedRecordsToRecord:v16 primaryRecord:v7];
  }
  v18 = [(PHImportAsset *)self rawAsset];

  if (v18)
  {
    id v19 = [PHImportRecord alloc];
    uint64_t v20 = [(PHImportAsset *)self rawAsset];
    v21 = [(PHImportRecord *)v19 initWithImportAsset:v20];

    [v6 addRelatedRecord:v21];
    uint64_t v22 = [(PHImportAsset *)self rawAsset];
    [v22 _addRelatedRecordsToRecord:v21 primaryRecord:v7];
  }
  v23 = [(PHImportAsset *)self videoComplement];

  if (v23)
  {
    v24 = [PHImportRecord alloc];
    id v25 = [(PHImportAsset *)self videoComplement];
    v26 = [(PHImportRecord *)v24 initWithImportAsset:v25];

    [v6 addRelatedRecord:v26];
    v27 = [(PHImportAsset *)self videoComplement];
    [v27 _addRelatedRecordsToRecord:v26 primaryRecord:v7];
  }
  v28 = [(PHImportAsset *)self audioAsset];

  if (v28)
  {
    v29 = [PHImportRecord alloc];
    v30 = [(PHImportAsset *)self audioAsset];
    v31 = [(PHImportRecord *)v29 initWithImportAsset:v30];

    [v6 addRelatedRecord:v31];
    v32 = [(PHImportAsset *)self audioAsset];
    [v32 _addRelatedRecordsToRecord:v31 primaryRecord:v7];
  }
  v33 = [(PHImportAsset *)self spatialOverCapture];

  if (v33)
  {
    v34 = [PHImportRecord alloc];
    v35 = [(PHImportAsset *)self spatialOverCapture];
    v36 = [(PHImportRecord *)v34 initWithImportAsset:v35];

    [v6 addRelatedRecord:v36];
    v37 = [(PHImportAsset *)self spatialOverCapture];
    [v37 _addRelatedRecordsToRecord:v36 primaryRecord:v7];
  }
  v38 = [(PHImportAsset *)self base];

  if (v38)
  {
    v39 = [PHImportRecord alloc];
    v40 = [(PHImportAsset *)self base];
    v41 = [(PHImportRecord *)v39 initWithImportAsset:v40];

    [v6 addRelatedRecord:v41];
    v42 = [(PHImportAsset *)self base];
    [v42 _addRelatedRecordsToRecord:v41 primaryRecord:v7];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v43 = [(PHImportAsset *)self sidecarAssets];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v50;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v50 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = [[PHImportRecord alloc] initWithImportAsset:*(void *)(*((void *)&v49 + 1) + 8 * v47)];
        [v6 addRelatedRecord:v48];

        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = [v43 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v45);
  }
}

- (id)importRecordForPrimaryAsset
{
  uint64_t v3 = [[PHImportRecord alloc] initWithImportAsset:self];
  [(PHImportAsset *)self loadSidecarFiles];
  [(PHImportAsset *)self _addRelatedRecordsToRecord:v3 primaryRecord:v3];
  uint64_t v4 = [(PHImportRecord *)v3 importAsset];
  uint64_t v5 = [v4 resourceTypes];
  BOOL v6 = +[PHAssetCreationRequest supportsImportAssetResourceTypes:v5];

  if (v6)
  {
    if (![v4 isDuplicate] || !objc_msgSend(v4, "isBurst")) {
      goto LABEL_7;
    }
    id v7 = [v4 fileName];
    id v8 = [(PHImportExceptionRecorder *)v3 addExceptionWithType:4 path:v7 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m" line:1755];
  }
  else
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    char v10 = [v4 resourceTypes];
    id v11 = PHDescriptionsForResourceTypes(v10);
    char v12 = [v11 componentsJoinedByString:@","];
    id v7 = objc_msgSend(v9, "ph_genericErrorWithLocalizedDescription:", @"Unsupported resource set: %@", v12);

    v13 = [v4 fileName];
    id v14 = [(PHImportExceptionRecorder *)v3 addExceptionWithType:0 path:v13 underlyingError:v7 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m" line:1752];
  }
LABEL_7:
  uint64_t v15 = [(PHImportAsset *)self metadata];
  [v15 orientedPixelSize];
  double v17 = v16;
  double v19 = v18;

  if (v19 <= v17) {
    unsigned int v20 = 3;
  }
  else {
    unsigned int v20 = 2;
  }
  if (v17 > v19) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
  uint64_t v22 = [(PHImportRecord *)v3 timers];
  [v22 setAspectRatio:v21];

  return v3;
}

- (id)sidecarInfoDictionaries
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(PHImportAsset *)self relatedAssets];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  BOOL v6 = [(PHImportAsset *)self largeRender];

  if (v6)
  {
    id v7 = [(PHImportAsset *)self largeRender];
    id v8 = [v7 sidecarInfoDictionary];
    [v5 addObject:v8];

    unint64_t v9 = [(PHImportAsset *)self largeRender];
    char v10 = [v9 sidecarInfoDictionaries];
    [v5 addObjectsFromArray:v10];
  }
  id v11 = [(PHImportAsset *)self rawAsset];

  if (v11)
  {
    char v12 = [(PHImportAsset *)self rawAsset];
    v13 = [v12 sidecarInfoDictionary];
    [v5 addObject:v13];

    id v14 = [(PHImportAsset *)self rawAsset];
  }
  else
  {
    uint64_t v15 = [(PHImportAsset *)self videoComplement];

    if (!v15) {
      goto LABEL_8;
    }
    double v16 = [(PHImportAsset *)self videoComplement];
    double v17 = [v16 sidecarInfoDictionary];
    [v5 addObject:v17];

    id v14 = [(PHImportAsset *)self videoComplement];
  }
  double v18 = v14;
  double v19 = [v14 sidecarInfoDictionaries];
  [v5 addObjectsFromArray:v19];

LABEL_8:
  unsigned int v20 = [(PHImportAsset *)self audioAsset];

  if (v20)
  {
    uint64_t v21 = [(PHImportAsset *)self audioAsset];
    uint64_t v22 = [v21 sidecarInfoDictionary];
    [v5 addObject:v22];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v23 = self;
  v24 = objc_msgSend(v23, "sidecarAssets", 0);

  uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [*(id *)(*((void *)&v31 + 1) + 8 * i) sidecarInfoDictionary];
        [v5 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v26);
  }

  return v5;
}

- (id)sidecarInfoDictionary
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  uint64_t v4 = [(PHImportAsset *)self fileName];

  if (v4)
  {
    uint64_t v5 = [(PHImportAsset *)self fileName];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F8B820]];
  }
  BOOL v6 = [(PHImportAsset *)self createdFileName];

  if (v6)
  {
    id v7 = [(PHImportAsset *)self createdFileName];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F8B818]];
  }
  id v8 = [(PHImportAsset *)self creationDate];

  if (v8)
  {
    unint64_t v9 = [(PHImportAsset *)self creationDate];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F8B810]];
  }
  char v10 = [(PHImportAsset *)self fileModificationDate];

  if (v10)
  {
    id v11 = [(PHImportAsset *)self fileModificationDate];
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F8B828]];
  }
  char v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PHImportAsset fileSize](self, "fileSize"));
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F8B830]];

  return v3;
}

- (id)resourceTypes
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:11];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
  [v3 addObject:v4];

  uint64_t v5 = [(PHImportAsset *)self rawAsset];

  if (v5)
  {
    BOOL v6 = NSNumber;
    id v7 = [(PHImportAsset *)self rawAsset];
    id v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "resourceType"));
    [v3 addObject:v8];
  }
  unint64_t v9 = [(PHImportAsset *)self videoComplement];

  if (v9)
  {
    char v10 = NSNumber;
    id v11 = [(PHImportAsset *)self videoComplement];
    char v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "resourceType"));
    [v3 addObject:v12];
  }
  v13 = [(PHImportAsset *)self largeRender];

  if (v13)
  {
    id v14 = NSNumber;
    uint64_t v15 = [(PHImportAsset *)self largeRender];
    double v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "resourceType"));
    [v3 addObject:v16];

    double v17 = [(PHImportAsset *)self largeRender];
    double v18 = [v17 videoComplement];

    if (v18)
    {
      double v19 = NSNumber;
      unsigned int v20 = [(PHImportAsset *)self largeRender];
      uint64_t v21 = [v20 videoComplement];
      uint64_t v22 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v21, "resourceType"));
      [v3 addObject:v22];
    }
  }
  v23 = [(PHImportAsset *)self audioAsset];

  if (v23)
  {
    v24 = NSNumber;
    uint64_t v25 = [(PHImportAsset *)self audioAsset];
    uint64_t v26 = objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "resourceType"));
    [v3 addObject:v26];
  }
  uint64_t v27 = [(PHImportAsset *)self largeMovieRender];

  if (v27)
  {
    v28 = NSNumber;
    v29 = [(PHImportAsset *)self largeMovieRender];
    v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "resourceType"));
    [v3 addObject:v30];
  }
  long long v31 = [(PHImportAsset *)self spatialOverCapture];

  if (v31)
  {
    long long v32 = NSNumber;
    long long v33 = [(PHImportAsset *)self spatialOverCapture];
    long long v34 = objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "resourceType"));
    [v3 addObject:v34];

    v35 = [(PHImportAsset *)self spatialOverCapture];
    uint64_t v36 = [v35 videoComplement];

    if (v36)
    {
      v37 = NSNumber;
      v38 = [(PHImportAsset *)self spatialOverCapture];
      v39 = [v38 videoComplement];
      v40 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v39, "resourceType"));
      [v3 addObject:v40];
    }
  }
  v41 = [(PHImportAsset *)self base];

  if (v41)
  {
    v42 = NSNumber;
    v43 = [(PHImportAsset *)self base];
    uint64_t v44 = objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "resourceType"));
    [v3 addObject:v44];

    uint64_t v45 = [(PHImportAsset *)self base];
    uint64_t v46 = [v45 videoComplement];

    if (v46)
    {
      uint64_t v47 = NSNumber;
      v48 = [(PHImportAsset *)self base];
      long long v49 = [v48 videoComplement];
      long long v50 = objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v49, "resourceType"));
      [v3 addObject:v50];
    }
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v51 = [(PHImportAsset *)self sidecarAssets];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * i), "resourceType"));
        [v3 addObject:v56];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v53);
  }

  return v3;
}

- (BOOL)hasOriginalResourceType
{
  unint64_t v2 = [(PHImportAsset *)self resourceType];
  return (v2 < 0x11) & (0x1E21Eu >> v2);
}

- (id)validateMetadataForImportRecord:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PHImportAsset *)self isSidecar])
  {
    uint64_t v5 = 0;
    goto LABEL_19;
  }
  BOOL v6 = [(PHImportAsset *)self url];
  if (v6) {
    goto LABEL_4;
  }
  char v10 = [v4 downloadedPath];
  if (!v10) {
    goto LABEL_14;
  }
  id v11 = (void *)MEMORY[0x1E4F1CB10];
  char v12 = [v4 downloadedPath];
  BOOL v6 = [v11 fileURLWithPath:v12];

  if (v6)
  {
LABEL_4:
    if (![(PHImportAsset *)self _loadMetadataIfNecessaryForURL:v6 options:22])
    {
      id v7 = PLImportGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [(PHImportAsset *)self redactedFileNameDescription];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to get ImageIO metadata for file %@", (uint8_t *)&buf, 0xCu);
      }
      unint64_t v9 = [v6 path];
      uint64_t v5 = [v4 addExceptionWithType:2 path:v9 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m" line:1630];

      goto LABEL_18;
    }
    if ([(PHImportAsset *)self isImage] && ![(PHImportAsset *)self isRAW])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v18 = 0x2020000000;
      char v19 = 1;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __49__PHImportAsset_validateMetadataForImportRecord___block_invoke;
      v16[3] = &unk_1E5848D28;
      v16[4] = self;
      v16[5] = &buf;
      [(PHImportAsset *)self _accessMetadata:v16];
      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v15 = [v6 path];
        uint64_t v5 = [v4 addExceptionWithType:2 path:v15 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m" line:1625];
      }
      _Block_object_dispose(&buf, 8);
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
    v13 = PLImportGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "self.url and record.downloadedPath are nil", (uint8_t *)&buf, 2u);
    }

    BOOL v6 = 0;
  }
  uint64_t v5 = 0;
LABEL_18:

LABEL_19:

  return v5;
}

uint64_t __49__PHImportAsset_validateMetadataForImportRecord___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) exifPixelSize];
  BOOL v4 = v3 != *MEMORY[0x1E4F1DB30];
  if (v5 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    BOOL v4 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (BOOL)_loadMetadataIfNecessaryForURL:(id)a3 options:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (v6)
  {
    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x3032000000;
    char v19 = __Block_byref_object_copy__6586;
    uint64_t v20 = __Block_byref_object_dispose__6587;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__PHImportAsset__loadMetadataIfNecessaryForURL_options___block_invoke;
    v15[3] = &unk_1E5848D28;
    v15[4] = self;
    v15[5] = &v16;
    [(PHImportAsset *)self _accessMetadata:v15];
    char v7 = [(id)v17[5] isSameForURL:v6 andOptions:v4];
    id v8 = [(id)v17[5] timeZoneLookup];
    if (v7)
    {
      BOOL v9 = 0;
    }
    else
    {
      char v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithMediaURL:v6 options:v4 timeZoneLookup:v8 shouldCache:0];
      BOOL v9 = v10 != 0;
      if (v10) {
        [(PHImportAsset *)self setMetadata:v10];
      }
    }
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v9 = 1;
  }
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  LOBYTE(v19) = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PHImportAsset__loadMetadataIfNecessaryForURL_options___block_invoke_2;
  v13[3] = &unk_1E5842B10;
  v13[4] = self;
  v13[5] = &v16;
  BOOL v14 = v9;
  [(PHImportAsset *)self _accessMetadata:v13];
  char v11 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __56__PHImportAsset__loadMetadataIfNecessaryForURL_options___block_invoke(uint64_t a1)
{
}

uint64_t __56__PHImportAsset__loadMetadataIfNecessaryForURL_options___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 72);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(result + 48) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (CGImage)avThumbnailOfSize:(unint64_t)a3 canceler:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (([v7 isCanceled] & 1) != 0 || -[PHImportAsset isAudio](self, "isAudio")) {
    goto LABEL_25;
  }
  id v8 = (void *)MEMORY[0x1E4F166C8];
  BOOL v9 = [(PHImportAsset *)self url];
  char v10 = [v8 URLAssetWithURL:v9 options:0];

  char v11 = (void *)MEMORY[0x1E4F16558];
  char v12 = [v10 commonMetadata];
  v13 = [v11 metadataItemsFromArray:v12 withKey:*MEMORY[0x1E4F15C98] keySpace:*MEMORY[0x1E4F15DE0]];

  if ([v13 count])
  {
    if (([v7 isCanceled] & 1) == 0)
    {
      BOOL v14 = [v13 objectAtIndexedSubscript:0];
      uint64_t v15 = CGDataProviderCreateWithCFData((CFDataRef)[v14 dataValue]);

      CGImageRef v16 = CGImageCreateWithJPEGDataProvider(v15, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v15);
      goto LABEL_23;
    }
LABEL_22:

LABEL_25:
    v38 = 0;
    goto LABEL_26;
  }
  double v17 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v10];
  objc_initWeak(&location, v7);
  [v17 setAppliesPreferredTrackTransform:1];
  uint64_t v18 = [MEMORY[0x1E4F8CC38] mainVideoTrackForAsset:v10];
  [v18 naturalSize];
  double v20 = v19;
  double v22 = v21;
  if (v18)
  {
    [v18 preferredTransform];
    double v23 = *((double *)&v45 + 1);
    double v24 = *(double *)&v45;
    double v25 = *((double *)&v46 + 1);
    double v26 = *(double *)&v46;
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    double v25 = 0.0;
    double v23 = 0.0;
    double v26 = 0.0;
    double v24 = 0.0;
  }
  double v27 = v22 * v26 + v24 * v20;
  double v28 = v22 * v25 + v23 * v20;
  double v29 = (double)a3;
  BOOL v30 = v27 <= v28;
  double v31 = v27 * (double)a3 / v28;
  double v32 = v28 * (double)a3 / v27;
  if (v30) {
    double v33 = v31;
  }
  else {
    double v33 = (double)a3;
  }
  if (!v30) {
    double v29 = v32;
  }
  objc_msgSend(v17, "setMaximumSize:", v33, v29);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __50__PHImportAsset_avThumbnailOfSize_canceler_error___block_invoke;
  v42[3] = &unk_1E5844CF8;
  id v34 = v17;
  id v43 = v34;
  objc_copyWeak(&v44, &location);
  [v7 setCancelBlock:v42];
  char v35 = [v7 isCanceled];
  if (v35)
  {
    CGImageRef v16 = 0;
  }
  else
  {
    id v41 = 0;
    *(_OWORD *)long long buf = *MEMORY[0x1E4F1FA48];
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    CGImageRef v16 = (CGImageRef)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v34 atTime:buf actualTime:0 error:&v41];
    id v36 = v41;
    if (v36)
    {
      log = PLImportGetLog();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v37 = [(PHImportAsset *)self redactedFileNameDescription];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v36;
        _os_log_impl(&dword_19B043000, log, OS_LOG_TYPE_ERROR, "Unable to make an image for %@ (%@)", buf, 0x16u);
      }
    }
  }
  objc_destroyWeak(&v44);

  objc_destroyWeak(&location);
  if (v35) {
    goto LABEL_22;
  }
LABEL_23:

  if (!v16) {
    goto LABEL_25;
  }
  v38 = (CGImage *)CFAutorelease(v16);
LABEL_26:

  return v38;
}

void __50__PHImportAsset_avThumbnailOfSize_canceler_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelAllCGImageGeneration];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCancelBlock:0];
}

- (CGImage)imageThumbnailOfSize:(unint64_t)a3 canceler:(id)a4 error:(id *)a5
{
  v38[6] = *MEMORY[0x1E4F143B8];
  if ([a4 isCanceled]) {
    return 0;
  }
  CFURLRef v7 = [(PHImportAsset *)self url];
  id v8 = CGImageSourceCreateWithURL(v7, 0);

  if (!v8)
  {
    double v26 = PLImportGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      double v27 = [(PHImportAsset *)self redactedFileNameDescription];
      int v33 = 138412290;
      id v34 = v27;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Unable to get an image source for %@", (uint8_t *)&v33, 0xCu);
    }
    return 0;
  }
  uint64_t v9 = *MEMORY[0x1E4F2FF48];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  uint64_t v11 = *MEMORY[0x1E4F2FE48];
  v37[0] = *MEMORY[0x1E4F2FF48];
  v37[1] = v11;
  v38[0] = MEMORY[0x1E4F1CC38];
  v38[1] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = *MEMORY[0x1E4F2FE28];
  v37[2] = *MEMORY[0x1E4F2FE38];
  v37[3] = v12;
  uint64_t v13 = MEMORY[0x1E4F1CC28];
  if (a3 <= 0xA0) {
    uint64_t v14 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v14 = MEMORY[0x1E4F1CC38];
  }
  v38[2] = MEMORY[0x1E4F1CC38];
  v38[3] = v14;
  uint64_t v15 = *MEMORY[0x1E4F2FF08];
  v38[4] = MEMORY[0x1E4F1CC28];
  uint64_t v16 = *MEMORY[0x1E4F2FF68];
  v37[4] = v15;
  v37[5] = v16;
  double v17 = [NSNumber numberWithUnsignedInteger:a3];
  v38[5] = v17;
  CFDictionaryRef v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];
  CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v8, 0, v18);

  if (ThumbnailAtIndex)
  {
    double v20 = (CGImage *)CFAutorelease(ThumbnailAtIndex);
    v35[0] = v9;
    v35[1] = v11;
    v36[0] = v10;
    v36[1] = v10;
    v35[2] = v15;
    v36[2] = v13;
    CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, v21);

    if (ImageAtIndex)
    {
      double Width = (double)CGImageGetWidth(ImageAtIndex);
      double Height = (double)CGImageGetHeight(ImageAtIndex);
      CGImageRelease(ImageAtIndex);
      double v25 = -[PHImportAsset removeBlackBarsFromExifThumbnail:fullSize:](self, "removeBlackBarsFromExifThumbnail:fullSize:", v20, Width, Height);
      if (v25) {
        double v20 = v25;
      }
    }
    else
    {
      BOOL v30 = PLImportGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        double v31 = [(PHImportAsset *)self redactedFileNameDescription];
        int v33 = 138412290;
        id v34 = v31;
        _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "Unable to make a full size image for %@", (uint8_t *)&v33, 0xCu);
      }
    }
  }
  else
  {
    double v28 = PLImportGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      double v29 = [(PHImportAsset *)self redactedFileNameDescription];
      int v33 = 138412290;
      id v34 = v29;
      _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_ERROR, "Unable to make an exif size image for %@", (uint8_t *)&v33, 0xCu);
    }
    double v20 = 0;
  }
  CFRelease(v8);
  return v20;
}

- (CGImage)removeBlackBarsFromExifThumbnail:(CGImage *)a3 fullSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  double v8 = (double)CGImageGetWidth(a3);
  double v9 = (double)CGImageGetHeight(v6);
  -[PHImportAsset cropEXIFThumbSize:originalSize:](self, "cropEXIFThumbSize:originalSize:", v8, v9, width, height);
  if (v10 == v8 && v11 == v9) {
    return v6;
  }
  v16.size.double width = floor(v10);
  v16.size.double height = floor(v11);
  v16.origin.x = round((v8 - v10) * 0.5);
  v16.origin.y = round((v9 - v11) * 0.5);
  CGImageRef v13 = CGImageCreateWithImageInRect(v6, v16);
  if (!v13) {
    return 0;
  }

  return (CGImage *)CFAutorelease(v13);
}

- (CGSize)cropEXIFThumbSize:(CGSize)result originalSize:(CGSize)a4
{
  double v4 = result.width / result.height;
  double v5 = a4.width / a4.height;
  double v6 = vabdd_f64(v5, result.width / result.height);
  if (result.width / result.height > 1.0 && v5 > 1.0)
  {
    if (v6 <= 0.000001)
    {
LABEL_39:
      double width = result.width;
      goto LABEL_40;
    }
    double v14 = result.width / v5;
LABEL_31:
    result.double height = floor(v14);
    goto LABEL_39;
  }
  if (v4 < 1.0 && v5 < 1.0)
  {
    if (v6 <= 0.000001) {
      goto LABEL_39;
    }
    double v15 = result.height * v5;
LABEL_36:
    double width = floor(v15);
    goto LABEL_40;
  }
  if (v4 < 1.0 && v5 > 1.0)
  {
    if (v6 <= 0.000001) {
      goto LABEL_39;
    }
    double v15 = result.height / v5;
    goto LABEL_36;
  }
  if (v4 > 1.0 && v5 < 1.0)
  {
    if (v6 <= 0.000001) {
      goto LABEL_39;
    }
    double v14 = result.width * v5;
    goto LABEL_31;
  }
  BOOL v11 = v4 > 1.0 && v5 == 1.0;
  double width = result.height;
  if (!v11)
  {
    if (v5 == 1.0 && v4 <= 1.0) {
      result.double height = result.width;
    }
    goto LABEL_39;
  }
LABEL_40:
  if ((int)result.height) {
    result.double height = result.height + -1.0;
  }
  double v16 = width + -1.0;
  if (((int)width & 1) == 0) {
    double v16 = width;
  }
  result.double width = v16;
  return result;
}

- (void)thumbnailUsingRequest:(id)a3 atEnd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PHImportAsset *)self source];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PHImportAsset_thumbnailUsingRequest_atEnd___block_invoke;
  v11[3] = &unk_1E58487E0;
  CGImageRef v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 dispatchAssetDataRequestAsyncUsingBlock:v11];
}

void __45__PHImportAsset_thumbnailUsingRequest_atEnd___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCanceled])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    double v3 = *(void **)(a1 + 32);
    double v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    double v5 = NSString;
    id v6 = [v3 asset];
    id v7 = [v6 fileName];
    double v8 = [v5 stringWithFormat:@"Request for thumbnail for %@ was canceled.", v7];
    v25[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v10 = [v4 errorWithDomain:@"com.apple.ImportErrorDomain" code:-4 userInfo:v9];
    (*(void (**)(uint64_t, void, void *, void *))(v2 + 16))(v2, 0, v3, v10);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) requestAsset];
    int v11 = [v6 isImage];
    uint64_t v12 = [*(id *)(a1 + 32) longestSide];
    uint64_t v13 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v23 = 0;
      id v14 = (id *)&v23;
      uint64_t v15 = [v6 imageThumbnailOfSize:v12 canceler:v13 error:&v23];
    }
    else
    {
      uint64_t v22 = 0;
      id v14 = (id *)&v22;
      uint64_t v15 = [v6 avThumbnailOfSize:v12 canceler:v13 error:&v22];
    }
    double v16 = (CGImage *)v15;
    id v7 = *v14;
    if (v16)
    {
      double Width = (double)CGImageGetWidth(v16);
      double Height = (double)CGImageGetHeight(v16);
      [*(id *)(a1 + 40) thumbnailSize];
      if (v20 != Width || v19 != Height) {
        objc_msgSend(*(id *)(a1 + 40), "setThumbnailSize:", Width, Height);
      }
      [*(id *)(a1 + 40) loadMetadataSync];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)thumbnailForSize:(unint64_t)a3 priority:(unsigned __int8)a4 atEnd:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  if ([(PHImportAsset *)self isSidecar])
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
    id v9 = 0;
  }
  else
  {
    id v9 = [[PHImportAssetThumbnailDataRequest alloc] initWithAsset:self longestSide:a3 priority:v5];
    [(PHImportAsset *)self thumbnailUsingRequest:v9 atEnd:v8];
  }

  return v9;
}

- (id)thumbnailForSize:(unint64_t)a3 atEnd:(id)a4
{
  return [(PHImportAsset *)self thumbnailForSize:a3 priority:0 atEnd:a4];
}

- (void)_setMetadata:(id)a3
{
  id v9 = a3;
  os_unfair_lock_assert_owner(&self->_metadataLock);
  objc_storeStrong((id *)&self->_metadata, a3);
  if (![(PHImportAsset *)self fileSize]) {
    -[PHImportAsset setFileSize:](self, "setFileSize:", [v9 fileSize]);
  }
  uint64_t v5 = [v9 fileCreationDate];
  id v6 = [(PHImportAsset *)self fileCreationDate];

  if (!v6 && v5) {
    [(PHImportAsset *)self setFileCreationDate:v5];
  }
  id v7 = [v9 fileModificationDate];
  id v8 = [(PHImportAsset *)self fileModificationDate];

  if (!v8 && v7) {
    [(PHImportAsset *)self setFileModificationDate:v7];
  }
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__PHImportAsset_setMetadata___block_invoke;
  v6[3] = &unk_1E5848DF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PHImportAsset *)self _accessMetadata:v6];
}

uint64_t __29__PHImportAsset_setMetadata___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setMetadata:*(void *)(a1 + 40)];
}

- (PFMetadata)metadata
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__6586;
  id v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__PHImportAsset_metadata__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PFMetadata *)v2;
}

void __25__PHImportAsset_metadata__block_invoke(uint64_t a1)
{
}

- (void)loadMetadataAsync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHImportAsset *)self source];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PHImportAsset_loadMetadataAsync___block_invoke;
  v7[3] = &unk_1E5848790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchAssetDataRequestAsyncUsingBlock:v7];
}

uint64_t __35__PHImportAsset_loadMetadataAsync___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) loadMetadataSync];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)loadMetadataSync
{
  id v3 = [(PHImportAsset *)self url];
  [(PHImportAsset *)self _loadMetadataIfNecessaryForURL:v3 options:29];
}

- (void)addBurstAsset:(id)a3
{
  id v5 = a3;
  relatedBurstAssets = self->_relatedBurstAssets;
  id v11 = v5;
  if (!relatedBurstAssets)
  {
    uint64_t v7 = (NSMutableArray *)objc_opt_new();
    id v8 = self->_relatedBurstAssets;
    self->_relatedBurstAssets = v7;

    id v5 = v11;
    relatedBurstAssets = self->_relatedBurstAssets;
  }
  [(NSMutableArray *)relatedBurstAssets addObject:v5];
  burstPick = self->_burstPick;
  p_burstPick = &self->_burstPick;
  if (!burstPick && ([v11 burstPickType] & 4) != 0) {
    objc_storeStrong((id *)p_burstPick, a3);
  }
}

- (void)setAudioAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (PHImportAsset *)a3;
  if (v4)
  {
    id v5 = PLImportGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(PHImportAsset *)v4 redactedFileNameDescription];
      double v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](v4, "resourceType"));
      CFDictionaryRef v18 = v16;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      id v14 = PHDescriptionsForResourceTypes(v15);
      uint64_t v7 = [v14 componentsJoinedByString:@","];
      id v8 = [(PHImportAsset *)self redactedFileNameDescription];
      id v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      double v17 = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      id v11 = PHDescriptionsForResourceTypes(v10);
      uint64_t v12 = [v11 componentsJoinedByString:@","];
      *(_DWORD *)long long buf = 138413058;
      double v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      double v26 = v12;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an base image of %@ (%@)", buf, 0x2Au);
    }
    [(PHImportAsset *)v4 setResourceType:3];
  }
  audioAsset = self->_audioAsset;
  self->_audioAsset = v4;
}

- (void)setBase:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_17;
  }
  if (![(PHImportAsset *)self isImage])
  {
    if (![(PHImportAsset *)self isMovie])
    {
      uint64_t v15 = PLImportGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        BOOL v30 = [(PHImportAsset *)self redactedFileNameDescription];
        double v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        v42 = v31;
        double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        int v33 = PHDescriptionsForResourceTypes(v32);
        id v34 = [v33 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138412546;
        long long v49 = v30;
        __int16 v50 = 2112;
        long long v51 = v34;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "Trying to set a SOC file on an unexpected primary asset (%@ - %@)", buf, 0x16u);
      }
      goto LABEL_16;
    }
    char v16 = [v4 isMovie];
    p_super = PLImportGetLog();
    BOOL v17 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v17)
      {
        CFDictionaryRef v18 = [v4 redactedFileNameDescription];
        id v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
        id v44 = v41;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
        v37 = PHDescriptionsForResourceTypes(v39);
        double v19 = [v37 componentsJoinedByString:@","];
        double v20 = [(PHImportAsset *)self redactedFileNameDescription];
        __int16 v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        id v43 = v21;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        __int16 v23 = PHDescriptionsForResourceTypes(v22);
        uint64_t v24 = [v23 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138413058;
        long long v49 = v18;
        __int16 v50 = 2112;
        long long v51 = v19;
        __int16 v52 = 2112;
        uint64_t v53 = v20;
        __int16 v54 = 2112;
        v55 = v24;
        _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an base movie of %@ (%@)", buf, 0x2Au);
      }
      [v4 setResourceType:12];
      goto LABEL_17;
    }
    if (!v17) {
      goto LABEL_18;
    }
    __int16 v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    long long v45 = v25;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    uint64_t v27 = PHDescriptionsForResourceTypes(v26);
    double v28 = [v27 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    long long v49 = v28;
    double v29 = "Expected soc to be a movie (%@)";
LABEL_21:
    _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, v29, buf, 0xCu);

    goto LABEL_18;
  }
  char v5 = [v4 isImage];
  p_super = PLImportGetLog();
  BOOL v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      id v8 = [v4 redactedFileNameDescription];
      v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
      long long v47 = v40;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      id v36 = PHDescriptionsForResourceTypes(v38);
      id v9 = [v36 componentsJoinedByString:@","];
      id v10 = [(PHImportAsset *)self redactedFileNameDescription];
      id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      long long v46 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      uint64_t v13 = PHDescriptionsForResourceTypes(v12);
      id v14 = [v13 componentsJoinedByString:@","];
      *(_DWORD *)long long buf = 138413058;
      long long v49 = v8;
      __int16 v50 = 2112;
      long long v51 = v9;
      __int16 v52 = 2112;
      uint64_t v53 = v10;
      __int16 v54 = 2112;
      v55 = v14;
      _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an base image of %@ (%@)", buf, 0x2Au);
    }
    [v4 setResourceType:8];
    uint64_t v15 = [v4 videoComplement];
    [v15 setResourceType:11];
LABEL_16:

LABEL_17:
    char v35 = (PHImportAsset *)v4;
    p_super = &self->_base->super;
    self->_base = v35;
    goto LABEL_18;
  }
  if (v7)
  {
    __int16 v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v56[0] = v25;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    uint64_t v27 = PHDescriptionsForResourceTypes(v26);
    double v28 = [v27 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    long long v49 = v28;
    double v29 = "Expected soc to be an image (%@)";
    goto LABEL_21;
  }
LABEL_18:
}

- (void)setSpatialOverCapture:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_17;
  }
  if (![(PHImportAsset *)self isImage])
  {
    if (![(PHImportAsset *)self isMovie])
    {
      uint64_t v15 = PLImportGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        BOOL v30 = [(PHImportAsset *)self redactedFileNameDescription];
        double v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        v42 = v31;
        double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
        int v33 = PHDescriptionsForResourceTypes(v32);
        id v34 = [v33 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138412546;
        long long v49 = v30;
        __int16 v50 = 2112;
        long long v51 = v34;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "Trying to set a SOC file on an unexpected primary asset (%@ - %@)", buf, 0x16u);
      }
      goto LABEL_16;
    }
    char v16 = [v4 isMovie];
    p_super = PLImportGetLog();
    BOOL v17 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v17)
      {
        CFDictionaryRef v18 = [v4 redactedFileNameDescription];
        id v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
        id v44 = v41;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
        v37 = PHDescriptionsForResourceTypes(v39);
        double v19 = [v37 componentsJoinedByString:@","];
        double v20 = [(PHImportAsset *)self redactedFileNameDescription];
        __int16 v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        id v43 = v21;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        __int16 v23 = PHDescriptionsForResourceTypes(v22);
        uint64_t v24 = [v23 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138413058;
        long long v49 = v18;
        __int16 v50 = 2112;
        long long v51 = v19;
        __int16 v52 = 2112;
        uint64_t v53 = v20;
        __int16 v54 = 2112;
        v55 = v24;
        _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an SOC movie of %@ (%@)", buf, 0x2Au);
      }
      [v4 setResourceType:14];
      goto LABEL_17;
    }
    if (!v17) {
      goto LABEL_18;
    }
    __int16 v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    long long v45 = v25;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    uint64_t v27 = PHDescriptionsForResourceTypes(v26);
    double v28 = [v27 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    long long v49 = v28;
    double v29 = "Expected soc to be a movie (%@)";
LABEL_21:
    _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, v29, buf, 0xCu);

    goto LABEL_18;
  }
  char v5 = [v4 isImage];
  p_super = PLImportGetLog();
  BOOL v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      id v8 = [v4 redactedFileNameDescription];
      v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
      long long v47 = v40;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      id v36 = PHDescriptionsForResourceTypes(v38);
      id v9 = [v36 componentsJoinedByString:@","];
      id v10 = [(PHImportAsset *)self redactedFileNameDescription];
      id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      long long v46 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      uint64_t v13 = PHDescriptionsForResourceTypes(v12);
      id v14 = [v13 componentsJoinedByString:@","];
      *(_DWORD *)long long buf = 138413058;
      long long v49 = v8;
      __int16 v50 = 2112;
      long long v51 = v9;
      __int16 v52 = 2112;
      uint64_t v53 = v10;
      __int16 v54 = 2112;
      v55 = v14;
      _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an SOC image of %@ (%@)", buf, 0x2Au);
    }
    [v4 setResourceType:13];
    uint64_t v15 = [v4 videoComplement];
    [v15 setResourceType:15];
LABEL_16:

LABEL_17:
    char v35 = (PHImportAsset *)v4;
    p_super = &self->_spatialOverCapture->super;
    self->_spatialOverCapture = v35;
    goto LABEL_18;
  }
  if (v7)
  {
    __int16 v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v56[0] = v25;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    uint64_t v27 = PHDescriptionsForResourceTypes(v26);
    double v28 = [v27 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    long long v49 = v28;
    double v29 = "Expected soc to be an image (%@)";
    goto LABEL_21;
  }
LABEL_18:
}

- (void)setLargeMovieRender:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (!v4)
  {
LABEL_6:
    char v16 = v5;
    p_super = &self->_largeMovieRender->super;
    self->_largeMovieRender = v16;
    goto LABEL_7;
  }
  char v6 = [v4 isMovie];
  p_super = PLImportGetLog();
  BOOL v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      id v9 = [v5 redactedFileNameDescription];
      __int16 v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "resourceType"));
      __int16 v25 = v23;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      __int16 v21 = PHDescriptionsForResourceTypes(v22);
      id v10 = [v21 componentsJoinedByString:@","];
      id v11 = [(PHImportAsset *)self redactedFileNameDescription];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      uint64_t v24 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      id v14 = PHDescriptionsForResourceTypes(v13);
      uint64_t v15 = [v14 componentsJoinedByString:@","];
      *(_DWORD *)long long buf = 138413058;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      double v29 = v10;
      __int16 v30 = 2112;
      double v31 = v11;
      __int16 v32 = 2112;
      int v33 = v15;
      _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a large movie render of %@ (%@)", buf, 0x2Au);
    }
    [v5 setResourceType:6];
    goto LABEL_6;
  }
  if (v8)
  {
    BOOL v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "resourceType"));
    v34[0] = v17;
    CFDictionaryRef v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    double v19 = PHDescriptionsForResourceTypes(v18);
    double v20 = [v19 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v27 = v20;
    _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "Expected largeRender to be a movie (%@)", buf, 0xCu);
  }
LABEL_7:
}

- (void)setLargeRender:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (!v4)
  {
LABEL_6:
    BOOL v17 = v5;
    p_super = &self->_largeRender->super;
    self->_largeRender = v17;
    goto LABEL_7;
  }
  char v6 = [v4 isImage];
  p_super = PLImportGetLog();
  BOOL v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      id v9 = [v5 redactedFileNameDescription];
      uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "resourceType"));
      double v26 = v24;
      __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      uint64_t v22 = PHDescriptionsForResourceTypes(v23);
      id v10 = [v22 componentsJoinedByString:@","];
      id v11 = [(PHImportAsset *)self redactedFileNameDescription];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      __int16 v25 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      id v14 = PHDescriptionsForResourceTypes(v13);
      uint64_t v15 = [v14 componentsJoinedByString:@","];
      *(_DWORD *)long long buf = 138413058;
      __int16 v28 = v9;
      __int16 v29 = 2112;
      __int16 v30 = v10;
      __int16 v31 = 2112;
      __int16 v32 = v11;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a large render of %@ (%@)", buf, 0x2Au);
    }
    [v5 setResourceType:5];
    char v16 = [v5 videoComplement];
    [v16 setResourceType:10];

    goto LABEL_6;
  }
  if (v8)
  {
    CFDictionaryRef v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "resourceType"));
    v35[0] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    double v20 = PHDescriptionsForResourceTypes(v19);
    __int16 v21 = [v20 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    __int16 v28 = v21;
    _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEBUG, "Expected largeRender to be an image (%@)", buf, 0xCu);
  }
LABEL_7:
}

- (void)setVideoComplement:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (PHImportAsset *)a3;
  char v5 = v4;
  if (v4)
  {
    [(PHImportAsset *)v4 isMovie];
    if ([(PHImportAsset *)self resourceType] == 1)
    {
      char v6 = v5;
      uint64_t v7 = 9;
LABEL_10:
      [(PHImportAsset *)v6 setResourceType:v7];
      goto LABEL_11;
    }
    if ([(PHImportAsset *)self resourceType] == 5)
    {
      char v6 = v5;
      uint64_t v7 = 10;
      goto LABEL_10;
    }
    int64_t resourceType = self->_resourceType;
    if (resourceType == 13)
    {
      char v6 = v5;
      uint64_t v7 = 15;
      goto LABEL_10;
    }
    if (resourceType == 8)
    {
      char v6 = v5;
      uint64_t v7 = 11;
      goto LABEL_10;
    }
    id v10 = PLImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(PHImportAsset *)v5 redactedFileNameDescription];
      uint64_t v12 = [(PHImportAsset *)self redactedFileNameDescription];
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      BOOL v17 = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      uint64_t v15 = PHDescriptionsForResourceTypes(v14);
      char v16 = [v15 componentsJoinedByString:@","];
      *(_DWORD *)long long buf = 138412802;
      double v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v12;
      __int16 v22 = 2112;
      __int16 v23 = v16;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Trying to set a video complement file (%@) on an unexpected primary asset (%@ - %@)", buf, 0x20u);
    }
  }
LABEL_11:
  videoComplement = self->_videoComplement;
  self->_videoComplement = v5;
}

- (void)setRawAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  if ([v5 isRAW])
  {
    if ([(PHImportAsset *)self isJPEG])
    {
      [v6 setResourceType:4];
LABEL_5:
      objc_storeStrong((id *)&self->_rawAsset, a3);
      goto LABEL_12;
    }
    id v10 = PLImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(PHImportAsset *)self fileName];
      uint64_t v12 = [v11 pathExtension];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "Expected primary asset to be a JPEG (%@)", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = PLImportGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = [v6 fileName];
      id v9 = [v8 pathExtension];
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Expected rawAsset to be a RAW (%@)", (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_12:
}

- (BOOL)isAppropriateForUI
{
  return (unint64_t)(self->_resourceType - 1) < 2;
}

- (BOOL)hasAdjustments
{
  id v3 = [(PHImportAsset *)self adjustmentSidecar];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PHImportAsset *)self originalAdjustmentSidecar];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)xmpSidecar
{
  id v2 = [(PHImportAsset *)self sidecarAssetsByType];
  id v3 = [v2 objectForKeyedSubscript:&unk_1EEB24FD8];

  return v3;
}

- (id)originalAdjustmentSidecar
{
  id v2 = [(PHImportAsset *)self sidecarAssetsByType];
  id v3 = [v2 objectForKeyedSubscript:&unk_1EEB24FC0];

  return v3;
}

- (id)adjustmentSecondarySidecar
{
  id v2 = [(PHImportAsset *)self sidecarAssetsByType];
  id v3 = [v2 objectForKeyedSubscript:&unk_1EEB24FA8];

  return v3;
}

- (id)adjustmentSidecar
{
  id v2 = [(PHImportAsset *)self sidecarAssetsByType];
  id v3 = [v2 objectForKeyedSubscript:&unk_1EEB24F90];

  return v3;
}

- (id)slmSidecar
{
  id v2 = [(PHImportAsset *)self sidecarAssetsByType];
  id v3 = [v2 objectForKeyedSubscript:&unk_1EEB24F78];

  return v3;
}

- (void)removeSidecarAsset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    sidecarAssetsByType = self->_sidecarAssetsByType;
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    [(NSMutableDictionary *)sidecarAssetsByType removeObjectForKey:v7];

    [v5 setFilePresenter:0];
  }
  else
  {
    BOOL v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "sidecarAsset was nil", v9, 2u);
    }
  }
}

- (void)addSidecarAsset:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PHImportAsset *)self source];
    char v6 = [v5 isPairedSidecar:v4];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = PLImportGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        BOOL v8 = [v4 redactedFileNameDescription];
        double v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
        __int16 v28 = v26;
        __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        uint64_t v24 = PHDescriptionsForResourceTypes(v25);
        id v9 = [v24 componentsJoinedByString:@","];
        id v10 = [(PHImportAsset *)self redactedFileNameDescription];
        id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        uint64_t v27 = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        int v13 = PHDescriptionsForResourceTypes(v12);
        id v14 = [v13 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138413058;
        __int16 v30 = v8;
        __int16 v31 = 2112;
        __int16 v32 = v9;
        __int16 v33 = 2112;
        id v34 = v10;
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a sidecar of %@ (%@) ", buf, 0x2Au);
      }
      uint64_t v15 = [(PHImportAsset *)self sidecarAssetsByType];

      if (!v15)
      {
        char v16 = objc_opt_new();
        [(PHImportAsset *)self setSidecarAssetsByType:v16];
      }
      sidecarAssetsByType = self->_sidecarAssetsByType;
      CFDictionaryRef v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
      [(NSMutableDictionary *)sidecarAssetsByType setObject:v4 forKeyedSubscript:v18];

      double v19 = [PHImportAssetFilePresenter alloc];
      __int16 v20 = [(PHImportAsset *)self url];
      __int16 v21 = [v4 url];
      __int16 v22 = [(PHImportAssetFilePresenter *)v19 initWithPrimaryURL:v20 presentedURL:v21];
      [v4 setFilePresenter:v22];

      __int16 v23 = [(PHImportAsset *)self source];
      [v23 addPairedSidecar:v4];
    }
  }
}

- (unint64_t)sidecarAssetBytes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(PHImportAsset *)self sidecarAssetsByType];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) fileSize];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSArray)sidecarAssets
{
  id v2 = [(PHImportAsset *)self sidecarAssetsByType];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (void)_loadSidecarFiles
{
  if (![(NSMutableDictionary *)self->_sidecarAssetsByType count])
  {
    if (![(PHImportAsset *)self isImage]
      && [(PHImportAsset *)self isMovie]
      && ![(PHImportAsset *)self isAVCHD])
    {
      id v3 = [(PHImportAsset *)self checkForSidecarWithExtension:@"SLM"];
      [(PHImportAsset *)self addSidecarAsset:v3];
    }
    id v4 = [(PHImportAsset *)self checkForSidecarWithExtension:@"AAE"];
    [(PHImportAsset *)self addSidecarAsset:v4];
  }
}

- (void)loadSidecarFiles
{
  loadSidecars = self->_loadSidecars;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PHImportAsset_loadSidecarFiles__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  dispatch_sync(loadSidecars, block);
}

unsigned char *__33__PHImportAsset_loadSidecarFiles__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[60])
  {
    uint64_t result = (unsigned char *)[result _loadSidecarFiles];
    *(unsigned char *)(*(void *)(a1 + 32) + 60) = 1;
  }
  return result;
}

- (id)checkForSidecarWithExtension:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHImportAsset *)self url];
  unint64_t v6 = [v5 URLByDeletingPathExtension];
  uint64_t v7 = [v4 uppercaseString];
  BOOL v8 = [v6 URLByAppendingPathExtension:v7];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v10 = [v8 path];
  LODWORD(v7) = [v9 fileExistsAtPath:v10];

  if (v7)
  {
    long long v11 = [(PHImportAsset *)self source];
    long long v12 = +[PHImportAsset assetFileForURL:v8 source:v11];

    if (!v12)
    {
      long long v13 = [v8 URLByDeletingPathExtension];
      id v14 = [v4 lowercaseString];
      uint64_t v15 = [v13 URLByAppendingPathExtension:v14];

      char v16 = [(PHImportAsset *)self source];
      long long v12 = +[PHImportAsset assetFileForURL:v15 source:v16];

      BOOL v8 = (void *)v15;
    }
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (unint64_t)relatedBytes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(PHImportAsset *)self relatedAssets];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = [v8 fileSize];
        v5 += v9 + [v8 relatedBytes];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)relatedAssets
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(PHImportAsset *)self largeRender];

  if (v4)
  {
    unint64_t v5 = [(PHImportAsset *)self largeRender];
    [v3 addObject:v5];
  }
  uint64_t v6 = [(PHImportAsset *)self largeMovieRender];

  if (v6)
  {
    uint64_t v7 = [(PHImportAsset *)self largeMovieRender];
    [v3 addObject:v7];
  }
  BOOL v8 = [(PHImportAsset *)self rawAsset];

  if (v8)
  {
    uint64_t v9 = [(PHImportAsset *)self rawAsset];
  }
  else
  {
    long long v10 = [(PHImportAsset *)self videoComplement];

    if (!v10) {
      goto LABEL_10;
    }
    uint64_t v9 = [(PHImportAsset *)self videoComplement];
  }
  long long v11 = (void *)v9;
  [v3 addObject:v9];

LABEL_10:
  long long v12 = [(PHImportAsset *)self audioAsset];

  if (v12)
  {
    long long v13 = [(PHImportAsset *)self audioAsset];
    [v3 addObject:v13];
  }
  long long v14 = [(PHImportAsset *)self spatialOverCapture];

  if (v14)
  {
    uint64_t v15 = [(PHImportAsset *)self spatialOverCapture];
    [v3 addObject:v15];
  }
  uint64_t v16 = [(PHImportAsset *)self base];

  if (v16)
  {
    BOOL v17 = [(PHImportAsset *)self base];
    [v3 addObject:v17];
  }
  CFDictionaryRef v18 = [(PHImportAsset *)self sidecarAssets];
  [v3 addObjectsFromArray:v18];

  return v3;
}

- (unint64_t)approximateBytesRequiredToImport
{
  unint64_t v3 = [(PHImportAsset *)self assetSizeIncludingRelatedAssets] + 225280;
  uint64_t v4 = [(PHImportAsset *)self largeRender];

  if (!v4) {
    return (unint64_t)(fmin((double)[(PHImportAsset *)self fileSize], 1468006.4) + (double)v3);
  }
  return v3;
}

- (unint64_t)assetSizeIncludingRelatedAssets
{
  unint64_t v3 = [(PHImportAsset *)self fileSize];
  return [(PHImportAsset *)self relatedBytes] + v3;
}

- (NSNumber)trackFormat
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_trackFormat__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __28__PHImportAsset_trackFormat__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) audioTrackFormat];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)bitrate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__PHImportAsset_bitrate__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __24__PHImportAsset_bitrate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) audioDataRate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)sampleRate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportAsset_sampleRate__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __27__PHImportAsset_sampleRate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) audioSampleRate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)fps
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __20__PHImportAsset_fps__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __20__PHImportAsset_fps__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) nominalFrameRate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)codec
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__PHImportAsset_codec__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __22__PHImportAsset_codec__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) videoCodecName];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)exposureTime
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_exposureTime__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __29__PHImportAsset_exposureTime__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) exposureTime];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)fNumber
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__PHImportAsset_fNumber__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __24__PHImportAsset_fNumber__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) fNumber];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)exposureBias
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_exposureBias__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __29__PHImportAsset_exposureBias__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) exposureBias];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)digitalZoomRatio
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PHImportAsset_digitalZoomRatio__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __33__PHImportAsset_digitalZoomRatio__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) digitalZoomRatio];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)focalLengthIn35mm
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PHImportAsset_focalLengthIn35mm__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __34__PHImportAsset_focalLengthIn35mm__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) focalLengthIn35mm];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)focalLength
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_focalLength__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __28__PHImportAsset_focalLength__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) focalLength];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)iso
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __20__PHImportAsset_iso__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __20__PHImportAsset_iso__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) iso];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)meteringMode
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_meteringMode__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __29__PHImportAsset_meteringMode__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) meteringMode];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)whiteBalance
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_whiteBalance__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __29__PHImportAsset_whiteBalance__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) whiteBalance];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)flashFired
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportAsset_flashFired__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  uint64_t v2 = [NSNumber numberWithBool:*((unsigned __int8 *)v6 + 24)];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

uint64_t __27__PHImportAsset_flashFired__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) flashFired];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)lensModel
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__PHImportAsset_lensModel__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __26__PHImportAsset_lensModel__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) lensModel];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)formattedCameraModel
{
  uint64_t v3 = [(PHImportAsset *)self cameraModel];
  uint64_t v4 = [(PHImportAsset *)self cameraMake];
  uint64_t v5 = [MEMORY[0x1E4F8CC38] formattedCameraModelFromCameraModel:v3 cameraMake:v4];

  return (NSString *)v5;
}

- (NSString)cameraModel
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_cameraModel__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __28__PHImportAsset_cameraModel__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) cameraModel];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)cameraMake
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportAsset_cameraMake__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __27__PHImportAsset_cameraMake__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) cameraMake];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)durationTimeInterval
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PHImportAsset_durationTimeInterval__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __37__PHImportAsset_durationTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) durationTimeInterval];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)spatialOverCaptureIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PHImportAsset_spatialOverCaptureIdentifier__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __45__PHImportAsset_spatialOverCaptureIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) spatialOverCaptureIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)livePhotoPairingIdentifier
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__6586;
  uint64_t v9 = __Block_byref_object_dispose__6587;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PHImportAsset_livePhotoPairingIdentifier__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __43__PHImportAsset_livePhotoPairingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) livePhotoPairingIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int)burstPickType
{
  uint64_t v2 = [(PHImportAsset *)self burstUUID];
  int v3 = 2 * (v2 != 0);

  return v3;
}

- (id)groupingUUID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6586;
  id v10 = __Block_byref_object_dispose__6587;
  id v11 = 0;
  if ([(PHImportAsset *)self isImage])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __29__PHImportAsset_groupingUUID__block_invoke;
    v5[3] = &unk_1E5848D28;
    v5[4] = self;
    v5[5] = &v6;
    [(PHImportAsset *)self _accessMetadata:v5];
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__PHImportAsset_groupingUUID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) groupingUuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)burstUUID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6586;
  id v10 = __Block_byref_object_dispose__6587;
  id v11 = 0;
  if ([(PHImportAsset *)self isImage])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__PHImportAsset_burstUUID__block_invoke;
    v5[3] = &unk_1E5848D28;
    v5[4] = self;
    v5[5] = &v6;
    [(PHImportAsset *)self _accessMetadata:v5];
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __26__PHImportAsset_burstUUID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) burstUuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (CGSize)transformedPixelSize
{
  uint64_t v3 = [(PHImportAsset *)self largeRender];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (PHImportAsset *)v3;
  }
  else {
    uint64_t v5 = self;
  }
  uint64_t v6 = v5;

  [(PHImportAsset *)v6 orientedPixelSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)orientedPixelSize
{
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  double v10 = &unk_19B322527;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PHImportAsset_orientedPixelSize__block_invoke;
  v6[3] = &unk_1E5848D28;
  v6[4] = self;
  void v6[5] = &v7;
  [(PHImportAsset *)self _accessMetadata:v6];
  double v2 = v8[4];
  double v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.double height = v5;
  result.double width = v4;
  return result;
}

uint64_t __34__PHImportAsset_orientedPixelSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) orientedPixelSize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (CGSize)exifPixelSize
{
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  double v10 = &unk_19B322527;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__PHImportAsset_exifPixelSize__block_invoke;
  v6[3] = &unk_1E5848D28;
  v6[4] = self;
  void v6[5] = &v7;
  [(PHImportAsset *)self _accessMetadata:v6];
  double v2 = v8[4];
  double v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.double height = v5;
  result.double width = v4;
  return result;
}

uint64_t __30__PHImportAsset_exifPixelSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) exifPixelSize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (unsigned)orientation
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_orientation__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __28__PHImportAsset_orientation__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) orientation];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGSize)cgImageSize
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (double *)MEMORY[0x1E4F1DB30];
  uint64_t v4 = [(PHImportAsset *)self largeRender];
  if (v4)
  {
    uint64_t v5 = [(PHImportAsset *)self largeRender];
    CFURLRef v6 = [v5 url];
  }
  else
  {
    CFURLRef v6 = [(PHImportAsset *)self url];
  }
  double Width = *v3;
  double Height = v3[1];

  if (v6)
  {
    if ([(PHImportAsset *)self isImage])
    {
      uint64_t v9 = *MEMORY[0x1E4F2FF48];
      uint64_t v24 = *MEMORY[0x1E4F2FF48];
      uint64_t v10 = MEMORY[0x1E4F1CC38];
      v25[0] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v12 = CGImageSourceCreateWithURL(v6, v11);

      if (v12)
      {
        uint64_t v13 = *MEMORY[0x1E4F2FE48];
        v22[0] = v9;
        v22[1] = v13;
        v23[0] = v10;
        v23[1] = v10;
        CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, v14);

        if (ImageAtIndex)
        {
          double Width = (double)CGImageGetWidth(ImageAtIndex);
          double Height = (double)CGImageGetHeight(ImageAtIndex);
          CGImageRelease(ImageAtIndex);
        }
        CFRelease(v12);
      }
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v6 options:0];
      BOOL v17 = [MEMORY[0x1E4F8CC38] mainVideoTrackForAsset:v16];
      [v17 naturalSize];
      double Width = v18;
      double Height = v19;
    }
  }

  double v20 = Width;
  double v21 = Height;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)_accessMetadata:(id)a3
{
  p_metadataLock = &self->_metadataLock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_metadataLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_metadataLock);
}

- (BOOL)isViewable
{
  if ([(PHImportAsset *)self isImage]) {
    return 1;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F166C8]);
  uint64_t v5 = [(PHImportAsset *)self url];
  CFURLRef v6 = (void *)[v4 initWithURL:v5 options:0];

  uint64_t v7 = [MEMORY[0x1E4F8CC38] mainVideoTrackForAsset:v6];
  char v8 = [v7 isDecodable];

  return v8;
}

- (BOOL)isTagged
{
  return 0;
}

- (void)takeAsVideoComplement:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!-[PHImportAsset isImage](self, "isImage") || ([v4 isMovie] & 1) == 0)
  {
    uint64_t v13 = PLImportGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = [v4 redactedFileNameDescription];
      __int16 v25 = [(PHImportAsset *)self redactedFileNameDescription];
      *(_DWORD *)long long buf = 138412546;
      __int16 v32 = v24;
      __int16 v33 = 2112;
      id v34 = v25;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "Assigning %@ as video complement of %@ is not allowed", buf, 0x16u);
    }
    goto LABEL_12;
  }
  uint64_t v5 = PLImportGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFURLRef v6 = [v4 redactedFileNameDescription];
    __int16 v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    __int16 v30 = v28;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    double v26 = PHDescriptionsForResourceTypes(v27);
    uint64_t v7 = [v26 componentsJoinedByString:@","];
    char v8 = [(PHImportAsset *)self redactedFileNameDescription];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
    __int16 v29 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    CFDictionaryRef v11 = PHDescriptionsForResourceTypes(v10);
    uint64_t v12 = [v11 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138413058;
    __int16 v32 = v6;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a video complement of %@ (%@)", buf, 0x2Au);
  }
  [(PHImportAsset *)self setVideoComplement:v4];
  uint64_t v13 = [(PHImportAsset *)self sidecarAssetsByType];
  if ([v13 count])
  {
LABEL_12:

    goto LABEL_13;
  }
  CFDictionaryRef v14 = [v4 sidecarAssetsByType];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    uint64_t v16 = PLImportGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BOOL v17 = [v4 sidecarAssetsByType];
      double v18 = [v17 allValues];
      double v19 = [v18 valueForKeyPath:@"fileName.pathExtension"];
      double v20 = [v19 componentsJoinedByString:@","];
      double v21 = [v4 redactedFileNameDescription];
      __int16 v22 = [(PHImportAsset *)self redactedFileNameDescription];
      *(_DWORD *)long long buf = 138412802;
      __int16 v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      id v36 = v22;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "PAIRING: moving sidecars (%@) from %@ to %@", buf, 0x20u);
    }
    __int16 v23 = [v4 sidecarAssetsByType];
    [(PHImportAsset *)self setSidecarAssetsByType:v23];

    [v4 setSidecarAssetsByType:0];
  }
LABEL_13:
}

- (BOOL)isVideoComplementOf:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isJPEG] & 1) == 0 && !objc_msgSend(v4, "isHEIF"))
  {
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = [v4 livePhotoPairingIdentifier];
  if (v5
    && (CFURLRef v6 = (void *)v5,
        [(PHImportAsset *)self livePhotoPairingIdentifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    char v8 = [v4 livePhotoPairingIdentifier];
  }
  else
  {
    if ([(PHImportAsset *)self performAdditionalLivePhotoChecksOnImageAsset:v4])
    {
      int v9 = 1;
      goto LABEL_12;
    }
    [v4 loadMetadataSync];
    char v8 = [v4 livePhotoPairingIdentifier];
    if (!v8)
    {
      int v9 = 0;
      goto LABEL_11;
    }
    [(PHImportAsset *)self loadMetadataSync];
  }
  uint64_t v10 = [(PHImportAsset *)self livePhotoPairingIdentifier];
  int v9 = [v8 isEqualToString:v10];

LABEL_11:
LABEL_12:
  CFDictionaryRef v11 = PLImportGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v4 livePhotoPairingIdentifier];
    uint64_t v13 = [(PHImportAsset *)self livePhotoPairingIdentifier];
    int v16 = 138412546;
    BOOL v17 = v12;
    __int16 v18 = 2112;
    double v19 = v13;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "PAIRING: imageAsset.livePhotoPairingIdentifier == %@, videoAsset.livePhotoPairingIdentifier == %@", (uint8_t *)&v16, 0x16u);
  }
  if (!v9) {
    goto LABEL_16;
  }
  [v4 takeAsVideoComplement:self];
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)performAdditionalLivePhotoChecksOnImageAsset:(id)a3
{
  return 0;
}

- (NSString)importIdentifier
{
  importIdentifier = self->_importIdentifier;
  if (!importIdentifier)
  {
    id v4 = [(PHImportAsset *)self makeImportIdentifier];
    uint64_t v5 = self->_importIdentifier;
    self->_importIdentifier = v4;

    importIdentifier = self->_importIdentifier;
  }

  return importIdentifier;
}

- (id)makeImportIdentifier
{
  uint64_t v3 = [(PHImportAsset *)self fileName];
  id v4 = [v3 stringByDeletingPathExtension];

  if ([(PHImportAsset *)self isRepresentation]
    || [(PHImportAsset *)self isOriginalAdjustmentData]
    || [(PHImportAsset *)self isAdjustmentSecondaryData])
  {
    uint64_t v5 = [(PHImportAsset *)self stripMarkerFromName:v4 markerLocation:4];

    id v4 = (void *)v5;
  }
  CFURLRef v6 = [(PHImportAsset *)self parentFolderPath];
  uint64_t v7 = [v6 stringByAppendingPathComponent:v4];

  return v7;
}

- (id)stripMarkerFromName:(id)a3 markerLocation:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFURLRef v6 = v5;
  if (v5)
  {
    if ([v5 length] >= a4)
    {
      uint64_t v10 = NSString;
      CFDictionaryRef v11 = [v6 substringToIndex:a4];
      if ([v6 length] <= a4)
      {
        int v9 = [v10 stringWithFormat:@"%@%@", v11, &stru_1EEAC1950];
      }
      else
      {
        uint64_t v12 = [v6 substringFromIndex:a4 + 1];
        int v9 = [v10 stringWithFormat:@"%@%@", v11, v12];
      }
      goto LABEL_14;
    }
    uint64_t v7 = PLImportGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218498;
      unint64_t v15 = a4;
      __int16 v16 = 2112;
      BOOL v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = [v6 length];
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Marker location (%lu) is beyond length of name '%@' (%lu)", buf, 0x20u);
    }
  }
  else
  {
    char v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "Passed a nil 'name'", buf, 2u);
    }
  }
  int v9 = 0;
LABEL_14:

  return v9;
}

- (id)basenameForOriginalAdjustmentData
{
  basenameForOriginalAdjustment = self->_basenameForOriginalAdjustment;
  if (!basenameForOriginalAdjustment)
  {
    id v4 = (void *)MEMORY[0x1E4F28E78];
    id v5 = [(PHImportAsset *)self fileName];
    CFURLRef v6 = [v4 stringWithString:v5];

    [v6 insertString:@"O" atIndex:4];
    uint64_t v7 = (NSString *)[v6 copy];
    char v8 = self->_basenameForOriginalAdjustment;
    self->_basenameForOriginalAdjustment = v7;

    basenameForOriginalAdjustment = self->_basenameForOriginalAdjustment;
  }

  return basenameForOriginalAdjustment;
}

- (BOOL)isOriginalAdjustmentData
{
  unsigned int v2 = [(PHImportAsset *)self fileName];
  BOOL v3 = +[PHImportAsset isOriginalAdjustmentData:v2];

  return v3;
}

- (BOOL)isBase
{
  if (isBase_onceToken != -1) {
    dispatch_once(&isBase_onceToken, &__block_literal_global_244);
  }
  BOOL v3 = (void *)isBase_isBaseRegex;
  id v4 = [(PHImportAsset *)self fileName];
  id v5 = [(PHImportAsset *)self fileName];
  LOBYTE(v3) = objc_msgSend(v3, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v5, "length")) != 0;

  return (char)v3;
}

void __23__PHImportAsset_isBase__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\D{4}B\\d{4}" options:0 error:&v4];
  id v1 = v4;
  unsigned int v2 = (void *)isBase_isBaseRegex;
  isBase_isBaseRegex = v0;

  if (v1)
  {
    BOOL v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v6 = v1;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}B\\d{4}': %@", buf, 0xCu);
    }
  }
}

- (BOOL)isSpatialOverCapture
{
  if (isSpatialOverCapture_onceToken != -1) {
    dispatch_once(&isSpatialOverCapture_onceToken, &__block_literal_global_239);
  }
  BOOL v3 = [(PHImportAsset *)self fileName];
  BOOL v4 = objc_msgSend((id)isSpatialOverCapture_isSocRegex, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

void __37__PHImportAsset_isSpatialOverCapture__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\D{4}S\\d{4}" options:0 error:&v4];
  id v1 = v4;
  unsigned int v2 = (void *)isSpatialOverCapture_isSocRegex;
  isSpatialOverCapture_isSocRegex = v0;

  if (v1)
  {
    BOOL v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v6 = v1;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}S\\d{4}': %@", buf, 0xCu);
    }
  }
}

- (BOOL)isAdjustmentSecondaryData
{
  if (isAdjustmentSecondaryData_onceToken != -1) {
    dispatch_once(&isAdjustmentSecondaryData_onceToken, &__block_literal_global_234);
  }
  BOOL v3 = [(PHImportAsset *)self fileName];
  BOOL v4 = objc_msgSend((id)isAdjustmentSecondaryData_regex, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

void __42__PHImportAsset_isAdjustmentSecondaryData__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\D{4}A\\d{4}" options:0 error:&v4];
  id v1 = v4;
  unsigned int v2 = (void *)isAdjustmentSecondaryData_regex;
  isAdjustmentSecondaryData_regex = v0;

  if (v1)
  {
    BOOL v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v6 = v1;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}A\\d{4}': %@", buf, 0xCu);
    }
  }
}

- (BOOL)isRender
{
  if (isRender_onceToken != -1) {
    dispatch_once(&isRender_onceToken, &__block_literal_global_6661);
  }
  BOOL v3 = [(PHImportAsset *)self fileName];
  BOOL v4 = objc_msgSend((id)isRender_isRenderedRegex, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

void __25__PHImportAsset_isRender__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\D{4}E\\d{4}" options:0 error:&v4];
  id v1 = v4;
  unsigned int v2 = (void *)isRender_isRenderedRegex;
  isRender_isRenderedRegex = v0;

  if (v1)
  {
    BOOL v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v6 = v1;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}E\\d{4}': %@", buf, 0xCu);
    }
  }
}

- (BOOL)isPrimary
{
  return (unint64_t)(self->_resourceType - 1) < 2;
}

- (BOOL)isRepresentation
{
  return (self->_resourceType < 0xFuLL) & (0x7160u >> self->_resourceType);
}

- (BOOL)isGrouped
{
  unsigned int v2 = [(PHImportAsset *)self groupingUUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasAudioAttachment
{
  unsigned int v2 = [(PHImportAsset *)self audioAsset];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isLivePhoto
{
  unsigned int v2 = [(PHImportAsset *)self videoComplement];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isBurst
{
  unsigned int v2 = [(PHImportAsset *)self burstUUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isSDOF
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if ([(PHImportAsset *)self isImage])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __23__PHImportAsset_isSDOF__block_invoke;
    v5[3] = &unk_1E5848D28;
    v5[4] = self;
    v5[5] = &v6;
    [(PHImportAsset *)self _accessMetadata:v5];
  }
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__PHImportAsset_isSDOF__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) isSDOF];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isHDR
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__PHImportAsset_isHDR__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportAsset *)self _accessMetadata:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __22__PHImportAsset_isHDR__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) isHDR];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isJpegPlusRAW
{
  char v2 = [(PHImportAsset *)self rawAsset];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isTimelapse
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if ([(PHImportAsset *)self isMovie])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __28__PHImportAsset_isTimelapse__block_invoke;
    v5[3] = &unk_1E5848D28;
    v5[4] = self;
    v5[5] = &v6;
    [(PHImportAsset *)self _accessMetadata:v5];
  }
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__PHImportAsset_isTimelapse__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) isTimelapse];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isAVCHD
{
  return 0;
}

- (BOOL)isSloMo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if ([(PHImportAsset *)self isMovie])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __24__PHImportAsset_isSloMo__block_invoke;
    v5[3] = &unk_1E5848D28;
    v5[4] = self;
    v5[5] = &v6;
    [(PHImportAsset *)self _accessMetadata:v5];
  }
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__PHImportAsset_isSloMo__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) isSloMo];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSidecar
{
  return (self->_resourceSubType & 0x20700) != 0;
}

- (BOOL)isPSD
{
  return BYTE1(self->_resourceSubType) >> 7;
}

- (BOOL)isPNG
{
  return (BYTE1(self->_resourceSubType) >> 5) & 1;
}

- (BOOL)isPDF
{
  return (BYTE1(self->_resourceSubType) >> 6) & 1;
}

- (BOOL)isGIF
{
  return (BYTE1(self->_resourceSubType) >> 4) & 1;
}

- (BOOL)isHEIF
{
  return (LOBYTE(self->_resourceSubType) >> 1) & 1;
}

- (BOOL)isTIFF
{
  return (LOBYTE(self->_resourceSubType) >> 4) & 1;
}

- (BOOL)isRAW
{
  return (LOBYTE(self->_resourceSubType) >> 3) & 1;
}

- (BOOL)isJPEG2000
{
  return (BYTE1(self->_resourceSubType) >> 3) & 1;
}

- (BOOL)isJPEG
{
  return self->_resourceSubType & 1;
}

- (BOOL)isAudio
{
  return self->_resourceType == 3;
}

- (BOOL)isMovie
{
  return PHIsVideoAssetResourceType(self->_resourceType);
}

- (BOOL)isImage
{
  return PHIsImageAssetResourceType(self->_resourceType);
}

- (BOOL)isDeviceAsset
{
  return 0;
}

- (BOOL)isValidForReference
{
  char v2 = [(PHImportAsset *)self url];
  char v3 = [v2 path];

  if (([v3 hasPrefix:@"/var"] & 1) != 0
    || ([v3 hasPrefix:@"/private/var"] & 1) != 0
    || ([v3 hasPrefix:@"/tmp"] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 hasPrefix:@"/private/tmp"] ^ 1;
  }

  return v4;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canReference
{
  return self->_canReference && [(PHImportAsset *)self hasOriginalResourceType];
}

- (NSString)parentFolderPath
{
  char v2 = [(NSURL *)self->_url path];
  char v3 = [v2 stringByDeletingLastPathComponent];

  return (NSString *)v3;
}

- (BOOL)canPreserveFolderStructure
{
  return 1;
}

- (id)descriptionWithPrefix:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"\n%@%@ <%p>", v4, objc_opt_class(), self];
  uint64_t v6 = NSString;
  uint64_t v7 = [(PHImportAsset *)self uuid];
  uint64_t v8 = [v6 stringWithFormat:@"\n\t%@uuid        : %@", v4, v7];
  char v9 = [v5 stringByAppendingString:v8];

  uint64_t v10 = NSString;
  CFDictionaryRef v11 = [(PHImportAsset *)self source];
  uint64_t v12 = [v11 name];
  uint64_t v13 = [v10 stringWithFormat:@"\n\t%@device      : %@", v4, v12];
  BOOL v14 = [v9 stringByAppendingString:v13];

  unint64_t v15 = NSString;
  __int16 v16 = [(PHImportAsset *)self parentFolderPath];
  BOOL v17 = [v15 stringWithFormat:@"\n\t%@folder      : %@", v4, v16];
  __int16 v18 = [v14 stringByAppendingString:v17];

  uint64_t v19 = NSString;
  uint64_t v20 = [(PHImportAsset *)self fileName];
  double v21 = [(PHImportAsset *)self createdFileName];
  __int16 v22 = [v19 stringWithFormat:@"\n\t%@name        : %@ (%@)", v4, v20, v21];
  __int16 v23 = [v18 stringByAppendingString:v22];

  uint64_t v24 = [NSString stringWithFormat:@"\n\t%@fileSize    : %llu", v4, -[PHImportAsset fileSize](self, "fileSize")];
  __int16 v25 = [v23 stringByAppendingString:v24];

  double v26 = NSString;
  uint64_t v27 = [(PHImportAsset *)self creationDate];
  __int16 v28 = [(PHImportAsset *)self fileCreationDate];
  __int16 v29 = v4;
  __int16 v30 = [v26 stringWithFormat:@"\n\t%@date        : %@ (%@)", v4, v27, v28];
  __int16 v31 = [v25 stringByAppendingString:v30];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  __int16 v32 = [(PHImportAsset *)self relatedAssets];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v43;
    do
    {
      uint64_t v36 = 0;
      __int16 v37 = v31;
      do
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(v32);
        }
        v38 = *(void **)(*((void *)&v42 + 1) + 8 * v36);
        uint64_t v39 = [NSString stringWithFormat:@"%@\t", v29];
        v40 = [v38 descriptionWithPrefix:v39];
        __int16 v31 = [v37 stringByAppendingString:v40];

        ++v36;
        __int16 v37 = v31;
      }
      while (v34 != v36);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v34);
  }

  return v31;
}

- (NSString)description
{
  char v3 = NSString;
  id v4 = [(PHImportAsset *)self fileName];
  uint64_t v5 = [(PHImportAsset *)self createdFileName];
  uint64_t v6 = [(PHImportAsset *)self parentFolderPath];
  uint64_t v7 = [(PHImportAsset *)self descriptionWithPrefix:&stru_1EEAC1950];
  uint64_t v8 = [v3 stringWithFormat:@"%@ (%@) [%@]%@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (PHImportAsset)initWithSource:(id)a3 url:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6 uuid:(id)a7
{
  unsigned int v8 = a6;
  v45[3] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  __int16 v16 = [(PHImportAsset *)self initWithSource:a3];
  BOOL v17 = v16;
  if (v16)
  {
    unsigned int v39 = v8;
    objc_storeStrong((id *)&v16->_url, a4);
    if (v15)
    {
      uint64_t v18 = [v15 copy];
      uuid = v17->_uuid;
      v17->_uuid = (NSString *)v18;
    }
    uint64_t v20 = [v13 lastPathComponent];
    fileName = v17->_fileName;
    v17->_fileName = v20;

    objc_storeStrong((id *)&v17->_createdFileName, v20);
    uint64_t v22 = *MEMORY[0x1E4F1C5F8];
    uint64_t v23 = *MEMORY[0x1E4F1C540];
    v45[0] = *MEMORY[0x1E4F1C5F8];
    v45[1] = v23;
    uint64_t v24 = *MEMORY[0x1E4F1C518];
    v45[2] = *MEMORY[0x1E4F1C518];
    __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    id v40 = 0;
    double v26 = [v13 resourceValuesForKeys:v25 error:&v40];
    id v27 = v40;

    if (v26)
    {
      __int16 v28 = [v26 objectForKeyedSubscript:v22];
      v17->_fileSize = [v28 longLongValue];

      uint64_t v29 = [v26 objectForKeyedSubscript:v23];
      fileCreationDate = v17->_fileCreationDate;
      v17->_fileCreationDate = (NSDate *)v29;

      uint64_t v31 = [v26 objectForKeyedSubscript:v24];
      p_super = &v17->_fileModificationDate->super;
      v17->_fileModificationDate = (NSDate *)v31;
    }
    else
    {
      p_super = PLImportGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v13];
        *(_DWORD *)long long buf = 138412546;
        long long v42 = v33;
        __int16 v43 = 2112;
        id v44 = v27;
        _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEFAULT, "failed to find resource attributes for %@: %@", buf, 0x16u);
      }
    }

    uint64_t v34 = [v13 pathExtension];
    if ([v34 isEqualToString:&stru_1EEAC1950]) {
      uint64_t v35 = 0;
    }
    else {
      uint64_t v35 = v34;
    }
    objc_storeStrong((id *)&v17->_fileExtension, v35);
    v17->_canReference = [(PHImportAsset *)v17 isValidForReference];
    v17->_copyMethod = 0;
    if (v14)
    {
      if ([(PHImportAsset *)v17 configureWithContentType:v14 supportedMediaType:v39])
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      __int16 v37 = [MEMORY[0x1E4F8CDF8] typeForURL:v13 error:0];
      BOOL v38 = [(PHImportAsset *)v17 configureWithContentType:v37 supportedMediaType:v39];

      if (v38) {
        goto LABEL_14;
      }
    }

    BOOL v17 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v17;
}

- (void)configureSidecarTypeForExtension:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"AAE"])
  {
    BOOL v5 = [(PHImportAsset *)self isOriginalAdjustmentData];
    int64_t v6 = 7;
    if (v5) {
      int64_t v6 = 16;
    }
    self->_int64_t resourceType = v6;
    self->_resourceSubType = 256;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"SLM"])
  {
    long long v7 = xmmword_19B2CC610;
LABEL_11:
    *(_OWORD *)&self->_int64_t resourceType = v7;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"XMP"])
  {
    long long v7 = xmmword_19B2CC600;
    goto LABEL_11;
  }
  if ([(PHImportAsset *)self isAdjustmentSecondaryData])
  {
    long long v7 = xmmword_19B2CC5F0;
    goto LABEL_11;
  }
  unsigned int v8 = PLImportGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    char v9 = [(PHImportAsset *)self redactedFileNameDescription];
    int v10 = 138412290;
    CFDictionaryRef v11 = v9;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Unknown sidecar type: %@", (uint8_t *)&v10, 0xCu);
  }
LABEL_12:
}

- (NSURL)securityScopedURL
{
  return 0;
}

- (PHImportAsset)initWithSource:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHImportAsset;
  BOOL v5 = [(PHImportAsset *)&v14 init];
  if (v5)
  {
    int64_t v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [v6 UUIDString];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    uint64_t v9 = objc_opt_new();
    duplicates = v5->_duplicates;
    v5->_duplicates = (NSMutableDictionary *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("load sidecars saynchronizer", 0);
    loadSidecars = v5->_loadSidecars;
    v5->_loadSidecars = (OS_dispatch_queue *)v11;

    v5->_sidecarsLoaded = 0;
    *(void *)&v5->_metadataLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_source, v4);
  }

  return v5;
}

- (BOOL)configureWithContentType:(id)a3 supportedMediaType:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    [(PHImportAsset *)self setContentType:v6];
    if (v4 > 15)
    {
      if (v4 != 16 && v4 != 32)
      {
        if (v4 == 64)
        {
          unsigned int v8 = [(NSString *)self->_fileName pathExtension];
          uint64_t v9 = [v8 uppercaseString];
          [(PHImportAsset *)self configureSidecarTypeForExtension:v9];
          goto LABEL_18;
        }
LABEL_16:
        unsigned int v8 = PLImportGetLog();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_19:

          goto LABEL_39;
        }
        uint64_t v9 = [(PHImportAsset *)self redactedFileNameDescription];
        int v18 = 138412290;
        uint64_t v19 = v9;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Expected the asset '%@' to be of type image, movie, audio or sidecar", (uint8_t *)&v18, 0xCu);
LABEL_18:

        goto LABEL_19;
      }
      *(_OWORD *)&self->_int64_t resourceType = xmmword_19B2CC630;
      if ([(PHImportAsset *)self isRender])
      {
        int64_t v10 = 6;
      }
      else if ([(PHImportAsset *)self isSpatialOverCapture])
      {
        int64_t v10 = 14;
      }
      else
      {
        if (![(PHImportAsset *)self isBase]) {
          goto LABEL_39;
        }
        int64_t v10 = 12;
      }
LABEL_38:
      self->_int64_t resourceType = v10;
      goto LABEL_39;
    }
    if (v4 != 2)
    {
      if (v4 == 4 || v4 == 8)
      {
        *(_OWORD *)&self->_int64_t resourceType = xmmword_19B2CC620;
LABEL_39:
        BOOL v7 = self->_resourceType != 0;
        goto LABEL_40;
      }
      goto LABEL_16;
    }
    if ([v6 conformsToType:*MEMORY[0x1E4F44410]])
    {
      unint64_t v11 = 1;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F8CDF8] jpeg2000Type];
      int v13 = [v6 conformsToType:v12];

      if (v13)
      {
        unint64_t v11 = 2048;
      }
      else
      {
        if (![v6 conformsToType:*MEMORY[0x1E4F44568]])
        {
          if ([v6 conformsToType:*MEMORY[0x1E4F444E0]])
          {
            self->_resourceSubType = 16;
            objc_super v14 = [(PHImportAsset *)self url];
            +[PHImportAsset determineIfTIFFIsRAW:self url:v14];
          }
          else
          {
            if ([v6 conformsToType:*MEMORY[0x1E4F44498]])
            {
              unint64_t v11 = 8;
              goto LABEL_28;
            }
            if ([v6 conformsToType:*MEMORY[0x1E4F443D0]])
            {
              unint64_t v11 = 4096;
              goto LABEL_28;
            }
            if ([v6 conformsToType:*MEMORY[0x1E4F44460]])
            {
              unint64_t v11 = 0x2000;
              goto LABEL_28;
            }
            if ([v6 conformsToType:*MEMORY[0x1E4F44450]])
            {
              unint64_t v11 = 0x4000;
              goto LABEL_28;
            }
            __int16 v16 = [MEMORY[0x1E4F8CDF8] adobePhotoshopType];
            int v17 = [v6 conformsToType:v16];

            if (v17)
            {
              unint64_t v11 = 0x8000;
              goto LABEL_28;
            }
          }
LABEL_29:
          if ([(PHImportAsset *)self isRender])
          {
            int64_t v10 = 5;
          }
          else if ([(PHImportAsset *)self isSpatialOverCapture])
          {
            int64_t v10 = 13;
          }
          else if ([(PHImportAsset *)self isBase])
          {
            int64_t v10 = 8;
          }
          else
          {
            int64_t v10 = 1;
          }
          goto LABEL_38;
        }
        unint64_t v11 = 2;
      }
    }
LABEL_28:
    self->_resourceSubType = v11;
    goto LABEL_29;
  }
  BOOL v7 = 0;
LABEL_40:

  return v7;
}

- (void)updateIsRAW:(BOOL)a3 contentType:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  if (v5)
  {
    self->_resourceSubType |= 8uLL;
    id v8 = v7;
    objc_storeStrong((id *)&self->_contentType, a4);
    id v7 = v8;
  }
}

- (NSObject)redactedFileNameDescription
{
  createdFileName = self->_createdFileName;
  if (!createdFileName) {
    createdFileName = self->_fileName;
  }
  int v4 = createdFileName;
  BOOL v5 = [[PHImportAssetNameDescription alloc] initWithFileName:v4 uuid:self->_uuid];

  return v5;
}

- (BOOL)shouldPreserveUUID
{
  return 0;
}

+ (BOOL)directoryExists:(id)a3
{
  memset(&v4, 0, sizeof(v4));
  return !stat((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v4)
      && (v4.st_mode & 0x4000) != 0;
}

+ (BOOL)fileExists:(id)a3
{
  memset(&v5, 0, sizeof(v5));
  return !stat((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v5)
      && (v5.st_mode & 0x8000u) != 0;
}

+ (BOOL)isOriginalAdjustmentData:(id)a3
{
  uint64_t v3 = isOriginalAdjustmentData__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isOriginalAdjustmentData__onceToken, &__block_literal_global_253);
  }
  uint64_t v5 = objc_msgSend((id)isOriginalAdjustmentData__isAdjustmentBaseDataRegEx, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v5 != 0;
}

void __42__PHImportAsset_isOriginalAdjustmentData___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\D{4}O\\d{4}" options:0 error:&v4];
  id v1 = v4;
  char v2 = (void *)isOriginalAdjustmentData__isAdjustmentBaseDataRegEx;
  isOriginalAdjustmentData__isAdjustmentBaseDataRegEx = v0;

  if (v1)
  {
    uint64_t v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v6 = v1;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}O\\d{4}': %@", buf, 0xCu);
    }
  }
}

+ (void)determineIfTIFFIsRAW:(id)a3 url:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFURLRef v6 = (const __CFURL *)a4;
  int v7 = [v5 isTIFF];
  if (v6)
  {
    if (v7)
    {
      uint64_t v12 = *MEMORY[0x1E4F2FF48];
      v13[0] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      uint64_t v9 = CGImageSourceCreateWithURL(v6, v8);

      if (v9)
      {
        int64_t v10 = CGImageSourceGetType(v9);
        if (v10)
        {
          unint64_t v11 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v10];
          objc_msgSend(v5, "updateIsRAW:contentType:", objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E4F44498]), v11);
        }
        CFRelease(v9);
      }
    }
  }
}

+ (id)loadDatesForAssets:(id)a3 atEnd:(id)a4
{
  id v5 = a3;
  CFURLRef v6 = (void (**)(void))a4;
  if ([v5 count]
    && ([v5 objectAtIndexedSubscript:0],
        int v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isDeviceAsset],
        v7,
        !v8))
  {
    int64_t v10 = objc_opt_new();
    unint64_t v11 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke;
    block[3] = &unk_1E58487E0;
    id v16 = v5;
    id v12 = v10;
    id v17 = v12;
    int v18 = v6;
    dispatch_async(v11, block);

    int v13 = v18;
    id v9 = v12;
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    id v9 = 0;
  }

  return v9;
}

void __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  if (PHImportConcurrencyLimit_onceToken != -1) {
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4867);
  }
  unint64_t v3 = PHImportConcurrencyLimit_concurrencyLimit;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke_2;
  v6[3] = &unk_1E58443B8;
  id v4 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  PHImportDispatchApply(v2, v3, v4, v6);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v2 loadMetadataSync];
}

+ (id)loadDatesForAssetSequence:(id)a3 atEnd:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  objc_super v14 = [a1 loadDatesForAssets:v8 atEnd:v7];

  return v14;
}

+ (void)logImageDateFileDateDifferencesForAsset:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 creationDate];
  uint64_t v5 = [v3 fileCreationDate];
  id v6 = (void *)v5;
  id v7 = @"!!!!!!!!!!";
  if (v4 && v5)
  {
    if ([v4 compare:v5])
    {
      int v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      double v9 = (double)[v8 secondsFromGMTForDate:v4];

      uint64_t v10 = [v4 dateByAddingTimeInterval:-v9];
      if ([v10 compare:v6]) {
        id v7 = @"----------";
      }
      else {
        id v7 = @"<-<-<-<-<-";
      }
    }
    else
    {
      id v7 = @"++++++++++";
    }
  }
  uint64_t v11 = PLImportGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v3 redactedFileNameDescription];
    int v13 = 138413058;
    objc_super v14 = v7;
    __int16 v15 = 2112;
    long long v16 = v4;
    __int16 v17 = 2112;
    long long v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "%@ CreateDate: %@, AlternateDate: %@, Name: %@", (uint8_t *)&v13, 0x2Au);
  }
}

+ (id)assetFileForURL:(id)a3 source:(id)a4 withUuid:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v44 = a5;
  uint64_t v10 = 0;
  if (v8 && v9)
  {
    uint64_t v11 = +[PHValidator mediaTypeForURL:v8];
    if (!v11)
    {
      uint64_t v12 = [v8 lastPathComponent];
      int v13 = [a1 isValidAsSidecar:v12];

      if (v13) {
        uint64_t v11 = 64;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    objc_super v14 = [MEMORY[0x1E4F8CDF8] typeForURL:v8 error:0];
    if (v11 >= 2)
    {
      uint64_t v10 = (PHImportAssetBundleAsset *)[objc_alloc((Class)a1) initWithSource:v9 url:v8 type:v14 supportedMediaType:v11 uuid:v44];
LABEL_38:

      goto LABEL_39;
    }
    if (PFIsLivePhotoBundleType())
    {
      __int16 v15 = objc_opt_new();
      long long v16 = [v8 path];
      id v49 = 0;
      __int16 v17 = [v15 contentsOfDirectoryAtPath:v16 error:&v49];
      id v18 = v49;

      if (v18)
      {
        __int16 v19 = PLImportGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v8];
          *(_DWORD *)long long buf = 138412546;
          __int16 v52 = v20;
          __int16 v53 = 2112;
          id v54 = v18;
        }
        uint64_t v10 = 0;
LABEL_37:

        goto LABEL_38;
      }
      id v41 = v17;
      long long v42 = v15;
      __int16 v43 = v14;
      double v26 = v8;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v27 = v17;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (!v28)
      {
        __int16 v19 = 0;
        uint64_t v10 = 0;
        goto LABEL_36;
      }
      uint64_t v29 = v28;
      __int16 v19 = 0;
      uint64_t v10 = 0;
      uint64_t v30 = *(void *)v46;
      uint64_t v31 = &off_1E5840000;
LABEL_24:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v33 = *(void *)(*((void *)&v45 + 1) + 8 * v32);
        if ([v31[356] isSupportedImageAtPath:v33]) {
          break;
        }
        if ([v31[356] isSupportedMovieAtPath:v33])
        {
          BOOL v38 = [PHImportAsset alloc];
          uint64_t v35 = [v26 URLByAppendingPathComponent:v33];
          uint64_t v39 = [(PHImportAsset *)v38 initWithSource:v9 url:v35 type:0 supportedMediaType:16 uuid:v44];
          __int16 v37 = (PHImportAssetBundleAsset *)v19;
          __int16 v19 = v39;
          goto LABEL_31;
        }
LABEL_32:
        if (v29 == ++v32)
        {
          uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (!v29)
          {
LABEL_36:

            [(PHImportAsset *)v10 setVideoComplement:v19];
            id v8 = v26;
            __int16 v15 = v42;
            objc_super v14 = v43;
            id v18 = 0;
            __int16 v17 = v41;
            goto LABEL_37;
          }
          goto LABEL_24;
        }
      }
      uint64_t v34 = [PHImportAsset alloc];
      uint64_t v35 = [v26 URLByAppendingPathComponent:v33];
      uint64_t v36 = [(PHImportAsset *)v34 initWithSource:v9 url:v35 type:0 supportedMediaType:2 uuid:v44];
      __int16 v37 = v10;
      uint64_t v10 = (PHImportAssetBundleAsset *)v36;
LABEL_31:

      uint64_t v31 = &off_1E5840000;
      goto LABEL_32;
    }
    uint64_t v21 = [MEMORY[0x1E4F8CBC0] contentType];
    int v22 = [v14 conformsToType:v21];

    if (v22)
    {
      uint64_t v10 = [[PHImportAssetBundleAsset alloc] initWithAssetBundleAtURL:v8 withImportSource:v9];
      if (v10) {
        goto LABEL_38;
      }
      uint64_t v23 = PLImportGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v8];
        *(_DWORD *)long long buf = 138412290;
        __int16 v52 = v24;
LABEL_20:
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v23 = PLImportGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v8];
        *(_DWORD *)long long buf = 138412290;
        __int16 v52 = v24;
        __int16 v25 = "Unable to create a import asset for resource '%@'";
        goto LABEL_20;
      }
    }

    uint64_t v10 = 0;
    goto LABEL_38;
  }
LABEL_39:

  return v10;
}

+ (id)assetFileForURL:(id)a3 source:(id)a4
{
  return (id)[a1 assetFileForURL:a3 source:a4 withUuid:0];
}

+ (BOOL)isValidAsSidecar:(id)a3
{
  id v3 = [a3 pathExtension];
  id v4 = [v3 uppercaseString];

  BOOL v5 = ([v4 isEqualToString:@"AAE"] & 1) != 0
    || ([v4 isEqualToString:@"SLM"] & 1) != 0
    || ([v4 isEqualToString:@"XMP"] & 1) != 0
    || [v4 isEqualToString:@"DAT"];

  return v5;
}

@end