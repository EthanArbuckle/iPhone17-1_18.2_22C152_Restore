@interface EMContactsCache
@end

@implementation EMContactsCache

void __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) addressesCache];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke_2;
  v10[3] = &unk_1E63E2D40;
  id v8 = v6;
  id v11 = v8;
  id v9 = (id)[v7 objectForKey:v5 generator:v10];
}

id __54___EMContactsCache_allContactEmailAddressesWithError___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __62___EMContactsCache_contactsForEmailAddress_keysToFetch_error___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:*(void *)(a1 + 32)];
}

uint64_t __54___EMContactsCache_contactsForName_keysToFetch_error___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:*(void *)(a1 + 32)];
}

id __75___EMContactsCache__contactsForKey_cache_keysToFetch_predicateBlock_error___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v3 = [*(id *)(a1 + 32) store];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 unifiedContactsMatchingPredicate:v2 keysToFetch:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "ef_mapSelector:", sel_identifier);

  return v9;
}

@end