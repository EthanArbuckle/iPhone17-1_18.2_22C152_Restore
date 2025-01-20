@interface FVIOKit
@end

@implementation FVIOKit

void __FVIOKit_StopVibrator_block_invoke(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

@end