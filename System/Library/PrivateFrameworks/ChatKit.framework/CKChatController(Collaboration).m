@interface CKChatController(Collaboration)
@end

@implementation CKChatController(Collaboration)

- (void)_actuallyPresentCollaborationFailureAlertForComposition:()Collaboration sharingURL:error:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Showing collaboration failure for error: %@", v2, v3, v4, v5, v6);
}

- (void)_actuallyPresentCollaborationFailureAlertForComposition:()Collaboration sharingURL:error:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "CSUIShareItemStatusCanBeShared is not a valid error state!", v2, v3, v4, v5, v6);
}

- (void)_actuallyPresentCollaborationFailureAlertForComposition:()Collaboration sharingURL:error:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Unknown error domain: %@", v2, v3, v4, v5, v6);
}

@end