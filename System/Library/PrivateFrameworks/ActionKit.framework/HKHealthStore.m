@interface HKHealthStore
@end

@implementation HKHealthStore

uint64_t __53__HKHealthStore_Workflow__wf_shortcutsAppHealthStore__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F0A410]);
  v1 = (void *)wf_shortcutsAppHealthStore_store;
  wf_shortcutsAppHealthStore_store = (uint64_t)v0;

  [(id)wf_shortcutsAppHealthStore_store setSourceBundleIdentifier:*MEMORY[0x263F855B8]];
  v2 = (void *)wf_shortcutsAppHealthStore_store;
  return [v2 resume];
}

@end