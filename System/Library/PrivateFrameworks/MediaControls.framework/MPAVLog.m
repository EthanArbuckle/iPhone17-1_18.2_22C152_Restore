@interface MPAVLog
@end

@implementation MPAVLog

void ___MPAVLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediacontrols", "ScreenMirroring");
  v1 = (void *)_MPAVLog__log;
  _MPAVLog__log = (uint64_t)v0;
}

@end