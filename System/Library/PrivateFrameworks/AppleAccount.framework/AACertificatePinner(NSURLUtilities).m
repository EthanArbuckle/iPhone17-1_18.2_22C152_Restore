@interface AACertificatePinner(NSURLUtilities)
@end

@implementation AACertificatePinner(NSURLUtilities)

- (void)connection:()NSURLUtilities willSendRequestForAuthenticationChallenge:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "No certificate to validate, bailing!", v2, v3, v4, v5, v6);
}

- (void)connection:()NSURLUtilities willSendRequestForAuthenticationChallenge:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Failed to validate certificate, bailing!", v2, v3, v4, v5, v6);
}

@end