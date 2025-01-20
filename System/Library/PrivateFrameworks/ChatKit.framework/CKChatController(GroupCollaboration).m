@interface CKChatController(GroupCollaboration)
@end

@implementation CKChatController(GroupCollaboration)

- (void)_highlightForShareURL:()GroupCollaboration completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_18EF18000, v0, v1, "Did not get a highlight from URL: %@, error: %@");
}

- (void)_attributionFromHighlight:()GroupCollaboration forChatGUID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Did not get any attributions from highlight: %@", v2, v3, v4, v5, v6);
}

- (void)_attributionFromHighlight:()GroupCollaboration forChatGUID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Did not find an attribution for highlight: %@", v2, v3, v4, v5, v6);
}

@end