@interface CDPContext(Account)
@end

@implementation CDPContext(Account)

+ (void)preflightContext:()Account .cold.1()
{
  OUTLINED_FUNCTION_1();
}

+ (void)preflightContext:()Account .cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_2182AE000, v0, v1, "preflightContext: FAILED TO FIND ACCOUNT – Context will not be properly initted and major issues may follow.", v2, v3, v4, v5, v6);
}

+ (void)preflightContext:()Account .cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "preflightContext: Incoming context did not provide a DSID/altDSID/appleID. Defaulting to using the primary account info. Please get a context using +[CDPContext contextForPrimaryAccount] if this was the intended behavior.", v2, v3, v4, v5, v6);
}

+ (void)preflightContext:()Account .cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "preflightContext: Incoming context was initialized using a deprecated method. Please use one of the newer class-level inits.", v2, v3, v4, v5, v6);
}

+ (void)preflightContext:()Account .cold.5(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 appleID];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Failed to find account for appleID: %@", (uint8_t *)&v4, 0xCu);
}

+ (void)preflightContext:()Account .cold.6(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 dsid];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, a2, v4, "Failed to find account for dsid: %{mask.hash}@", v5);
}

+ (void)preflightContext:()Account .cold.7(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 altDSID];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_1(&dword_2182AE000, a2, v4, "Failed to find account for altDSID: %{mask.hash}@", v5);
}

+ (void)preflightContext:()Account .cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Context was properly initted, skipping preflight", v2, v3, v4, v5, v6);
}

@end