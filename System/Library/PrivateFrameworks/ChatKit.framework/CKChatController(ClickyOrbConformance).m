@interface CKChatController(ClickyOrbConformance)
@end

@implementation CKChatController(ClickyOrbConformance)

- (void)transcriptCollectionViewController:()ClickyOrbConformance previewForHighlightingContextMenuWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "No balloonView found to make a preview from.", v2, v3, v4, v5, v6);
}

- (void)transcriptCollectionViewController:()ClickyOrbConformance previewForHighlightingContextMenuWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Tried to initialize UITargetedPreview with a view that is not in a window", v2, v3, v4, v5, v6);
}

- (void)transcriptCollectionViewController:()ClickyOrbConformance previewForHighlightingContextMenuWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unhandled balloonView type: cannot generate preview", v2, v3, v4, v5, v6);
}

- (void)_showAutoDonationAlertForAppName:()ClickyOrbConformance bundleID:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_18EF18000, a2, a3, "Not showing SWY alert. AppName: %@ BundleID: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_deleteActionForChatItem:()ClickyOrbConformance shouldUseTopMostChatItemIfAggregateChatItem:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[CKChatController(ClickyOrbConformance) _deleteActionForChatItem:shouldUseTopMostChatItemIfAggregateChatItem:]";
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "%s chatItemToDelete was nil", (uint8_t *)&v1, 0xCu);
}

- (void)_exportActionForChatItem:()ClickyOrbConformance shouldUseTopMostChatItemIfAggregateChatItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "The media object was nil while trying to create the export context menu action.", v2, v3, v4, v5, v6);
}

- (void)_exportActionForChatItem:()ClickyOrbConformance shouldUseTopMostChatItemIfAggregateChatItem:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Trying to export chat item that doesn't have any media objects: %@", (uint8_t *)&v2, 0xCu);
}

@end