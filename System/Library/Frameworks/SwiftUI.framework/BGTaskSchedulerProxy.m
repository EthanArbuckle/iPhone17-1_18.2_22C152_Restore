@interface BGTaskSchedulerProxy
+ (id)shared;
- (BOOL)registerForTaskWithIdentifier:(id)a3 launchHandler:(id)a4;
@end

@implementation BGTaskSchedulerProxy

+ (id)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__BGTaskSchedulerProxy_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_proxy;

  return v2;
}

void __30__BGTaskSchedulerProxy_shared__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_proxy;
  shared_proxy = (uint64_t)v1;
}

- (BOOL)registerForTaskWithIdentifier:(id)a3 launchHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v7 = (void *)getBGTaskSchedulerClass_softClass;
  uint64_t v15 = getBGTaskSchedulerClass_softClass;
  if (!getBGTaskSchedulerClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getBGTaskSchedulerClass_block_invoke;
    v11[3] = &unk_1E53B8560;
    v11[4] = &v12;
    __getBGTaskSchedulerClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v12, 8);
  v9 = [v8 sharedScheduler];
  [v9 registerForTaskWithIdentifier:v5 usingQueue:0 launchHandler:v6];

  return 1;
}

@end