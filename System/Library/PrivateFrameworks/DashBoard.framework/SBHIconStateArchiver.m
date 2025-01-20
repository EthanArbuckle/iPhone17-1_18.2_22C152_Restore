@interface SBHIconStateArchiver
@end

@implementation SBHIconStateArchiver

uint64_t __83__SBHIconStateArchiver_DBAdditions__carKitRepresentationFromRootArchive_iconModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 applicationBundleID];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

@end