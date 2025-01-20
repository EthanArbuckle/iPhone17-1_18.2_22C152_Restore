@interface MXExtension
@end

@implementation MXExtension

uint64_t __87___MXExtension_MXExtensionRequestHandling__handleRequest_requestDispatcher_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 disconnectExtension];
}

void __104___MXExtension_ridesharing_willBeDepreicatedSoon__startExtensionServiceWithInputItems_begin_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v4 = v5;
  }
}

uint64_t __70___MXExtension_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 completeTransactionWithIntentIdentifier:v3 completion:0];
}

void __75___MXExtension_INIntent__confirmIntent_expectResponseClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (_shouldDeserializeCacheItems) {
    [*(id *)(a1 + 32) _loadCacheItems:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) completeTransactionWithIntentIdentifier:*(void *)(a1 + 48) completion:0];
}

void __74___MXExtension_INIntent__handleIntent_expectResponseClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (_shouldDeserializeCacheItems) {
    [*(id *)(a1 + 32) _loadCacheItems:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) completeTransactionWithIntentIdentifier:*(void *)(a1 + 48) completion:0];
}

void __42___MXExtension_INIntent___loadCacheItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          id v10 = [v9 _identifier];
          if (!v10) {
            goto LABEL_14;
          }
          id v11 = [MEMORY[0x1E4F42D90] mainScreen];
          [v11 scale];
          double v13 = v12;

          v14 = [v9 _imageData];

          if (v14)
          {
            v17 = (void *)MEMORY[0x1E4F42A80];
            v18 = [v9 _imageData];
            v19 = [v17 imageWithData:v18 scale:v13];

            v20 = [*(id *)(a1 + 32) provider];
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke_2;
            v25[3] = &unk_1E54BF350;
            id v26 = v19;
            id v21 = v19;
            [v20 loadImageForKey:v10 withBlock:v25];

LABEL_14:
            goto LABEL_15;
          }
          v15 = [MEMORY[0x1E4F304C8] sharedConnection];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke_3;
          v22[3] = &unk_1E54BF378;
          double v24 = v13;
          v22[4] = *(void *)(a1 + 32);
          id v23 = v10;
          id v16 = v10;
          [v15 loadImageDataAndSizeForImage:v9 reply:v22];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

id __42___MXExtension_INIntent___loadCacheItems___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __42___MXExtension_INIntent___loadCacheItems___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v6 = [a2 _imageData];
    uint64_t v4 = [v5 imageWithData:v6 scale:*(double *)(a1 + 48)];
  }
  v7 = [*(id *)(a1 + 32) provider];
  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke_4;
  v10[3] = &unk_1E54BF350;
  id v11 = v4;
  id v9 = v4;
  [v7 loadImageForKey:v8 withBlock:v10];
}

id __42___MXExtension_INIntent___loadCacheItems___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end