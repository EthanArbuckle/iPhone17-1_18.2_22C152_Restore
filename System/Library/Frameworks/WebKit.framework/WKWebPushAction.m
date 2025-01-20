@interface WKWebPushAction
@end

@implementation WKWebPushAction

void __50___WKWebPushAction_beginBackgroundTaskForHandling__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_1985F2000, v2, OS_LOG_TYPE_ERROR, "Took too long to handle Web Push action: '%@'", (uint8_t *)&v4, 0xCu);
  }
}

@end