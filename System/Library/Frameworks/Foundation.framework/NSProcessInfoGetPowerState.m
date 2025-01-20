@interface NSProcessInfoGetPowerState
@end

@implementation NSProcessInfoGetPowerState

uint64_t ___NSProcessInfoGetPowerState_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int out_token = 0;
  qos_class_t v0 = qos_class_main();
  global_queue = dispatch_get_global_queue(v0, 2uLL);
  uint64_t result = notify_register_dispatch("com.apple.system.lowpowermode", &out_token, global_queue, &__block_literal_global_163);
  if (!result)
  {
    +[_NSSwiftProcessInfo cancelPowerStateNotifyNotification];
    return NSProcessInfoNotifyPowerState(out_token);
  }
  return result;
}

uint64_t ___NSProcessInfoGetPowerState_block_invoke_2(uint64_t a1, int a2)
{
  return NSProcessInfoNotifyPowerState(a2);
}

@end