@interface AKAppleIDSigningController(Convenience)
@end

@implementation AKAppleIDSigningController(Convenience)

- (void)_parseDERCertificatesFromChain:()Convenience error:.cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Failed to parse certificate set. rc=%d, numCerts=%zu", (uint8_t *)v4, 0x12u);
}

- (void)_parseDERCertificatesFromChain:()Convenience error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Invalid certData", v2, v3, v4, v5, v6);
}

@end