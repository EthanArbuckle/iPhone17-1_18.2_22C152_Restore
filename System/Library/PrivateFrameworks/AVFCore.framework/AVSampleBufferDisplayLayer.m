@interface AVSampleBufferDisplayLayer
+ (CGRect)_destRectForAspectRatio:(CGSize)a3;
+ (id)keyPathsForValuesAffectingError;
+ (id)keyPathsForValuesAffectingOutputObscuredDueToInsufficientExternalProtection;
+ (id)keyPathsForValuesAffectingStatus;
- (AVLayerVideoGravity)videoGravity;
- (AVQueuedSampleBufferRenderingStatus)status;
- (AVSampleBufferDisplayLayer)init;
- (AVSampleBufferVideoOutput)output;
- (AVSampleBufferVideoRenderer)_sampleBufferVideoRenderer;
- (BOOL)_attachedToExternalContentKeySession;
- (BOOL)_disallowsVideoLayerDisplayCompositing;
- (BOOL)hasSufficientMediaDataForReliablePlaybackStart;
- (BOOL)isDefunct;
- (BOOL)isReadyForDisplay;
- (BOOL)isReadyForMoreMediaData;
- (BOOL)mayRequireContentKeysForMediaDataProcessing;
- (BOOL)outputObscuredDueToInsufficientExternalProtection;
- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback;
- (BOOL)preventsCapture;
- (BOOL)preventsDisplaySleepDuringVideoPlayback;
- (BOOL)requiresFlushToResumeDecoding;
- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4;
- (CGRect)videoRect;
- (CMTimebaseRef)controlTimebase;
- (CMTimebaseRef)timebase;
- (NSError)error;
- (__CVBuffer)copyDisplayedPixelBuffer;
- (id)_STSLabel;
- (id)_contentLayer;
- (id)contentKeySession;
- (id)makeVideoRenderer;
- (id)videoPerformanceMetrics;
- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5;
- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3;
- (void)_updateLayerTreeGeometryWithVideoGravity:(id)a3 presentationSize:(CGSize)a4 videoGravityShouldTriggerAnimation:(BOOL)a5;
- (void)_updatePresentationSize:(CGSize)a3;
- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3;
- (void)dealloc;
- (void)enqueueSampleBuffer:(CMSampleBufferRef)sampleBuffer;
- (void)expectMinimumUpcomingSampleBufferPresentationTime:(id *)a3;
- (void)expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes;
- (void)flush;
- (void)flushAndRemoveImage;
- (void)flushWithRemovalOfDisplayedImage:(BOOL)a3 completionHandler:(id)a4;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)layoutSublayers;
- (void)postVideoRectDidChangeNotification;
- (void)prerollDecodeWithCompletionHandler:(id)a3;
- (void)requestMediaDataWhenReadyOnQueue:(dispatch_queue_t)queue usingBlock:(void *)block;
- (void)resetUpcomingSampleBufferPresentationTimeExpectations;
- (void)setBounds:(CGRect)a3;
- (void)setControlTimebase:(CMTimebaseRef)controlTimebase;
- (void)setOutput:(id)a3;
- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)preventsAutomaticBackgroundingDuringVideoPlayback;
- (void)setPreventsCapture:(BOOL)preventsCapture;
- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)preventsDisplaySleepDuringVideoPlayback;
- (void)setSTSLabel:(id)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity;
- (void)stopRequestingMediaData;
@end

@implementation AVSampleBufferDisplayLayer

- (void)_updateLayerTreeGeometryWithVideoGravity:(id)a3 presentationSize:(CGSize)a4 videoGravityShouldTriggerAnimation:(BOOL)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __123__AVSampleBufferDisplayLayer__updateLayerTreeGeometryWithVideoGravity_presentationSize_videoGravityShouldTriggerAnimation___block_invoke;
  v6[3] = &unk_1E57B1FB0;
  CGSize v7 = a4;
  v6[4] = self;
  v6[5] = a3;
  BOOL v8 = a5;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v6);
  [(AVSampleBufferDisplayLayer *)self postVideoRectDidChangeNotification];
}

uint64_t __123__AVSampleBufferDisplayLayer__updateLayerTreeGeometryWithVideoGravity_presentationSize_videoGravityShouldTriggerAnimation___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  +[AVSampleBufferDisplayLayer _destRectForAspectRatio:](AVSampleBufferDisplayLayer, "_destRectForAspectRatio:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) bounds];
  double v8 = v7;
  double v10 = v9;
  double v11 = v6;
  double v13 = v12;
  double v14 = (v6 - v3) * 0.5;
  double v15 = (v12 - v5) * 0.5;
  BOOL v16 = v12 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v6 == *MEMORY[0x1E4F1DB30];
  [*(id *)(*(void *)(a1 + 32) + 32) setHidden:v16];
  memset(&v41, 0, sizeof(v41));
  CATransform3DMakeTranslation(&v41, v14, v15, 0.0);
  memset(&v40, 0, sizeof(v40));
  AVLayerTransformForPlacement(*(void **)(a1 + 40), 1, (uint64_t)&v40, v3, v5, v11, v13);
  memset(&v39, 0, sizeof(v39));
  CATransform3D a = v41;
  CATransform3D b = v40;
  CATransform3DConcat(&v39, &a, &b);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v17 = objc_msgSend(*(id *)(a1 + 32), "animationKeys", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = 0;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = (void *)[*(id *)(a1 + 32) animationForKey:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          v23 = 0;
        }
        if (objc_msgSend((id)objc_msgSend(v23, "keyPath"), "hasPrefix:", @"bounds")) {
          id v20 = (id)[v23 copy];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v19);
  }
  else
  {
    id v20 = 0;
  }
  [v20 duration];
  if (v24 > 0.0 || *(unsigned char *)(a1 + 64))
  {
    [v20 duration];
    double v26 = v25;
    uint64_t v27 = [v20 timingFunction];
    v28 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"sublayerTransform"];
    [v28 setDuration:v26];
    [v28 setTimingFunction:v27];
    [*(id *)(*(void *)(a1 + 32) + 32) addAnimation:v28 forKey:@"sublayerTransform"];
    v29 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
    [v29 setDuration:v26];
    [v29 setTimingFunction:v27];
    [*(id *)(*(void *)(a1 + 32) + 32) addAnimation:v29 forKey:@"position"];
    v30 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
    [v30 setDuration:v26];
    [v30 setTimingFunction:v27];
    [*(id *)(*(void *)(a1 + 32) + 32) addAnimation:v30 forKey:@"bounds"];
  }
  v31 = *(void **)(*(void *)(a1 + 32) + 32);
  CATransform3D a = v39;
  [v31 setSublayerTransform:&a];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setPosition:", v8 + v11 * 0.5, v10 + v13 * 0.5);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setBounds:", v8, v10, v11, v13);
  return [MEMORY[0x1E4F39CF8] commit];
}

- (void)_updatePresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3052000000;
  double v12 = __Block_byref_object_copy__37;
  double v13 = __Block_byref_object_dispose__37;
  uint64_t v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVSampleBufferDisplayLayer__updatePresentationSize___block_invoke;
  block[3] = &unk_1E57B70F8;
  CGSize v8 = a3;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v16 + 24)) {
    -[AVSampleBufferDisplayLayer _updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:](self, "_updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:", v10[5], 0, width, height);
  }

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __54__AVSampleBufferDisplayLayer__updatePresentationSize___block_invoke(uint64_t result)
{
  if (*(double *)(*(void *)(result + 32) + 48) != *(double *)(result + 56)
    || *(double *)(*(void *)(result + 32) + 56) != *(double *)(result + 64))
  {
    uint64_t v2 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(_OWORD *)(*(void *)(result + 32) + 48) = *(_OWORD *)(result + 56);
    result = [*(id *)(*(void *)(result + 32) + 40) copy];
    *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) = result;
  }
  return result;
}

+ (CGRect)_destRectForAspectRatio:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (a3.width > 0.0 && a3.height > 0.0)
  {
    v10.size.double width = 1600.0;
    v10.origin.x = 0.0;
    v10.origin.y = 0.0;
    v10.size.double height = 1600.0;
    *(CGRect *)(&v5 - 2) = AVMakeRectWithAspectRatioInsideRect(a3, v10);
  }
  double v7 = v3;
  double v8 = v4;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (AVSampleBufferDisplayLayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVSampleBufferDisplayLayer;
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)&v8 init];
  if (v2)
  {
    double v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferDisplayLayerQueue", v3);
    double v4 = objc_alloc_init(AVSampleBufferDisplayLayerContentLayer);
    v2->_contentLayer = &v4->super;
    [(AVSampleBufferDisplayLayer *)v2 addSublayer:v4];
    [(CALayer *)v2->_contentLayer setEdgeAntialiasingMask:0];
    [(AVSampleBufferDisplayLayer *)v2 setVideoGravity:@"AVLayerVideoGravityResizeAspect"];
    v2->_presentationSize = (CGSize)*MEMORY[0x1E4F1DB30];
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v2->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->_bounds.size = v5;
    [(CALayer *)v2->_contentLayer setHidden:1];
    [(CALayer *)v2->_contentLayer setMasksToBounds:1];
    double v6 = (AVSampleBufferVideoRenderer *)[(AVSampleBufferDisplayLayer *)v2 makeVideoRenderer];
    v2->_sampleBufferVideoRenderer = v6;
    if (v6)
    {
      [(AVSampleBufferVideoRenderer *)v6 addSampleBufferDisplayLayer:v2];
      [(AVSampleBufferDisplayLayer *)v2 resetUpcomingSampleBufferPresentationTimeExpectations];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(AVSampleBufferVideoRenderer *)self->_sampleBufferVideoRenderer removeDisplayLayer];
  serialQueue = self->_serialQueue;
  if (serialQueue)
  {
    dispatch_release(serialQueue);
    self->_serialQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferDisplayLayer;
  [(AVSampleBufferDisplayLayer *)&v4 dealloc];
}

- (void)setControlTimebase:(CMTimebaseRef)controlTimebase
{
  objc_super v4 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v4 setControlTimebase:controlTimebase];
}

- (CMTimebaseRef)controlTimebase
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 controlTimebase];
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v7 = 0;
  objc_super v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  CGRect v10 = &unk_194C75EBF;
  long long v11 = *MEMORY[0x1E4F1DB30];
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AVSampleBufferDisplayLayer_setVideoGravity___block_invoke;
  v6[3] = &unk_1E57B2188;
  v6[4] = self;
  v6[5] = videoGravity;
  void v6[6] = &v7;
  v6[7] = &v12;
  dispatch_sync(serialQueue, v6);
  if (*((unsigned char *)v13 + 24)) {
    -[AVSampleBufferDisplayLayer _updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:](self, "_updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:", videoGravity, [MEMORY[0x1E4F39CF8] disableActions] ^ 1, v8[4], v8[5]);
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v12, 8);
}

__n128 __46__AVSampleBufferDisplayLayer_setVideoGravity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if ((v3 != 0) != (v2 == 0))
  {
    if (objc_msgSend(v3, "isEqualToString:")) {
      return result;
    }
    double v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }

  *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) copy];
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 48);
  *(__n128 *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

- (AVLayerVideoGravity)videoGravity
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__37;
  CGRect v10 = __Block_byref_object_dispose__37;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVSampleBufferDisplayLayer_videoGravity__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  double v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVSampleBufferDisplayLayer_videoGravity__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isReadyForDisplay
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 isReadyForDisplay];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferDisplayLayer;
  -[AVSampleBufferDisplayLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AVSampleBufferDisplayLayer *)self postVideoRectDidChangeNotification];
}

- (void)layoutSublayers
{
  v17.receiver = self;
  v17.super_class = (Class)AVSampleBufferDisplayLayer;
  [(AVSampleBufferDisplayLayer *)&v17 layoutSublayers];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__37;
  char v15 = __Block_byref_object_dispose__37;
  uint64_t v16 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x3010000000;
  uint64_t v9 = &unk_194C75EBF;
  serialQueue = self->_serialQueue;
  long long v10 = *MEMORY[0x1E4F1DB30];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AVSampleBufferDisplayLayer_layoutSublayers__block_invoke;
  block[3] = &unk_1E57B3888;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v6;
  dispatch_sync(serialQueue, block);
  -[AVSampleBufferDisplayLayer _updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:](self, "_updateLayerTreeGeometryWithVideoGravity:presentationSize:videoGravityShouldTriggerAnimation:", v12[5], 0, v7[4], v7[5]);

  STSLayer = self->_STSLayer;
  [(AVSampleBufferDisplayLayer *)self bounds];
  -[CALayer setFrame:](STSLayer, "setFrame:");
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v11, 8);
}

__n128 __45__AVSampleBufferDisplayLayer_layoutSublayers__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [*(id *)(a1[4] + 40) copy];
  __n128 result = *(__n128 *)(a1[4] + 48);
  *(__n128 *)(*(void *)(a1[6] + 8) + 32) = result;
  return result;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferDisplayLayer;
  -[AVSampleBufferDisplayLayer layerDidBecomeVisible:](&v5, sel_layerDidBecomeVisible_);
  [(AVSampleBufferVideoRenderer *)[(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer] setDisplayLayerVisibility:v3];
}

- (CGRect)videoRect
{
  [(AVSampleBufferDisplayLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3052000000;
  long long v33 = __Block_byref_object_copy__37;
  long long v34 = __Block_byref_object_dispose__37;
  uint64_t v35 = 0;
  uint64_t v25 = 0;
  double v26 = (double *)&v25;
  uint64_t v27 = 0x3010000000;
  v28 = &unk_194C75EBF;
  serialQueue = self->_serialQueue;
  long long v29 = *MEMORY[0x1E4F1DB30];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AVSampleBufferDisplayLayer_videoRect__block_invoke;
  block[3] = &unk_1E57B3888;
  block[4] = self;
  block[5] = &v25;
  block[6] = &v30;
  dispatch_sync(serialQueue, block);
  AVLayerVideoRectForPlayerLayerBoundsPresentationSizeAndVideoGravity((void *)v31[5], v4, v6, v8, v10, v26[4], v26[5]);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v30, 8);
  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

uint64_t __39__AVSampleBufferDisplayLayer_videoRect__block_invoke(void *a1)
{
  *(_OWORD *)(*(void *)(a1[5] + 8) + 32) = *(_OWORD *)(a1[4] + 48);
  uint64_t result = [*(id *)(a1[4] + 40) copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)postVideoRectDidChangeNotification
{
  double v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"AVSampleBufferDisplayLayerVideoRectDidChangeNotification" object:self];
}

- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4
{
  double v6 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v6 setRenderSynchronizer:a3 error:a4];
}

- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3
{
  if (a3) {
    *a3 = 0;
  }
}

- (void)setSTSLabel:(id)a3
{
  if ([(AVSampleBufferDisplayLayer *)self _STSLabel] != a3)
  {
    [(AVSampleBufferVideoRenderer *)[(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer] setSTSLabel:a3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__AVSampleBufferDisplayLayer_setSTSLabel___block_invoke;
    v5[3] = &unk_1E57B2098;
    v5[4] = a3;
    v5[5] = self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __42__AVSampleBufferDisplayLayer_setSTSLabel___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(*(void *)(a1 + 40) + 120);
  if (v2)
  {
    if (!v3)
    {
      *(void *)(*(void *)(a1 + 40) + 120) = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      double v4 = *(void **)(a1 + 40);
      double v5 = (void *)v4[15];
      [v4 bounds];
      objc_msgSend(v5, "setFrame:");
      [*(id *)(a1 + 40) addSublayer:*(void *)(*(void *)(a1 + 40) + 120)];
      uint64_t v2 = *(void *)(a1 + 32);
      double v3 = *(void **)(*(void *)(a1 + 40) + 120);
    }
    [v3 setValue:v2 forKeyPath:@"separatedOptions.STSLabel"];
  }
  else if (v3)
  {
    [v3 removeFromSuperlayer];

    *(void *)(*(void *)(a1 + 40) + 120) = 0;
  }
  double v6 = (void *)MEMORY[0x1E4F39CF8];
  return [v6 commit];
}

- (id)_STSLabel
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 _STSLabel];
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVSampleBufferVideoRenderer *)[(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer] setToneMapToStandardDynamicRange:a3];
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferDisplayLayer;
  [(AVSampleBufferDisplayLayer *)&v5 setToneMapToStandardDynamicRange:v3];
}

- (id)makeVideoRenderer
{
  uint64_t v2 = objc_alloc_init(AVSampleBufferVideoRenderer);
  return v2;
}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"sampleBufferVideoRenderer.status"];
}

+ (id)keyPathsForValuesAffectingError
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"sampleBufferVideoRenderer.error"];
}

+ (id)keyPathsForValuesAffectingOutputObscuredDueToInsufficientExternalProtection
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"sampleBufferVideoRenderer.outputObscuredDueToInsufficientExternalProtection"];
}

- (BOOL)isReadyForMoreMediaData
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 isReadyForMoreMediaData];
}

- (AVQueuedSampleBufferRenderingStatus)status
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 status];
}

- (NSError)error
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 error];
}

- (id)_contentLayer
{
  return self->_contentLayer;
}

- (AVSampleBufferVideoRenderer)_sampleBufferVideoRenderer
{
  return self->_sampleBufferVideoRenderer;
}

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  return [(AVSampleBufferVideoRenderer *)self->_sampleBufferVideoRenderer attachToContentKeySession:a3 contentKeyBoss:a4 failedSinceAlreadyAttachedToAnotherSession:a5];
}

- (BOOL)_attachedToExternalContentKeySession
{
  return [(AVSampleBufferVideoRenderer *)self->_sampleBufferVideoRenderer attachedToExternalContentKeySession];
}

- (id)contentKeySession
{
  return [(AVSampleBufferVideoRenderer *)self->_sampleBufferVideoRenderer contentKeySession];
}

- (CMTimebaseRef)timebase
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 timebase];
}

- (void)enqueueSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(FormatDescription, 1u, 1u);
    -[AVSampleBufferDisplayLayer _updatePresentationSize:](self, "_updatePresentationSize:", 0, 0, *(void *)&PresentationDimensions.width, *(void *)&PresentationDimensions.height);
    +[AVSampleBufferDisplayLayer _destRectForAspectRatio:](AVSampleBufferDisplayLayer, "_destRectForAspectRatio:", PresentationDimensions.width, PresentationDimensions.height);
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = v9;
    v11[7] = v10;
    [(AVSampleBufferVideoRenderer *)[(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer] enqueueSampleBuffer:sampleBuffer bufferEnqueueingInfo:v11];
  }
}

- (void)flush
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v2 flush];
}

- (void)flushAndRemoveImage
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v2 flushAndRemoveImage];
}

- (void)flushWithRemovalOfDisplayedImage:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v5 = a3;
  double v6 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v6 flushWithRemovalOfDisplayedImage:v5 completionHandler:a4];
}

- (void)prerollDecodeWithCompletionHandler:(id)a3
{
  double v4 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v4 prerollDecodeWithCompletionHandler:a3];
}

- (void)requestMediaDataWhenReadyOnQueue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  double v6 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v6 requestMediaDataWhenReadyOnQueue:queue usingBlock:block];
}

- (void)stopRequestingMediaData
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v2 stopRequestingMediaData];
}

- (BOOL)hasSufficientMediaDataForReliablePlaybackStart
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 hasSufficientMediaDataForReliablePlaybackStart];
}

- (BOOL)requiresFlushToResumeDecoding
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 requiresFlushToResumeDecoding];
}

- (id)videoPerformanceMetrics
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 videoPerformanceMetrics];
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 outputObscuredDueToInsufficientExternalProtection];
}

- (void)setPreventsCapture:(BOOL)preventsCapture
{
  BOOL v3 = preventsCapture;
  double v4 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v4 setPreventsCapture:v3];
}

- (BOOL)preventsCapture
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 preventsCapture];
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)preventsDisplaySleepDuringVideoPlayback
{
  BOOL v3 = preventsDisplaySleepDuringVideoPlayback;
  double v4 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v4 setPreventsDisplaySleepDuringVideoPlayback:v3];
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 preventsDisplaySleepDuringVideoPlayback];
}

- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  BOOL v3 = preventsAutomaticBackgroundingDuringVideoPlayback;
  double v4 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v4 setPreventsAutomaticBackgroundingDuringVideoPlayback:v3];
}

- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 preventsAutomaticBackgroundingDuringVideoPlayback];
}

- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v4 _setDisallowsVideoLayerDisplayCompositing:v3];
}

- (BOOL)_disallowsVideoLayerDisplayCompositing
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 _disallowsVideoLayerDisplayCompositing];
}

- (void)expectMinimumUpcomingSampleBufferPresentationTime:(id *)a3
{
  double v4 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(AVSampleBufferVideoRenderer *)v4 expectMinimumUpcomingSampleBufferPresentationTime:&v5];
}

- (void)expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v2 expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes];
}

- (void)resetUpcomingSampleBufferPresentationTimeExpectations
{
  uint64_t v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  [(AVSampleBufferVideoRenderer *)v2 resetUpcomingSampleBufferPresentationTimeExpectations];
}

- (AVSampleBufferVideoOutput)output
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__37;
  double v12 = __Block_byref_object_dispose__37;
  uint64_t v13 = 0;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__output__block_invoke;
  v7[3] = &unk_1E57B2110;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(serialQueue, v7);
  double v4 = [(AVSampleBufferVideoRenderer *)[(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer] outputs];
  if ([(NSArray *)v4 containsObject:v9[5]]) {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = (AVSampleBufferVideoOutput *)v9[5];
  }
  else {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __70__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__output__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 112);
  return result;
}

- (void)setOutput:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__37;
  serialQueue = self->_serialQueue;
  double v12 = __Block_byref_object_dispose__37;
  uint64_t v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__setOutput___block_invoke;
  block[3] = &unk_1E57B6FB8;
  block[5] = self;
  block[6] = &v8;
  block[4] = a3;
  dispatch_sync(serialQueue, block);
  if ((id)v9[5] != v3)
  {
    double v6 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
    [(AVSampleBufferVideoRenderer *)v6 removeOutput:v9[5]];
    [(AVSampleBufferVideoRenderer *)v6 addOutput:v3];
    id v3 = (id)v9[5];
  }

  _Block_object_dispose(&v8, 8);
}

void __74__AVSampleBufferDisplayLayer_AVSampleBufferDisplayLayerOutput__setOutput___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(id *)(*(void *)(a1 + 40) + 112);

  *(void *)(*(void *)(a1 + 40) + 112) = *(void *)(a1 + 32);
}

- (__CVBuffer)copyDisplayedPixelBuffer
{
  id v2 = [(AVSampleBufferDisplayLayer *)self _sampleBufferVideoRenderer];
  return [(AVSampleBufferVideoRenderer *)v2 copyDisplayedPixelBuffer];
}

- (BOOL)isDefunct
{
  return 0;
}

@end