@interface _LSCanOpenURLManager(PrivateSchemeChecking)
- (void)copySchemesMap;
- (void)writeSchemesMap;
@end

@implementation _LSCanOpenURLManager(PrivateSchemeChecking)

- (void)writeSchemesMap
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_182959000, v0, v1, "should not write schemes map in system lsd", v2, v3, v4, v5, v6);
}

- (void)copySchemesMap
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_182959000, v0, OS_LOG_TYPE_ERROR, "Scheme mapping file appears to be corrupt, creating new file.", v1, 2u);
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_182959000, v0, v1, "should not query whether bundles can check schemes in system lsd", v2, v3, v4, v5, v6);
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v0, v1, "LSTesting: app %@ has not asked about any schemes before %@, creating map and allowing");
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3(&dword_182959000, v0, v1, "LSTesting: app %@ has previously asked about %@, allowing");
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_1_3(&dword_182959000, a2, a3, "LSTesting: app %@ has exceeded their schemes quota. Schemes queried:\n%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end