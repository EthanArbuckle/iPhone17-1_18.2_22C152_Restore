@interface NSDiffableDataSourceSnapshot
@end

@implementation NSDiffableDataSourceSnapshot

BOOL __67__NSDiffableDataSourceSnapshot_MailUI__mui_validSectionIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) numberOfItemsInSection:a2] > 0;
}

void __43__NSDiffableDataSourceSnapshot_MailUI__log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_16;
  log_log_16 = (uint64_t)v1;
}

uint64_t __89__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_updateReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mui_validItemIDFromExistingItemID:updateReason:", a2, *(void *)(a1 + 40));
}

uint64_t __97__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_section_updateReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  if ((v4 & 1) == 0)
  {
    v5 = [MEMORY[0x1E4FB1360] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ : Failed to find existing itemID in snapshot: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  return v4;
}

id __71__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 section];
  if (v4 >= [*(id *)(a1 + 32) count])
  {
    int v8 = 0;
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "section"));
    uint64_t v6 = [*(id *)(a1 + 40) itemIdentifiersInSectionWithIdentifier:v5];
    uint64_t v7 = [v3 item];
    if (v7 >= [v6 count])
    {
      int v8 = 0;
    }
    else
    {
      int v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v3, "item"));
    }
  }
  return v8;
}

@end