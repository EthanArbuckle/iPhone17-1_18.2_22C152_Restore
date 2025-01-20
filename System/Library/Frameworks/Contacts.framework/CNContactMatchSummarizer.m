@interface CNContactMatchSummarizer
+ (id)keyDescriptorForContactIdentifiers:(id)a3 matchInfos:(id)a4;
+ (id)log;
+ (id)summaryProperties;
+ (id)summaryPropertyForMatchInfo:(id)a3;
- (CNContactMatchSummarizer)init;
- (id)attributedStringForPropertyValueString:(id)a3 queryTerms:(id)a4 outMatchCount:(unint64_t *)a5;
- (id)summariesFutureForContactsIdentifiers:(id)a3 matchInfos:(id)a4 contactStore:(id)a5 scheduler:(id)a6;
- (id)summaryForContact:(id)a3 matchInfo:(id)a4;
- (void)dealloc;
@end

@implementation CNContactMatchSummarizer

+ (id)log
{
  if (log_cn_once_token_0_4 != -1) {
    dispatch_once(&log_cn_once_token_0_4, &__block_literal_global_56);
  }
  v2 = (void *)log_cn_once_object_0_4;

  return v2;
}

uint64_t __31__CNContactMatchSummarizer_log__block_invoke()
{
  log_cn_once_object_0_4 = (uint64_t)os_log_create("com.apple.contacts", "CNContactMatchSummarizer");

  return MEMORY[0x1F41817F8]();
}

+ (id)summaryProperties
{
  if (summaryProperties_cn_once_token_1 != -1) {
    dispatch_once(&summaryProperties_cn_once_token_1, &__block_literal_global_4_4);
  }
  v2 = (void *)summaryProperties_cn_once_object_1;

  return v2;
}

void __45__CNContactMatchSummarizer_summaryProperties__block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v3[0] = @"nickname";
  v3[1] = @"organizationName";
  v3[2] = @"departmentName";
  v3[3] = @"jobTitle";
  v3[4] = @"note";
  v3[5] = @"phoneNumbers";
  v3[6] = @"emailAddresses";
  v3[7] = @"postalAddresses";
  v3[8] = @"urlAddresses";
  v3[9] = @"contactRelations";
  v3[10] = @"socialProfiles";
  v3[11] = @"instantMessageAddresses";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:12];
  uint64_t v1 = [v0 copy];
  v2 = (void *)summaryProperties_cn_once_object_1;
  summaryProperties_cn_once_object_1 = v1;
}

+ (id)summaryPropertyForMatchInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = objc_msgSend(a1, "summaryProperties", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = [v4 matchedProperties];
        v14 = [v13 objectForKey:v12];

        unint64_t v15 = [v14 count];
        if (v15 > v8)
        {
          unint64_t v16 = v15;
          id v17 = v12;

          unint64_t v8 = v16;
          v9 = v17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)summariesFutureForContactsIdentifiers:(id)a3 matchInfos:(id)a4 contactStore:(id)a5 scheduler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E4F5A368];
  id v14 = a6;
  id v15 = objc_alloc_init(v13);
  unint64_t v16 = (void *)MEMORY[0x1E4F5A408];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke;
  v26[3] = &unk_1E56B5A80;
  id v27 = v10;
  id v28 = v11;
  v29 = self;
  id v30 = v12;
  id v17 = v15;
  id v31 = v17;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  long long v21 = [v16 futureWithBlock:v26 scheduler:v14];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_4;
  v24[3] = &unk_1E56B49B0;
  id v25 = v17;
  id v22 = v17;
  [v21 addFailureBlock:v24];

  return v21;
}

id __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_2;
  v20[3] = &unk_1E56B4F68;
  v2 = *(void **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "_cn_filter:", v20);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v3 count])
  {
    v5 = [(id)objc_opt_class() keyDescriptorForContactIdentifiers:v3 matchInfos:*(void *)(a1 + 40)];
    v22[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    uint64_t v7 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v6];
    [(CNContactFetchRequest *)v7 setUnifyResults:0];
    [(CNContactFetchRequest *)v7 setDisallowsEncodedFetch:1];
    unint64_t v8 = +[CNContact predicateForContactsWithIdentifiers:v3];
    [(CNContactFetchRequest *)v7 setPredicate:v8];

    v9 = objc_opt_new();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_3;
    v15[3] = &unk_1E56B5A58;
    id v10 = *(void **)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    int8x16_t v14 = *(int8x16_t *)(a1 + 40);
    id v11 = (id)v14.i64[0];
    int8x16_t v17 = vextq_s8(v14, v14, 8uLL);
    id v18 = v9;
    id v19 = v4;
    id v12 = v9;
    [v10 enumerateContactsAndMatchInfoWithFetchRequest:v7 error:0 usingBlock:v15];
  }

  return v4;
}

uint64_t __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  v3 = [v2 excerpt];
  id v4 = [v3 future];

  uint64_t v5 = [v4 isFinished] ^ 1;
  return v5;
}

void __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if ([*(id *)(a1 + 32) isCanceled])
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    unint64_t v8 = [v13 identifier];
    v9 = [v7 objectForKey:v8];
    id v10 = [v6 summaryForContact:v13 matchInfo:v9];

    if (!v10) {
      id v10 = *(id *)(a1 + 56);
    }
    id v11 = *(void **)(a1 + 64);
    id v12 = [v13 identifier];
    [v11 setObject:v10 forKey:v12];
  }
}

uint64_t __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = [MEMORY[0x1E4F5A3F0] isCanceledError:a2];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 cancel];
  }
  return result;
}

+ (id)keyDescriptorForContactIdentifiers:(id)a3 matchInfos:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v21 = objc_alloc_init(CNPerContactPropertyKeyDescriptor);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        int8x16_t v14 = [v7 objectForKey:v13];
        id v15 = v14;
        if (v14)
        {
          id v16 = [v14 matchedProperties];

          if (v16)
          {
            uint64_t v17 = [a1 summaryPropertyForMatchInfo:v15];
            id v18 = (void *)v17;
            if (v17)
            {
              uint64_t v26 = v17;
              id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
              [(CNPerContactPropertyKeyDescriptor *)v21 setKeysToFetch:v19 forContactIdentifier:v13];
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  return v21;
}

- (CNContactMatchSummarizer)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactMatchSummarizer;
  v2 = [(CNContactMatchSummarizer *)&v7 init];
  if (v2)
  {
    v2->_tokenList = (void *)ABTokenListCreate();
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFLocaleRef v4 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    v8.location = 0;
    v8.length = 0;
    v2->_tokenizer = CFStringTokenizerCreate(v3, &stru_1EE052B80, v8, 0x810000uLL, v4);
    uint64_t v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  CFRelease(self->_tokenList);
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNContactMatchSummarizer;
  [(CNContactMatchSummarizer *)&v4 dealloc];
}

- (id)summaryForContact:(id)a3 matchInfo:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v5 = a4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__15;
  v48 = __Block_byref_object_dispose__15;
  id v49 = 0;
  id v31 = +[CNContactMatchSummarizer summaryPropertyForMatchInfo:v5];
  uint64_t v28 = v5;
  id v6 = [v5 matchedProperties];
  v33 = [v6 objectForKey:v31];

  if (!v31)
  {
LABEL_26:
    id v21 = (id)v45[5];
    goto LABEL_27;
  }
  if ([v29 isKeyAvailable:v31])
  {
    id v27 = [v29 valueForKey:v31];
    if (v27)
    {
      objc_super v7 = +[CN contactPropertiesByKey];
      CFRange v8 = [v7 objectForKey:v31];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        v54 = 0;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id obj = v27;
        uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v41 != v10) {
                objc_enumerationMutation(obj);
              }
              id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              objc_msgSend(v8, "plistTransform", v27);
              uint64_t v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
              int8x16_t v14 = [v12 value];
              id v15 = ((void (**)(void, void *))v13)[2](v13, v14);

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v15;
              }
              else
              {
                v50 = v31;
                v51 = v15;
                id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
              }
              uint64_t v17 = v16;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = [v8 summarizationKeys];
              }
              else
              {
                id v18 = 0;
              }
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __56__CNContactMatchSummarizer_summaryForContact_matchInfo___block_invoke;
              v34[3] = &unk_1E56B5AA8;
              id v19 = v18;
              id v35 = v19;
              v36 = self;
              id v37 = v33;
              v38 = buf;
              v39 = &v44;
              [v17 enumerateKeysAndObjectsUsingBlock:v34];
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
          }
          while (v9);
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = [(CNContactMatchSummarizer *)self attributedStringForPropertyValueString:v27 queryTerms:v33 outMatchCount:0];
          long long v23 = (void *)v45[5];
          v45[5] = v22;
        }
      }
    }
    goto LABEL_26;
  }
  id v20 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    long long v25 = [v29 identifier];
    uint64_t v26 = [v29 availableKeyDescriptor];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2114;
    v54 = v26;
    _os_log_error_impl(&dword_1909E3000, v20, OS_LOG_TYPE_ERROR, "contact %{public}@ does not have %{public}@ fetched, available keys %{public}@", buf, 0x20u);
  }
  id v21 = 0;
LABEL_27:

  _Block_object_dispose(&v44, 8);

  return v21;
}

void __56__CNContactMatchSummarizer_summaryForContact_matchInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = *(void **)(a1 + 32);
  if (!v7 || [v7 containsObject:v5])
  {
    unint64_t v10 = 0;
    CFRange v8 = [*(id *)(a1 + 40) attributedStringForPropertyValueString:v6 queryTerms:*(void *)(a1 + 48) outMatchCount:&v10];
    if (v8)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v10 > *(void *)(v9 + 24))
      {
        *(void *)(v9 + 24) = v10;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
      }
    }
  }
}

- (id)attributedStringForPropertyValueString:(id)a3 queryTerms:(id)a4 outMatchCount:(unint64_t *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  CFRange v8 = (void *)MEMORY[0x1E4F28B88];
  id v9 = a3;
  unint64_t v10 = [v8 newlineCharacterSet];
  uint64_t v11 = [v9 componentsSeparatedByCharactersInSet:v10];

  uint64_t v12 = [v11 componentsJoinedByString:@" "];

  long long v40 = (void *)v12;
  ABTokenListPopulateFromString();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v7;
  uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  uint64_t v13 = 0;
  int8x16_t v14 = 0;
  if (v38)
  {
    uint64_t v37 = *(void *)v42;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v15;
        uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * v15);
        uint64_t Count = ABTokenListGetCount();
        if (Count >= 1)
        {
          uint64_t v18 = Count;
          for (uint64_t i = 0; i != v18; ++i)
          {
            if ([(id)ABTokenListGetTokenAtIndex() rangeOfString:v16 options:393] != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v21 = v20;
              if (!v13) {
                uint64_t v13 = i;
              }
              if (!v14) {
                int8x16_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v40];
              }
              uint64_t TokenRangeAtIndex = ABTokenListGetTokenRangeAtIndex();
              if (v21 >= v22) {
                unint64_t v21 = v22;
              }
              long long v24 = [NSNumber numberWithBool:1];
              objc_msgSend(v14, "addAttribute:value:range:", @"contactExcerptEmphasized", v24, TokenRangeAtIndex, v21);

              if (a5) {
                ++*a5;
              }
            }
          }
        }
        uint64_t v15 = v39 + 1;
      }
      while (v39 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v38);
  }

  if (v13 + 10 < ABTokenListGetCount())
  {
    uint64_t v25 = ABTokenListGetTokenRangeAtIndex();
    objc_msgSend(v14, "replaceCharactersInRange:withString:", v25 + v26, objc_msgSend(v14, "length") - (v25 + v26), @"…");
  }
  if (v13)
  {
    uint64_t v27 = ABTokenListGetTokenRangeAtIndex();
    if (v27 >= 16)
    {
      if (v13 < 2)
      {
        uint64_t v33 = 0;
      }
      else
      {
        uint64_t v28 = v27;
        int v29 = 0;
        int v30 = 1;
        do
        {
          uint64_t v31 = v28 - ABTokenListGetTokenRangeAtIndex();
          if (v31 < 16) {
            int v29 = v30;
          }
          int v30 = v29 + 1;
        }
        while (v13 - (v29 + 1) >= 1 && v31 < 16);
        uint64_t v33 = v29;
      }
      if (v13 == v33) {
        v34 = &stru_1EE052B80;
      }
      else {
        v34 = @"…";
      }
      objc_msgSend(v14, "replaceCharactersInRange:withString:", 0, ABTokenListGetTokenRangeAtIndex(), v34);
    }
  }

  return v14;
}

@end