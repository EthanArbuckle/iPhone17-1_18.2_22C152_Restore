@interface CNUIPlaceholderProviderFactory
- (CNScheduler)highPriorityLock;
- (CNScheduler)resourceLock;
- (CNUIPRLikenessProvider)loadingGroupPlaceholderProvider;
- (CNUIPRLikenessProvider)loadingPlaceholderProvider;
- (CNUIPRLikenessProvider)placeholderProvider;
- (CNUIPlaceholderProviderFactory)init;
- (id)loadingGroupPlaceholderProviderWithBackgroundStyle:(unint64_t)a3;
- (id)placeholderProviderForContact:(id)a3;
- (void)setHighPriorityLock:(id)a3;
- (void)setResourceLock:(id)a3;
@end

@implementation CNUIPlaceholderProviderFactory

- (CNUIPRLikenessProvider)loadingPlaceholderProvider
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  v3 = [(CNUIPlaceholderProviderFactory *)self highPriorityLock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__CNUIPlaceholderProviderFactory_loadingPlaceholderProvider__block_invoke;
  v6[3] = &unk_264019590;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNUIPRLikenessProvider *)v4;
}

- (CNScheduler)highPriorityLock
{
  return self->_highPriorityLock;
}

uint64_t __64__CNUIPlaceholderProviderFactory_placeholderProviderForContact___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isKeyAvailable:*MEMORY[0x263EFE148]]
    && [*(id *)(a1 + 32) contactType] == 1)
  {
    uint64_t v2 = a1 + 40;
    v3 = *(void **)(*(void *)(a1 + 40) + 16);
    if (v3) {
      goto LABEL_8;
    }
    id v4 = [[CNUIPRLikenessPlaceholderProvider alloc] initWithContact:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
    uint64_t v7 = 16;
  }
  else
  {
    uint64_t v2 = a1 + 40;
    v3 = *(void **)(*(void *)(a1 + 40) + 8);
    if (v3) {
      goto LABEL_8;
    }
    v8 = objc_alloc_init(CNUIPRLikenessPlaceholderProvider);
    v6 = *(void **)(*(void *)v2 + 8);
    *(void *)(*(void *)v2 + 8) = v8;
    uint64_t v7 = 8;
  }

  v3 = *(void **)(*(void *)v2 + v7);
LABEL_8:
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v9 + 40) = v3;
  return MEMORY[0x270F9A758]();
}

void __85__CNUIPlaceholderProviderFactory_loadingGroupPlaceholderProviderWithBackgroundStyle___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    v3 = [[CNUIPRLikenessLoadingGroupPlaceholderProvider alloc] initWithBackgroundStyle:a1[6]];
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(a1[4] + 32);
  }
  v6 = (id *)(*(void *)(a1[5] + 8) + 40);
  objc_storeStrong(v6, v2);
}

void __60__CNUIPlaceholderProviderFactory_loadingPlaceholderProvider__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(CNUIPRLikenessLoadingPlaceholderProvider);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (CNUIPlaceholderProviderFactory)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNUIPlaceholderProviderFactory;
  uint64_t v2 = [(CNUIPlaceholderProviderFactory *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F33660] synchronousSerialDispatchQueueWithName:@"com.apple.contacts.ContactsUICore.CNUIPlaceholderProviderFactory"];
    resourceLock = v2->_resourceLock;
    v2->_resourceLock = (CNScheduler *)v3;

    uint64_t v5 = [MEMORY[0x263F33660] synchronousSerialDispatchQueueWithName:@"com.apple.contacts.ContactsUICore.CNUIPlaceholderProviderFactory.HighPriority"];
    highPriorityLock = v2->_highPriorityLock;
    v2->_highPriorityLock = (CNScheduler *)v5;

    uint64_t v7 = v2;
  }

  return v2;
}

- (id)placeholderProviderForContact:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  uint64_t v5 = [(CNUIPlaceholderProviderFactory *)self resourceLock];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__CNUIPlaceholderProviderFactory_placeholderProviderForContact___block_invoke;
  v9[3] = &unk_264017EE8;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  id v12 = &v13;
  [v5 performBlock:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

- (id)loadingGroupPlaceholderProviderWithBackgroundStyle:(unint64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__5;
  uint64_t v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  uint64_t v5 = [(CNUIPlaceholderProviderFactory *)self highPriorityLock];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__CNUIPlaceholderProviderFactory_loadingGroupPlaceholderProviderWithBackgroundStyle___block_invoke;
  v8[3] = &unk_2640195B8;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  [v5 performBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityLock, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_loadingGroupPlaceholderProvider, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderProvider, 0);
  objc_storeStrong((id *)&self->_organizationPlaceholderProvider, 0);
  objc_storeStrong((id *)&self->_placeholderProvider, 0);
}

- (CNUIPRLikenessProvider)placeholderProvider
{
  return (CNUIPRLikenessProvider *)[(CNUIPlaceholderProviderFactory *)self placeholderProviderForContact:0];
}

- (void)setResourceLock:(id)a3
{
}

- (void)setHighPriorityLock:(id)a3
{
}

- (CNUIPRLikenessProvider)loadingGroupPlaceholderProvider
{
  return (CNUIPRLikenessProvider *)objc_getProperty(self, a2, 32, 1);
}

@end