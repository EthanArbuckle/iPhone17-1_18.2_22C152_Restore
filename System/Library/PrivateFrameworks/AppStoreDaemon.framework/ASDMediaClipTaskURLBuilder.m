@interface ASDMediaClipTaskURLBuilder
- (id)build;
- (id)initWithBundleID:(void *)a3 bag:;
- (void)setExternalVersionID:(uint64_t)a1;
@end

@implementation ASDMediaClipTaskURLBuilder

- (id)initWithBundleID:(void *)a3 bag:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)ASDMediaClipTaskURLBuilder;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)build
{
  v1 = a1;
  v19[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1[2] URLForKey:0x1EEC3BAF8];
    v3 = [v2 valuePromise];

    v4 = [v1[2] stringForKey:0x1EEC3BB38];
    v5 = [v4 valuePromise];

    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __42__ASDMediaClipTaskURLBuilder__pathPromise__block_invoke;
    v17 = &unk_1E58B3A00;
    v18 = v1;
    id v6 = [v5 thenWithBlock:&v14];

    id v7 = [v1[2] stringForKey:0x1EEC3BB18];
    v8 = [v7 valuePromise];

    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __43__ASDMediaClipTaskURLBuilder__queryPromise__block_invoke;
    v17 = &unk_1E58B3A00;
    v18 = v1;
    v9 = [v8 thenWithBlock:&v14];

    objc_super v10 = (void *)MEMORY[0x1E4F4DDD0];
    v19[0] = v3;
    v19[1] = v6;
    v19[2] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    v12 = [v10 promiseWithAll:v11];

    v1 = [v12 thenWithBlock:&__block_literal_global_7];
  }
  return v1;
}

id __35__ASDMediaClipTaskURLBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectAtIndexedSubscript:0];
  v4 = [v2 objectAtIndexedSubscript:1];
  v5 = [v2 objectAtIndexedSubscript:2];

  id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
  id v7 = [v3 absoluteString];
  [v6 setHost:v7];

  [v6 setPath:v4];
  [v6 setQueryItems:v5];
  [v6 setScheme:@"https"];
  v8 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v6];

  return v8;
}

id __42__ASDMediaClipTaskURLBuilder__pathPromise__block_invoke(uint64_t a1, void *a2)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v26[0] = @"{bundleId}";
  v26[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v27[0] = v5;
  v25[0] = @"{storefront}";
  v25[1] = v3;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v27[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    v12 = @"/v1/catalog/{storefront}/app-clips/{bundleId}";
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v12;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", 0, (void)v20);
        v17 = [v15 objectAtIndexedSubscript:1];
        v12 = [(__CFString *)v14 stringByReplacingOccurrencesOfString:v16 withString:v17];

        ++v13;
        uint64_t v14 = v12;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    v12 = @"/v1/catalog/{storefront}/app-clips/{bundleId}";
  }

  v18 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v12];

  return v18;
}

id __43__ASDMediaClipTaskURLBuilder__queryPromise__block_invoke(uint64_t a1, void *a2)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"l" value:v4];

  [v5 addObject:v6];
  if (*(void *)(a1 + 32))
  {
    int v7 = [MEMORY[0x1E4F4DC48] deviceIsiPad];
    id v8 = (id *)MEMORY[0x1E4F4DB08];
    if (v7) {
      id v8 = (id *)MEMORY[0x1E4F4DB00];
    }
    id v9 = *v8;
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"platform" value:v9];
      [v5 addObject:v10];
    }
  }
  else
  {
    id v9 = 0;
  }
  v23[0] = @"variantsInfo";
  v23[1] = @"verifiedAssociatedDomains";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v12 = [v11 componentsJoinedByString:@","];
  uint64_t v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"extend" value:v12];
  [v5 addObject:v13];

  uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F290C8];
    v16 = [v14 stringValue];
    v17 = [v15 queryItemWithName:@"externalVersionId" value:v16];
    [v5 addObject:v17];

    v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"fields" value:@"variantsInfo"];
    [v5 addObject:v18];
  }
  v19 = [MEMORY[0x1E4F290C8] queryItemWithName:@"relate[app-clips]" value:@"app"];
  [v5 addObject:v19];

  long long v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"include[app-clips]" value:@"app-genres"];
  [v5 addObject:v20];

  long long v21 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v5];

  return v21;
}

- (void)setExternalVersionID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end