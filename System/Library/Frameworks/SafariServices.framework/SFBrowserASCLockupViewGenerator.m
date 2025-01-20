@interface SFBrowserASCLockupViewGenerator
+ (SFBrowserASCLockupViewGenerator)sharedGenerator;
+ (id)lockupViewGroup;
- (void)generateLockupViewsWithDelegate:(id)a3 completionHandler:(id)a4;
@end

@implementation SFBrowserASCLockupViewGenerator

+ (SFBrowserASCLockupViewGenerator)sharedGenerator
{
  if (sharedGenerator_onceToken != -1) {
    dispatch_once(&sharedGenerator_onceToken, &__block_literal_global_63);
  }
  v2 = (void *)sharedGenerator_sharedGenerator;

  return (SFBrowserASCLockupViewGenerator *)v2;
}

void __50__SFBrowserASCLockupViewGenerator_sharedGenerator__block_invoke()
{
  v0 = objc_alloc_init(SFBrowserASCLockupViewGenerator);
  v1 = (void *)sharedGenerator_sharedGenerator;
  sharedGenerator_sharedGenerator = (uint64_t)v0;
}

+ (id)lockupViewGroup
{
  if (lockupViewGroup_onceToken != -1) {
    dispatch_once(&lockupViewGroup_onceToken, &__block_literal_global_2_0);
  }
  v2 = (void *)lockupViewGroup_group;

  return v2;
}

void __50__SFBrowserASCLockupViewGenerator_lockupViewGroup__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4BB10]) initWithName:@"BrowserLockups"];
  v1 = (void *)lockupViewGroup_group;
  lockupViewGroup_group = v0;
}

- (void)generateLockupViewsWithDelegate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (AppStoreComponentsLibraryCore() && getASCLockupContextWebBrowserSymbolLoc())
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    [(NSTimer *)self->_requestTimeout invalidate];
    v9 = (void *)MEMORY[0x1E4F1CB00];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke;
    v19[3] = &unk_1E5C78280;
    id v10 = v8;
    id v20 = v10;
    id v11 = v7;
    v21 = self;
    id v22 = v11;
    v12 = [v9 scheduledTimerWithTimeInterval:0 repeats:v19 block:15.0];
    requestTimeout = self->_requestTimeout;
    self->_requestTimeout = v12;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C75F00;
    block[4] = self;
    id v16 = v6;
    id v17 = v10;
    id v18 = v11;
    id v14 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) count]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

void __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F4BAD8]);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v3 = (id *)getASCCollectionIDWebBrowsersSymbolLoc_ptr;
  uint64_t v23 = getASCCollectionIDWebBrowsersSymbolLoc_ptr;
  if (!getASCCollectionIDWebBrowsersSymbolLoc_ptr)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __getASCCollectionIDWebBrowsersSymbolLoc_block_invoke;
    id v18 = &unk_1E5C723B0;
    v19 = &v20;
    v4 = (void *)AppStoreComponentsLibrary();
    v21[3] = (uint64_t)dlsym(v4, "ASCCollectionIDWebBrowsers");
    getASCCollectionIDWebBrowsersSymbolLoc_ptr = *(void *)(v19[1] + 24);
    v3 = (id *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v3)
  {
    -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:]();
LABEL_7:
    id v10 = (_Unwind_Exception *)-[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:]();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v10);
  }
  id v5 = *v3;
  ASCLockupContextWebBrowserSymbolLoc = (void *)getASCLockupContextWebBrowserSymbolLoc();
  if (!ASCLockupContextWebBrowserSymbolLoc) {
    goto LABEL_7;
  }
  id v7 = (void *)[v2 initWithID:v5 kind:*MEMORY[0x1E4F4BA80] context:*ASCLockupContextWebBrowserSymbolLoc limit:20];

  v8 = [(id)objc_opt_class() lockupViewGroup];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5C782A8;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  [v8 _cacheLockupsWithCollectionRequest:v7 withCompletionBlock:v11];
}

void __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;

  if (v3 && [v3 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      double v10 = *MEMORY[0x1E4F1DB28];
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v16 = objc_alloc(MEMORY[0x1E4F4BB08]);
          id v17 = objc_msgSend(v16, "initWithFrame:", v10, v11, v12, v13, (void)v23);
          [v17 setDelegate:*(void *)(a1 + 40)];
          id v18 = [(id)objc_opt_class() lockupViewGroup];
          [v17 setGroup:v18];

          v19 = (void *)[v15 copy];
          [v17 setRequest:v19];

          [v17 setShowsPlaceholderContent:1];
          uint64_t v20 = [v17 lockup];
          v21 = [v20 lockupWithOffer:0];
          [v17 setLockup:v21];

          [*(id *)(a1 + 48) addObject:v17];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    uint64_t v22 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v22 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v22();
}

- (void).cxx_destruct
{
}

@end