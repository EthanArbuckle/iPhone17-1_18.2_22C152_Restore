@interface AVAssetImageGenerator
+ (AVAssetImageGenerator)assetImageGeneratorWithAsset:(AVAsset *)asset;
- (AVAsset)asset;
- (AVAssetImageGenerator)init;
- (AVAssetImageGenerator)initWithAsset:(AVAsset *)asset;
- (AVAssetImageGeneratorApertureMode)apertureMode;
- (AVVideoComposition)videoComposition;
- (BOOL)_ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:(BOOL)a3 error:(id *)a4;
- (BOOL)appliesPreferredTrackTransform;
- (BOOL)isDefunct;
- (BOOL)prefersStandardDynamicRange;
- (BOOL)useSWDecoderForAV1;
- (CGImage)_copyCGImageAtTime:(id *)a3 usingAssetReader:(id)a4 error:(id *)a5;
- (CGImageRef)copyCGImageAtTime:(CMTime *)requestedTime actualTime:(CMTime *)actualTime error:(NSError *)outError;
- (CGSize)_scaledSizeForRenderSize:(CGSize)result;
- (CGSize)maximumSize;
- (CMTime)requestedTimeToleranceAfter;
- (CMTime)requestedTimeToleranceBefore;
- (NSString)dynamicRangePolicy;
- (id)_NSErrorForError:(int)a3;
- (id)_makeAutoreleasedAssetReader;
- (id)_optionsDictionary;
- (id)_requestWithRequestID:(id)a3;
- (id)_videoSettingWithSize:(CGSize)a3 bitDepth:(unsigned int)a4;
- (id)customVideoCompositor;
- (void)_didGenerateCGImage:(id)a3;
- (void)_failedToGenerateCGImage:(id)a3;
- (void)_serverDied;
- (void)cancelAllCGImageGeneration;
- (void)dealloc;
- (void)generateCGImageAsynchronouslyForTime:(CMTime *)requestedTime completionHandler:(void *)handler;
- (void)generateCGImagesAsynchronouslyForTimes:(NSArray *)requestedTimes completionHandler:(AVAssetImageGeneratorCompletionHandler)handler;
- (void)setApertureMode:(AVAssetImageGeneratorApertureMode)apertureMode;
- (void)setAppliesPreferredTrackTransform:(BOOL)appliesPreferredTrackTransform;
- (void)setDynamicRangePolicy:(id)a3;
- (void)setMaximumSize:(CGSize)maximumSize;
- (void)setPrefersStandardDynamicRange:(BOOL)a3;
- (void)setRequestedTimeToleranceAfter:(CMTime *)requestedTimeToleranceAfter;
- (void)setRequestedTimeToleranceBefore:(CMTime *)requestedTimeToleranceBefore;
- (void)setUseSWDecoderForAV1:(BOOL)a3;
- (void)setVideoComposition:(AVVideoComposition *)videoComposition;
@end

@implementation AVAssetImageGenerator

+ (AVAssetImageGenerator)assetImageGeneratorWithAsset:(AVAsset *)asset
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAsset:asset];
  return (AVAssetImageGenerator *)v3;
}

- (AVAssetImageGenerator)init
{
  return [(AVAssetImageGenerator *)self initWithAsset:0];
}

- (AVAssetImageGenerator)initWithAsset:(AVAsset *)asset
{
  v15.receiver = self;
  v15.super_class = (Class)AVAssetImageGenerator;
  v4 = [(AVAssetImageGenerator *)&v15 init];
  if (v4)
  {
    if (asset && (v5 = objc_alloc_init(AVAssetImageGeneratorInternal), (v4->_priv = v5) != 0))
    {
      v4->_priv->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v4];
      v4->_priv->asset = asset;
      v4->_priv->appliesPreferredTrackTransform = 0;
      v4->_priv->maximumSize = (CGSize)*MEMORY[0x1E4F1DB30];
      v4->_priv->apertureMode = 0;
      priv = v4->_priv;
      uint64_t v7 = MEMORY[0x1E4F1FA10];
      long long v8 = *MEMORY[0x1E4F1FA10];
      *(_OWORD *)&priv->requestedTimeToleranceBefore.value = *MEMORY[0x1E4F1FA10];
      int64_t v9 = *(void *)(v7 + 16);
      priv->requestedTimeToleranceBefore.epoch = v9;
      v10 = v4->_priv;
      *(_OWORD *)&v10->requestedTimeToleranceAfter.value = v8;
      v10->requestedTimeToleranceAfter.epoch = v9;
      v4->_priv->requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_priv->requestsQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.requestsqueue", v11);
      v4->_priv->nextRequestID = 0;
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_priv->imageRequestQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.imagerequestqueue", v12);
      v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_priv->generateImagesAsyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.generateimagesasyncqueue", v13);
      v4->_priv->dynamicRangePolicy = (NSString *)@"ForceSDR";
      v4->_priv->allowsProfessionalVideoWorkflowVideoDecoders = 1;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    if (priv->generator)
    {
      id v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      [v4 removeListenerWithWeakReference:self->_priv->weakReference callback:aig_didGenerateCGImage name:*MEMORY[0x1E4F31E60] object:self->_priv->generator];
      [v4 removeListenerWithWeakReference:self->_priv->weakReference callback:aig_failedToGenerateCGImage name:*MEMORY[0x1E4F31E68] object:self->_priv->generator];
      [v4 removeListenerWithWeakReference:self->_priv->weakReference callback:aig_serverDied name:*MEMORY[0x1E4F31E70] object:self->_priv->generator];
      [v4 removeListenerWithWeakReference:self->_priv->weakReference callback:aig_serverDied name:*MEMORY[0x1E4F21770] object:self->_priv->generator];
      CFRelease(self->_priv->weakReference);
      uint64_t FigBaseObject = FigAssetImageGeneratorGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v6 = FigBaseObject;
        uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v8 = v7 ? v7 : 0;
        int64_t v9 = *(void (**)(uint64_t))(v8 + 24);
        if (v9) {
          v9(v6);
        }
      }
      priv = self->_priv;
      generator = priv->generator;
      if (generator)
      {
        CFRelease(generator);
        self->_priv->generator = 0;
        priv = self->_priv;
      }
    }

    v11 = self->_priv;
    requestsQueue = v11->requestsQueue;
    if (requestsQueue)
    {
      dispatch_release(requestsQueue);
      v11 = self->_priv;
    }

    v13 = self->_priv;
    imageRequestQueue = v13->imageRequestQueue;
    if (imageRequestQueue)
    {
      dispatch_release(imageRequestQueue);
      v13 = self->_priv;
    }
    generateImagesAsyncQueue = v13->generateImagesAsyncQueue;
    if (generateImagesAsyncQueue)
    {
      dispatch_release(generateImagesAsyncQueue);
      v13 = self->_priv;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AVAssetImageGenerator;
  [(AVAssetImageGenerator *)&v16 dealloc];
}

- (AVAsset)asset
{
  return self->_priv->asset;
}

- (BOOL)_ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:(BOOL)a3 error:(id *)a4
{
  uint64_t v7 = [(AVAsset *)self->_priv->asset _figAsset];
  [(AVAssetImageGenerator *)self _optionsDictionary];
  priv = self->_priv;
  if (priv->generator) {
    return 1;
  }
  if (a3
    || [(AVAsset *)priv->asset statusOfValueForKey:@"streaming" error:a4] == 2)
  {
    if (!v7) {
      return 1;
    }
    if ([(AVAsset *)self->_priv->asset _requiresInProcessOperation])
    {
      if ([(AVAsset *)self->_priv->asset _isStreaming]) {
        uint64_t v9 = FigStreamAssetImageGeneratorCreateFromAssetWithOptions();
      }
      else {
        uint64_t v9 = FigAssetImageGeneratorCreateFromAssetWithOptions();
      }
      uint64_t v11 = v9;
      if (!v9) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t RemoteFromAssetWithOptions = FigAssetImageGeneratorCreateRemoteFromAssetWithOptions();
      if (!RemoteFromAssetWithOptions)
      {
LABEL_14:
        id v14 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
        CFRetain(self->_priv->weakReference);
        [v14 addListenerWithWeakReference:self->_priv->weakReference callback:aig_didGenerateCGImage name:*MEMORY[0x1E4F31E60] object:self->_priv->generator flags:0];
        [v14 addListenerWithWeakReference:self->_priv->weakReference callback:aig_failedToGenerateCGImage name:*MEMORY[0x1E4F31E68] object:self->_priv->generator flags:0];
        [v14 addListenerWithWeakReference:self->_priv->weakReference callback:aig_serverDied name:*MEMORY[0x1E4F31E70] object:self->_priv->generator flags:0];
        [v14 addListenerWithWeakReference:self->_priv->weakReference callback:aig_serverDied name:*MEMORY[0x1E4F21770] object:self->_priv->generator flags:0];
        return 1;
      }
      uint64_t v11 = RemoteFromAssetWithOptions;
    }
    if (a4)
    {
      id v12 = [(AVAssetImageGenerator *)self _NSErrorForError:v11];
      BOOL result = 0;
      *a4 = v12;
      return result;
    }
  }
  return 0;
}

- (id)_videoSettingWithSize:(CGSize)a3 bitDepth:(unsigned int)a4
{
  CFTypeRef cf = 0;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3.width, a3.height);
  LODWORD(v7) = 0;
  if (!FPSupport_CreateDestinationPixelBufferAttributes()) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], @"AVVideoAllowWideColorKey", v7);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

- (id)_makeAutoreleasedAssetReader
{
  v3 = [(AVAsset *)self->_priv->asset tracksWithMediaType:@"vide"];
  if ([(AVAssetImageGenerator *)self videoComposition])
  {
    [(AVVideoComposition *)[(AVAssetImageGenerator *)self videoComposition] renderSize];
    double v5 = v4;
    double v7 = v6;
  }
  else if ([(NSArray *)v3 count])
  {
    objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "naturalSize");
    double v5 = v22;
    double v7 = v23;
    if (self->_priv->appliesPreferredTrackTransform)
    {
      id v24 = [(NSArray *)v3 objectAtIndex:0];
      if (v24) {
        [v24 preferredTransform];
      }
      double v27 = v7 * 0.0 + 0.0 * v5;
      double v7 = fabs(v27);
      double v5 = v7;
    }
  }
  else
  {
    double v7 = 0.0;
    double v5 = 0.0;
  }
  -[AVAssetImageGenerator _scaledSizeForRenderSize:](self, "_scaledSizeForRenderSize:", v5, v7);
  double v9 = v8;
  double v11 = v10;
  if ([(NSArray *)v3 count]
    && objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "formatDescriptions"), "count"))
  {
    uint64_t MaximumBitsPerComponent = FigExportSettings_GetMaximumBitsPerComponent();
  }
  else
  {
    uint64_t MaximumBitsPerComponent = 8;
  }
  id v13 = -[AVAssetImageGenerator _videoSettingWithSize:bitDepth:](self, "_videoSettingWithSize:bitDepth:", MaximumBitsPerComponent, v9, v11);
  id v14 = +[AVAssetReader assetReaderWithAsset:self->_priv->asset error:0];
  if (v14)
  {
    if ([(AVAssetImageGenerator *)self videoComposition])
    {
      objc_super v15 = [(AVAsset *)self->_priv->asset tracksWithMediaType:@"auxv"];
      id v16 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v3];
      id v17 = v16;
      if (v15) {
        [v16 addObjectsFromArray:v15];
      }
      v18 = +[AVAssetReaderVideoCompositionOutput assetReaderVideoCompositionOutputWithVideoTracks:v17 videoSettings:v13];
      if (v18)
      {
        v19 = v18;
        customVideoCompositorSession = self->_priv->customVideoCompositorSession;
        v21 = [(AVAssetImageGenerator *)self videoComposition];
        if (customVideoCompositorSession) {
          [v19 _setVideoComposition:v21 customVideoCompositorSession:self->_priv->customVideoCompositorSession];
        }
        else {
          [v19 setVideoComposition:v21];
        }
        goto LABEL_22;
      }
    }
    else if ([(NSArray *)v3 count])
    {
      v25 = +[AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:[(NSArray *)v3 objectAtIndex:0] outputSettings:v13];
      if (v25)
      {
        v19 = v25;
        [(AVAssetReaderTrackOutput *)v25 setAppliesPreferredTrackTransform:self->_priv->appliesPreferredTrackTransform];
LABEL_22:
        [(AVAssetReader *)v14 addOutput:v19];
      }
    }
  }
  return v14;
}

- (CGImageRef)copyCGImageAtTime:(CMTime *)requestedTime actualTime:(CMTime *)actualTime error:(NSError *)outError
{
  v26 = 0;
  id v27 = 0;
  double v9 = (void *)MEMORY[0x199715AE0](self, a2);
  if ([(AVAssetImageGenerator *)self videoComposition]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = [(AVAssetImageGenerator *)self _makeAutoreleasedAssetReader];
    long long v28 = *(_OWORD *)&requestedTime->value;
    CMTimeEpoch epoch = requestedTime->epoch;
    v26 = [(AVAssetImageGenerator *)self _copyCGImageAtTime:&v28 usingAssetReader:v10 error:&v27];
    if (actualTime)
    {
      long long v11 = *(_OWORD *)&requestedTime->value;
      actualTime->CMTimeEpoch epoch = requestedTime->epoch;
      *(_OWORD *)&actualTime->value = v11;
    }
  }
  else
  {
    id v15 = [(AVAssetImageGenerator *)self _optionsDictionary];
    if (![v15 count]) {
      id v15 = 0;
    }
    if ([(AVAssetImageGenerator *)self _ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:1 error:&v27])
    {
      generator = self->_priv->generator;
      if (generator)
      {
        long long v24 = *(_OWORD *)&requestedTime->value;
        CMTimeEpoch v25 = requestedTime->epoch;
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
        v20 = *(uint64_t (**)(OpaqueFigAssetImageGenerator *, long long *, id, uint64_t, CGImage **, CMTime *))(v18 + 8);
        if (v20)
        {
          uint64_t v21 = *MEMORY[0x1E4F1CF80];
          long long v28 = v24;
          CMTimeEpoch epoch = v25;
          uint64_t v22 = v20(generator, &v28, v15, v21, &v26, actualTime);
          if (v26) {
            goto LABEL_5;
          }
          uint64_t v23 = v22;
        }
        else
        {
          uint64_t v23 = 4294954514;
        }
        id v19 = -[AVAssetImageGenerator _NSErrorForError:](self, "_NSErrorForError:", v23, v24, v25);
      }
      else
      {
        id v19 = (id)AVLocalizedError(@"AVFoundationErrorDomain", -11822, 0);
      }
      id v27 = v19;
    }
  }
LABEL_5:
  id v12 = v27;
  id v13 = v27;
  CGImageRef result = v26;
  if (outError)
  {
    if (!v26) {
      *outError = (NSError *)v27;
    }
  }
  return result;
}

- (void)generateCGImagesAsynchronouslyForTimes:(NSArray *)requestedTimes completionHandler:(AVAssetImageGeneratorCompletionHandler)handler
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!handler)
  {
    id v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", 0, v4, v5, v6, v7, (uint64_t)"handler != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  id v10 = (id)[(NSArray *)requestedTimes copy];
  id v11 = (id)[handler copy];
  if ([(AVAssetImageGenerator *)self videoComposition]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    generateImagesAsyncQueue = self->_priv->generateImagesAsyncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke;
    block[3] = &unk_1E57B32E8;
    block[4] = v10;
    block[5] = self;
    block[6] = v11;
    dispatch_async(generateImagesAsyncQueue, block);
  }
  else
  {
    asset = self->_priv->asset;
    v18[0] = @"streaming";
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_3;
    v16[3] = &unk_1E57B32E8;
    v16[4] = self;
    v16[5] = v10;
    v16[6] = v11;
    [(AVAsset *)asset loadValuesAsynchronouslyForKeys:v14 completionHandler:v16];
  }
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        long long v17 = 0uLL;
        uint64_t v18 = 0;
        if (v7) {
          [v7 CMTimeValue];
        }
        uint64_t v8 = [*(id *)(a1 + 40) _makeAutoreleasedAssetReader];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        int v10 = *(_DWORD *)(v9 + 128);
        *(_DWORD *)(v9 + 128) = v10 + 1;
        uint64_t v11 = *(void *)(a1 + 40);
        id v12 = *(NSObject **)(*(void *)(v11 + 8) + 152);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_2;
        v13[3] = &unk_1E57B32C0;
        int v14 = v10;
        long long v15 = v17;
        uint64_t v16 = v18;
        v13[4] = v11;
        v13[5] = v8;
        v13[6] = *(void *)(a1 + 48);
        dispatch_async(v12, v13);
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

void __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2 >= *(_DWORD *)(v3[1] + 160))
  {
    uint64_t v14 = 0;
    uint64_t v6 = *(void *)(a1 + 40);
    long long v12 = *(_OWORD *)(a1 + 60);
    uint64_t v13 = *(void *)(a1 + 76);
    uint64_t v7 = (const void *)[v3 _copyCGImageAtTime:&v12 usingAssetReader:v6 error:&v14];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void (**)(uint64_t, long long *, void))(v8 + 16);
    long long v12 = *(_OWORD *)(a1 + 60);
    uint64_t v13 = *(void *)(a1 + 76);
    if (v7)
    {
      long long v10 = *(_OWORD *)(a1 + 60);
      uint64_t v11 = *(void *)(a1 + 76);
      ((void (*)(uint64_t, long long *, const void *, long long *, void, void))v9)(v8, &v12, v7, &v10, 0, 0);
      CFRelease(v7);
    }
    else
    {
      v9(v8, &v12, 0);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void (**)(uint64_t, long long *, void))(v4 + 16);
    long long v12 = *(_OWORD *)(a1 + 60);
    uint64_t v13 = *(void *)(a1 + 76);
    long long v10 = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v5(v4, &v12, 0);
  }
}

__n128 __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  long long v1 = *(_OWORD *)(a1 + 32);
  int v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 168);
  block[1] = 3221225472;
  block[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_4;
  block[3] = &unk_1E57B32E8;
  long long v5 = v1;
  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_async(v2, block);
  return result;
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = [*(id *)(a1 + 32) _optionsDictionary];
  uint64_t v28 = 0;
  char v19 = [*(id *)(a1 + 32) _ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:0 error:&v28];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t result = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v17 = *MEMORY[0x1E4F31E38];
    uint64_t v18 = *(void *)v25;
    uint64_t v16 = *MEMORY[0x1E4F31E58];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * v4);
        uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 128);
        uint64_t v7 = objc_msgSend(v6, "numberWithInt:");
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v7, @"RequestID", v5, @"RequestedTime", *(void *)(a1 + 48), @"CompletionHandler", *(void *)(a1 + 32), @"Self", 0);
        uint64_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v20];
        [v9 setObject:v7 forKey:v17];
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", 0xFFFFFFFFLL), v16);
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(NSObject **)(*(void *)(v10 + 8) + 120);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_5;
        block[3] = &unk_1E57B2098;
        void block[4] = v10;
        block[5] = v8;
        dispatch_async(v11, block);
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(NSObject **)(*(void *)(v12 + 8) + 152);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_6;
        v21[3] = &unk_1E57B3310;
        char v22 = v19;
        v21[4] = v28;
        v21[5] = v12;
        v21[6] = v5;
        v21[7] = v9;
        uint64_t v14 = *(void *)(a1 + 48);
        v21[8] = v8;
        v21[9] = v14;
        dispatch_async(v13, v21);
        ++v4;
      }
      while (v3 != v4);
      uint64_t result = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) addObject:*(void *)(a1 + 40)];
}

void __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 16);
    if (v3)
    {
      uint64_t v4 = *(void **)(a1 + 48);
      if (v4)
      {
        [v4 CMTimeValue];
      }
      else
      {
        long long v20 = 0uLL;
        uint64_t v21 = 0;
      }
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *(uint64_t (**)(uint64_t, long long *, uint64_t, uint64_t))(v8 + 16);
      if (v9)
      {
        uint64_t v10 = *MEMORY[0x1E4F1CF80];
        long long v22 = v20;
        uint64_t v23 = v21;
        uint64_t v11 = v9(v3, &v22, v6, v10);
        if (!v11) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v11 = 4294954514;
      }
      uint64_t v5 = [*(id *)(a1 + 40) _NSErrorForError:v11];
    }
    else
    {
      uint64_t v5 = AVLocalizedError(@"AVFoundationErrorDomain", -11822, 0);
    }
    uint64_t v2 = v5;
  }
LABEL_16:
  if (v2)
  {
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v13 = *(void **)(a1 + 48);
    if (v13) {
      [v13 CMTimeValue];
    }
    else {
      memset(v19, 0, sizeof(v19));
    }
    uint64_t v14 = *(void (**)(uint64_t, void *, void, long long *, uint64_t, uint64_t))(v12 + 16);
    long long v22 = *MEMORY[0x1E4F1F9F8];
    uint64_t v23 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v14(v12, v19, 0, &v22, 1, v2);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(NSObject **)(*(void *)(v15 + 8) + 120);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_7;
    v18[3] = &unk_1E57B2098;
    uint64_t v17 = *(void *)(a1 + 64);
    v18[4] = v15;
    v18[5] = v17;
    dispatch_async(v16, v18);
  }
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) removeObject:*(void *)(a1 + 40)];
}

- (void)generateCGImageAsynchronouslyForTime:(CMTime *)requestedTime completionHandler:(void *)handler
{
  v9[1] = *MEMORY[0x1E4F143B8];
  CMTime v8 = *requestedTime;
  v9[0] = [MEMORY[0x1E4F29238] valueWithCMTime:&v8];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__AVAssetImageGenerator_generateCGImageAsynchronouslyForTime_completionHandler___block_invoke;
  v7[3] = &unk_1E57B3338;
  v7[4] = handler;
  [(AVAssetImageGenerator *)self generateCGImagesAsynchronouslyForTimes:v6 completionHandler:v7];
}

uint64_t __80__AVAssetImageGenerator_generateCGImageAsynchronouslyForTime_completionHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, long long *a4, unint64_t a5, uint64_t a6)
{
  if (a5 >= 2)
  {
    if (a5 == 2)
    {
      uint64_t v10 = *(void *)(result + 32);
      uint64_t v11 = AVLocalizedError(@"AVFoundationErrorDomain", -11878, 0);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t))(v10 + 16);
      long long v13 = *a4;
      uint64_t v14 = *((void *)a4 + 2);
      return v12(v10, a3, &v13, v11);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(result + 32);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t))(v8 + 16);
    long long v13 = *a4;
    uint64_t v14 = *((void *)a4 + 2);
    return v9(v8, a3, &v13, a6);
  }
  return result;
}

- (void)cancelAllCGImageGeneration
{
  FigAtomicCompareAndSwap32();
  generator = self->_priv->generator;
  if (generator)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v5 = v4 ? v4 : 0;
    uint64_t v6 = *(void (**)(OpaqueFigAssetImageGenerator *))(v5 + 24);
    if (v6)
    {
      v6(generator);
    }
  }
}

- (void)setAppliesPreferredTrackTransform:(BOOL)appliesPreferredTrackTransform
{
  self->_priv->appliesPreferredTrackTransform = appliesPreferredTrackTransform;
}

- (BOOL)appliesPreferredTrackTransform
{
  return self->_priv->appliesPreferredTrackTransform;
}

- (void)setPrefersStandardDynamicRange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = self->_priv->dynamicRangePolicy;
  uint64_t v6 = @"MatchSource";
  if (v3) {
    uint64_t v6 = @"ForceSDR";
  }
  self->_priv->dynamicRangePolicy = &v6->isa;
}

- (BOOL)prefersStandardDynamicRange
{
  return [(NSString *)self->_priv->dynamicRangePolicy isEqualToString:@"ForceSDR"];
}

- (void)setDynamicRangePolicy:(id)a3
{
  uint64_t v5 = self->_priv->dynamicRangePolicy;
  self->_priv->dynamicRangePolicy = (NSString *)[a3 copy];
}

- (NSString)dynamicRangePolicy
{
  return self->_priv->dynamicRangePolicy;
}

- (void)setUseSWDecoderForAV1:(BOOL)a3
{
  self->_priv->useSWDecoderForAV1 = a3;
}

- (BOOL)useSWDecoderForAV1
{
  return self->_priv->useSWDecoderForAV1;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  self->_priv->maximumSize = maximumSize;
}

- (CGSize)maximumSize
{
  priv = self->_priv;
  double width = priv->maximumSize.width;
  double height = priv->maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setApertureMode:(AVAssetImageGeneratorApertureMode)apertureMode
{
  uint64_t v5 = self->_priv->apertureMode;
  self->_priv->apertureMode = (NSString *)[(NSString *)apertureMode copy];
}

- (AVAssetImageGeneratorApertureMode)apertureMode
{
  return self->_priv->apertureMode;
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  BOOL v3 = self->_priv->videoComposition;
  if (v3 != videoComposition)
  {
    if (videoComposition)
    {
      char v19 = 0;
      if ([(AVVideoComposition *)videoComposition _isValidReturningExceptionReason:&v19])
      {
        [(AVVideoComposition *)videoComposition renderScale];
        if (v12 == 1.0)
        {
          BOOL v3 = self->_priv->videoComposition;
          goto LABEL_6;
        }
        uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        uint64_t v16 = @"AVAssetImageGenerator can't use a video composition with a renderScale other than 1.0";
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        uint64_t v16 = (__CFString *)v19;
      }
      uint64_t v17 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v7, v8, v9, v10, v11, v18), 0);
      objc_exception_throw(v17);
    }
LABEL_6:

    self->_priv->videoComposition = (AVVideoComposition *)[(AVVideoComposition *)videoComposition copy];
    char v19 = 0;
    [(AVVideoComposition *)self->_priv->videoComposition _copyFigVideoCompositor:0 andSession:&v19 recyclingSession:self->_priv->customVideoCompositorSession forFigRemaker:1 error:0];
    long long v13 = self->_priv->customVideoCompositorSession;
    self->_priv->customVideoCompositorSession = v19;
  }
}

- (AVVideoComposition)videoComposition
{
  return self->_priv->videoComposition;
}

- (id)customVideoCompositor
{
  return [(AVCustomVideoCompositorSession *)self->_priv->customVideoCompositorSession customVideoCompositor];
}

- (void)setRequestedTimeToleranceBefore:(CMTime *)requestedTimeToleranceBefore
{
  priv = self->_priv;
  long long v4 = *(_OWORD *)&requestedTimeToleranceBefore->value;
  priv->requestedTimeToleranceBefore.CMTimeEpoch epoch = requestedTimeToleranceBefore->epoch;
  *(_OWORD *)&priv->requestedTimeToleranceBefore.value = v4;
}

- (CMTime)requestedTimeToleranceBefore
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 64);
  return self;
}

- (void)setRequestedTimeToleranceAfter:(CMTime *)requestedTimeToleranceAfter
{
  priv = self->_priv;
  long long v4 = *(_OWORD *)&requestedTimeToleranceAfter->value;
  priv->requestedTimeToleranceAfter.CMTimeEpoch epoch = requestedTimeToleranceAfter->epoch;
  *(_OWORD *)&priv->requestedTimeToleranceAfter.value = v4;
}

- (CMTime)requestedTimeToleranceAfter
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 88);
  return self;
}

- (id)_optionsDictionary
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:3];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4F31E40]];
  priv = self->_priv;
  if (priv->appliesPreferredTrackTransform)
  {
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v3 setObject:v6 forKey:*MEMORY[0x1E4F31E10]];
    priv = self->_priv;
  }
  double width = priv->maximumSize.width;
  if (width > 0.0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)width];
    [v3 setObject:v8 forKey:*MEMORY[0x1E4F31E28]];
    priv = self->_priv;
  }
  double height = priv->maximumSize.height;
  if (height > 0.0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)height];
    [v3 setObject:v10 forKey:*MEMORY[0x1E4F31E20]];
    priv = self->_priv;
  }
  apertureMode = priv->apertureMode;
  if (apertureMode)
  {
    [v3 setObject:apertureMode forKey:*MEMORY[0x1E4F31E08]];
    priv = self->_priv;
  }
  if (priv->useSWDecoderForAV1)
  {
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v3 setObject:v12 forKey:*MEMORY[0x1E4F31DF0]];
    priv = self->_priv;
  }
  dynamicRangePolicy = priv->dynamicRangePolicy;
  if (dynamicRangePolicy)
  {
    if ([(NSString *)dynamicRangePolicy isEqualToString:@"MatchSource"])
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F31E00];
    }
    else
    {
      if (![(NSString *)self->_priv->dynamicRangePolicy isEqualToString:@"ForceSDR"]) {
        goto LABEL_17;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F31DF8];
    }
    [v3 setObject:*v14 forKey:*MEMORY[0x1E4F31E18]];
  }
LABEL_17:
  uint64_t v15 = self->_priv;
  if (!v15->allowsProfessionalVideoWorkflowVideoDecoders)
  {
    uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v3 setObject:v16 forKey:*MEMORY[0x1E4F31E30]];
    uint64_t v15 = self->_priv;
  }
  if ((v15->requestedTimeToleranceBefore.flags & 0x1D) == 1)
  {
    $95D729B680665BEAEFA1D6FCA8238556 requestedTimeToleranceBefore = v15->requestedTimeToleranceBefore;
    [v3 setObject:NSDictionaryFromCMTime((CMTime *)&requestedTimeToleranceBefore) forKey:*MEMORY[0x1E4F31E50]];
    uint64_t v15 = self->_priv;
  }
  if ((v15->requestedTimeToleranceAfter.flags & 0x1D) == 1)
  {
    $95D729B680665BEAEFA1D6FCA8238556 requestedTimeToleranceBefore = v15->requestedTimeToleranceAfter;
    [v3 setObject:NSDictionaryFromCMTime((CMTime *)&requestedTimeToleranceBefore) forKey:*MEMORY[0x1E4F31E48]];
  }
  return v3;
}

- (void)_didGenerateCGImage:(id)a3
{
  id v5 = -[AVAssetImageGenerator _requestWithRequestID:](self, "_requestWithRequestID:", [a3 objectForKey:*MEMORY[0x1E4F31E88]]);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a3 objectForKey:*MEMORY[0x1E4F31E78]];
    CFDictionaryRef v8 = (const __CFDictionary *)[a3 objectForKey:*MEMORY[0x1E4F31E80]];
    memset(&v16, 0, sizeof(v16));
    CMTimeMakeFromDictionary(&v16, v8);
    uint64_t v9 = (void *)[v6 objectForKey:@"RequestedTime"];
    uint64_t v10 = [v6 objectForKey:@"CompletionHandler"];
    if (v9) {
      [v9 CMTimeValue];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    uint64_t v11 = *(void (**)(uint64_t, void *, uint64_t, CMTime *, void, void))(v10 + 16);
    CMTime v14 = v16;
    v11(v10, v15, v7, &v14, 0, 0);
    requestsQueue = self->_priv->requestsQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__AVAssetImageGenerator__didGenerateCGImage___block_invoke;
    v13[3] = &unk_1E57B2098;
    v13[4] = self;
    v13[5] = v6;
    dispatch_async(requestsQueue, v13);
  }
}

uint64_t __45__AVAssetImageGenerator__didGenerateCGImage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) removeObject:*(void *)(a1 + 40)];
}

- (void)_failedToGenerateCGImage:(id)a3
{
  id v5 = -[AVAssetImageGenerator _requestWithRequestID:](self, "_requestWithRequestID:", [a3 objectForKey:*MEMORY[0x1E4F31E88]]);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F31E90]), "intValue");
    CFDictionaryRef v8 = (void *)[v6 objectForKey:@"RequestedTime"];
    uint64_t v9 = [v6 objectForKey:@"CompletionHandler"];
    if (v7 == -12432)
    {
      if (v8) {
        [v8 CMTimeValue];
      }
      else {
        memset(v18, 0, sizeof(v18));
      }
      uint64_t v10 = *(void (**)(uint64_t, void *, void, long long *, uint64_t, void))(v9 + 16);
      long long v16 = *MEMORY[0x1E4F1F9F8];
      uint64_t v17 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      v10(v9, v18, 0, &v16, 2, 0);
    }
    else
    {
      if (v8) {
        [v8 CMTimeValue];
      }
      else {
        memset(v15, 0, sizeof(v15));
      }
      id v11 = [(AVAssetImageGenerator *)self _NSErrorForError:v7];
      uint64_t v12 = *(void (**)(uint64_t, void *, void, long long *, uint64_t, id))(v9 + 16);
      long long v16 = *MEMORY[0x1E4F1F9F8];
      uint64_t v17 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      v12(v9, v15, 0, &v16, 1, v11);
    }
    requestsQueue = self->_priv->requestsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AVAssetImageGenerator__failedToGenerateCGImage___block_invoke;
    block[3] = &unk_1E57B2098;
    void block[4] = self;
    block[5] = v6;
    dispatch_async(requestsQueue, block);
  }
}

uint64_t __50__AVAssetImageGenerator__failedToGenerateCGImage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) removeObject:*(void *)(a1 + 40)];
}

- (void)_serverDied
{
  requestsQueue = self->_priv->requestsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVAssetImageGenerator__serverDied__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_async(requestsQueue, block);
}

uint64_t __36__AVAssetImageGenerator__serverDied__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112);
  uint64_t v1 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v19;
    long long v14 = *MEMORY[0x1E4F1F9F8];
    uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v19 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v7 = (void *)[v6 objectForKey:@"RequestedTime"];
        uint64_t v8 = [v6 objectForKey:@"CompletionHandler"];
        uint64_t v9 = AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0);
        if (v7) {
          [v7 CMTimeValue];
        }
        else {
          memset(v17, 0, sizeof(v17));
        }
        uint64_t v10 = *(void (**)(uint64_t, void *, void, long long *, uint64_t, uint64_t))(v8 + 16);
        long long v15 = v14;
        uint64_t v16 = v4;
        v10(v8, v17, 0, &v15, 1, v9);
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v2);
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) removeAllObjects];
}

- (id)_requestWithRequestID:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  uint64_t v12 = 0;
  requestsQueue = self->_priv->requestsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVAssetImageGenerator__requestWithRequestID___block_invoke;
  block[3] = &unk_1E57B21B0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = &v7;
  dispatch_sync(requestsQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __47__AVAssetImageGenerator__requestWithRequestID___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1[4] + 8) + 112);
  id result = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"RequestID"), "isEqual:", a1[5]))
        {
          id result = v7;
          *(void *)(*(void *)(a1[6] + 8) + 40) = result;
          return result;
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (CGSize)_scaledSizeForRenderSize:(CGSize)result
{
  priv = self->_priv;
  double width = priv->maximumSize.width;
  double height = priv->maximumSize.height;
  if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if (width <= 0.0) {
      double width = result.width;
    }
    if (height <= 0.0) {
      double height = result.height;
    }
    if (width < result.width || height < result.height)
    {
      float v8 = width / result.width;
      float v9 = height / result.height;
      result.double height = result.height * v8;
      result.double width = result.width * v9;
      if (v8 >= v9) {
        result.double height = height;
      }
      else {
        result.double width = width;
      }
    }
  }
  return result;
}

- (CGImage)_copyCGImageAtTime:(id *)a3 usingAssetReader:(id)a4 error:(id *)a5
{
  CGImageRef imageOut = 0;
  float v8 = (void *)[a4 outputs];
  if (![v8 count])
  {
    uint64_t v13 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11832, 0);
LABEL_15:
    id result = 0;
    if (!a5) {
      return result;
    }
    goto LABEL_16;
  }
  float v9 = (void *)[v8 objectAtIndex:0];
  CMTime start = (CMTime)*a3;
  CMTime v19 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTimeRangeMake(&v21, &start, &v19);
  [a4 setTimeRange:&v21];
  [a4 _setReadSingleSample:1];
  [a4 startReading];
  uint64_t v10 = [v9 copyNextSampleBuffer];
  if (!v10)
  {
    if ([a4 status] == 3)
    {
      uint64_t v13 = (void *)[a4 error];
      long long v15 = (void *)[v13 userInfo];
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      uint64_t v17 = (void *)[v15 objectForKey:*MEMORY[0x1E4F28A50]];
      if ([v17 code] == -12138)
      {
        long long v18 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v17 forKey:v16];
      }
      else
      {
        if ([v13 code] != -11841)
        {
LABEL_14:
          [a4 cancelReading];
          goto LABEL_15;
        }
        long long v18 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v13 forKey:v16];
      }
    }
    else
    {
      long long v18 = 0;
    }
    uint64_t v13 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11832, v18);
    goto LABEL_14;
  }
  long long v11 = (opaqueCMSampleBuffer *)v10;
  [a4 cancelReading];
  ImageBuffer = CMSampleBufferGetImageBuffer(v11);
  if (!ImageBuffer || (VTCreateCGImageFromCVPixelBuffer(ImageBuffer, 0, &imageOut), uint64_t v13 = 0, !imageOut)) {
    uint64_t v13 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11801, 0);
  }
  CFRelease(v11);
  id result = imageOut;
  if (a5)
  {
LABEL_16:
    if (!result) {
      *a5 = v13;
    }
  }
  return result;
}

- (id)_NSErrorForError:(int)a3
{
  if (a3 == 268435459) {
    return (id)AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0);
  }
  else {
    return (id)AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  }
}

- (BOOL)isDefunct
{
  unsigned __int8 v10 = 0;
  if ([[(AVAssetImageGenerator *)self asset] isDefunct])
  {
    int v3 = 1;
  }
  else
  {
    generator = self->_priv->generator;
    uint64_t v5 = *(void **)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    if (*v6 < 5uLL)
    {
      int v3 = 0;
      LOBYTE(v7) = 0;
    }
    else
    {
      uint64_t v7 = (unsigned int (*)(OpaqueFigAssetImageGenerator *, unsigned __int8 *))v6[11];
      if (v7)
      {
        LOBYTE(v7) = v7(generator, &v10) == 0;
        int v3 = v10;
      }
      else
      {
        int v3 = 0;
      }
    }
    if (v7) {
      int v8 = v3;
    }
    else {
      int v8 = 1;
    }
    if (!v3) {
      int v3 = v8;
    }
  }
  return v3 == 1;
}

@end