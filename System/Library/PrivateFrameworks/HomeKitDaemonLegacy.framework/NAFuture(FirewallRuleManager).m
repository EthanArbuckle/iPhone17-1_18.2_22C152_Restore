@interface NAFuture(FirewallRuleManager)
- (id)blockAndWaitForCompletionWithError:()FirewallRuleManager;
@end

@implementation NAFuture(FirewallRuleManager)

- (id)blockAndWaitForCompletionWithError:()FirewallRuleManager
{
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__24655;
  v25 = __Block_byref_object_dispose__24656;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__24655;
  v19 = __Block_byref_object_dispose__24656;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__NAFuture_FirewallRuleManager__blockAndWaitForCompletionWithError___block_invoke;
  v11[3] = &unk_1E6A08A98;
  v13 = &v21;
  v14 = &v15;
  v6 = v5;
  v12 = v6;
  id v7 = (id)[a1 addCompletionBlock:v11];
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    if (v22[5]) {
      v8 = 0;
    }
    else {
      v8 = (void *)v16[5];
    }
    *a3 = v8;
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end