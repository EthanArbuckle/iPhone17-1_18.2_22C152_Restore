@interface BWLearnedMattingInferenceProvider
+ (void)initialize;
- (BWLearnedMattingInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4;
- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:;
- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5;
- (int)purgeIntermediateResources;
- (int)type;
- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:;
- (void)dealloc;
@end

@implementation BWLearnedMattingInferenceProvider

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  unsigned int v5 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_outputAlphaVideoRequirement videoFormat] width];
  unsigned int v6 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_outputAlphaVideoRequirement videoFormat] height];
  v7.f32[0] = (float)(unsigned __int16)v5;
  v7.f32[1] = (float)(unsigned __int16)v6;
  __asm { FMOV            V1.2S, #0.25 }
  float32x2_t v35 = vmul_f32(v7, _D1);
  float v34 = (float)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_inputAlphaVideoRequirement videoFormat] width];
  unint64_t v13 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_inputAlphaVideoRequirement videoFormat] height];
  v14.f32[0] = v34;
  v14.f32[1] = (float)v13;
  *(float32x2_t *)self->_inputAlphaScale = vdiv_f32(v14, v35);
  outputTileSize = (unsigned int *)self->_outputTileSize;
  *(_DWORD *)self->_outputTileSize = 54526720;
  inputTileSize = self->_inputTileSize;
  *(_DWORD *)self->_inputTileSize = 13631680;
  int32x2_t v17 = (int32x2_t)vand_s8((int8x8_t)__PAIR64__(v6, v5), (int8x8_t)0xFFFF0000FFFFLL);
  v18.i32[0] = *(unsigned __int16 *)self->_outputTileSize;
  v18.i32[1] = *(unsigned __int16 *)&self->_outputTileSize[2];
  int32x2_t v19 = vcvt_s32_f32(vrndp_f32(vdiv_f32(vcvt_f32_s32(vadd_s32(v17, (int32x2_t)0xF0000000FLL)), vcvt_f32_s32(vadd_s32(v18, (int32x2_t)0xF0000000FLL)))));
  p_mainImageDownscalingFactor = &self->_mainImageDownscalingFactor;
  LOWORD(self->_mainImageDownscalingFactor) = v19.i16[0];
  HIWORD(self->_mainImageDownscalingFactor) = v19.i16[2];
  if (v19.i32[0] == 1)
  {
    LOWORD(v21) = 0;
    *(_DWORD *)&self->_inputTileOverlap[4] = 0;
  }
  else
  {
    *(float *)&self->_inputTileOverlap[4] = (float)((float)(*(unsigned __int16 *)inputTileSize * v19.i32[0]) - v35.f32[0])
                                          / (float)(v19.i32[0] - 1);
    int v21 = (*(unsigned __int16 *)outputTileSize * *(unsigned __int16 *)p_mainImageDownscalingFactor - v17.i32[0])
        / (*(unsigned __int16 *)p_mainImageDownscalingFactor - 1);
  }
  *(_WORD *)self->_outputTileOverlap = v21;
  int mainImageDownscalingFactor_high = HIWORD(self->_mainImageDownscalingFactor);
  int v23 = mainImageDownscalingFactor_high - 1;
  if (mainImageDownscalingFactor_high == 1)
  {
    *(_DWORD *)self->_numTiles = 0;
  }
  else
  {
    *(float *)self->_numTiles = (float)((float)(*(unsigned __int16 *)&self->_inputTileSize[2]
                                              * mainImageDownscalingFactor_high)
                                      - v35.f32[1])
                              / (float)v23;
    int v23 = (*(unsigned __int16 *)&self->_outputTileSize[2] * HIWORD(self->_mainImageDownscalingFactor) - v17.i32[1])
        / (HIWORD(self->_mainImageDownscalingFactor) - 1);
  }
  *(_WORD *)&self->_outputTileOverlap[2] = v23;
  v24 = +[FigCaptureCameraParameters sharedInstance];
  id v25 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", objc_msgSend(NSString, "stringWithFormat:", @"learnedmatting-f16-v%d", -[FigCaptureCameraParameters learnedMattingVersion](v24, "learnedMattingVersion")), 1);
  id v26 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1111970369 size:*outputTileSize];
  id v27 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226536 size:*(unsigned int *)inputTileSize];
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v26, @"image", v27, @"alpha", 0);
  id v29 = +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226536 size:*outputTileSize];
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v29, @"alpha_refined", 0);
  uint64_t v31 = [(BWLearnedMattingInferenceProvider *)self type];
  uint64_t v32 = *(unsigned int *)p_mainImageDownscalingFactor;
  v37.receiver = self;
  v37.super_class = (Class)BWLearnedMattingInferenceProvider;
  if ([(BWTiledEspressoInferenceProvider *)&v37 loadNetworkWithURL:v25 configName:@"832x768" inferenceType:v31 maxTileCount:v32 inputFormatsByBindingName:v28 outputFormatsByBindingName:v30 additionalVideoRequirements:0])
  {
    return FigSignalErrorAt();
  }
  v36.receiver = self;
  v36.super_class = (Class)BWLearnedMattingInferenceProvider;
  return [(BWTiledEspressoInferenceProvider *)&v36 prepareForSubmissionWithWorkQueue:a3];
}

- (BWLearnedMattingInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (!a3 || ([a3 mainImageDownscalingFactor], v7 <= 0.0))
  {
    float32x2_t v14 = 0;
    v16 = 0;
    int32x2_t v17 = 0;
    v12 = 0;
LABEL_34:
    int v23 = 0;
LABEL_20:

    int v23 = self;
    self = 0;
    goto LABEL_26;
  }
  [a3 targetAspectRatio];
  int v9 = v8;
  char v10 = [a3 appliesFinalCropRect];
  [a3 mainImageDownscalingFactor];
  *((_DWORD *)&self->_mainImageDownscalingFactor + 1) = v11;
  v12 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA6A200 videoFormat:+[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226536 size:25166336]];
  if (!v12)
  {
    FigSignalErrorAt();
    float32x2_t v14 = 0;
LABEL_30:
    v16 = 0;
LABEL_32:
    int32x2_t v17 = 0;
    goto LABEL_34;
  }
  unint64_t v13 = [BWInferenceLazyVideoRequirement alloc];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke;
  v31[3] = &unk_1E5C28528;
  int v32 = v9;
  v31[4] = a3;
  char v33 = v10;
  float32x2_t v14 = [(BWInferenceLazyVideoRequirement *)v13 initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v31];
  if (!v14)
  {
    FigSignalErrorAt();
    goto LABEL_30;
  }
  v15 = [BWInferenceLazyVideoRequirement alloc];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_2;
  v29[3] = &unk_1E5C243B8;
  int v30 = v9;
  v29[4] = a3;
  v16 = [(BWInferenceLazyVideoRequirement *)v15 initWithAttachedMediaKey:0x1EFA74420 preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v29];
  if (!v16)
  {
    FigSignalErrorAt();
    goto LABEL_32;
  }
  if ([a3 produceLowResPersonMaskClone])
  {
    int32x2_t v17 = [[BWInferenceCloneVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA745C0 sourceVideoRequirement:v12];
    if (!v17) {
      goto LABEL_34;
    }
  }
  else
  {
    int32x2_t v17 = 0;
  }
  v36[0] = v14;
  v36[1] = v12;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  if (v17)
  {
    v35[0] = v16;
    v35[1] = v17;
    int32x2_t v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = (BWInferenceVideoRequirement **)v35;
    uint64_t v21 = 2;
  }
  else
  {
    float v34 = v16;
    int32x2_t v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = &v34;
    uint64_t v21 = 1;
  }
  v28.receiver = self;
  v28.super_class = (Class)BWLearnedMattingInferenceProvider;
  self = -[BWTiledEspressoInferenceProvider initWithConfiguration:inputVideoRequirements:outputVideoRequirements:resourceProvider:](&v28, sel_initWithConfiguration_inputVideoRequirements_outputVideoRequirements_resourceProvider_, a3, v18, [v19 arrayWithObjects:v20 count:v21], a4);
  if (!self)
  {
    FigSignalErrorAt();
    goto LABEL_34;
  }
  if ([a3 metalCommandQueue])
  {
    id v22 = objc_alloc(MEMORY[0x1E4F55F60]);
    int v23 = (BWLearnedMattingInferenceProvider *)objc_msgSend(v22, "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), objc_msgSend(a3, "metalCommandQueue"));
  }
  else
  {
    int v23 = 0;
  }
  v24 = [[FigLearnedMattingMetalStage alloc] initWithMetalContext:v23];
  self->_metalProcessor = v24;
  if (!v24)
  {
    FigSignalErrorAt();
    goto LABEL_20;
  }
  if ([a3 produceLowResPersonMaskClone]
    && VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_lowResSegmentationCloneCopySession))
  {
    goto LABEL_20;
  }
  self->_inputAlphaVideoRequirement = v12;
  self->_inputImageVideoRequirement = v14;
  self->_outputAlphaVideoRequirement = v16;
  self->_outputLowResSegmentationCloneVideoRequirement = &v17->super;
  id v25 = [(BWVideoFormat *)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_outputAlphaVideoRequirement videoFormat] underlyingVideoFormat] formatDescription];
  if (v25) {
    id v25 = (opaqueCMFormatDescription *)CFRetain(v25);
  }
  self->_outputFormatDescription = v25;
  id v26 = [(BWVideoFormat *)[(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_outputLowResSegmentationCloneVideoRequirement videoFormat] underlyingVideoFormat] formatDescription];
  if (v26) {
    id v26 = (opaqueCMFormatDescription *)CFRetain(v26);
  }
  self->_outputLowResSegmentationCloneFormatDescription = v26;
  self->_appliesFinalCropRect = v10;
LABEL_26:

  return self;
}

id __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v5 = a2;
  int v3 = [a2 width];
  unsigned int v4 = [v5 height];
  LODWORD(v5) = v4;
  float v6 = *(float *)(a1 + 40);
  if (v6 != 0.0)
  {
    unint64_t v7 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v3 | ((unint64_t)v4 << 32), v6);
    int v3 = v7;
    unsigned int v5 = (void *)HIDWORD(v7);
  }
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  int v9 = (int)(float)((float)v3 / v8);
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  LOWORD(v13) = v9;
  uint64_t v11 = *(unsigned __int8 *)(a1 + 44);
  HIWORD(v13) = (int)(float)((float)(int)v5 / v10);
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1111970369 size:v13 appliesFinalCropRect:v11];
}

id __76__BWLearnedMattingInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v5 = a2;
  int v3 = [a2 width];
  unsigned int v4 = [v5 height];
  LODWORD(v5) = v4;
  float v6 = *(float *)(a1 + 40);
  if (v6 != 0.0)
  {
    unint64_t v7 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v3 | ((unint64_t)v4 << 32), v6);
    int v3 = v7;
    unsigned int v5 = (void *)HIDWORD(v7);
  }
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  int v9 = (int)(float)((float)v3 / v8);
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  LOWORD(v12) = v9;
  HIWORD(v12) = (int)(float)((float)(int)v5 / v10);
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:1278226488 size:v12];
}

- (int)type
{
  return 107;
}

+ (void)initialize
{
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  outputLowResSegmentationCloneFormatDescription = self->_outputLowResSegmentationCloneFormatDescription;
  if (outputLowResSegmentationCloneFormatDescription) {
    CFRelease(outputLowResSegmentationCloneFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWLearnedMattingInferenceProvider;
  [(BWTiledEspressoInferenceProvider *)&v5 dealloc];
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  int v7 = [a4 isEqualToString:0x1EFA74420];
  if (v7 | [a4 isEqualToString:0x1EFA745C0]) {
    int result = 0;
  }
  else {
    int result = -31710;
  }
  if (v7)
  {
    metalProcessor = self->_metalProcessor;
    return [(FigLearnedMattingMetalStage *)metalProcessor clearBuffer:a3];
  }
  return result;
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
  float v6 = v5;
  unsigned __int32 v7 = a5;
  if ([a3 count] != 2) {
    goto LABEL_9;
  }
  uint64_t v11 = [a3 objectForKeyedSubscript:@"alpha"];
  if (!v11) {
    goto LABEL_9;
  }
  v12.f32[0] = (float)(unsigned __int16)*(_DWORD *)self->_inputTileSize;
  v12.f32[1] = (float)HIWORD(*(_DWORD *)self->_inputTileSize);
  v13.f32[0] = (float)(unsigned __int16)v7;
  v13.f32[1] = (float)HIWORD(v7);
  if (-[FigLearnedMattingMetalStage createTileFrom:to:withStart:withScale:outCommandBuffer:](self->_metalProcessor, "createTileFrom:to:withStart:withScale:outCommandBuffer:", [a4 objectForKeyedSubscript:0x1EFA6A200], v11, v6, COERCE_DOUBLE(vmul_f32(v13, vmul_f32(*(float32x2_t *)self->_inputAlphaScale, vsub_f32(v12, *(float32x2_t *)&self->_inputTileOverlap[4])))), *(double *)self->_inputAlphaScale)|| v6 == 0)
  {
    goto LABEL_9;
  }
  uint64_t v15 = [a3 objectForKeyedSubscript:@"image"];
  if (!v15) {
    goto LABEL_9;
  }
  v16.i32[0] = v7;
  v17.i16[0] = *(_WORD *)self->_outputTileSize;
  v17.i16[2] = *(_WORD *)&self->_outputTileSize[2];
  v18.i16[0] = *(_WORD *)self->_outputTileOverlap;
  v18.i16[2] = *(_WORD *)&self->_outputTileOverlap[2];
  int32x2_t v19 = vmul_s32(vsub_s32(v17, v18), (int32x2_t)*(_OWORD *)&vmovl_u16(v16));
  HIWORD(v21) = v19.i16[2];
  LOWORD(v21) = v19.i16[0];
  int result = -[FigLearnedMattingMetalStage createTileFrom:to:withStart:commandBuffer:](self->_metalProcessor, "createTileFrom:to:withStart:commandBuffer:", [a4 objectForKeyedSubscript:@"PrimaryFormat"], v15, v21, *v6);
  if (result)
  {
LABEL_9:
    return FigSignalErrorAt();
  }
  return result;
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
  int v13 = objc_msgSend(a3, "isEqualToString:", 0x1EFA74420, a4, a5, a6, a7, a8);
  if (v13 | [a3 isEqualToString:0x1EFA745C0]) {
    int result = 0;
  }
  else {
    int result = -31710;
  }
  if (v13)
  {
    v14.i32[0] = (int)a9;
    int32x2_t v18 = (int32x2_t)vmovl_u16(v14).u64[0];
    int32x2_t v19 = (int32x2_t)vand_s8((int8x8_t)v18, (int8x8_t)0xFFFF0000FFFFLL);
    v15.i16[0] = *(_WORD *)self->_outputTileSize;
    v15.i16[2] = *(_WORD *)&self->_outputTileSize[2];
    v16.i16[0] = *(_WORD *)self->_outputTileOverlap;
    v16.i16[2] = *(_WORD *)&self->_outputTileOverlap[2];
    int32x2_t v20 = vsub_s32(v15, v16);
    int32x2_t v21 = vmul_s32(v20, v18);
    HIWORD(v34) = v21.i16[2];
    int32x2_t v22 = vadd_s32(v21, v15);
    LOWORD(v34) = v21.i16[0];
    v23.i64[0] = -1;
    v23.i64[1] = -1;
    int32x2_t v24 = vtst_s32(v18, (int32x2_t)0xFFFF0000FFFFLL);
    HIWORD(v36) = v24.i16[2];
    LOWORD(v36) = v24.i16[0];
    unsigned int v25 = v24.u16[0];
    v24.i32[0] = 0;
    v24.i32[1] = v36;
    v26.i32[0] = vceq_s32(v24, (int32x2_t)(v25 | 0x1000000000000)).u32[0];
    v26.i32[1] = vcgt_u32((uint32x2_t)(v25 | 0x1000000000000), *(uint32x2_t *)&v24).i32[1];
    int8x8_t v27 = vbic_s8((int8x8_t)vmla_s32(v15, v20, (int32x2_t)*(_OWORD *)&vaddw_u16(v23, v14)), v26);
    HIWORD(v33) = v27.i16[2];
    LOWORD(v33) = v27.i16[0];
    int32x2_t v28 = vmul_s32(v20, (int32x2_t)*(_OWORD *)&vaddw_u16((uint32x4_t)0x100000001uLL, v14));
    __int16 v29 = v28.i16[0];
    __int16 v30 = v28.i16[2];
    v28.i16[0] = LOWORD(self->_mainImageDownscalingFactor);
    v28.i16[2] = HIWORD(self->_mainImageDownscalingFactor);
    int32x2_t v31 = vceq_s32((int32x2_t)vand_s8((int8x8_t)vadd_s32(v28, (int32x2_t)-1), (int8x8_t)0xFFFF0000FFFFLL), v19);
    HIWORD(v35) = v31.i16[2];
    LOWORD(v35) = v31.i16[0];
    if (v35 >= 0x10000) {
      __int16 v30 = v22.i16[2];
    }
    if (v31.i16[0]) {
      __int16 v29 = v22.i16[0];
    }
    LOWORD(v32) = v29;
    HIWORD(v32) = v30;
    int result = -[FigLearnedMattingMetalStage pasteTileFrom:to:withStart:withNoOverlapStart:withNoOverlapEnd:outCommandBuffer:](self->_metalProcessor, "pasteTileFrom:to:withStart:withNoOverlapStart:withNoOverlapEnd:outCommandBuffer:", [a5 objectForKeyedSubscript:@"alpha_refined"], a4, v34, v33, v32, v38);
    if (result)
    {
      return FigSignalErrorAt();
    }
  }
  return result;
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  CMAttachmentBearerRef target = 0;
  uint64_t v9 = objc_msgSend(a4, "pixelBufferForRequirement:");
  if (v9)
  {
    float v10 = (__CVBuffer *)v9;
    int v11 = objc_msgSend((id)objc_msgSend(a3, "attachedMediaKey"), "isEqualToString:", 0x1EFA74420);
    int v12 = objc_msgSend((id)objc_msgSend(a3, "attachedMediaKey"), "isEqualToString:", 0x1EFA745C0);
    if ((v11 & 1) != 0 || v12)
    {
      if (v11)
      {
        CVBufferSetAttachment(v10, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
        BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v10, 0, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target);
        if (target)
        {
          id v13 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target);
          uint64_t v45 = *MEMORY[0x1E4F55AB0];
          v46[0] = [NSNumber numberWithUnsignedInt:65537];
          uint16x4_t v14 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
          CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55B80], v14, 1u);
          if (self->_appliesFinalCropRect)
          {
            unint64_t v15 = BWPixelBufferDimensionsFromSampleBuffer(a5);
            CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
            double v16 = *MEMORY[0x1E4F1DB20];
            double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
            long long v42 = *MEMORY[0x1E4F1DB20];
            long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
            CGFloat v20 = v17;
            CGFloat v21 = v18;
            CGFloat v22 = v19;
            CGFloat v23 = *MEMORY[0x1E4F1DB20];
            if (FigCFDictionaryGetCGRectIfPresent())
            {
              FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v42, *((double *)&v42 + 1), *(double *)&v43, *((double *)&v43 + 1));
              CGFloat v23 = v24;
              CGFloat v20 = v25;
              CGFloat v21 = v26;
              CGFloat v22 = v27;
            }
            unint64_t v28 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)target);
            FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v13, v15, v28, v23, v20, v21, v22, v16, v17, v18, v19);
          }
          if (*(&self->_mainImageDownscalingFactor + 1) != 0.0)
          {
            objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53388]), "floatValue");
            *(float *)&double v30 = v29 * *(&self->_mainImageDownscalingFactor + 1);
            uint64_t v31 = [NSNumber numberWithFloat:v30];
            [v13 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F533D0]];
          }
          BWSampleBufferSetAttachedMedia(a5, 0x1EFA74420, (uint64_t)target);
          BWSampleBufferRemoveAttachedMedia(a5, 0x1EFA6A200);
          goto LABEL_21;
        }
LABEL_29:
        int v40 = FigSignalErrorAt();
        goto LABEL_22;
      }
      if (!v12
        || (uint64_t v32 = [a4 pixelBufferForRequirement:self->_inputAlphaVideoRequirement]) == 0
        || (unsigned int v33 = (__CVBuffer *)v32,
            (lowResSegmentationCloneCopySession = self->_lowResSegmentationCloneCopySession) == 0))
      {
LABEL_21:
        int v40 = 0;
LABEL_22:
        if (target) {
          CFRelease(target);
        }
        return v40;
      }
      if (!VTPixelTransferSessionTransferImage(lowResSegmentationCloneCopySession, v33, v10))
      {
        BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v10, 0, (CFTypeRef *)&self->_outputLowResSegmentationCloneFormatDescription, (CMSampleBufferRef *)&target);
        if (target)
        {
          id v35 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target);
          if (*(&self->_mainImageDownscalingFactor + 1) != 0.0)
          {
            __int32 v36 = v35;
            objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53388]), "floatValue");
            *(float *)&double v38 = v37 * *(&self->_mainImageDownscalingFactor + 1);
            uint64_t v39 = [NSNumber numberWithFloat:v38];
            [v36 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F533D0]];
          }
          BWSampleBufferSetAttachedMedia(a5, 0x1EFA745C0, (uint64_t)target);
          goto LABEL_21;
        }
        goto LABEL_29;
      }
    }
    int v40 = -31710;
    goto LABEL_22;
  }
  return FigSignalErrorAt();
}

- (int)purgeIntermediateResources
{
  return 0;
}

@end