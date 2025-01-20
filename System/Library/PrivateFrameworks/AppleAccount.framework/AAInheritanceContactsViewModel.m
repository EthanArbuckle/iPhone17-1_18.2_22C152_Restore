@interface AAInheritanceContactsViewModel
- (AAInheritanceContactsViewModel)init;
- (id)_localBenefactors:(id)a3;
- (id)_localBeneficiaries:(id)a3 invitationStatuses:(id)a4;
- (id)_localContact:(id)a3;
- (void)_fetchInvitationStatuses:(id)a3;
- (void)_fetchInvitations:(id)a3;
- (void)fetchBenefactors:(id)a3;
- (void)fetchBeneficiaries:(id)a3;
- (void)fetchSuggestedBeneficiaries:(id)a3;
@end

@implementation AAInheritanceContactsViewModel

- (AAInheritanceContactsViewModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)AAInheritanceContactsViewModel;
  v2 = [(AAInheritanceContactsViewModel *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(AAInheritanceController);
    inheritanceController = v2->_inheritanceController;
    v2->_inheritanceController = v3;

    v5 = objc_alloc_init(AAContactsManager);
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = v5;
  }
  return v2;
}

- (void)fetchBeneficiaries:(id)a3
{
  id v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke;
  v7[3] = &unk_1E5A48D90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AAInheritanceController *)inheritanceController fetchBeneficiariesWithCompletion:v7];
}

void __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_cold_1();
    }
  }
  else if ([v5 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_23;
    v11[3] = &unk_1E5A49D38;
    id v8 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    v11[4] = v10;
    id v12 = v5;
    [v8 _fetchInvitationStatuses:v11];

    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_8:
}

void __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_23(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) _localBeneficiaries:*(void *)(a1 + 40) invitationStatuses:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)fetchBenefactors:(id)a3
{
  id v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke;
  v7[3] = &unk_1E5A48D90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AAInheritanceController *)inheritanceController fetchBenefactorsWithCompletion:v7];
}

void __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = [v5 count];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v10 = [*(id *)(a1 + 32) _localBenefactors:v5];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
    else
    {
      (*(void (**)(void, void))(v9 + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0]);
    }
  }
}

- (void)fetchSuggestedBeneficiaries:(id)a3
{
  id v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke;
  v7[3] = &unk_1E5A48D68;
  id v8 = v4;
  id v6 = v4;
  [(AAInheritanceController *)inheritanceController fetchSuggestedBeneficiariesWithCompletion:v7];
}

void __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (void)_fetchInvitationStatuses:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__AAInheritanceContactsViewModel__fetchInvitationStatuses___block_invoke;
  v8[3] = &unk_1E5A49D60;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(AAInheritanceContactsViewModel *)self _fetchInvitations:v8];
}

void __59__AAInheritanceContactsViewModel__fetchInvitationStatuses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 32);
        id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "status"));
        v11 = [v8 beneficiaryID];
        id v12 = [v11 UUIDString];
        [v9 setObject:v10 forKey:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchInvitations:(id)a3
{
  id v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke;
  v7[3] = &unk_1E5A48D68;
  id v8 = v4;
  id v6 = v4;
  [(AAInheritanceController *)inheritanceController fetchInvitationsWithCompletion:v7];
}

void __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke_cold_1();
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (id)_localBeneficiaries:(id)a3 invitationStatuses:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__AAInheritanceContactsViewModel__localBeneficiaries_invitationStatuses___block_invoke;
  v10[3] = &unk_1E5A49D88;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "aaf_map:", v10);

  return v8;
}

id __73__AAInheritanceContactsViewModel__localBeneficiaries_invitationStatuses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 handle];
  id v6 = [v3 _localContact:v5];

  [v6 setInheritanceContactInfo:v4];
  [v6 setContactType:4];
  id v7 = *(void **)(a1 + 40);
  id v8 = [v4 beneficiaryID];

  id v9 = [v8 UUIDString];
  id v10 = [v7 objectForKeyedSubscript:v9];

  if (v10)
  {
    if ([v10 integerValue] == 4)
    {
      id v11 = 0;
      goto LABEL_7;
    }
    uint64_t v12 = [v10 integerValue];
  }
  else
  {
    uint64_t v12 = -1;
  }
  [v6 setTrustedContactStatus:v12];
  id v11 = v6;
LABEL_7:

  return v11;
}

- (id)_localBenefactors:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AAInheritanceContactsViewModel__localBenefactors___block_invoke;
  v5[3] = &unk_1E5A49DB0;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "aaf_map:", v5);

  return v3;
}

id __52__AAInheritanceContactsViewModel__localBenefactors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == 4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 handle];
    id v4 = [v5 _localContact:v6];

    [v4 setInheritanceContactInfo:v3];
    [v4 setContactType:8];
    id v7 = [v3 accessKey];
    if (v7) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [v4 setTrustedContactStatus:v8];
  }

  return v4;
}

- (id)_localContact:(id)a3
{
  contactsManager = self->_contactsManager;
  id v4 = a3;
  uint64_t v5 = [(AAContactsManager *)contactsManager contactForHandle:v4];
  id v6 = [[AALocalContactInfo alloc] initWithHandle:v4 contact:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsManager, 0);

  objc_storeStrong((id *)&self->_inheritanceController, 0);
}

void __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

void __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A11D8000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
}

@end