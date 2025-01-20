@interface CNiOSFetchExecution
+ (id)contactsMatchingPredicates:(id)a3 sortOrdering:(unsigned int)a4 matchInfos:(id *)a5 options:(unint64_t)a6 addressBook:(void *)a7 environment:(id)a8 error:(id *)a9;
+ (id)contactsMatchingPredicates:(id)a3 sortOrdering:(unsigned int)a4 options:(unint64_t)a5 addressBook:(void *)a6 progressiveResults:(id)a7 completion:(id)a8 environment:(id)a9;
+ (void)_extractContacts:(id *)a3 matchInfo:(id *)a4 fromBlockResults:(id)a5 containsNestedResults:(BOOL)a6;
@end

@implementation CNiOSFetchExecution

+ (void)_extractContacts:(id *)a3 matchInfo:(id *)a4 fromBlockResults:(id)a5 containsNestedResults:(BOOL)a6
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v10 = (void *)MEMORY[0x192FD3A40]();
  if (v9)
  {
    context = v10;
    if (!a6)
    {
      v35[0] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];

      id v9 = (id)v11;
    }
    v12 = [MEMORY[0x1E4F1CA48] array];
    if (a4)
    {
      id v29 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    else
    {
      id v29 = 0;
    }
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v9;
    uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v31;
      ABPropertyID v14 = *MEMORY[0x1E4F49BB8];
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v16 count])
          {
            uint64_t v17 = 1;
            int v18 = 2;
            do
            {
              v19 = (const void *)[v16 objectAtIndex:v17 - 1];
              [v12 addObject:v19];
              if (a4)
              {
                v20 = [v16 objectAtIndex:v17];
                if (v20 != v13)
                {
                  CFTypeRef v21 = ABRecordCopyValue(v19, v14);
                  if (v21)
                  {
                    v22 = v21;
                    [v29 setObject:v20 forKey:v21];
                    CFRelease(v22);
                  }
                }
              }
              unint64_t v23 = v18 & 0xFFFFFFFE;
              v18 += 2;
              ++v17;
            }
            while ([v16 count] > v23);
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v28);
    }

    if (a4) {
      objc_storeStrong(a4, v29);
    }
    if (location) {
      objc_storeStrong(location, v12);
    }

    v10 = context;
  }
}

+ (id)contactsMatchingPredicates:(id)a3 sortOrdering:(unsigned int)a4 options:(unint64_t)a5 addressBook:(void *)a6 progressiveResults:(id)a7 completion:(id)a8 environment:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = +[_CNABPredicateObservable observableWithPredicates:sortOrdering:options:addressBook:environment:]((uint64_t)_CNABPredicateObservable, a3, a4, a5, (uint64_t)a6, a9);
  int v18 = (void *)MEMORY[0x1E4F5A488];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke;
  v31[3] = &unk_1E56B8938;
  id v32 = v15;
  id v33 = a1;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_2;
  v29[3] = &unk_1E56B5CA8;
  id v30 = v16;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_3;
  uint64_t v27 = &unk_1E56B57A0;
  id v28 = v30;
  id v19 = v30;
  id v20 = v15;
  CFTypeRef v21 = [v18 observerWithResultBlock:v31 completionBlock:v29 failureBlock:&v24];
  v22 = objc_msgSend(v17, "subscribe:", v21, v24, v25, v26, v27);

  return v22;
}

void __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = 0;
    id v4 = 0;
    [*(id *)(a1 + 40) _extractContacts:&v4 matchInfo:&v3 fromBlockResults:a2 containsNestedResults:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)contactsMatchingPredicates:(id)a3 sortOrdering:(unsigned int)a4 matchInfos:(id *)a5 options:(unint64_t)a6 addressBook:(void *)a7 environment:(id)a8 error:(id *)a9
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v10 = +[_CNABPredicateObservable observableWithPredicates:sortOrdering:options:addressBook:environment:]((uint64_t)_CNABPredicateObservable, a3, a4, a6, (uint64_t)a7, a8);
  id v11 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  v12 = (void *)MEMORY[0x1E4F5A488];
  v13 = [v11 completionHandlerAdapter];
  ABPropertyID v14 = [v12 observerWithCompletionHandler:v13];
  id v15 = (id)[v10 subscribe:v14];

  id v16 = [v11 future];
  uint64_t v17 = [v16 result:a9];

  if (v17)
  {
    int v18 = [MEMORY[0x1E4F1CA48] array];
    id v33 = v11;
    v34 = v10;
    if (a5)
    {
      id v35 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    else
    {
      id v35 = 0;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v32 = v17;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      ABPropertyID v23 = *MEMORY[0x1E4F49BB8];
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v26 = (const void *)objc_msgSend(v25, "objectAtIndex:", 0, v32);
          [v18 addObject:v26];
          if (a5)
          {
            uint64_t v27 = [v25 objectAtIndex:1];
            id v28 = [MEMORY[0x1E4F1CA98] null];

            if (v27 != v28)
            {
              CFTypeRef v29 = ABRecordCopyValue(v26, v23);
              if (v29)
              {
                id v30 = v29;
                [v35 setObject:v27 forKey:v29];
                CFRelease(v30);
              }
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v21);
    }

    if (a5) {
      *a5 = v35;
    }

    id v11 = v33;
    v10 = v34;
    uint64_t v17 = v32;
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

@end