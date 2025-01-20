@interface HUSoftwareLibraryLookupResult
+ (id)_libraryResultForRequests:(id)a3;
+ (id)_storeResultForRequests:(id)a3;
+ (id)resultForAccessories:(id)a3;
+ (id)resultForRequests:(id)a3;
- (HUSoftwareLibraryLookupResult)init;
- (NSDictionary)accessoriesByBundleIDs;
- (NSDictionary)accessoriesByStoreIDs;
- (NSSet)matchedLibraryItems;
- (NSSet)matchedStoreItems;
- (NSSet)unmatchedRequests;
- (void)setAccessoriesByBundleIDs:(id)a3;
- (void)setAccessoriesByStoreIDs:(id)a3;
- (void)setMatchedLibraryItems:(id)a3;
- (void)setMatchedStoreItems:(id)a3;
- (void)setUnmatchedRequests:(id)a3;
@end

@implementation HUSoftwareLibraryLookupResult

- (HUSoftwareLibraryLookupResult)init
{
  v14.receiver = self;
  v14.super_class = (Class)HUSoftwareLibraryLookupResult;
  v2 = [(HUSoftwareLibraryLookupResult *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    matchedLibraryItems = v2->_matchedLibraryItems;
    v2->_matchedLibraryItems = (NSSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionary];
    accessoriesByBundleIDs = v2->_accessoriesByBundleIDs;
    v2->_accessoriesByBundleIDs = (NSDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
    matchedStoreItems = v2->_matchedStoreItems;
    v2->_matchedStoreItems = (NSSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionary];
    accessoriesByStoreIDs = v2->_accessoriesByStoreIDs;
    v2->_accessoriesByStoreIDs = (NSDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    unmatchedRequests = v2->_unmatchedRequests;
    v2->_unmatchedRequests = (NSSet *)v11;
  }
  return v2;
}

+ (id)resultForAccessories:(id)a3
{
  v4 = objc_msgSend(a3, "na_map:", &__block_literal_global_279);
  uint64_t v5 = [a1 resultForRequests:v4];

  return v5;
}

HUSoftwareLibraryLookupRequest *__54__HUSoftwareLibraryLookupResult_resultForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HUSoftwareLibraryLookupRequest alloc] initWithAccessory:v2];

  return v3;
}

+ (id)resultForRequests:(id)a3
{
  v4 = [a1 _libraryResultForRequests:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke;
  v7[3] = &__block_descriptor_40_e49___NAFuture_16__0__HUSoftwareLibraryLookupResult_8l;
  v7[4] = a1;
  uint64_t v5 = [v4 flatMap:v7];

  return v5;
}

id __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 unmatchedRequests];
  v6 = [v4 _storeResultForRequests:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke_2;
  v10[3] = &unk_1E6391A68;
  id v11 = v3;
  id v7 = v3;
  v8 = [v6 flatMap:v10];

  return v8;
}

id __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(HUSoftwareLibraryLookupResult);
  uint64_t v5 = [*(id *)(a1 + 32) matchedLibraryItems];
  [(HUSoftwareLibraryLookupResult *)v4 setMatchedLibraryItems:v5];

  v6 = [*(id *)(a1 + 32) accessoriesByBundleIDs];
  [(HUSoftwareLibraryLookupResult *)v4 setAccessoriesByBundleIDs:v6];

  id v7 = [v3 matchedStoreItems];
  [(HUSoftwareLibraryLookupResult *)v4 setMatchedStoreItems:v7];

  v8 = [v3 accessoriesByStoreIDs];
  [(HUSoftwareLibraryLookupResult *)v4 setAccessoriesByStoreIDs:v8];

  uint64_t v9 = [v3 unmatchedRequests];

  [(HUSoftwareLibraryLookupResult *)v4 setUnmatchedRequests:v9];
  v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v10;
}

+ (id)_libraryResultForRequests:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke;
  v8[3] = &unk_1E6385108;
  id v9 = v3;
  id v5 = v3;
  v6 = [v4 futureWithBlock:v8];

  return v6;
}

void __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a2;
  id v5 = [v3 set];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = *(void **)(a1 + 32);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  objc_super v14 = __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke_2;
  v15 = &unk_1E6391AB0;
  id v16 = v6;
  id v17 = v5;
  id v8 = v5;
  id v9 = v6;
  v10 = objc_msgSend(v7, "na_map:", &v12);
  id v11 = objc_alloc_init(HUSoftwareLibraryLookupResult);
  -[HUSoftwareLibraryLookupResult setMatchedLibraryItems:](v11, "setMatchedLibraryItems:", v10, v12, v13, v14, v15);
  [(HUSoftwareLibraryLookupResult *)v11 setAccessoriesByBundleIDs:v9];
  [(HUSoftwareLibraryLookupResult *)v11 setUnmatchedRequests:v8];
  [v4 finishWithResult:v11];
}

id __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F223B8];
  id v5 = [v3 bundleID];
  v6 = [v4 applicationProxyForIdentifier:v5];

  if (objc_msgSend(v6, "hf_isInstalledForLaunching")
    && ([v3 bundleID], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = [v3 accessory];

    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      v10 = [v3 bundleID];
      id v11 = objc_msgSend(v9, "na_objectForKey:withDefaultValue:", v10, &__block_literal_global_37_0);
      uint64_t v12 = [v3 accessory];
      [v11 addObject:v12];
    }
    id v13 = v6;
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
    id v13 = 0;
  }

  return v13;
}

uint64_t __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke_3()
{
  return [MEMORY[0x1E4F1CA80] set];
}

+ (id)_storeResultForRequests:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_41_2);
    id v5 = (void *)MEMORY[0x1E4F4DBD8];
    v6 = [MEMORY[0x1E4F4DCF0] bagSubProfile];
    id v7 = [MEMORY[0x1E4F4DCF0] bagSubProfileVersion];
    id v8 = [v5 bagForProfile:v6 profileVersion:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F4DCF0]);
    v10 = (void *)[v9 initWithBag:v8 caller:*MEMORY[0x1E4F68508] keyProfile:*MEMORY[0x1E4F4DA88]];
    id v11 = [v4 allObjects];
    uint64_t v12 = [v10 performLookupWithBundleIdentifiers:0 itemIdentifiers:v11];

    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    id v22 = v12;
    id v23 = v3;
    objc_super v14 = (void *)MEMORY[0x1E4F7A0F0];
    id v15 = v12;
    id v16 = objc_msgSend(v14, "mainThreadScheduler", v21, 3221225472, __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_2, &unk_1E6385D90);
    id v17 = [v13 futureWithBlock:&v21 scheduler:v16];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F7A0D8];
    v19 = objc_alloc_init(HUSoftwareLibraryLookupResult);
    id v17 = [v18 futureWithResult:v19];
  }

  return v17;
}

uint64_t __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke(uint64_t a1, void *a2)
{
  return [a2 storeID];
}

void __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_3;
  v6[3] = &unk_1E6391B48;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 addFinishBlock:v6];
}

void __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_4;
  id v16 = &unk_1E6391B20;
  id v17 = v3;
  id v18 = v4;
  id v6 = v4;
  id v7 = v3;
  id v8 = objc_msgSend(v5, "na_filter:", &v13);
  id v9 = objc_alloc_init(HUSoftwareLibraryLookupResult);
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = objc_msgSend(v7, "allItems", v13, v14, v15, v16);
  uint64_t v12 = [v10 setWithArray:v11];
  [(HUSoftwareLibraryLookupResult *)v9 setMatchedStoreItems:v12];

  [(HUSoftwareLibraryLookupResult *)v9 setAccessoriesByStoreIDs:v6];
  [(HUSoftwareLibraryLookupResult *)v9 setUnmatchedRequests:v8];
  [*(id *)(a1 + 40) finishWithResult:v9];
}

BOOL __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_5;
  v13[3] = &unk_1E6391AF8;
  id v5 = v3;
  id v14 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v13);

  id v7 = [v5 accessory];

  if (v7 && v6)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v5 storeID];
    v10 = objc_msgSend(v8, "na_objectForKey:withDefaultValue:", v9, &__block_literal_global_46_2);
    id v11 = [v5 accessory];
    [v10 addObject:v11];
  }
  return v6 == 0;
}

uint64_t __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 iTunesStoreIdentifier];
  id v4 = [v3 stringValue];
  id v5 = [*(id *)(a1 + 32) storeID];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

uint64_t __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_6()
{
  return [MEMORY[0x1E4F1CA80] set];
}

- (NSSet)matchedLibraryItems
{
  return self->_matchedLibraryItems;
}

- (void)setMatchedLibraryItems:(id)a3
{
}

- (NSDictionary)accessoriesByBundleIDs
{
  return self->_accessoriesByBundleIDs;
}

- (void)setAccessoriesByBundleIDs:(id)a3
{
}

- (NSSet)matchedStoreItems
{
  return self->_matchedStoreItems;
}

- (void)setMatchedStoreItems:(id)a3
{
}

- (NSDictionary)accessoriesByStoreIDs
{
  return self->_accessoriesByStoreIDs;
}

- (void)setAccessoriesByStoreIDs:(id)a3
{
}

- (NSSet)unmatchedRequests
{
  return self->_unmatchedRequests;
}

- (void)setUnmatchedRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedRequests, 0);
  objc_storeStrong((id *)&self->_accessoriesByStoreIDs, 0);
  objc_storeStrong((id *)&self->_matchedStoreItems, 0);
  objc_storeStrong((id *)&self->_accessoriesByBundleIDs, 0);

  objc_storeStrong((id *)&self->_matchedLibraryItems, 0);
}

@end