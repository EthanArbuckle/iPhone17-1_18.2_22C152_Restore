@interface SGContactPipelineHelper
+ (BOOL)personExistsInContacts:(id)a3 name:(id)a4 handle:(id)a5;
+ (SGContactPipelineHelper)sharedInstance;
+ (id)findContactsForDetailType:(unint64_t)a3 andValue:(id)a4;
+ (id)findContactsForPerson:(id)a3 fetchingKeys:(id)a4;
+ (id)normalizedDigits:(id)a3;
- (BOOL)numberMatchesContactsForm:(id)a3;
- (BOOL)numberMatchesContactsForm:(id)a3 amongContactsWithIdentifiers:(id)a4;
- (SGContactPipelineHelper)init;
- (void)dealloc;
@end

@implementation SGContactPipelineHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostCommonCountryCode, 0);
  objc_storeStrong((id *)&self->_lengthsCounts, 0);
}

- (BOOL)numberMatchesContactsForm:(id)a3 amongContactsWithIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_helperLock = &self->_helperLock;
  pthread_mutex_lock(&self->_helperLock);
  mostCommonCountryCode = self->_lengthsCounts;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  unint64_t phonesSeenInContacts = self->_phonesSeenInContacts;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__32811;
  v45 = __Block_byref_object_dispose__32812;
  v46 = self->_mostCommonCountryCode;
  if (v7 || !mostCommonCountryCode)
  {
    id v33 = v6;
    uint64_t v10 = MEMORY[0x1CB79B230]();
    v48[3] = 0;
    v11 = (void *)v42[5];
    v42[5] = 0;

    v12 = objc_opt_new();
    v13 = objc_opt_new();
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v40[3] = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke;
    v34[3] = &unk_1E65BBFA8;
    id v14 = v12;
    id v35 = v14;
    id v15 = v13;
    id v36 = v15;
    v37 = v40;
    v38 = &v41;
    v39 = &v47;
    v16 = (void *)MEMORY[0x1CB79B4C0](v34);
    if (v7)
    {
      [v7 enumerateObjectsUsingBlock:v16];
      v17 = (NSDictionary *)v14;
    }
    else
    {
      +[SGLowMemoryContactEnumeration enumerateContactIdentifiersUsingBlock:v16];
      v17 = (NSDictionary *)[v14 copy];

      objc_storeStrong((id *)&self->_lengthsCounts, v17);
      self->_unint64_t phonesSeenInContacts = v48[3];
      v18 = (NSString *)[(id)v42[5] copy];
      mostCommonCountryCode = (NSDictionary *)self->_mostCommonCountryCode;
      self->_mostCommonCountryCode = v18;
    }

    _Block_object_dispose(v40, 8);
    v19 = (void *)v10;
    id v6 = v33;
    mostCommonCountryCode = v17;
  }
  v20 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v6];
  v21 = +[SGContactPipelineHelper normalizedDigits:v20];
  v22 = v21;
  if (!v42[5]) {
    goto LABEL_10;
  }
  if (!objc_msgSend(v21, "hasPrefix:")) {
    goto LABEL_10;
  }
  v23 = NSNumber;
  uint64_t v24 = [v22 length];
  v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", v24 - objc_msgSend((id)v42[5], "length"));
  v26 = [(NSDictionary *)mostCommonCountryCode objectForKeyedSubscript:v25];
  unint64_t v27 = [v26 unsignedIntegerValue];

  if (v27 >= v48[3] / 3uLL)
  {
    BOOL v31 = 1;
  }
  else
  {
LABEL_10:
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "length"));
    v29 = [(NSDictionary *)mostCommonCountryCode objectForKeyedSubscript:v28];
    unint64_t v30 = [v29 unsignedIntegerValue];

    BOOL v31 = v30 >= v48[3] / 3uLL;
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  pthread_mutex_unlock(p_helperLock);
  return v31;
}

void __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F1B908];
  id v7 = a2;
  id v8 = [v6 alloc];
  v24[0] = *MEMORY[0x1E4F1AEE0];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v10 = (void *)[v8 initWithKeysToFetch:v9];

  v11 = (void *)MEMORY[0x1E4F1B8F8];
  id v23 = v7;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v13 = [v11 predicateForContactsWithIdentifiers:v12];
  [v10 setPredicate:v13];

  id v14 = +[SGContactStoreFactory contactStore];
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke_2;
  v16[3] = &unk_1E65BBF80;
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  long long v19 = *(_OWORD *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = a4;
  +[SGContactsInterface enumerateContactsWithFetchRequest:v10 usingContactStore:v14 error:&v22 usingBlock:v16];
  id v15 = v22;
}

void __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v26 = a2;
  id obj = [v26 phoneNumbers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v29 = *(void *)v31;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1CB79B230]();
        v9 = [v7 value];
        uint64_t v10 = NSNumber;
        v11 = +[SGContactPipelineHelper normalizedDigits:v9];
        v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));

        v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

        if (v13)
        {
          id v14 = NSNumber;
          id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
          v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
          [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v12];
        }
        else
        {
          [*(id *)(a1 + 32) setObject:&unk_1F2536318 forKeyedSubscript:v12];
        }
        id v17 = (void *)MEMORY[0x1E4F1BA70];
        id v18 = [v9 countryCode];
        long long v19 = [v17 dialingCodeForISOCountryCode:v18];
        uint64_t v20 = [v19 stringByReplacingOccurrencesOfString:@"+" withString:&stru_1F24EEF20];

        if (v20)
        {
          uint64_t v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:v20];

          id v22 = *(void **)(a1 + 40);
          if (v21)
          {
            id v23 = [v22 objectForKeyedSubscript:v20];
            unint64_t v24 = [v23 unsignedIntegerValue] + 1;

            if (v24 > *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v20);
              *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v24;
            }
            v25 = [NSNumber numberWithUnsignedInteger:v24];
            [*(id *)(a1 + 40) setObject:v25 forKeyedSubscript:v20];
          }
          else
          {
            [v22 setObject:&unk_1F2536318 forKeyedSubscript:v20];
          }
        }
        if (++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= 0x15uLL)
        {
          *a3 = 1;
          **(unsigned char **)(a1 + 72) = 1;
        }

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }
}

- (BOOL)numberMatchesContactsForm:(id)a3
{
  return [(SGContactPipelineHelper *)self numberMatchesContactsForm:a3 amongContactsWithIdentifiers:0];
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_helperLock);
  v3.receiver = self;
  v3.super_class = (Class)SGContactPipelineHelper;
  [(SGContactPipelineHelper *)&v3 dealloc];
}

- (SGContactPipelineHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)SGContactPipelineHelper;
  v2 = [(SGContactPipelineHelper *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_helperLock, 0);
  }
  return v3;
}

+ (id)normalizedDigits:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  objc_super v5 = (void *)MEMORY[0x1E4F1BA70];
  uint64_t v6 = [v3 countryCode];
  id v7 = [v5 dialingCodeForISOCountryCode:v6];

  id v8 = (void *)MEMORY[0x1CB79B230]();
  v9 = [v3 digits];
  uint64_t v10 = [v9 componentsSeparatedByString:@";"];
  v11 = [v10 firstObject];

  if (v7 && [v11 hasPrefix:v7])
  {
    v12 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v13 = objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v7, "length"));

    v11 = (void *)v13;
  }

  return v11;
}

+ (BOOL)personExistsInContacts:(id)a3 name:(id)a4 handle:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"SGContactPipelineHelper.m", 213, @"Invalid parameter not satisfying: %@", @"contacts" object file lineNumber description];
  }
  if ([v10 length] || objc_msgSend(v11, "length"))
  {
    if ([v10 length])
    {
      v12 = [v10 lowercaseString];

      uint64_t v41 = SGNamesOnlyNameChars(v12);
      id v10 = v12;
    }
    else
    {
      uint64_t v41 = 0;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v9;
    uint64_t v42 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v49;
      id v38 = v11;
      id v39 = v10;
      id v37 = v9;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v49 != v43) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v15 = (void *)MEMORY[0x1CB79B230]();
          if (v11
            && (([v14 hasEmailAddress:v11] & 1) != 0
             || ([v14 hasPhoneNumber:v11] & 1) != 0))
          {
            goto LABEL_34;
          }
          if ([v10 length])
          {
            v16 = [v14 givenName];
            id v17 = SGNamesOnlyNameChars(v16);

            id v18 = [v14 familyName];
            long long v19 = SGNamesOnlyNameChars(v18);

            if ([v17 length])
            {
              id v20 = v17;
            }
            else
            {
              id v20 = [v14 givenName];
            }
            uint64_t v21 = v20;
            v46 = v17;
            uint64_t v47 = v15;
            v45 = v19;
            if ([v19 length])
            {
              id v22 = v19;
            }
            else
            {
              id v22 = [v14 familyName];
            }
            id v23 = v22;
            v44 = [v21 lowercaseString];
            v52[0] = v44;
            unint64_t v24 = [v23 lowercaseString];
            v52[1] = v24;
            v25 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v23, v21];
            id v26 = [v25 lowercaseString];
            v52[2] = v26;
            unint64_t v27 = v21;
            v28 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v21, v23];
            uint64_t v29 = [v28 lowercaseString];
            v52[3] = v29;
            long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];

            id v10 = v39;
            if ([v41 length]) {
              long long v31 = v41;
            }
            else {
              long long v31 = v39;
            }
            if (([v30 containsObject:v31] & 1) != 0
              || ([MEMORY[0x1E4F1B910] stringFromContact:v14 style:0],
                  long long v32 = objc_claimAutoreleasedReturnValue(),
                  BOOL v33 = +[SGNames namesApproximatelyMatch:v32 and:v39], v32, v33))
            {

              id v11 = v38;
              id v15 = v47;
LABEL_34:
              BOOL v34 = 1;
              id v9 = v37;
              goto LABEL_35;
            }

            id v11 = v38;
            id v15 = v47;
          }
        }
        BOOL v34 = 0;
        id v9 = v37;
        uint64_t v42 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v34 = 0;
    }
LABEL_35:
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

+ (id)findContactsForDetailType:(unint64_t)a3 andValue:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (a3 > 6 || ((0x57u >> a3) & 1) == 0 || (id v6 = **((id **)&unk_1E65BBFC8 + a3)) == 0)
  {
    id v11 = 0;
    goto LABEL_10;
  }
  id v7 = v6;
  id v8 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v10 = objc_msgSend(v9, "initWithObjects:", v7, v8, *MEMORY[0x1E4F1AEE0], *MEMORY[0x1E4F1ADC8], *MEMORY[0x1E4F1AEB0], *MEMORY[0x1E4F1ADF0], *MEMORY[0x1E4F1AEA0], *MEMORY[0x1E4F1ADE0], *MEMORY[0x1E4F1AEB8], *MEMORY[0x1E4F1AFA8], *MEMORY[0x1E4F1AED8], *MEMORY[0x1E4F1AEC0], *MEMORY[0x1E4F1AF78], *MEMORY[0x1E4F1AD90], 0);
  if (a3 == 2)
  {
    uint64_t v16 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v5];
LABEL_15:
    id v14 = (void *)v16;
LABEL_16:
    id v17 = [v10 allObjects];
    id v18 = +[SGContactStoreFactory contactStore];
    id v22 = 0;
    id v11 = +[SGContactsInterface unifiedContactsMatchingPredicate:v14 keysToFetch:v17 usingContactStore:v18 error:&v22];
    id v19 = v22;

    if (!v11)
    {
      id v20 = sgLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v14;
        __int16 v25 = 2112;
        id v26 = v19;
        _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "unifiedContactsMatchingPredicate failed with predicate %@ and error %@", buf, 0x16u);
      }

      id v11 = (void *)MEMORY[0x1E4F1CBF0];
    }

    goto LABEL_21;
  }
  if (a3 == 1)
  {
    uint64_t v16 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingFullTextSearch:v5 containerIdentifiers:0 groupIdentifiers:0];
    goto LABEL_15;
  }
  id v11 = 0;
  if (!a3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
    if (!v12)
    {
      uint64_t v21 = sgLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v5;
        _os_log_fault_impl(&dword_1CA650000, v21, OS_LOG_TYPE_FAULT, "phoneNumberWithStringValue unexpectedly failed for string: %@", buf, 0xCu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
      id v11 = 0;
      goto LABEL_21;
    }
    uint64_t v13 = (void *)v12;
    id v14 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v12];

    goto LABEL_16;
  }
LABEL_21:

LABEL_10:
  return v11;
}

+ (id)findContactsForPerson:(id)a3 fetchingKeys:(id)a4
{
  id v5 = a3;
  id v6 = [v5 handles];
  id v7 = (void *)[v6 count];

  if (v7)
  {
    id v8 = [v5 handleIdentifier];
    char v9 = [v8 isEqualToString:*MEMORY[0x1E4F1ADC8]];

    if (v9)
    {
      uint64_t v10 = 2;
    }
    else
    {
      id v11 = [v5 handleIdentifier];
      int v12 = [v11 isEqualToString:*MEMORY[0x1E4F1AEE0]];

      uint64_t v10 = 0;
      id v7 = 0;
      if (!v12) {
        goto LABEL_6;
      }
    }
    uint64_t v13 = [v5 handles];
    id v14 = [v13 objectAtIndexedSubscript:0];
    id v7 = [a1 findContactsForDetailType:v10 andValue:v14];
  }
LABEL_6:

  return v7;
}

+ (SGContactPipelineHelper)sharedInstance
{
  if (sharedInstance__pasOnceToken3_32870 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3_32870, &__block_literal_global_32871);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_32872;
  return (SGContactPipelineHelper *)v2;
}

void __41__SGContactPipelineHelper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_32872;
  sharedInstance__pasExprOnceResult_32872 = v1;
}

@end