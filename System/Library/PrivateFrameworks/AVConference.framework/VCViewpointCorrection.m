@interface VCViewpointCorrection
- (VCViewpointCorrection)init;
- (void)dealloc;
- (void)init;
@end

@implementation VCViewpointCorrection

- (VCViewpointCorrection)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCViewpointCorrection;
  v2 = [(VCViewpointCorrection *)&v7 init];
  if (v2)
  {
    if (loadAppleCVAViewpointCorrectionSymbols_onceToken != -1) {
      dispatch_once(&loadAppleCVAViewpointCorrectionSymbols_onceToken, &__block_literal_global_7);
    }
    if (loadAppleCVAViewpointCorrectionSymbols_loaded != 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCViewpointCorrection init]();
        }
      }
      goto LABEL_12;
    }
    int v6 = 0;
    v2->_viewpointCorrectionRef = (CVAViewpointCorrection *)sVC_CVAViewpointCorrectionCreateFunc(*MEMORY[0x1E4F1CF80], 0, &v6);
    if (v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(VCViewpointCorrection *)v3 init];
        }
      }
LABEL_12:

      return 0;
    }
  }
  return v2;
}

intptr_t __VCViewpointCorrection_CorrectViewpoint_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    FigCFDictionaryGetBooleanIfPresent();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  viewpointCorrectionRef = self->_viewpointCorrectionRef;
  if (viewpointCorrectionRef) {
    CFRelease(viewpointCorrectionRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCViewpointCorrection;
  [(VCViewpointCorrection *)&v4 dealloc];
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not load AppleCVA Viewpoint Correction symbols", v2, v3, v4, v5, v6);
}

@end