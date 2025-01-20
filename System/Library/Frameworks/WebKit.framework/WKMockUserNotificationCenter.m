@interface WKMockUserNotificationCenter
@end

@implementation WKMockUserNotificationCenter

uint64_t __78___WKMockUserNotificationCenter_addNotificationRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80___WKMockUserNotificationCenter_getDeliveredNotificationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __78___WKMockUserNotificationCenter_getNotificationSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F445B8], "emptySettings"), "setAuthorizationStatus:", 2 * *(unsigned __int8 *)(a1 + 40));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __83___WKMockUserNotificationCenter_requestAuthorizationWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end