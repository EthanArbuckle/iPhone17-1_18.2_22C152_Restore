@interface WKWebsiteDataStoreBSActionHandler
@end

@implementation WKWebsiteDataStoreBSActionHandler

uint64_t __65___WKWebsiteDataStoreBSActionHandler_handleNotificationResponse___block_invoke(uint64_t a1)
{
  v2 = (void *)(*(uint64_t (**)(void))(*(void *)(+[_WKWebsiteDataStoreBSActionHandler shared]+ 8)+ 16))();
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 _handleWebPushAction:v3];
}

@end