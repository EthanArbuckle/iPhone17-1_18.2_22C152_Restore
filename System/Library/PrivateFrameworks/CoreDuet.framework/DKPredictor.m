@interface DKPredictor
@end

@implementation DKPredictor

uint64_t __28___DKPredictor_predictorLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreduet.dkpredictor", "");
  uint64_t v1 = predictorLog_predictorLog;
  predictorLog_predictorLog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end