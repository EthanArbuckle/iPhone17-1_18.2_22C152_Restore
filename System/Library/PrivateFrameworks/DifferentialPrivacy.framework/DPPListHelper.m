@interface DPPListHelper
@end

@implementation DPPListHelper

void __67___DPPListHelper_loadPropertyListFromPath_overridePath_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, v7, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

@end