@interface CAMStillImageCaptureResult
- ($2825F4736939C4A6D3AD43837233062D)predictedFinalAssetPhotoDimensions;
- (AVCapturePhoto)capturePhoto;
- (BOOL)isExpectingPairedVideo;
- (BOOL)representsDeferredFilteredProxy;
- (BOOL)shouldPersistAdjustmentSidecar;
- (CAMCaptureCoordinationInfo)coordinationInfo;
- (CAMStillImageCaptureResult)initWithCaptureDeferredPhotoProxy:(id)a3 expectingPairedVideo:(BOOL)a4 adjustmentFilters:(id)a5 filteredPreviewSurface:(__IOSurface *)a6 shouldPersistAdjustmentSidecar:(BOOL)a7 persistenceUUID:(id)a8 coordinationInfo:(id)a9 semanticEnhancement:(int64_t)a10 error:(id)a11;
- (CAMStillImageCaptureResult)initWithCapturePhoto:(id)a3 expectingPairedVideo:(BOOL)a4 adjustmentFilters:(id)a5 filteredPreviewSurface:(__IOSurface *)a6 shouldPersistAdjustmentSidecar:(BOOL)a7 persistenceUUID:(id)a8 coordinationInfo:(id)a9 semanticEnhancement:(int64_t)a10 error:(id)a11;
- (CAMStillImageCaptureResult)initWithFullsizeSurface:(__IOSurface *)a3 size:(unint64_t)a4 unfilteredPreviewSurface:(__IOSurface *)a5 filteredPreviewSurface:(__IOSurface *)a6 metadata:(id)a7 expectingPairedVideo:(BOOL)a8 shouldPersistAdjustmentSidecar:(BOOL)a9 adjustmentFilters:(id)a10 persistenceUUID:(id)a11 coordinationInfo:(id)a12 error:(id)a13;
- (NSArray)adjustmentFilters;
- (NSDate)captureDate;
- (NSDictionary)compactMetadata;
- (NSDictionary)metadata;
- (NSError)error;
- (NSString)deferredPhotoIdentifier;
- (NSString)imageGroupIdentifier;
- (NSString)persistenceUUID;
- (__IOSurface)stillImageFilteredPreviewSurface;
- (__IOSurface)stillImageFullsizeSurface;
- (__IOSurface)stillImageUnfilteredPreviewSurface;
- (id)_captureDateFromMetadata:(id)a3;
- (id)description;
- (int64_t)semanticEnhancement;
- (unint64_t)stillImageFullsizeSurfaceSize;
- (void)dealloc;
@end

@implementation CAMStillImageCaptureResult

- (id)_captureDateFromMetadata:(id)a3
{
  v3 = +[CAMCaptureMetadataUtilities preciseCaptureDateFromStillImageMetadata:self->_metadata];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (__IOSurface)stillImageFilteredPreviewSurface
{
  return self->_stillImageFilteredPreviewSurface;
}

- (__IOSurface)stillImageUnfilteredPreviewSurface
{
  return self->_stillImageUnfilteredPreviewSurface;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (AVCapturePhoto)capturePhoto
{
  return self->_capturePhoto;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (NSArray)adjustmentFilters
{
  return self->_adjustmentFilters;
}

- (NSDictionary)compactMetadata
{
  v25[8] = *MEMORY[0x263EF8340];
  v2 = [(CAMStillImageCaptureResult *)self metadata];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = *MEMORY[0x263F0F4A0];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F0F4A0]];
  [v3 removeObjectForKey:@"{Diagnostic}"];
  [v3 removeObjectForKey:@"AddDebugInfoToUserComments"];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = *MEMORY[0x263F2C030];
    v25[0] = *MEMORY[0x263F2C028];
    v25[1] = v7;
    uint64_t v8 = *MEMORY[0x263F2C048];
    v25[2] = *MEMORY[0x263F2C050];
    v25[3] = v8;
    uint64_t v9 = *MEMORY[0x263EF94F0];
    v25[4] = *MEMORY[0x263EF94E0];
    v25[5] = v9;
    uint64_t v10 = *MEMORY[0x263F2C060];
    v25[6] = *MEMORY[0x263EF94E8];
    v25[7] = v10;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:8];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v17 = objc_msgSend(v5, "objectForKeyedSubscript:", v16, (void)v20);
          [v6 setObject:v17 forKeyedSubscript:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v3 setObject:v6 forKeyedSubscript:v4];
  }
  v18 = objc_msgSend(v3, "copy", (void)v20);

  return (NSDictionary *)v18;
}

- (void)dealloc
{
  stillImageFullsizeSurface = self->_stillImageFullsizeSurface;
  if (stillImageFullsizeSurface)
  {
    CFRelease(stillImageFullsizeSurface);
    self->_stillImageFullsizeSurface = 0;
  }
  stillImageUnfilteredPreviewSurface = self->_stillImageUnfilteredPreviewSurface;
  if (stillImageUnfilteredPreviewSurface)
  {
    CFRelease(stillImageUnfilteredPreviewSurface);
    self->_stillImageUnfilteredPreviewSurface = 0;
  }
  stillImageFilteredPreviewSurface = self->_stillImageFilteredPreviewSurface;
  if (stillImageFilteredPreviewSurface)
  {
    CFRelease(stillImageFilteredPreviewSurface);
    self->_stillImageFilteredPreviewSurface = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMStillImageCaptureResult;
  [(CAMStillImageCaptureResult *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
  objc_storeStrong((id *)&self->_adjustmentFilters, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_deferredPhotoIdentifier, 0);
  objc_storeStrong((id *)&self->_capturePhoto, 0);
}

- (CAMStillImageCaptureResult)initWithFullsizeSurface:(__IOSurface *)a3 size:(unint64_t)a4 unfilteredPreviewSurface:(__IOSurface *)a5 filteredPreviewSurface:(__IOSurface *)a6 metadata:(id)a7 expectingPairedVideo:(BOOL)a8 shouldPersistAdjustmentSidecar:(BOOL)a9 adjustmentFilters:(id)a10 persistenceUUID:(id)a11 coordinationInfo:(id)a12 error:(id)a13
{
  id v18 = a7;
  id v19 = a10;
  id v20 = a11;
  id v35 = a12;
  id v34 = a13;
  v36.receiver = self;
  v36.super_class = (Class)CAMStillImageCaptureResult;
  long long v21 = [(CAMStillImageCaptureResult *)&v36 init];
  long long v22 = v21;
  if (v21)
  {
    if (a3)
    {
      v21->_stillImageFullsizeSurface = a3;
      v21->_stillImageFullsizeSurfaceSize = a4;
      CFRetain(a3);
    }
    if (a5)
    {
      v22->_stillImageUnfilteredPreviewSurface = a5;
      CFRetain(a5);
    }
    if (a6)
    {
      v22->_stillImageFilteredPreviewSurface = a6;
      CFRetain(a6);
    }
    uint64_t v23 = [v18 copy];
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v23;

    objc_storeStrong((id *)&v22->_error, a13);
    v22->_shouldPersistAdjustmentSidecar = a9;
    uint64_t v25 = [v19 copy];
    adjustmentFilters = v22->_adjustmentFilters;
    v22->_adjustmentFilters = (NSArray *)v25;

    uint64_t v27 = [v20 copy];
    persistenceUUID = v22->_persistenceUUID;
    v22->_persistenceUUID = (NSString *)v27;

    objc_storeStrong((id *)&v22->_coordinationInfo, a12);
    v22->_semanticEnhancement = 0;
    v22->_expectingPairedVideo = a8;
    uint64_t v29 = [(CAMStillImageCaptureResult *)v22 _captureDateFromMetadata:v22->_metadata];
    captureDate = v22->_captureDate;
    v22->_captureDate = (NSDate *)v29;

    v31 = v22;
  }

  return v22;
}

- (CAMStillImageCaptureResult)initWithCapturePhoto:(id)a3 expectingPairedVideo:(BOOL)a4 adjustmentFilters:(id)a5 filteredPreviewSurface:(__IOSurface *)a6 shouldPersistAdjustmentSidecar:(BOOL)a7 persistenceUUID:(id)a8 coordinationInfo:(id)a9 semanticEnhancement:(int64_t)a10 error:(id)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v38 = a11;
  v39.receiver = self;
  v39.super_class = (Class)CAMStillImageCaptureResult;
  long long v21 = [(CAMStillImageCaptureResult *)&v39 init];
  long long v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_capturePhoto, a3);
    uint64_t v23 = [v17 metadata];
    uint64_t v24 = [v23 copy];
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v24;

    objc_storeStrong((id *)&v22->_error, a11);
    uint64_t v26 = [v18 copy];
    adjustmentFilters = v22->_adjustmentFilters;
    v22->_adjustmentFilters = (NSArray *)v26;

    uint64_t v28 = [v19 copy];
    persistenceUUID = v22->_persistenceUUID;
    v22->_persistenceUUID = (NSString *)v28;

    objc_storeStrong((id *)&v22->_coordinationInfo, a9);
    v22->_shouldPersistAdjustmentSidecar = a7;
    v22->_expectingPairedVideo = a4;
    v22->_semanticEnhancement = a10;
    uint64_t v30 = [(CAMStillImageCaptureResult *)v22 _captureDateFromMetadata:v22->_metadata];
    captureDate = v22->_captureDate;
    v22->_captureDate = (NSDate *)v30;

    v32 = [(AVCapturePhoto *)v22->_capturePhoto portraitMetadata];
    if (v32)
    {
      v33 = +[CAMCaptureCapabilities capabilities];
      v22->_representsDeferredFilteredProxy = [v33 isDeferredPortraitRenderingSupported];
    }
    else
    {
      v22->_representsDeferredFilteredProxy = 0;
    }

    if (a6)
    {
      v22->_stillImageFilteredPreviewSurface = a6;
      CFRetain(a6);
    }
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v17 previewPixelBuffer]);
    if (IOSurface)
    {
      v22->_stillImageUnfilteredPreviewSurface = IOSurface;
      CFRetain(IOSurface);
    }
    id v35 = v22;
  }

  return v22;
}

- (CAMStillImageCaptureResult)initWithCaptureDeferredPhotoProxy:(id)a3 expectingPairedVideo:(BOOL)a4 adjustmentFilters:(id)a5 filteredPreviewSurface:(__IOSurface *)a6 shouldPersistAdjustmentSidecar:(BOOL)a7 persistenceUUID:(id)a8 coordinationInfo:(id)a9 semanticEnhancement:(int64_t)a10 error:(id)a11
{
  BOOL v12 = a7;
  BOOL v15 = a4;
  id v17 = a3;
  id v18 = [(CAMStillImageCaptureResult *)self initWithCapturePhoto:v17 expectingPairedVideo:v15 adjustmentFilters:a5 filteredPreviewSurface:a6 shouldPersistAdjustmentSidecar:v12 persistenceUUID:a8 coordinationInfo:a9 semanticEnhancement:a10 error:a11];
  uint64_t v19 = [v17 deferredPhotoIdentifier];

  deferredPhotoIdentifier = v18->_deferredPhotoIdentifier;
  v18->_deferredPhotoIdentifier = (NSString *)v19;

  return v18;
}

- (NSString)imageGroupIdentifier
{
  v2 = [(CAMStillImageCaptureResult *)self metadata];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F0F4A0]];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F2C048]];

  return (NSString *)v4;
}

- ($2825F4736939C4A6D3AD43837233062D)predictedFinalAssetPhotoDimensions
{
  if (self->_deferredPhotoIdentifier)
  {
    v2 = [(AVCapturePhoto *)self->_capturePhoto resolvedSettings];
    unint64_t v3 = [v2 photoDimensions];
    unsigned int v4 = v3;
    uint64_t v5 = HIDWORD(v3);
  }
  else
  {
    v2 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F0F248]];
    objc_super v6 = [v2 objectForKeyedSubscript:*MEMORY[0x263F0F2E8]];
    uint64_t v7 = [v2 objectForKeyedSubscript:*MEMORY[0x263F0F2F0]];
    unsigned int v4 = [v6 intValue];
    uint64_t v5 = [v7 intValue];
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | (unint64_t)(v5 << 32));
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CAMStillImageCaptureResult *)self error];
  objc_super v6 = [(CAMStillImageCaptureResult *)self captureDate];
  uint64_t v7 = [(CAMStillImageCaptureResult *)self captureDate];
  [v7 timeIntervalSince1970];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ error:%@, captureDate:%@ (%.3f)>", v4, v5, v6, v8];

  return v9;
}

- (__IOSurface)stillImageFullsizeSurface
{
  return self->_stillImageFullsizeSurface;
}

- (unint64_t)stillImageFullsizeSurfaceSize
{
  return self->_stillImageFullsizeSurfaceSize;
}

- (NSString)deferredPhotoIdentifier
{
  return self->_deferredPhotoIdentifier;
}

- (BOOL)shouldPersistAdjustmentSidecar
{
  return self->_shouldPersistAdjustmentSidecar;
}

- (BOOL)representsDeferredFilteredProxy
{
  return self->_representsDeferredFilteredProxy;
}

- (int64_t)semanticEnhancement
{
  return self->_semanticEnhancement;
}

@end