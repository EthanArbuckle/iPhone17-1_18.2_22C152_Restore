@interface BWVideoProcessingInferenceAdapter
- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7;
- (uint64_t)_executionTargetForAnalysisType:(uint64_t)result;
@end

@implementation BWVideoProcessingInferenceAdapter

id __108__BWVideoProcessingInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  unint64_t v4 = [a2 width];
  unint64_t v5 = [a2 height];
  unint64_t v6 = v5;
  if (v4 <= v5) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v4;
  }
  [(BWVideoFormatRequirements *)v3 setWidth:(580 * v4 / v7) & 0xFFFFFFFFFFFFFFFELL];
  [(BWVideoFormatRequirements *)v3 setHeight:(580 * v6 / v7) & 0xFFFFFFFFFFFFFFFELL];
  [(BWVideoFormatRequirements *)v3 setSupportedColorSpaceProperties:&unk_1EFB02C48];
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB02C60];
  v9[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
}

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", *(void *)&a3, *(void *)&a4.var0);
  if (a3 != 2001)
  {
    v13 = 0;
    int v14 = -31710;
    if (!a7) {
      return v13;
    }
    goto LABEL_3;
  }
  v13 = -[BWVideoProcessingInferenceProvider initWithType:analysisType:executionTarget:schedulerPriority:preventionReasons:resourceProvider:]([BWVideoProcessingInferenceProvider alloc], "initWithType:analysisType:executionTarget:schedulerPriority:preventionReasons:resourceProvider:", 2001, 4, -[BWVideoProcessingInferenceAdapter _executionTargetForAnalysisType:]((uint64_t)self, 4), [a5 priority], v12, a6);
  [(BWVideoProcessingInferenceProvider *)v13 bindVideoInputFromAttachedMediaUsingKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" withVideoFormatProvider:&__block_literal_global_11];
  v16[0] = getVCPCaptureAnalysisSubjectMotionScoreKey();
  v16[1] = getVCPCaptureAnalysisMotionDivScoreKey();
  -[BWVideoProcessingInferenceProvider bindOutputMetadataKeys:](v13, "bindOutputMetadataKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2]);
  int v14 = 0;
  if (a7) {
LABEL_3:
  }
    *a7 = v14;
  return v13;
}

- (uint64_t)_executionTargetForAnalysisType:(uint64_t)result
{
  if (result)
  {
    if (a2 == 4) {
      return 4;
    }
    if (a2 <= 127)
    {
      if (((unint64_t)(a2 - 8) > 0x38 || ((1 << (a2 - 8)) & 0x100000001000101) == 0)
        && (unint64_t)a2 >= 3)
      {
        goto LABEL_19;
      }
LABEL_17:
      v2 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v3 = *MEMORY[0x1E4F1C3A8];
      unint64_t v4 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Analysis type %lu is not currently known to the BWInferenceEngine", a2);
      unint64_t v5 = v2;
      uint64_t v6 = v3;
      goto LABEL_18;
    }
    if (a2 <= 511)
    {
      if (a2 == 128 || a2 == 256) {
        goto LABEL_17;
      }
    }
    else if (a2 == 512 || a2 == 2048 || a2 == 1024)
    {
      goto LABEL_17;
    }
LABEL_19:
    unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    unint64_t v4 = @"BWInferenceEngine does not currently support the combination of multiple VCPCaptureAnalysisTypes";
LABEL_18:
    objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v4 userInfo:0]);
  }
  return result;
}

@end