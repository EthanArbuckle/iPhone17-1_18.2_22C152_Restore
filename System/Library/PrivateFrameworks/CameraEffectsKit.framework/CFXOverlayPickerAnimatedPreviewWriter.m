@interface CFXOverlayPickerAnimatedPreviewWriter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderTime;
- (BOOL)isFirstAnimatedFrame;
- (CFXOverlayPickerAnimatedPreviewWriter)initWithOverlayEffectId:(id)a3 previewSizeInPixels:(CGSize)a4 previewDuration:(double)a5 previewFrameRate:(unint64_t)a6 previewStartFrameIndex:(unint64_t)a7;
- (CGSize)previewSizeInPixels;
- (JFXEffectsPreviewGenerator)previewGenerator;
- (JFXOverlayEffect)overlay;
- (NSDictionary)frameProperties;
- (NSString)destinationPath;
- (OS_dispatch_queue)writerQueue;
- (double)previewDuration;
- (id)completionBlock;
- (unint64_t)currentFrameCount;
- (unint64_t)previewFrameRate;
- (unint64_t)previewStartFrameIndex;
- (unint64_t)targetFrameCount;
- (void)CFX_beginWriting;
- (void)CFX_finishWriting;
- (void)CFX_initializeEffectForPreviewing;
- (void)CFX_writeNextEffectFrame;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentFrameCount:(unint64_t)a3;
- (void)setCurrentRenderTime:(id *)a3;
- (void)setDestinationPath:(id)a3;
- (void)setFrameProperties:(id)a3;
- (void)setIsFirstAnimatedFrame:(BOOL)a3;
- (void)setOverlay:(id)a3;
- (void)setPreviewDuration:(double)a3;
- (void)setPreviewFrameRate:(unint64_t)a3;
- (void)setPreviewGenerator:(id)a3;
- (void)setPreviewStartFrameIndex:(unint64_t)a3;
- (void)setTargetFrameCount:(unint64_t)a3;
- (void)writeAnimatedPreviewToPath:(id)a3 completion:(id)a4;
@end

@implementation CFXOverlayPickerAnimatedPreviewWriter

- (CFXOverlayPickerAnimatedPreviewWriter)initWithOverlayEffectId:(id)a3 previewSizeInPixels:(CGSize)a4 previewDuration:(double)a5 previewFrameRate:(unint64_t)a6 previewStartFrameIndex:(unint64_t)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CFXOverlayPickerAnimatedPreviewWriter;
  v14 = [(CFXOverlayPickerAnimatedPreviewWriter *)&v25 init];
  if (!v14) {
    goto LABEL_4;
  }
  v15 = +[JFXEffectFactory sharedInstance];
  uint64_t v16 = [v15 createEffectForType:2 fromID:v13 withProperties:0];
  overlay = v14->_overlay;
  v14->_overlay = (JFXOverlayEffect *)v16;

  v18 = [(JFXEffect *)v14->_overlay renderEffect];

  if (v18)
  {
    v14->_previewSizeInPixels.CGFloat width = width;
    v14->_previewSizeInPixels.CGFloat height = height;
    uint64_t v19 = MEMORY[0x263F010E0];
    *(_OWORD *)&v14->_currentRenderTime.value = *MEMORY[0x263F010E0];
    v14->_currentRenderTime.epoch = *(void *)(v19 + 16);
    v14->_previewDuration = a5;
    v14->_previewFrameRate = a6;
    v14->_previewStartFrameIndex = a7;
    v14->_targetFrameCount = (unint64_t)-((double)a7 - (double)a6 * a5);
    [(CFXOverlayPickerAnimatedPreviewWriter *)v14 CFX_initializeEffectForPreviewing];
    dispatch_queue_t v20 = dispatch_queue_create("OverlayPickerAnimatedPreviewWriter.writerQ", 0);
    writerQueue = v14->_writerQueue;
    v14->_writerQueue = (OS_dispatch_queue *)v20;

    v14->_currentFrameCount = 0;
    v14->_imageDestination = 0;
    ++s_PreviewRequestParentCodeCounter;
LABEL_4:
    v22 = v14;
    goto LABEL_8;
  }
  v23 = JFXLog_core();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[CFXOverlayPickerAnimatedPreviewWriter initWithOverlayEffectId:previewSizeInPixels:previewDuration:previewFrameRate:previewStartFrameIndex:]((uint64_t)v13, v23);
  }

  v22 = 0;
LABEL_8:

  return v22;
}

- (void)CFX_initializeEffectForPreviewing
{
  v3 = [(CFXOverlayPickerAnimatedPreviewWriter *)self overlay];
  [v3 setImageSequencePathToBundledAssets];

  [(CFXOverlayPickerAnimatedPreviewWriter *)self previewDuration];
  CMTimeMakeWithSeconds(&duration, v4, [(CFXOverlayPickerAnimatedPreviewWriter *)self previewFrameRate]);
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  long long v19 = *(_OWORD *)&start.value;
  CMTimeEpoch epoch = start.epoch;
  CMTimeRangeMake(&v26, &start, &duration);
  v6 = [(CFXOverlayPickerAnimatedPreviewWriter *)self overlay];
  v7 = [v6 renderEffect];
  CMTimeRange v24 = v26;
  [v7 setEffectRange:&v24];

  v8 = [(CFXOverlayPickerAnimatedPreviewWriter *)self overlay];
  [(CFXOverlayPickerAnimatedPreviewWriter *)self previewSizeInPixels];
  objc_msgSend(v8, "setRenderSize:");

  v9 = [(CFXOverlayPickerAnimatedPreviewWriter *)self overlay];
  [v9 enablePresentationState:1];

  [(CFXOverlayPickerAnimatedPreviewWriter *)self previewSizeInPixels];
  double v11 = v10;
  [(CFXOverlayPickerAnimatedPreviewWriter *)self previewSizeInPixels];
  double v13 = v12;
  v14 = [(CFXOverlayPickerAnimatedPreviewWriter *)self overlay];
  *(_OWORD *)&start.value = v19;
  start.CMTimeEpoch epoch = epoch;
  objc_msgSend(v14, "applyScaleToFitFrame:withComponentTime:relativeRect:", &start, 0.0, 0.0, v11, v13, 0.0, 0.0, v11, v13);

  v15 = [(CFXOverlayPickerAnimatedPreviewWriter *)self overlay];
  [v15 pickerScale];
  CGFloat v17 = v16;

  if (v17 != 1.0)
  {
    v18 = [(CFXOverlayPickerAnimatedPreviewWriter *)self overlay];
    CGAffineTransformMakeScale(&v23, v17, v17);
    long long v20 = v19;
    CMTimeEpoch v21 = epoch;
    objc_msgSend(v18, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v23, &v20, 1, 0.0, 0.0, v11, v13);
  }
}

- (void)writeAnimatedPreviewToPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CFXOverlayPickerAnimatedPreviewWriter *)self writerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CFXOverlayPickerAnimatedPreviewWriter_writeAnimatedPreviewToPath_completion___block_invoke;
  block[3] = &unk_264C0A418;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __79__CFXOverlayPickerAnimatedPreviewWriter_writeAnimatedPreviewToPath_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDestinationPath:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCompletionBlock:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "CFX_beginWriting");
}

- (void)CFX_beginWriting
{
  v3 = [(CFXOverlayPickerAnimatedPreviewWriter *)self writerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CFXOverlayPickerAnimatedPreviewWriter_CFX_beginWriting__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __57__CFXOverlayPickerAnimatedPreviewWriter_CFX_beginWriting__block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2[1]) {
    objc_msgSend(v2, "CFX_finishWriting");
  }
  v3 = [(id)*MEMORY[0x263F1DC08] identifier];

  CFURLRef v4 = [NSURL fileURLWithPath:*(void *)(*(void *)(a1 + 32) + 32)];
  *(void *)(*(void *)(a1 + 32) + 8) = CGImageDestinationCreateWithURL(v4, v3, [*(id *)(a1 + 32) targetFrameCount], 0);

  double v5 = 1.0 / (double)(unint64_t)[*(id *)(a1 + 32) previewFrameRate];
  uint64_t v24 = *MEMORY[0x263F0F4E0];
  uint64_t v6 = v24;
  uint64_t v7 = *MEMORY[0x263F0F068];
  v23[0] = &unk_26E8019E0;
  uint64_t v8 = *MEMORY[0x263F0F070];
  v22[0] = v7;
  v22[1] = v8;
  float v9 = v5;
  *(float *)&double v5 = v9;
  id v10 = [NSNumber numberWithFloat:v5];
  v23[1] = v10;
  double v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v25[0] = v11;
  CFDictionaryRef v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

  CGImageDestinationSetProperties(*(CGImageDestinationRef *)(*(void *)(a1 + 32) + 8), v12);
  uint64_t v20 = v6;
  v18[0] = *MEMORY[0x263F0F058];
  *(float *)&double v13 = v9;
  v14 = [NSNumber numberWithFloat:v13];
  v18[1] = *MEMORY[0x263F0EFE8];
  v19[0] = v14;
  v19[1] = &unk_26E801E90;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  CMTimeEpoch v21 = v15;
  double v16 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [*(id *)(a1 + 32) setFrameProperties:v16];

  CGFloat v17 = objc_alloc_init(JFXEffectsPreviewGenerator);
  [*(id *)(a1 + 32) setPreviewGenerator:v17];

  [*(id *)(*(void *)(a1 + 32) + 88) setName:@"AnimatedPreviewWriter"];
  if ([*(id *)(a1 + 32) targetFrameCount] != 1) {
    [*(id *)(a1 + 32) setIsFirstAnimatedFrame:1];
  }
  objc_msgSend(*(id *)(a1 + 32), "CFX_writeNextEffectFrame");
}

- (void)CFX_writeNextEffectFrame
{
  v3 = [(CFXOverlayPickerAnimatedPreviewWriter *)self writerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke(uint64_t a1)
{
  v2 = [JFXEffectsPreviewGenerationRequest alloc];
  v3 = [*(id *)(a1 + 32) overlay];
  [*(id *)(a1 + 32) previewSizeInPixels];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8) {
    [v8 currentRenderTime];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  float v9 = -[JFXEffectsPreviewGenerationRequest initWithInputGenerator:effectStack:outputSize:renderTime:](v2, "initWithInputGenerator:effectStack:outputSize:renderTime:", v3, 0, v14, v5, v7);

  [(JFXEffectsPreviewGenerationRequest *)v9 setParentCode:s_PreviewRequestParentCodeCounter];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v10 = [*(id *)(a1 + 32) previewGenerator];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke_2;
  v11[3] = &unk_264C0C0A8;
  objc_copyWeak(&v12, &location);
  v11[4] = *(void *)(a1 + 32);
  [v10 generatePreviewRequest:v9 completionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      double v5 = [v3 objectEnumerator];
      double v6 = [v5 nextObject];

      if (v6)
      {
        double v7 = [[JTImage alloc] initWithPVImage:v6];

        if (v7)
        {
          uint64_t v8 = *(CGImageDestination **)(*(void *)(a1 + 32) + 8);
          id v9 = [(JTImage *)v7 image];
          id v10 = (CGImage *)[v9 CGImage];
          CFDictionaryRef v11 = [*(id *)(a1 + 32) frameProperties];
          CGImageDestinationAddImage(v8, v10, v11);

          objc_msgSend(*(id *)(a1 + 32), "setCurrentFrameCount:", objc_msgSend(*(id *)(a1 + 32), "currentFrameCount") + 1);
          unint64_t v12 = [*(id *)(a1 + 32) currentFrameCount];
          if (v12 >= [*(id *)(a1 + 32) targetFrameCount])
          {
            objc_msgSend(*(id *)(a1 + 32), "CFX_finishWriting");
          }
          else
          {
            memset(&v29, 0, sizeof(v29));
            CMTimeMake(&v29, 1, [*(id *)(a1 + 32) previewFrameRate]);
            int v13 = [*(id *)(a1 + 32) isFirstAnimatedFrame];
            v14 = *(void **)(a1 + 32);
            if (v13)
            {
              v15 = [v14 overlay];
              [v15 enablePresentationState:0];

              double v16 = [*(id *)(a1 + 32) overlay];
              [v16 setBuildInAnimation:1];

              CGFloat v17 = *(void **)(a1 + 32);
              long long v27 = *MEMORY[0x263F010E0];
              uint64_t v28 = *(void *)(MEMORY[0x263F010E0] + 16);
              [v17 setCurrentRenderTime:&v27];
              [*(id *)(a1 + 32) setIsFirstAnimatedFrame:0];
              int32_t v18 = [*(id *)(a1 + 32) previewStartFrameIndex];
              CMTime time = v29;
              CMTimeMultiply(&v26, &time, v18);
              long long v19 = *(void **)(a1 + 32);
              CMTime v24 = v26;
              uint64_t v20 = &v24;
            }
            else
            {
              if (v14) {
                [v14 currentRenderTime];
              }
              else {
                memset(&lhs, 0, sizeof(lhs));
              }
              CMTime time = v29;
              CMTimeAdd(&v23, &lhs, &time);
              long long v19 = *(void **)(a1 + 32);
              CMTime v21 = v23;
              uint64_t v20 = &v21;
            }
            objc_msgSend(v19, "setCurrentRenderTime:", v20, *(_OWORD *)&v21.value, v21.epoch);
            objc_msgSend(WeakRetained, "CFX_writeNextEffectFrame");
          }
        }
      }
    }
  }
}

- (void)CFX_finishWriting
{
  id v3 = [(CFXOverlayPickerAnimatedPreviewWriter *)self writerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CFXOverlayPickerAnimatedPreviewWriter_CFX_finishWriting__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__CFXOverlayPickerAnimatedPreviewWriter_CFX_finishWriting__block_invoke(uint64_t a1)
{
  v2 = *(CGImageDestination **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    BOOL v3 = CGImageDestinationFinalize(v2);
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 8));
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
    [*(id *)(a1 + 32) setPreviewGenerator:0];
    double v4 = [*(id *)(a1 + 32) completionBlock];

    if (v4)
    {
      double v5 = [*(id *)(a1 + 32) completionBlock];
      v5[2](v5, v3);
    }
  }
}

- (JFXOverlayEffect)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (CGSize)previewSizeInPixels
{
  double width = self->_previewSizeInPixels.width;
  double height = self->_previewSizeInPixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (NSDictionary)frameProperties
{
  return self->_frameProperties;
}

- (void)setFrameProperties:(id)a3
{
}

- (unint64_t)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unint64_t)a3
{
  self->_currentFrameCount = a3;
}

- (unint64_t)previewFrameRate
{
  return self->_previewFrameRate;
}

- (void)setPreviewFrameRate:(unint64_t)a3
{
  self->_previewFrameRate = a3;
}

- (double)previewDuration
{
  return self->_previewDuration;
}

- (void)setPreviewDuration:(double)a3
{
  self->_previewDuration = a3;
}

- (unint64_t)previewStartFrameIndex
{
  return self->_previewStartFrameIndex;
}

- (void)setPreviewStartFrameIndex:(unint64_t)a3
{
  self->_previewStartFrameIndex = a3;
}

- (unint64_t)targetFrameCount
{
  return self->_targetFrameCount;
}

- (void)setTargetFrameCount:(unint64_t)a3
{
  self->_targetFrameCount = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setCurrentRenderTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_currentRenderTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_currentRenderTime.value = v3;
}

- (JFXEffectsPreviewGenerator)previewGenerator
{
  return self->_previewGenerator;
}

- (void)setPreviewGenerator:(id)a3
{
}

- (OS_dispatch_queue)writerQueue
{
  return self->_writerQueue;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)isFirstAnimatedFrame
{
  return self->_isFirstAnimatedFrame;
}

- (void)setIsFirstAnimatedFrame:(BOOL)a3
{
  self->_isFirstAnimatedFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_writerQueue, 0);
  objc_storeStrong((id *)&self->_previewGenerator, 0);
  objc_storeStrong((id *)&self->_frameProperties, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
}

- (void)initWithOverlayEffectId:(uint64_t)a1 previewSizeInPixels:(NSObject *)a2 previewDuration:previewFrameRate:previewStartFrameIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "could not load effect id %@", (uint8_t *)&v2, 0xCu);
}

@end