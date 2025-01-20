@interface ATXAppSwitcherSuggestionSender
- (void)blendingLayerDidUpdateAppSwitcherUICache;
@end

@implementation ATXAppSwitcherSuggestionSender

- (void)blendingLayerDidUpdateAppSwitcherUICache
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_blending();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "%@ - received new ui cache", (uint8_t *)&v5, 0xCu);
  }
  notify_post((const char *)[(id)*MEMORY[0x1E4F4AD50] UTF8String]);
}

@end