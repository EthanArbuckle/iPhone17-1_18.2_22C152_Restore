@interface CNAutocompleteRecentContactsTransform
+ (id)autocompleteResultForRecent:(id)a3 factory:(id)a4 membersFactory:(id)a5 chosenAddressHashes:(id)a6 searchString:(id)a7 library:(id)a8;
+ (id)contactAutocompleteResultForRecent:(id)a3 factory:(id)a4 completesChosenGroup:(BOOL)a5;
+ (id)groupAutocompleteResultForRecent:(id)a3 factory:(id)a4 membersFactory:(id)a5 chosenAddressHashes:(id)a6 searchString:(id)a7;
+ (id)resultTransformWithFactory:(id)a3 membersFactory:(id)a4 chosenAddressHashes:(id)a5 searchString:(id)a6 library:(id)a7;
+ (id)transformForRequest:(id)a3 library:(id)a4;
+ (int64_t)addressTypeForRecentContact:(id)a3;
- (CRRecentContactsLibrary)library;
- (NSArray)otherAddressesAlreadyChosen;
- (NSString)priorityDomainForSorting;
- (NSString)searchString;
- (NSString)sendingAddress;
- (void)setLibrary:(id)a3;
- (void)setOtherAddressesAlreadyChosen:(id)a3;
- (void)setPriorityDomainForSorting:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSendingAddress:(id)a3;
@end

@implementation CNAutocompleteRecentContactsTransform

+ (id)transformForRequest:(id)a3 library:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 priorityDomainForSorting];
  v9 = [v7 sendingAddress];
  v10 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v8 sendingAddress:v9];

  v11 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:0 sendingAddress:0];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [v7 fetchContext];
  v14 = [v13 otherAddressesAlreadyChosen];
  v15 = objc_msgSend(v14, "_cn_map:", CNAutocompleteResultAddressStringForHashingTransform);
  v16 = [v12 setWithArray:v15];

  v17 = [v7 searchString];

  v18 = [a1 resultTransformWithFactory:v10 membersFactory:v11 chosenAddressHashes:v16 searchString:v17 library:v6];

  return v18;
}

+ (id)resultTransformWithFactory:(id)a3 membersFactory:(id)a4 chosenAddressHashes:(id)a5 searchString:(id)a6 library:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __124__CNAutocompleteRecentContactsTransform_resultTransformWithFactory_membersFactory_chosenAddressHashes_searchString_library___block_invoke;
  v28 = &unk_1E63DE100;
  id v29 = v12;
  id v30 = v13;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  id v34 = a1;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  v22 = _Block_copy(&v25);
  v23 = objc_msgSend(v22, "copy", v25, v26, v27, v28);

  return v23;
}

uint64_t __124__CNAutocompleteRecentContactsTransform_resultTransformWithFactory_membersFactory_chosenAddressHashes_searchString_library___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 72) autocompleteResultForRecent:a2 factory:*(void *)(a1 + 32) membersFactory:*(void *)(a1 + 40) chosenAddressHashes:*(void *)(a1 + 48) searchString:*(void *)(a1 + 56) library:*(void *)(a1 + 64)];
}

+ (id)autocompleteResultForRecent:(id)a3 factory:(id)a4 membersFactory:(id)a5 chosenAddressHashes:(id)a6 searchString:(id)a7 library:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a4;
  id v20 = [v14 kind];
  int v21 = [v20 isEqual:*MEMORY[0x1E4F5CC68]];

  if (v21) {
    [a1 groupAutocompleteResultForRecent:v14 factory:v19 membersFactory:v15 chosenAddressHashes:v16 searchString:v17];
  }
  else {
  v22 = [a1 contactAutocompleteResultForRecent:v14 factory:v19 completesChosenGroup:0];
  }

  v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v14, "contactID"));
  [v22 setRecentsIdentifier:v23];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __133__CNAutocompleteRecentContactsTransform_autocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString_library___block_invoke;
  v27[3] = &unk_1E63DE128;
  id v28 = v18;
  id v29 = v14;
  id v24 = v14;
  id v25 = v18;
  [v22 setIgnoreResultBlock:v27];

  return v22;
}

uint64_t __133__CNAutocompleteRecentContactsTransform_autocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString_library___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  v16[0] = *(void *)(a1 + 40);
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v11 = 0;
  uint64_t v6 = [v4 removeRecentContacts:v5 error:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    v8 = CNALoggingContextDebug();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Can't ignore recent: %@, with error: %@", buf, 0x16u);
    }

    if (a2) {
      *a2 = v7;
    }
  }

  return v6;
}

+ (id)groupAutocompleteResultForRecent:(id)a3 factory:(id)a4 membersFactory:(id)a5 chosenAddressHashes:(id)a6 searchString:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 displayName];
  uint64_t v18 = [v12 countOfRecents];
  id v19 = [v12 mostRecentDate];
  if (![v15 count]) {
    goto LABEL_12;
  }
  id v37 = a1;
  id v38 = v13;
  v39 = v16;
  id v20 = [v12 members];
  int v21 = objc_msgSend(v20, "_cn_filter:", &__block_literal_global_16);
  v22 = objc_msgSend(v21, "_cn_indexBy:", &__block_literal_global_8);

  v23 = (void *)MEMORY[0x1E4F1CA80];
  id v24 = [v22 allKeys];
  id v25 = [v23 setWithArray:v24];

  if (![v15 isSubsetOfSet:v25])
  {
    id v32 = 0;
    id v13 = v38;
    goto LABEL_7;
  }
  [v25 minusSet:v15];
  if ([v25 count] == 1)
  {
    uint64_t v26 = [v25 anyObject];
    v27 = [v22 objectForKeyedSubscript:v26];

    id v28 = v27;
    id v29 = [v27 kind];
    uint64_t v30 = [v29 isEqual:*MEMORY[0x1E4F5CC68]];
    if (v30)
    {

      id v31 = v28;
LABEL_10:

      goto LABEL_11;
    }
    v36 = v28;
    BOOL v33 = _block_invoke(v30, v28, v39);

    id v31 = v36;
    if (!v33) {
      goto LABEL_10;
    }
    id v13 = v38;
    id v32 = [v37 contactAutocompleteResultForRecent:v36 factory:v38 completesChosenGroup:1];

LABEL_7:
    id v16 = v39;
    goto LABEL_13;
  }
LABEL_11:

  id v13 = v38;
  id v16 = v39;
  a1 = v37;
LABEL_12:
  LOBYTE(v35) = 0;
  id v32 = [v13 recentResultWithDisplayName:v17 value:0 lastSendingAddress:0 dateCount:v18 date:v19 group:1 completesChosenGroup:v35];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_15;
  v40[3] = &unk_1E63DE1B8;
  id v41 = v12;
  id v43 = a1;
  id v42 = v14;
  [v32 setMembersProvider:v40];

LABEL_13:
  return v32;
}

BOOL __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 address];
  BOOL v3 = v2 != 0;

  return v3;
}

id __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void (**)(uint64_t, void *))CNAutocompleteResultAddressStringForHashingTransform;
  BOOL v3 = [a2 address];
  v4 = v2[2]((uint64_t)v2, v3);

  return v4;
}

id __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_15(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) members];
  BOOL v3 = objc_msgSend(v2, "_cn_filter:", &__block_literal_global_17);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_18;
  v8[3] = &unk_1E63DE190;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v7;
  long long v9 = v7;
  v5 = objc_msgSend(v3, "_cn_map:", v8);

  if (!v5) {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

uint64_t __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_18(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) contactAutocompleteResultForRecent:a2 factory:*(void *)(a1 + 32) completesChosenGroup:0];
}

+ (id)contactAutocompleteResultForRecent:(id)a3 factory:(id)a4 completesChosenGroup:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v8 displayName];
  uint64_t v10 = [v8 countOfRecents];
  id v11 = [v8 mostRecentDate];
  id v12 = [v8 lastSendingAddress];
  id v13 = objc_alloc_init(CNAutocompleteResultValue);
  id v14 = [v8 address];
  [(CNAutocompleteResultValue *)v13 setAddress:v14];

  uint64_t v15 = [(id)objc_opt_class() addressTypeForRecentContact:v8];
  [(CNAutocompleteResultValue *)v13 setAddressType:v15];
  LOBYTE(v18) = a5;
  id v16 = [v7 recentResultWithDisplayName:v9 value:v13 lastSendingAddress:v12 dateCount:v10 date:v11 group:0 completesChosenGroup:v18];

  return v16;
}

+ (int64_t)addressTypeForRecentContact:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)*MEMORY[0x1E4F5CC60];
  v5 = [v3 kind];
  LOBYTE(v4) = [v4 isEqual:v5];

  if (v4)
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = (void *)*MEMORY[0x1E4F5CC80];
    id v8 = [v3 kind];
    LOBYTE(v7) = [v7 isEqual:v8];

    if (v7)
    {
      int64_t v6 = 2;
    }
    else
    {
      long long v9 = (void *)*MEMORY[0x1E4F5CC70];
      uint64_t v10 = [v3 kind];
      LOBYTE(v9) = [v9 isEqual:v10];

      if (v9)
      {
        int64_t v6 = 3;
      }
      else
      {
        id v11 = CNALoggingContextDebug();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = v3;
          _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Unknown address type for recent contact: %@ ", (uint8_t *)&v13, 0xCu);
        }

        int64_t v6 = 0;
      }
    }
  }

  return v6;
}

- (NSString)priorityDomainForSorting
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPriorityDomainForSorting:(id)a3
{
}

- (NSString)sendingAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSendingAddress:(id)a3
{
}

- (NSArray)otherAddressesAlreadyChosen
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOtherAddressesAlreadyChosen:(id)a3
{
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchString:(id)a3
{
}

- (CRRecentContactsLibrary)library
{
  return (CRRecentContactsLibrary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_otherAddressesAlreadyChosen, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_priorityDomainForSorting, 0);
}

@end