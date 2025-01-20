@interface CAMResetVideoMinFrameDurationOverrideCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMResetVideoMinFrameDurationOverrideCommand

- (void)executeWithContext:(id)a3
{
  v3 = [a3 currentVideoDeviceInput];
  long long v4 = *MEMORY[0x263F01090];
  uint64_t v5 = *(void *)(MEMORY[0x263F01090] + 16);
  [v3 setVideoMinFrameDurationOverride:&v4];
}

@end