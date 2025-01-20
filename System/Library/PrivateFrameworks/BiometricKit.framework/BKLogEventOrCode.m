@interface BKLogEventOrCode
@end

@implementation BKLogEventOrCode

uint64_t ___BKLogEventOrCode_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];
  _BKLogEventOrCode_isDaemon = [v1 hasSuffix:@"biometrickitd"];

  _BKLogEventOrCode_queue = (uint64_t)dispatch_queue_create("com.apple.BKLogEvent.dispatch", 0);
  return MEMORY[0x1F41817F8]();
}

void ___BKLogEventOrCode_block_invoke_2(uint64_t a1)
{
  id v2 = [NSClassFromString(&cfstr_Biometrickit.isa) manager];
  [v2 logEventOrCode:*(void *)(a1 + 32)];
}

@end