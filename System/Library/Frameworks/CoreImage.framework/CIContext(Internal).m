@interface CIContext(Internal)
@end

@implementation CIContext(Internal)

+ (void)internalContextWithEAGLContext:()Internal options:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193671000, log, OS_LOG_TYPE_DEBUG, "CIContext for CL: do something about disabling software fallback here.", v1, 2u);
}

+ (void)internalContextWithEAGLContext:()Internal options:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s unsupported object %{public}@ for key kCIContextHLGOpticalScale.", v2, v3, v4, v5, 2u);
}

+ (void)internalContextWithEAGLContext:()Internal options:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)internalContextWithEAGLContext:()Internal options:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "CIContext workingformat must be %{public}s. Ignoring request for %{public}s.", v2, v3, v4, v5, 2u);
}

+ (void)internalContextWithMTLCommandQueue:()Internal options:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s unsupported object %{public}@ for key kCIContextHLGOpticalScale.", v2, v3, v4, v5, 2u);
}

+ (void)internalContextWithMTLCommandQueue:()Internal options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)internalContextWithMTLCommandQueue:()Internal options:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "CIContext workingformat must be %{public}s. Ignoring request for %{public}s.", v2, v3, v4, v5, 2u);
}

+ (void)internalSWContextWithOptions:()Internal .cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s unsupported object %{public}@ for key kCIContextHLGOpticalScale.", v2, v3, v4, v5, 2u);
}

@end