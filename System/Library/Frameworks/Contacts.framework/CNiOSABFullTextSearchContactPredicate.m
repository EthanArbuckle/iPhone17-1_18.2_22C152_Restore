@interface CNiOSABFullTextSearchContactPredicate
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABFullTextSearchContactPredicate)initWithSearchString:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)_predicatesWithAddressBook:(void *)a3 environment:(id)a4;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (id)cn_fetchPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 progressiveResults:(id)a5 completion:(id)a6 environment:(id)a7;
@end

@implementation CNiOSABFullTextSearchContactPredicate

- (CNiOSABFullTextSearchContactPredicate)initWithSearchString:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABFullTextSearchContactPredicate;
  v5 = [(CNFullTextSearchContactPredicate *)&v9 initWithSearchString:a3 containerIdentifiers:a4 groupIdentifiers:a5];
  v6 = v5;
  if (v5)
  {
    [(CNPredicate *)v5 setAugmentMainStoreResults:0];
    v7 = v6;
  }

  return v6;
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (id)_predicatesWithAddressBook:(void *)a3 environment:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v38 = a4;
  v6 = [(CNFullTextSearchContactPredicate *)self groupIdentifiers];

  if (v6)
  {
    v7 = [(CNFullTextSearchContactPredicate *)self groupIdentifiers];
    v8 = (void *)ABAddressBookCopyGroupsWithUUIDs();

    if (!v8)
    {
      objc_super v9 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = [(CNFullTextSearchContactPredicate *)self containerIdentifiers];

  if (!v10)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v11 = [(CNFullTextSearchContactPredicate *)self containerIdentifiers];
  v12 = (void *)ABAddressBookCopySourcesWithUUIDs();

  if (v12)
  {
LABEL_9:
    v36 = v12;
    v13 = objc_msgSend(v12, "_cn_partition:", &__block_literal_global_29);
    v37 = v8;
    v14 = objc_msgSend(v8, "_cn_partition:", &__block_literal_global_2_1);
    v33 = [v13 second];
    v32 = [v14 second];
    v35 = v13;
    v15 = [v13 first];
    v34 = v14;
    v16 = [v14 first];
    v17 = objc_msgSend(v16, "_cn_map:", &__block_literal_global_5_0);
    v18 = [v15 arrayByAddingObjectsFromArray:v17];

    objc_super v9 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v25 = [v38 abPredicateRunner];
          v26 = [(CNFullTextSearchContactPredicate *)self searchString];
          v27 = [v25 personPredicateWithNameLike:v26 inSource:v24 addressBook:a3];
          objc_msgSend(v9, "_cn_addNonNilObject:", v27);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v21);
    }

    if (![v19 count] || objc_msgSend(v33, "count") || objc_msgSend(v32, "count"))
    {
      v28 = [v38 abPredicateRunner];
      v29 = [(CNFullTextSearchContactPredicate *)self searchString];
      v30 = [v28 personPredicateWithNameLike:v29 inGroups:v32 sources:v33 addressBook:a3];
      objc_msgSend(v9, "_cn_addNonNilObject:", v30);
    }
    v8 = v37;
    goto LABEL_21;
  }
  objc_super v9 = 0;
LABEL_21:

LABEL_22:

  return v9;
}

uint64_t __80__CNiOSABFullTextSearchContactPredicate__predicatesWithAddressBook_environment___block_invoke()
{
  return ABSourceIsRemote();
}

uint64_t __80__CNiOSABFullTextSearchContactPredicate__predicatesWithAddressBook_environment___block_invoke_2(int a1, ABRecordRef group)
{
  ABRecordRef v2 = ABGroupCopySource(group);
  uint64_t IsRemote = ABSourceIsRemote();
  if (v2) {
    CFRelease(v2);
  }
  return IsRemote;
}

id __80__CNiOSABFullTextSearchContactPredicate__predicatesWithAddressBook_environment___block_invoke_3(int a1, ABRecordRef group)
{
  ABRecordRef v2 = (void *)ABGroupCopySource(group);

  return v2;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v15 = 0;
  v8 = [(CNiOSABFullTextSearchContactPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v15];
  id v9 = v15;
  v10 = v9;
  if (v8)
  {
    id v11 = v8;
  }
  else if (a7)
  {
    uint64_t v12 = [v9 code];
    v13 = [v10 userInfo];
    *a7 = +[CNErrorFactory errorWithCode:v12 userInfo:v13];
  }
  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = *MEMORY[0x1E4F5A298];
  id v15 = [(CNFullTextSearchContactPredicate *)self searchString];
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  if (v14)
  {
    v16 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    v17 = v16;
    v18 = 0;
    if (a7) {
      *a7 = v16;
    }
  }
  else
  {
    v17 = [(CNiOSABFullTextSearchContactPredicate *)self _predicatesWithAddressBook:a3 environment:v13];
    if ([v17 count])
    {
      v18 = +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v17, [v12 sortOrder], a5, objc_msgSend(v12, "options"), a3, v13, a7);
    }
    else
    {
      if (a5) {
        *a5 = 0;
      }
      v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v18;
}

- (id)cn_fetchPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 progressiveResults:(id)a5 completion:(id)a6 environment:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void))a6;
  id v15 = a7;
  v16 = [(CNiOSABFullTextSearchContactPredicate *)self _predicatesWithAddressBook:a3 environment:v15];
  if ([v16 count])
  {
    v17 = +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:", v16, [v12 sortOrder], objc_msgSend(v12, "options"), a3, v13, v14, v15);
  }
  else
  {
    if (v14) {
      v14[2](v14, 0);
    }
    v17 = 0;
  }

  return v17;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

@end