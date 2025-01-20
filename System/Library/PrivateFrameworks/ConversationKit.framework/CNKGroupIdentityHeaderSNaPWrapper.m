@interface CNKGroupIdentityHeaderSNaPWrapper
- (void)configureGroupIdentityHeaderViewController:(id)a3 contact:(id)a4;
- (void)groupIdentityHeaderViewController:(id)a3 didDismissSharedProfileBannerWithUpdatedContact:(id)a4 forAction:(unint64_t)a5;
- (void)groupIdentityHeaderViewController:(id)a3 sharedProfileBannerDidUpdateContact:(id)a4 forAction:(unint64_t)a5;
- (void)handleSharedProfileUpdateForController:(id)a3 contact:(id)a4;
- (void)setOracleUsingController:(id)a3 contact:(id)a4;
@end

@implementation CNKGroupIdentityHeaderSNaPWrapper

- (void)configureGroupIdentityHeaderViewController:(id)a3 contact:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ConversationKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1C2F90000, v8, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Configuring viewController: %@ with contact: %@", (uint8_t *)&v9, 0x16u);
  }

  [v6 setDelegate:self];
  [(CNKGroupIdentityHeaderSNaPWrapper *)self setOracleUsingController:v6 contact:v7];
}

- (void)groupIdentityHeaderViewController:(id)a3 sharedProfileBannerDidUpdateContact:(id)a4 forAction:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  int v9 = ConversationKitLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1C2F90000, v9, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Received sharedProfileBannerDidUpdateContact callback", v10, 2u);
  }

  [(CNKGroupIdentityHeaderSNaPWrapper *)self handleSharedProfileUpdateForController:v8 contact:v7];
}

- (void)groupIdentityHeaderViewController:(id)a3 didDismissSharedProfileBannerWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  int v9 = ConversationKitLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1C2F90000, v9, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Received didDismissSharedProfileBannerWithUpdatedContact callback", v10, 2u);
  }

  [(CNKGroupIdentityHeaderSNaPWrapper *)self handleSharedProfileUpdateForController:v8 contact:v7];
}

- (void)setOracleUsingController:(id)a3 contact:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = ConversationKitLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1C2F90000, v7, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Setting oracle on controller: %@ with contact: %@", (uint8_t *)&v15, 0x16u);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F1BAB8]);
  int v9 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v10 = [v9 contactStore];
  __int16 v11 = (void *)[v8 initWithContact:v6 contactStore:v10];

  id v12 = ConversationKitLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v11 currentNickname];
    v14 = [v11 pendingNickname];
    int v15 = 138412802;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1C2F90000, v12, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Created oracle %@ current nickname %@ pending nickname %@", (uint8_t *)&v15, 0x20u);
  }
  [v5 setSharedProfileStateOracle:v11];
}

- (void)handleSharedProfileUpdateForController:(id)a3 contact:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ConversationKitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1C2F90000, v8, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Handling shared profile update for controller: %@ with contact: %@", buf, 0x16u);
  }

  int v9 = [v6 group];
  uint64_t v10 = [v9 numberOfContacts];

  if (v10 == 1)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1BBC0]);
    id v12 = [v6 group];
    uint64_t v13 = [v12 groupName];
    v14 = [v6 group];
    int v15 = [v14 groupPhoto];
    id v18 = v7;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    __int16 v17 = (void *)[v11 initGroupWithName:v13 photo:v15 contacts:v16];

    [v6 groupIdentityDidUpdate:v17];
    [(CNKGroupIdentityHeaderSNaPWrapper *)self setOracleUsingController:v6 contact:v7];
  }
}

@end