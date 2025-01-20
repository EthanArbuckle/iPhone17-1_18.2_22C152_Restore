@interface WFStorageServiceInputAction
- (id)inputContentClasses;
- (id)localizedKeywordsWithContext:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFStorageServiceInputAction

- (id)localizedKeywordsWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)WFStorageServiceInputAction;
  v3 = [(WFStorageServiceInputAction *)&v22 localizedKeywordsWithContext:a3];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  v7 = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  v8 = +[WFStorageServiceRegistry sharedRegistry];
  v9 = [v8 storageServices];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(id)objc_opt_class() serviceName];
        v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        v16 = [v14 componentsSeparatedByCharactersInSet:v15];
        [v7 addObjectsFromArray:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }

  return v7;
}

- (id)inputContentClasses
{
  v2 = +[WFStorageServiceRegistry sharedRegistry];
  v3 = [v2 storageServices];
  v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_36696);

  return v4;
}

uint64_t __50__WFStorageServiceInputAction_inputContentClasses__block_invoke()
{
  v0 = objc_opt_class();
  return [v0 resultItemClass];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = +[WFStorageServiceRegistry sharedRegistry];
  id v6 = [v5 storageServices];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__WFStorageServiceInputAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &unk_264E5AAB8;
  id v7 = v4;
  id v12 = v7;
  v8 = objc_msgSend(v6, "if_objectsPassingTest:", v11);

  if ([v8 count])
  {
    v9 = [v8 firstObject];
  }
  else
  {
    v9 = objc_alloc_init(WFDefaultFileStorageService);
  }
  uint64_t v10 = v9;
  [(WFStorageServiceInputAction *)self runAsynchronouslyWithInput:v7 storageService:v9];
}

BOOL __58__WFStorageServiceInputAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() resultItemClass];
  v3 = [*(id *)(a1 + 32) items];
  id v4 = [v3 lastObject];
  BOOL v5 = v2 == objc_opt_class();

  return v5;
}

@end