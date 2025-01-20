@interface ASNotificationEvent(CloudKitCodingSupport)
@end

@implementation ASNotificationEvent(CloudKitCodingSupport)

+ (void)notificationEventWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Notification Event does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
}

+ (void)notificationEventWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21EC60000, v0, v1, "Notification Event record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
}

@end