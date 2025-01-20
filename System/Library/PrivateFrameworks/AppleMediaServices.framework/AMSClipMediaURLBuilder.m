@interface AMSClipMediaURLBuilder
- (AMSBagProtocol)bag;
- (AMSClipMediaURLBuilder)initWithBundleID:(id)a3 bag:(id)a4;
- (NSNumber)externalVersionID;
- (NSString)bundleID;
- (id)_devicePlatform;
- (id)_hostPromise;
- (id)_pathPromise;
- (id)_queryPromise;
- (id)build;
- (void)setBag:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setExternalVersionID:(id)a3;
@end

@implementation AMSClipMediaURLBuilder

- (AMSClipMediaURLBuilder)initWithBundleID:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSClipMediaURLBuilder;
  v9 = [(AMSClipMediaURLBuilder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)build
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v3 = [(AMSClipMediaURLBuilder *)self _hostPromise];
  v4 = [(AMSClipMediaURLBuilder *)self _pathPromise];
  v5 = [(AMSClipMediaURLBuilder *)self _queryPromise];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v7 = +[AMSPromise promiseWithAll:v6];

  id v8 = [v7 thenWithBlock:&__block_literal_global_30];

  return v8;
}

id __31__AMSClipMediaURLBuilder_build__block_invoke(uint64_t a1, void *a2)
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
  id v8 = +[AMSPromise promiseWithResult:v6];

  return v8;
}

- (id)_devicePlatform
{
  BOOL v2 = +[AMSDevice deviceIsiPad];
  v3 = AMSMediaTaskPlatformiPhone;
  if (v2) {
    v3 = AMSMediaTaskPlatformiPad;
  }
  v4 = *v3;
  return v4;
}

- (id)_hostPromise
{
  BOOL v2 = [(AMSClipMediaURLBuilder *)self bag];
  v3 = [v2 URLForKey:@"apps-media-api-host"];

  v4 = [v3 valuePromise];

  return v4;
}

- (id)_pathPromise
{
  v3 = [(AMSClipMediaURLBuilder *)self bag];
  v4 = [v3 stringForKey:@"countryCode"];
  v5 = [v4 valuePromise];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__AMSClipMediaURLBuilder__pathPromise__block_invoke;
  v8[3] = &unk_1E559E640;
  v8[4] = self;
  id v6 = [v5 thenWithBlock:v8];

  return v6;
}

id __38__AMSClipMediaURLBuilder__pathPromise__block_invoke(uint64_t a1, void *a2)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
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
    objc_super v12 = @"/v1/catalog/{storefront}/app-clips/{bundleId}";
    do
    {
      uint64_t v13 = 0;
      v14 = v12;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", 0, (void)v20);
        v17 = [v15 objectAtIndexedSubscript:1];
        objc_super v12 = [(__CFString *)v14 stringByReplacingOccurrencesOfString:v16 withString:v17];

        ++v13;
        v14 = v12;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    objc_super v12 = @"/v1/catalog/{storefront}/app-clips/{bundleId}";
  }

  v18 = +[AMSPromise promiseWithResult:v12];

  return v18;
}

- (id)_queryPromise
{
  id v3 = [(AMSClipMediaURLBuilder *)self bag];
  uint64_t v4 = [v3 stringForKey:@"language-tag"];
  v5 = [v4 valuePromise];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AMSClipMediaURLBuilder__queryPromise__block_invoke;
  v8[3] = &unk_1E559E640;
  v8[4] = self;
  id v6 = [v5 thenWithBlock:v8];

  return v6;
}

id __39__AMSClipMediaURLBuilder__queryPromise__block_invoke(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"l" value:v4];

  [v5 addObject:v6];
  id v7 = [MEMORY[0x1E4F290C8] queryItemWithName:@"relate[app-clips]" value:@"app"];
  [v5 addObject:v7];

  id v8 = [MEMORY[0x1E4F290C8] queryItemWithName:@"include[app-clips]" value:@"app-genres"];
  [v5 addObject:v8];

  uint64_t v9 = [*(id *)(a1 + 32) _devicePlatform];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"platform" value:v9];
    [v5 addObject:v10];
  }
  v21[0] = @"variantsInfo";
  v21[1] = @"verifiedAssociatedDomains";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  objc_super v12 = [v11 componentsJoinedByString:@","];
  uint64_t v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"extend" value:v12];
  [v5 addObject:v13];

  v14 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F290C8];
    v16 = [v14 stringValue];
    v17 = [v15 queryItemWithName:@"externalVersionId" value:v16];
    [v5 addObject:v17];

    v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"fields" value:@"variantsInfo"];
    [v5 addObject:v18];
  }
  v19 = +[AMSPromise promiseWithResult:v5];

  return v19;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end