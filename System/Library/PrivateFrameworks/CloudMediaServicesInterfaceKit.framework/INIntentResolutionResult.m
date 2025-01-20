@interface INIntentResolutionResult
@end

@implementation INIntentResolutionResult

void __60__INIntentResolutionResult_CMSCoding__instanceFromCMSCoded___block_invoke()
{
  v3[9] = *MEMORY[0x263EF8340];
  v2[0] = @"BooleanResolutionResult";
  v3[0] = objc_opt_class();
  v2[1] = @"DoubleResoultionResult";
  v3[1] = objc_opt_class();
  v2[2] = @"PlayMediaMediaItemResolutionResult";
  v3[2] = objc_opt_class();
  v2[3] = @"AddMediaMediaItemResolutionResult";
  v3[3] = objc_opt_class();
  v2[4] = @"AddMediaMediaDestinationResolutionResult";
  v3[4] = objc_opt_class();
  v2[5] = @"PlaybackQueueLocationResolutionResult";
  v3[5] = objc_opt_class();
  v2[6] = @"PlaybackRepeatModeResolutionResult";
  v3[6] = objc_opt_class();
  v2[7] = @"UpdateMediaAffinityMediaItemResolutionResult";
  v3[7] = objc_opt_class();
  v2[8] = @"MediaAffinityTypeResolutionResult";
  v3[8] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)instanceFromCMSCoded__classmap;
  instanceFromCMSCoded__classmap = v0;
}

@end