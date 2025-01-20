@interface DKCompatibility
@end

@implementation DKCompatibility

uint64_t __40___DKCompatibility_currentCompatibility__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) compatibilityWithMinVersion:0 maxVersion:4096];
  uint64_t v2 = currentCompatibility_compatibility;
  currentCompatibility_compatibility = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end