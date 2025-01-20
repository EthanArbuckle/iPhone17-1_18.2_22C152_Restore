@interface BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration
+ (id)personSegmentationAndMattingConfiguration;
- (BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration)init;
- (unsigned)defaultOutputIndex;
- (unsigned)personSegmentationAndMattingOuputIndex;
@end

@implementation BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration

- (unsigned)personSegmentationAndMattingOuputIndex
{
  return 1;
}

- (unsigned)defaultOutputIndex
{
  return 0;
}

- (BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration;
  v2 = [(BWStillImageConditionalRouterConfiguration *)&v5 initWithNumberOfOutputs:2];
  v3 = v2;
  if (v2) {
    [(BWStillImageConditionalRouterConfiguration *)v2 setShouldEmitSampleBufferDecisionProvider:&__block_literal_global_43];
  }
  return v3;
}

+ (id)personSegmentationAndMattingConfiguration
{
  v2 = objc_alloc_init(BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration);
  return v2;
}

uint64_t __78__BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, int *a3)
{
  objc_super v5 = (void *)CMGetAttachment(target, @"StillSettings", 0);
  if (v5)
  {
    v6 = v5;
    BOOL v7 = (objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "portraitEffectsMatteDeliveryEnabled") & 1) != 0
      || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count") != 0;
    char HasDetectedFaces = BWSampleBufferHasDetectedFaces(target, 0, 0, 1, [+[FigCaptureCameraParameters sharedInstance] complementMatteSuppressionDecisionWithISPDetectedFaces], 1);
    if ((BWStillImageProcessingFlagsForSampleBuffer(target) & 0x200000) != 0) {
      char v9 = 0;
    }
    else {
      char v9 = HasDetectedFaces;
    }
    if (v7) {
      char v10 = v9;
    }
    else {
      char v10 = 0;
    }
    if (dword_1EB4C53F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v10)
    {
      int v12 = 1;
      if (!a3) {
        return 1;
      }
      goto LABEL_18;
    }
  }
  else
  {
    FigDebugAssert3();
  }
  BWSampleBufferRemoveAttachedMedia(target, 0x1EFA6A200);
  int v12 = 0;
  if (a3) {
LABEL_18:
  }
    *a3 = v12;
  return 1;
}

@end