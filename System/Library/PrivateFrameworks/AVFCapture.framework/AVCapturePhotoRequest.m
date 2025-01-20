@interface AVCapturePhotoRequest
+ (id)requestWithDelegate:(id)a3 settings:(id)a4 lensStabilizationSupported:(BOOL)a5;
+ (void)initialize;
- (AVCapturePhotoRequest)initWithDelegate:(id)a3 settings:(id)a4 lensStabilizationSupported:(BOOL)a5;
- (AVCapturePhotoSettings)unresolvedSettings;
- (AVCaptureResolvedPhotoSettings)resolvedSettings;
- (AVWeakReferencingDelegateStorage)delegateStorage;
- (BOOL)delegateSupportsDebugMetadataSidecarFile;
- (BOOL)delegateSupportsMetadataIdentifiersCallback;
- (BOOL)lensStabilizationSupported;
- (NSArray)expectedPhotoManifest;
- (__IOSurface)previewSurface;
- (__IOSurface)thumbnailSurface;
- (opaqueCMSampleBuffer)previewSampleBuffer;
- (unint64_t)expectedPhotoCount;
- (unint64_t)firedPhotoCallbacksCount;
- (unsigned)firedCallbackFlags;
- (unsigned)photoCallbackFlavor;
- (void)_resolveExpectedPhotoManifest;
- (void)dealloc;
- (void)setFiredCallbackFlags:(unsigned int)a3;
- (void)setFiredPhotoCallbacksCount:(unint64_t)a3;
- (void)setPreviewSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setPreviewSurface:(__IOSurface *)a3;
- (void)setResolvedSettings:(id)a3;
- (void)setThumbnailSurface:(__IOSurface *)a3;
@end

@implementation AVCapturePhotoRequest

+ (void)initialize
{
}

+ (id)requestWithDelegate:(id)a3 settings:(id)a4 lensStabilizationSupported:(BOOL)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:a3 settings:a4 lensStabilizationSupported:a5];

  return v5;
}

- (AVCapturePhotoRequest)initWithDelegate:(id)a3 settings:(id)a4 lensStabilizationSupported:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AVCapturePhotoRequest;
  v8 = [(AVCapturePhotoRequest *)&v12 init];
  if (v8)
  {
    v9 = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E4F47DF8]);
    v8->_delegateStorage = v9;
    [(AVWeakReferencingDelegateStorage *)v9 setDelegate:a3 queue:MEMORY[0x1E4F14428]];
    v8->_unresolvedSettings = (AVCapturePhotoSettings *)a4;
    v8->_lensStabilizationSupported = a5;
    [(AVCapturePhotoRequest *)v8 _resolveExpectedPhotoManifest];
    if (objc_opt_respondsToSelector())
    {
      int v10 = 0;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_8;
      }
      int v10 = 1;
    }
    v8->_photoCallbackFlavor = v10;
LABEL_8:
    v8->_delegateSupportsDebugMetadataSidecarFile = objc_opt_respondsToSelector() & 1;
    v8->_delegateSupportsMetadataIdentifiersCallback = objc_opt_respondsToSelector() & 1;
  }
  return v8;
}

- (void)dealloc
{
  previewSurface = self->_previewSurface;
  if (previewSurface) {
    CFRelease(previewSurface);
  }
  previewSampleBuffer = self->_previewSampleBuffer;
  if (previewSampleBuffer) {
    CFRelease(previewSampleBuffer);
  }
  thumbnailSurface = self->_thumbnailSurface;
  if (thumbnailSurface) {
    CFRelease(thumbnailSurface);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoRequest;
  [(AVCapturePhotoRequest *)&v6 dealloc];
}

- (AVCaptureResolvedPhotoSettings)resolvedSettings
{
  v2 = self->_resolvedSettings;

  return v2;
}

- (unint64_t)expectedPhotoCount
{
  return [(NSArray *)self->_expectedPhotoManifest count];
}

- (void)setResolvedSettings:(id)a3
{
  if ([a3 photoManifest])
  {
    expectedPhotoManifest = self->_expectedPhotoManifest;
    self->_expectedPhotoManifest = (NSArray *)(id)[a3 photoManifest];
  }
  self->_resolvedSettings = (AVCaptureResolvedPhotoSettings *)a3;
}

- (void)_resolveExpectedPhotoManifest
{
  unsigned int v3 = [(AVCapturePhotoSettings *)self->_unresolvedSettings formatFourCC];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(AVCapturePhotoSettings *)self->_unresolvedSettings isDepthDataDeliveryEnabled]
    && [(AVCapturePhotoSettings *)self->_unresolvedSettings embedsDepthDataInPhoto])
  {
    if ([(AVCapturePhotoSettings *)self->_unresolvedSettings isDepthDataFiltered]) {
      unsigned int v4 = 32;
    }
    else {
      unsigned int v4 = 16;
    }
  }
  else
  {
    unsigned int v4 = 0;
  }
  if ([(AVCapturePhotoSettings *)self->_unresolvedSettings isBurstQualityCaptureEnabled]) {
    uint64_t v5 = v4 | 0x200;
  }
  else {
    uint64_t v5 = v4;
  }
  if ([(AVCapturePhotoSettings *)self->_unresolvedSettings HDRMode])
  {
    if ([(AVCapturePhotoSettings *)self->_unresolvedSettings isEV0PhotoDeliveryEnabled])
    {
      objc_msgSend(v17, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5 | 1));
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 1;
    }
    if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:[(AVCapturePhotoSettings *)self->_unresolvedSettings rawPhotoPixelFormatType]])
    {
      int v7 = 65538;
    }
    else
    {
      int v7 = 2;
    }
    objc_msgSend(v17, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7 | v5));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = objc_msgSend((id)-[AVCapturePhotoSettings bracketedSettings](self->_unresolvedSettings, "bracketedSettings"), "count");
    }
    else {
      uint64_t v6 = 1;
    }
    if ([(NSArray *)[(AVCapturePhotoSettings *)self->_unresolvedSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices] count])
    {
      v6 *= [(NSArray *)[(AVCapturePhotoSettings *)self->_unresolvedSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices] count];
    }
    if ([(AVCapturePhotoSettings *)self->_unresolvedSettings isConstantColorEnabled]
      && [(AVCapturePhotoSettings *)self->_unresolvedSettings isConstantColorFallbackPhotoDeliveryEnabled])
    {
      uint64_t v6 = 2;
    }
    else if (!v6)
    {
      goto LABEL_35;
    }
    uint64_t v8 = v6;
    do
    {
      if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:[(AVCapturePhotoSettings *)self->_unresolvedSettings rawPhotoPixelFormatType]])
      {
        objc_msgSend(v17, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5 | 0x10000));
      }
      if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:[(AVCapturePhotoSettings *)self->_unresolvedSettings rawPhotoPixelFormatType]])
      {
        objc_msgSend(v17, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5 | 0x80));
      }
      if (v3) {
        objc_msgSend(v17, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5));
      }
      --v8;
    }
    while (v8);
  }
LABEL_35:
  if (objc_msgSend(-[AVCapturePhotoSettings photoFilters](self->_unresolvedSettings, "photoFilters"), "count") && v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      int v10 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", i), "unsignedIntValue");
      objc_msgSend(v17, "replaceObjectAtIndex:withObject:", i, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10 | 4u));
    }
  }
  if (objc_msgSend(-[AVCapturePhotoSettings adjustedPhotoFilters](self->_unresolvedSettings, "adjustedPhotoFilters"), "count"))
  {
    int v11 = AVCIFilterArrayContainsPortraitFilters([(AVCapturePhotoSettings *)self->_unresolvedSettings adjustedPhotoFilters]);
    if ([v17 count])
    {
      unint64_t v12 = 0;
      if (v11) {
        int v13 = 72;
      }
      else {
        int v13 = 8;
      }
      do
      {
        unsigned int v14 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", v12), "unsignedIntValue");
        objc_msgSend(v17, "insertObject:atIndex:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13 | v14), v12 + 1);
        v12 += 2;
      }
      while ([v17 count] > v12);
    }
  }
  if (-[AVCapturePhotoSettings isAutoSpatialOverCaptureEnabled](self->_unresolvedSettings, "isAutoSpatialOverCaptureEnabled")&& [v17 count])
  {
    unint64_t v15 = 0;
    do
    {
      int v16 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", v15), "unsignedIntValue");
      objc_msgSend(v17, "insertObject:atIndex:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v16 | 0x800u), v15 + 1);
      v15 += 2;
    }
    while ([v17 count] > v15);
  }
  self->_expectedPhotoManifest = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v17];
}

- (AVWeakReferencingDelegateStorage)delegateStorage
{
  return self->_delegateStorage;
}

- (unsigned)photoCallbackFlavor
{
  return self->_photoCallbackFlavor;
}

- (AVCapturePhotoSettings)unresolvedSettings
{
  return self->_unresolvedSettings;
}

- (NSArray)expectedPhotoManifest
{
  return self->_expectedPhotoManifest;
}

- (unsigned)firedCallbackFlags
{
  return self->_firedCallbackFlags;
}

- (void)setFiredCallbackFlags:(unsigned int)a3
{
  self->_firedCallbackFlags = a3;
}

- (unint64_t)firedPhotoCallbacksCount
{
  return self->_firedPhotoCallbacksCount;
}

- (void)setFiredPhotoCallbacksCount:(unint64_t)a3
{
  self->_firedPhotoCallbacksCount = a3;
}

- (__IOSurface)previewSurface
{
  return self->_previewSurface;
}

- (void)setPreviewSurface:(__IOSurface *)a3
{
}

- (opaqueCMSampleBuffer)previewSampleBuffer
{
  return self->_previewSampleBuffer;
}

- (void)setPreviewSampleBuffer:(opaqueCMSampleBuffer *)a3
{
}

- (__IOSurface)thumbnailSurface
{
  return self->_thumbnailSurface;
}

- (void)setThumbnailSurface:(__IOSurface *)a3
{
}

- (BOOL)delegateSupportsDebugMetadataSidecarFile
{
  return self->_delegateSupportsDebugMetadataSidecarFile;
}

- (BOOL)delegateSupportsMetadataIdentifiersCallback
{
  return self->_delegateSupportsMetadataIdentifiersCallback;
}

- (BOOL)lensStabilizationSupported
{
  return self->_lensStabilizationSupported;
}

@end