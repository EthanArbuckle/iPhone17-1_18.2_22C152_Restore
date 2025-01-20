@interface CNUIGroupsAndContainersSaveManager
+ (id)log;
- (BOOL)addLinkedContacts:(id)a3 toOriginalContact:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6;
- (BOOL)container:(id)a3 containsNonUnifiedContact:(id)a4 inContactStore:(id)a5;
- (BOOL)deleteContainerWithIdentifier:(id)a3 inStore:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6;
- (BOOL)deleteGroupWithIdentifier:(id)a3 inStore:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6;
- (BOOL)editRequiresAuthorizationForContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5;
- (BOOL)isAuthorizedToAddContact:(id)a3 toContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5;
- (BOOL)isAuthorizedToEditContact:(id)a3 withTargetContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5;
- (BOOL)isAuthorizedToEditContact:(id)a3 withTargetGroupWithIdentifier:(id)a4 ignoresParentalRestrictions:(BOOL)a5;
- (BOOL)isAuthorizedToEditContainer:(id)a3;
- (BOOL)isAuthorizedToEditContainerWithIdentifier:(id)a3;
- (BOOL)isMDMAuthorizedToAddContact:(id)a3 toAccount:(id)a4 withManagedConfiguration:(id)a5;
- (BOOL)removeContact:(id)a3 fromGroup:(id)a4 ignoresGuardianRestrictions:(BOOL)a5;
- (BOOL)removeContact:(id)a3 fromGroups:(id)a4 ignoresGuardianRestrictions:(BOOL)a5;
- (BOOL)updateContainerWithIdentifier:(id)a3 inStore:(id)a4 withNewName:(id)a5 ignoresGuardianRestrictions:(BOOL)a6 issuedRequestIdentifiers:(id)a7;
- (BOOL)updateGroupWithIdentifier:(id)a3 inStore:(id)a4 withNewName:(id)a5 ignoresGuardianRestrictions:(BOOL)a6 issuedRequestIdentifiers:(id)a7;
- (CNContactStore)contactStore;
- (CNContactViewCache)contactViewCache;
- (CNUIEditAuthorizationController)authorizationController;
- (CNUIGroupsAndContainersSaveManager)initWithContactStore:(id)a3;
- (CNUIGroupsAndContainersSaveManager)initWithContactStore:(id)a3 contactViewCache:(id)a4;
- (id)_updateSaveRequest:(id)a3 addContact:(id)a4 toGroupContext:(id)a5 contactsToLink:(id)a6;
- (id)_updateSaveRequest:(id)a3 addContact:(id)a4 toGroups:(id)a5 inContainer:(id)a6 contactParentContainer:(id)a7 contactsToLink:(id)a8;
- (id)acAccountForContainer:(id)a3;
- (id)acAccountForGroupIdentifier:(id)a3;
- (id)accountForContainerIdentifier:(id)a3;
- (id)addContact:(id)a3 toGroup:(id)a4 inContainer:(id)a5 moveWasAuthorized:(BOOL)a6;
- (id)addContact:(id)a3 toGroup:(id)a4 moveWasAuthorized:(BOOL)a5;
- (id)addContact:(id)a3 toGroupIdentifier:(id)a4 inContainerIdentifier:(id)a5 moveWasAuthorized:(BOOL)a6;
- (id)addContact:(id)a3 toGroupWithIdentifier:(id)a4 moveWasAuthorized:(BOOL)a5;
- (id)addContacts:(id)a3 toGroup:(id)a4 inContainer:(id)a5 moveWasAuthorized:(BOOL)a6;
- (id)addContacts:(id)a3 toGroupWithIdentifier:(id)a4 inContainerWithIdentifier:(id)a5 moveWasAuthorized:(BOOL)a6;
- (id)allMDMUnauthorizedAccountsForTargetGroup:(id)a3 withManagedConfiguration:(id)a4;
- (id)authorizationResultBlock;
- (id)containerForContainerIdentifier:(id)a3;
- (id)containerForGroupIdentifier:(id)a3;
- (id)exchangeContactsToDeleteInAccountIdentifier:(id)a3 originalContact:(id)a4;
- (id)groupForGroupIdentifier:(id)a3;
- (id)groupsByContainerDictForContainers:(id)a3 groups:(id)a4;
- (id)linkedContactForContact:(id)a3 inContainer:(id)a4 inContactStore:(id)a5;
- (id)mdmUnauthorizedContactIdentifiersForTargetGroup:(id)a3 withManagedConfiguration:(id)a4;
- (id)parentAccountExternalIdentifiersForContact:(id)a3;
- (id)parentGroupsForContact:(id)a3;
- (id)updateContacts:(id)a3 forGroupContext:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6;
- (void)_updateSaveRequest:(id)a3 removeContact:(id)a4 fromGroups:(id)a5;
- (void)authorizeForViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completionBlock:(id)a6;
- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4;
- (void)setAuthorizationController:(id)a3;
- (void)setAuthorizationResultBlock:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactViewCache:(id)a3;
@end

@implementation CNUIGroupsAndContainersSaveManager

- (CNUIGroupsAndContainersSaveManager)initWithContactStore:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNContactViewCache);
  v6 = [(CNUIGroupsAndContainersSaveManager *)self initWithContactStore:v4 contactViewCache:v5];

  return v6;
}

- (CNUIGroupsAndContainersSaveManager)initWithContactStore:(id)a3 contactViewCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNUIGroupsAndContainersSaveManager;
  v9 = [(CNUIGroupsAndContainersSaveManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    if (!v7)
    {
      id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"parameter ‘contactStore’ must be nonnull" userInfo:0];
      objc_exception_throw(v13);
    }
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_contactViewCache, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationResultBlock, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setAuthorizationResultBlock:(id)a3
{
}

- (id)authorizationResultBlock
{
  return self->_authorizationResultBlock;
}

- (void)setAuthorizationController:(id)a3
{
}

- (CNUIEditAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void)setContactViewCache:(id)a3
{
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (id)allMDMUnauthorizedAccountsForTargetGroup:(id)a3 withManagedConfiguration:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 deviceHasManagementRestrictions])
  {
    id v27 = 0;
    goto LABEL_19;
  }
  id v8 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
  id v32 = 0;
  v9 = [v8 accountsMatchingPredicate:0 error:&v32];
  id v10 = v32;

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    v11 = CNUILogContactList();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [v10 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v35 = v12;
      _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Error fetching accounts: %@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = [v6 identifier];
    v11 = [(CNUIGroupsAndContainersSaveManager *)self acAccountForGroupIdentifier:v13];

    if (v11)
    {
      id v24 = v10;
      id v26 = v6;
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v25 = v9;
      id v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v20 = [v11 identifier];
            v21 = [v19 externalIdentifierString];
            char v22 = [v7 canWriteToAccountWithIdentifier:v20 fromSourceAccountIdentifier:v21];

            if ((v22 & 1) == 0) {
              [v27 addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v16);
      }

      v9 = v25;
      id v6 = v26;
      id v10 = v24;
      goto LABEL_18;
    }
  }
  id v27 = 0;
LABEL_18:

LABEL_19:

  return v27;
}

- (id)mdmUnauthorizedContactIdentifiersForTargetGroup:(id)a3 withManagedConfiguration:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA80] set];
  if (![v7 deviceHasManagementRestrictions]) {
    goto LABEL_46;
  }
  v9 = [(CNUIGroupsAndContainersSaveManager *)self allMDMUnauthorizedAccountsForTargetGroup:v6 withManagedConfiguration:v7];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))()) {
    goto LABEL_45;
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (!v10) {
    goto LABEL_44;
  }
  uint64_t v11 = v10;
  v66 = self;
  v52 = v9;
  id v53 = v7;
  id v54 = v6;
  v12 = 0;
  uint64_t v58 = *(void *)v85;
  uint64_t v13 = *MEMORY[0x1E4F1AE88];
  unint64_t v14 = 0x1E4F1B000uLL;
  uint64_t v61 = *MEMORY[0x1E4F1AE88];
  do
  {
    uint64_t v15 = 0;
    uint64_t v55 = v11;
    do
    {
      if (*(void *)v85 != v58) {
        objc_enumerationMutation(obj);
      }
      uint64_t v60 = v15;
      uint64_t v16 = *(void **)(*((void *)&v84 + 1) + 8 * v15);
      uint64_t v17 = *(void **)(v14 + 2480);
      v18 = [v16 identifier];
      uint64_t v19 = [v17 predicateForContainersInAccountWithIdentifier:v18];

      v20 = [(CNUIGroupsAndContainersSaveManager *)v66 contactStore];
      id v83 = v12;
      v59 = (void *)v19;
      v21 = [v20 containersMatchingPredicate:v19 error:&v83];
      id v22 = v83;

      if (v21)
      {
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v62 = v21;
        uint64_t v67 = [v62 countByEnumeratingWithState:&v79 objects:v91 count:16];
        if (!v67) {
          goto LABEL_38;
        }
        v57 = v21;
        uint64_t v65 = *(void *)v80;
        unint64_t v23 = 0x1E4F1B000uLL;
        unint64_t v24 = 0x1E4F1C000uLL;
        id v25 = v22;
        do
        {
          uint64_t v26 = 0;
          do
          {
            id v27 = v25;
            if (*(void *)v80 != v65) {
              objc_enumerationMutation(v62);
            }
            uint64_t v69 = v26;
            long long v28 = *(void **)(*((void *)&v79 + 1) + 8 * v26);
            long long v29 = *(void **)(v23 + 2296);
            long long v30 = [v28 identifier];
            uint64_t v31 = [v29 predicateForContactsInContainerWithIdentifier:v30];

            id v32 = [(CNUIGroupsAndContainersSaveManager *)v66 contactStore];
            uint64_t v90 = v13;
            v33 = [*(id *)(v24 + 2424) arrayWithObjects:&v90 count:1];
            id v78 = v27;
            v68 = (void *)v31;
            v34 = [v32 unifiedContactsMatchingPredicate:v31 keysToFetch:v33 error:&v78];
            id v25 = v78;

            if (v34)
            {
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              v35 = v34;
              uint64_t v36 = [v35 countByEnumeratingWithState:&v74 objects:v89 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                v63 = v34;
                id v64 = v25;
                uint64_t v38 = *(void *)v75;
                do
                {
                  for (uint64_t i = 0; i != v37; ++i)
                  {
                    if (*(void *)v75 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    v40 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                    v41 = [v40 identifier];
                    [v8 addObject:v41];

                    if ([v40 isUnified])
                    {
                      long long v72 = 0u;
                      long long v73 = 0u;
                      long long v70 = 0u;
                      long long v71 = 0u;
                      v42 = [v40 linkedContacts];
                      uint64_t v43 = [v42 countByEnumeratingWithState:&v70 objects:v88 count:16];
                      if (v43)
                      {
                        uint64_t v44 = v43;
                        uint64_t v45 = *(void *)v71;
                        do
                        {
                          for (uint64_t j = 0; j != v44; ++j)
                          {
                            if (*(void *)v71 != v45) {
                              objc_enumerationMutation(v42);
                            }
                            v47 = [*(id *)(*((void *)&v70 + 1) + 8 * j) identifier];
                            [v8 addObject:v47];
                          }
                          uint64_t v44 = [v42 countByEnumeratingWithState:&v70 objects:v88 count:16];
                        }
                        while (v44);
                      }
                    }
                  }
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v74 objects:v89 count:16];
                }
                while (v37);
                uint64_t v13 = v61;
                unint64_t v23 = 0x1E4F1B000;
                unint64_t v24 = 0x1E4F1C000;
                v34 = v63;
                id v25 = v64;
              }
            }
            else
            {
              v35 = CNUILogContactList();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v48 = [v25 localizedDescription];
                *(_DWORD *)buf = 138412546;
                v93 = v28;
                __int16 v94 = 2112;
                v95 = v48;
                _os_log_error_impl(&dword_18B625000, v35, OS_LOG_TYPE_ERROR, "Error fetching contacts for container: %@ with error: %@", buf, 0x16u);
              }
            }

            uint64_t v26 = v69 + 1;
          }
          while (v69 + 1 != v67);
          uint64_t v67 = [v62 countByEnumeratingWithState:&v79 objects:v91 count:16];
        }
        while (v67);
        v12 = v25;
        uint64_t v11 = v55;
        unint64_t v14 = 0x1E4F1B000;
        v21 = v57;
      }
      else
      {
        v62 = CNUILogContactList();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
LABEL_38:
          v12 = v22;
          goto LABEL_39;
        }
        v12 = v22;
        v49 = [v22 localizedDescription];
        *(_DWORD *)buf = 138412546;
        v93 = v16;
        __int16 v94 = 2112;
        v95 = v49;
        _os_log_error_impl(&dword_18B625000, v62, OS_LOG_TYPE_ERROR, "Error fetching containers for account: %@ with error: %@", buf, 0x16u);
      }
LABEL_39:

      uint64_t v15 = v60 + 1;
    }
    while (v60 + 1 != v11);
    uint64_t v50 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
    uint64_t v11 = v50;
  }
  while (v50);

  id v7 = v53;
  id v6 = v54;
  v9 = v52;
LABEL_44:

LABEL_45:
LABEL_46:

  return v8;
}

- (id)parentAccountExternalIdentifiersForContact:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v4 isUnified])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = objc_msgSend(v4, "linkedContacts", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v12 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
          uint64_t v13 = [v12 containerForContact:v11];

          unint64_t v14 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
          uint64_t v15 = [v14 accountForContainer:v13 shouldUseTopLevelAccount:0];

          uint64_t v16 = [v15 identifier];
          objc_msgSend(v5, "_cn_addNonNilObject:", v16);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v17 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
    v18 = [v17 containerForContact:v4];

    uint64_t v19 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
    v20 = [v19 accountForContainer:v18 shouldUseTopLevelAccount:0];

    v21 = [v20 identifier];
    objc_msgSend(v5, "_cn_addNonNilObject:", v21);
  }

  return v5;
}

- (id)parentGroupsForContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1BA00] predicateForGroupsWithMemberContact:v4 includeAllParentGroups:0];
  id v6 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
  id v12 = 0;
  uint64_t v7 = [v6 groupsMatchingPredicate:v5 error:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Error fetching parent groups for contact:%@, error: %@", buf, 0x16u);
    }
  }

  return v7;
}

- (id)containerForGroupIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1B9B0] predicateForContainerOfGroupWithIdentifier:v4];
    id v6 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
    id v12 = 0;
    uint64_t v7 = [v6 containersMatchingPredicate:v5 error:&v12];
    id v8 = v12;

    if (v7)
    {
      id v9 = [v7 firstObject];
    }
    else
    {
      uint64_t v10 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Error fetching parent container for group identifier:%@, error: %@", buf, 0x16u);
      }

      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)acAccountForContainer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
    id v6 = [v5 accountForContainer:v4 shouldUseTopLevelAccount:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)accountForContainerIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1B8A8], "predicateForAccountForContainerWithIdentifier:");
    id v5 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
    id v6 = [v5 accountsMatchingPredicate:v4 error:0];

    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)acAccountForGroupIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[CNUIGroupsAndContainersSaveManager containerForGroupIdentifier:](self, "containerForGroupIdentifier:");
    if (v4)
    {
      id v5 = [(CNUIGroupsAndContainersSaveManager *)self acAccountForContainer:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)groupForGroupIdentifier:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F1BA00];
    v20[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v8 = [v6 predicateForGroupsWithIdentifiers:v7];

    id v9 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
    id v15 = 0;
    uint64_t v10 = [v9 groupsMatchingPredicate:v8 error:&v15];
    id v11 = v15;

    if (v10)
    {
      id v12 = [v10 firstObject];
    }
    else
    {
      uint64_t v13 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Error fetching group for group identifier:%@, error: %@", buf, 0x16u);
      }

      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)containerForContainerIdentifier:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F1B9B0];
    v20[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v8 = [v6 predicateForContainersWithIdentifiers:v7];

    id v9 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
    id v15 = 0;
    uint64_t v10 = [v9 containersMatchingPredicate:v8 error:&v15];
    id v11 = v15;

    if (v10)
    {
      id v12 = [v10 firstObject];
    }
    else
    {
      uint64_t v13 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Error fetching container for container identifier:%@, error: %@", buf, 0x16u);
      }

      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)groupsByContainerDictForContainers:(id)a3 groups:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v6)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      uint64_t v13 = MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 setObject:v13 forKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v11);
    }
  }
  if (v7)
  {
    id v27 = v7;
    id v28 = v6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          v21 = objc_msgSend(v20, "identifier", v27, v28, (void)v29);
          id v22 = [(CNUIGroupsAndContainersSaveManager *)self containerForGroupIdentifier:v21];

          if (v22)
          {
            long long v23 = [v8 objectForKeyedSubscript:v22];
            uint64_t v37 = v20;
            long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
            long long v25 = [v24 arrayByAddingObjectsFromArray:v23];

            [v8 setObject:v25 forKeyedSubscript:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v17);
    }

    id v7 = v27;
    id v6 = v28;
  }

  return v8;
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  [(CNUIGroupsAndContainersSaveManager *)self setAuthorizationController:0];
  id v6 = [(CNUIGroupsAndContainersSaveManager *)self authorizationResultBlock];

  if (v6)
  {
    id v7 = [(CNUIGroupsAndContainersSaveManager *)self authorizationResultBlock];
    v7[2](v7, a4);

    [(CNUIGroupsAndContainersSaveManager *)self setAuthorizationResultBlock:0];
  }
}

- (void)authorizeForViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v18 = a3;
  id v10 = a4;
  [(CNUIGroupsAndContainersSaveManager *)self setAuthorizationResultBlock:a6];
  uint64_t v11 = [(CNUIGroupsAndContainersSaveManager *)self authorizationController];

  if (!v11)
  {
    uint64_t v12 = objc_alloc_init(CNUIEditAuthorizationController);
    [(CNUIGroupsAndContainersSaveManager *)self setAuthorizationController:v12];

    uint64_t v13 = [(CNUIGroupsAndContainersSaveManager *)self authorizationController];
    [v13 setDelegate:self];

    id v14 = [(CNUIGroupsAndContainersSaveManager *)self authorizationController];
    [v14 setSender:v10];

    id v15 = [(CNUIGroupsAndContainersSaveManager *)self authorizationController];
    [v15 setAnimated:v7];

    uint64_t v16 = [(CNUIGroupsAndContainersSaveManager *)self authorizationController];
    [v16 setGuardedViewController:v18];
  }
  uint64_t v17 = [(CNUIGroupsAndContainersSaveManager *)self authorizationController];
  [v17 presentAuthorizationUI];
}

- (BOOL)isAuthorizedToEditContainer:(id)a3
{
  if (!a3) {
    return 0;
  }
  char v3 = [a3 isGuardianRestricted];
  return v3 & [MEMORY[0x1E4F5A650] isAuthorizationPasscodeEnabledOnDevice] ^ 1;
}

- (BOOL)isAuthorizedToEditContainerWithIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  char v3 = self;
  id v4 = -[CNUIGroupsAndContainersSaveManager containerForContainerIdentifier:](self, "containerForContainerIdentifier:");
  LOBYTE(v3) = [(CNUIGroupsAndContainersSaveManager *)v3 isAuthorizedToEditContainer:v4];

  return (char)v3;
}

- (BOOL)editRequiresAuthorizationForContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F5A650];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  uint64_t v12 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
  uint64_t v13 = (void *)[v11 initWithContact:v10 parentContainer:v9 ignoresParentalRestrictions:v5 linkedParentContainerProvider:v12];

  LOBYTE(v10) = [v13 shouldPromptForPasscodeAuthorization];
  return (char)v10;
}

- (BOOL)isAuthorizedToEditContact:(id)a3 withTargetContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
  id v11 = [v10 containerForContact:v8];

  BOOL v15 = 0;
  if (![(CNUIGroupsAndContainersSaveManager *)self editRequiresAuthorizationForContact:v8 parentContainer:v11 ignoresParentalRestrictions:v5])
  {
    uint64_t v12 = [v11 identifier];
    uint64_t v13 = [v9 identifier];
    char v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) != 0
      || ![(CNUIGroupsAndContainersSaveManager *)self editRequiresAuthorizationForContact:v8 parentContainer:v9 ignoresParentalRestrictions:v5])
    {
      BOOL v15 = 1;
    }
  }

  return v15;
}

- (BOOL)isAuthorizedToEditContact:(id)a3 withTargetGroupWithIdentifier:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = 0;
  if (v8 && a4)
  {
    id v10 = [(CNUIGroupsAndContainersSaveManager *)self containerForGroupIdentifier:a4];
    if (v10) {
      BOOL v9 = [(CNUIGroupsAndContainersSaveManager *)self isAuthorizedToEditContact:v8 withTargetContainer:v10 ignoresParentalRestrictions:v5];
    }
    else {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (BOOL)isMDMAuthorizedToAddContact:(id)a3 toAccount:(id)a4 withManagedConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 deviceHasManagementRestrictions])
  {
    id v11 = [(CNUIGroupsAndContainersSaveManager *)self parentAccountExternalIdentifiersForContact:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __101__CNUIGroupsAndContainersSaveManager_isMDMAuthorizedToAddContact_toAccount_withManagedConfiguration___block_invoke;
    v14[3] = &unk_1E549A6F8;
    id v15 = v10;
    id v16 = v9;
    int v12 = objc_msgSend(v11, "_cn_any:", v14) ^ 1;
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

uint64_t __101__CNUIGroupsAndContainersSaveManager_isMDMAuthorizedToAddContact_toAccount_withManagedConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  char v3 = *(void **)(a1 + 40);
  id v4 = a2;
  BOOL v5 = [v3 identifier];
  LODWORD(v2) = [v2 canWriteToAccountWithIdentifier:v5 fromSourceAccountIdentifier:v4];

  return v2 ^ 1;
}

- (BOOL)isAuthorizedToAddContact:(id)a3 toContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8) {
    goto LABEL_5;
  }
  if (v9) {
    goto LABEL_4;
  }
  id v11 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
  int v12 = [v11 defaultContainerIdentifier];
  id v10 = [(CNUIGroupsAndContainersSaveManager *)self containerForContainerIdentifier:v12];

  if (v10) {
LABEL_4:
  }
    BOOL v13 = [(CNUIGroupsAndContainersSaveManager *)self isAuthorizedToEditContact:v8 withTargetContainer:v10 ignoresParentalRestrictions:v5];
  else {
LABEL_5:
  }
    BOOL v13 = 0;

  return v13;
}

- (BOOL)updateContainerWithIdentifier:(id)a3 inStore:(id)a4 withNewName:(id)a5 ignoresGuardianRestrictions:(BOOL)a6 issuedRequestIdentifiers:(id)a7
{
  BOOL v7 = a6;
  int v12 = (objc_class *)MEMORY[0x1E4F1BAA8];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  [v17 setIgnoresGuardianRestrictions:v7];
  id v18 = [v17 saveRequestIdentifier];
  [v13 addObject:v18];

  id v19 = [(CNUIGroupsAndContainersSaveManager *)self containerForContainerIdentifier:v16];

  v20 = (void *)[v19 mutableCopy];
  [v20 setName:v14];

  LOBYTE(v14) = [v20 updateContainerInStore:v15 saveRequest:v17];
  return (char)v14;
}

- (BOOL)updateGroupWithIdentifier:(id)a3 inStore:(id)a4 withNewName:(id)a5 ignoresGuardianRestrictions:(BOOL)a6 issuedRequestIdentifiers:(id)a7
{
  BOOL v7 = a6;
  int v12 = (objc_class *)MEMORY[0x1E4F1BAA8];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  [v17 setIgnoresGuardianRestrictions:v7];
  id v18 = [v17 saveRequestIdentifier];
  [v13 addObject:v18];

  id v19 = [(CNUIGroupsAndContainersSaveManager *)self groupForGroupIdentifier:v16];

  v20 = (void *)[v19 mutableCopy];
  [v20 setName:v14];

  LOBYTE(v14) = [v20 updateGroupInStore:v15 saveRequest:v17];
  return (char)v14;
}

- (BOOL)deleteContainerWithIdentifier:(id)a3 inStore:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  BOOL v6 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1BAA8];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  [v14 setIgnoresGuardianRestrictions:v6];
  id v15 = [v14 saveRequestIdentifier];
  [v11 addObject:v15];

  id v16 = [(CNUIGroupsAndContainersSaveManager *)self containerForContainerIdentifier:v13];

  id v17 = (void *)[v16 mutableCopy];
  LOBYTE(self) = [v17 deleteContainerInStore:v12 saveRequest:v14];

  return (char)self;
}

- (BOOL)deleteGroupWithIdentifier:(id)a3 inStore:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  BOOL v6 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1BAA8];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  [v14 setIgnoresGuardianRestrictions:v6];
  id v15 = [v14 saveRequestIdentifier];
  [v11 addObject:v15];

  id v16 = [(CNUIGroupsAndContainersSaveManager *)self groupForGroupIdentifier:v13];

  id v17 = (void *)[v16 mutableCopy];
  LOBYTE(self) = [v17 deleteGroupInStore:v12 saveRequest:v14];

  return (char)self;
}

- (void)_updateSaveRequest:(id)a3 removeContact:(id)a4 fromGroups:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  obuint64_t j = a5;
  if (v8)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        uint64_t v12 = 0;
        uint64_t v21 = v10;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
          if (objc_msgSend(v8, "isUnified", v21))
          {
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            id v14 = [v8 linkedContacts];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v24;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v24 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  id v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
                  if (([v19 isSuggested] & 1) == 0)
                  {
                    v20 = (void *)[v19 mutableCopy];
                    [v7 removeMember:v20 fromGroup:v13];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
              }
              while (v16);
            }

            uint64_t v10 = v21;
          }
          else
          {
            [v7 removeMember:v8 fromGroup:v13];
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)removeContact:(id)a3 fromGroups:(id)a4 ignoresGuardianRestrictions:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Failed to remove contact from groups, contact is nil";
      goto LABEL_14;
    }
LABEL_6:
    char v12 = 0;
    goto LABEL_12;
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    uint64_t v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Failed to remove contact from groups, no groups provided";
LABEL_14:
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  uint64_t v10 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v10 setIgnoresGuardianRestrictions:v5];
  uint64_t v13 = (void *)[v8 mutableCopy];
  [(CNUIGroupsAndContainersSaveManager *)self _updateSaveRequest:v10 removeContact:v13 fromGroups:v9];

  id v14 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
  id v18 = 0;
  char v12 = [v14 executeSaveRequest:v10 error:&v18];
  id v15 = v18;

  if ((v12 & 1) == 0)
  {
    uint64_t v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "Failed to remove contact from groups, contact: %@, groups: %@ with error: %@", buf, 0x20u);
    }
  }
LABEL_12:

  return v12;
}

- (BOOL)removeContact:(id)a3 fromGroup:(id)a4 ignoresGuardianRestrictions:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    id v13 = a4;
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = a4;
    a4 = [v9 arrayWithObjects:&v13 count:1];
  }
  BOOL v11 = -[CNUIGroupsAndContainersSaveManager removeContact:fromGroups:ignoresGuardianRestrictions:](self, "removeContact:fromGroups:ignoresGuardianRestrictions:", v8, a4, v5, v13, v14);

  return v11;
}

- (id)exchangeContactsToDeleteInAccountIdentifier:(id)a3 originalContact:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v25 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
  id v9 = [v8 accountForContact:v7];

  id v10 = [v9 identifier];
  int v11 = [v10 isEqualToString:v6];

  if (v11) {
    [v25 addObject:v7];
  }
  if ([v7 isUnified])
  {
    __int16 v23 = v9;
    id v24 = v7;
    char v12 = [v7 linkedContacts];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v18 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
          id v19 = [v18 accountForContact:v17];

          id v20 = [v19 identifier];
          int v21 = [v20 isEqualToString:v6];

          if (v21) {
            [v25 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    id v9 = v23;
    id v7 = v24;
  }

  return v25;
}

- (BOOL)container:(id)a3 containsNonUnifiedContact:(id)a4 inContactStore:(id)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F1B9B0];
  id v9 = a5;
  id v10 = [a4 identifier];
  int v11 = [v8 predicateForContainerOfContactWithIdentifier:v10];
  char v12 = [v9 containersMatchingPredicate:v11 error:0];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__CNUIGroupsAndContainersSaveManager_container_containsNonUnifiedContact_inContactStore___block_invoke;
  v15[3] = &unk_1E54972D0;
  id v16 = v7;
  id v13 = v7;
  LOBYTE(v9) = [v12 indexOfObjectPassingTest:v15] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v9;
}

uint64_t __89__CNUIGroupsAndContainersSaveManager_container_containsNonUnifiedContact_inContactStore___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)linkedContactForContact:(id)a3 inContainer:(id)a4 inContactStore:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = objc_msgSend(a3, "linkedContacts", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([(CNUIGroupsAndContainersSaveManager *)self container:v8 containsNonUnifiedContact:v15 inContactStore:v9])
        {
          id v16 = v15;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)_updateSaveRequest:(id)a3 addContact:(id)a4 toGroups:(id)a5 inContainer:(id)a6 contactParentContainer:(id)a7 contactsToLink:(id)a8
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v59 = a5;
  id v16 = a6;
  id v17 = a7;
  id v60 = a8;
  long long v18 = [v16 identifier];
  long long v19 = [v17 identifier];
  int v20 = [v18 isEqualToString:v19];

  if (![v15 hasBeenPersisted]) {
    goto LABEL_17;
  }
  if (v20)
  {
    id v21 = v15;
    if (!v21)
    {
LABEL_17:
      id v58 = v17;
      if ([v16 type] == 2 && objc_msgSend(v15, "hasBeenPersisted"))
      {
        uint64_t v31 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
        id v32 = v16;
        uint64_t v33 = [v31 accountForContainer:v16];

        long long v34 = [v33 identifier];
        long long v35 = [(CNUIGroupsAndContainersSaveManager *)self exchangeContactsToDeleteInAccountIdentifier:v34 originalContact:v15];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v66 objects:v82 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v38; ++i)
            {
              if (*(void *)v67 != v39) {
                objc_enumerationMutation(v36);
              }
              [v14 deleteContact:*(void *)(*((void *)&v66 + 1) + 8 * i)];
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v66 objects:v82 count:16];
          }
          while (v38);
        }

        id v16 = v32;
      }
      id v41 = objc_alloc_init(MEMORY[0x1E4F1BA78]);
      v42 = [v16 identifier];
      [v41 setContainerIdentifier:v42];

      objc_msgSend(v41, "setIgnoresGuardianRestrictions:", objc_msgSend(v14, "ignoresGuardianRestrictions"));
      uint64_t v43 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
      id v65 = 0;
      uint64_t v44 = [v43 policyWithDescription:v41 error:&v65];
      id v21 = v65;

      if (v44)
      {
        id v30 = +[CNUIContactPolicyValidator contactFromContact:v15 conformingToPolicy:v44 options:5];
        uint64_t v45 = [v16 identifier];
        [v14 addContact:v30 toContainerWithIdentifier:v45];

        v46 = [v15 availableKeyDescriptor];
        long long v75 = v46;
        v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
        v48 = (void *)[v30 copyWithPropertyKeys:v47];
        [v60 addObject:v48];

        id v24 = v59;
        if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
        {
          id v57 = v16;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v49 = v59;
          uint64_t v50 = [v49 countByEnumeratingWithState:&v61 objects:v74 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v62;
            do
            {
              for (uint64_t j = 0; j != v51; ++j)
              {
                if (*(void *)v62 != v52) {
                  objc_enumerationMutation(v49);
                }
                objc_msgSend(v14, "addMember:toGroup:", v30, *(void *)(*((void *)&v61 + 1) + 8 * j), v57);
              }
              uint64_t v51 = [v49 countByEnumeratingWithState:&v61 objects:v74 count:16];
            }
            while (v51);
          }

          id v24 = v59;
          id v16 = v57;
        }
      }
      else
      {
        id v54 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v56 = [v16 identifier];
          *(_DWORD *)buf = 138543874;
          long long v77 = v56;
          __int16 v78 = 2112;
          id v79 = v15;
          __int16 v80 = 2114;
          id v81 = v21;
          _os_log_error_impl(&dword_18B625000, v54, OS_LOG_TYPE_ERROR, "Failed to get policy for container:%{public}@ to add contact:%@, error:%{public}@", buf, 0x20u);
        }
        id v30 = v15;
        id v24 = v59;
      }

      id v17 = v58;
      goto LABEL_41;
    }
  }
  else
  {
    if (![v15 isUnified]) {
      goto LABEL_17;
    }
    id v22 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
    uint64_t v23 = [(CNUIGroupsAndContainersSaveManager *)self linkedContactForContact:v15 inContainer:v16 inContactStore:v22];

    id v21 = (id)[v23 mutableCopy];
    if (!v21) {
      goto LABEL_17;
    }
  }
  id v24 = v59;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v25 = v59;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v70 objects:v83 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v71 != v28) {
            objc_enumerationMutation(v25);
          }
          [v14 addMember:v21 toGroup:*(void *)(*((void *)&v70 + 1) + 8 * k)];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v70 objects:v83 count:16];
      }
      while (v27);
    }

    id v24 = v59;
  }
  id v30 = v15;
LABEL_41:

  return v30;
}

- (id)_updateSaveRequest:(id)a3 addContact:(id)a4 toGroupContext:(id)a5 contactsToLink:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v10 = a4;
  id v11 = a5;
  id v32 = a6;
  id v12 = v10;
  uint64_t v13 = self;
  id v14 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
  uint64_t v31 = [v14 containerForContact:v12];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [v11 addedGroupsByContainerDict];
  uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  id v16 = v12;
  id v17 = v12;
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v35;
    id v17 = v12;
    do
    {
      uint64_t v20 = 0;
      id v21 = v17;
      do
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * v20);
        [v11 addedGroupsByContainerDict];
        id v24 = v23 = v11;
        id v25 = [v24 objectForKeyedSubscript:v22];

        id v11 = v23;
        id v17 = [(CNUIGroupsAndContainersSaveManager *)v13 _updateSaveRequest:v33 addContact:v16 toGroups:v25 inContainer:v22 contactParentContainer:v31 contactsToLink:v32];

        ++v20;
        id v21 = v17;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v18);
  }

  uint64_t v26 = *MEMORY[0x1E4F5A258];
  uint64_t v27 = [v11 removedGroups];
  LOBYTE(v26) = (*(uint64_t (**)(uint64_t, void *))(v26 + 16))(v26, v27);

  if ((v26 & 1) == 0)
  {
    uint64_t v28 = [v11 removedGroups];
    [(CNUIGroupsAndContainersSaveManager *)v13 _updateSaveRequest:v33 removeContact:v16 fromGroups:v28];
  }

  return v17;
}

- (BOOL)addLinkedContacts:(id)a3 toOriginalContact:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    if ([v11 hasBeenPersisted])
    {
      id v14 = v11;
      id v15 = v10;
    }
    else
    {
      if ((unint64_t)[v10 count] < 2)
      {
        id v16 = 0;
        id v14 = 0;
        char v13 = 1;
LABEL_15:

        goto LABEL_16;
      }
      id v14 = [v10 objectAtIndexedSubscript:0];
      [v10 removeObjectAtIndex:0];
    }
    char v13 = 1;
    if (v10 && v14)
    {
      BOOL v29 = a5;
      id v16 = v10;
      if ([v14 isUnified])
      {
        id v17 = [v14 mainStoreLinkedContacts];
        [v16 addObjectsFromArray:v17];
      }
      else
      {
        [v16 addObject:v14];
      }
      uint64_t v18 = [(CNUIGroupsAndContainersSaveManager *)self contactViewCache];
      uint64_t v28 = [v18 containerForContact:v14];

      uint64_t v19 = [CNUIContactSaveConfiguration alloc];
      uint64_t v20 = (void *)[v14 mutableCopy];
      id v21 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
      LOWORD(v27) = v29;
      uint64_t v22 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v19, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v14, v20, 0, v16, v21, 0, v28, 0, 0, v27);

      id v23 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
      id v24 = [(CNUIContactStoreLinkedContactSaveExecutor *)v23 executeSaveWithConfiguration:v22 saveDelegate:self];
      id v25 = [v24 identifiersOfIssuedSaveRequests];
      [v12 addObjectsFromArray:v25];

      char v13 = [v24 success];
    }
    else
    {
      id v16 = v10;
    }
    goto LABEL_15;
  }
  char v13 = 1;
LABEL_16:

  return v13;
}

- (id)updateContacts:(id)a3 forGroupContext:(id)a4 ignoresGuardianRestrictions:(BOOL)a5 issuedRequestIdentifiers:(id)a6
{
  BOOL v7 = a5;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v47 = a4;
  id v45 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  BOOL v44 = v7;
  [v11 setIgnoresGuardianRestrictions:v7];
  v48 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v19 = (void *)[v17 mutableCopy];
        [(CNUIGroupsAndContainersSaveManager *)self _updateSaveRequest:v11 addContact:v19 toGroupContext:v47 contactsToLink:v18];
        id v21 = v20 = v11;

        [v48 setObject:v18 forKeyedSubscript:v21];
        [v12 addObject:v21];

        id v11 = v20;
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v14);
  }

  uint64_t v22 = [(CNUIGroupsAndContainersSaveManager *)self contactStore];
  id v53 = 0;
  char v23 = [v22 executeSaveRequest:v11 error:&v53];
  id v24 = v53;

  id v25 = v45;
  if (v45)
  {
    uint64_t v26 = [v11 saveRequestIdentifier];
    [v45 addObject:v26];
  }
  if (v23)
  {
    id v42 = v24;
    id v43 = v11;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v27 = v48;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v50;
      LOBYTE(v31) = 1;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          id v33 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          if ((v31 & 1) != 0
            && ([v27 objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * j)],
                long long v34 = objc_claimAutoreleasedReturnValue(),
                BOOL v35 = [(CNUIGroupsAndContainersSaveManager *)self addLinkedContacts:v34 toOriginalContact:v33 ignoresGuardianRestrictions:v44 issuedRequestIdentifiers:0], v34, v35))
          {
            uint64_t v31 = 1;
          }
          else
          {
            long long v36 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              long long v37 = [v27 objectForKeyedSubscript:v33];
              *(_DWORD *)buf = 138412546;
              id v60 = v37;
              __int16 v61 = 2112;
              id v62 = v33;
              _os_log_error_impl(&dword_18B625000, v36, OS_LOG_TYPE_ERROR, "Failed to link contacts:%@ to contact:%@", buf, 0x16u);
            }
            uint64_t v31 = 0;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v29);
    }
    else
    {
      uint64_t v31 = 1;
    }

    uint64_t v40 = [[CNUIGroupsAndContainersContactsSaveResult alloc] initWithSuccess:v31 error:0 addedContacts:v12];
    id v25 = v45;
    id v24 = v42;
    id v11 = v43;
  }
  else
  {
    uint64_t v38 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v60 = obj;
      __int16 v61 = 2112;
      id v62 = v47;
      __int16 v63 = 2112;
      id v64 = v24;
      _os_log_error_impl(&dword_18B625000, v38, OS_LOG_TYPE_ERROR, "Failed to update contacts:%@, for groupContext:%@, error: %@", buf, 0x20u);
    }

    uint64_t v39 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    uint64_t v40 = [(CNUIGroupsAndContainersContactsSaveResult *)v39 initWithSuccess:0 error:v24 addedContacts:MEMORY[0x1E4F1CBF0]];
  }

  return v40;
}

- (id)addContacts:(id)a3 toGroup:(id)a4 inContainer:(id)a5 moveWasAuthorized:(BOOL)a6
{
  BOOL v6 = a6;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))();
  if (!v12 || v13)
  {
    uint64_t v15 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    id v16 = [(CNUIGroupsAndContainersContactsSaveResult *)v15 initWithSuccess:0 error:0 addedContacts:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    if (v11)
    {
      v22[0] = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v20 = v12;
    id v21 = v14;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v18 = [[CNUIGroupContext alloc] initWithAddedGroupsByContainerDict:v17 removedGroups:0];
    id v16 = [(CNUIGroupsAndContainersSaveManager *)self updateContacts:v10 forGroupContext:v18 ignoresGuardianRestrictions:v6 issuedRequestIdentifiers:0];
  }

  return v16;
}

- (id)addContacts:(id)a3 toGroupWithIdentifier:(id)a4 inContainerWithIdentifier:(id)a5 moveWasAuthorized:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    int v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = &stru_1ED8AC728;
      if (v11) {
        uint64_t v14 = v11;
      }
      int v30 = 138412546;
      uint64_t v31 = v14;
      __int16 v32 = 2112;
      id v33 = v12;
      uint64_t v15 = "Failed to add contacts to new group with identifier %@ in container with identifier: %@, contacts is nil";
      id v16 = v13;
      uint32_t v17 = 22;
LABEL_27:
      _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v30, v17);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  uint64_t v18 = *MEMORY[0x1E4F5A2A0];
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A2A0] + 16))(*MEMORY[0x1E4F5A2A0], v12) & 1) == 0)
  {
    int v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = &stru_1ED8AC728;
      if (v11) {
        uint64_t v28 = v11;
      }
      int v30 = 138412290;
      uint64_t v31 = v28;
      uint64_t v15 = "Failed to add contacts to new group with identifier %@, container identifier is empty";
      id v16 = v13;
      uint32_t v17 = 12;
      goto LABEL_27;
    }
LABEL_15:

    id v24 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    id v25 = [(CNUIGroupsAndContainersContactsSaveResult *)v24 initWithSuccess:0 error:0 addedContacts:MEMORY[0x1E4F1CBF0]];
    goto LABEL_21;
  }
  uint64_t v19 = [(CNUIGroupsAndContainersSaveManager *)self containerForContainerIdentifier:v12];
  if (v19)
  {
    if ((*(unsigned int (**)(uint64_t, __CFString *))(v18 + 16))(v18, v11))
    {
      id v20 = [(CNUIGroupsAndContainersSaveManager *)self groupForGroupIdentifier:v11];
      if (!v20)
      {
        id v21 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = &stru_1ED8AC728;
          if (v11) {
            uint64_t v22 = v11;
          }
          int v30 = 138412546;
          uint64_t v31 = v22;
          __int16 v32 = 2112;
          id v33 = v12;
          char v23 = "Failed to add contacts to new group with identifier %@ in container with identifier: %@, new group is nil";
LABEL_31:
          _os_log_error_impl(&dword_18B625000, v21, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v30, 0x16u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else
    {
      id v20 = 0;
    }
    id v25 = [(CNUIGroupsAndContainersSaveManager *)self addContacts:v10 toGroup:v20 inContainer:v19 moveWasAuthorized:v6];

    goto LABEL_20;
  }
  id v21 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = &stru_1ED8AC728;
    if (v11) {
      uint64_t v29 = v11;
    }
    int v30 = 138412546;
    uint64_t v31 = v29;
    __int16 v32 = 2112;
    id v33 = v12;
    char v23 = "Failed to add contacts to new group with identifier %@, container for identifier: %@ is nil";
    goto LABEL_31;
  }
LABEL_17:

  uint64_t v26 = [CNUIGroupsAndContainersContactsSaveResult alloc];
  id v25 = [(CNUIGroupsAndContainersContactsSaveResult *)v26 initWithSuccess:0 error:0 addedContacts:MEMORY[0x1E4F1CBF0]];
LABEL_20:

LABEL_21:

  return v25;
}

- (id)addContact:(id)a3 toGroup:(id)a4 inContainer:(id)a5 moveWasAuthorized:(BOOL)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = v12;
  if (!v10)
  {
    id v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "failed to add contact to new group, contact is nil", buf, 2u);
    }
    goto LABEL_11;
  }
  if (!v12)
  {
    id v16 = [(id)objc_opt_class() log];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    if (v11)
    {
      uint32_t v17 = [v11 identifier];
    }
    else
    {
      uint32_t v17 = &stru_1ED8AC728;
    }
    *(_DWORD *)buf = 138412546;
    char v23 = v17;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "failed to add contact to new group %@, container is nil, full contact:%@", buf, 0x16u);
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
  if (a6)
  {
    id v21 = v10;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v15 = [(CNUIGroupsAndContainersSaveManager *)self addContacts:v14 toGroup:v11 inContainer:v13 moveWasAuthorized:1];

    goto LABEL_12;
  }
  id v16 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (v11)
    {
      uint32_t v17 = [v11 identifier];
    }
    else
    {
      uint32_t v17 = &stru_1ED8AC728;
    }
    id v20 = [v13 identifier];
    *(_DWORD *)buf = 138412802;
    char v23 = v17;
    __int16 v24 = 2112;
    id v25 = v20;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "failed to add contact to new group %@ and new container %@, move was not authorized, full contact:%@", buf, 0x20u);

    if (v11) {
LABEL_22:
    }
  }
LABEL_11:

  uint64_t v18 = [CNUIGroupsAndContainersContactsSaveResult alloc];
  uint64_t v15 = [(CNUIGroupsAndContainersContactsSaveResult *)v18 initWithSuccess:0 error:0 addedContacts:MEMORY[0x1E4F1CBF0]];
LABEL_12:

  return v15;
}

- (id)addContact:(id)a3 toGroup:(id)a4 moveWasAuthorized:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 identifier];
    id v12 = [(CNUIGroupsAndContainersSaveManager *)self containerForGroupIdentifier:v11];

    int v13 = [(CNUIGroupsAndContainersSaveManager *)self addContact:v8 toGroup:v10 inContainer:v12 moveWasAuthorized:v5];
  }
  else
  {
    uint64_t v14 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v8;
      _os_log_error_impl(&dword_18B625000, v14, OS_LOG_TYPE_ERROR, "failed to add contact to group, group is nil, full contact:%@", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v15 = [CNUIGroupsAndContainersContactsSaveResult alloc];
    int v13 = [(CNUIGroupsAndContainersContactsSaveResult *)v15 initWithSuccess:0 error:0 addedContacts:MEMORY[0x1E4F1CBF0]];
  }

  return v13;
}

- (id)addContact:(id)a3 toGroupWithIdentifier:(id)a4 moveWasAuthorized:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(CNUIGroupsAndContainersSaveManager *)self groupForGroupIdentifier:a4];
  id v10 = [(CNUIGroupsAndContainersSaveManager *)self addContact:v8 toGroup:v9 moveWasAuthorized:v5];

  return v10;
}

- (id)addContact:(id)a3 toGroupIdentifier:(id)a4 inContainerIdentifier:(id)a5 moveWasAuthorized:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if (a4)
  {
    a4 = [(CNUIGroupsAndContainersSaveManager *)self groupForGroupIdentifier:a4];
  }
  id v12 = [(CNUIGroupsAndContainersSaveManager *)self containerForContainerIdentifier:v11];
  int v13 = [(CNUIGroupsAndContainersSaveManager *)self addContact:v10 toGroup:a4 inContainer:v12 moveWasAuthorized:v6];

  return v13;
}

+ (id)log
{
  if (log_cn_once_token_1_9252 != -1) {
    dispatch_once(&log_cn_once_token_1_9252, &__block_literal_global_9253);
  }
  v2 = (void *)log_cn_once_object_1_9254;

  return v2;
}

void __41__CNUIGroupsAndContainersSaveManager_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIGroupsAndContainersSaveManager");
  v1 = (void *)log_cn_once_object_1_9254;
  log_cn_once_object_1_9254 = (uint64_t)v0;
}

@end