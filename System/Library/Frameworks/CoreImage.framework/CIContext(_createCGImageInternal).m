@interface CIContext(_createCGImageInternal)
@end

@implementation CIContext(_createCGImageInternal)

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.1(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_0(&dword_193671000, v1, v2, "[CIContext createCGImage:fromRect:format:colorSpace:] unsupported format %{public}s.", v3, v4, v5, v6, 2u);
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.2(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_0(&dword_193671000, v1, v2, "[CIContext createCGImage:fromRect:format:colorSpace:] format %{public}s is not supported on GLES.", v3, v4, v5, v6, 2u);
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.3(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "Cannot create a CGImageProvider for %{public}s\n", buf, 0xCu);
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end