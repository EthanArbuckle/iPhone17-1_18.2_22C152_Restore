@interface AVTAvatarRecordRendering
+ (id)avatarDescriptorForRecord:(id)a3;
+ (id)avatarForRecord:(id)a3;
+ (id)avatarForRecord:(id)a3 usageIntent:(unint64_t)a4;
+ (id)memojiDescriptorForRecord:(id)a3;
+ (id)memojiForRecord:(id)a3;
+ (id)memojiForRecord:(id)a3 usageIntent:(unint64_t)a4;
+ (void)_castRecord:(id)a3 andDoRecordHandlingBlock:(id)a4 puppetHandlingBlock:(id)a5;
+ (void)preloadAllAvatarsWithStore:(id)a3 completionHandler:(id)a4;
+ (void)preloadAllAvatarsWithStore:(id)a3 environment:(id)a4 completionHandler:(id)a5;
+ (void)preloadAvatarsWithFetchRequests:(id)a3 store:(id)a4 environment:(id)a5 completionHandler:(id)a6;
+ (void)preloadAvatarsWithIdentifiers:(id)a3 store:(id)a4 completionHandler:(id)a5;
+ (void)preloadAvatarsWithIdentifiers:(id)a3 store:(id)a4 environment:(id)a5 completionHandler:(id)a6;
@end

@implementation AVTAvatarRecordRendering

+ (id)memojiDescriptorForRecord:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x263F296A0];
    v4 = [a3 avatarData];
    id v11 = 0;
    v5 = [v3 descriptorWithDataRepresentation:v4 error:&v11];
    id v6 = v11;

    if (!v5)
    {
      v7 = (void *)MEMORY[0x263EFF940];
      uint64_t v8 = *MEMORY[0x263EFF498];
      v9 = [v6 description];
      [v7 raise:v8, @"Can't decode Memoji descriptor! Error: %@", v9 format];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)avatarDescriptorForRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__1;
    v13 = __Block_byref_object_dispose__1;
    id v14 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke;
    v8[3] = &unk_2647C35E0;
    v8[4] = &v9;
    v8[5] = a1;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke_2;
    v7[3] = &unk_2647C3608;
    v7[4] = &v9;
    [a1 _castRecord:v4 andDoRecordHandlingBlock:v8 puppetHandlingBlock:v7];
    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a1 + 40) memojiDescriptorForRecord:a2];

  return MEMORY[0x270F9A758]();
}

void __54__AVTAvatarRecordRendering_avatarDescriptorForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F29648];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v9 = [v4 puppetName];

  uint64_t v6 = [v5 initWithName:v9];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (id)avatarForRecord:(id)a3
{
  return (id)[a1 avatarForRecord:a3 usageIntent:0];
}

+ (id)avatarForRecord:(id)a3 usageIntent:(unint64_t)a4
{
  if (a3)
  {
    id v5 = objc_msgSend(a1, "avatarDescriptorForRecord:");
    uint64_t v6 = [MEMORY[0x263F29650] avatarWithDescriptor:v5 usageIntent:a4 error:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)memojiForRecord:(id)a3
{
  return (id)[a1 memojiForRecord:a3 usageIntent:0];
}

+ (id)memojiForRecord:(id)a3 usageIntent:(unint64_t)a4
{
  id v4 = [a1 avatarForRecord:a3 usageIntent:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v4 format];
  }

  return v4;
}

+ (void)_castRecord:(id)a3 andDoRecordHandlingBlock:(id)a4 puppetHandlingBlock:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, id))a4;
  id v9 = (void (**)(id, id))a5;
  if (([v7 conformsToProtocol:&unk_26DA9C858] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v7 format];
  }
  id v11 = v7;
  if (![v11 isPuppet])
  {
    objc_opt_class();
    v10 = v8;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_7:
  }
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v11 format];
LABEL_8:
  v10[2](v10, v11);
}

+ (void)preloadAvatarsWithIdentifiers:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[AVTCoreEnvironment defaultEnvironment];
  [a1 preloadAvatarsWithIdentifiers:v10 store:v9 environment:v11 completionHandler:v8];
}

+ (void)preloadAllAvatarsWithStore:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AVTCoreEnvironment defaultEnvironment];
  [a1 preloadAllAvatarsWithStore:v7 environment:v8 completionHandler:v6];
}

+ (void)preloadAvatarsWithIdentifiers:(id)a3 store:(id)a4 environment:(id)a5 completionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = +[AVTAvatarFetchRequest requestForAvatarWithIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * v18)];
        [v13 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  [a1 preloadAvatarsWithFetchRequests:v13 store:v10 environment:v11 completionHandler:v12];
}

+ (void)preloadAllAvatarsWithStore:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[AVTAvatarFetchRequest requestForAllAvatars];
  v13[0] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [a1 preloadAvatarsWithFetchRequests:v12 store:v10 environment:v9 completionHandler:v8];
}

+ (void)preloadAvatarsWithFetchRequests:(id)a3 store:(id)a4 environment:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 backgroundQueue];
  uint64_t v15 = [v12 logger];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __96__AVTAvatarRecordRendering_preloadAvatarsWithFetchRequests_store_environment_completionHandler___block_invoke;
  v21[3] = &unk_2647C3630;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v15;
  id v26 = v13;
  id v27 = a1;
  id v16 = v13;
  id v17 = v15;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v14, v21);
}

uint64_t __96__AVTAvatarRecordRendering_preloadAvatarsWithFetchRequests_store_environment_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v34;
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v5 = 0;
      uint64_t v23 = v3;
      do
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v33 + 1) + 8 * v5);
        id v7 = *(void **)(a1 + 40);
        id v32 = 0;
        id v8 = objc_msgSend(v7, "avatarsForFetchRequest:error:", v6, &v32, v22);
        id v9 = v32;
        if (v8)
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            id v25 = v9;
            id v26 = v8;
            uint64_t v27 = v5;
            uint64_t v13 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                id v16 = (void *)MEMORY[0x22A65FE90]();
                id v17 = [*(id *)(a1 + 72) avatarForRecord:v15];
                id v18 = *(void **)(a1 + 56);
                id v19 = [v15 identifier];
                [v18 logAvatarPreloadBeginForIdentifier:v19];

                [MEMORY[0x263F29650] preloadAvatar:v17];
                [*(id *)(a1 + 56) logAvatarPreloadEnd];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
            }
            while (v12);
            uint64_t v4 = v22;
            uint64_t v3 = v23;
            id v8 = v26;
            uint64_t v5 = v27;
            id v9 = v25;
          }
        }
        else
        {
          id v10 = [*(id *)(a1 + 48) logger];
          id v20 = [v9 description];
          [v10 logErrorFetchingRecords:v20];
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v3);
  }

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end