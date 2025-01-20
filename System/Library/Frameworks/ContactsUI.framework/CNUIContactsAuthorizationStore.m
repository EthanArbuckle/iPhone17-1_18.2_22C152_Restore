@interface CNUIContactsAuthorizationStore
- (CNTCCSettings)tccSettings;
- (CNUIContactsAuthorizationStore)init;
- (CNUIContactsAuthorizationStore)initWithBundleIdentifier:(id)a3;
- (CNUICoreRemoteApplicationIconFetching)iconFetcher;
- (NSString)bundleIdentifier;
- (id)contactsAuthorizationModel;
- (id)contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel:(id)a3;
- (id)recordForBundleIdentifier:(id)a3;
- (id)records;
- (id)saveContactsAuthorizationModel:(id)a3;
@end

@implementation CNUIContactsAuthorizationStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFetcher, 0);
  objc_storeStrong((id *)&self->_tccSettings, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (CNUICoreRemoteApplicationIconFetching)iconFetcher
{
  return self->_iconFetcher;
}

- (CNTCCSettings)tccSettings
{
  return self->_tccSettings;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)saveContactsAuthorizationModel:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A408];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke;
  v9[3] = &unk_1E5496AF0;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

uint64_t __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) changedItems];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke_2;
  v4[3] = &unk_1E5496AC8;
  v4[4] = *(void *)(a1 + 40);
  objc_msgSend(v2, "_cn_each:", v4);

  return MEMORY[0x1E4F1CC38];
}

void __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 bundleIdentifier];
  id v8 = [v3 recordForBundleIdentifier:v5];

  uint64_t v6 = [v4 authorization];
  [v8 setAuthorizationStatus:v6];
  v7 = [*(id *)(a1 + 32) tccSettings];
  [v7 saveAuthorizationRecord:v8];
}

- (id)contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A408];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke;
  v9[3] = &unk_1E5496AA0;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

CNUICoreContactsAuthorizationModel *__95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteItems];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke_2;
  v6[3] = &unk_1E5496A78;
  v6[4] = *(void *)(a1 + 40);
  v3 = objc_msgSend(v2, "_cn_map:", v6);

  id v4 = [[CNUICoreContactsAuthorizationModel alloc] initWithItems:v3];

  return v4;
}

id __95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 iconFetcher];
  v5 = [v3 bundleIdentifier];
  id v6 = [v4 iconOfApplictionWithBundleIdentifier:v5];
  v7 = [v3 itemBySettingIcon:v6];

  return v7;
}

- (id)recordForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIContactsAuthorizationStore *)self tccSettings];
  id v6 = [v5 authorizationRecordForBundleIdentifier:v4];

  return v6;
}

- (id)records
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = [(CNUIContactsAuthorizationStore *)self bundleIdentifier];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v3)
  {
    v5 = [(CNUIContactsAuthorizationStore *)self tccSettings];
    uint64_t v6 = [v5 authorizationRecords];
LABEL_5:
    id v8 = (void *)v6;
    goto LABEL_6;
  }
  v7 = [(CNUIContactsAuthorizationStore *)self bundleIdentifier];
  v5 = [(CNUIContactsAuthorizationStore *)self recordForBundleIdentifier:v7];

  if (v5)
  {
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    goto LABEL_5;
  }
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:

  return v8;
}

- (id)contactsAuthorizationModel
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__CNUIContactsAuthorizationStore_contactsAuthorizationModel__block_invoke;
  v4[3] = &unk_1E5496A50;
  v4[4] = self;
  v2 = [MEMORY[0x1E4F5A408] lazyFutureWithBlock:v4];

  return v2;
}

CNUICoreContactsAuthorizationModel *__60__CNUIContactsAuthorizationStore_contactsAuthorizationModel__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) records];
  uint64_t v2 = objc_msgSend(v1, "_cn_map:", &__block_literal_global_2019);

  if (v2) {
    uint64_t v3 = (void *)v2;
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = [[CNUICoreContactsAuthorizationModel alloc] initWithItems:v3];

  return v4;
}

- (CNUIContactsAuthorizationStore)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUIContactsAuthorizationStore;
  uint64_t v6 = [(CNUIContactsAuthorizationStore *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    id v8 = objc_alloc_init(CNUICoreRemoteApplicationIconLoader);
    iconFetcher = v7->_iconFetcher;
    v7->_iconFetcher = (CNUICoreRemoteApplicationIconFetching *)v8;

    uint64_t v10 = [MEMORY[0x1E4F5A528] defaultTCC];
    tccSettings = v7->_tccSettings;
    v7->_tccSettings = (CNTCCSettings *)v10;

    v12 = v7;
  }

  return v7;
}

- (CNUIContactsAuthorizationStore)init
{
  uint64_t v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end