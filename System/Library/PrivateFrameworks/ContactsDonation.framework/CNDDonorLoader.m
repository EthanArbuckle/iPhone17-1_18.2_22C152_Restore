@interface CNDDonorLoader
+ (id)continuousExtensionsObservable;
+ (id)currentExtensionsObservable;
+ (id)extensionAttributes;
- (CNDDonorLoader)init;
- (CNDonationLoggerProvider)loggerProvider;
- (id)donorWithIdentifier:(id)a3;
@end

@implementation CNDDonorLoader

- (CNDDonorLoader)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNDDonorLoader;
  v2 = [(CNDDonorLoader *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[CNDonationLoggerProvider defaultProvider];
    loggerProvider = v2->_loggerProvider;
    v2->_loggerProvider = (CNDonationLoggerProvider *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)donorWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335E0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__CNDDonorLoader_donorWithIdentifier___block_invoke;
  v15[3] = &unk_2641FC2B0;
  id v6 = v4;
  id v16 = v6;
  objc_super v7 = [v5 futureWithBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__CNDDonorLoader_donorWithIdentifier___block_invoke_2;
  v13[3] = &unk_2641FC2D8;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  [v7 addSuccessBlock:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__CNDDonorLoader_donorWithIdentifier___block_invoke_3;
  v11[3] = &unk_2641FC300;
  v11[4] = self;
  id v12 = v8;
  id v9 = v8;
  [v7 addFailureBlock:v11];

  return v7;
}

CNDDonorExtension *__38__CNDDonorLoader_donorWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = 0;
  v5 = [MEMORY[0x263F08800] extensionWithIdentifier:v4 error:&v12];
  id v6 = v12;
  if (v5)
  {
    objc_super v7 = [[CNDDonorExtension alloc] initWithExtension:v5];
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"bundle identifier"];
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08608]];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"CNDonationErrorDomain" code:504 userInfo:v8];
    v10 = v9;
    if (a2) {
      *a2 = v9;
    }

    objc_super v7 = 0;
  }

  return v7;
}

void __38__CNDDonorLoader_donorWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 loggerProvider];
  v5 = [v6 extensionLogger];
  [v5 loadedDonorExtension:v4 forIdentifier:*(void *)(a1 + 40)];
}

void __38__CNDDonorLoader_donorWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 loggerProvider];
  v5 = [v6 extensionLogger];
  [v5 couldNotLoadDonorExtensionForIdentifier:*(void *)(a1 + 40) error:v4];
}

+ (id)currentExtensionsObservable
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke;
  v4[3] = &__block_descriptor_40_e38____CNCancelable__16__0___CNObserver__8l;
  v4[4] = a1;
  v2 = [MEMORY[0x263F33608] observableWithBlock:v4];

  return v2;
}

id __45__CNDDonorLoader_currentExtensionsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F33570]);
  v5 = [*(id *)(a1 + 32) extensionAttributes];
  objc_initWeak(&location, v4);
  id v6 = (void *)MEMORY[0x263F08800];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_2;
  v9[3] = &unk_2641FC378;
  objc_copyWeak(&v11, &location);
  id v7 = v3;
  id v10 = v7;
  [v6 extensionsWithMatchingAttributes:v5 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v4;
}

void __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v15 = v6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_3;
          v21[3] = &unk_2641FC328;
          v21[4] = v13;
          id v22 = *(id *)(a1 + 32);
          [WeakRetained performBlock:v21];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_4;
    v19[3] = &unk_2641FC350;
    id v14 = &v20;
    id v20 = *(id *)(a1 + 32);
    [WeakRetained performBlock:v19];
    id v6 = v15;
  }
  else
  {
    NSLog(&cfstr_ExtensionDisco.isa, v6);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_5;
    v16[3] = &unk_2641FC328;
    id v14 = &v17;
    id v17 = *(id *)(a1 + 32);
    id v18 = v6;
    [WeakRetained performBlock:v16];
  }
}

void __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_3(uint64_t a1)
{
  v2 = [[CNDDonorExtension alloc] initWithExtension:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) observerDidReceiveResult:v2];
}

uint64_t __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
}

+ (id)continuousExtensionsObservable
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke;
  v4[3] = &__block_descriptor_40_e38____CNCancelable__16__0___CNObserver__8l;
  v4[4] = a1;
  v2 = [MEMORY[0x263F33608] observableWithBlock:v4];

  return v2;
}

id __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F33570]);
  id v5 = [*(id *)(a1 + 32) extensionAttributes];
  objc_initWeak(&location, v4);
  id v6 = (void *)MEMORY[0x263F08800];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_2;
  v13[3] = &unk_2641FC378;
  objc_copyWeak(&v15, &location);
  id v7 = v3;
  id v14 = v7;
  id v8 = [v6 beginMatchingExtensionsWithAttributes:v5 completion:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_6;
  v11[3] = &unk_2641FC350;
  id v9 = v8;
  id v12 = v9;
  [v4 addCancelationBlock:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v4;
}

void __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v8 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_1);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_4;
    v13[3] = &unk_2641FC328;
    id v14 = *(id *)(a1 + 32);
    id v15 = v8;
    id v9 = v8;
    [WeakRetained performBlock:v13];
  }
  else
  {
    NSLog(&cfstr_ExtensionDisco.isa, v6);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_5;
    v10[3] = &unk_2641FC328;
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    [WeakRetained performBlock:v10];

    id v9 = v11;
  }
}

CNDDonorExtension *__48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNDDonorExtension alloc] initWithExtension:v2];

  return v3;
}

uint64_t __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
}

uint64_t __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
}

uint64_t __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_6(uint64_t a1)
{
  return [MEMORY[0x263F08800] endMatchingExtensions:*(void *)(a1 + 32)];
}

+ (id)extensionAttributes
{
  return &unk_26C4FAF38;
}

- (CNDonationLoggerProvider)loggerProvider
{
  return self->_loggerProvider;
}

- (void).cxx_destruct
{
}

@end