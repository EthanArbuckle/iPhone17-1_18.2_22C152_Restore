@interface HKHealthStore(Workflow)
+ (id)wf_shortcutsAppHealthStore;
@end

@implementation HKHealthStore(Workflow)

+ (id)wf_shortcutsAppHealthStore
{
  if (wf_shortcutsAppHealthStore_onceToken != -1) {
    dispatch_once(&wf_shortcutsAppHealthStore_onceToken, &__block_literal_global_14330);
  }
  v0 = (void *)wf_shortcutsAppHealthStore_store;
  return v0;
}

@end