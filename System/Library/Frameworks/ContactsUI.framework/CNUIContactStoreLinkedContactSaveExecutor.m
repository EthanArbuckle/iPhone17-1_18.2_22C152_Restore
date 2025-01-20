@interface CNUIContactStoreLinkedContactSaveExecutor
- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4;
- (id)saveLinkedContactChanges:(id)a3 mutableContact:(id)a4 contactStore:(id)a5 editingLinkedContacts:(id)a6 ignoresParentalRestrictions:(BOOL)a7 saveWasAuthorized:(BOOL)a8 issuedSaveRequestIdentifiers:(id)a9;
@end

@implementation CNUIContactStoreLinkedContactSaveExecutor

- (id)saveLinkedContactChanges:(id)a3 mutableContact:(id)a4 contactStore:(id)a5 editingLinkedContacts:(id)a6 ignoresParentalRestrictions:(BOOL)a7 saveWasAuthorized:(BOOL)a8 issuedSaveRequestIdentifiers:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v19 = v18;
  if (!v17)
  {
    v23 = 0;
    goto LABEL_58;
  }
  id v72 = v16;
  v73 = v18;
  v20 = [v14 mainStoreLinkedContacts];

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E4F1CA80];
    v22 = [v14 mainStoreLinkedContacts];
    v75 = [v21 setWithArray:v22];
  }
  else
  {
    v75 = 0;
  }
  v24 = [v14 linkedContacts];

  id v16 = v72;
  v71 = v14;
  if (v24)
  {
    v25 = (void *)MEMORY[0x1E4F1CA80];
    v26 = [v14 linkedContacts];
    v27 = [v25 setWithArray:v26];

    if ([v75 count]) {
      [v27 minusSet:v75];
    }
  }
  else
  {
    v27 = 0;
  }
  v19 = v73;
  id v28 = v17;
  v74 = v28;
  if ([v27 count])
  {
    v29 = [v27 allObjects];
    v74 = [v28 arrayByAddingObjectsFromArray:v29];
  }
  v70 = v27;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v30 setIgnoresGuardianRestrictions:v10 | v9];
  v31 = [v30 saveRequestIdentifier];
  [v73 addObject:v31];

  unint64_t v32 = [v75 count];
  unint64_t v33 = [v28 count];
  if (v32 > 1 || v33 >= 2)
  {
    id v68 = v17;
    if (v32 < 2 || v33 > 1)
    {
      if (v32 > 1 || v33 < 2)
      {
        v51 = objc_msgSend(v71, "mainStoreLinkedContacts", v17, v27);
        char v52 = [v28 isEqualToArray:v51];

        if (v52)
        {
          v23 = 0;
          id v14 = v71;
          id v17 = v68;
          goto LABEL_57;
        }
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v53 = v28;
        uint64_t v54 = [v53 countByEnumeratingWithState:&v81 objects:v94 count:16];
        v55 = v75;
        if (v54)
        {
          uint64_t v56 = v54;
          uint64_t v57 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v56; ++i)
            {
              if (*(void *)v82 != v57) {
                objc_enumerationMutation(v53);
              }
              v59 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              if (([v55 containsObject:v59] & 1) == 0)
              {
                v60 = (void *)[v59 mutableCopy];
                [v30 linkContact:v15 toContact:v60];

                v55 = v75;
              }
              [v55 removeObject:v59];
            }
            uint64_t v56 = [v53 countByEnumeratingWithState:&v81 objects:v94 count:16];
          }
          while (v56);
        }

        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v61 = v55;
        uint64_t v62 = [v61 countByEnumeratingWithState:&v77 objects:v93 count:16];
        id v14 = v71;
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v78;
          do
          {
            for (uint64_t j = 0; j != v63; ++j)
            {
              if (*(void *)v78 != v64) {
                objc_enumerationMutation(v61);
              }
              v66 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * j) mutableCopy];
              [v30 unlinkContact:v66];
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v77 objects:v93 count:16];
          }
          while (v63);
        }

        v40 = [MEMORY[0x1E4F1B8F8] unifyContacts:v74];
      }
      else
      {
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v41 = v28;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v85 objects:v95 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v86;
          do
          {
            for (uint64_t k = 0; k != v43; ++k)
            {
              if (*(void *)v86 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = *(void **)(*((void *)&v85 + 1) + 8 * k);
              v47 = objc_msgSend(v15, "identifier", v68, v70);
              v48 = [v46 identifier];
              char v49 = [v47 isEqualToString:v48];

              if ((v49 & 1) == 0)
              {
                v50 = (void *)[v46 mutableCopy];
                [v30 linkContact:v15 toContact:v50];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v85 objects:v95 count:16];
          }
          while (v43);
        }

        v40 = [MEMORY[0x1E4F1B8F8] unifyContacts:v74];
        id v14 = v71;
        id v16 = v72;
      }
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v34 = v75;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v89 objects:v96 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v90;
        do
        {
          for (uint64_t m = 0; m != v36; ++m)
          {
            if (*(void *)v90 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * m), "mutableCopy", v68, v70);
            [v30 unlinkContact:v39];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v89 objects:v96 count:16];
        }
        while (v36);
      }

      v40 = [v28 firstObject];
      id v14 = v71;
    }
    v23 = objc_msgSend(v40, "mutableCopy", v68);

    uint64_t v76 = 0;
    [v16 executeSaveRequest:v30 error:&v76];
    id v17 = v69;
    v19 = v73;
    goto LABEL_57;
  }
  v23 = 0;
  id v14 = v71;
LABEL_57:

LABEL_58:

  return v23;
}

- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = CNUILogContactCard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    id v18 = self;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreLinkedContactSaveExecutor] %{public}p will execute save…", buf, 0xCu);
  }

  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [v5 contact];
  BOOL v9 = [v5 mutableContact];
  BOOL v10 = [v5 contactStore];
  v11 = [v5 editingLinkedContacts];
  uint64_t v12 = [v5 ignoresParentalRestrictions];
  uint64_t v13 = [v5 saveWasAuthorized];

  id v14 = [(CNUIContactStoreLinkedContactSaveExecutor *)self saveLinkedContactChanges:v8 mutableContact:v9 contactStore:v10 editingLinkedContacts:v11 ignoresParentalRestrictions:v12 saveWasAuthorized:v13 issuedSaveRequestIdentifiers:v7];

  id v15 = [[CNUIContactSaveResult alloc] initWithSuccess:v14 != 0 contact:v14 identifiersOfIssuedSaveRequests:v7];

  return v15;
}

@end