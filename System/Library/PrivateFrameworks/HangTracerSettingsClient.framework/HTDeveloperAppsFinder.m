@interface HTDeveloperAppsFinder
- (HTDeveloperAppsFinder)init;
- (HTDeveloperAppsFinderDelegate)delegate;
- (void)checkProxiesForDeveloperAppAndNotifyDelegate:(id)a3;
- (void)dealloc;
- (void)findApps:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HTDeveloperAppsFinder

- (HTDeveloperAppsFinder)init
{
  v5.receiver = self;
  v5.super_class = (Class)HTDeveloperAppsFinder;
  v2 = [(HTDeveloperAppsFinder *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F01880] defaultWorkspace];
    [v3 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HTDeveloperAppsFinder;
  [(HTDeveloperAppsFinder *)&v4 dealloc];
}

- (void)findApps:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_FindingApplica.isa);
  objc_super v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke;
  block[3] = &unk_265354138;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __34__HTDeveloperAppsFinder_findApps___block_invoke(uint64_t a1)
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v2 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke_2;
  v13[3] = &unk_2653540D0;
  v15 = &v16;
  id v14 = *(id *)(a1 + 32);
  [v2 setErrorHandler:v13];
  [v2 setFilter:&__block_literal_global_4];
  id v3 = [MEMORY[0x263EFF980] array];
  for (i = 0; ; i = v5)
  {
    id v5 = [v2 nextObject];

    if (!v5) {
      break;
    }
    v6 = [HTDeveloperApp alloc];
    id v7 = [v5 localizedName];
    v8 = [v5 bundleIdentifier];
    v9 = [(HTDeveloperApp *)v6 initWithName:v7 bundleID:v8];
    [v3 addObject:v9];
  }
  NSLog(&cfstr_FoundLuDevelop.isa, [v3 count]);
  if (*((unsigned char *)v17 + 24))
  {
    NSLog(&cfstr_CompletionBloc_0.isa);
  }
  else
  {
    NSLog(&cfstr_CallingComplet.isa);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke_5;
    block[3] = &unk_265354020;
    id v12 = *(id *)(a1 + 32);
    id v11 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  _Block_object_dispose(&v16, 8);
}

void __34__HTDeveloperAppsFinder_findApps___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_ThereWasAnErro_0.isa, v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    NSLog(&cfstr_CompletionBloc.isa);
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__HTDeveloperAppsFinder_findApps___block_invoke_3;
    block[3] = &unk_265354020;
    id v7 = *(id *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __34__HTDeveloperAppsFinder_findApps___block_invoke_3(uint64_t a1)
{
  NSLog(&cfstr_ReportingTheEr.isa);
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __34__HTDeveloperAppsFinder_findApps___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isDeveloperApp];
}

void __34__HTDeveloperAppsFinder_findApps___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) sortedArrayUsingComparator:&__block_literal_global_26];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

uint64_t __34__HTDeveloperAppsFinder_findApps___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)checkProxiesForDeveloperAppAndNotifyDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  id v6 = v4;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "correspondingApplicationRecord", (void)v13);
      char v11 = [v10 isDeveloperApp];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        id v6 = v4;
        goto LABEL_12;
      }
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained) {
      goto LABEL_13;
    }
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 developerAppsDidChangeForFinder:self];
  }
LABEL_12:

LABEL_13:
}

- (HTDeveloperAppsFinderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HTDeveloperAppsFinderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end