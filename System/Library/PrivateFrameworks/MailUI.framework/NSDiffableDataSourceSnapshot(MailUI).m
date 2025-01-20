@interface NSDiffableDataSourceSnapshot(MailUI)
+ (id)log;
- (id)mui_validItemIDFromExistingItemID:()MailUI updateReason:;
- (id)mui_validItemIDsFromExistingItemIDs:()MailUI section:updateReason:;
- (id)mui_validItemIDsFromExistingItemIDs:()MailUI updateReason:;
- (id)mui_validItemIDsFromIndexPaths:()MailUI;
- (id)mui_validSectionIdentifiers;
@end

@implementation NSDiffableDataSourceSnapshot(MailUI)

- (id)mui_validSectionIdentifiers
{
  v2 = [a1 sectionIdentifiers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__NSDiffableDataSourceSnapshot_MailUI__mui_validSectionIdentifiers__block_invoke;
  v5[3] = &unk_1E6D13808;
  v5[4] = a1;
  v3 = objc_msgSend(v2, "ef_filter:", v5);

  return v3;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NSDiffableDataSourceSnapshot_MailUI__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_16 != -1) {
    dispatch_once(&log_onceToken_16, block);
  }
  v1 = (void *)log_log_16;
  return v1;
}

- (id)mui_validItemIDFromExistingItemID:()MailUI updateReason:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [a1 indexOfItemIdentifier:v6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [MEMORY[0x1E4FB1360] log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ : Failed to find existing itemID in snapshot: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (id)mui_validItemIDsFromExistingItemIDs:()MailUI updateReason:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_updateReason___block_invoke;
  v10[3] = &unk_1E6D13790;
  v10[4] = a1;
  id v11 = v6;
  id v7 = v6;
  v8 = objc_msgSend(a3, "ef_compactMap:", v10);

  return v8;
}

- (id)mui_validItemIDsFromExistingItemIDs:()MailUI section:updateReason:
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = a3;
  id v11 = [a1 itemIdentifiersInSectionWithIdentifier:a4];
  id v12 = [v9 setWithArray:v11];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_section_updateReason___block_invoke;
  v17[3] = &unk_1E6D137B8;
  id v18 = v12;
  id v19 = v8;
  id v13 = v8;
  id v14 = v12;
  uint64_t v15 = objc_msgSend(v10, "ef_filter:", v17);

  return v15;
}

- (id)mui_validItemIDsFromIndexPaths:()MailUI
{
  id v4 = a3;
  v5 = [a1 sectionIdentifiers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromIndexPaths___block_invoke;
  v9[3] = &unk_1E6D137E0;
  id v10 = v5;
  id v11 = a1;
  id v6 = v5;
  id v7 = objc_msgSend(v4, "ef_compactMap:", v9);

  return v7;
}

@end