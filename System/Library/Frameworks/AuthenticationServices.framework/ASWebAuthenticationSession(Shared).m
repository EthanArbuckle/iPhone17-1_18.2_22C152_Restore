@interface ASWebAuthenticationSession(Shared)
@end

@implementation ASWebAuthenticationSession(Shared)

- (void)_validateAdditionalHeaderFieldsDryRun:()Shared .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21918F000, a2, OS_LOG_TYPE_ERROR, "Cannot start ASWebAuthenticationSession: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end