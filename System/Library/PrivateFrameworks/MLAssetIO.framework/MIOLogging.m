@interface MIOLogging
+ (id)coreChannel;
@end

@implementation MIOLogging

+ (id)coreChannel
{
  if (coreChannel_onceToken != -1) {
    dispatch_once(&coreChannel_onceToken, &__block_literal_global);
  }
  v2 = (void *)coreChannel_coreChannel;
  return v2;
}

void __25__MIOLogging_coreChannel__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mlassetio", "mlassetio");
  v1 = (void *)coreChannel_coreChannel;
  coreChannel_coreChannel = (uint64_t)v0;

  if (!coreChannel_coreChannel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __25__MIOLogging_coreChannel__block_invoke_cold_1();
  }
}

void __25__MIOLogging_coreChannel__block_invoke_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t coreChannel", v0, 2u);
}

@end