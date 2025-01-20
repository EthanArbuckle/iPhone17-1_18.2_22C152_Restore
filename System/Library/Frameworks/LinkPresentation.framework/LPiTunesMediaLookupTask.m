@interface LPiTunesMediaLookupTask
- (LPiTunesMediaLookupTask)init;
- (LPiTunesMediaLookupTask)initWithBundleIdentifier:(id)a3;
- (LPiTunesMediaLookupTask)initWithIdentifier:(id)a3 storefrontCountryCode:(id)a4;
- (id)_compileQueryParametersWithBundleIds:(id)a3 itemIds:(id)a4;
- (id)callerID;
- (id)sharedBag;
- (void)start:(id)a3;
@end

@implementation LPiTunesMediaLookupTask

- (id)sharedBag
{
  if (sharedBag_onceToken != -1) {
    dispatch_once(&sharedBag_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedBag_bag;

  return v2;
}

void __36__LPiTunesMediaLookupTask_sharedBag__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F4DBE0];
  v1 = [MEMORY[0x1E4F4DCF0] bagKeySet];
  [v0 registerBagKeySet:v1 forProfile:@"AppStore" profileVersion:@"1"];

  uint64_t v2 = [MEMORY[0x1E4F4DBD8] bagForProfile:@"AppStore" profileVersion:@"1"];
  v3 = (void *)sharedBag_bag;
  sharedBag_bag = v2;
}

- (id)callerID
{
  if (callerID_onceToken != -1) {
    dispatch_once(&callerID_onceToken, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)callerID_callerID;

  return v2;
}

void __35__LPiTunesMediaLookupTask_callerID__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  uint64_t v2 = (void *)callerID_callerID;
  callerID_callerID = v1;

  if (![(id)callerID_callerID length])
  {
    uint64_t v3 = [NSString stringWithUTF8String:getprogname()];
    v4 = (void *)callerID_callerID;
    callerID_callerID = v3;
  }
}

- (LPiTunesMediaLookupTask)init
{
  uint64_t v3 = [MEMORY[0x1E4F4DDC8] currentProcess];
  [v3 setAccountMediaType:*MEMORY[0x1E4F4D9E8]];
  v4 = [(LPiTunesMediaLookupTask *)self sharedBag];
  v5 = [(LPiTunesMediaLookupTask *)self callerID];
  uint64_t v6 = *MEMORY[0x1E4F4DA90];
  v10.receiver = self;
  v10.super_class = (Class)LPiTunesMediaLookupTask;
  v7 = [(AMSLookup *)&v10 initWithBag:v4 caller:v5 keyProfile:v6];

  if (v7)
  {
    [(AMSLookup *)v7 setPlatform:@"web"];
    [(AMSLookup *)v7 setClientInfo:v3];
    v8 = v7;
  }

  return v7;
}

- (LPiTunesMediaLookupTask)initWithIdentifier:(id)a3 storefrontCountryCode:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(LPiTunesMediaLookupTask *)self init];
  if (v8)
  {
    v13[0] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_storefrontCountryCode, a4);
    v11 = v8;
  }

  return v8;
}

- (LPiTunesMediaLookupTask)initWithBundleIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(LPiTunesMediaLookupTask *)self init];
  if (v5)
  {
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)_compileQueryParametersWithBundleIds:(id)a3 itemIds:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)LPiTunesMediaLookupTask;
  v5 = [(AMSLookup *)&v9 _compileQueryParametersWithBundleIds:a3 itemIds:a4];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 setObject:@"omni" forKey:@"availability"];
  storefrontCountryCode = self->_storefrontCountryCode;
  if (storefrontCountryCode) {
    [v6 setObject:storefrontCountryCode forKey:@"cc"];
  }

  return v6;
}

- (void)start:(id)a3
{
  id v4 = a3;
  v5 = [(AMSLookup *)self performLookupWithBundleIdentifiers:self->_bundleIdentifiers itemIdentifiers:self->_identifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__LPiTunesMediaLookupTask_start___block_invoke;
  v7[3] = &unk_1E5B059F0;
  id v6 = v4;
  id v8 = v6;
  [v5 addFinishBlock:v7];
}

void __33__LPiTunesMediaLookupTask_start___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [v15 allItems];
    if ([v6 count])
    {
      id v7 = [v6 objectAtIndexedSubscript:0];
      id v8 = v7;
      uint64_t v9 = *(void *)(a1 + 32);
      if (v7)
      {
        objc_super v10 = [v7 itemDictionary];
        id v11 = [v15 valueForProperty:@"meta"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 objectForKeyedSubscript:@"storefront"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [v12 objectForKeyedSubscript:@"id"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v14 = v13;
            }
            else {
              id v14 = 0;
            }
          }
          else
          {
            id v14 = 0;
          }
        }
        else
        {
          id v14 = 0;
        }

        (*(void (**)(uint64_t, void *, id, void))(v9 + 16))(v9, v10, v14, 0);
      }
      else
      {
        (*(void (**)(void, void, void, void))(v9 + 16))(*(void *)(a1 + 32), 0, 0, 0);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end