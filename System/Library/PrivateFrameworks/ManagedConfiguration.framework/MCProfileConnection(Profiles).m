@interface MCProfileConnection(Profiles)
- (void)cancelUserInputResponses;
@end

@implementation MCProfileConnection(Profiles)

- (void)preflightUserInputResponses:()Profiles forPayloadIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A13F0000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)cancelUserInputResponses
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A13F0000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)submitUserInputResponses:()Profiles .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A13F0000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)respondToMAIDAuthenticationRequest:()Profiles error:isCancelled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A13F0000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)respondToManagedRestoreRequest:()Profiles error:isCancelled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A13F0000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)respondToWarningsContinueInstallation:()Profiles .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A13F0000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

- (void)respondToCurrentPasscodeRequestContinue:()Profiles passcode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A13F0000, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

@end