@interface CMSUtility
@end

@implementation CMSUtility

uint64_t __CMSUtility_SetIsRecording_block_invoke()
{
  uint64_t result = ct_green_tea_logger_create();
  CMSUtility_SetIsRecording_greenTeaLogger = result;
  return result;
}

void __CMSUtility_PostInterruptionCommandNotification_block_invoke(uint64_t a1)
{
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), @"Interruption");
  v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(void **)(a1 + 32);
}

void __CMSUtility_PostInterruptionCommandNotification_block_invoke_2(uint64_t a1)
{
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), @"Interruption");
  v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(void **)(a1 + 32);
}

@end