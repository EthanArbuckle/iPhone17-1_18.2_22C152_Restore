@interface NSUserActivity
@end

@implementation NSUserActivity

void __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = INCacheableGetSerializationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke_2;
  block[3] = &unk_1E551DEF0;
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __69__NSUserActivity_INCacheSupport__generateCachePayloadWithCompletion___block_invoke_2(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (v2 && !a1[5])
  {
    v4 = @"userActivityData";
    v5[0] = v2;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __78__NSUserActivity_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__NSUserActivity_IntentsAdditions___setInteraction_donate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  v7 = (void *)MEMORY[0x1E4F28DB0];
  id v12 = 0;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v11 = v12;
  v8[2](v8, v9, v10, v11, 0);
}

void __50__NSUserActivity_IntentsAdditions___setAppIntent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  v7 = (void *)MEMORY[0x1E4F28DB0];
  id v12 = 0;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v11 = v12;
  v8[2](v8, v9, v10, v11, 0);
}

@end