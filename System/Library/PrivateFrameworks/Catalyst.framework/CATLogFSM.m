@interface CATLogFSM
@end

@implementation CATLogFSM

uint64_t ___CATLogFSM_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.catalyst", "FSM");
  uint64_t v1 = _CATLogFSM_logObj;
  _CATLogFSM_logObj = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end