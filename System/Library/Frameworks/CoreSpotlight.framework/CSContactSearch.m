@interface CSContactSearch
@end

@implementation CSContactSearch

void __31___CSContactSearch_targetQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_initially_inactive(MEMORY[0x1E4F14430]);
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.corespotlight.contactsPeopleSuggester", v1);
  v3 = (void *)targetQueue_targetQueue;
  targetQueue_targetQueue = (uint64_t)v2;

  dispatch_queue_set_width();
  v4 = targetQueue_targetQueue;

  dispatch_activate(v4);
}

uint64_t __25___CSContactSearch_start__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) autocompleteEnabled];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 startAutocompleteContactsSearch];
  }
  else
  {
    return [v3 startContactsSearch];
  }
}

uint64_t __32___CSContactSearch_contactStore__block_invoke()
{
  contactStore_store = (uint64_t)objc_alloc_init(+[CSContactsWrapper CNContactStoreClass]);

  return MEMORY[0x1F41817F8]();
}

uint64_t __37___CSContactSearch_autocompleteStore__block_invoke()
{
  autocompleteStore_store = (uint64_t)objc_alloc_init(+[CSAutocompleteContactsWrapper CNAutocompleteStoreClass]);

  return MEMORY[0x1F41817F8]();
}

void __39___CSContactSearch_startContactsSearch__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  v3 = [v2 query];
  id v46 = 0;
  v4 = [v2 contactsMatchingQuery:v3 error:&v46];
  id v5 = v46;

  if (!v5)
  {
    uint64_t v33 = a1;
    v31 = [MEMORY[0x1E4F1CA48] array];
    id v35 = objc_alloc_init(+[CSContactsWrapper CNContactFormatterClass]);
    [v35 setStyle:0];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v30 = v4;
    id obj = v4;
    uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (!v36) {
      goto LABEL_33;
    }
    uint64_t v34 = *(void *)v43;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v42 + 1) + 8 * v6);
        v37 = [v35 stringFromContact:v7];
        v8 = [MEMORY[0x1E4F1CA48] array];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v9 = [v7 emailAddresses];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v39 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              v15 = [v14 value];
              uint64_t v16 = [v15 length];

              if (v16)
              {
                v17 = [v14 value];
                [v8 addObject:v17];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v11);
        }

        if ([v8 count])
        {
          v18 = [v7 givenName];
          if (v18 || ([v7 middleName], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
          {

            goto LABEL_21;
          }
          id v19 = [v7 familyName];

          if (v19)
          {
LABEL_21:
            id v19 = objc_alloc_init(MEMORY[0x1E4F28F30]);
            v20 = [v7 givenName];
            [v19 setGivenName:v20];

            v21 = [v7 middleName];
            [v19 setMiddleName:v21];

            v22 = [v7 familyName];
            [v19 setFamilyName:v22];
          }
          v23 = [_CSContactSearchResult alloc];
          v24 = [v7 identifier];
          v25 = [(_CSContactSearchResult *)v23 initWithDisplayName:v37 nameComponents:v19 emailAddresses:v8 contactIdentifier:v24 recentsIdentifier:0 sourceType:2];

          v26 = [*(id *)(v33 + 32) query];
          if ([v26 containsString:@"@"])
          {
            v27 = [*(id *)(v33 + 32) query];
            BOOL v28 = +[_CSContactSearch doesContactMatchTerm:v27 contact:v25];

            if (!v28) {
              goto LABEL_27;
            }
          }
          else
          {
          }
          [v31 addObject:v25];
LABEL_27:
        }
        ++v6;
      }
      while (v6 != v36);
      uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      uint64_t v36 = v29;
      if (!v29)
      {
LABEL_33:

        [*(id *)(v33 + 32) handleCompletionWithContacts:v31 error:0];
        id v5 = 0;
        v4 = v30;
        goto LABEL_34;
      }
    }
  }
  [*(id *)(a1 + 32) handleCompletionWithContacts:0 error:v5];
LABEL_34:
}

uint64_t __48___CSContactSearch_contactsMatchingQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end