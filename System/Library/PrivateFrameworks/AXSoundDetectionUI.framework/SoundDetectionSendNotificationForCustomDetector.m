@interface SoundDetectionSendNotificationForCustomDetector
@end

@implementation SoundDetectionSendNotificationForCustomDetector

void ___SoundDetectionSendNotificationForCustomDetector_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1();
    }
  }
}

void ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_226F20000, v0, v1, "Unable to send notification: %@", v2, v3, v4, v5, v6);
}

@end