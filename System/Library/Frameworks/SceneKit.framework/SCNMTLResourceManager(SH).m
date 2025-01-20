@interface SCNMTLResourceManager(SH)
@end

@implementation SCNMTLResourceManager(SH)

- (void)shFromCPU:()SH commandBuffer:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: format %lu not supported for SH generation", (uint8_t *)&v2, 0xCu);
}

@end