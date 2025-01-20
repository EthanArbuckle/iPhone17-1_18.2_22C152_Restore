@interface PHImageRequestOptions
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoFrameTime;
- (BOOL)allowPlaceholder;
- (BOOL)allowSecondaryDegradedImage;
- (BOOL)cannotReturnSmallerImage;
- (BOOL)chooseAlchemist;
- (BOOL)ignoreProcessWideRepairLimits;
- (BOOL)includeHDRGainMap;
- (BOOL)includeHDRGainMapInIntermediateImage;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)onlyUseFetchedAssetPropertiesDuringChoosing;
- (BOOL)preferHDR;
- (BOOL)useAsyncForFastOpportunisticResult;
- (BOOL)useLimitedLibraryMode;
- (BOOL)useLowMemoryMode;
- (CGRect)normalizedCropRect;
- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable;
- (NSString)description;
- (OS_dispatch_queue)resultHandlerQueue;
- (PHAssetImageProgressHandler)progressHandler;
- (PHImageRequestOptions)init;
- (PHImageRequestOptionsDeliveryMode)deliveryMode;
- (PHImageRequestOptionsResizeMode)resizeMode;
- (PHImageRequestOptionsVersion)version;
- (double)targetHDRHeadroom;
- (id)cachingCompleteHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (int64_t)loadingMode;
- (int64_t)opportunisticDegradedImagesToReturn;
- (void)setAllowPlaceholder:(BOOL)a3;
- (void)setAllowSecondaryDegradedImage:(BOOL)allowSecondaryDegradedImage;
- (void)setCachingCompleteHandler:(id)a3;
- (void)setCannotReturnSmallerImage:(BOOL)a3;
- (void)setChooseAlchemist:(BOOL)a3;
- (void)setDeliveryMode:(PHImageRequestOptionsDeliveryMode)deliveryMode;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3;
- (void)setIgnoreProcessWideRepairLimits:(BOOL)a3;
- (void)setIncludeHDRGainMap:(BOOL)a3;
- (void)setIncludeHDRGainMapInIntermediateImage:(BOOL)a3;
- (void)setLoadingMode:(int64_t)a3;
- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed;
- (void)setNormalizedCropRect:(CGRect)normalizedCropRect;
- (void)setOnlyUseFetchedAssetPropertiesDuringChoosing:(BOOL)a3;
- (void)setOpportunisticDegradedImagesToReturn:(int64_t)a3;
- (void)setPreferHDR:(BOOL)a3;
- (void)setProgressHandler:(PHAssetImageProgressHandler)progressHandler;
- (void)setResizeMode:(PHImageRequestOptionsResizeMode)resizeMode;
- (void)setResultHandlerQueue:(id)a3;
- (void)setSynchronous:(BOOL)synchronous;
- (void)setTargetHDRHeadroom:(double)a3;
- (void)setUseAsyncForFastOpportunisticResult:(BOOL)a3;
- (void)setUseLimitedLibraryMode:(BOOL)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)setVersion:(PHImageRequestOptionsVersion)version;
- (void)setVideoFrameTime:(id *)a3;
@end

@implementation PHImageRequestOptions

- (PHImageRequestOptionsDeliveryMode)deliveryMode
{
  return self->_deliveryMode;
}

- (int64_t)opportunisticDegradedImagesToReturn
{
  return self->_opportunisticDegradedImagesToReturn;
}

- (int64_t)loadingMode
{
  return self->_loadingMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setVersion:", -[PHImageRequestOptions version](self, "version"));
  objc_msgSend(v4, "setDeliveryMode:", -[PHImageRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v4, "setLoadingMode:", -[PHImageRequestOptions loadingMode](self, "loadingMode"));
  objc_msgSend(v4, "setResizeMode:", -[PHImageRequestOptions resizeMode](self, "resizeMode"));
  [(PHImageRequestOptions *)self normalizedCropRect];
  objc_msgSend(v4, "setNormalizedCropRect:");
  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHImageRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v4, "setSynchronous:", -[PHImageRequestOptions isSynchronous](self, "isSynchronous"));
  v5 = [(PHImageRequestOptions *)self progressHandler];
  [v4 setProgressHandler:v5];

  objc_msgSend(v4, "setAllowPlaceholder:", -[PHImageRequestOptions allowPlaceholder](self, "allowPlaceholder"));
  v6 = [(PHImageRequestOptions *)self resultHandlerQueue];
  [v4 setResultHandlerQueue:v6];

  v7 = [(PHImageRequestOptions *)self cachingCompleteHandler];
  [v4 setCachingCompleteHandler:v7];

  objc_msgSend(v4, "setOnlyUseFetchedAssetPropertiesDuringChoosing:", -[PHImageRequestOptions onlyUseFetchedAssetPropertiesDuringChoosing](self, "onlyUseFetchedAssetPropertiesDuringChoosing"));
  objc_msgSend(v4, "setIncludeHDRGainMap:", -[PHImageRequestOptions includeHDRGainMap](self, "includeHDRGainMap"));
  objc_msgSend(v4, "setIncludeHDRGainMapInIntermediateImage:", -[PHImageRequestOptions includeHDRGainMapInIntermediateImage](self, "includeHDRGainMapInIntermediateImage"));
  objc_msgSend(v4, "setPreferHDR:", -[PHImageRequestOptions preferHDR](self, "preferHDR"));
  [(PHImageRequestOptions *)self targetHDRHeadroom];
  objc_msgSend(v4, "setTargetHDRHeadroom:");
  objc_msgSend(v4, "setUseLowMemoryMode:", -[PHImageRequestOptions useLowMemoryMode](self, "useLowMemoryMode"));
  objc_msgSend(v4, "setUseLimitedLibraryMode:", -[PHImageRequestOptions useLimitedLibraryMode](self, "useLimitedLibraryMode"));
  objc_msgSend(v4, "setDownloadIntent:", -[PHImageRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setDownloadPriority:", -[PHImageRequestOptions downloadPriority](self, "downloadPriority"));
  [(PHImageRequestOptions *)self fallbackTargetSizeIfRequestedSizeNotLocallyAvailable];
  objc_msgSend(v4, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  objc_msgSend(v4, "setCannotReturnSmallerImage:", -[PHImageRequestOptions cannotReturnSmallerImage](self, "cannotReturnSmallerImage"));
  objc_msgSend(v4, "setIgnoreProcessWideRepairLimits:", -[PHImageRequestOptions ignoreProcessWideRepairLimits](self, "ignoreProcessWideRepairLimits"));
  [(PHImageRequestOptions *)self videoFrameTime];
  [v4 setVideoFrameTime:v9];
  objc_msgSend(v4, "setChooseAlchemist:", -[PHImageRequestOptions chooseAlchemist](self, "chooseAlchemist"));
  objc_msgSend(v4, "setOpportunisticDegradedImagesToReturn:", -[PHImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn"));
  objc_msgSend(v4, "setUseAsyncForFastOpportunisticResult:", -[PHImageRequestOptions useAsyncForFastOpportunisticResult](self, "useAsyncForFastOpportunisticResult"));
  return v4;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (void)setOpportunisticDegradedImagesToReturn:(int64_t)a3
{
  if (!a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PHImageManager.m" lineNumber:457 description:@"opportunisticDegradedImagesToReturn cannot be zero."];
  }
  self->_opportunisticDegradedImagesToReturn = a3;
}

- (BOOL)includeHDRGainMap
{
  return self->_includeHDRGainMap;
}

- (void)setProgressHandler:(PHAssetImageProgressHandler)progressHandler
{
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (BOOL)useLimitedLibraryMode
{
  return self->_useLimitedLibraryMode;
}

- (PHImageRequestOptionsResizeMode)resizeMode
{
  return self->_resizeMode;
}

- (BOOL)onlyUseFetchedAssetPropertiesDuringChoosing
{
  return self->_onlyUseFetchedAssetPropertiesDuringChoosing;
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable
{
  double width = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width;
  double height = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (BOOL)chooseAlchemist
{
  return self->_chooseAlchemist;
}

- (BOOL)cannotReturnSmallerImage
{
  return self->_cannotReturnSmallerImage;
}

- (BOOL)allowPlaceholder
{
  return self->_allowPlaceholder;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setSynchronous:(BOOL)synchronous
{
  self->_synchronous = synchronous;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (void)setResizeMode:(PHImageRequestOptionsResizeMode)resizeMode
{
  self->_resizeMode = resizeMode;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (void)setLoadingMode:(int64_t)a3
{
  self->_loadingMode = a3;
}

- (void)setDeliveryMode:(PHImageRequestOptionsDeliveryMode)deliveryMode
{
  self->_deliveryMode = deliveryMode;
}

- (PHImageRequestOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHImageRequestOptions;
  v2 = [(PHImageRequestOptions *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_loadingMode = 0;
    v2->_version = 0;
    v2->_deliveryMode = 0;
    if (init_r_onceToken != -1) {
      dispatch_once(&init_r_onceToken, &__block_literal_global_48001);
    }
    int64_t v4 = init_r_useFastResize;
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v3->_normalizedCropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v3->_normalizedCropRect.size = v5;
    v3->_networkAccessAllowed = 0;
    id progressHandler = v3->_progressHandler;
    v3->_resizeMode = v4;
    v3->_id progressHandler = 0;

    v3->_allowPlaceholder = 0;
    v3->_onlyUseFetchedAssetPropertiesDuringChoosing = 0;
    v3->_requestID = 0;
    v3->_useLimitedLibraryMode = PLIsLimitedLibraryClient();
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v3->_videoFrameTime.value = *MEMORY[0x1E4F1F9F8];
    v3->_videoFrameTime.epoch = *(void *)(v7 + 16);
    v3->_opportunisticDegradedImagesToReturn = 1;
    v3->_targetHDRHeadroom = 1.0;
  }
  return v3;
}

- (void)setVersion:(PHImageRequestOptionsVersion)version
{
  self->_version = version;
}

- (void)setUseAsyncForFastOpportunisticResult:(BOOL)a3
{
  self->_useAsyncForFastOpportunisticResult = a3;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (void)setNormalizedCropRect:(CGRect)normalizedCropRect
{
  self->_normalizedCropRect = normalizedCropRect;
}

- (void)setIncludeHDRGainMap:(BOOL)a3
{
  self->_includeHDRGainMap = a3;
}

- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3
{
  self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = a3;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPrioritdouble y = a3;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (void)setChooseAlchemist:(BOOL)a3
{
  self->_chooseAlchemist = a3;
}

- (void)setAllowPlaceholder:(BOOL)a3
{
  self->_allowPlaceholder = a3;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (BOOL)useAsyncForFastOpportunisticResult
{
  return self->_useAsyncForFastOpportunisticResult;
}

- (void)setVideoFrameTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_videoFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->_videoFrameTime.value = v3;
}

- (void)setUseLimitedLibraryMode:(BOOL)a3
{
  self->_useLimitedLibraryMode = a3;
}

- (void)setOnlyUseFetchedAssetPropertiesDuringChoosing:(BOOL)a3
{
  self->_onlyUseFetchedAssetPropertiesDuringChoosing = a3;
}

- (void)setIncludeHDRGainMapInIntermediateImage:(BOOL)a3
{
  self->_includeHDRGainMapInIntermediateImage = a3;
}

- (void)setIgnoreProcessWideRepairLimits:(BOOL)a3
{
  self->_ignoreProcessWideRepairLimits = a3;
}

- (void)setCannotReturnSmallerImage:(BOOL)a3
{
  self->_cannotReturnSmallerImage = a3;
}

- (void)setCachingCompleteHandler:(id)a3
{
}

- (BOOL)includeHDRGainMapInIntermediateImage
{
  return self->_includeHDRGainMapInIntermediateImage;
}

- (BOOL)ignoreProcessWideRepairLimits
{
  return self->_ignoreProcessWideRepairLimits;
}

- (id)cachingCompleteHandler
{
  return self->_cachingCompleteHandler;
}

- (PHAssetImageProgressHandler)progressHandler
{
  return self->_progressHandler;
}

- (PHImageRequestOptionsVersion)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachingCompleteHandler, 0);
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);

  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)setAllowSecondaryDegradedImage:(BOOL)allowSecondaryDegradedImage
{
  BOOL v3 = allowSecondaryDegradedImage;
  unint64_t v5 = [(PHImageRequestOptions *)self opportunisticDegradedImagesToReturn] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PHImageRequestOptions *)self setOpportunisticDegradedImagesToReturn:v5 | v6];
}

uint64_t __29__PHImageRequestOptions_init__block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  init_r_useFastResize = result;
  return result;
}

- (BOOL)allowSecondaryDegradedImage
{
  return ((unint64_t)[(PHImageRequestOptions *)self opportunisticDegradedImagesToReturn] >> 1) & 1;
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"version="];
  if ([(PHImageRequestOptions *)self version] == PHImageRequestOptionsVersionOriginal)
  {
    int64_t v4 = @"orig";
  }
  else if ([(PHImageRequestOptions *)self version] == PHImageRequestOptionsVersionUnadjusted)
  {
    int64_t v4 = @"unadj";
  }
  else if ([(PHImageRequestOptions *)self version])
  {
    if ([(PHImageRequestOptions *)self version] != 8) {
      goto LABEL_10;
    }
    int64_t v4 = @"penult";
  }
  else
  {
    int64_t v4 = @"curr";
  }
  [v3 appendString:v4];
LABEL_10:
  [(PHImageRequestOptions *)self normalizedCropRect];
  if (!CGRectEqualToRect(v21, *MEMORY[0x1E4F1DB28]))
  {
    [(PHImageRequestOptions *)self normalizedCropRect];
    uint64_t v6 = v5;
    [(PHImageRequestOptions *)self normalizedCropRect];
    uint64_t v8 = v7;
    [(PHImageRequestOptions *)self normalizedCropRect];
    uint64_t v10 = v9;
    [(PHImageRequestOptions *)self normalizedCropRect];
    [v3 appendFormat:@", cropRect={%0.3lf,%0.3lf,%0.3lfx%0.3lf}", v6, v8, v10, v11];
  }
  if ([(PHImageRequestOptions *)self resizeMode] == PHImageRequestOptionsResizeModeFast)
  {
    v12 = @", resize=fast";
  }
  else
  {
    if ([(PHImageRequestOptions *)self resizeMode] != PHImageRequestOptionsResizeModeExact) {
      goto LABEL_17;
    }
    v12 = @", resize=exact";
  }
  [v3 appendString:v12];
LABEL_17:
  [v3 appendString:@", delivery="];
  if ([(PHImageRequestOptions *)self deliveryMode])
  {
    if ([(PHImageRequestOptions *)self deliveryMode] == PHImageRequestOptionsDeliveryModeHighQualityFormat)
    {
      v13 = @"ask";
    }
    else if ([(PHImageRequestOptions *)self deliveryMode] == PHImageRequestOptionsDeliveryModeFastFormat)
    {
      v13 = @"fst";
    }
    else
    {
      if ([(PHImageRequestOptions *)self deliveryMode] != (PHImageRequestOptionsDeliveryModeFastFormat|PHImageRequestOptionsDeliveryModeHighQualityFormat)) {
        goto LABEL_31;
      }
      v13 = @"ask-non-derivative";
    }
    goto LABEL_30;
  }
  [v3 appendString:@"ask+"];
  if ([(PHImageRequestOptions *)self opportunisticDegradedImagesToReturn])
  {
    [v3 appendString:@"[fst"];
    if ([(PHImageRequestOptions *)self useAsyncForFastOpportunisticResult]) {
      [v3 appendString:@"-async"];
    }
    [v3 appendString:@"]"];
  }
  if (([(PHImageRequestOptions *)self opportunisticDegradedImagesToReturn] & 2) != 0)
  {
    v13 = @"[int]";
LABEL_30:
    [v3 appendString:v13];
  }
LABEL_31:
  [v3 appendString:@", loading=img"];
  if ([(PHImageRequestOptions *)self loadingMode]) {
    [v3 appendString:@"+data"];
  }
  if (([(PHImageRequestOptions *)self loadingMode] & 0x10000) != 0) {
    [v3 appendString:@"+URL"];
  }
  if (([(PHImageRequestOptions *)self loadingMode] & 0x40000) != 0) {
    [v3 appendString:@"+BGRA"];
  }
  if (([(PHImageRequestOptions *)self loadingMode] & 0x80000) != 0) {
    [v3 appendString:@"+hipriodec"];
  }
  if (([(PHImageRequestOptions *)self loadingMode] & 0x100000) != 0) {
    [v3 appendString:@"+nofallback"];
  }
  if (([(PHImageRequestOptions *)self loadingMode] & 0x200000) != 0) {
    [v3 appendString:@"+swjpeg"];
  }
  if (([(PHImageRequestOptions *)self loadingMode] & 0x400000) != 0) {
    [v3 appendString:@"+lowmemdec"];
  }
  if ([(PHImageRequestOptions *)self isNetworkAccessAllowed]) {
    [v3 appendString:@"+network"];
  }
  unint64_t v14 = [(PHImageRequestOptions *)self downloadIntent];
  if (v14)
  {
    v15 = _PHDownloadIntentName(v14);
    v16 = _PHDownloadPriorityName([(PHImageRequestOptions *)self downloadPriority]);
    [v3 appendFormat:@"+downloadIntent:%@+downloadPriority:%@", v15, v16];
  }
  if (self->_videoFrameTime.flags)
  {
    CMTime time = (CMTime)self->_videoFrameTime;
    v17 = (__CFString *)CMTimeCopyDescription(0, &time);
    [v3 appendFormat:@"+videoFrameTime:%@", v17];
  }

  return (NSString *)v3;
}

@end