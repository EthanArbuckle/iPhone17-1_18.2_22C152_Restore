@interface SYChange(SYSessionAdditions)
@end

@implementation SYChange(SYSessionAdditions)

+ (void)changeWithChangeObject:()SYSessionAdditions serializer:encodeUsingVersion:.cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "SYChangeSerializer doesn't support -encodeSYChangeForBackwardCompatibility:protocolVersion:, but I'm being asked to encode a change for version %d", (uint8_t *)v1, 8u);
}

+ (void)changeWithChangeObject:()SYSessionAdditions serializer:encodeUsingVersion:.cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = _SYObfuscate(a2);
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_ERROR, "SYChange object %{public}@ does not provide the required objectIdentifier!", (uint8_t *)&v5, 0xCu);
}

- (void)changeObjectWithSerializer:()SYSessionAdditions .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end