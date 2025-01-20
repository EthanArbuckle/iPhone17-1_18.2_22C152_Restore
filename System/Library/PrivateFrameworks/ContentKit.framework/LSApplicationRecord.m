@interface LSApplicationRecord
@end

@implementation LSApplicationRecord

void __51__LSApplicationRecord_Workflow__wf_bundleAllowList__block_invoke()
{
  v5[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F854D8];
  v5[0] = @"com.apple.TapToRadar";
  v5[1] = v1;
  v5[2] = @"com.apple.Livability";
  v5[3] = @"com.apple.Terminal";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:4];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)wf_bundleAllowList_allowlist;
  wf_bundleAllowList_allowlist = v3;
}

uint64_t __49__LSApplicationRecord_Workflow__wf_isLinkEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = [v2 isLinkEnabled];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t __53__LSApplicationRecord_Intents2__in2_supportedIntents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 extensionPointRecord];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F0F770]];

  return v4;
}

@end