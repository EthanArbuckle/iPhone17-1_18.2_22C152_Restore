@interface BWStillImageConditionalRouterInferenceConfiguration
+ (id)inferenceConfiguration;
- (BWStillImageConditionalRouterInferenceConfiguration)init;
- (unsigned)defaultOutputIndex;
- (unsigned)inferenceOuputIndex;
@end

@implementation BWStillImageConditionalRouterInferenceConfiguration

+ (id)inferenceConfiguration
{
  v2 = objc_alloc_init(BWStillImageConditionalRouterInferenceConfiguration);
  return v2;
}

- (BWStillImageConditionalRouterInferenceConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterInferenceConfiguration;
  v2 = [(BWStillImageConditionalRouterConfiguration *)&v5 initWithNumberOfOutputs:2];
  v3 = v2;
  if (v2) {
    [(BWStillImageConditionalRouterConfiguration *)v2 setShouldEmitSampleBufferDecisionProvider:&__block_literal_global_83];
  }
  return v3;
}

- (unsigned)inferenceOuputIndex
{
  return 1;
}

- (unsigned)defaultOutputIndex
{
  return 0;
}

uint64_t __59__BWStillImageConditionalRouterInferenceConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, int *a3)
{
  objc_super v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  __int16 v6 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntegerValue");
  unsigned int v7 = v6 & 0x400;
  unsigned int v8 = v6 & 0x1000;
  int v9 = objc_msgSend((id)CMGetAttachment(target, @"HasUnreliableBracketingMetadata", 0), "BOOLValue");
  v10 = (void *)CMGetAttachment(target, @"BWStillImageCaptureSettings", 0);
  if ([v10 captureType] == 1 || objc_msgSend(v10, "captureType") == 2)
  {
    if ((v9 | (v7 >> 10) | (v8 >> 12)))
    {
      int v11 = 1;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int v12 = [v10 captureType];
  if (v12 == 7) {
    char v13 = v9 | (v7 >> 10) | (v8 >> 12);
  }
  else {
    char v13 = 1;
  }
  if (v12 == 7) {
    int v11 = 1;
  }
  else {
    int v11 = v9 | (v7 >> 10) | (v8 >> 12);
  }
  if ((v13 & 1) == 0) {
LABEL_12:
  }
    int v11 = [v5 objectForKeyedSubscript:@"UB"] != 0;
LABEL_13:
  if (dword_1EB4C53F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3) {
    *a3 = v11;
  }
  return 1;
}

@end