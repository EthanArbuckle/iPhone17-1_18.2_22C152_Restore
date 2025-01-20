@interface BWPreviewRegistration
+ (void)initialize;
- (BWPreviewRegistration)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4 registrationType:(int)a5 metalCommandQueue:(id)a6 excludeStaticComponentFromAlignmentShifts:(BOOL)a7;
- (CGPoint)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 widerToNarrowerCameraScale:(double)a6;
- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5;
- (int)previewRegistrationType;
- (void)allocateResourcesAsynchronouslyWithVideoFormat:(id)a3;
- (void)cleanupResources;
- (void)dealloc;
- (void)registerWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5 isMacroScene:(BOOL)a6 macroTransitionType:(int)a7 completionHandler:(id)a8;
- (void)waitForRegistrationToComplete;
@end

@implementation BWPreviewRegistration

- (CGPoint)computeCameraShiftForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5
{
  v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  [(BWPreviewRegistrationProvider *)self->_registrationProvider computeCameraShiftForWiderCamera:a3 narrowerCamera:a4 widerToNarrowerCameraScale:a5];
  double v11 = v10;
  double v13 = v12;
  if (*v9 == 1) {
    kdebug_trace();
  }
  double v14 = v11;
  double v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BWPreviewRegistration)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4 registrationType:(int)a5 metalCommandQueue:(id)a6 excludeStaticComponentFromAlignmentShifts:(BOOL)a7
{
  v17.receiver = self;
  v17.super_class = (Class)BWPreviewRegistration;
  double v12 = [(BWPreviewRegistration *)&v17 init];
  if (v12)
  {
    double v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.bwgraph.preview.registration", v13);
    v12->_registrationQueue = (OS_dispatch_queue *)v14;
    if (!v14
      || (a5 != 1
        ? (BWVisionPreviewRegistrationProvider *)(registrationProvider = [[BWVisionPreviewRegistrationProvider alloc] initWithCameraInfoByPortType:a3 sensorBinningFactor:a4], v12->_registrationProvider = (BWPreviewRegistrationProvider *)registrationProvider, v12->_previewRegistrationType = 0): (v12->_excludeStaticComponentFromAlignmentShifts = a7, v12->_registrationProvider = (BWPreviewRegistrationProvider *)[[BWAdaptiveCorrectionPreviewRegistrationProvider alloc] initWithCameraInfoByPortType:a3 excludeStaticComponentFromAlignmentShifts:v12->_excludeStaticComponentFromAlignmentShifts], v12->_previewRegistrationType = 1, v12->_metalCommandQueue = (MTLCommandQueue *)a6, registrationProvider = (BWVisionPreviewRegistrationProvider *)v12->_registrationProvider), !registrationProvider))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v12;
}

- (CGPoint)computeApproximateCorrectionForWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCameraPortType:(id)a4 narrowerPixelBufferDimensions:(id)a5 widerToNarrowerCameraScale:(double)a6
{
  if (objc_opt_respondsToSelector())
  {
    [(BWPreviewRegistrationProvider *)self->_registrationProvider computeApproximateCorrectionForWiderCamera:a3 narrowerCameraPortType:*MEMORY[0x1E4F52DF0] narrowerPixelBufferDimensions:a5 widerToNarrowerCameraScale:a6];
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v11;
  result.x = v10;
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPreviewRegistration;
  [(BWPreviewRegistration *)&v3 dealloc];
}

- (void)allocateResourcesAsynchronouslyWithVideoFormat:(id)a3
{
  registrationQueue = self->_registrationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__BWPreviewRegistration_allocateResourcesAsynchronouslyWithVideoFormat___block_invoke;
  v4[3] = &unk_1E5C24458;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(registrationQueue, v4);
}

void __72__BWPreviewRegistration_allocateResourcesAsynchronouslyWithVideoFormat___block_invoke(uint64_t a1)
{
  objc_super v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F60]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), *(void *)(*(void *)(a1 + 32) + 32));
    if (!v4)
    {
      fig_log_get_emitter();
      uint64_t v6 = v1;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allocateResourcesWithVideoFormat:metalContext:", *(void *)(a1 + 40), v4, v5, v6);

  if (*v3 == 1)
  {
    kdebug_trace();
  }
}

- (void)cleanupResources
{
  registrationQueue = self->_registrationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__BWPreviewRegistration_cleanupResources__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(registrationQueue, block);
}

uint64_t __41__BWPreviewRegistration_cleanupResources__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) cleanupResources];
}

- (void)registerWiderCamera:(opaqueCMSampleBuffer *)a3 narrowerCamera:(opaqueCMSampleBuffer *)a4 widerToNarrowerCameraScale:(double)a5 isMacroScene:(BOOL)a6 macroTransitionType:(int)a7 completionHandler:(id)a8
{
  CMSampleBufferRef sampleBufferOut = 0;
  CMSampleBufferRef v18 = 0;
  BWCMSampleBufferCreateCopyIncludingMetadata(a3, &sampleBufferOut);
  BWCMSampleBufferCreateCopyIncludingMetadata(a4, &v18);
  registrationQueue = self->_registrationQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __138__BWPreviewRegistration_registerWiderCamera_narrowerCamera_widerToNarrowerCameraScale_isMacroScene_macroTransitionType_completionHandler___block_invoke;
  v15[3] = &unk_1E5C25028;
  v15[6] = sampleBufferOut;
  v15[7] = v18;
  *(double *)&v15[8] = a5;
  BOOL v17 = a6;
  int v16 = a7;
  v15[4] = self;
  v15[5] = a8;
  dispatch_async(registrationQueue, v15);
}

void __138__BWPreviewRegistration_registerWiderCamera_narrowerCamera_widerToNarrowerCameraScale_isMacroScene_macroTransitionType_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6272C70]();
  objc_super v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  if (v5)
  {
    [v5 registerWiderCamera:*(void *)(a1 + 48) narrowerCamera:*(void *)(a1 + 56) widerToNarrowerCameraScale:*(unsigned __int8 *)(a1 + 76) isMacroScene:*(unsigned int *)(a1 + 72) macroTransitionType:*(double *)(a1 + 64)];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(v4 + 40))
  {
    int v6 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), "isEqualToString:", *MEMORY[0x1E4F52DE8]);
    if (v6) {
      double v7 = 0.05;
    }
    else {
      double v7 = 0.042;
    }
    if (v6) {
      double v8 = 0.05;
    }
    else {
      double v8 = 0.01;
    }
    int v9 = *(_DWORD *)(a1 + 72);
    if (*(unsigned char *)(a1 + 76))
    {
      if (!v9)
      {
        double v10 = 1.5;
LABEL_18:
        double v7 = v7 * v10;
        double v8 = v8 * v10;
LABEL_19:
        ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 48));
        size_t Width = CVPixelBufferGetWidth(ImageBuffer);
        uint64_t v13 = 0;
        double v14 = round(v7 * (double)Width);
        double v15 = round(v8 * (double)Width);
        do
        {
          if (*((unsigned char *)&v22 + v13)
            && (fabs(*(double *)((char *)&v22 + v13 + 8)) > v14 || fabs(*(double *)((char *)&v22 + v13 + 16)) > v15))
          {
            *((unsigned char *)&v22 + v13) = 0;
          }
          v13 += 24;
        }
        while (v13 != 72);
        goto LABEL_25;
      }
    }
    else if (!v9)
    {
      goto LABEL_19;
    }
    double v10 = 1.5;
    if (*(_DWORD *)(*(void *)(a1 + 32) + 24) == 1) {
      double v10 = 2.5;
    }
    goto LABEL_18;
  }
LABEL_25:
  int v16 = *(const void **)(a1 + 48);
  if (v16) {
    CFRelease(v16);
  }
  BOOL v17 = *(const void **)(a1 + 56);
  if (v17) {
    CFRelease(v17);
  }
  if (*v3 == 1) {
    kdebug_trace();
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18)
  {
    v19 = *(void (**)(uint64_t, _OWORD *))(v18 + 16);
    v20[2] = v24;
    v20[3] = v25;
    uint64_t v21 = v26;
    v20[0] = v22;
    v20[1] = v23;
    v19(v18, v20);
  }
}

- (void)waitForRegistrationToComplete
{
}

- (int)previewRegistrationType
{
  return self->_previewRegistrationType;
}

@end