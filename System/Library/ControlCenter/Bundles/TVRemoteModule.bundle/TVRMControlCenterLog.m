@interface TVRMControlCenterLog
@end

@implementation TVRMControlCenterLog

uint64_t ___TVRMControlCenterLog_block_invoke()
{
  _TVRMControlCenterLog_log = (uint64_t)os_log_create("com.apple.TVRemoteModule", "ControlCenter");

  return MEMORY[0x270F9A758]();
}

@end