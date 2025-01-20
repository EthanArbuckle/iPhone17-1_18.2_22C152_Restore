@interface SGSpotlightContactsAdapter
+ (id)dispatchGroup;
+ (id)entityIdentifiersFromCNIdentifiers:(id)a3;
+ (id)searchableIndex;
+ (void)notifyWhenFlushed:(id)a3;
- (SGSpotlightContactsAdapter)initWithSGSqlEntityStore:(id)a3;
- (SGSqlEntityStore)store;
- (id)coreSpotlightAttributeSetForContact:(id)a3;
- (id)pseudoContactVcardDirectory;
- (id)searchableItemsForContactsForInternalIdentifiers:(id)a3;
- (id)urlForRecordIdVCard:(id)a3;
- (id)urlForStorageContactVCard:(id)a3;
- (void)addContact:(id)a3;
- (void)confirmOrRejectContact:(id)a3;
- (void)removeAllPseudoContactsInIdSet:(id)a3;
- (void)removeAllStoredPseudoContacts;
- (void)sendContactToSpotlight:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation SGSpotlightContactsAdapter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_vCardsDirectoryURL, 0);
}

- (void)setStore:(id)a3
{
}

- (SGSqlEntityStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (SGSqlEntityStore *)WeakRetained;
}

- (void)removeAllPseudoContactsInIdSet:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = sgMap();
    v5 = +[SGSpotlightContactsAdapter dispatchGroup];
    dispatch_group_enter(v5);
    v6 = +[SGSpotlightContactsAdapter searchableIndex];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__SGSpotlightContactsAdapter_removeAllPseudoContactsInIdSet___block_invoke_2;
    v8[3] = &unk_1E65C0100;
    v9 = v5;
    v7 = v5;
    [v6 deleteSearchableItemsWithIdentifiers:v4 completionHandler:v8];
  }
}

void __61__SGSpotlightContactsAdapter_removeAllPseudoContactsInIdSet___block_invoke_2(uint64_t a1)
{
}

uint64_t __61__SGSpotlightContactsAdapter_removeAllPseudoContactsInIdSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1B8F8] contactIdentifierFromSuggestionID:a2];
}

- (void)removeAllStoredPseudoContacts
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = +[SGSpotlightContactsAdapter dispatchGroup];
  dispatch_group_enter(v2);
  id v3 = +[SGSpotlightContactsAdapter searchableIndex];
  v8[0] = @"pseudoContacts";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SGSpotlightContactsAdapter_removeAllStoredPseudoContacts__block_invoke;
  v6[3] = &unk_1E65C0100;
  v7 = v2;
  v5 = v2;
  [v3 deleteSearchableItemsWithDomainIdentifiers:v4 completionHandler:v6];
}

void __59__SGSpotlightContactsAdapter_removeAllStoredPseudoContacts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "Could not delete all pseudo-contacts: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)confirmOrRejectContact:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 bestProfile];
  uint64_t v5 = [v4 masterEntityId];
  if (!v5) {
    uint64_t v5 = [v3 masterEntityId];
  }

  id v6 = [MEMORY[0x1E4F5DB20] recordIdForContactWithRowId:v5];
  uint64_t v7 = +[SGSpotlightContactsAdapter dispatchGroup];
  dispatch_group_enter(v7);
  v8 = +[SGSpotlightContactsAdapter searchableIndex];
  v9 = [MEMORY[0x1E4F1B8F8] contactIdentifierFromSuggestionID:v6];
  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SGSpotlightContactsAdapter_confirmOrRejectContact___block_invoke;
  v12[3] = &unk_1E65C0100;
  v13 = v7;
  v11 = v7;
  [v8 deleteSearchableItemsWithIdentifiers:v10 completionHandler:v12];
}

void __53__SGSpotlightContactsAdapter_confirmOrRejectContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "Could not delete pseudo-contact from Spotlight: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)addContact:(id)a3
{
  id v4 = a3;
  int v5 = [(SGSpotlightContactsAdapter *)self store];
  if (v5)
  {
    id v6 = [v4 convertToContact:v5];
    if ([v5 historyHasContact:v6])
    {
      uint64_t v7 = sgLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "Not sending pseudo-contact to Spotlight because it was confirmed or rejected", buf, 2u);
      }
      goto LABEL_16;
    }
    v8 = +[SGContactStoreFactory contactStore];
    uint64_t v11 = 0;
    uint64_t v7 = +[SGCuratedContactMatcher curatedContactsFromContactStore:v8 matchingPseudoContact:v6 error:&v11];

    if ([v7 count])
    {
      v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v10 = "Not sending pseudo-contact to Spotlight because it is already in the curated contacts";
LABEL_14:
        _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
      }
    }
    else
    {
      [v5 filterOutRejectedDetailsFromContact:v6];
      if ([v6 containsDetailSuggestions])
      {
        [(SGSpotlightContactsAdapter *)self sendContactToSpotlight:v6];
LABEL_16:

        goto LABEL_17;
      }
      v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v10 = "Not sending pseudo-contact to Spotlight because it has no original details";
        goto LABEL_14;
      }
    }

    goto LABEL_16;
  }
  id v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "Not sending pseudo-contact to Spotlight because the store is missing", buf, 2u);
  }
LABEL_17:
}

- (void)sendContactToSpotlight:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v4 recordId];
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Sending pseudo-contact with id %@ to CoreSpotlight", buf, 0xCu);
  }
  id v6 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v7 = [v4 recordId];
  v8 = [v6 contactIdentifierFromSuggestionID:v7];

  v9 = [(SGSpotlightContactsAdapter *)self coreSpotlightAttributeSetForContact:v4];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v8 domainIdentifier:@"pseudoContacts" attributeSet:v9];
  uint64_t v11 = +[SGSpotlightContactsAdapter searchableIndex];
  v12 = +[SGSpotlightContactsAdapter dispatchGroup];
  dispatch_group_enter(v12);
  v18 = v10;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__SGSpotlightContactsAdapter_sendContactToSpotlight___block_invoke;
  v16[3] = &unk_1E65C0100;
  v17 = v12;
  v14 = v12;
  [v11 indexSearchableItems:v13 completionHandler:v16];
}

void __53__SGSpotlightContactsAdapter_sendContactToSpotlight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "Could not index contact in CoreSpotlight: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)searchableItemsForContactsForInternalIdentifiers:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__SGSpotlightContactsAdapter_searchableItemsForContactsForInternalIdentifiers___block_invoke;
  v10[3] = &unk_1E65C00D8;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __79__SGSpotlightContactsAdapter_searchableItemsForContactsForInternalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = (void *)MEMORY[0x1E4F5DB20];
  id v6 = a3;
  objc_msgSend(v5, "recordIdWithInternalEntityId:", objc_msgSend(a2, "longLongValue"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [MEMORY[0x1E4F1B8F8] contactIdentifierFromSuggestionID:v10];
  id v8 = [*(id *)(a1 + 32) coreSpotlightAttributeSetForContact:v6];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v7 domainIdentifier:@"pseudoContacts" attributeSet:v8];
  [*(id *)(a1 + 40) addObject:v9];
}

- (id)coreSpotlightAttributeSetForContact:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F23850]);
  uint64_t v7 = (void *)[v6 initWithContentType:*MEMORY[0x1E4F44368]];
  id v8 = objc_alloc(MEMORY[0x1E4F237C0]);
  uint64_t v9 = [v8 initWithKeyName:*MEMORY[0x1E4F234D0]];
  if (!v9)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2 object:self file:@"SGSpotlightContactsAdapter.m" lineNumber:147 description:@"failed to create a CSCustomAttributeKey for MDItemRelatedAppBundleIdentifier"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v11 = [v5 name];

  if (v11)
  {
    v12 = [v5 name];
    [v12 fullName];
  }
  else
  {
    v13 = [v5 emailAddresses];
    v12 = [v13 firstObject];

    [v12 emailAddress];
  v14 = };
  [v7 setDisplayName:v14];

  if (WeakRetained)
  {
    v15 = [v12 recordId];
    v16 = [WeakRetained loadOriginByRecordId:v15];

    v17 = [v16 bundleId];
    [v7 setValue:v17 forCustomKey:v9];
  }
  v51 = WeakRetained;
  v52 = (void *)v9;

  v18 = [v7 displayName];
  [v7 setTitle:v18];

  v19 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v53 = v5;
  v20 = [v5 postalAddresses];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v55;
    char v24 = 1;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(v20);
        }
        v26 = [*(id *)(*((void *)&v54 + 1) + 8 * i) components];
        v27 = [v26 city];
        uint64_t v28 = [v27 length];

        if (v28)
        {
          v29 = [v26 city];
          if (v24) {
            [v7 setCity:v29];
          }
          else {
            [v19 addObject:v29];
          }
        }
        v30 = [v26 state];
        uint64_t v31 = [v30 length];

        if (v31)
        {
          v32 = [v26 state];
          if (v24) {
            [v7 setStateOrProvince:v32];
          }
          else {
            [v19 addObject:v32];
          }
        }
        v33 = [v26 country];
        uint64_t v34 = [v33 length];

        if (v34)
        {
          v35 = [v26 country];
          if (v24) {
            [v7 setCountry:v35];
          }
          else {
            [v19 addObject:v35];
          }
        }
        v36 = [v26 street];

        if (v36)
        {
          v37 = [v26 street];
          [v19 addObject:v37];
        }
        v38 = [v26 postalCode];

        if (v38)
        {
          v39 = [v26 postalCode];
          [v19 addObject:v39];
        }
        char v24 = 0;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v58 count:16];
      char v24 = 0;
    }
    while (v22);
  }

  if ([v19 count])
  {
    v40 = objc_msgSend(v19, "_pas_componentsJoinedByString:", @" ");
    [v7 setTextContent:v40];
  }
  v41 = [v53 emailAddresses];
  uint64_t v42 = [v41 count];

  if (v42)
  {
    v43 = [v53 emailAddresses];
    v44 = sgMap();
    [v7 setEmailAddresses:v44];
  }
  v45 = [v53 phones];
  uint64_t v46 = [v45 count];

  if (v46)
  {
    v47 = [v53 phones];
    v48 = sgMap();
    [v7 setPhoneNumbers:v48];
  }
  return v7;
}

uint64_t __66__SGSpotlightContactsAdapter_coreSpotlightAttributeSetForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 phoneNumber];
}

uint64_t __66__SGSpotlightContactsAdapter_coreSpotlightAttributeSetForContact___block_invoke(uint64_t a1, void *a2)
{
  return [a2 emailAddress];
}

- (id)urlForStorageContactVCard:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bestProfile];
  uint64_t v6 = [v5 masterEntityId];
  if (!v6) {
    uint64_t v6 = [v4 masterEntityId];
  }

  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu.vcf", v6);
  id v8 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v9 = [(SGSpotlightContactsAdapter *)self pseudoContactVcardDirectory];
  id v10 = [v9 URLByAppendingPathComponent:v7 isDirectory:0];

  return v10;
}

- (id)urlForRecordIdVCard:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu.vcf", objc_msgSend(v4, "internalEntityId"));
  uint64_t v6 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v7 = [(SGSpotlightContactsAdapter *)self pseudoContactVcardDirectory];
  id v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:0];

  return v8;
}

- (id)pseudoContactVcardDirectory
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  if (v2->_vCardsDirectoryURL) {
    goto LABEL_6;
  }
  id v4 = (void *)MEMORY[0x1CB79B230](v3);
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = 0;
  uint64_t v6 = [v5 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v22];
  uint64_t v7 = (NSURL *)v22;

  if (v7)
  {
    id v8 = sgLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

      char v9 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    char v24 = v7;
    v18 = "failed to get URL for library directory: %@";
    v19 = v8;
    uint32_t v20 = 12;
LABEL_22:
    _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    goto LABEL_4;
  }
  uint64_t v12 = [v6 URLByAppendingPathComponent:@"Metadata/com.apple.IntelligentSuggestions/"];
  vCardsDirectoryURL = v2->_vCardsDirectoryURL;
  v2->_vCardsDirectoryURL = (NSURL *)v12;

  v14 = v2->_vCardsDirectoryURL;
  if (!v14)
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "_vCardsDirectoryURL is nil", buf, 2u);
    }
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  if ([(NSURL *)v14 checkResourceIsReachableAndReturnError:0])
  {
    uint64_t v7 = 0;
  }
  else
  {
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    v16 = v2->_vCardsDirectoryURL;
    id v21 = 0;
    [v15 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v21];
    uint64_t v7 = (NSURL *)v21;

    if (v7)
    {
      id v8 = sgLogHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      v17 = v2->_vCardsDirectoryURL;
      *(_DWORD *)buf = 138412546;
      char v24 = v17;
      __int16 v25 = 2112;
      v26 = v7;
      v18 = "failed to create %@: %@";
      v19 = v8;
      uint32_t v20 = 22;
      goto LABEL_22;
    }
  }
  char v9 = 1;
LABEL_5:

  if (v9)
  {
LABEL_6:
    objc_sync_exit(v2);

    id v10 = v2->_vCardsDirectoryURL;
    goto LABEL_7;
  }
  objc_sync_exit(v2);

  id v10 = 0;
LABEL_7:
  return v10;
}

- (SGSpotlightContactsAdapter)initWithSGSqlEntityStore:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSpotlightContactsAdapter *)self init];
  uint64_t v6 = v5;
  if (v5) {
    [(SGSpotlightContactsAdapter *)v5 setStore:v4];
  }

  return v6;
}

+ (id)entityIdentifiersFromCNIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [MEMORY[0x1E4F1B8F8] suggestionIDFromContactIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", objc_msgSend(v10, "internalEntityId"));
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)notifyWhenFlushed:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = [a1 dispatchGroup];
  if (notifyWhenFlushed___pasOnceToken5 != -1) {
    dispatch_once(&notifyWhenFlushed___pasOnceToken5, &__block_literal_global_11_40805);
  }
  id v5 = (id)notifyWhenFlushed___pasExprOnceResult;
  if (dispatch_group_wait(v4, 0)) {
    dispatch_group_notify(v4, v5, block);
  }
  else {
    dispatch_sync(v5, block);
  }
}

void __48__SGSpotlightContactsAdapter_notifyWhenFlushed___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("SGSpotlightContactsAdapter-notify", v1);
  id v3 = (void *)notifyWhenFlushed___pasExprOnceResult;
  notifyWhenFlushed___pasExprOnceResult = (uint64_t)v2;
}

+ (id)dispatchGroup
{
  if (dispatchGroup__pasOnceToken4 != -1) {
    dispatch_once(&dispatchGroup__pasOnceToken4, &__block_literal_global_9);
  }
  dispatch_queue_t v2 = (void *)dispatchGroup__pasExprOnceResult;
  return v2;
}

void __43__SGSpotlightContactsAdapter_dispatchGroup__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  dispatch_group_t v1 = dispatch_group_create();
  dispatch_queue_t v2 = (void *)dispatchGroup__pasExprOnceResult;
  dispatchGroup__pasExprOnceResult = (uint64_t)v1;
}

+ (id)searchableIndex
{
  if (searchableIndex__pasOnceToken3 != -1) {
    dispatch_once(&searchableIndex__pasOnceToken3, &__block_literal_global_40808);
  }
  dispatch_queue_t v2 = (void *)searchableIndex__pasExprOnceResult;
  return v2;
}

void __45__SGSpotlightContactsAdapter_searchableIndex__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_alloc(MEMORY[0x1E4F23838]);
  uint64_t v2 = [v1 initWithName:@"CoreSuggestions-contacts" bundleIdentifier:*MEMORY[0x1E4F5DEE0]];
  id v3 = (void *)searchableIndex__pasExprOnceResult;
  searchableIndex__pasExprOnceResult = v2;
}

@end