@interface CNContactViewCache
+ (BOOL)isCandidatePolicy:(id)a3 ofContactInCandidateContainerWithType:(int64_t)a4 preferredOverPolicy:(id)a5 ofContactInContainerWithType:(int64_t)a6;
+ (BOOL)shouldIgnorePolicyOfContactInGuarianRestrictedContainer:(id)a3;
- (CNCache)cachedAccounts;
- (CNCache)cachedContactToContainerIDs;
- (CNCache)cachedContainers;
- (CNCache)cachedPolicies;
- (CNCache)cachedTopAccounts;
- (CNContactStore)contactStore;
- (CNContactViewCache)init;
- (id)_accountForContainer:(id)a3;
- (id)_policyForContact:(id)a3;
- (id)_uncachedContainerForContact:(id)a3 inStore:(id)a4;
- (id)accountForContact:(id)a3;
- (id)accountForContainer:(id)a3;
- (id)accountForContainer:(id)a3 shouldUseTopLevelAccount:(BOOL)a4;
- (id)bestPolicyForContact:(id)a3;
- (id)containerForContact:(id)a3;
- (id)containerIdentifierForContact:(id)a3;
- (id)defaultContainerPolicy;
- (id)nts_lazyContactStore;
- (id)policyForContact:(id)a3;
- (id)policyForContainer:(id)a3;
- (id)policyForContainerWithIdentifier:(id)a3;
- (id)policyForDefaultContainer;
- (id)predicateForContainerForContact:(id)a3 inStore:(id)a4;
- (void)resetCache;
- (void)setCachedAccounts:(id)a3;
- (void)setCachedContactToContainerIDs:(id)a3;
- (void)setCachedContainers:(id)a3;
- (void)setCachedPolicies:(id)a3;
- (void)setCachedTopAccounts:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNContactViewCache

- (CNContactViewCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactViewCache;
  v2 = [(CNContactViewCache *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTopAccounts, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_cachedPolicies, 0);
  objc_storeStrong((id *)&self->_cachedContainers, 0);
  objc_storeStrong((id *)&self->_cachedContactToContainerIDs, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setCachedTopAccounts:(id)a3
{
}

- (void)setCachedAccounts:(id)a3
{
}

- (void)setCachedPolicies:(id)a3
{
}

- (void)setCachedContainers:(id)a3
{
}

- (void)setCachedContactToContainerIDs:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (id)_accountForContainer:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F1B8A8];
    v5 = [a3 identifier];
    objc_super v6 = [v4 predicateForAccountForContainerWithIdentifier:v5];

    v7 = [(CNContactViewCache *)self contactStore];
    v8 = [v7 accountsMatchingPredicate:v6 error:0];

    v9 = [v8 firstObject];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)bestPolicyForContact:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isUnified])
  {
    v5 = [v4 linkedContacts];
  }
  else
  {
    v27[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7)
  {

    goto LABEL_22;
  }
  uint64_t v8 = v7;
  id v20 = v4;
  id obj = v6;
  v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = -[CNContactViewCache containerForContact:](self, "containerForContact:", *(void *)(*((void *)&v22 + 1) + 8 * i), v20);
      if (v13)
      {
        v14 = [(CNContactViewCache *)self contactStore];
        v15 = [v13 identifier];
        v16 = [v14 policyForContainerWithIdentifier:v15 error:0];

        if (v16)
        {
          int v17 = objc_msgSend((id)objc_opt_class(), "isCandidatePolicy:ofContactInCandidateContainerWithType:preferredOverPolicy:ofContactInContainerWithType:", v16, objc_msgSend(v13, "type"), v9, v10);
          if ([(id)objc_opt_class() shouldIgnorePolicyOfContactInGuarianRestrictedContainer:v13])
          {
            id v18 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
            uint64_t v10 = 3;
            goto LABEL_15;
          }
          if (v17)
          {
            uint64_t v10 = [v13 type];
            id v18 = v16;
LABEL_15:

            v9 = v18;
          }
        }
      }
    }
    id v6 = obj;
    uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v8);

  id v4 = v20;
  if (!v9)
  {
LABEL_22:
    v9 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
  }

  return v9;
}

- (id)defaultContainerPolicy
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1BA68] sharedPermissivePolicy];
  id v4 = [(CNContactViewCache *)self contactStore];
  v5 = [v4 defaultContainerIdentifier];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v6 = v3;
  }
  else
  {
    uint64_t v7 = [(CNContactViewCache *)self contactStore];
    uint64_t v8 = [v7 policyForContainerWithIdentifier:v5 error:0];

    if (v8)
    {
      v9 = [(CNContactViewCache *)self contactStore];
      uint64_t v10 = (void *)MEMORY[0x1E4F1B9B0];
      v17[0] = v5;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      v12 = [v10 predicateForContainersWithIdentifiers:v11];
      v13 = [v9 containersMatchingPredicate:v12 error:0];
      v14 = [v13 firstObject];

      if ([(id)objc_opt_class() shouldIgnorePolicyOfContactInGuarianRestrictedContainer:v14])v15 = v3; {
      else
      }
        v15 = v8;
      id v6 = v15;
    }
    else
    {
      id v6 = v3;
    }
  }

  return v6;
}

- (id)_policyForContact:(id)a3
{
  if (a3) {
    -[CNContactViewCache bestPolicyForContact:](self, "bestPolicyForContact:");
  }
  else {
  v3 = [(CNContactViewCache *)self defaultContainerPolicy];
  }

  return v3;
}

- (id)_uncachedContainerForContact:(id)a3 inStore:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CNContactViewCache *)self predicateForContainerForContact:a3 inStore:v6];
  if (v7)
  {
    uint64_t v8 = [v6 containersMatchingPredicate:v7 error:0];
    v9 = [v8 firstObject];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }

  return v9;
}

- (id)predicateForContainerForContact:(id)a3 inStore:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasBeenPersisted])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1B9B0];
    uint64_t v8 = [v5 identifier];
    v9 = [v7 predicateForContainerOfContactWithIdentifier:v8];
  }
  else
  {
    uint64_t v10 = [v6 defaultContainerIdentifier];
    uint64_t v11 = (void *)v10;
    if (v10)
    {
      v12 = (void *)MEMORY[0x1E4F1B9B0];
      v15[0] = v10;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      v9 = [v12 predicateForContainersWithIdentifiers:v13];
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)containerForContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CNContactViewCache *)self contactStore];
    id v6 = [(CNContactViewCache *)self containerIdentifierForContact:v4];
    if (v6)
    {
      uint64_t v7 = [(CNContactViewCache *)self cachedContainers];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __42__CNContactViewCache_containerForContact___block_invoke;
      v11[3] = &unk_1E5499D20;
      v11[4] = self;
      id v12 = v4;
      id v13 = v5;
      uint64_t v8 = [v7 objectForKey:v6 onCacheMiss:v11];

      v9 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __42__CNContactViewCache_containerForContact___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _uncachedContainerForContact:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48)];
  v2 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();

  return v2;
}

- (CNCache)cachedTopAccounts
{
  cachedTopAccounts = self->_cachedTopAccounts;
  if (!cachedTopAccounts)
  {
    id v4 = [MEMORY[0x1E4F5A360] cache];
    id v5 = self->_cachedTopAccounts;
    self->_cachedTopAccounts = v4;

    cachedTopAccounts = self->_cachedTopAccounts;
  }

  return cachedTopAccounts;
}

- (CNCache)cachedAccounts
{
  cachedAccounts = self->_cachedAccounts;
  if (!cachedAccounts)
  {
    id v4 = [MEMORY[0x1E4F5A360] cache];
    id v5 = self->_cachedAccounts;
    self->_cachedAccounts = v4;

    cachedAccounts = self->_cachedAccounts;
  }

  return cachedAccounts;
}

- (CNCache)cachedPolicies
{
  cachedPolicies = self->_cachedPolicies;
  if (!cachedPolicies)
  {
    id v4 = [MEMORY[0x1E4F5A360] cache];
    id v5 = self->_cachedPolicies;
    self->_cachedPolicies = v4;

    cachedPolicies = self->_cachedPolicies;
  }

  return cachedPolicies;
}

- (CNCache)cachedContainers
{
  cachedContainers = self->_cachedContainers;
  if (!cachedContainers)
  {
    id v4 = [MEMORY[0x1E4F5A360] cache];
    id v5 = self->_cachedContainers;
    self->_cachedContainers = v4;

    cachedContainers = self->_cachedContainers;
  }

  return cachedContainers;
}

- (CNCache)cachedContactToContainerIDs
{
  cachedContactToContainerIDs = self->_cachedContactToContainerIDs;
  if (!cachedContactToContainerIDs)
  {
    id v4 = [MEMORY[0x1E4F5A360] cache];
    id v5 = self->_cachedContactToContainerIDs;
    self->_cachedContactToContainerIDs = v4;

    cachedContactToContainerIDs = self->_cachedContactToContainerIDs;
  }

  return cachedContactToContainerIDs;
}

- (id)containerIdentifierForContact:(id)a3
{
  id v4 = a3;
  if ([v4 hasBeenPersisted])
  {
    id v5 = [(CNContactViewCache *)self cachedContactToContainerIDs];
    id v6 = [v4 identifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__CNContactViewCache_containerIdentifierForContact___block_invoke;
    v14[3] = &unk_1E5499CF8;
    v14[4] = self;
    id v15 = v4;
    uint64_t v7 = [v5 objectForKey:v6 onCacheMiss:v14];
  }
  else
  {
    uint64_t v11 = [(CNContactViewCache *)self contactStore];
    uint64_t v7 = [v11 defaultContainerIdentifier];
  }
  id v12 = (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F5A2B0] + 16))(*MEMORY[0x1E4F5A2B0], v7, v8, v9, v10);

  return v12;
}

id __52__CNContactViewCache_containerIdentifierForContact___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 contactStore];
  id v5 = [v2 _uncachedContainerForContact:v3 inStore:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) cachedContainers];
    uint64_t v7 = [v5 identifier];
    [v6 setObject:v5 forKey:v7];
  }
  uint64_t v8 = *MEMORY[0x1E4F5A2A8];
  uint64_t v9 = [v5 identifier];
  uint64_t v10 = (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  return v10;
}

- (void)resetCache
{
  [(CNContactViewCache *)self setCachedContactToContainerIDs:0];
  [(CNContactViewCache *)self setCachedContainers:0];
  [(CNContactViewCache *)self setCachedPolicies:0];
  [(CNContactViewCache *)self setCachedAccounts:0];

  [(CNContactViewCache *)self setCachedTopAccounts:0];
}

- (id)accountForContainer:(id)a3 shouldUseTopLevelAccount:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4) {
      [(CNContactViewCache *)self cachedTopAccounts];
    }
    else {
    uint64_t v8 = [(CNContactViewCache *)self cachedAccounts];
    }
    uint64_t v9 = [v6 identifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__CNContactViewCache_accountForContainer_shouldUseTopLevelAccount___block_invoke;
    v12[3] = &unk_1E5499CD0;
    v12[4] = self;
    id v13 = v6;
    BOOL v14 = a4;
    uint64_t v10 = [v8 objectForKey:v9 onCacheMiss:v12];

    uint64_t v7 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __67__CNContactViewCache_accountForContainer_shouldUseTopLevelAccount___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _accountForContainer:*(void *)(a1 + 40)];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1B8A8], "_cnui_accountStore");
  id v4 = [v2 externalIdentifierString];
  id v5 = [v3 accountWithIdentifier:v4];

  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = [v5 displayAccount];

    id v5 = (void *)v6;
  }
  uint64_t v7 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();

  return v7;
}

- (id)accountForContainer:(id)a3
{
  return [(CNContactViewCache *)self accountForContainer:a3 shouldUseTopLevelAccount:1];
}

- (id)accountForContact:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CNContactViewCache *)self containerIdentifierForContact:v4];
    if (v5)
    {
      uint64_t v6 = [(CNContactViewCache *)self cachedContainers];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __40__CNContactViewCache_accountForContact___block_invoke;
      int v17 = &unk_1E5499CA8;
      id v18 = self;
      id v19 = v4;
      uint64_t v7 = [v6 objectForKey:v5 onCacheMiss:&v14];

      uint64_t v11 = (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F5A2B0] + 16))(*MEMORY[0x1E4F5A2B0], v7, v8, v9, v10);
      id v12 = -[CNContactViewCache accountForContainer:](self, "accountForContainer:", v11, v14, v15, v16, v17, v18);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id __40__CNContactViewCache_accountForContact___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [v1 contactStore];
  id v4 = [v1 _uncachedContainerForContact:v2 inStore:v3];

  id v5 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();

  return v5;
}

- (id)policyForContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactViewCache *)self cachedPolicies];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__CNContactViewCache_policyForContainerWithIdentifier___block_invoke;
  v13[3] = &unk_1E5499C80;
  v13[4] = self;
  id v14 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 objectForKey:v6 onCacheMiss:v13];

  uint64_t v11 = (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F5A2B0] + 16))(*MEMORY[0x1E4F5A2B0], v7, v8, v9, v10);

  return v11;
}

id __55__CNContactViewCache_policyForContainerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contactStore];
  uint64_t v3 = [v2 policyForContainerWithIdentifier:*(void *)(a1 + 40) error:0];

  id v4 = (*(void (**)(void))(*MEMORY[0x1E4F5A2A8] + 16))();

  return v4;
}

- (id)policyForDefaultContainer
{
  uint64_t v3 = [(CNContactViewCache *)self contactStore];
  id v4 = [v3 defaultContainerIdentifier];
  id v5 = [(CNContactViewCache *)self policyForContainerWithIdentifier:v4];

  return v5;
}

- (id)policyForContainer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    if (v6)
    {
LABEL_3:
      uint64_t v7 = [(CNContactViewCache *)self policyForContainerWithIdentifier:v6];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = [(CNContactViewCache *)self contactStore];
    id v6 = [v8 defaultContainerIdentifier];

    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

- (id)policyForContact:(id)a3
{
  id v4 = a3;
  uint64_t v8 = [(CNContactViewCache *)self containerIdentifierForContact:v4];
  if (v8)
  {
    uint64_t v9 = [(CNContactViewCache *)self cachedPolicies];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__CNContactViewCache_policyForContact___block_invoke;
    v13[3] = &unk_1E5499C80;
    v13[4] = self;
    id v14 = v4;
    uint64_t v10 = [v9 objectForKey:v8 onCacheMiss:v13];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F5A2B0] + 16))(*MEMORY[0x1E4F5A2B0], v10, v5, v6, v7);

  return v11;
}

id __39__CNContactViewCache_policyForContact___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F5A2A8];
  uint64_t v2 = [*(id *)(a1 + 32) _policyForContact:*(void *)(a1 + 40)];
  uint64_t v3 = (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return v3;
}

- (id)nts_lazyContactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (CNContactStore)contactStore
{
  uint64_t v2 = cn_objectResultWithObjectLock();

  return (CNContactStore *)v2;
}

uint64_t __34__CNContactViewCache_contactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactStore");
}

+ (BOOL)isCandidatePolicy:(id)a3 ofContactInCandidateContainerWithType:(int64_t)a4 preferredOverPolicy:(id)a5 ofContactInContainerWithType:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v9 || v10)
  {
    if (isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_token_1 != -1) {
      dispatch_once(&isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_token_1, &__block_literal_global_44025);
    }
    id v13 = (id)isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_object_1;
    if ([v11 isReadonly]) {
      int v14 = [v9 isReadonly] ^ 1;
    }
    else {
      LOBYTE(v14) = 0;
    }
    uint64_t v15 = [NSNumber numberWithInteger:a4];
    unint64_t v16 = [v13 indexOfObject:v15];
    int v17 = [NSNumber numberWithInteger:a6];
    unint64_t v18 = [v13 indexOfObject:v17];

    if (v16 < v18) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v14;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

void __127__CNContactViewCache_isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType___block_invoke()
{
  v0 = (void *)isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_object_1;
  isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_object_1 = (uint64_t)&unk_1ED915B78;
}

+ (BOOL)shouldIgnorePolicyOfContactInGuarianRestrictedContainer:(id)a3
{
  return [a3 isGuardianRestricted];
}

@end