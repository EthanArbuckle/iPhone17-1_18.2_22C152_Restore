@interface CHPhoneBookIOSManager
- (CHPhoneBookIOSManager)initWithContactStore:(id)a3;
- (CNContactStore)contactStore;
- (id)fetchCNContact:(id)a3 countryCode:(id)a4 isEmail:(BOOL)a5;
- (id)fetchCNContactsMatchingPredicate:(id)a3 keysToKetch:(id)a4 error:(id *)a5;
- (id)fetchFullCNContactForContactIdentifier:(id)a3 isEmail:(BOOL)a4;
- (id)getLocalizedCallerIdLabelForContact:(id)a3 forCallerId:(id)a4 withCallerIdIsEmail:(BOOL)a5;
- (id)getPersonsNameForContact:(id)a3;
@end

@implementation CHPhoneBookIOSManager

- (CHPhoneBookIOSManager)initWithContactStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPhoneBookIOSManager;
  v6 = [(CHPhoneBookIOSManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactStore, a3);
  }

  return v7;
}

- (id)fetchCNContact:(id)a3 countryCode:(id)a4 isEmail:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = +[CHLogServer sharedInstance];
  v11 = [v10 logHandleForDomain:"ch.pbm"];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = (uint64_t)v8;
    __int16 v31 = 1024;
    LODWORD(v32) = v5;
    _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, "fetchCNContact! Trying to find contact info for %@, isEmail? %d", buf, 0x12u);
  }

  v12 = objc_opt_new();
  if (v5) {
    [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v8];
  }
  else {
  v13 = [MEMORY[0x1E4F1B8F8] predicateForContactMatchingPhoneNumberWithDigits:v8 countryCode:v9];
  }
  v14 = +[CHLogServer sharedInstance];
  v15 = [v14 logHandleForDomain:"ch.pbm"];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = (uint64_t)v13;
    _os_log_impl(&dword_1B8E4A000, v15, OS_LOG_TYPE_DEFAULT, "The predicate used to find contact: %@", buf, 0xCu);
  }

  id v28 = 0;
  v16 = [(CHPhoneBookIOSManager *)self fetchCNContactsMatchingPredicate:v13 keysToKetch:MEMORY[0x1E4F1CBF0] error:&v28];
  id v17 = v28;
  v18 = +[CHLogServer sharedInstance];
  v19 = [v18 logHandleForDomain:"ch.pbm"];

  v20 = v19;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v16 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v30 = v21;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl(&dword_1B8E4A000, v20, OS_LOG_TYPE_DEFAULT, "Num of contacts found: %lu for %@", buf, 0x16u);
  }

  if ([v16 count])
  {
    v22 = [v16 firstObject];
    if (v22)
    {
      v23 = v22;
      v24 = [v22 identifier];

      goto LABEL_18;
    }
  }
  else if (!v16)
  {
    v25 = +[CHLogServer sharedInstance];
    v26 = [v25 logHandleForDomain:"ch.pbm"];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[CHPhoneBookIOSManager fetchCNContact:countryCode:isEmail:]();
    }
  }
  v24 = @"kCNContactInfoNotFound";
LABEL_18:
  [v12 setValue:v24 forKey:@"kCHABCacheCNContactIdKey"];

  return v12;
}

- (id)fetchFullCNContactForContactIdentifier:(id)a3 isEmail:(BOOL)a4
{
  BOOL v4 = a4;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  id v8 = (void *)v7;
  id v9 = (uint64_t *)MEMORY[0x1E4F1ADC8];
  if (!v4) {
    id v9 = (uint64_t *)MEMORY[0x1E4F1AEE0];
  }
  uint64_t v10 = *v9;
  v23[0] = v7;
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  v12 = (void *)MEMORY[0x1E4F1B8F8];
  id v22 = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v14 = [v12 predicateForContactsWithIdentifiers:v13];
  id v21 = 0;
  v15 = [(CHPhoneBookIOSManager *)self fetchCNContactsMatchingPredicate:v14 keysToKetch:v11 error:&v21];
  id v16 = v21;
  id v17 = [v15 firstObject];

  if (!v17)
  {
    v18 = +[CHLogServer sharedInstance];
    v19 = [v18 logHandleForDomain:"ch.pbm"];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CHPhoneBookIOSManager fetchFullCNContactForContactIdentifier:isEmail:]();
    }
  }
  return v17;
}

- (id)fetchCNContactsMatchingPredicate:(id)a3 keysToKetch:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1B908];
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithKeysToFetch:v9];

  [v11 setPredicate:v10];
  [v11 setUnifyResults:0];
  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = [(CHPhoneBookIOSManager *)self contactStore];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__CHPhoneBookIOSManager_fetchCNContactsMatchingPredicate_keysToKetch_error___block_invoke;
  v17[3] = &unk_1E61C7BF0;
  id v14 = v12;
  id v18 = v14;
  LODWORD(a5) = [v13 enumerateContactsWithFetchRequest:v11 error:a5 usingBlock:v17];

  if (a5) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

uint64_t __76__CHPhoneBookIOSManager_fetchCNContactsMatchingPredicate_keysToKetch_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)getPersonsNameForContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CHLogServer sharedInstance];
  id v6 = [v5 logHandleForDomain:"ch.pbm"];

  uint64_t v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CHPhoneBookIOSManager getPersonsNameForContact:](a2, v7);
  }

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = +[CHLogServer sharedInstance];
  id v10 = [v9 logHandleForDomain:"ch.pbm"];

  v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(CHPhoneBookIOSManager *)a2 getPersonsNameForContact:v11];
  }

  return v8;
}

- (id)getLocalizedCallerIdLabelForContact:(id)a3 forCallerId:(id)a4 withCallerIdIsEmail:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v35 = v7;
    if (v5)
    {
      id v9 = [v7 emailAddresses];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v10 = (void *)[v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
      v11 = 0;
      if (v10)
      {
        uint64_t v12 = *(void *)v41;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v41 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            id v15 = [v14 value];
            int v16 = [v15 isEqualToString:v8];

            if (v16)
            {
              id v17 = v14;

              v11 = v17;
            }
          }
          id v10 = (void *)[v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v10);
        id v18 = v11;
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      id v9 = [v7 phoneNumbers];
      v20 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v8];
      if (v20)
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v34 = v9;
        id v21 = v9;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          v11 = 0;
          uint64_t v24 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              v27 = objc_msgSend(v26, "value", v34);
              int v28 = [v27 isLikePhoneNumber:v20];

              if (v28)
              {
                id v29 = v26;

                v11 = v29;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v23);
        }
        else
        {
          v11 = 0;
        }

        id v9 = v34;
      }
      else
      {
        v11 = 0;
      }

      id v18 = 0;
      id v10 = v11;
    }

    uint64_t v30 = (void *)MEMORY[0x1E4F1BA20];
    __int16 v31 = [v11 label];
    id v32 = [v30 localizedStringForLabel:v31];

    id v19 = v32;
    id v7 = v35;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

- (void)fetchCNContact:countryCode:isEmail:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Error looking for contacts matching caller ID %@, error: %@");
}

- (void)fetchFullCNContactForContactIdentifier:isEmail:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Can't find contact for identifier %@, error: %@");
}

- (void)getPersonsNameForContact:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1B8E4A000, a3, OS_LOG_TYPE_DEBUG, "%@ <== %@", (uint8_t *)&v6, 0x16u);
}

- (void)getPersonsNameForContact:(const char *)a1 .cold.2(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_debug_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_DEBUG, "==> %@", (uint8_t *)&v4, 0xCu);
}

@end