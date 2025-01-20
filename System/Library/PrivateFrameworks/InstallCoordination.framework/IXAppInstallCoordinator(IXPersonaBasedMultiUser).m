@interface IXAppInstallCoordinator(IXPersonaBasedMultiUser)
@end

@implementation IXAppInstallCoordinator(IXPersonaBasedMultiUser)

+ (void)associateMultiPersonaAppsWithBundleIDs:()IXPersonaBasedMultiUser withPersona:withError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is not available on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)addBundleIDs:()IXPersonaBasedMultiUser toMappingsForPersona:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is not available on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)removeBundleIDs:()IXPersonaBasedMultiUser fromMappingsForPersona:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is not available on this platform. : %@", v2, v3, v4, v5, 2u);
}

@end