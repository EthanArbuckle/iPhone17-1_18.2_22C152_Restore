@interface CKConversationListCollectionViewController(Banners)
@end

@implementation CKConversationListCollectionViewController(Banners)

- (void)addBanner:()Banners animated:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [a1 superview];
  int v4 = 138412546;
  v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Not displaying banner, banner superview: %@ isn't the view controller's view: %@ after insertion", (uint8_t *)&v4, 0x16u);
}

@end