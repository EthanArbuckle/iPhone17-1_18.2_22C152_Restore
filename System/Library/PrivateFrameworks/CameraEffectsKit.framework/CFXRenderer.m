@interface CFXRenderer
+ (__CVBuffer)createBufferWith:(id)a3 size:(CGSize)a4;
+ (void)initialize;
- (BOOL)livePlayerIsSaturated;
- (CFXRenderer)initWithDelegate:(id)a3 captureMode:(int64_t)a4;
- (CFXRendererDelegate)delegate;
- (JFXAnimojiEffectRenderer)animojiRenderer;
- (JFXMetadataValidator)metadataValidator;
- (JFXPixelRotationSession)pixelRotationSession;
- (JTFrameRateCalculator)fpsCalc;
- (PVLivePlayer)livePlayer;
- (PVLivePlayerCameraSource)cameraSource;
- (UIColor)animojiBackgroundColor;
- (id)CFX_JTEffectsFromCFXEffectComposition:(id)a3 forRenderTime:(id *)a4;
- (id)CFX_PVFrameSetFromCFXFrame:(id)a3;
- (id)CFX_getPreviewColorSpace;
- (id)buildRenderRequest:(id)a3 time:(id *)a4;
- (int64_t)cameraMode;
- (int64_t)captureMode;
- (void)dealloc;
- (void)flush;
- (void)livePlayerDroppedFrame:(int)a3 sources:(id)a4 time:(id *)a5;
- (void)pause;
- (void)renderFrame:(id)a3 effectComposition:(id)a4;
- (void)renderRequestComplete:(id)a3 results:(id)a4 completedOutOfOrder:(BOOL)a5;
- (void)resetMetadataValidation;
- (void)resume;
- (void)setAnimojiBackgroundColor:(id)a3;
- (void)setAnimojiRenderer:(id)a3;
- (void)setCameraSource:(id)a3;
- (void)setCaptureMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLivePlayer:(id)a3;
- (void)setMetadataValidator:(id)a3;
- (void)setPixelRotationSession:(id)a3;
- (void)setTrackingLossDelegate:(id)a3;
- (void)shutdown;
- (void)willDropCameraFrame;
@end

@implementation CFXRenderer

+ (void)initialize
{
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_56);
  }
}

void __25__CFXRenderer_initialize__block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v0 addSuiteNamed:@"com.apple.avfoundation"];
}

+ (__CVBuffer)createBufferWith:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setObject:&unk_26E801BF0 forKeyedSubscript:*MEMORY[0x263F04180]];
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F04158]];
  v8 = [NSNumber numberWithDouble:width];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F04240]];

  v9 = [NSNumber numberWithDouble:height];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F04118]];

  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)width, (unint64_t)height, 0x20u, (CFDictionaryRef)v7, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  double v11 = height * (double)CVPixelBufferGetBytesPerRow(pixelBufferOut);
  float64_t v32 = 0.0;
  float64_t v33 = 0.0;
  float64_t v30 = 0.0;
  float64_t v31 = 0.0;
  [v6 getRed:&v33 green:&v32 blue:&v31 alpha:&v30];
  if (v11 > 0.0)
  {
    uint64_t v12 = 0;
    v13.f64[0] = v30;
    v13.f64[1] = v33;
    v14.f64[0] = v32;
    v14.f64[1] = v31;
    float64x2_t v15 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    int16x8_t v16 = (int16x8_t)vcvtq_s64_f64(vmulq_f64(v13, v15));
    *(int16x4_t *)v16.i8 = vuzp1_s16((int16x4_t)vmovn_s64((int64x2_t)v16), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vmulq_f64(v14, v15))));
    unsigned __int32 v17 = vmovn_s16(v16).u32[0];
    do
    {
      *(_DWORD *)&BaseAddress[v12] = v17;
      v12 += 4;
    }
    while (v11 > (double)(int)v12);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  v18 = [MEMORY[0x263F61230] extendedSRGBColorSpace];
  v19 = pixelBufferOut;
  CFStringRef v20 = (const __CFString *)*MEMORY[0x263F03ED8];
  v21 = [v18 nclcTriplet];
  CVBufferSetAttachment(v19, v20, (CFTypeRef)[v21 colorPrimary], kCVAttachmentMode_ShouldPropagate);

  v22 = pixelBufferOut;
  CFStringRef v23 = (const __CFString *)*MEMORY[0x263F03FC0];
  v24 = [v18 nclcTriplet];
  CVBufferSetAttachment(v22, v23, (CFTypeRef)[v24 transferFunction], kCVAttachmentMode_ShouldPropagate);

  v25 = pixelBufferOut;
  CFStringRef v26 = (const __CFString *)*MEMORY[0x263F04020];
  v27 = [v18 nclcTriplet];
  CVBufferSetAttachment(v25, v26, (CFTypeRef)[v27 ycbcrMatrix], kCVAttachmentMode_ShouldPropagate);

  v28 = pixelBufferOut;
  return v28;
}

- (CFXRenderer)initWithDelegate:(id)a3 captureMode:(int64_t)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CFXRenderer;
  v7 = [(CFXRenderer *)&v37 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_captureMode = a4;
    v9 = [[JTFrameRateCalculator alloc] initWithWindowSize:1.0];
    fpsCalc = v8->_fpsCalc;
    v8->_fpsCalc = v9;

    if (+[JFXAnimojiEffectRenderer isSupported])
    {
      +[JFXAnimojiEffectRenderer setupAVTMetalShaderCache];
      double v11 = [[JFXAnimojiEffectRenderer alloc] initWithConstrainedHeadPose:a4 == 3];
      animojiRenderer = v8->_animojiRenderer;
      v8->_animojiRenderer = v11;

      [(JFXAnimojiEffectRenderer *)v8->_animojiRenderer setAsynchronouslyLoadNewPuppets:1];
      [(JFXAnimojiEffectRenderer *)v8->_animojiRenderer setAllowAntialiasing:1];
    }
    uint64_t v13 = [MEMORY[0x263F1C550] clearColor];
    animojiBackgroundColor = v8->_animojiBackgroundColor;
    v8->_animojiBackgroundColor = (UIColor *)v13;

    float64x2_t v15 = [(CFXRenderer *)v8 CFX_getPreviewColorSpace];
    uint64_t v38 = *MEMORY[0x263F61710];
    v39[0] = v15;
    int16x8_t v16 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v17 = [objc_alloc(MEMORY[0x263F612B0]) initWithOptions:v16 delegate:v8];
    livePlayer = v8->_livePlayer;
    v8->_livePlayer = (PVLivePlayer *)v17;

    v19 = (objc_class *)objc_opt_class();
    CFStringRef v20 = NSStringFromClass(v19);
    [(PVLivePlayer *)v8->_livePlayer setName:v20];

    if (isStreamingMode(a4))
    {
      id v21 = objc_alloc_init(MEMORY[0x263F612D8]);
      v22 = CreatePVLPThrottlingControlParameters();
      [v21 setThermalLevel:0 controlParameters:v22];

      CFStringRef v23 = CreatePVLPThrottlingControlParameters();
      [v21 setThermalLevel:10 controlParameters:v23];

      v24 = CreatePVLPThrottlingControlParameters();
      [v21 setThermalLevel:20 controlParameters:v24];

      v25 = CreatePVLPThrottlingControlParameters();
      [v21 setThermalLevel:30 controlParameters:v25];

      [(PVLivePlayer *)v8->_livePlayer setThermalThrottlingPolicy:v21];
    }
    CFStringRef v26 = +[JFXVideoCameraController sharedInstance];
    v8->_cameraMode = [v26 cameraMode];

    uint64_t v27 = objc_opt_new();
    metadataValidator = v8->_metadataValidator;
    v8->_metadataValidator = (JFXMetadataValidator *)v27;

    v29 = (PVLivePlayerCameraSource *)objc_alloc_init(MEMORY[0x263F612C8]);
    cameraSource = v8->_cameraSource;
    v8->_cameraSource = v29;

    float64_t v31 = v8->_livePlayer;
    float64_t v32 = [(CFXRenderer *)v8 cameraSource];
    [(PVLivePlayer *)v31 setSource:v32 inputID:0];

    id v33 = objc_alloc(MEMORY[0x263F612C0]);
    v34 = [(CFXRenderer *)v8 cameraSource];
    v35 = (void *)[v33 initWithPlayerCameraSource:v34];

    [(PVLivePlayer *)v8->_livePlayer setRenderLink:v35];
    [(PVLivePlayer *)v8->_livePlayer start];
  }
  return v8;
}

- (void)setAnimojiBackgroundColor:(id)a3
{
}

- (void)dealloc
{
  [(CFXRenderer *)self shutdown];
  pixelRotationSession = self->_pixelRotationSession;
  self->_pixelRotationSession = 0;

  v4.receiver = self;
  v4.super_class = (Class)CFXRenderer;
  [(CFXRenderer *)&v4 dealloc];
}

- (void)setTrackingLossDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXRenderer *)self animojiRenderer];
  [v5 setTrackingLossDelegate:v4];
}

- (void)resetMetadataValidation
{
  id v2 = [(CFXRenderer *)self metadataValidator];
  [v2 reset];
}

- (void)pause
{
  id v2 = [(CFXRenderer *)self livePlayer];
  [v2 stop];
}

- (void)resume
{
  id v2 = [(CFXRenderer *)self livePlayer];
  [v2 start];
}

- (void)shutdown
{
  id v2 = [(CFXRenderer *)self livePlayer];
  [v2 shutdown];
}

- (void)flush
{
  id v2 = [(CFXRenderer *)self livePlayer];
  [v2 flush];
}

- (BOOL)livePlayerIsSaturated
{
  id v2 = [(CFXRenderer *)self livePlayer];
  BOOL v3 = [v2 status] == 2;

  return v3;
}

- (void)renderFrame:(id)a3 effectComposition:(id)a4
{
  v68[6] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CFXRenderer *)self CFX_PVFrameSetFromCFXFrame:v6];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = *MEMORY[0x263F61650];
    double v11 = [v8 metadataObjectForKey:*MEMORY[0x263F61650]];
    if ([v11 cameraPosition])
    {
      v66 = v9;
      uint64_t v12 = &v66;
      +[JFXPixelRotationSession rotateFrameSetToUIOrientation:&v66 pixelRotationSession:&self->_pixelRotationSession];
    }
    else
    {
      unsigned int v13 = +[JFXOrientationMonitor deviceInterfaceOrientation];
      if (v13 > 4) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = dword_234D61868[v13];
      }
      v65 = v9;
      uint64_t v12 = &v65;
      +[JFXPixelRotationSession rotateFrameSet:&v65 by:v14 mirror:1 pixelRotationSession:&self->_pixelRotationSession];
    }
    id v15 = *v12;

    [v15 setMetadataObject:v7 forKey:@"kEffectCompositionMetadataKey"];
    int16x8_t v16 = [v7 jtEffectsForType:7];
    uint64_t v17 = +[JFXPickerCameraSource sharedInstance];
    if ([v17 isPickerPreviewing])
    {
      uint64_t v18 = [v16 count];

      if (v18)
      {
LABEL_12:
        BOOL v20 = JFXIsCTMCroppedCameraMode([(CFXRenderer *)self cameraMode]);
        if ([v7 isEmpty] && !v20)
        {
          id v21 = [v15 colorImageBuffer];
          uint64_t v22 = [v21 cvPixelBuffer];
          long long v63 = 0uLL;
          uint64_t v64 = 0;
          if (v6) {
            [v6 timestamp];
          }
          CFStringRef v23 = [CFXFrame alloc];
          *(_OWORD *)buf = v63;
          uint64_t v62 = v64;
          v24 = [(CFXFrame *)v23 initWithPixelBuffer:v22 timestamp:buf];
          v25 = [(CFXRenderer *)self delegate];
          *(_OWORD *)buf = v63;
          uint64_t v62 = v64;
          [v25 renderer:self didPrepareToRenderFrameAtPresentationTime:buf];

          CFStringRef v26 = [(CFXRenderer *)self delegate];
          [v26 renderer:self didRenderFrame:v24];

          goto LABEL_36;
        }
        if ([(CFXRenderer *)self captureMode] != 3)
        {
          v52 = [(CFXRenderer *)self fpsCalc];
          [v52 log:&__block_literal_global_42];

          v53 = [(CFXRenderer *)self fpsCalc];
          [v53 tickFrameReceived];

          v54 = [(CFXRenderer *)self cameraSource];
          [v54 cameraFrameSetRecieved:v15];

LABEL_36:
          goto LABEL_37;
        }
        long long v63 = 0uLL;
        uint64_t v64 = 0;
        if (v6) {
          [v6 timestamp];
        }
        if ([v16 count])
        {
          uint64_t v27 = [v16 firstObject];

          if (v27)
          {
            v28 = [v15 metadataObjectForKey:v10];
            uint64_t v58 = [v28 interfaceOrientation];
            uint64_t v29 = [v28 captureVideoOrientation];
            float64_t v30 = [v15 metadataDict];
            float64_t v31 = [v30 objectForKey:@"PVFrameSetMetadataOriginalBufferSizeKey"];
            [v31 CGSizeValue];
            uint64_t v33 = v32;
            uint64_t v35 = v34;

            v36 = [v15 metadataDict];
            uint64_t v37 = [v36 objectForKey:@"PVFrameSetMetadataARMetadataKey"];

            if (v37)
            {
              int v38 = ((unint64_t)(v58 - 3) < 2) ^ ((unint64_t)(v29 - 5) < 0xFFFFFFFFFFFFFFFELL);
              if (v38) {
                uint64_t v39 = v35;
              }
              else {
                uint64_t v39 = v33;
              }
              if (v38) {
                uint64_t v40 = v33;
              }
              else {
                uint64_t v40 = v35;
              }
              v68[0] = v37;
              v67[0] = @"JFXAnimojiRendererMetadata_JFXARMetadata";
              v67[1] = @"JFXAnimojiRendererMetadata_RenderSize";
              v60[0] = v40;
              v60[1] = v39;
              v56 = [MEMORY[0x263F08D40] valueWithBytes:v60 objCType:"{CGSize=dd}"];
              v68[1] = v56;
              v67[2] = @"JFXAnimojiRendererMetadata_AVCaptureVideoOrientation";
              v57 = v28;
              v55 = [NSNumber numberWithInteger:v29];
              v68[2] = v55;
              v67[3] = @"JFXAnimojiRendererMetadata_UIInterfaceOrientation";
              v41 = [NSNumber numberWithInteger:v58];
              v68[3] = v41;
              v67[4] = @"JFXAnimojiRendererMetadata_Effect";
              v42 = [v16 firstObject];
              v68[4] = v42;
              v67[5] = @"JFXAnimojiRendererMetadata_BackgroundColor";
              [(CFXRenderer *)self animojiBackgroundColor];
              v43 = v59 = (void *)v37;
              v68[5] = v43;
              v44 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:6];

              v45 = [(CFXRenderer *)self animojiRenderer];
              *(_OWORD *)buf = v63;
              uint64_t v62 = v64;
              v46 = [v45 renderWithTime:buf metadata:v44];

              if (v46)
              {
                v47 = [(CFXRenderer *)self delegate];
                *(_OWORD *)buf = v63;
                uint64_t v62 = v64;
                [v47 renderer:self didPrepareToRenderFrameAtPresentationTime:buf];

                v48 = [CFXFrame alloc];
                uint64_t v49 = [v46 cvPixelBuffer];
                *(_OWORD *)buf = v63;
                uint64_t v62 = v64;
                v50 = [(CFXFrame *)v48 initWithPixelBuffer:v49 timestamp:buf];
                v51 = [(CFXRenderer *)self delegate];
                [v51 renderer:self didRenderFrame:v50];

LABEL_35:
                goto LABEL_36;
              }
            }
            else
            {
            }
          }
        }
        v46 = JFXLog_animoji();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_234C41000, v46, OS_LOG_TYPE_DEFAULT, "Couldn't get a buffer at all, not even a solid background buffer", buf, 2u);
        }
        goto LABEL_35;
      }
      uint64_t v17 = +[JFXPickerCameraSource sharedInstance];
      v19 = [v17 pickerSource];
      [v19 cameraFrameSetRecieved:v15];
    }
    goto LABEL_12;
  }
LABEL_37:
}

- (void)willDropCameraFrame
{
  id v2 = [(CFXRenderer *)self cameraSource];
  [v2 cameraFrameSetDropped];
}

- (id)buildRenderRequest:(id)a3 time:(id *)a4
{
  id v6 = [a3 objectForKeyedSubscript:&unk_26E801C80];
  id v7 = v6;
  if (v6)
  {
    [v6 presentationTimeStamp];
    *(_OWORD *)time = v51;
    *(void *)&time[16] = v52;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
    v8 = [(CFXRenderer *)self fpsCalc];
    [v8 tickReceived];

    v9 = +[CFXMediaSettings sharedInstance];
    [v9 renderSize];
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = +[CFXMediaSettings sharedInstance];
    [v14 frameSize];
    double v16 = v15;
    double v18 = v17;

    v19 = [v7 metadataObjectForKey:@"kEffectCompositionMetadataKey"];
    BOOL v20 = [JFXCapturePreviewProperties alloc];
    int64_t v21 = [(CFXRenderer *)self cameraMode];
    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(void *)&time[16] = a4->var3;
    uint64_t v22 = -[JFXCapturePreviewProperties initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:](v20, "initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:", v7, v21, time, v11, v13, v16, v18);
    CFStringRef v23 = [JFXCapturePreviewRequestBuilder alloc];
    v24 = [(PVLivePlayer *)self->_livePlayer outputColorSpace];
    v42 = (void *)v22;
    v25 = [(JFXCapturePreviewRequestBuilder *)v23 initWithPreviewProperties:v22 outputColorSpace:v24];

    *(_OWORD *)time = *(_OWORD *)&a4->var0;
    *(void *)&time[16] = a4->var3;
    CFStringRef v26 = [(CFXRenderer *)self CFX_JTEffectsFromCFXEffectComposition:v19 forRenderTime:time];
    uint64_t v27 = [(CFXRenderer *)self animojiRenderer];
    v28 = [(CFXRenderer *)self metadataValidator];
    uint64_t v29 = +[JFXPickerCameraSource sharedInstance];
    uint64_t v30 = [v29 isPickerPreviewing];
    long long v31 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)time = *MEMORY[0x263F000D0];
    *(_OWORD *)&time[16] = v31;
    long long v50 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    uint64_t v32 = [(JFXCapturePreviewRequestBuilder *)v25 createPVRenderRequestUsingAnimojiRenderer:v27 metadataValidator:v28 additionalTransform:time effectStack:v26 animojiTapPoint:v30 animojiUsesInterfaceOrientation:1 requestHandler:0];

    uint64_t v33 = [(CFXRenderer *)self animojiRenderer];

    if (v33)
    {
      uint64_t v34 = +[CFXEffectType effectTypeWithIdentifier:@"Animoji"];
      if ([v19 hasEffectOfType:v34])
      {
        uint64_t v35 = [v7 metadataDict];
        v36 = [v35 objectForKey:@"PVFrameSetMetadataARMetadataKey"];

        uint64_t v37 = [(CFXRenderer *)self animojiRenderer];
        int v38 = [v37 trackingLossDelegate];

        uint64_t v39 = [v36 arFrame];
        if (v39)
        {
        }
        else if ([v38 shouldShowAnimojiFaceReticle])
        {
          [v38 setupAnimojiFaceReticleForTrackingLoss];
          [v38 showAnimojiFaceReticleForTrackingLoss];
        }
      }
    }
    [v7 presentationTimeStamp];
    *(_OWORD *)time = v47;
    *(void *)&time[16] = v48;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
    [v7 presentationTimeStamp];
    *(_OWORD *)time = v45;
    *(void *)&time[16] = v46;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
    memset(time, 0, 24);
    [v7 presentationTimeStamp];
    uint64_t v40 = [(CFXRenderer *)self delegate];
    long long v43 = *(_OWORD *)time;
    uint64_t v44 = *(void *)&time[16];
    [v40 renderer:self didPrepareToRenderFrameAtPresentationTime:&v43];
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

- (void)renderRequestComplete:(id)a3 results:(id)a4 completedOutOfOrder:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 userContext];
  double v11 = v10;
  if (v10) {
    [v10 presentationTimeStamp];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }
  CMTime time = v34;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  if (a5 || ![v9 count])
  {
    double v12 = [(CFXRenderer *)self fpsCalc];
    [v12 tickDropped];
    goto LABEL_26;
  }
  if (v11) {
    [v11 presentationTimeStamp];
  }
  else {
    memset(&v33[3], 0, 24);
  }
  CMTime time = *(CMTime *)&v33[3];
  CMTimeGetSeconds(&time);
  kdebug_trace();
  double v12 = [v11 metadataObjectForKey:@"kEffectCompositionMetadataKey"];
  [v11 setMetadataObject:0 forKey:@"kEffectCompositionMetadataKey"];
  double v13 = +[JFXPickerCameraSource sharedInstance];
  if (![v13 isPickerPreviewing]) {
    goto LABEL_18;
  }
  uint64_t v14 = [v12 jtEffectsForType:7];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    if ((unint64_t)[v9 count] >= 2)
    {
      double v16 = [v9 objectAtIndexedSubscript:1];
      uint64_t v17 = [v16 cvPixelBuffer];
      double v18 = [CFXFrame alloc];
      if (v11) {
        [v11 presentationTimeStamp];
      }
      else {
        memset(v33, 0, 24);
      }
      v19 = [(CFXFrame *)v18 initWithPixelBuffer:v17 timestamp:v33];
      uint64_t v20 = [(CFXRenderer *)self CFX_PVFrameSetFromCFXFrame:v19];

      double v11 = (void *)v20;
    }
    double v13 = +[JFXPickerCameraSource sharedInstance];
    int64_t v21 = [v13 pickerSource];
    [v21 cameraFrameSetRecieved:v11];

LABEL_18:
  }
  uint64_t v22 = [v9 objectAtIndexedSubscript:0];
  CFStringRef v23 = (__CVBuffer *)[v22 cvPixelBuffer];
  v24 = [v11 colorImageBuffer];
  CVBufferPropagateAttachments((CVBufferRef)[v24 cvPixelBuffer], v23);

  v25 = [CFXFrame alloc];
  if (v11) {
    [v11 presentationTimeStamp];
  }
  else {
    memset(v32, 0, sizeof(v32));
  }
  CFStringRef v26 = [(CFXFrame *)v25 initWithPixelBuffer:v23 timestamp:v32];
  if (v8)
  {
    [v8 time];
  }
  else
  {
    long long v30 = 0uLL;
    uint64_t v31 = 0;
  }
  long long v28 = v30;
  uint64_t v29 = v31;
  [(CFXFrame *)v26 setRequestTime:&v28];
  uint64_t v27 = [(CFXRenderer *)self delegate];
  [v27 renderer:self didRenderFrame:v26];

LABEL_26:
}

- (void)livePlayerDroppedFrame:(int)a3 sources:(id)a4 time:(id *)a5
{
}

- (id)CFX_PVFrameSetFromCFXFrame:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pvFrameSet];
  if (!v4)
  {
    uint64_t v5 = [v3 pixelBuffer];
    if (v5
      || ([v3 arFrame],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v5 = [v6 capturedImage],
          v6,
          v5))
    {
      id v7 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v5];
      long long v15 = 0uLL;
      uint64_t v16 = 0;
      if (v3) {
        [v3 timestamp];
      }
      memset(&v14, 0, sizeof(v14));
      id v8 = +[CFXMediaSettings sharedInstance];
      CMTimeMake(&v14, 1, [v8 timeScale]);

      long long v12 = v15;
      uint64_t v13 = v16;
      CMTime v11 = v14;
      id v9 = [MEMORY[0x263F61228] sampleBufferWithPVImageBuffer:v7 timestamp:&v12 frameDuration:&v11];
      id v4 = (void *)[objc_alloc(MEMORY[0x263F61258]) initWithColorBuffer:v9 metadata:0];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)CFX_JTEffectsFromCFXEffectComposition:(id)a3 forRenderTime:(id *)a4
{
  uint64_t v5 = [a3 effects];
  id v6 = [MEMORY[0x263EFF980] array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__CFXRenderer_CFX_JTEffectsFromCFXEffectComposition_forRenderTime___block_invoke;
  v9[3] = &unk_264C0CBB8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __67__CFXRenderer_CFX_JTEffectsFromCFXEffectComposition_forRenderTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 jtEffect];
  if ([v3 type] == 2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    id v4 = [v3 renderEffect];
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 effectRange];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }

    *(_OWORD *)&time1.value = v13;
    time1.epoch = v14;
    *(_OWORD *)&time2.value = CFXEffectPreviewStartAtNextRenderTime;
    time2.epoch = 0;
    if (!CMTimeCompare(&time1, &time2))
    {
      *(void *)&long long v14 = *(void *)(a1 + 56);
      long long v13 = *(_OWORD *)(a1 + 40);
      long long v9 = v14;
      long long v10 = v15;
      long long v8 = v13;
      id v6 = [v3 renderEffect];
      v7[0] = v8;
      v7[1] = v9;
      v7[2] = v10;
      [v6 setEffectRange:v7];
    }
  }
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)CFX_getPreviewColorSpace
{
  id v2 = [MEMORY[0x263F1C5C0] currentDevice];
  id v3 = objc_msgSend(v2, "jfx_displayColorSpace");

  id v4 = (void *)MEMORY[0x263F61230];
  uint64_t v5 = +[JFXVideoCameraController sharedInstance];
  id v6 = objc_msgSend(v4, "jfx_getColorSpaceFromCaptureColorSpace:", objc_msgSend(v5, "cameraColorSpace"));

  id v7 = [MEMORY[0x263F1C5C0] currentDevice];
  long long v8 = objc_msgSend(v7, "jfx_recommendedDisplayColorSpaceForColorSpace:", v6);

  long long v9 = objc_msgSend(MEMORY[0x263F61230], "jfx_compareAndChooseLesserColorSpace:right:", v3, v8);

  return v9;
}

- (UIColor)animojiBackgroundColor
{
  return self->_animojiBackgroundColor;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(int64_t)a3
{
  self->_captureMode = a3;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (JFXPixelRotationSession)pixelRotationSession
{
  return self->_pixelRotationSession;
}

- (void)setPixelRotationSession:(id)a3
{
}

- (JFXMetadataValidator)metadataValidator
{
  return self->_metadataValidator;
}

- (void)setMetadataValidator:(id)a3
{
}

- (CFXRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PVLivePlayer)livePlayer
{
  return self->_livePlayer;
}

- (void)setLivePlayer:(id)a3
{
}

- (PVLivePlayerCameraSource)cameraSource
{
  return self->_cameraSource;
}

- (void)setCameraSource:(id)a3
{
}

- (JFXAnimojiEffectRenderer)animojiRenderer
{
  return self->_animojiRenderer;
}

- (void)setAnimojiRenderer:(id)a3
{
}

- (JTFrameRateCalculator)fpsCalc
{
  return self->_fpsCalc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpsCalc, 0);
  objc_storeStrong((id *)&self->_animojiRenderer, 0);
  objc_storeStrong((id *)&self->_cameraSource, 0);
  objc_storeStrong((id *)&self->_livePlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadataValidator, 0);
  objc_storeStrong((id *)&self->_pixelRotationSession, 0);
  objc_storeStrong((id *)&self->_animojiBackgroundColor, 0);
}

@end