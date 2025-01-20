@interface CKChatController(QuickLook)
@end

@implementation CKChatController(QuickLook)

- (void)previewController:()QuickLook transitionViewForPreviewItem:uncroppedSourceFrame:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "unexpected cell: %@ at indexPath: %@", (uint8_t *)&v3, 0x16u);
}

@end