@interface MTMaterialLayer(Private)
@end

@implementation MTMaterialLayer(Private)

- (void)setContentReplacedWithSnapshot:()Private .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE9D6000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create an IOSurface", (uint8_t *)&v2, 0xCu);
}

- (void)setContentReplacedWithSnapshot:()Private .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE9D6000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to render server snapshot", (uint8_t *)&v2, 0xCu);
}

@end