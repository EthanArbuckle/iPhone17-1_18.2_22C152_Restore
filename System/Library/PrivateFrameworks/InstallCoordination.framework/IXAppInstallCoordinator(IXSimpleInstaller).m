@interface IXAppInstallCoordinator(IXSimpleInstaller)
@end

@implementation IXAppInstallCoordinator(IXSimpleInstaller)

+ (void)installApplication:()IXSimpleInstaller toURL:consumeSource:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is not supported on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)installApplication:()IXSimpleInstaller toTargetDirectory:consumeSource:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is not supported on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)installApplication:()IXSimpleInstaller toURL:consumeSource:shouldOverrideGatekeeper:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is not supported on this platform. : %@", v2, v3, v4, v5, 2u);
}

+ (void)installApplication:()IXSimpleInstaller toTargetDirectory:consumeSource:shouldOverrideGatekeeper:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1A7B2D000, v0, v1, "%s: %s is not supported on this platform. : %@", v2, v3, v4, v5, 2u);
}

@end