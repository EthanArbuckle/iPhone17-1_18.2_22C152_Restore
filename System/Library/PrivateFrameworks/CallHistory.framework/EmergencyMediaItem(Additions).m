@interface EmergencyMediaItem(Additions)
@end

@implementation EmergencyMediaItem(Additions)

- (void)copyWithContext:()Additions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  v3 = @"Handle";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_ERROR, "Could not find EmergencyMediaItem entity with name %{public}@ in context %{public}@. Falling back to convenience initializer.", (uint8_t *)&v2, 0x16u);
}

@end