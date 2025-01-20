@interface CNContactStore
@end

@implementation CNContactStore

void __44__CNContactStore_EmailContactUtilities__log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;
}

uint64_t __97__CNContactStore_EmailContactUtilities__em_onScheduler_contactFutureForEmailAddress_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchContactForEmailAddress:*(void *)(a1 + 40) keysToFetch:*(void *)(a1 + 48) allowMatchOnDisplayName:0 createIfNeeded:1 error:a2];
}

id __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke(void *a1, void *a2)
{
  uint64_t v12 = 0;
  v13[0] = &v12;
  v13[1] = 0x3032000000;
  v13[2] = __Block_byref_object_copy__0;
  v13[3] = __Block_byref_object_dispose__0;
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_11;
  v9[3] = &unk_1E63E2CA0;
  v4 = (void *)a1[4];
  id v3 = a1 + 4;
  v5 = (void *)a1[6];
  v9[4] = a1[5];
  id v10 = v5;
  v11 = &v12;
  v6 = objc_msgSend(v4, "ef_map:", v9);
  v7 = [MEMORY[0x1E4F1B980] log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_cold_1(v3, (uint64_t)v13, v7);
  }

  *a2 = *(id *)(v13[0] + 40);
  _Block_object_dispose(&v12, 8);

  return v6;
}

id __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_11(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  v5 = [v3 _fetchContactForEmailAddress:a2 keysToFetch:v2 allowMatchOnDisplayName:0 createIfNeeded:1 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

void __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_0_1(&dword_1BEFDB000, a2, a3, "Error fetching contacts for email addresses %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end