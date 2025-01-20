@interface ATXInternalNotification
@end

@implementation ATXInternalNotification

void __53___ATXInternalNotification_registerForNotifications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 userInfo];
  v3 = [v4 objectForKeyedSubscript:@"data"];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

@end