@interface CKChatController(PhotosSupport)
@end

@implementation CKChatController(PhotosSupport)

- (void)_presentGridForPendingMomentShareChatItem:()PhotosSupport .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v0, v1, "No moment share URL for chat item: %@", v2);
}

- (void)_gridViewNavigationControllerForMomentShareURL:()PhotosSupport chatItem:tapbackManager:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7_1(&dword_18EF18000, v0, v1, "Will fetch moment share for URL: %@, generation: %td");
}

- (void)_gridViewNavigationControllerForChatItem:()PhotosSupport assetReference:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "Create and return a standard grid view navigation controller", v2, v3, v4, v5, v6);
}

- (void)_previewViewControllerForAssetReference:()PhotosSupport dataSource:previewDelegate:previewMode:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, a2, v3, "Cannot return a preview controller for data source: %{public}@", v4);
}

- (void)_presentPreviewViewControllerFromPhotosViewController:()PhotosSupport assetReference:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18EF18000, v0, v1, "No preview controller for photos view Controller: %@, asset reference: %@");
}

- (void)retractScheduledChatItem:()PhotosSupport .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "retractChatItem: can't retract a chat item that is not a IMMessagePartChatItem", v2, v3, v4, v5, v6);
}

- (void)retractScheduledChatItems:()PhotosSupport fromAggregateChatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "retractScheduledChatItems: can't retract chat items without target message parts or an aggregate chat item", v2, v3, v4, v5, v6);
}

- (void)retractScheduledChatItems:()PhotosSupport fromAggregateChatItem:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "retractScheduledChatItems: can't retract chat items unless their IMChatItems are all of type IMMessagePartChatItem", buf, 2u);
}

- (void)retractScheduledChatItems:()PhotosSupport fromAggregateChatItem:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "retractScheduledChatItems: can't retract from a chat item that is not a IMAggregateMessagePartChatItem", v2, v3, v4, v5, v6);
}

- (void)_assetReferenceForDisplayedGridChatItem:()PhotosSupport selectionSnapshot:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 transferGUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, a2, v4, "nil asset reference for media object %{public}@", v5);
}

- (void)_assetReferenceForDisplayedGridChatItem:()PhotosSupport selectionSnapshot:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, a2, v3, "Cannot look up asset reference for chat item with grid data source of type %{public}@", v4);
}

- (void)actionManager:()PhotosSupport quickLookChatItem:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v0, v1, "Could not look up asset reference for quick look on chat item: %@", v2);
}

- (void)actionManager:()PhotosSupport tapbackChatItem:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_18EF18000, v0, v1, "Could not look up asset reference for tapback on chat item: %@", v2);
}

- (void)selectAllForActionManager:()PhotosSupport .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Could not select all because selection is not allowed", v2, v3, v4, v5, v6);
}

@end