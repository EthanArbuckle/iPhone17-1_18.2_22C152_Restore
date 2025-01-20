@interface PHImportDeviceAsset
+ (id)assetFileForFile:(id)a3 source:(id)a4;
+ (void)validateCameraFile:(id)a3;
- (BOOL)canDelete;
- (BOOL)canPreserveFolderStructure;
- (BOOL)canReference;
- (BOOL)containsDateKey:(id)a3;
- (BOOL)hasAudioAttachment;
- (BOOL)isBase;
- (BOOL)isDeviceAsset;
- (BOOL)isLivePhoto;
- (BOOL)isRAW;
- (BOOL)isRender;
- (BOOL)isSloMo;
- (BOOL)isSpatialOverCapture;
- (BOOL)isTagged;
- (BOOL)isViewable;
- (BOOL)performAdditionalLivePhotoChecksWithImageAsset:(id)a3;
- (CGSize)exifPixelSize;
- (CGSize)orientedPixelSize;
- (NSArray)cameraFiles;
- (PHImportDeviceAsset)initWithSource:(id)a3 cameraFile:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6;
- (id)burstUUID;
- (id)createMetadataFromProperties:(id)a3;
- (id)creationDate;
- (id)durationTimeInterval;
- (id)fingerprint;
- (id)livePhotoPairingIdentifier;
- (id)nameKey;
- (id)originatingAssetID;
- (id)parentFolderPath;
- (id)representedObject;
- (id)securityScopedURL;
- (id)spatialOverCaptureIdentifier;
- (int)burstPickType;
- (unsigned)orientation;
- (void)copyToURL:(id)a3 completionHandler:(id)a4;
- (void)loadMetadataAsync:(id)a3;
- (void)loadMetadataSync;
- (void)thumbnailUsingRequest:(id)a3 atEnd:(id)a4;
@end

@implementation PHImportDeviceAsset

- (void).cxx_destruct
{
}

- (id)nameKey
{
  v3 = [(PHImportAsset *)self createdFileName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportDeviceAsset;
    id v5 = [(PHImportAsset *)&v8 nameKey];
  }
  v6 = v5;

  return v6;
}

- (id)fingerprint
{
  return (id)[(ICCameraFile *)self->_cameraFile fingerprint];
}

- (id)originatingAssetID
{
  return [(ICCameraFile *)self->_cameraFile originatingAssetID];
}

- (void)copyToURL:(id)a3 completionHandler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 URLByDeletingLastPathComponent];
  uint64_t v27 = *MEMORY[0x1E4F2F308];
  v28[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v9 = PLImportGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(PHImportAsset *)self uuid];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
    v22 = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v13 = PHDescriptionsForResourceTypes(v12);
    v14 = [v13 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "REQUESTING DOWNLOAD: asset: %@, %@", buf, 0x16u);
  }
  cameraFile = self->_cameraFile;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__PHImportDeviceAsset_copyToURL_completionHandler___block_invoke;
  v19[3] = &unk_1E58457B8;
  v19[4] = self;
  id v20 = v7;
  id v21 = v6;
  id v16 = v6;
  id v17 = v7;
  id v18 = [(ICCameraFile *)cameraFile requestDownloadWithOptions:v8 completion:v19];
}

void __51__PHImportDeviceAsset_copyToURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = [PHImportException alloc];
    objc_super v8 = NSString;
    v9 = [*(id *)(*(void *)(a1 + 32) + 384) originalFilename];
    v10 = [*(id *)(*(void *)(a1 + 32) + 384) name];
    v11 = [v8 stringWithFormat:@"%@ (%@)", v9, v10];
    v12 = [(PHImportException *)v7 initWithType:0 path:v11 underlyingError:v6 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportDeviceAsset.m" line:502];
  }
  else
  {
    if (v5)
    {
      v13 = *(void **)(a1 + 40);
      if (v13)
      {
        v14 = [v13 URLByAppendingPathComponent:v5];
        v12 = 0;
        goto LABEL_10;
      }
      v15 = @"ICDownloadsDirectoryURL";
    }
    else
    {
      v15 = @"ICSavedFilename";
    }
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Options is missing the '%@' key", v15);
    id v17 = [PHImportException alloc];
    id v18 = [*(id *)(*(void *)(a1 + 32) + 384) name];
    v12 = [(PHImportException *)v17 initWithType:0 path:v18 underlyingError:v16 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportDeviceAsset.m" line:508];
  }
  v14 = 0;
LABEL_10:
  v19 = PLImportGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v20 = [*(id *)(a1 + 32) uuid];
    id v25 = v5;
    id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
    v26 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v23 = PHDescriptionsForResourceTypes(v22);
    v24 = [v23 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412546;
    v28 = v20;
    __int16 v29 = 2112;
    v30 = v24;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "FINISHED DOWNLOAD: asset: %@, %@", buf, 0x16u);

    id v5 = v25;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSArray)cameraFiles
{
  v3 = objc_opt_new();
  v4 = [(PHImportDeviceAsset *)self representedObject];
  [v3 addObject:v4];

  id v5 = [(PHImportAsset *)self largeRender];

  if (v5)
  {
    id v6 = [(PHImportAsset *)self largeRender];
    v7 = [v6 cameraFiles];
    [v3 addObjectsFromArray:v7];
  }
  objc_super v8 = [(PHImportAsset *)self rawAsset];

  if (v8)
  {
    v9 = [(PHImportAsset *)self rawAsset];
  }
  else
  {
    v10 = [(PHImportAsset *)self videoComplement];

    if (!v10) {
      goto LABEL_8;
    }
    v9 = [(PHImportAsset *)self videoComplement];
  }
  v11 = v9;
  v12 = [v9 cameraFiles];
  [v3 addObjectsFromArray:v12];

LABEL_8:
  v13 = [(PHImportAsset *)self audioAsset];

  if (v13)
  {
    v14 = [(PHImportAsset *)self audioAsset];
    v15 = [v14 cameraFiles];
    [v3 addObjectsFromArray:v15];
  }
  id v16 = [(PHImportAsset *)self adjustmentSidecar];
  if (v16
    || ([(PHImportAsset *)self slmSidecar], (id v16 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(PHImportAsset *)self xmpSidecar], (id v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v17 = [v16 cameraFiles];
    [v3 addObjectsFromArray:v17];
  }
  id v18 = [(PHImportAsset *)self originalAdjustmentSidecar];
  v19 = v18;
  if (v18)
  {
    id v20 = [v18 cameraFiles];
    [v3 addObjectsFromArray:v20];
  }

  return (NSArray *)v3;
}

- (void)thumbnailUsingRequest:(id)a3 atEnd:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = PLImportGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [(PHImportAsset *)self redactedFileNameDescription];
    *(_DWORD *)buf = 136315906;
    id v17 = "-[PHImportDeviceAsset thumbnailUsingRequest:atEnd:]";
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = [v6 longestSide];
    __int16 v22 = 2048;
    id v23 = v6;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "%s - %@ (%lu), <%p>", buf, 0x2Au);
  }
  v10 = [(PHImportAsset *)self url];
  v11 = [v10 path];

  if (v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)PHImportDeviceAsset;
    [(PHImportAsset *)&v15 thumbnailUsingRequest:v6 atEnd:v7];
  }
  else
  {
    v12 = [(PHImportAsset *)self source];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__PHImportDeviceAsset_thumbnailUsingRequest_atEnd___block_invoke;
    v13[3] = &unk_1E5845790;
    v13[4] = self;
    id v14 = v7;
    [v12 fetchThumbnailDataUsingRequest:v6 withCompletion:v13];
  }
}

void __51__PHImportDeviceAsset_thumbnailUsingRequest_atEnd___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v7 = a2;
  id v8 = a3;
  v9 = a4;
  v10 = [v8 requestAsset];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (v7)
  {
    double v12 = v11;
    uint64_t v44 = *MEMORY[0x1E4F2FF78];
    v13 = [(id)*MEMORY[0x1E4F44410] identifier];
    v45[0] = v13;
    CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    objc_super v15 = CGImageSourceCreateWithData(v7, v14);

    if (!v15) {
      goto LABEL_22;
    }
    uint64_t v16 = *MEMORY[0x1E4F2FE38];
    v42[0] = *MEMORY[0x1E4F2FE48];
    v42[1] = v16;
    v43[0] = MEMORY[0x1E4F1CC38];
    v43[1] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v15, 0, v17);

    if (ThumbnailAtIndex)
    {
      CFTypeRef v19 = CFAutorelease(ThumbnailAtIndex);
      [v10 exifPixelSize];
      double v22 = v21;
      double v23 = v20;
      if (v21 == *MEMORY[0x1E4F1DB30] && v20 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        uint64_t v24 = PLImportGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = [v10 redactedFileNameDescription];
          int v36 = 138543362;
          uint64_t v37 = (uint64_t)v25;
          _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "zero image size for %{public}@", (uint8_t *)&v36, 0xCu);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "removeBlackBarsFromExifThumbnail:fullSize:", v19, v22, v23);
      v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = [v10 redactedFileNameDescription];
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        int v36 = 138543618;
        uint64_t v37 = (uint64_t)v27;
        __int16 v38 = 2048;
        double v39 = v28 - v12;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, "Time to make thumbnail for %{public}@: %g", (uint8_t *)&v36, 0x16u);
      }
    }
    else
    {
      if ([v8 isCanceled])
      {
LABEL_21:
        CFRelease(v15);
        goto LABEL_22;
      }
      v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = [v10 redactedFileNameDescription];
        v34 = (void *)v33;
        *(double *)&v35 = COERCE_DOUBLE(@"Unknown reason");
        if (v9) {
          v35 = v9;
        }
        int v36 = 138543618;
        uint64_t v37 = v33;
        __int16 v38 = 2112;
        double v39 = *(double *)&v35;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Didn't get a thumbnail for %{public}@ (%@).", (uint8_t *)&v36, 0x16u);
      }
    }

    goto LABEL_21;
  }
  __int16 v29 = PLImportGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = [*(id *)(a1 + 32) source];
    uint64_t v31 = [v30 name];
    double v32 = [v10 redactedFileNameDescription];
    int v36 = 138412802;
    uint64_t v37 = (uint64_t)v31;
    __int16 v38 = 2114;
    double v39 = v32;
    __int16 v40 = 2048;
    id v41 = v8;
    _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_ERROR, "%@ returned nil image data for %{public}@ <%p>", (uint8_t *)&v36, 0x20u);
  }
LABEL_22:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)loadMetadataAsync:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  id v5 = PLImportGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(PHImportAsset *)self fileName];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[PHImportDeviceAsset loadMetadataAsync:]";
    __int16 v17 = 2112;
    __int16 v18 = v6;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "%s - %@", buf, 0x16u);
  }
  CFDataRef v7 = [(PHImportAsset *)self metadata];

  if (v7)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    id v8 = [(PHImportAsset *)self url];
    v9 = [v8 path];

    if (v9)
    {
      v14.receiver = self;
      v14.super_class = (Class)PHImportDeviceAsset;
      [(PHImportAsset *)&v14 loadMetadataAsync:v4];
    }
    else
    {
      v10 = [(PHImportAssetDataRequest *)[PHImportAssetMetadataRequest alloc] initWithAsset:self];
      [(PHImportAssetDataRequest *)v10 setAsset:self];
      double v11 = [(PHImportAsset *)self source];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __41__PHImportDeviceAsset_loadMetadataAsync___block_invoke;
      v12[3] = &unk_1E5845768;
      v13 = v4;
      [v11 fetchMetadataUsingRequest:v10 withCompletion:v12];
    }
  }
}

uint64_t __41__PHImportDeviceAsset_loadMetadataAsync___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadMetadataSync
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PHImportDeviceAsset_loadMetadataSync__block_invoke;
  v8[3] = &unk_1E5848578;
  v4 = v3;
  v9 = v4;
  [(PHImportDeviceAsset *)self loadMetadataAsync:v8];
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    id v6 = PLImportGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CFDataRef v7 = [(PHImportAsset *)self redactedFileNameDescription];
      *(_DWORD *)buf = 138543362;
      double v11 = v7;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Timed out getting metadata for %{public}@ from ImageCapture", buf, 0xCu);
    }
  }
}

intptr_t __39__PHImportDeviceAsset_loadMetadataSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)createMetadataFromProperties:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = [a3 mutableCopy];
    if (![(PHImportDeviceAsset *)self containsDateKey:v4])
    {
      dispatch_time_t v5 = [(ICCameraFile *)self->_cameraFile exifCreationDate];
      id v6 = v5;
      if (!v5)
      {
        id v6 = [(ICCameraFile *)self->_cameraFile fileCreationDate];
      }
      CFDataRef v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      id v8 = PFStringFromDateTimeZoneFormat();

      if (!v5) {
      if (v8)
      }
        [v4 setObject:v8 forKey:*MEMORY[0x1E4F2FD38]];
    }
    if ([(PHImportAsset *)self isImage])
    {
      id v9 = objc_alloc(MEMORY[0x1E4F8CC48]);
      v10 = [(PHImportAsset *)self contentType];
      double v11 = [(PHImportAsset *)self source];
      uint64_t v12 = [v11 timeZoneLookup];
      uint64_t v13 = [v9 initWithImageProperties:v4 contentType:v10 timeZoneLookup:v12];
LABEL_16:
      uint64_t v16 = (void *)v13;

      goto LABEL_21;
    }
    if ([(PHImportAsset *)self isMovie])
    {
      id v15 = objc_alloc(MEMORY[0x1E4F8CC48]);
      v10 = [(PHImportAsset *)self contentType];
      double v11 = [(PHImportAsset *)self source];
      uint64_t v12 = [v11 timeZoneLookup];
      uint64_t v13 = [v15 initWithImageCaptureMovieProperties:v4 contentType:v10 timeZoneLookup:v12];
      goto LABEL_16;
    }
    __int16 v17 = PLImportGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = [(PHImportAsset *)self redactedFileNameDescription];
      int v20 = 138543362;
      double v21 = v18;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Unexpected asset type for ICC properties (%{public}@)", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    v4 = PLImportGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_super v14 = [(PHImportAsset *)self redactedFileNameDescription];
      int v20 = 138543362;
      double v21 = v14;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Didn't get metadata for %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v16 = 0;
LABEL_21:

  return v16;
}

- (id)durationTimeInterval
{
  [(ICCameraFile *)self->_cameraFile duration];
  if (v3 == 0.0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PHImportDeviceAsset;
    dispatch_time_t v5 = [(PHImportAsset *)&v7 durationTimeInterval];
  }
  else
  {
    v4 = NSNumber;
    [(ICCameraFile *)self->_cameraFile duration];
    dispatch_time_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }

  return v5;
}

- (id)spatialOverCaptureIdentifier
{
  double v3 = [(ICCameraFile *)self->_cameraFile spatialOverCaptureGroupID];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportDeviceAsset;
    double v3 = [(PHImportAsset *)&v5 spatialOverCaptureIdentifier];
  }

  return v3;
}

- (id)livePhotoPairingIdentifier
{
  double v3 = [(ICCameraFile *)self->_cameraFile groupUUID];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportDeviceAsset;
    double v3 = [(PHImportAsset *)&v5 livePhotoPairingIdentifier];
  }

  return v3;
}

- (int)burstPickType
{
  int result = [(PHImportAsset *)self isBurst];
  if (result)
  {
    if ([(ICCameraFile *)self->_cameraFile burstFavorite]) {
      int v4 = 8;
    }
    else {
      int v4 = 0;
    }
    if ([(ICCameraFile *)self->_cameraFile burstPicked]) {
      v4 |= 4u;
    }
    BOOL v5 = [(ICCameraFile *)self->_cameraFile firstPicked];
    int v6 = v4 | 0x20;
    if (!v5) {
      int v6 = v4;
    }
    if (v6) {
      return v6;
    }
    else {
      return 2;
    }
  }
  return result;
}

- (id)burstUUID
{
  if ([(PHImportAsset *)self isImage])
  {
    v5.receiver = self;
    v5.super_class = (Class)PHImportDeviceAsset;
    double v3 = [(PHImportAsset *)&v5 burstUUID];
    if (!v3)
    {
      double v3 = [(ICCameraFile *)self->_cameraFile burstUUID];
    }
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (CGSize)orientedPixelSize
{
  uint64_t v3 = [(PHImportDeviceAsset *)self orientation];
  [(PHImportDeviceAsset *)self exifPixelSize];

  MEMORY[0x1F4140718](v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)exifPixelSize
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(ICCameraFile *)self->_cameraFile width] && [(ICCameraFile *)self->_cameraFile height])
  {
    ICEXIFOrientationType v3 = [(ICCameraFile *)self->_cameraFile orientation];
    cameraFile = self->_cameraFile;
    if (v3 < ICEXIFOrientation5)
    {
      double v5 = (double)[(ICCameraFile *)cameraFile width];
      uint64_t v6 = [(ICCameraFile *)self->_cameraFile height];
    }
    else
    {
      double v5 = (double)[(ICCameraFile *)cameraFile height];
      uint64_t v6 = [(ICCameraFile *)self->_cameraFile width];
    }
    double v9 = (double)v6;
  }
  else
  {
    objc_super v7 = PLImportGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(PHImportAsset *)self redactedFileNameDescription];
      *(_DWORD *)buf = 138543362;
      objc_super v14 = v8;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "ICCameraFile for %{public}@ has a zero width/height", buf, 0xCu);
    }
    v12.receiver = self;
    v12.super_class = (Class)PHImportDeviceAsset;
    [(PHImportAsset *)&v12 exifPixelSize];
    double v5 = v10;
  }
  double v11 = v5;
  result.height = v9;
  result.width = v11;
  return result;
}

- (unsigned)orientation
{
  unsigned int result = [(ICCameraFile *)self->_cameraFile orientation];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)PHImportDeviceAsset;
    return [(PHImportAsset *)&v4 orientation];
  }
  return result;
}

- (id)creationDate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  ICEXIFOrientationType v3 = PLImportGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_super v4 = [(PHImportAsset *)self redactedFileNameDescription];
    double v5 = [(PHImportAsset *)self metadata];
    v14.receiver = self;
    v14.super_class = (Class)PHImportDeviceAsset;
    uint64_t v6 = [(PHImportAsset *)&v14 creationDate];
    objc_super v7 = [(ICCameraFile *)self->_cameraFile creationDate];
    *(_DWORD *)buf = 138413058;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    __int16 v18 = v5;
    __int16 v19 = 2112;
    int v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "Getting creation date from ICCameraFile for '%@': super.creationDate (_metadata == %p): %@, creationDate: %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)PHImportDeviceAsset;
  id v8 = [(PHImportAsset *)&v13 creationDate];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(ICCameraFile *)self->_cameraFile creationDate];
  }
  double v11 = v10;

  return v11;
}

- (id)securityScopedURL
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  double v28 = __Block_byref_object_copy__23730;
  __int16 v29 = __Block_byref_object_dispose__23731;
  id v30 = 0;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__23730;
  uint64_t v23 = __Block_byref_object_dispose__23731;
  id v24 = 0;
  if (objc_opt_respondsToSelector())
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    cameraFile = self->_cameraFile;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__PHImportDeviceAsset_securityScopedURL__block_invoke;
    v15[3] = &unk_1E5846128;
    __int16 v17 = &v25;
    __int16 v18 = &v19;
    double v5 = v3;
    uint64_t v16 = v5;
    [(ICCameraFile *)cameraFile requestSecurityScopedURLWithCompletion:v15];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (!v26[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
    objc_super v7 = [(ICCameraFile *)self->_cameraFile valueForKey:@"fileSystemPath"];
    uint64_t v8 = [v6 fileURLWithPath:v7];
    double v9 = (void *)v26[5];
    v26[5] = v8;
  }
  id v10 = (void *)v26[5];
  if (!v10)
  {
    double v11 = PLImportGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v20[5];
      *(_DWORD *)buf = 138412546;
      double v32 = self;
      __int16 v33 = 2112;
      uint64_t v34 = v12;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "Failed to get a security-scoped URL for %@ (Error: %@)", buf, 0x16u);
    }

    id v10 = (void *)v26[5];
  }
  id v13 = v10;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v13;
}

void __40__PHImportDeviceAsset_securityScopedURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isViewable
{
  if ([(PHImportAsset *)self isImage]) {
    return 1;
  }
  dispatch_semaphore_t v3 = [(PHImportAsset *)self url];
  objc_super v4 = [v3 path];

  if (!v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)PHImportDeviceAsset;
  return [(PHImportAsset *)&v6 isViewable];
}

- (BOOL)isTagged
{
  return [(ICCameraFile *)self->_cameraFile isLocked];
}

- (BOOL)performAdditionalLivePhotoChecksWithImageAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCameraFile *)self->_cameraFile device];
  int v6 = [v5 isAppleDevice];

  if (v6)
  {
    uint64_t v7 = [v4 representedObject];
    uint64_t v8 = [v7 sidecarFiles];
    if ([v8 containsObject:self->_cameraFile])
    {
      char v9 = 1;
    }
    else
    {
      id v10 = [(ICCameraFile *)self->_cameraFile sidecarFiles];
      id v11 = [v4 representedObject];
      char v9 = [v10 containsObject:v11];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isBase
{
  v3.receiver = self;
  v3.super_class = (Class)PHImportDeviceAsset;
  return [(PHImportAsset *)&v3 isBase];
}

- (BOOL)isSpatialOverCapture
{
  objc_super v3 = [(ICCameraFile *)self->_cameraFile spatialOverCaptureGroupID];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHImportDeviceAsset;
    BOOL v4 = [(PHImportAsset *)&v6 isSpatialOverCapture];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isRender
{
  BOOL v4 = [(PHImportAsset *)self source];
  int v5 = [v4 isAppleDevice];
  if (v5
    && ([(ICCameraFile *)self->_cameraFile relatedUUID],
        (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportDeviceAsset;
    BOOL v6 = [(PHImportAsset *)&v8 isRender];
    if (!v5) {
      goto LABEL_7;
    }
  }

LABEL_7:
  return v6;
}

- (BOOL)isSloMo
{
  if (![(PHImportAsset *)self isMovie]) {
    return 0;
  }
  BOOL v3 = [(ICCameraFile *)self->_cameraFile highFramerate];
  BOOL v4 = [(ICCameraFile *)self->_cameraFile device];
  int v5 = [v4 productVersion];

  if (!v3 && v5)
  {
    if ((int)[v5 intValue] > 7)
    {
      BOOL v3 = 0;
    }
    else
    {
      [(PHImportAsset *)self loadSidecarFiles];
      BOOL v6 = [(PHImportAsset *)self slmSidecar];
      BOOL v3 = v6 != 0;
    }
  }

  return v3;
}

- (BOOL)hasAudioAttachment
{
  [(PHImportAsset *)self loadSidecarFiles];
  v4.receiver = self;
  v4.super_class = (Class)PHImportDeviceAsset;
  return [(PHImportAsset *)&v4 hasAudioAttachment];
}

- (BOOL)isLivePhoto
{
  [(PHImportAsset *)self loadSidecarFiles];
  v4.receiver = self;
  v4.super_class = (Class)PHImportDeviceAsset;
  return [(PHImportAsset *)&v4 isLivePhoto];
}

- (BOOL)isRAW
{
  return [(ICCameraFile *)self->_cameraFile isRaw];
}

- (BOOL)canDelete
{
  if ([(ICCameraFile *)self->_cameraFile isLocked])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_super v4 = [(ICCameraFile *)self->_cameraFile device];
    int v3 = [v4 iCloudPhotosEnabled] ^ 1;
  }
  return v3;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)isDeviceAsset
{
  return 1;
}

- (id)parentFolderPath
{
  v2 = [(ICCameraFile *)self->_cameraFile parentFolder];
  int v3 = [v2 name];

  return v3;
}

- (BOOL)canPreserveFolderStructure
{
  return 0;
}

- (id)representedObject
{
  return self->_cameraFile;
}

- (BOOL)containsDateKey:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4F2F800]];
  int v5 = [v3 objectForKey:*MEMORY[0x1E4F2FD40]];
  BOOL v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4F2FD38];
  if (v4)
  {
    objc_super v8 = [v4 objectForKey:*MEMORY[0x1E4F2FD38]];
    if (!v8)
    {
      char v9 = [v4 objectForKey:v7];
      if (!v9)
      {
        id v10 = [v4 objectForKey:*MEMORY[0x1E4F2F7F0]];
        if (!v10)
        {
          uint64_t v11 = *MEMORY[0x1E4F2F7E8];
          id v12 = v4;
LABEL_18:
          objc_super v14 = [v12 objectForKey:v11];
          BOOL v13 = v14 != 0;

          id v10 = 0;
          goto LABEL_19;
        }
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  else if (v5)
  {
    objc_super v8 = [v5 objectForKey:*MEMORY[0x1E4F2FD38]];
    if (!v8)
    {
      char v9 = [v6 objectForKey:v7];
      if (!v9)
      {
        id v10 = [v6 objectForKey:*MEMORY[0x1E4F2F7F0]];
        if (!v10)
        {
          uint64_t v11 = *MEMORY[0x1E4F2F7E8];
          id v12 = v6;
          goto LABEL_18;
        }
LABEL_16:
        BOOL v13 = 1;
LABEL_19:

        char v9 = 0;
        goto LABEL_20;
      }
LABEL_14:
      BOOL v13 = 1;
LABEL_20:

      objc_super v8 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    objc_super v8 = [v3 objectForKey:*MEMORY[0x1E4F2FD38]];
    if (!v8)
    {
      char v9 = [v3 objectForKey:v7];
      if (!v9)
      {
        id v10 = [v3 objectForKey:*MEMORY[0x1E4F2F7F0]];
        if (!v10)
        {
          uint64_t v11 = *MEMORY[0x1E4F2F7E8];
          id v12 = v3;
          goto LABEL_18;
        }
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  BOOL v13 = 1;
LABEL_21:

  return v13;
}

- (PHImportDeviceAsset)initWithSource:(id)a3 cameraFile:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PHImportDeviceAsset;
  BOOL v13 = [(PHImportAsset *)&v30 initWithSource:a3];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cameraFile, a4);
    uint64_t v15 = [v11 name];
    [(PHImportAsset *)v14 setFileName:v15];

    uint64_t v16 = [v11 createdFilename];
    [(PHImportAsset *)v14 setCreatedFileName:v16];

    -[PHImportAsset setFileSize:](v14, "setFileSize:", [v11 fileSize]);
    __int16 v17 = [v11 fileCreationDate];
    if (v17)
    {
      [(PHImportAsset *)v14 setFileCreationDate:v17];
    }
    else
    {
      __int16 v18 = [v11 creationDate];
      [(PHImportAsset *)v14 setFileCreationDate:v18];
    }
    uint64_t v19 = [v11 fileModificationDate];
    if (v19)
    {
      [(PHImportAsset *)v14 setFileModificationDate:v19];
    }
    else
    {
      int v20 = [v11 modificationDate];
      [(PHImportAsset *)v14 setFileModificationDate:v20];
    }
    uint64_t v21 = [v11 name];
    uint64_t v22 = [v21 pathExtension];
    [(PHImportAsset *)v14 setFileExtension:v22];

    uint64_t v23 = [v11 UTI];
    uint64_t v24 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v23];
    uint64_t v25 = (void *)v24;
    if (v12) {
      id v26 = v12;
    }
    else {
      id v26 = (id)v24;
    }
    if ([(PHImportAsset *)v14 configureWithContentType:v26 supportedMediaType:v6])
    {
      uint64_t v27 = [(PHImportAsset *)v14 uuid];
      double v28 = [v11 userData];
      [v28 setObject:v27 forKeyedSubscript:@"uuid"];
    }
    else
    {
      uint64_t v27 = v14;
      objc_super v14 = 0;
    }
  }
  return v14;
}

+ (void)validateCameraFile:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = PLImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "+[PHImportDeviceAsset validateCameraFile:]";
    __int16 v49 = 2112;
    id v50 = v3;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEBUG, "%s - %@", buf, 0x16u);
  }

  int v5 = [v3 name];

  if (!v5)
  {
    uint64_t v16 = PLImportGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_33:

      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
    uint64_t v19 = "ERROR: name == nil";
    int v20 = v16;
    uint32_t v21 = 2;
LABEL_32:
    _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_33;
  }
  uint64_t v6 = [v3 name];
  BOOL v7 = +[PHValidator isSupportedImageAtPath:v6];

  if (v7)
  {
    if (![v3 width])
    {
      objc_super v8 = PLImportGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "ERROR: width == 0", buf, 2u);
      }
    }
    if (![v3 height])
    {
      char v9 = PLImportGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "ERROR: height == 0", buf, 2u);
      }
    }
  }
  id v10 = [v3 name];
  BOOL v11 = +[PHValidator isSupportedMovieAtPath:v10];

  if (v11)
  {
    if (![v3 width])
    {
      id v12 = PLImportGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "ERROR: width == 0", buf, 2u);
      }
    }
    if (![v3 height])
    {
      BOOL v13 = PLImportGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "ERROR: height == 0", buf, 2u);
      }
    }
    [v3 duration];
    if (v14 == 0.0)
    {
      uint64_t v15 = PLImportGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "ERROR: duration == 0", buf, 2u);
      }
    }
    uint64_t v16 = PLImportGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    int v17 = [v3 highFramerate];
    __int16 v18 = @"NO";
    if (v17) {
      __int16 v18 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v48 = (const char *)v18;
    uint64_t v19 = "highFramerate: %@";
    int v20 = v16;
    uint32_t v21 = 12;
    goto LABEL_32;
  }
LABEL_34:
  uint64_t v22 = [v3 originalFilename];

  if (!v22)
  {
    uint64_t v23 = PLImportGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEBUG, "ERROR: originalFilename == nil", buf, 2u);
    }
  }
  uint64_t v24 = [v3 createdFilename];

  if (!v24)
  {
    uint64_t v25 = PLImportGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "INFO: createdFilename == nil", buf, 2u);
    }
  }
  if (![v3 fileSize])
  {
    id v26 = PLImportGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, "ERROR: fileSize == 0", buf, 2u);
    }
  }
  uint64_t v27 = [v3 creationDate];

  if (!v27)
  {
    double v28 = PLImportGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEBUG, "ERROR: creationDate == nil", buf, 2u);
    }
  }
  __int16 v29 = [v3 modificationDate];

  if (!v29)
  {
    objc_super v30 = PLImportGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEBUG, "ERROR: modificationDate == nil", buf, 2u);
    }
  }
  uint64_t v31 = [v3 UTI];

  if (!v31)
  {
    double v32 = PLImportGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_DEBUG, "ERROR: UTI == nil", buf, 2u);
    }
  }
  __int16 v33 = [v3 parentFolder];

  if (!v33)
  {
    uint64_t v34 = PLImportGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEBUG, "ERROR: parentFolder == nil", buf, 2u);
    }
  }
  uint64_t v35 = [v3 device];

  if (!v35)
  {
    int v36 = PLImportGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_DEBUG, "ERROR: device == nil", buf, 2u);
    }
  }
  uint64_t v37 = PLImportGetLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v46 = [v3 orientation];
    __int16 v38 = [v3 burstUUID];
    if ([v3 burstFavorite]) {
      double v39 = @"YES";
    }
    else {
      double v39 = @"NO";
    }
    if ([v3 burstPicked]) {
      __int16 v40 = @"YES";
    }
    else {
      __int16 v40 = @"NO";
    }
    if ([v3 firstPicked]) {
      id v41 = @"YES";
    }
    else {
      id v41 = @"NO";
    }
    if ([v3 timeLapse]) {
      v42 = @"YES";
    }
    else {
      v42 = @"NO";
    }
    v43 = [v3 originatingAssetID];
    uint64_t v44 = [v3 groupUUID];
    v45 = [v3 relatedUUID];
    *(_DWORD *)buf = 134220034;
    v48 = (const char *)v46;
    __int16 v49 = 2112;
    id v50 = v38;
    __int16 v51 = 2112;
    v52 = v39;
    __int16 v53 = 2112;
    v54 = v40;
    __int16 v55 = 2112;
    v56 = v41;
    __int16 v57 = 2112;
    v58 = v42;
    __int16 v59 = 2112;
    v60 = v43;
    __int16 v61 = 2112;
    v62 = v44;
    __int16 v63 = 2112;
    v64 = v45;
    _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEBUG, "orientation: %lu, burstUUID: %@, burstFavorite: %@, burstPicked: %@, firstPicked: %@, timeLapse: %@, originatingAssetID: %@, groupUUID: %@, relatedUUID: %@", buf, 0x5Cu);
  }
}

+ (id)assetFileForFile:(id)a3 source:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1E4F8CDF8];
  objc_super v8 = [v5 name];
  char v9 = [v8 pathExtension];
  id v10 = [v7 resourceModelTypeForFilenameExtension:v9];

  uint64_t v11 = +[PHValidator mediaTypeForContentType:v10];
  if (v11 != 1)
  {
    uint64_t v12 = v11;
    if (v11)
    {
LABEL_5:
      uint64_t v15 = [[PHImportDeviceAsset alloc] initWithSource:v6 cameraFile:v5 type:v10 supportedMediaType:v12];
      goto LABEL_7;
    }
    BOOL v13 = [v5 name];
    BOOL v14 = +[PHImportAsset isValidAsSidecar:v13];

    if (v14)
    {
      uint64_t v12 = 64;
      goto LABEL_5;
    }
  }
  uint64_t v15 = 0;
LABEL_7:

  return v15;
}

@end