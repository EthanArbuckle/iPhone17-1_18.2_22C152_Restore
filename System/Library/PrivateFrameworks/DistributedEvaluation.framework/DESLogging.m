@interface DESLogging
+ (id)coreChannel;
@end

@implementation DESLogging

+ (id)coreChannel
{
  if (DESLoggingGetCoreChannel_onceToken != -1) {
    dispatch_once(&DESLoggingGetCoreChannel_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)DESLoggingGetCoreChannel_coreChannel;

  return v2;
}

@end