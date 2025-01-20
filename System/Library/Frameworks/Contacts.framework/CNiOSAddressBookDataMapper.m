@interface CNiOSAddressBookDataMapper
+ (const)_copyLocalSourceIfEnabledInAddressBook:;
+ (id)_copyEligiblePrimarySourceForAccountWithIdentifier:(uint64_t)a3 addressBook:(void *)a4 error:;
+ (id)contactBuffersDecoderForFetchRequest:(id)a3;
+ (id)encodedPeopleFetcherForForFetchRequest:(id)a3 addressBook:(void *)a4 managedConfiguration:(id)a5 addressBookCompletionHandler:(id)a6 cursorCompletionHandler:(id)a7 environment:(id)a8 identifierAuditMode:(int64_t)a9 authorizationContext:(id)a10;
+ (id)os_log;
+ (void)initialize;
- (BOOL)_fetchAccountsInSaveContext:(void *)a3 error:;
- (BOOL)_fetchAllRecordsInSaveContext:(void *)a3 error:;
- (BOOL)_fetchContactsInSaveContext:(void *)a3 error:;
- (BOOL)_fetchContainersInSaveContext:(void *)a3 error:;
- (BOOL)_fetchGroupsInSaveContext:(void *)a3 error:;
- (BOOL)_processContactChangeRequestsFromSaveContext:(void *)a3 error:;
- (BOOL)_processContactMembershipsFromSaveContext:(void *)a3 error:;
- (BOOL)_processContactsFromSaveContext:(void *)a3 error:;
- (BOOL)_processContainersFromSaveContext:(void *)a3 error:;
- (BOOL)_processGroupsFromSaveContext:(void *)a3 error:;
- (BOOL)_processSubgroupMembershipsFromSaveContext:(void *)a3 error:;
- (BOOL)analyzeDatabaseWithError:(id *)a3;
- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)fetchContactsForFetchRequest:(id)a3 error:(id *)a4 batchHandler:(id)a5;
- (BOOL)fetchEncodedContactsForFetchRequest:(id)a3 error:(id *)a4 cancelationToken:(id)a5 batchHandler:(id)a6;
- (BOOL)hasGroups;
- (BOOL)hasMultipleGroupsOrAccounts;
- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6;
- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4;
- (BOOL)resetSortDataIfNeededWithError:(id *)a3;
- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6;
- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5;
- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3;
- (BOOL)shouldCaptureMetricsForQueries;
- (BOOL)shouldLogContactsAccess;
- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (CNiOSAddressBookDataMapper)init;
- (CNiOSAddressBookDataMapper)initWithConfiguration:(id)a3;
- (CNiOSAddressBookDataMapper)initWithConfiguration:(id)a3 addressBook:(id)a4;
- (NSString)legacyTetheredSyncComputerAnchor;
- (NSString)legacyTetheredSyncDeviceAnchor;
- (__CFArray)copyChangeTableRowIDsFromChangeIDs:(__CFArray *)Mutable;
- (id)_containersMatchingPredicate:(char)a3 remote:(void *)a4 error:;
- (id)_defaultSourceInAddressBook:(void *)a3 error:;
- (id)_legacyContactCountForFetchRequest:(void *)a3 error:;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4;
- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactIdentifierWithMatchingDictionary:(id)a3;
- (id)contactObservableForFetchRequest:(id)a3;
- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4;
- (id)containersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)currentHistoryAnchor;
- (id)currentHistoryToken;
- (id)defaultContainerIdentifier;
- (id)defaultContainerIdentifierForAddressBook:(void *)a3 error:;
- (id)descriptorForRequiredKeysForMatchingDictionary;
- (id)encodedContactsCursorForFetchRequest:(id)a3 cursorCleanupBlock:(id)a4 error:(id *)a5;
- (id)encodedPeopleFetcherWithAddressBook:(void *)a3 addressBookCleanupBlock:(void *)a4 cursorCleanupBlock:(void *)a5 fetchRequest:;
- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5;
- (id)fetchAndDecodeEncodedContactsForFetchRequest:(void *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:;
- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3;
- (id)getLimitedAccessContactsCountForBundle:(id)a3;
- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3;
- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3;
- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)groupsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)identifierWithError:(id *)a3;
- (id)legacyTetheredSyncAnchorForKey:(uint64_t)a1;
- (id)matchingDictionaryForContact:(id)a3;
- (id)meContactIdentifiers:(id *)a3;
- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4;
- (id)policyWithDescription:(id)a3 error:(id *)a4;
- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3;
- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4;
- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4;
- (id)unifiedContactCountWithError:(id *)a3;
- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4;
- (id)userActivityUserInfoForContact:(id)a3;
- (int)saveSequenceCount;
- (uint64_t)_canReadUnderManagementRestrictionsFromSource:(uint64_t)a1 inAddressBook:;
- (uint64_t)_canWriteUnderManagementRestrictionsToSource:(uint64_t)a1 inAddressBook:;
- (uint64_t)_hasManagedAccessToReadFromAccountCorrespondingToSource:(uint64_t)result fromAddressBook:;
- (uint64_t)_hasManagedAccessToWriteToAccountCorrespondingToSource:(uint64_t)result fromAddressBook:;
- (uint64_t)_hasManagedWriteAccessToAccountContainingPerson:(void *)a3 fromSaveContext:;
- (uint64_t)_hasManagementRestrictionsEnabled;
- (uint64_t)_processAccountsFromSaveContext:(void *)a3 error:;
- (uint64_t)_purgeMetadataFromDeletedContactsFromSaveContext:(void *)a3 error:;
- (uint64_t)addressBook;
- (uint64_t)canExecuteSaveRequest:(void *)a3 error:;
- (uint64_t)copySourceForContainerIdentifier:(uint64_t)a1 fromAddressBook:(void *)a2;
- (void)_alternativeSourceWithAccessibleAccountFromAddressBook:(void *)a1;
- (void)_logDeleteHasError:(uint64_t)a1;
- (void)_logDeleteHasFoundAtLeastOnePersistedContactIdentifier:(uint64_t)a1;
- (void)_logDeleteHasManagedWriteAccess:(void *)a3 contactIdentifier:;
- (void)_logDeleteHasNoABRecordForContactIdentifier:(uint64_t)a1;
- (void)_logDeleteHasNoPersistedContactIdentifier:(uint64_t)a1;
- (void)_logDeleteHasRemovedRecordWithResult:(void *)a3 err:;
- (void)_logDeleteSuccess:(int)a3 hasFoundAtLeastOneBackingPerson:(int)a4 hasDeletedAtLeastOneLinkedContact:(int)a5 hasFoundMissingContactWithNoSnapshot:;
- (void)_logIgnoringSuggestedLinkedSetContactIdentifier:(uint64_t)a1;
- (void)_logIngoringImplicitAugmentationLinkedSetContactIdentifier:(uint64_t)a1;
- (void)_logWillDeleteLinkedSetContactIdentifier:(uint64_t)a1;
- (void)_logWillDeleteWithSaveContext:(uint64_t)a1;
- (void)_postProcessContactsFromSaveContext:(uint64_t)a1;
- (void)_postProcessContainersFromSaveContext:(uint64_t)a1;
- (void)_postProcessGroupsFromSaveContext:(uint64_t)a1;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)applyLimitedAccessSyncEvents:(id)a3;
- (void)dropAllLimitedAccessRows;
- (void)dropAllLimitedAccessRowsAndSyncNotify;
- (void)purgeLimitedAccessRecordsForBundle:(id)a3;
- (void)removeContactIdentifiersFromLimitedAcessForAllBundles:(uint64_t)a1;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
- (void)setLegacyTetheredSyncAnchor:(uint64_t)a3 forKey:;
- (void)setLegacyTetheredSyncComputerAnchor:(id)a3;
- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3;
- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3;
- (void)updateLimitedAccessListForSaveRequest:(void *)a3 authorizationContext:;
- (void)updateLimitedAccessTable:(id)a3;
@end

@implementation CNiOSAddressBookDataMapper

id __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5A490];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 identifier];
  v6 = [v3 objectForKeyedSubscript:v5];
  v7 = [v2 pairWithFirst:v4 second:v6];

  return v7;
}

id __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  v5 = [*(id *)(a1 + 32) effectivePredicate];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_2;
  aBlock[3] = &unk_1E56B48E8;
  id v6 = v3;
  id v21 = v6;
  v7 = _Block_copy(aBlock);
  if (([*(id *)(a1 + 32) disallowsEncodedFetch] & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "cn_supportsEncodedFetching"))
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(id **)(a1 + 40);
    uint64_t v19 = 0;
    v10 = (id *)&v19;
    unsigned __int8 v11 = -[CNiOSAddressBookDataMapper fetchAndDecodeEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:](v8, v9, &v19, v4, v7);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    uint64_t v18 = 0;
    v10 = (id *)&v18;
    unsigned __int8 v11 = [v12 fetchContactsForFetchRequest:v13 error:&v18 batchHandler:v7];
  }
  unsigned __int8 v14 = v11;
  id v15 = *v10;
  v16 = v15;
  if ((v14 & 1) != 0 || !v15) {
    [v6 observerDidComplete];
  }
  else {
    [v6 observerDidFailWithError:v15];
  }

  return v4;
}

- (id)fetchAndDecodeEncodedContactsForFetchRequest:(void *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    v12 = [(id)objc_opt_class() contactBuffersDecoderForFetchRequest:v9];
    id v13 = a1[4];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__16;
    v38 = __Block_byref_object_dispose__16;
    id v39 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    id v29 = 0;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
    v23 = &unk_1E56B5C30;
    v27 = &v30;
    id v14 = v12;
    id v24 = v14;
    id v26 = v11;
    id v15 = v13;
    id v25 = v15;
    v28 = &v34;
    a1 = (id *)[a1 fetchEncodedContactsForFetchRequest:v9 error:&v29 cancelationToken:v10 batchHandler:&v20];
    id v16 = v29;
    if (!*((unsigned char *)v31 + 24)) {
      objc_msgSend(v15, "didFetchContacts:error:", 0, v16, v20, v21, v22, v23, v24);
    }
    v17 = v16;
    if (!v16) {
      v17 = (void *)v35[5];
    }
    if (a3) {
      char v18 = (char)a1;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) == 0) {
      *a3 = v17;
    }

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
  }
  return a1;
}

- (BOOL)fetchEncodedContactsForFetchRequest:(id)a3 error:(id *)a4 cancelationToken:(id)a5 batchHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__16;
  v44 = __Block_byref_object_dispose__16;
  id v45 = 0;
  id v13 = [v10 effectivePredicate];
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  id v15 = logger;
  uint64_t v16 = [v10 unifyResults];
  v17 = [v10 keysToFetch];
  [(CNContactsLogger *)v15 fetchEncodedContactsMatchingPredicate:v13 unifyResults:v16 keysToFetch:v17];

  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  uint64_t v19 = addressBook;
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
  char v33 = &unk_1E56B5C80;
  uint64_t v34 = self;
  id v20 = v10;
  id v35 = v20;
  v38 = &v46;
  id v39 = &v40;
  id v21 = v11;
  id v36 = v21;
  id v22 = v12;
  id v37 = v22;
  v23 = [(CNiOSAddressBook *)v19 performSynchronousWorkWithInvalidatedAddressBook:&v30];

  if (objc_msgSend(v23, "isFailure", v30, v31, v32, v33, v34))
  {
    uint64_t v24 = [v23 error];
    id v25 = (void *)v41[5];
    v41[5] = v24;
  }
  if (*((unsigned char *)v47 + 24))
  {
    BOOL v26 = 1;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (self) {
    v27 = self->_logger;
  }
  else {
    v27 = 0;
  }
  v28 = v27;
  [(CNContactsLogger *)v28 didFetchEncodedContacts:0 error:v41[5]];

  BOOL v26 = *((unsigned char *)v47 + 24) != 0;
  if (a4)
  {
LABEL_13:
    if (!v26) {
      *a4 = (id) v41[5];
    }
  }
LABEL_15:

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v26;
}

void __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id v6 = *(void **)(v5 + 40);
  }
  else {
    id v6 = 0;
  }
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v7) {
    v7 = (void *)v7[3];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v11 = *(void *)(v9 + 64);
    uint64_t v10 = *(void *)(v9 + 72);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  id v12 = v7;
  id v13 = v6;
  id v14 = [v4 encodedPeopleFetcherForForFetchRequest:v8 addressBook:a2 managedConfiguration:v13 addressBookCompletionHandler:0 cursorCompletionHandler:0 environment:v12 identifierAuditMode:v10 authorizationContext:v11];

  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v15 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
  v17[3] = &unk_1E56B5C58;
  v17[4] = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  LOBYTE(v16) = [v14 fetchEncodedPeopleWithError:&obj cancelationToken:v16 batchHandler:v17];
  objc_storeStrong((id *)(v15 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v16;
}

+ (id)encodedPeopleFetcherForForFetchRequest:(id)a3 addressBook:(void *)a4 managedConfiguration:(id)a5 addressBookCompletionHandler:(id)a6 cursorCompletionHandler:(id)a7 environment:(id)a8 identifierAuditMode:(int64_t)a9 authorizationContext:(id)a10
{
  id v16 = a10;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  id v22 = [[CNiOSEncodedPeopleFetcher alloc] initWithFetchRequest:v21 addressBook:a4 managedConfiguration:v20 addressBookCompletionHandler:v19 cursorCompletionHandler:v18 environment:v17 identifierAuditMode:a9 authorizationContext:v16];

  return v22;
}

+ (id)contactBuffersDecoderForFetchRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABContactBuffersDecoder alloc] initWithFetchRequest:v3];

  return v4;
}

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F5A480];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke;
  v9[3] = &unk_1E56B4910;
  id v10 = v4;
  uint64_t v11 = self;
  id v6 = v4;
  v7 = [v5 observableWithBlock:v9];

  return v7;
}

void __51__CNiOSAddressBookDataMapper_meContactIdentifiers___block_invoke(uint64_t a1)
{
  v2 = (const void *)ABAddressBookCopyMe();
  if (v2)
  {
    id v3 = v2;
    CFTypeRef v4 = ABRecordCopyValue(v2, *MEMORY[0x1E4F49BB8]);
    if (v4)
    {
      uint64_t v5 = CFAutorelease(v4);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    CFRelease(v3);
  }
}

uint64_t __92__CNiOSAddressBookDataMapper_encodedContactsCursorForFetchRequest_cursorCleanupBlock_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[CNiOSAddressBookDataMapper encodedPeopleFetcherWithAddressBook:addressBookCleanupBlock:cursorCleanupBlock:fetchRequest:](*(void *)(a1 + 32), a2, a3, *(void **)(a1 + 48), *(void **)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (id)encodedPeopleFetcherWithAddressBook:(void *)a3 addressBookCleanupBlock:(void *)a4 cursorCleanupBlock:(void *)a5 fetchRequest:
{
  id v9 = a3;
  id v10 = v9;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __122__CNiOSAddressBookDataMapper_encodedPeopleFetcherWithAddressBook_addressBookCleanupBlock_cursorCleanupBlock_fetchRequest___block_invoke;
    aBlock[3] = &unk_1E56B5CA8;
    id v23 = v9;
    id v11 = a5;
    id v12 = a4;
    id v13 = _Block_copy(aBlock);
    id v14 = objc_opt_class();
    uint64_t v15 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 72);
    id v18 = *(id *)(a1 + 24);
    id v19 = v15;
    id v20 = [v14 encodedPeopleFetcherForForFetchRequest:v11 addressBook:a2 managedConfiguration:v19 addressBookCompletionHandler:v13 cursorCompletionHandler:v12 environment:v18 identifierAuditMode:v16 authorizationContext:v17];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke()
{
}

uint64_t __59__CNiOSAddressBookDataMapper_unifiedContactCountWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSNumber numberWithUnsignedInteger:ABAddressBookGetPreferredNamePeopleCountForManagedConfiguration()];

  return MEMORY[0x1F41817F8]();
}

uint64_t __122__CNiOSAddressBookDataMapper_encodedPeopleFetcherWithAddressBook_addressBookCleanupBlock_cursorCleanupBlock_fetchRequest___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)currentHistoryToken
{
  v2 = [(CNiOSAddressBookDataMapper *)self currentHistoryAnchor];
  id v3 = [v2 value];
  CFTypeRef v4 = [v3 historyToken];

  return v4;
}

- (BOOL)shouldLogContactsAccess
{
  return 1;
}

void __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, void *a2)
{
  CFTypeRef v4 = *(void **)(a1 + 32);
  if (v4) {
    CFTypeRef v4 = (void *)v4[4];
  }
  uint64_t v5 = v4;
  id v7 = a2;
  uint64_t v6 = [v7 data];
  [v5 didFetchEncodedContacts:v6 error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 data];
  if ([v6 length])
  {
    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = [v5 data];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
      v13[3] = &unk_1E56B4960;
      id v14 = *(id *)(a1 + 32);
      id v15 = v5;
      id v17 = *(id *)(a1 + 48);
      id v16 = *(id *)(a1 + 40);
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v10 + 40);
      char v11 = [v8 decodeContactsFromData:v9 moreComing:a3 ^ 1u replyHandler:v13 error:&obj];
      objc_storeStrong((id *)(v10 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
    }
  }
  else
  {
  }
}

void __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  CFTypeRef v4 = [*(id *)(a1 + 40) matchInfo];
  id v5 = [v3 contactMatchInfosFromABMatchInfos:v4 contacts:v6];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 48) didFetchContacts:v6 error:0];
  }
}

void __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_3;
  v8[3] = &unk_1E56B48C0;
  id v9 = v5;
  id v6 = v5;
  int v7 = objc_msgSend(a2, "_cn_map:", v8);
  [*(id *)(a1 + 32) observerDidReceiveResult:v7];
}

- (id)currentHistoryAnchor
{
  v2 = self;
  if (self) {
    self = (CNiOSAddressBookDataMapper *)self->_authorizationContext;
  }
  if ([(CNiOSAddressBookDataMapper *)self isLimitedAccessGranted])
  {
    id v3 = (void *)MEMORY[0x1E4F5A4E0];
    CFTypeRef v4 = +[CNChangeHistoryAnchor limitedAccessHistoryAnchor];
    id v5 = [v3 resultWithValue:v4 orError:0];
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__16;
    id v18 = __Block_byref_object_dispose__16;
    id v19 = 0;
    if (v2) {
      addressBook = v2->_addressBook;
    }
    else {
      addressBook = 0;
    }
    int v7 = addressBook;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__CNiOSAddressBookDataMapper_currentHistoryAnchor__block_invoke;
    v13[3] = &unk_1E56B5B18;
    void v13[4] = &v14;
    uint64_t v8 = [(CNiOSAddressBook *)v7 performSynchronousWorkWithInvalidatedAddressBook:v13];

    id v9 = (void *)MEMORY[0x1E4F5A4E0];
    uint64_t v10 = v15[5];
    char v11 = [v8 error];
    id v5 = [v9 resultWithValue:v10 orError:v11];

    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

- (id)meContactIdentifiers:(id *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__16;
  id v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  id v5 = addressBook;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__CNiOSAddressBookDataMapper_meContactIdentifiers___block_invoke;
  v14[3] = &unk_1E56B5B18;
  v14[4] = &v15;
  id v6 = [(CNiOSAddressBook *)v5 performSynchronousWorkWithInvalidatedAddressBook:v14];

  if ([v6 isSuccess])
  {
    if (v16[5])
    {
      v21[0] = v16[5];
      int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    }
    else
    {
      int v7 = 0;
    }
    char v11 = +[CNErrorFactory errorWithCode:200];
    id v12 = v7;
    id v9 = v12;
    if (a3 && !v12) {
      *a3 = v11;
    }

    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = [v6 error];
    id v9 = v8;
    uint64_t v10 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)unifiedContactCountWithError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  id v6 = addressBook;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__CNiOSAddressBookDataMapper_unifiedContactCountWithError___block_invoke;
  v13[3] = &unk_1E56B5B40;
  void v13[4] = self;
  void v13[5] = &v14;
  int v7 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:v13];

  uint64_t v8 = (void *)v15[5];
  id v9 = [v7 error];
  id v10 = v8;
  char v11 = v10;
  if (a3 && !v10) {
    *a3 = v9;
  }

  _Block_object_dispose(&v14, 8);

  return v11;
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  if (self) {
    authorization = self->_authorization;
  }
  else {
    authorization = 0;
  }
  id v10 = 0;
  id v6 = authorization;
  BOOL v7 = [(CNAuthorization *)v6 requestAccessForEntityType:0 error:&v10];
  id v8 = v10;

  if (a4 && !v7) {
    *a4 = v8;
  }

  return v7;
}

- (CNiOSAddressBookDataMapper)initWithConfiguration:(id)a3 addressBook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CNiOSAddressBookDataMapper;
  id v8 = [(CNiOSAddressBookDataMapper *)&v34 init];
  if (v8)
  {
    id v9 = [v6 environment];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = +[CNContactsEnvironment currentEnvironment];
    }
    id v12 = v11;

    if (v7)
    {
      id v13 = (CNiOSAddressBook *)v7;
    }
    else
    {
      id v13 = [v12 addressBook];
    }
    addressBook = v8->_addressBook;
    v8->_addressBook = v13;

    objc_storeStrong((id *)&v8->_environment, v12);
    uint64_t v15 = [v6 managedConfiguration];
    managedConfiguration = v8->_managedConfiguration;
    v8->_managedConfiguration = (CNManagedConfiguration *)v15;

    uint64_t v17 = [v12 loggerProvider];
    uint64_t v18 = [v17 contactsLogger];
    logger = v8->_logger;
    v8->_logger = (CNContactsLogger *)v18;

    uint64_t v20 = [MEMORY[0x1E4F5A438] sharedCache];
    managedAccountsCache = v8->_managedAccountsCache;
    v8->_managedAccountsCache = (CNManagedAccountsCache *)v20;

    id v22 = [CNAuthorization alloc];
    id v23 = [v6 assumedIdentity];
    uint64_t v24 = [(CNAuthorization *)v22 initWithAssumedIdentity:v23];
    authorization = v8->_authorization;
    v8->_authorization = (CNAuthorization *)v24;

    v8->_contactIdentifierAuditMode = [v6 identifierAuditMode];
    BOOL v26 = [v6 authorizationContext];
    v27 = v26;
    if (v26)
    {
      v28 = v26;
      authorizationContext = (CNAuthorization *)v8->_authorizationContext;
      v8->_authorizationContext = v28;
    }
    else
    {
      authorizationContext = v8->_authorization;
      uint64_t v30 = [(CNAuthorization *)authorizationContext authorizationContext];
      uint64_t v31 = v8->_authorizationContext;
      v8->_authorizationContext = (CNAuthorizationContext *)v30;
    }
    uint64_t v32 = v8;
  }
  return v8;
}

- (BOOL)shouldCaptureMetricsForQueries
{
  return 1;
}

- (CNiOSAddressBookDataMapper)initWithConfiguration:(id)a3
{
  return [(CNiOSAddressBookDataMapper *)self initWithConfiguration:a3 addressBook:0];
}

void __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke_2(uint64_t a1, void *a2, CFIndex a3)
{
  id v5 = NSNumber;
  CFArrayRef v6 = *(const __CFArray **)(a1 + 40);
  id v7 = a2;
  objc_msgSend(v5, "numberWithInteger:", CFArrayGetValueAtIndex(v6, a3));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [MEMORY[0x1E4F5A490] pairWithFirst:v7 second:v9];

  [*(id *)(a1 + 32) addObject:v8];
}

uint64_t __50__CNiOSAddressBookDataMapper_currentHistoryAnchor__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [[CNChangeHistoryAnchor alloc] initWithSequenceNumber:(int)ABAddressBookGetSequenceNumber()];

  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CNiOSAddressBookDataMapper;
  objc_msgSendSuper2(&v2, sel_initialize);
  ABInitialize();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_managedAccountsCache, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_addressBook, 0);
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  id v5 = 0;
  CFArrayRef v6 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__16;
  BOOL v26 = __Block_byref_object_dispose__16;
  id v27 = 0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (self) {
      addressBook = self->_addressBook;
    }
    else {
      addressBook = 0;
    }
    id v10 = addressBook;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke;
    v20[3] = &unk_1E56B5BB8;
    BOOL v21 = a3 == 3;
    v20[4] = self;
    v20[5] = &v22;
    CFArrayRef v6 = [(CNiOSAddressBook *)v10 performSynchronousWorkWithInvalidatedAddressBook:v20];

    id v5 = (void *)v23[5];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  uint64_t v17 = __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke_3;
  uint64_t v18 = &unk_1E56B5BE0;
  id v11 = v6;
  id v19 = v11;
  id v12 = v5;
  id v13 = v16;
  uint64_t v14 = v13;
  if (a4 && !v12)
  {
    v17((uint64_t)v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v22, 8);

  return v12;
}

- (id)encodedContactsCursorForFetchRequest:(id)a3 cursorCleanupBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  objc_super v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__16;
  id v37 = __Block_byref_object_dispose__16;
  id v38 = 0;
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  id v11 = logger;
  id v12 = [v8 effectivePredicate];
  uint64_t v13 = [v8 unifyResults];
  uint64_t v14 = [v8 keysToFetch];
  [(CNContactsLogger *)v11 fetchEncodedContactsMatchingPredicate:v12 unifyResults:v13 keysToFetch:v14];

  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  uint64_t v16 = addressBook;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __92__CNiOSAddressBookDataMapper_encodedContactsCursorForFetchRequest_cursorCleanupBlock_error___block_invoke;
  v28 = &unk_1E56B5CD0;
  uint64_t v32 = &v33;
  id v29 = self;
  id v17 = v9;
  id v31 = v17;
  id v18 = v8;
  id v30 = v18;
  id v19 = [(CNiOSAddressBook *)v16 performAsynchronousWorkWithInvalidatedAddressBook:&v25];

  uint64_t v20 = (void *)v34[5];
  BOOL v21 = objc_msgSend(v19, "error", v25, v26, v27, v28, v29);
  id v22 = v20;
  id v23 = v22;
  if (a5 && !v22) {
    *a5 = v21;
  }

  _Block_object_dispose(&v33, 8);

  return v23;
}

+ (id)os_log
{
  self;
  if (os_log_cn_once_token_0_8 != -1) {
    dispatch_once(&os_log_cn_once_token_0_8, &__block_literal_global_57);
  }
  v0 = (void *)os_log_cn_once_object_0_8;

  return v0;
}

uint64_t __36__CNiOSAddressBookDataMapper_os_log__block_invoke()
{
  os_log_cn_once_object_0_8 = (uint64_t)os_log_create("com.apple.contacts", "CNiOSAddressBookDataMapper");

  return MEMORY[0x1F41817F8]();
}

- (CNiOSAddressBookDataMapper)init
{
  id v3 = objc_alloc_init(CNDataMapperConfiguration);
  CFTypeRef v4 = [(CNiOSAddressBookDataMapper *)self initWithConfiguration:v3 addressBook:0];

  return v4;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  if (self) {
    self = (CNiOSAddressBookDataMapper *)self->_authorization;
  }
  [(CNiOSAddressBookDataMapper *)self requestAccessForEntityType:a3 completionHandler:a4];
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)identifierWithError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  id v5 = addressBook;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__CNiOSAddressBookDataMapper_identifierWithError___block_invoke;
  v13[3] = &unk_1E56B5B18;
  void v13[4] = &v14;
  CFArrayRef v6 = [(CNiOSAddressBook *)v5 performSynchronousWorkWithInvalidatedAddressBook:v13];

  id v7 = (const void *)v15[3];
  if (v7)
  {
    CFAutorelease(v7);
    id v8 = (void *)v15[3];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 error];
  id v10 = v8;
  id v11 = v10;
  if (a3 && !v10) {
    *a3 = v9;
  }

  _Block_object_dispose(&v14, 8);

  return v11;
}

- (uint64_t)addressBook
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t __50__CNiOSAddressBookDataMapper_identifierWithError___block_invoke(uint64_t a1)
{
  uint64_t result = ABAddressBookCopyUniqueIdentifier();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)saveSequenceCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = -1;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  id v3 = addressBook;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__CNiOSAddressBookDataMapper_saveSequenceCount__block_invoke;
  v6[3] = &unk_1E56B5B18;
  v6[4] = &v7;
  id v4 = [(CNiOSAddressBook *)v3 performSynchronousWorkWithInvalidatedAddressBook:v6];

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return (int)v3;
}

uint64_t __47__CNiOSAddressBookDataMapper_saveSequenceCount__block_invoke(uint64_t a1)
{
  uint64_t result = ABAddressBookGetSequenceNumber();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)_legacyContactCountForFetchRequest:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__16;
    BOOL v21 = __Block_byref_object_dispose__16;
    id v22 = 0;
    id v6 = *(id *)(a1 + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__CNiOSAddressBookDataMapper__legacyContactCountForFetchRequest_error___block_invoke;
    v13[3] = &unk_1E56B5B68;
    id v14 = v5;
    uint64_t v15 = a1;
    uint64_t v16 = &v17;
    uint64_t v7 = [v6 performSynchronousWorkWithInvalidatedAddressBook:v13];

    id v8 = (void *)v18[5];
    uint64_t v9 = [v7 error];
    id v10 = v8;
    id v11 = v10;
    if (a3 && !v10) {
      *a3 = v9;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __71__CNiOSAddressBookDataMapper__legacyContactCountForFetchRequest_error___block_invoke(uint64_t a1, const void *a2)
{
  if ([*(id *)(a1 + 32) unifyResults]) {
    uint64_t PreferredNamePeopleCountForManagedConfiguration = ABAddressBookGetPreferredNamePeopleCountForManagedConfiguration();
  }
  else {
    uint64_t PreferredNamePeopleCountForManagedConfiguration = ABAddressBookGetPersonCount(a2);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [NSNumber numberWithUnsignedInteger:PreferredNamePeopleCountForManagedConfiguration];

  return MEMORY[0x1F41817F8]();
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 predicate];

  if (v7)
  {
    id v8 = [CNiOSEncodedPeopleCounter alloc];
    if (self)
    {
      uint64_t v9 = self->_addressBook;
      managedConfiguration = self->_managedConfiguration;
    }
    else
    {
      uint64_t v9 = 0;
      managedConfiguration = 0;
    }
    id v11 = [(CNiOSEncodedPeopleCounter *)v8 initWithFetchRequest:v6 addressBook:v9 managedConfiguration:managedConfiguration];

    if ([(CNiOSEncodedPeopleCounter *)v11 supportsCounting])
    {
      id v12 = [(CNiOSEncodedPeopleCounter *)v11 fetchContactCountWithError:a4];
    }
    else
    {
      uint64_t v13 = +[CNErrorFactory errorWithCode:104];
      id v14 = v13;
      if (a4) {
        *a4 = v13;
      }

      id v12 = 0;
    }
  }
  else
  {
    id v12 = -[CNiOSAddressBookDataMapper _legacyContactCountForFetchRequest:error:]((uint64_t)self, v6, a4);
  }

  return v12;
}

id __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) error];
  objc_super v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[CNErrorFactory genericiOSABError];
  }
  id v4 = v3;

  return v4;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))();
  if (v12 && v11 && !v13)
  {
    uint64_t v33 = 0;
    objc_super v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    if (self) {
      addressBook = self->_addressBook;
    }
    else {
      addressBook = 0;
    }
    uint64_t v15 = addressBook;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke;
    v29[3] = &unk_1E56B5B68;
    id v30 = v11;
    id v31 = v12;
    uint64_t v32 = &v33;
    uint64_t v16 = [(CNiOSAddressBook *)v15 performSynchronousWorkWithInvalidatedAddressBook:v29];

    int v17 = *((unsigned __int8 *)v34 + 24);
    BOOL v18 = *((unsigned char *)v34 + 24) != 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    uint64_t v26 = __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke_2;
    id v27 = &unk_1E56B5BE0;
    id v19 = v16;
    id v28 = v19;
    uint64_t v20 = v25;
    BOOL v21 = v20;
    if (a6 && !v17)
    {
      v26((uint64_t)v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    id v22 = +[CNErrorFactory errorWithCode:1002];
    id v23 = v22;
    if (a6) {
      *a6 = v22;
    }

    BOOL v18 = 0;
  }

  return v18;
}

uint64_t __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke(uint64_t a1, const void *a2)
{
  ABRecordRef SourceWithRecordID = ABAddressBookGetSourceWithRecordID(a2, [*(id *)(a1 + 32) iOSLegacyIdentifier]);
  uint64_t result = (uint64_t)ABAddressBookGetSourceWithRecordID(a2, [*(id *)(a1 + 40) iOSLegacyIdentifier]);
  if (SourceWithRecordID) {
    BOOL v6 = result == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t result = ABAddressBookMoveAllRecordsInSourceToSource();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

id __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) error];
  objc_super v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[CNErrorFactory genericiOSABError];
  }
  id v4 = v3;

  return v4;
}

- (BOOL)fetchContactsForFetchRequest:(id)a3 error:(id *)a4 batchHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__16;
  uint64_t v48 = __Block_byref_object_dispose__16;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__16;
  uint64_t v42 = __Block_byref_object_dispose__16;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__16;
  char v36 = __Block_byref_object_dispose__16;
  id v37 = 0;
  id v10 = [v8 effectivePredicate];
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  id v12 = logger;
  uint64_t v13 = [v8 unifyResults];
  id v14 = [v8 keysToFetch];
  [(CNContactsLogger *)v12 fetchContactsMatchingPredicate:v10 unifyResults:v13 keysToFetch:v14];

  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  uint64_t v16 = addressBook;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __78__CNiOSAddressBookDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke;
  v26[3] = &unk_1E56B5C08;
  id v29 = &v44;
  id v17 = v8;
  id v27 = v17;
  id v28 = self;
  id v30 = &v38;
  id v31 = &v32;
  BOOL v18 = [(CNiOSAddressBook *)v16 performSynchronousWorkWithInvalidatedAddressBook:v26];

  if ([v18 isFailure])
  {
    uint64_t v19 = [v18 error];
    uint64_t v20 = (void *)v33[5];
    v33[5] = v19;
  }
  uint64_t v21 = v45[5];
  if (v21) {
    v9[2](v9, v21, v39[5]);
  }
  if (self) {
    id v22 = self->_logger;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;
  [(CNContactsLogger *)v23 didFetchContacts:v45[5] error:v33[5]];

  uint64_t v24 = v45[5];
  if (a4 && !v24) {
    *a4 = (id) v33[5];
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v24 != 0;
}

void __78__CNiOSAddressBookDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1[7] + 8);
  BOOL v6 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id obj = v6;
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  if (v7) {
    uint64_t v9 = *(void **)(v7 + 24);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = (void *)a1[5];
  if (v10) {
    id v10 = (void *)v10[5];
  }
  uint64_t v11 = *(void *)(a1[8] + 8);
  id v17 = *(id *)(v11 + 40);
  id v12 = v10;
  id v13 = v9;
  uint64_t v14 = +[CNiOSContactFetcher contactsForFetchRequest:v8 matchInfos:&obj inAddressBook:a2 environment:v13 managedConfiguration:v12 error:&v17];
  objc_storeStrong(v5, obj);
  objc_storeStrong((id *)(v11 + 40), v17);
  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__16;
  id v23 = __Block_byref_object_dispose__16;
  id v24 = 0;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  uint64_t v8 = addressBook;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke;
  v15[3] = &unk_1E56B5D18;
  id v9 = v6;
  id v16 = v9;
  id v17 = &v25;
  BOOL v18 = &v19;
  id v10 = [(CNiOSAddressBook *)v8 performSynchronousWorkWithInvalidatedAddressBook:v15];

  int v11 = *((unsigned __int8 *)v26 + 24);
  id v12 = [v10 error];
  id v13 = v12;
  if (!v12) {
    id v12 = (void *)v20[5];
  }
  if (a4 && !v11) {
    *a4 = v12;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11 != 0;
}

void __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke(uint64_t a1, const void *a2)
{
  ABAddressBookGetPersonWithRecordID(a2, [*(id *)(a1 + 32) iOSLegacyIdentifier]);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ABAddressBookSetMe();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    v7[4] = a2;
    id obj = v5;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke_2;
    v7[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
    char v6 = CNBridgeBoolResultAndErrorFromBlock(&obj, (uint64_t)v7);
    objc_storeStrong((id *)(v4 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

BOOL __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke_2(uint64_t a1, CFErrorRef *a2)
{
  return ABAddressBookSave(*(ABAddressBookRef *)(a1 + 32), a2);
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__16;
  id v31 = __Block_byref_object_dispose__16;
  id v32 = 0;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  int v11 = addressBook;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke;
  id v22 = &unk_1E56B5D60;
  id v12 = v8;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  uint64_t v25 = &v33;
  uint64_t v26 = &v27;
  uint64_t v14 = [(CNiOSAddressBook *)v11 performSynchronousWorkWithInvalidatedAddressBook:&v19];

  int v15 = *((unsigned __int8 *)v34 + 24);
  id v16 = objc_msgSend(v14, "error", v19, v20, v21, v22);
  id v17 = v16;
  if (!v16) {
    id v16 = (void *)v28[5];
  }
  if (a5 && !v15) {
    *a5 = v16;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15 != 0;
}

void __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke(uint64_t a1, const void *a2)
{
  ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a2, [*(id *)(a1 + 32) iOSLegacyIdentifier]);
  ABRecordRef SourceWithRecordID = ABAddressBookGetSourceWithRecordID(a2, [*(id *)(a1 + 40) iOSLegacyIdentifier]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(id *)(v6 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_2;
  v13[3] = &__block_descriptor_48_e20_B16__0_____CFError_8l;
  void v13[4] = SourceWithRecordID;
  void v13[5] = PersonWithRecordID;
  LOBYTE(PersonWithRecordID) = CNBridgeBoolResultAndErrorFromBlock(&v14, (uint64_t)v13);
  objc_storeStrong((id *)(v6 + 40), v14);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)PersonWithRecordID;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    if (!v9)
    {
      v11[4] = a2;
      id obj = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_3;
      v11[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
      char v10 = CNBridgeBoolResultAndErrorFromBlock(&obj, (uint64_t)v11);
      objc_storeStrong(v8, obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
    }
  }
}

uint64_t __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41071A8](*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

BOOL __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_3(uint64_t a1, CFErrorRef *a2)
{
  return ABAddressBookSave(*(ABAddressBookRef *)(a1 + 32), a2);
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0;
  char v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__16;
  uint64_t v33 = __Block_byref_object_dispose__16;
  id v34 = 0;
  if (self) {
    addressBook = self->_addressBook;
  }
  else {
    addressBook = 0;
  }
  id v14 = addressBook;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke;
  v23[3] = &unk_1E56B5D88;
  uint64_t v27 = &v35;
  id v15 = v10;
  id v24 = v15;
  id v16 = v11;
  id v25 = v16;
  id v17 = v12;
  id v26 = v17;
  char v28 = &v29;
  BOOL v18 = [(CNiOSAddressBook *)v14 performSynchronousWorkWithInvalidatedAddressBook:v23];

  int v19 = *((unsigned __int8 *)v36 + 24);
  uint64_t v20 = (void *)v30[5];
  uint64_t v21 = v20;
  if (!v20)
  {
    uint64_t v21 = [v18 error];
  }
  if (a6 && !v19) {
    *a6 = v21;
  }
  if (!v20) {

  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19 != 0;
}

void __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = ABAddressBookSetBestMeIfNeeded();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(id *)(v4 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke_2;
    v7[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
    v7[4] = a2;
    char v5 = CNBridgeBoolResultAndErrorFromBlock(&v8, (uint64_t)v7);
    objc_storeStrong((id *)(v4 + 40), v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
    uint64_t v6 = *(void *)(a1 + 64);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || *(void *)(*(void *)(v6 + 8) + 40)) {
      NSLog(&cfstr_Setbestmeifnee.isa, *(void *)(*(void *)(v6 + 8) + 40));
    }
  }
}

BOOL __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke_2(uint64_t a1, CFErrorRef *a2)
{
  return ABAddressBookSave(*(ABAddressBookRef *)(a1 + 32), a2);
}

- (uint64_t)canExecuteSaveRequest:(void *)a3 error:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
LABEL_42:
    uint64_t v41 = 0;
    goto LABEL_43;
  }
  if ([v5 hasConflictingSaveOperations])
  {
    uint64_t v7 = +[CNErrorFactory errorWithCode:302];
    id v8 = v7;
    if (a3) {
      *a3 = v7;
    }
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v9 = [v6 addedAccounts];
  id v8 = [v9 valueForKey:@"identifier"];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v10 = [v6 addedAccountContainersByParentContainerIdentifier];
  id v11 = [v10 allKeys];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v59;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        if ([v8 containsObject:v16])
        {
          if (a3)
          {
            BOOL v18 = [v6 addedAccounts];
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __58__CNiOSAddressBookDataMapper_canExecuteSaveRequest_error___block_invoke;
            v57[3] = &unk_1E56B5DB0;
            v57[4] = v16;
            int v19 = objc_msgSend(v18, "_cn_firstObjectPassingTest:", v57);

            if (v19)
            {
              v67 = v19;
              v68 = @"CNInvalidRecords";
              uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
              v69 = v20;
              uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
            }
            else
            {
              uint64_t v21 = 0;
            }
            *a3 = +[CNErrorFactory errorWithCode:200 userInfo:v21];
          }
          goto LABEL_41;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v17 = [v6 addedMembersByGroupIdentifier];
  if ([v17 count])
  {
  }
  else
  {
    id v22 = [v6 addedSubgroupsByGroupIdentifier];
    uint64_t v23 = [v22 count];

    if (!v23)
    {
      uint64_t v41 = 1;
      goto LABEL_43;
    }
  }
  id v24 = [MEMORY[0x1E4F1CA80] set];
  id v25 = [v6 addedMembersByGroupIdentifier];
  id v26 = [v25 allKeys];
  [v24 addObjectsFromArray:v26];

  uint64_t v27 = [v6 addedSubgroupsByGroupIdentifier];
  char v28 = [v27 allKeys];
  [v24 addObjectsFromArray:v28];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v29 = [v6 addedGroupsByContainerIdentifier];
  id v30 = [v29 allValues];

  uint64_t v48 = [v30 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v48)
  {
    uint64_t v31 = *(void *)v54;
    uint64_t v47 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v30);
        }
        uint64_t v33 = v30;
        id v34 = *(void **)(*((void *)&v53 + 1) + 8 * j);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v65 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v50;
          while (2)
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v50 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * k), "identifier", v47);
              if ([v24 containsObject:v40])
              {
                id v30 = v33;
                if (a3)
                {
                  uint64_t v42 = [v6 groupWithAddedSubgroupForGroupIdentifier:v40];
                  id v43 = (void *)v42;
                  if (v42)
                  {
                    uint64_t v62 = v42;
                    v63 = @"CNInvalidRecords";
                    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
                    v64 = v44;
                    id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
                  }
                  else
                  {
                    id v45 = 0;
                  }
                  *a3 = +[CNErrorFactory errorWithCode:200 userInfo:v45];
                }
                uint64_t v41 = 0;
                goto LABEL_49;
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v65 count:16];
            if (v37) {
              continue;
            }
            break;
          }
        }

        id v30 = v33;
        uint64_t v31 = v47;
      }
      uint64_t v41 = 1;
      uint64_t v48 = [v30 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v48);
  }
  else
  {
    uint64_t v41 = 1;
  }
LABEL_49:

LABEL_43:
  return v41;
}

uint64_t __58__CNiOSAddressBookDataMapper_canExecuteSaveRequest_error___block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return [(CNiOSAddressBookDataMapper *)self executeSaveRequest:a3 response:0 authorizationContext:0 error:a4];
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 1;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__16;
  uint64_t v41 = __Block_byref_object_dispose__16;
  id v42 = 0;
  id obj = 0;
  char v12 = -[CNiOSAddressBookDataMapper canExecuteSaveRequest:error:]((uint64_t)self, v10, &obj);
  objc_storeStrong(&v42, obj);
  if (v12)
  {
    if (a4)
    {
      uint64_t v13 = objc_alloc_init(CNMutableSaveResponse);
      *a4 = v13;
      if (self)
      {
LABEL_4:
        addressBoouint64_t k = self->_addressBook;
LABEL_5:
        id v15 = addressBook;
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        uint64_t v29 = __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke;
        id v30 = &unk_1E56B5DD8;
        id v16 = v10;
        id v31 = v16;
        id v17 = v13;
        id v34 = &v43;
        id v35 = &v37;
        id v32 = v17;
        uint64_t v33 = self;
        BOOL v18 = [(CNiOSAddressBook *)v15 performSynchronousWorkWithInvalidatedAddressBook:&v27];

        if ((objc_msgSend(v18, "isSuccess", v27, v28, v29, v30) & 1) == 0)
        {
          *((unsigned char *)v44 + 24) = 0;
          uint64_t v19 = [v18 error];
          uint64_t v20 = (void *)v38[5];
          v38[5] = v19;
        }
        if (*((unsigned char *)v44 + 24))
        {
          -[CNiOSAddressBookDataMapper updateLimitedAccessListForSaveRequest:authorizationContext:](self, v16, v11);
        }
        else
        {
          if (self) {
            logger = self->_logger;
          }
          else {
            logger = 0;
          }
          id v25 = logger;
          [(CNContactsLogger *)v25 saveRequestFailed:v38[5]];
        }
        BOOL v23 = *((unsigned char *)v44 + 24) != 0;
        if (a6 && !*((unsigned char *)v44 + 24)) {
          *a6 = (id) v38[5];
        }

        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v13 = 0;
      if (self) {
        goto LABEL_4;
      }
    }
    addressBoouint64_t k = 0;
    goto LABEL_5;
  }
  if (self) {
    uint64_t v21 = self->_logger;
  }
  else {
    uint64_t v21 = 0;
  }
  id v22 = v21;
  [(CNContactsLogger *)v22 saveRequestInvalid:v38[5]];

  BOOL v23 = 0;
  if (a6) {
    *a6 = (id) v38[5];
  }
LABEL_23:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v23;
}

void __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [[CNiOSABSaveContext alloc] initWithSaveRequest:*(void *)(a1 + 32) response:*(void *)(a1 + 40) addressBook:a2];
  if (!v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v4 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke_cold_1(v4);
    }

    uint64_t v5 = +[CNErrorFactory errorWithCode:2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if ([*(id *)(a1 + 32) ignoresGuardianRestrictions]) {
    ABAddressBookSetIgnoresGuardianRestrictions();
  }
  if ([*(id *)(a1 + 32) ignoresContactProviderRestrictions]) {
    ABAddressBookSetIgnoresContactProviderRestrictions();
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v9 + 40);
    BOOL v10 = -[CNiOSAddressBookDataMapper _fetchAllRecordsInSaveContext:error:](v8, v3, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id v35 = *(id *)(v12 + 40);
      char v13 = -[CNiOSAddressBookDataMapper _processAccountsFromSaveContext:error:](v11, v3, &v35);
      objc_storeStrong((id *)(v12 + 40), v35);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        id v34 = *(id *)(v15 + 40);
        BOOL v16 = -[CNiOSAddressBookDataMapper _processContainersFromSaveContext:error:](v14, v3, &v34);
        objc_storeStrong((id *)(v15 + 40), v34);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v16;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          uint64_t v17 = *(void *)(a1 + 48);
          uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
          id v33 = *(id *)(v18 + 40);
          BOOL v19 = -[CNiOSAddressBookDataMapper _processContactsFromSaveContext:error:](v17, v3, &v33);
          objc_storeStrong((id *)(v18 + 40), v33);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v19;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
          {
            uint64_t v20 = *(void *)(a1 + 48);
            uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
            id v32 = *(id *)(v21 + 40);
            BOOL v22 = -[CNiOSAddressBookDataMapper _processGroupsFromSaveContext:error:](v20, v3, &v32);
            objc_storeStrong((id *)(v21 + 40), v32);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v22;
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
            {
              CFTypeRef cf = 0;
              uint64_t HasMeCardChanges = ABAddressBookHasMeCardChanges();
              id v24 = [*(id *)(a1 + 32) transactionAuthor];

              if (v24)
              {
                [(CNiOSABSaveContext *)v3 addressBook];
                id v25 = [*(id *)(a1 + 32) transactionAuthor];
                ABChangeHistorySetAddressBookClientIdentifier();
              }
              id v26 = objc_msgSend(*(id *)(a1 + 32), "saveRequestIdentifier", cf);
              ABAddressBookSetSaveTransactionIdentifier();

              [*(id *)(a1 + 32) suppressChangeNotifications];
              ABAddressBookSetSuppressChangeNotifications();
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = ABAddressBookSave([(CNiOSABSaveContext *)v3 addressBook], (CFErrorRef *)&cf);
              uint64_t v27 = [*(id *)(a1 + 32) transactionAuthor];

              if (v27)
              {
                [(CNiOSABSaveContext *)v3 addressBook];
                ABChangeHistorySetAddressBookClientIdentifier();
              }
              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
              {
                -[CNiOSAddressBookDataMapper _purgeMetadataFromDeletedContactsFromSaveContext:error:](*(void *)(a1 + 48), v3, 0);
                if ([*(id *)(a1 + 32) shouldRefetchContacts]) {
                  -[CNiOSAddressBookDataMapper _postProcessContactsFromSaveContext:](*(void *)(a1 + 48), v3);
                }
                -[CNiOSAddressBookDataMapper _postProcessGroupsFromSaveContext:](*(void *)(a1 + 48), v3);
                -[CNiOSAddressBookDataMapper _postProcessContainersFromSaveContext:](*(void *)(a1 + 48), v3);
                [*(id *)(a1 + 40) setDidAffectMeCard:HasMeCardChanges];
              }
              else
              {
                uint64_t v28 = +[CNErrorFactory errorForiOSABError:cf];
                uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
                id v30 = *(void **)(v29 + 40);
                *(void *)(v29 + 40) = v28;

                if (cf) {
                  CFRelease(cf);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (BOOL)_fetchAllRecordsInSaveContext:(void *)a3 error:
{
  id v5 = a2;
  BOOL v6 = a1
    && -[CNiOSAddressBookDataMapper _fetchAccountsInSaveContext:error:]((BOOL)a1, v5, a3)
    && -[CNiOSAddressBookDataMapper _fetchContainersInSaveContext:error:](a1, v5, a3)
    && -[CNiOSAddressBookDataMapper _fetchContactsInSaveContext:error:]((uint64_t)a1, v5, a3)
    && -[CNiOSAddressBookDataMapper _fetchGroupsInSaveContext:error:]((uint64_t)a1, v5, a3);

  return v6;
}

- (uint64_t)_processAccountsFromSaveContext:(void *)a3 error:
{
  uint64_t v71 = a3;
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = v4;
  if (!a1) {
    goto LABEL_76;
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  BOOL v6 = [v4 saveRequest];
  uint64_t v7 = [v6 addedAccounts];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v101 objects:v124 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id obj = v7;
    BOOL v10 = 0;
    uint64_t v11 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v102 != v11) {
          objc_enumerationMutation(obj);
        }
        char v13 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v5, "abAccountsByIdentifier", v71);
        uint64_t v15 = [v13 identifier];
        BOOL v16 = [v14 objectForKey:v15];

        if (v16)
        {
          v122 = @"CNInvalidRecords";
          v121 = v13;
          id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
          v123 = v25;
          id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
          uint64_t v27 = +[CNErrorFactory errorWithCode:201 userInfo:v26];
          goto LABEL_70;
        }
        uint64_t v17 = ABAccountCreate();
        if (v17)
        {
          uint64_t v18 = (const void *)v17;
          CFErrorRef error = 0;
          [v13 identifier];
          if (ABAccountSetInternalUUID()
            && ([v13 externalIdentifierString], ABAccountSetIdentifier())
            && ABAddressBookAddRecord((ABAddressBookRef)[v5 addressBook], v18, &error))
          {
            BOOL v19 = [v5 abAccountsByIdentifier];
            uint64_t v20 = [v13 identifier];
            [v19 setObject:v18 forKey:v20];

            int v21 = 1;
          }
          else
          {
            uint64_t v22 = +[CNErrorFactory errorForiOSABError:error];

            if (error) {
              CFRelease(error);
            }
            int v21 = 0;
            BOOL v10 = (void *)v22;
          }
          CFRelease(v18);
        }
        else
        {
          uint64_t v23 = +[CNErrorFactory genericiOSABError];

          int v21 = 0;
          BOOL v10 = (void *)v23;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v101 objects:v124 count:16];
    }
    while (v9);

    if (!v21)
    {
LABEL_21:
      char v24 = 0;
      goto LABEL_72;
    }
  }
  else
  {

    BOOL v10 = 0;
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v28 = objc_msgSend(v5, "saveRequest", v71);
  uint64_t v29 = [v28 removedAccounts];

  uint64_t v74 = [v29 countByEnumeratingWithState:&v96 objects:v120 count:16];
  v75 = v5;
  if (!v74)
  {

    goto LABEL_53;
  }
  id obj = v29;
  uint64_t v73 = *(void *)v97;
  uint64_t v30 = *MEMORY[0x1E4F5A258];
  int v31 = 1;
  uint64_t v72 = *MEMORY[0x1E4F5A258];
  do
  {
    uint64_t v32 = 0;
    do
    {
      if (*(void *)v97 != v73) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(void **)(*((void *)&v96 + 1) + 8 * v32);
      [v5 addressBook];
      id v34 = [v33 externalIdentifierString];
      id v35 = (const void *)ABAddressBookCopyAccountWithIdentifier();
      if (!v35)
      {

LABEL_65:
        v118 = @"CNInvalidRecordIdentifiers";
        id v25 = [v33 identifier];
        v117 = v25;
        id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
        v119 = v26;
        uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        uint64_t v27 = +[CNErrorFactory errorWithCode:200 userInfo:v68];

        BOOL v10 = (void *)v68;
LABEL_70:

        char v24 = 0;
        BOOL v10 = (void *)v27;
        goto LABEL_71;
      }
      CFTypeRef v36 = CFAutorelease(v35);

      if (!v36) {
        goto LABEL_65;
      }
      v82 = v10;
      [v5 addressBook];
      uint64_t v37 = (void *)ABAddressBookCopyArrayOfAllSourcesInAccount();
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke;
      v94[3] = &unk_1E56B5E00;
      id v38 = v5;
      id v95 = v38;
      uint64_t v39 = objc_msgSend(v37, "_cn_flatMap:", v94);
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke_2;
      v92[3] = &unk_1E56B5E00;
      id v40 = v38;
      id v93 = v40;
      v79 = v37;
      v78 = objc_msgSend(v37, "_cn_flatMap:", v92);
      uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
      v77 = (void *)v39;
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v30 + 16))(v30, v39) & 1) == 0) {
        [v41 addObjectsFromArray:v39];
      }
      if (((*(uint64_t (**)(uint64_t, void *))(v30 + 16))(v30, v78) & 1) == 0) {
        [v41 addObjectsFromArray:v78];
      }
      if (((*(uint64_t (**)(uint64_t, void *))(v30 + 16))(v30, v37) & 1) == 0) {
        [v41 addObjectsFromArray:v37];
      }
      uint64_t v76 = v32;
      [v41 addObject:v36];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v81 = v41;
      uint64_t v42 = [v81 countByEnumeratingWithState:&v88 objects:v116 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v89;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v89 != v44) {
              objc_enumerationMutation(v81);
            }
            char v46 = *(const void **)(*((void *)&v88 + 1) + 8 * j);
            CFErrorRef error = 0;
            v31 &= ABAddressBookRemoveRecord((ABAddressBookRef)[v40 addressBook], v46, &error);
            if ((v31 & 1) == 0)
            {
              v114 = @"CNInvalidRecords";
              v113 = v46;
              uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
              v115 = v47;
              uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
              long long v49 = +[CNErrorFactory errorForiOSABError:error];
              uint64_t v50 = +[CNErrorFactory errorByAddingUserInfoEntries:v48 toError:v49];

              if (error) {
                CFRelease(error);
              }
              v82 = (void *)v50;
            }
          }
          uint64_t v43 = [v81 countByEnumeratingWithState:&v88 objects:v116 count:16];
        }
        while (v43);
      }

      id v5 = v75;
      uint64_t v32 = v76 + 1;
      BOOL v10 = v82;
      uint64_t v30 = v72;
    }
    while (v76 + 1 != v74);
    uint64_t v74 = [obj countByEnumeratingWithState:&v96 objects:v120 count:16];
  }
  while (v74);

  if ((v31 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_53:
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v51 = [v5 saveRequest];
  long long v52 = [v51 defaultAccountContainersByAccountIdentifier];
  long long v53 = [v52 allKeys];

  id obj = v53;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v84 objects:v112 count:16];
  if (!v54)
  {
    char v24 = 1;
    goto LABEL_71;
  }
  uint64_t v55 = v54;
  v83 = v10;
  uint64_t v56 = *(void *)v85;
  while (2)
  {
    uint64_t v57 = 0;
    while (2)
    {
      if (*(void *)v85 != v56) {
        objc_enumerationMutation(obj);
      }
      uint64_t v58 = *(void *)(*((void *)&v84 + 1) + 8 * v57);
      long long v59 = [v75 abAccountsByIdentifier];
      long long v60 = [v59 objectForKeyedSubscript:v58];

      long long v61 = [v75 saveRequest];
      uint64_t v62 = [v61 defaultAccountContainersByAccountIdentifier];
      v63 = [v62 objectForKeyedSubscript:v58];
      id v25 = [v63 firstObject];

      v64 = [v75 abSourcesByIdentifier];
      v65 = [v25 identifier];
      v66 = [v64 objectForKeyedSubscript:v65];

      if (!v60 || !v66)
      {
        v110 = @"CNInvalidRecordIdentifiers";
        uint64_t v109 = v58;
        id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
        v111 = v26;
        BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
        uint64_t v69 = 200;
LABEL_69:
        uint64_t v27 = +[CNErrorFactory errorWithCode:v69 userInfo:v10];

        id v5 = v75;
        goto LABEL_70;
      }
      int IntValue = ABRecordGetIntValue();
      if (IntValue != ABRecordGetRecordID(v60))
      {
        uint64_t v106 = v58;
        v107 = @"CNInvalidRecordIdentifiers";
        id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
        v108 = v26;
        BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
        uint64_t v69 = 204;
        goto LABEL_69;
      }
      [v75 addressBook];
      ABAddressBookSetDefaultSourceForAccount();

      if (v55 != ++v57) {
        continue;
      }
      break;
    }
    uint64_t v55 = [obj countByEnumeratingWithState:&v84 objects:v112 count:16];
    char v24 = 1;
    if (v55) {
      continue;
    }
    break;
  }
  id v5 = v75;
  BOOL v10 = v83;
LABEL_71:

LABEL_72:
  if (v71 && (v24 & 1) == 0) {
    *uint64_t v71 = v10;
  }
  unsigned __int8 v105 = v24;

  a1 = v105;
LABEL_76:

  return a1;
}

- (BOOL)_processContainersFromSaveContext:(void *)a3 error:
{
  id v5 = a2;
  BOOL v6 = v5;
  if (a1)
  {
    uint64_t v35 = 0;
    CFTypeRef v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 1;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__16;
    id v33 = __Block_byref_object_dispose__16;
    id v34 = 0;
    uint64_t v7 = [v5 saveRequest];
    uint64_t v8 = [v7 addedAccountContainersByParentContainerIdentifier];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke;
    v24[3] = &unk_1E56B5E28;
    id v9 = v6;
    uint64_t v27 = &v35;
    uint64_t v28 = &v29;
    id v25 = v9;
    BOOL v26 = a1;
    [v8 enumerateKeysAndObjectsUsingBlock:v24];

    if (!*((unsigned char *)v36 + 24)) {
      goto LABEL_6;
    }
    BOOL v10 = [v9 saveRequest];
    uint64_t v11 = [v10 deletedContainers];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_55;
    v20[3] = &unk_1E56B5E50;
    id v12 = v9;
    id v21 = v12;
    uint64_t v22 = &v35;
    uint64_t v23 = &v29;
    [v11 enumerateObjectsUsingBlock:v20];

    if (*((unsigned char *)v36 + 24))
    {
      char v13 = [v12 saveRequest];
      uint64_t v14 = [v13 updatedContainers];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_2;
      v16[3] = &unk_1E56B5E50;
      id v17 = v12;
      uint64_t v18 = &v35;
      BOOL v19 = &v29;
      [v14 enumerateObjectsUsingBlock:v16];

      a1 = *((unsigned char *)v36 + 24) != 0;
      if (!a3) {
        goto LABEL_9;
      }
    }
    else
    {
LABEL_6:
      a1 = 0;
      if (!a3)
      {
LABEL_9:
        _Block_object_dispose(&v29, 8);

        _Block_object_dispose(&v35, 8);
        goto LABEL_10;
      }
    }
    if (!a1) {
      *a3 = (id) v30[5];
    }
    goto LABEL_9;
  }
LABEL_10:

  return a1;
}

- (BOOL)_processContactsFromSaveContext:(void *)a3 error:
{
  id v5 = a2;
  BOOL v6 = v5;
  if (a1)
  {
    uint64_t v39 = 0;
    id v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 1;
    uint64_t v33 = 0;
    id v34 = (id *)&v33;
    uint64_t v35 = 0x3032000000;
    CFTypeRef v36 = __Block_byref_object_copy__16;
    uint64_t v37 = __Block_byref_object_dispose__16;
    id v38 = 0;
    uint64_t v7 = [v5 saveRequest];
    uint64_t v8 = [v7 addedContactsByContainerIdentifier];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke;
    v29[3] = &unk_1E56B5E78;
    void v29[4] = a1;
    id v9 = v6;
    id v30 = v9;
    uint64_t v31 = &v39;
    uint64_t v32 = &v33;
    [v8 enumerateKeysAndObjectsUsingBlock:v29];

    if (!*((unsigned char *)v40 + 24)) {
      goto LABEL_9;
    }
    -[CNiOSAddressBookDataMapper _logWillDeleteWithSaveContext:](a1, v9);
    BOOL v10 = [v9 saveRequest];
    uint64_t v11 = [v10 deletedContacts];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_2;
    v25[3] = &unk_1E56B5EA0;
    v25[4] = a1;
    id v12 = v9;
    id v26 = v12;
    uint64_t v27 = &v39;
    uint64_t v28 = &v33;
    [v11 enumerateObjectsUsingBlock:v25];

    if (!*((unsigned char *)v40 + 24)) {
      goto LABEL_9;
    }
    char v13 = [v12 saveRequest];
    uint64_t v14 = [v13 updatedContacts];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3;
    v21[3] = &unk_1E56B5EC8;
    v21[4] = a1;
    uint64_t v23 = &v33;
    char v24 = &v39;
    id v15 = v12;
    id v22 = v15;
    [v14 enumerateObjectsUsingBlock:v21];

    if (*((unsigned char *)v40 + 24))
    {
      id v20 = 0;
      BOOL v16 = -[CNiOSAddressBookDataMapper _processContactChangeRequestsFromSaveContext:error:](a1, v15, &v20);
      id v17 = v20;
      id v18 = v20;
      *((unsigned char *)v40 + 24) = v16;
      if (!v16) {
        objc_storeStrong(v34 + 5, v17);
      }

      a1 = *((unsigned char *)v40 + 24) != 0;
      if (!a3) {
        goto LABEL_12;
      }
    }
    else
    {
LABEL_9:
      a1 = 0;
      if (!a3)
      {
LABEL_12:
        _Block_object_dispose(&v33, 8);

        _Block_object_dispose(&v39, 8);
        goto LABEL_13;
      }
    }
    if (!a1) {
      *a3 = v34[5];
    }
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (BOOL)_processGroupsFromSaveContext:(void *)a3 error:
{
  id v5 = a2;
  BOOL v6 = v5;
  if (a1)
  {
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 1;
    uint64_t v34 = 0;
    uint64_t v35 = (id *)&v34;
    uint64_t v36 = 0x3032000000;
    uint64_t v37 = __Block_byref_object_copy__16;
    id v38 = __Block_byref_object_dispose__16;
    id v39 = 0;
    uint64_t v7 = [v5 saveRequest];
    uint64_t v8 = [v7 addedGroupsByContainerIdentifier];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke;
    v30[3] = &unk_1E56B5FB0;
    id v9 = v6;
    id v31 = v9;
    uint64_t v32 = &v40;
    uint64_t v33 = &v34;
    [v8 enumerateKeysAndObjectsUsingBlock:v30];

    if (!*((unsigned char *)v41 + 24)) {
      goto LABEL_8;
    }
    BOOL v10 = [v9 saveRequest];
    uint64_t v11 = [v10 deletedGroups];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_2;
    v26[3] = &unk_1E56B5E50;
    id v12 = v9;
    id v27 = v12;
    uint64_t v28 = &v40;
    uint64_t v29 = &v34;
    [v11 enumerateObjectsUsingBlock:v26];

    if (!*((unsigned char *)v41 + 24)) {
      goto LABEL_8;
    }
    char v13 = [v12 saveRequest];
    uint64_t v14 = [v13 updatedGroups];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_3;
    v22[3] = &unk_1E56B5E50;
    id v15 = v12;
    id v23 = v15;
    char v24 = &v40;
    id v25 = &v34;
    [v14 enumerateObjectsUsingBlock:v22];

    if (!*((unsigned char *)v41 + 24)) {
      goto LABEL_8;
    }
    BOOL v16 = v35;
    id obj = v35[5];
    BOOL v17 = -[CNiOSAddressBookDataMapper _processContactMembershipsFromSaveContext:error:](a1, v15, &obj);
    objc_storeStrong(v16 + 5, obj);
    *((unsigned char *)v41 + 24) = v17;
    if (v17)
    {
      id v18 = v35;
      id v20 = v35[5];
      a1 = -[CNiOSAddressBookDataMapper _processSubgroupMembershipsFromSaveContext:error:](a1, v15, &v20);
      objc_storeStrong(v18 + 5, v20);
      *((unsigned char *)v41 + 24) = a1;
      if (!a3) {
        goto LABEL_11;
      }
    }
    else
    {
LABEL_8:
      a1 = 0;
      if (!a3)
      {
LABEL_11:

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v40, 8);
        goto LABEL_12;
      }
    }
    if (!a1) {
      *a3 = v35[5];
    }
    goto LABEL_11;
  }
LABEL_12:

  return a1;
}

- (uint64_t)_purgeMetadataFromDeletedContactsFromSaveContext:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    BOOL v6 = (void *)MEMORY[0x192FD3A40]();
    uint64_t v7 = [v5 contactIdentifiersNeedingMetadataPurge];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v23 = a3;
      id v9 = objc_alloc_init(CNContactImageStore);
      BOOL v10 = [v5 contactIdentifiersNeedingMetadataPurge];
      uint64_t v11 = +[CNContactImageSaveRequest saveRequestToDeleteImagesForContactIdentifiers:v10];

      id v25 = 0;
      BOOL v12 = [(CNContactImageStore *)v9 performSaveRequest:v11 error:&v25];
      id v13 = v25;
      if (!v12) {
        [*(id *)(a1 + 32) deleteImageRecentsMetadataRequestFailed:v13];
      }
      uint64_t v14 = objc_alloc_init(CNContactPosterStore);
      id v15 = [v5 contactIdentifiersNeedingMetadataPurge];
      BOOL v16 = +[CNContactPosterSaveRequest saveRequestToDeletePostersForContactIdentifiers:v15];

      id v24 = v13;
      uint64_t v17 = [(CNContactPosterStore *)v14 performSaveRequest:v16 error:&v24];
      id v18 = v24;

      if ((v17 & 1) == 0) {
        [*(id *)(a1 + 32) deletePosterRecentsMetadataRequestFailed:v18];
      }

      id v19 = v18;
      id v20 = v19;
      if (v23) {
        char v21 = v17;
      }
      else {
        char v21 = 1;
      }
      if ((v21 & 1) == 0)
      {
        id v20 = v19;
        uint64_t v17 = 0;
        void *v23 = v20;
      }
    }
    else
    {
      id v20 = 0;
      uint64_t v17 = 1;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (void)_postProcessContactsFromSaveContext:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 saveRequest];
    BOOL v6 = [v5 deletedContactsByIdentifier];

    uint64_t v7 = +[CN writableContactProperties];
    uint64_t v8 = [v4 saveRequest];
    id v9 = [v8 allContacts];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__CNiOSAddressBookDataMapper__postProcessContactsFromSaveContext___block_invoke;
    v12[3] = &unk_1E56B5F88;
    id v13 = v6;
    id v14 = v4;
    id v15 = v7;
    id v10 = v7;
    id v11 = v6;
    [v9 enumerateObjectsUsingBlock:v12];
  }
}

- (void)_postProcessGroupsFromSaveContext:(uint64_t)a1
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA80];
    BOOL v6 = [v3 saveRequest];
    uint64_t v7 = [v6 allGroups];
    uint64_t v8 = [v5 setWithArray:v7];

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    id v10 = [v4 saveRequest];
    id v11 = [v10 deletedGroups];
    uint64_t v12 = [v9 setWithArray:v11];

    id v39 = (void *)v12;
    [v8 minusSet:v12];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      ABPropertyID v16 = *MEMORY[0x1E4F499B0];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v19 = [v4 abGroupsByIdentifier];
          id v20 = [v18 identifier];
          char v21 = [v19 objectForKeyedSubscript:v20];

          uint64_t RecordID = ABRecordGetRecordID(v21);
          if (RecordID != [v18 iOSLegacyIdentifier]) {
            [v18 setIOSLegacyIdentifier:RecordID];
          }
          id v23 = (void *)ABRecordCopyValue(v21, v16);
          if (v23) {
            id v23 = (void *)CFAutorelease(v23);
          }
          id v24 = v23;
          id v25 = [v18 name];
          char v26 = [v25 isEqual:v24];

          if ((v26 & 1) == 0) {
            [v18 setName:v24];
          }
          id v27 = (void *)[v18 mutableCopy];
          uint64_t v28 = [v27 freezeWithSelfAsSnapshot];
          [v18 setSnapshot:v28];
          uint64_t v29 = [v4 saveResponse];
          id v30 = [v4 indexPathForGroupInstance:v18];
          [v29 setGroupSnapshot:v28 forIndexPath:v30];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v14);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v31 = v39;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          [v36 setSnapshot:0];
          uint64_t v37 = [v4 saveResponse];
          id v38 = [v4 indexPathForGroupInstance:v36];
          [v37 setGroupSnapshot:0 forIndexPath:v38];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v33);
    }
  }
}

- (void)_postProcessContainersFromSaveContext:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 saveRequest];
    BOOL v6 = [v5 allContainers];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v6;
    uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v27)
    {
      uint64_t v25 = *(void *)v33;
      char v26 = v4;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v9 = [v4 abSourcesByIdentifier];
          id v10 = [v8 identifier];
          id v11 = [v9 objectForKeyedSubscript:v10];

          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v12 = +[CN writableContainerProperties];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v29 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                uint64_t v18 = [v17 ABValueForABSource:v11];
                if ([v17 isConvertibleABValue:v18])
                {
                  id v19 = [v17 CNValueFromABValue:v18];
                  [v17 setCNValue:v19 onContainer:v8];
                }
                else
                {
                  id v19 = [v17 key];
                  NSLog(&cfstr_WeProcessedACo.isa, v19);
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v14);
          }

          id v20 = (void *)[v8 mutableCopy];
          char v21 = [v20 freezeWithSelfAsSnapshot];
          [v8 setSnapshot:v21];
          id v4 = v26;
          id v22 = [v26 saveResponse];
          id v23 = [v26 indexPathForContainerInstance:v8];
          [v22 setContainerSnapshot:v21 forIndexPath:v23];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v27);
    }
  }
}

- (void)updateLimitedAccessListForSaveRequest:(void *)a3 authorizationContext:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      objc_opt_class();
      uint64_t v15 = +[CNiOSAddressBookDataMapper os_log]();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CNiOSAddressBookDataMapper updateLimitedAccessListForSaveRequest:authorizationContext:]((uint64_t)a1, v15);
      }
      goto LABEL_8;
    }
    if ([v6 isLimitedAccessGranted])
    {
      uint64_t v8 = *MEMORY[0x1E4F5A2A0];
      id v9 = [v7 clientBundleIdentifier];
      LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

      if (v8)
      {
        id v10 = [v7 clientBundleIdentifier];
        id v11 = [v5 addedContactsByContainerIdentifier];
        uint64_t v12 = [v11 allValues];
        uint64_t v13 = objc_msgSend(v12, "_cn_flatten");
        uint64_t v14 = objc_msgSend(v13, "_cn_map:", CNContactToIdentifier);
        [a1 addLimitedAccessForBundle:v10 contactIdentifiers:v14];

        uint64_t v15 = [v5 deletedContacts];
        ABPropertyID v16 = [v15 _cn_map:CNContactToIdentifier];
        -[CNiOSAddressBookDataMapper removeContactIdentifiersFromLimitedAcessForAllBundles:]((uint64_t)a1, v16);

LABEL_8:
      }
    }
  }
}

- (void)removeContactIdentifiersFromLimitedAcessForAllBundles:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v15 = 0;
    ABPropertyID v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v4 = *(id *)(a1 + 16);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __84__CNiOSAddressBookDataMapper_removeContactIdentifiersFromLimitedAcessForAllBundles___block_invoke;
    uint64_t v12 = &unk_1E56B60E0;
    uint64_t v14 = &v15;
    id v13 = v3;
    id v5 = [v4 performSynchronousWorkWithInvalidatedAddressBook:&v9];

    if (v5)
    {
      id v6 = objc_msgSend(v5, "value", v9, v10, v11, v12);
      if ([v6 isEqual:MEMORY[0x1E4F1CC38]])
      {
        int v7 = *((unsigned __int8 *)v16 + 24);

        if (v7)
        {
LABEL_10:

          _Block_object_dispose(&v15, 8);
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    objc_opt_class();
    uint64_t v8 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNiOSAddressBookDataMapper removeContactIdentifiersFromLimitedAcessForAllBundles:]();
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)_fetchAccountsInSaveContext:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    [v5 addressBook];
    CFArrayRef v7 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
    a1 = v7 != 0;
    if (v7)
    {
      CFArrayRef v8 = v7;
      if (CFArrayGetCount(v7) >= 1)
      {
        CFIndex v9 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v9);
          id v11 = (const void *)ABAccountCopyInternalUUID();
          uint64_t v12 = [v6 abAccountsByIdentifier];
          [v12 setObject:ValueAtIndex forKey:v11];

          if (v11) {
            CFRelease(v11);
          }
          ++v9;
        }
        while (v9 < CFArrayGetCount(v8));
      }
      CFRelease(v8);
      id v13 = 0;
    }
    else
    {
      id v14 = +[CNErrorFactory genericiOSABError];
      id v13 = v14;
      if (a3)
      {
        id v13 = v14;
        *a3 = v13;
      }
    }
  }
  return a1;
}

- (BOOL)_fetchContainersInSaveContext:(void *)a3 error:
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    char v28 = 0;
    CFArrayRef v7 = [v5 saveRequest];
    CFArrayRef v8 = [v7 allContainerIdentifierStrings:&v28];

    if (v28)
    {
      id v27 = 0;
      CFIndex v9 = -[CNiOSAddressBookDataMapper defaultContainerIdentifierForAddressBook:error:](a1, (const void *)[v6 addressBook], &v27);
      id v10 = v27;
      id v11 = v10;
      if (v9)
      {
        v30[0] = v9;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        uint64_t v13 = [v12 arrayByAddingObjectsFromArray:v8];

        CFArrayRef v8 = (void *)v13;
      }
      else if (v10)
      {
        NSLog(&cfstr_ErrorFetchingD.isa, v10);
      }
      else
      {
        NSLog(&cfstr_WeGotNoIdentif.isa);
      }
    }
    if ([v8 count])
    {
      [v6 addressBook];
      CFArrayRef v14 = (const __CFArray *)ABAddressBookCopySourcesWithUUIDs();
      CFArrayRef v15 = v14;
      BOOL v16 = v14 != 0;
      if (v14)
      {
        if (CFArrayGetCount(v14) >= 1)
        {
          CFIndex v17 = 0;
          ABPropertyID v18 = *MEMORY[0x1E4F49E28];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v15, v17);
            CFTypeRef v20 = ABRecordCopyValue(ValueAtIndex, v18);
            char v21 = [v6 abSourcesByIdentifier];
            [v21 setObject:ValueAtIndex forKey:v20];

            if (v20) {
              CFRelease(v20);
            }
            ++v17;
          }
          while (v17 < CFArrayGetCount(v15));
        }
        CFRelease(v15);
        id v22 = 0;
      }
      else
      {
        id v22 = +[CNErrorFactory genericiOSABError];
      }
      id v24 = v22;
      id v23 = v24;
      if (a3 && !v15)
      {
        id v23 = v24;
        BOOL v16 = 0;
        *a3 = v23;
      }
    }
    else
    {
      id v23 = 0;
      BOOL v16 = 1;
    }

    BOOL v29 = v16;
    BOOL v25 = v29;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_fetchContactsInSaveContext:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    CFArrayRef v7 = [v5 saveRequest];
    CFArrayRef v8 = [v7 allContactIdentifiers];

    if ([v8 count])
    {
      [v6 addressBook];
      CFArrayRef v9 = (const __CFArray *)ABAddressBookCopyPeopleWithUUIDs();
      CFArrayRef v10 = v9;
      BOOL v11 = v9 != 0;
      if (v9)
      {
        if (CFArrayGetCount(v9) >= 1)
        {
          CFIndex v12 = 0;
          ABPropertyID v13 = *MEMORY[0x1E4F49BB8];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v12);
            CFTypeRef v15 = ABRecordCopyValue(ValueAtIndex, v13);
            BOOL v16 = [v6 abPersonsByIdentifier];
            [v16 setObject:ValueAtIndex forKey:v15];

            if (v15) {
              CFRelease(v15);
            }
            ++v12;
          }
          while (v12 < CFArrayGetCount(v10));
        }
        CFRelease(v10);
        CFIndex v17 = 0;
      }
      else
      {
        CFIndex v17 = +[CNErrorFactory genericiOSABError];
      }
      id v19 = v17;
      id v18 = v19;
      if (a3 && !v10)
      {
        id v18 = v19;
        BOOL v11 = 0;
        *a3 = v18;
      }
    }
    else
    {
      id v18 = 0;
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_fetchGroupsInSaveContext:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    CFArrayRef v7 = [v5 saveRequest];
    CFArrayRef v8 = [v7 allGroupIdentifiers];

    if ([v8 count])
    {
      [v6 addressBook];
      CFArrayRef v9 = (const __CFArray *)ABAddressBookCopyGroupsWithUUIDs();
      CFArrayRef v10 = v9;
      BOOL v11 = v9 != 0;
      if (v9)
      {
        if (CFArrayGetCount(v9) >= 1)
        {
          CFIndex v12 = 0;
          ABPropertyID v13 = *MEMORY[0x1E4F499A8];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v12);
            CFTypeRef v15 = ABRecordCopyValue(ValueAtIndex, v13);
            BOOL v16 = [v6 abGroupsByIdentifier];
            [v16 setObject:ValueAtIndex forKey:v15];

            if (v15) {
              CFRelease(v15);
            }
            ++v12;
          }
          while (v12 < CFArrayGetCount(v10));
        }
        CFRelease(v10);
        CFIndex v17 = 0;
      }
      else
      {
        CFIndex v17 = +[CNErrorFactory genericiOSABError];
      }
      id v19 = v17;
      id v18 = v19;
      if (a3 && !v10)
      {
        id v18 = v19;
        BOOL v11 = 0;
        *a3 = v18;
      }
    }
    else
    {
      id v18 = 0;
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)defaultContainerIdentifierForAddressBook:(void *)a3 error:
{
  if (a1)
  {
    id v3 = -[CNiOSAddressBookDataMapper _defaultSourceInAddressBook:error:](a1, a2, a3);
    if (v3)
    {
      id v4 = +[CN containerIdentifierDescription];
      id v3 = objc_msgSend(v4, "CNValueFromABValue:", objc_msgSend(v4, "ABValueForABSource:", v3));
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

CFArrayRef __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = a2;
  CFArrayRef v4 = ABAddressBookCopyArrayOfAllPeopleInSource((ABAddressBookRef)[v2 addressBook], v3);

  return v4;
}

CFArrayRef __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = a2;
  CFArrayRef v4 = ABAddressBookCopyArrayOfAllGroupsInSource((ABAddressBookRef)[v2 addressBook], v3);

  return v4;
}

void __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v7;
  uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (!v48) {
    goto LABEL_42;
  }
  uint64_t v49 = *(void *)v57;
  uint64_t v47 = *MEMORY[0x1E4F5A288];
  *(void *)&long long v9 = 138543362;
  long long v43 = v9;
  id v46 = v8;
  while (2)
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v57 != v49) {
        objc_enumerationMutation(obj);
      }
      BOOL v11 = *(void **)(*((void *)&v56 + 1) + 8 * v10);
      CFIndex v12 = objc_msgSend(*(id *)(a1 + 32), "abSourcesByIdentifier", v43);
      ABPropertyID v13 = [v11 identifier];
      CFArrayRef v14 = [v12 objectForKeyedSubscript:v13];

      if (v14)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        v65 = v11;
        v66 = @"CNInvalidRecords";
        uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
        v67 = v37;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        uint64_t v39 = 201;
LABEL_41:
        uint64_t v40 = +[CNErrorFactory errorWithCode:v39 userInfo:v38];
        uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
        long long v42 = *(void **)(v41 + 40);
        *(void *)(v41 + 40) = v40;

        *a4 = 1;
        goto LABEL_42;
      }
      CFTypeRef v15 = (const void *)ABSourceCreate();
      if (v15) {
        CFTypeRef v16 = CFAutorelease(v15);
      }
      else {
        CFTypeRef v16 = 0;
      }
      uint64_t v50 = v10;
      if ((*(unsigned int (**)(uint64_t, id))(v47 + 16))(v47, v8))
      {
        uint64_t v55 = 0;
        if ((ABRecordSetIntValue() & 1) == 0)
        {
          objc_opt_class();
          CFIndex v17 = +[CNiOSAddressBookDataMapper os_log]();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CFTypeRef cf = v43;
            *(void *)&cf[4] = v55;
            _os_log_error_impl(&dword_1909E3000, v17, OS_LOG_TYPE_ERROR, "_processContainersFromSaveContext add container failed to set null account, error: %{public}@", cf, 0xCu);
          }
        }
        goto LABEL_17;
      }
      id v18 = [*(id *)(a1 + 32) abAccountsByIdentifier];
      id v19 = [v18 objectForKeyedSubscript:v8];

      if (!v19)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        id v61 = v8;
        uint64_t v62 = @"CNInvalidRecordIdentifiers";
        uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
        v63 = v37;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        uint64_t v39 = 200;
        goto LABEL_41;
      }
      *(void *)CFTypeRef cf = 0;
      [*(id *)(a1 + 32) addressBook];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABAddressBookSetAccountForSource();
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        goto LABEL_36;
      }
LABEL_17:
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      CFTypeRef v20 = +[CN allContainerProperties];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v52 != v23) {
              objc_enumerationMutation(v20);
            }
            BOOL v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            char v26 = +[CN containerAccountIdentifierDescription];

            if (v25 != v26)
            {
              id v27 = [v25 CNValueForContainer:v11];
              uint64_t v28 = [v25 ABValueFromCNValue:v27];
              *(void *)CFTypeRef cf = 0;
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v25 setABValue:v28 onABSource:v16 error:cf];
              if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
              {
                uint64_t v29 = +[CNErrorFactory errorForiOSABError:*(void *)cf];
                uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
                long long v31 = *(void **)(v30 + 40);
                *(void *)(v30 + 40) = v29;

                if (*(void *)cf) {
                  CFRelease(*(CFTypeRef *)cf);
                }
                *a4 = 1;

                goto LABEL_31;
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
LABEL_31:

      id v8 = v46;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        goto LABEL_42;
      }
      *(void *)CFTypeRef cf = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABAddressBookAddRecord((ABAddressBookRef)[*(id *)(a1 + 32) addressBook], v16, (CFErrorRef *)cf);
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
LABEL_36:
        uint64_t v34 = +[CNErrorFactory errorForiOSABError:*(void *)cf];
        uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v36 = *(void **)(v35 + 40);
        *(void *)(v35 + 40) = v34;

        if (*(void *)cf) {
          CFRelease(*(CFTypeRef *)cf);
        }
        *a4 = 1;
        goto LABEL_42;
      }
      long long v32 = [*(id *)(a1 + 32) abSourcesByIdentifier];
      long long v33 = [v11 identifier];
      [v32 setObject:v16 forKey:v33];

      uint64_t v10 = v50 + 1;
    }
    while (v50 + 1 != v48);
    uint64_t v48 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v48) {
      continue;
    }
    break;
  }
LABEL_42:
}

void __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_55(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) abSourcesByIdentifier];
  id v8 = [v6 identifier];
  long long v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    CFTypeRef cf = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ABAddressBookRemoveRecord((ABAddressBookRef)[*(id *)(a1 + 32) addressBook], v9, (CFErrorRef *)&cf);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v22 = v6;
      uint64_t v23 = @"CNInvalidRecords";
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      id v24 = v10;
      BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      CFIndex v12 = +[CNErrorFactory errorForiOSABError:cf];
      uint64_t v13 = +[CNErrorFactory errorByAddingUserInfoEntries:v11 toError:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      CFTypeRef v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      if (cf) {
        CFRelease(cf);
      }
      *a4 = 1;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v25 = v6;
    char v26 = @"CNInvalidRecords";
    CFTypeRef v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v27[0] = v16;
    CFIndex v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v18 = +[CNErrorFactory errorWithCode:200 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    CFTypeRef v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
  }
}

void __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) abSourcesByIdentifier];
  id v8 = [v6 identifier];
  long long v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v29 = a1;
    uint64_t v30 = a4;
    uint64_t v10 = [v6 snapshot];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v11 = +[CN writableContainerProperties];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          CFTypeRef v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v17 = [v16 CNValueForContainer:v10];
          uint64_t v18 = [v16 CNValueForContainer:v6];
          uint64_t v19 = (void *)v18;
          if (v17 | v18)
          {
            if (([(id)v18 isEqual:v17] & 1) == 0)
            {
              uint64_t v20 = [v16 ABValueFromCNValue:v19];
              CFTypeRef cf = 0;
              if (([v16 setABValue:v20 onABSource:v9 error:&cf] & 1) == 0)
              {
                uint64_t v21 = +[CNErrorFactory errorForiOSABError:cf];
                uint64_t v22 = *(void *)(*(void *)(v29 + 48) + 8);
                uint64_t v23 = *(void **)(v22 + 40);
                *(void *)(v22 + 40) = v21;

                if (cf) {
                  CFRelease(cf);
                }
                *uint64_t v30 = 1;
                *(unsigned char *)(*(void *)(*(void *)(v29 + 40) + 8) + 24) = 0;
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v13);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v37 = v6;
    uint64_t v38 = @"CNInvalidRecords";
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v39[0] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v26 = +[CNErrorFactory errorWithCode:200 userInfo:v25];
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    *a4 = 1;
  }
}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  context = (void *)MEMORY[0x192FD3A40]();
  id v9 = v8;
  id v10 = v7;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void **)(v11 + 32);
  }
  else {
    uint64_t v12 = 0;
  }
  [v12 addingContacts:v9 toContainerWithIdentifier:v10];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v85 objects:v107 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v86;
    ABPropertyID property = *MEMORY[0x1E4F49BB8];
    uint64_t v76 = a4;
    uint64_t v77 = *(void *)v86;
    do
    {
      uint64_t v16 = 0;
      uint64_t v78 = v14;
      do
      {
        if (*(void *)v86 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v85 + 1) + 8 * v16);
        uint64_t v18 = [*(id *)(a1 + 40) abPersonsByIdentifier];
        uint64_t v19 = [v17 identifier];
        uint64_t v20 = [v18 objectForKey:v19];

        if (v20)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          long long v104 = v17;
          unsigned __int8 v105 = @"CNInvalidRecords";
          uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
          uint64_t v106 = v21;
          uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
          uint64_t v23 = +[CNErrorFactory errorWithCode:201 userInfo:v22];
          uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
          id v25 = *(void **)(v24 + 40);
          *(void *)(v24 + 40) = v23;

          *a4 = 1;
          goto LABEL_47;
        }
        CFTypeRef cf = 0;
        [v17 setSnapshot:0];
        uint64_t v26 = [*(id *)(a1 + 40) saveResponse];
        uint64_t v27 = [*(id *)(a1 + 40) indexPathForContactInstance:v17];
        [v26 setContactSnapshot:0 forIndexPath:v27];

        uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
        LODWORD(v27) = [v10 isEqual:v28];

        if (!v27)
        {
          long long v35 = [*(id *)(a1 + 40) abSourcesByIdentifier];
          uint64_t v36 = [v35 objectForKey:v10];

          if (!v36)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            id v101 = v10;
            long long v102 = @"CNInvalidRecordIdentifiers";
            uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
            long long v103 = v39;
            uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
            uint64_t v41 = 200;
LABEL_22:
            uint64_t v42 = +[CNErrorFactory errorWithCode:v41 userInfo:v40];
            uint64_t v43 = *(void *)(*(void *)(a1 + 56) + 8);
            long long v44 = *(void **)(v43 + 40);
            *(void *)(v43 + 40) = v42;

            *a4 = 1;
LABEL_26:
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
            {
              id v95 = v17;
              long long v96 = @"CNInvalidRecords";
              id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
              long long v97 = v46;
              uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
              uint64_t v48 = +[CNErrorFactory errorForiOSABError:cf];
              uint64_t v49 = +[CNErrorFactory errorByAddingUserInfoEntries:v47 toError:v48];
              uint64_t v50 = *(void *)(*(void *)(a1 + 56) + 8);
              long long v51 = *(void **)(v50 + 40);
              *(void *)(v50 + 40) = v49;

              uint64_t v14 = v78;
            }
            if (cf) {
              CFRelease(cf);
            }
            CFTypeRef v45 = 0;
            goto LABEL_31;
          }
          uint64_t v37 = *(void *)(a1 + 32);
          [*(id *)(a1 + 40) addressBook];
          if ((-[CNiOSAddressBookDataMapper _hasManagedAccessToWriteToAccountCorrespondingToSource:fromAddressBook:](v37) & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            id v98 = v10;
            long long v99 = @"CNInvalidRecordIdentifiers";
            uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
            v100 = v39;
            uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
            uint64_t v41 = 207;
            goto LABEL_22;
          }
          uint64_t v38 = ABPersonCreateInSourceAndReturnError();
          goto LABEL_18;
        }
        if (!-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](*(void *)(a1 + 32)))
        {
          uint64_t v38 = (uint64_t)ABPersonCreate();
LABEL_18:
          long long v34 = (const void *)v38;
          if (!v38) {
            goto LABEL_26;
          }
          goto LABEL_25;
        }
        uint64_t v29 = *(void **)(a1 + 32);
        uint64_t v30 = (const void *)[*(id *)(a1 + 40) addressBook];
        id v83 = 0;
        id v31 = -[CNiOSAddressBookDataMapper _defaultSourceInAddressBook:error:](v29, v30, &v83);
        id v32 = v83;
        id v33 = v83;
        if (v31)
        {
          long long v34 = (const void *)ABPersonCreateInSourceAndReturnError();
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v32);
          long long v34 = 0;
          *a4 = 1;
        }

        if (!v34) {
          goto LABEL_26;
        }
LABEL_25:
        CFTypeRef v45 = CFAutorelease(v34);
LABEL_31:
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          CFErrorRef error = 0;
          long long v52 = [v17 identifier];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABRecordSetValue(v45, property, v52, &error);

          [v17 identifier];
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABAddressBookAddRecord((ABAddressBookRef)[*(id *)(a1 + 40) addressBook], v45, &error);
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
              goto LABEL_37;
            }
          }
          v92 = v17;
          id v93 = @"CNInvalidRecords";
          long long v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
          v94 = v53;
          long long v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          uint64_t v55 = +[CNErrorFactory errorForiOSABError:error];
          uint64_t v56 = +[CNErrorFactory errorByAddingUserInfoEntries:v54 toError:v55];
          uint64_t v57 = *(void *)(*(void *)(a1 + 56) + 8);
          long long v58 = *(void **)(v57 + 40);
          *(void *)(v57 + 40) = v56;

          if (error) {
            CFRelease(error);
          }
          a4 = v76;
          *uint64_t v76 = 1;
          uint64_t v14 = v78;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
          {
LABEL_37:
            id v59 = v10;
            +[CNAddressingGrammarHelper addNoisyValueToContact:v17];
            id v81 = 0;
            long long v60 = +[CNContactDiff diffContact:0 to:v17 error:&v81];
            id v61 = v81;
            uint64_t v62 = v61;
            if (v60)
            {
              v63 = *(void **)(a1 + 32);
              if (v63) {
                v63 = (void *)v63[4];
              }
              id v80 = v61;
              v64 = v63;
              char v65 = [v60 applyToABPerson:v45 isUnified:0 logger:v64 error:&v80];
              id v66 = v80;

              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v65;
              uint64_t v62 = v66;
              a4 = v76;
              uint64_t v14 = v78;
            }
            else
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            }
            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            {
              *a4 = 1;
              long long v89 = v17;
              long long v90 = @"CNInvalidRecords";
              v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
              long long v91 = v67;
              uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
              uint64_t v69 = +[CNErrorFactory errorByAddingUserInfoEntries:v68 toError:v62];
              uint64_t v70 = *(void *)(*(void *)(a1 + 56) + 8);
              uint64_t v71 = *(void **)(v70 + 40);
              *(void *)(v70 + 40) = v69;

              uint64_t v14 = v78;
              a4 = v76;
            }

            id v10 = v59;
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            {
              uint64_t v72 = [*(id *)(a1 + 40) abPersonsByIdentifier];
              uint64_t v73 = [v17 identifier];
              [v72 setObject:v45 forKey:v73];

              id v10 = v59;
            }
          }
        }
        uint64_t v15 = v77;
LABEL_47:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v85 objects:v107 count:16];
    }
    while (v14);
  }
}

- (uint64_t)_hasManagementRestrictionsEnabled
{
  if (a1 && *(void *)(a1 + 40)) {
    return [*(id *)(a1 + 40) deviceHasManagementRestrictions];
  }
  else {
    return 0;
  }
}

- (id)_defaultSourceInAddressBook:(void *)a3 error:
{
  if (!a1) {
    return 0;
  }
  ABRecordRef v6 = ABAddressBookCopyDefaultSource(addressBook);
  if (v6) {
    id v7 = (void *)CFAutorelease(v6);
  }
  else {
    id v7 = 0;
  }
  if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled]((uint64_t)a1)
    && (-[CNiOSAddressBookDataMapper _canWriteUnderManagementRestrictionsToSource:inAddressBook:]((uint64_t)a1) & 1) == 0)
  {
    id v7 = -[CNiOSAddressBookDataMapper _alternativeSourceWithAccessibleAccountFromAddressBook:](a1, addressBook);
  }
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
  }
  else
  {
    id v10 = +[CNErrorFactory errorWithCode:101];
    id v9 = v10;
    if (a3)
    {
      id v9 = v10;
      *a3 = v9;
    }
  }

  id v11 = v7;
  return v11;
}

- (uint64_t)_hasManagedAccessToWriteToAccountCorrespondingToSource:(uint64_t)result fromAddressBook:
{
  if (result)
  {
    uint64_t v1 = result;
    if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](result))
    {
      return -[CNiOSAddressBookDataMapper _canWriteUnderManagementRestrictionsToSource:inAddressBook:](v1);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)_logWillDeleteWithSaveContext:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFArrayRef v4 = v3;
  if (a1)
  {
    id v5 = [v3 saveRequest];
    ABRecordRef v6 = [v5 deletedContacts];
    *(unsigned char *)(a1 + 8) = [v6 count] == 1;

    if (*(unsigned char *)(a1 + 8))
    {
      id v7 = [v4 saveRequest];
      id v8 = [v7 allContactIdentifiers];

      id v9 = [v4 abPersonsByIdentifier];
      id v10 = [v9 allKeys];

      objc_opt_class();
      id v11 = +[CNiOSAddressBookDataMapper os_log]();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134218242;
        uint64_t v15 = [v8 count];
        __int16 v16 = 2114;
        uint64_t v17 = v8;
        _os_log_impl(&dword_1909E3000, v11, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, save context contact identifiers (%ld):%{public}@", (uint8_t *)&v14, 0x16u);
      }

      objc_opt_class();
      uint64_t v12 = +[CNiOSAddressBookDataMapper os_log]();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v10 count];
        int v14 = 134218242;
        uint64_t v15 = v13;
        __int16 v16 = 2114;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, fetched contact identifiers (%ld):%{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  context = (void *)MEMORY[0x192FD3A40]();
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(void **)(v6 + 32);
  }
  else {
    id v7 = 0;
  }
  objc_msgSend(v7, "deletingContact:", v5, a4);
  id v8 = [v5 linkedContacts];
  if ([v8 count])
  {
    uint64_t v9 = [v5 linkedContacts];
  }
  else
  {
    v57[0] = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
  }
  id v10 = (void *)v9;
  uint64_t v43 = v5;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v44 = 0;
    char v14 = 0;
    uint64_t v15 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v18 = [v17 identifier];
        if ([v17 isSuggested])
        {
          -[CNiOSAddressBookDataMapper _logIgnoringSuggestedLinkedSetContactIdentifier:](*(void *)(a1 + 32), v18);
        }
        else
        {
          int v19 = [v17 isImplicitAugmentation];
          uint64_t v20 = *(void *)(a1 + 32);
          if (v19)
          {
            -[CNiOSAddressBookDataMapper _logIngoringImplicitAugmentationLinkedSetContactIdentifier:](v20, v18);
          }
          else
          {
            -[CNiOSAddressBookDataMapper _logWillDeleteLinkedSetContactIdentifier:](v20, v18);
            uint64_t v21 = [*(id *)(a1 + 40) abPersonsByIdentifier];
            uint64_t v22 = (const void *)[v21 objectForKey:v18];

            if (v22)
            {
              -[CNiOSAddressBookDataMapper _logDeleteHasFoundAtLeastOnePersistedContactIdentifier:](*(void *)(a1 + 32), v18);
              int v23 = -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(void *)(a1 + 32), v22, *(void **)(a1 + 40));
              -[CNiOSAddressBookDataMapper _logDeleteHasManagedWriteAccess:contactIdentifier:](*(void *)(a1 + 32), v23, v18);
              if (v23)
              {
                CFErrorRef error = 0;
                *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABAddressBookRemoveRecord((ABAddressBookRef)[*(id *)(a1 + 40) addressBook], v22, &error);
                -[CNiOSAddressBookDataMapper _logDeleteHasRemovedRecordWithResult:err:](*(void *)(a1 + 32), *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), error);
                if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
                {
                  uint64_t v24 = [*(id *)(a1 + 40) contactIdentifiersNeedingMetadataPurge];
                  id v25 = [v17 identifier];
                  [v24 addObject:v25];
                }
                else if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
                {
                  long long v53 = v17;
                  long long v54 = @"CNInvalidRecords";
                  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
                  uint64_t v55 = v26;
                  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
                  uint64_t v28 = +[CNErrorFactory errorForiOSABError:error];
                  uint64_t v29 = +[CNErrorFactory errorByAddingUserInfoEntries:v27 toError:v28];
                  uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
                  id v31 = *(void **)(v30 + 40);
                  *(void *)(v30 + 40) = v29;

                  if (error) {
                    CFRelease(error);
                  }
                }
                BYTE4(v44) = (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) | BYTE4(v44) & 1) != 0;
              }
              char v14 = 1;
            }
            else
            {
              if (([v17 hasBeenPersisted] & 1) == 0)
              {
                -[CNiOSAddressBookDataMapper _logDeleteHasNoPersistedContactIdentifier:](*(void *)(a1 + 32), v18);
                LOBYTE(v44) = 1;
              }
              -[CNiOSAddressBookDataMapper _logDeleteHasNoABRecordForContactIdentifier:](*(void *)(a1 + 32), v18);
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v44 = 0;
    char v14 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (BYTE4(v44) | ~v14) & ~(_BYTE)v44 & 1;
  -[CNiOSAddressBookDataMapper _logDeleteSuccess:hasFoundAtLeastOneBackingPerson:hasDeletedAtLeastOneLinkedContact:hasFoundMissingContactWithNoSnapshot:](*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v14 & 1, BYTE4(v44) & 1, v44 & 1);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v32 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v32)
    {
      if (v44) {
        uint64_t v33 = 200;
      }
      else {
        uint64_t v33 = 207;
      }
      uint64_t v50 = v43;
      long long v51 = @"CNInvalidRecords";
      long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      long long v52 = v34;
      long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      uint64_t v36 = +[CNErrorFactory errorWithCode:v33];
      uint64_t v37 = +[CNErrorFactory errorByAddingUserInfoEntries:v35 toError:v36];
      uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;

      id v32 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    -[CNiOSAddressBookDataMapper _logDeleteHasError:](*(void *)(a1 + 32), v32);
    unsigned char *v41 = 1;
  }
}

- (void)_logIgnoringSuggestedLinkedSetContactIdentifier:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    CFArrayRef v4 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, ignoring suggested contact identifier : %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_logIngoringImplicitAugmentationLinkedSetContactIdentifier:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    CFArrayRef v4 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, ignoring augmented contact identifier : %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_logWillDeleteLinkedSetContactIdentifier:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    CFArrayRef v4 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, will try to delete contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_logDeleteHasNoPersistedContactIdentifier:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    CFArrayRef v4 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, no persisted contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_logDeleteHasNoABRecordForContactIdentifier:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    CFArrayRef v4 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, no ABRecordRef for contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_logDeleteHasFoundAtLeastOnePersistedContactIdentifier:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    CFArrayRef v4 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, has found at least one persisted contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (uint64_t)_hasManagedWriteAccessToAccountContainingPerson:(void *)a3 fromSaveContext:
{
  id v5 = a3;
  if (a1)
  {
    ABRecordRef v6 = ABPersonCopySource(a2);
    if (v6) {
      CFAutorelease(v6);
    }
    [v5 addressBook];
    if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](a1)) {
      a1 = -[CNiOSAddressBookDataMapper _canWriteUnderManagementRestrictionsToSource:inAddressBook:](a1);
    }
    else {
      a1 = 1;
    }
  }

  return a1;
}

- (void)_logDeleteHasManagedWriteAccess:(void *)a3 contactIdentifier:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    ABRecordRef v6 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"has no";
      if (a2) {
        uint64_t v7 = @"has";
      }
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, %{public}@ managed write access for contact identifier: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_logDeleteHasRemovedRecordWithResult:(void *)a3 err:
{
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    id v4 = a3;
    objc_opt_class();
    id v5 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CNiOSAddressBookDataMapper _logDeleteHasRemovedRecordWithResult:err:](a2, (uint64_t)v4, v5);
    }
  }
}

- (void)_logDeleteSuccess:(int)a3 hasFoundAtLeastOneBackingPerson:(int)a4 hasDeletedAtLeastOneLinkedContact:(int)a5 hasFoundMissingContactWithNoSnapshot:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    uint64_t v9 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = @"failed";
      if (a2) {
        __int16 v10 = @"success";
      }
      if (a3) {
        id v11 = @"YES";
      }
      else {
        id v11 = @"NO";
      }
      int v14 = 138544130;
      uint64_t v15 = v10;
      if (a4) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      int v19 = v12;
      if (a5) {
        uint64_t v13 = @"YES";
      }
      else {
        uint64_t v13 = @"NO";
      }
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, %{public}@, hasFoundAtLeastOneBackingPerson:%{public}@, hasDeletedAtLeastOneLinkedContact:%{public}@, hasFoundMissingContactWithNoSnapshot:%{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

- (void)_logDeleteHasError:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    objc_opt_class();
    id v4 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CNiOSAddressBookDataMapper _logDeleteHasError:]();
    }
  }
}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = (void *)MEMORY[0x192FD3A40]();
  id v8 = v6;
  +[CNAddressingGrammarHelper addNoisyValueToContact:v8];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    __int16 v10 = *(void **)(v9 + 32);
  }
  else {
    __int16 v10 = 0;
  }
  [v10 updatingContact:v8];
  id v60 = 0;
  id v11 = [v8 diffToSnapshotAndReturnError:&v60];
  id v12 = v60;
  id v13 = v60;
  if (!v11)
  {
    uint64_t v39 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v41 = *(void *)(v39 + 40);
    uint64_t v40 = (id *)(v39 + 40);
    if (v41)
    {
      objc_storeStrong(v40, v12);
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      goto LABEL_43;
    }
  }
  unsigned int v49 = [v8 isUnified];
  if (v49)
  {
    [v8 mainStoreLinkedContacts];
  }
  else
  {
    v68[0] = v8;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
  }
  id v45 = v8;
  long long v46 = v7;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v14 countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (!v51)
  {
    char v48 = 0;
    goto LABEL_39;
  }
  char v48 = 0;
  uint64_t v50 = *(void *)v57;
  id v47 = v14;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v57 != v50) {
        objc_enumerationMutation(v14);
      }
      __int16 v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
      uint64_t v17 = objc_msgSend(*(id *)(a1 + 40), "abPersonsByIdentifier", v45, v46);
      __int16 v18 = [v16 identifier];
      int v19 = (const void *)[v17 objectForKey:v18];

      if (!v19
        || (-[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(void *)(a1 + 32), v19, *(void **)(a1 + 40)) & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        v64 = v16;
        char v65 = @"CNInvalidRecords";
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
        id v66 = v24;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        uint64_t v26 = +[CNErrorFactory errorWithCode:200 userInfo:v25];
        uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

        *a4 = 1;
        goto LABEL_31;
      }
      __int16 v20 = *(void **)(a1 + 32);
      if (v20) {
        __int16 v20 = (void *)v20[4];
      }
      id v55 = 0;
      uint64_t v21 = v20;
      char v22 = [v11 applyToABPerson:v19 isUnified:v49 logger:v21 error:&v55];
      id v23 = v55;

      if (v22)
      {
        char v48 = 1;
      }
      else
      {
        uint64_t v29 = [*(id *)(a1 + 40) saveRequest];
        int v30 = [v29 canIgnoreError:v23];

        id v31 = os_log_create("com.apple.contacts", "data-access-error");
        if (CNIsErrorWithCode(v23, 1015))
        {
          id v32 = v13;
          uint64_t v33 = v11;
          long long v34 = a4;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3_cold_1(&v53, v54, v31);
          }
          uint64_t v35 = +[CNErrorFactory errorWithCode:2];

          id v23 = (id)v35;
          a4 = v34;
          id v11 = v33;
          id v13 = v32;
          id v14 = v47;
        }
        if (v30)
        {
          char v48 = 1;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            char v48 = 1;
            _os_log_impl(&dword_1909E3000, v31, OS_LOG_TYPE_INFO, "Ignoring data access error and continuing", buf, 2u);
          }
          id v36 = 0;
          uint64_t v37 = 0;
        }
        else
        {
          id v23 = v23;

          if (!v23)
          {
            id v13 = 0;
            goto LABEL_30;
          }
          id v61 = v16;
          uint64_t v62 = @"CNInvalidRecords";
          id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
          v63 = v31;
          id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
          uint64_t v37 = +[CNErrorFactory errorByAddingUserInfoEntries:v13 toError:v23];
          id v36 = v23;
        }

        id v23 = v36;
        id v13 = (id)v37;
      }
LABEL_30:

LABEL_31:
      ++v15;
    }
    while (v51 != v15);
    uint64_t v38 = [v14 countByEnumeratingWithState:&v56 objects:v67 count:16];
    uint64_t v51 = v38;
  }
  while (v38);
LABEL_39:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v48 & 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *a4 = 1;
    uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v44 = *(void *)(v42 + 40);
    uint64_t v43 = (id *)(v42 + 40);
    if (!v44) {
      objc_storeStrong(v43, v13);
    }
  }

  id v8 = v45;
  uint64_t v7 = v46;
LABEL_43:
}

- (BOOL)_processContactChangeRequestsFromSaveContext:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v21 = 0;
    char v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    uint64_t v15 = 0;
    __int16 v16 = &v15;
    uint64_t v17 = 0x3032000000;
    __int16 v18 = __Block_byref_object_copy__16;
    int v19 = __Block_byref_object_dispose__16;
    id v20 = 0;
    uint64_t v7 = [v5 saveRequest];
    id v8 = [v7 contactChangeRequests];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__CNiOSAddressBookDataMapper__processContactChangeRequestsFromSaveContext_error___block_invoke;
    v10[3] = &unk_1E56B5EF0;
    id v11 = v6;
    BOOL v12 = a1;
    id v13 = &v21;
    id v14 = &v15;
    [v8 enumerateObjectsUsingBlock:v10];

    a1 = *((unsigned char *)v22 + 24) != 0;
    if (a3 && !*((unsigned char *)v22 + 24)) {
      *a3 = (id) v16[5];
    }

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }

  return a1;
}

void __81__CNiOSAddressBookDataMapper__processContactChangeRequestsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v7 = [v6 contacts];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        id v13 = [*(id *)(a1 + 32) saveRequest];
        id v14 = [v13 deletedContacts];
        LOBYTE(v12) = [v14 containsObject:v12];

        if (v12)
        {

          goto LABEL_31;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  switch([v6 kind])
  {
    case 0:
      uint64_t v15 = [v6 contacts];
      __int16 v16 = [v15 objectAtIndexedSubscript:0];

      uint64_t v17 = [v6 contacts];
      __int16 v18 = [v17 objectAtIndexedSubscript:1];

      int v19 = [*(id *)(a1 + 32) abPersonsByIdentifier];
      id v20 = [v16 identifier];
      uint64_t v21 = [v19 objectForKeyedSubscript:v20];

      char v22 = [*(id *)(a1 + 32) abPersonsByIdentifier];
      uint64_t v23 = [v18 identifier];
      char v24 = [v22 objectForKeyedSubscript:v23];

      if (v21
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(void *)(a1 + 40), v24, *(void **)(a1 + 32)))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABPersonLinkPerson();
      }

      goto LABEL_28;
    case 1:
      id v25 = [v6 contacts];
      __int16 v16 = [v25 lastObject];

      uint64_t v26 = [*(id *)(a1 + 32) abPersonsByIdentifier];
      uint64_t v27 = [v16 identifier];
      uint64_t v28 = [v26 objectForKeyedSubscript:v27];

      if (v28
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(void *)(a1 + 40), v28, *(void **)(a1 + 32)))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ABPersonUnlink();
      }
      goto LABEL_28;
    case 2:
      uint64_t v29 = [v6 contacts];
      __int16 v16 = [v29 firstObject];

      int v30 = [*(id *)(a1 + 32) abPersonsByIdentifier];
      id v31 = [v16 identifier];
      id v32 = [v30 objectForKeyedSubscript:v31];

      if (v32
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(void *)(a1 + 40), v32, *(void **)(a1 + 32)))
      {
        ABPersonSetPreferredLinkedPersonForName();
      }
      goto LABEL_28;
    case 3:
      uint64_t v33 = [v6 contacts];
      __int16 v16 = [v33 firstObject];

      long long v34 = [*(id *)(a1 + 32) abPersonsByIdentifier];
      uint64_t v35 = [v16 identifier];
      id v36 = [v34 objectForKeyedSubscript:v35];

      if (v36
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(void *)(a1 + 40), v36, *(void **)(a1 + 32)))
      {
        ABPersonSetPreferredLinkedPersonForImage();
      }
      goto LABEL_28;
    case 4:
      uint64_t v37 = [v6 contacts];
      __int16 v16 = [v37 firstObject];

      uint64_t v38 = [*(id *)(a1 + 32) abPersonsByIdentifier];
      uint64_t v39 = [v16 identifier];
      uint64_t v40 = [v38 objectForKeyedSubscript:v39];

      uint64_t v41 = [v6 linkIdentifier];
      if (v40
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(void *)(a1 + 40), v40, *(void **)(a1 + 32)))
      {
        ABPersonSetLinkUUID();
      }

LABEL_28:
      break;
    default:
      break;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v42 = +[CNErrorFactory errorForiOSABError:0];
    uint64_t v43 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v42;

    *a4 = 1;
  }
LABEL_31:
}

- (void)_alternativeSourceWithAccessibleAccountFromAddressBook:(void *)a1
{
  objc_super v2 = a1;
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFArrayRef v4 = ABAddressBookCopyArrayOfAllSources(addressBook);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke;
    v13[3] = &unk_1E56B5F18;
    void v13[4] = v2;
    void v13[5] = addressBook;
    id v5 = [(__CFArray *)v4 _cn_filter:v13];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke_2;
    aBlock[3] = &unk_1E56B5F40;
    void aBlock[4] = v2;
    aBlock[5] = addressBook;
    id v6 = _Block_copy(aBlock);
    uint64_t v7 = _Block_copy(v6);
    v14[0] = v7;
    v14[1] = &__block_literal_global_67;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v9 = CNAggregateComparator();
    uint64_t v10 = [v5 sortedArrayUsingComparator:v9];

    objc_super v2 = [v10 firstObject];
  }
  return v2;
}

uint64_t __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke(uint64_t a1)
{
  return -[CNiOSAddressBookDataMapper _hasManagedAccessToWriteToAccountCorrespondingToSource:fromAddressBook:](*(void *)(a1 + 32));
}

uint64_t __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)ABAddressBookCopyAccountIdentifierForSource();
  id v6 = (void *)ABAddressBookCopyAccountIdentifierForSource();

  uint64_t v7 = *MEMORY[0x1E4F177C0];
  v25[0] = *MEMORY[0x1E4F17750];
  v25[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F17778];
  void v25[2] = *MEMORY[0x1E4F17878];
  v25[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F17798];
  v25[4] = *MEMORY[0x1E4F177D0];
  void v25[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void **)(v11 + 48);
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [v12 accountForIdentifier:v5];
  id v14 = [v13 accountType];
  uint64_t v15 = [v14 identifier];

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    uint64_t v17 = *(void **)(v16 + 48);
  }
  else {
    uint64_t v17 = 0;
  }
  __int16 v18 = [v17 accountForIdentifier:v6];
  int v19 = [v18 accountType];
  id v20 = [v19 identifier];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "indexOfObject:", v15));
  char v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "indexOfObject:", v20));
  uint64_t v23 = [v21 compare:v22];

  return v23;
}

uint64_t __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke_3(uint64_t a1, const void *a2, void *a3)
{
  id v4 = a3;
  uint64_t RecordID = ABRecordGetRecordID(a2);
  uint64_t v6 = ABRecordGetRecordID(v4);

  uint64_t v7 = [NSNumber numberWithInt:RecordID];
  uint64_t v8 = [NSNumber numberWithInt:v6];
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

- (uint64_t)_canWriteUnderManagementRestrictionsToSource:(uint64_t)a1 inAddressBook:
{
  if (!a1
    || ABRecordGetIntValue() == 6
    || (ABSourceIsRemote() & 1) != 0
    || (ABSourceIsReadonly() & 1) != 0
    || !ABRecordGetIntValue() && ![*(id *)(a1 + 40) canWriteToLocalAccount])
  {
    return 0;
  }
  id v3 = (void *)ABAddressBookCopyAccountIdentifierForSource();
  uint64_t v4 = [*(id *)(a1 + 40) canWriteToAccountWithIdentifier:v3];

  return v4;
}

- (uint64_t)_hasManagedAccessToReadFromAccountCorrespondingToSource:(uint64_t)result fromAddressBook:
{
  if (result)
  {
    uint64_t v1 = result;
    if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](result))
    {
      return -[CNiOSAddressBookDataMapper _canReadUnderManagementRestrictionsFromSource:inAddressBook:](v1);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_canReadUnderManagementRestrictionsFromSource:(uint64_t)a1 inAddressBook:
{
  if (!a1
    || !ABRecordGetIntValue() && ![*(id *)(a1 + 40) canReadFromLocalAccount])
  {
    return 0;
  }
  objc_super v2 = (void *)ABAddressBookCopyAccountIdentifierForSource();
  uint64_t v3 = [*(id *)(a1 + 40) canReadFromAccountWithIdentifier:v2];

  return v3;
}

void __66__CNiOSAddressBookDataMapper__postProcessContactsFromSaveContext___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 identifier];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    [v3 setSnapshot:0];
    uint64_t v7 = [*(id *)(a1 + 40) saveResponse];
    uint64_t v8 = [*(id *)(a1 + 40) indexPathForContactInstance:v3];
    [v7 setContactSnapshot:0 forIndexPath:v8];
  }
  else
  {
    v45[0] = v3;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    id v30 = v3;
    if ([v3 isUnified])
    {
      uint64_t v10 = [v3 mainStoreLinkedContacts];

      uint64_t v11 = (void *)[v3 copyWithSelfAsSnapshot];
      [v3 setSnapshot:v11];
      uint64_t v12 = [*(id *)(a1 + 40) saveResponse];
      id v13 = [*(id *)(a1 + 40) indexPathForContactInstance:v3];
      [v12 setContactSnapshot:v11 forIndexPath:v13];

      uint64_t v9 = (void *)v10;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v9;
    uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v34)
    {
      uint64_t v32 = a1;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v16 = [*(id *)(a1 + 40) abPersonsByIdentifier];
          uint64_t v17 = [v15 identifier];
          __int16 v18 = [v16 objectForKeyedSubscript:v17];

          if (v18)
          {
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v19 = *(id *)(a1 + 48);
            uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v36;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v36 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  char v24 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  id v25 = [v24 key];
                  int v26 = [v15 isKeyAvailable:v25];

                  if (v26) {
                    [v24 copyFromABPerson:v18 toContact:v15];
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v21);
            }

            a1 = v32;
          }
          uint64_t v27 = (void *)[v15 copyWithSelfAsSnapshot];
          [v15 setSnapshot:v27];
          uint64_t v28 = [*(id *)(a1 + 40) saveResponse];
          uint64_t v29 = [*(id *)(a1 + 40) indexPathForContactInstance:v15];
          [v28 setContactSnapshot:v27 forIndexPath:v29];
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v34);
    }

    id v3 = v30;
  }
}

void __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v8;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
    ABPropertyID property = *MEMORY[0x1E4F499A8];
    ABPropertyID v44 = *MEMORY[0x1E4F499B0];
    id v46 = v9;
    long long v47 = a4;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v15 = [*(id *)(a1 + 32) abGroupsByIdentifier];
        uint64_t v16 = [v14 identifier];
        uint64_t v17 = [v15 objectForKey:v16];

        if (v17)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          id v60 = v14;
          id v61 = @"CNInvalidRecords";
          __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
          uint64_t v62 = v18;
          id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          uint64_t v20 = +[CNErrorFactory errorWithCode:201 userInfo:v19];
          uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;

          *a4 = 1;
          continue;
        }
        [v14 setSnapshot:0];
        uint64_t v23 = [*(id *)(a1 + 32) saveResponse];
        char v24 = [*(id *)(a1 + 32) indexPathForGroupInstance:v14];
        [v23 setGroupSnapshot:0 forIndexPath:v24];

        id v25 = [MEMORY[0x1E4F1CA98] null];
        LODWORD(v24) = [v9 isEqual:v25];

        if (v24)
        {
          ABRecordRef v26 = ABGroupCreate();
          if (!v26) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v27 = [*(id *)(a1 + 32) abSourcesByIdentifier];
          uint64_t v28 = (const void *)[v27 objectForKey:v9];

          if (!v28)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
            id v57 = v9;
            long long v58 = @"CNInvalidRecordIdentifiers";
            id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
            long long v59 = v30;
            id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
            uint64_t v32 = +[CNErrorFactory errorWithCode:200 userInfo:v31];
            uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v34 = *(void **)(v33 + 40);
            *(void *)(v33 + 40) = v32;

            *a4 = 1;
LABEL_15:
            CFTypeRef v29 = 0;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_16;
          }
          ABRecordRef v26 = ABGroupCreateInSource(v28);
          if (!v26) {
            goto LABEL_15;
          }
        }
        CFTypeRef v29 = CFAutorelease(v26);
LABEL_16:
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          CFErrorRef error = 0;
          long long v35 = [v14 identifier];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ABRecordSetValue(v29, property, v35, &error);

          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ABRecordSetValue(v29, v44, (CFTypeRef)[v14 name], &error);
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ABAddressBookAddRecord((ABAddressBookRef)[*(id *)(a1 + 32) addressBook], v29, &error);
              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
                goto LABEL_23;
              }
            }
          }
          long long v54 = v14;
          id v55 = @"CNInvalidRecords";
          long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
          long long v56 = v36;
          long long v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          long long v38 = +[CNErrorFactory errorForiOSABError:error];
          uint64_t v39 = +[CNErrorFactory errorByAddingUserInfoEntries:v37 toError:v38];
          uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8);
          long long v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = v39;

          if (error) {
            CFRelease(error);
          }
          id v9 = v46;
          a4 = v47;
          unsigned char *v47 = 1;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
LABEL_23:
            long long v42 = [*(id *)(a1 + 32) abGroupsByIdentifier];
            uint64_t v43 = [v14 identifier];
            [v42 setObject:v29 forKey:v43];

            a4 = v47;
            id v9 = v46;
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v11);
  }
}

void __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) abGroupsByIdentifier];
  id v8 = [v6 identifier];
  id v9 = (const void *)[v7 objectForKey:v8];

  if (v9)
  {
    CFErrorRef error = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ABAddressBookRemoveRecord((ABAddressBookRef)[*(id *)(a1 + 32) addressBook], v9, &error);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v17 = v6;
      __int16 v18 = @"CNInvalidRecords";
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      v19[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v12 = +[CNErrorFactory errorForiOSABError:error];
      uint64_t v13 = +[CNErrorFactory errorByAddingUserInfoEntries:v11 toError:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      if (error) {
        CFRelease(error);
      }
      *a4 = 1;
    }
  }
}

void __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) abGroupsByIdentifier];
  id v8 = [v6 identifier];
  id v9 = (const void *)[v7 objectForKey:v8];

  if (v9)
  {
    CFTypeRef cf = 0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v10 = [v6 name];
      uint64_t v11 = [v6 snapshot];
      uint64_t v12 = [v11 name];
      char v13 = [v10 isEqual:v12];

      if ((v13 & 1) == 0)
      {
        ABPropertyID v14 = *MEMORY[0x1E4F499B0];
        uint64_t v15 = [v6 name];
        BOOL v16 = ABRecordSetValue(v9, v14, v15, (CFErrorRef *)&cf);
        uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(unsigned char *)(v17 + 24)) {
          BOOL v18 = v16;
        }
        else {
          BOOL v18 = 0;
        }
        *(unsigned char *)(v17 + 24) = v18;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v19 = [v6 externalIdentifier];
      uint64_t v20 = [v6 snapshot];
      uint64_t v21 = [v20 externalIdentifier];
      char v22 = [v19 isEqual:v21];

      if ((v22 & 1) == 0)
      {
        ABPropertyID v23 = *MEMORY[0x1E4F49988];
        char v24 = [v6 externalIdentifier];
        BOOL v25 = ABRecordSetValue(v9, v23, v24, (CFErrorRef *)&cf);
        uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(unsigned char *)(v26 + 24)) {
          BOOL v27 = v25;
        }
        else {
          BOOL v27 = 0;
        }
        *(unsigned char *)(v26 + 24) = v27;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v28 = [v6 externalModificationTag];
      CFTypeRef v29 = [v6 snapshot];
      id v30 = [v29 externalModificationTag];
      char v31 = [v28 isEqual:v30];

      if ((v31 & 1) == 0)
      {
        ABPropertyID v32 = *MEMORY[0x1E4F49990];
        uint64_t v33 = [v6 externalModificationTag];
        BOOL v34 = ABRecordSetValue(v9, v32, v33, (CFErrorRef *)&cf);
        uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(unsigned char *)(v35 + 24)) {
          BOOL v36 = v34;
        }
        else {
          BOOL v36 = 0;
        }
        *(unsigned char *)(v35 + 24) = v36;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      long long v37 = [v6 externalRepresentation];
      long long v38 = [v6 snapshot];
      uint64_t v39 = [v38 externalRepresentation];
      char v40 = [v37 isEqual:v39];

      if ((v40 & 1) == 0)
      {
        ABPropertyID v41 = *MEMORY[0x1E4F49998];
        long long v42 = [v6 externalRepresentation];
        BOOL v43 = ABRecordSetValue(v9, v41, v42, (CFErrorRef *)&cf);
        uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(unsigned char *)(v44 + 24)) {
          BOOL v45 = v43;
        }
        else {
          BOOL v45 = 0;
        }
        *(unsigned char *)(v44 + 24) = v45;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v46 = [v6 externalUUID];
      long long v47 = [v6 snapshot];
      long long v48 = [v47 externalUUID];
      char v49 = [v46 isEqual:v48];

      if ((v49 & 1) == 0)
      {
        ABPropertyID v50 = *MEMORY[0x1E4F499A0];
        long long v51 = [v6 externalUUID];
        BOOL v52 = ABRecordSetValue(v9, v50, v51, (CFErrorRef *)&cf);
        uint64_t v53 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(unsigned char *)(v53 + 24)) {
          BOOL v54 = v52;
        }
        else {
          BOOL v54 = 0;
        }
        *(unsigned char *)(v53 + 24) = v54;
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *a4 = 1;
      id v67 = v6;
      uint64_t v68 = @"CNInvalidRecords";
      id v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      uint64_t v69 = v55;
      long long v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      id v57 = +[CNErrorFactory errorForiOSABError:cf];
      uint64_t v58 = +[CNErrorFactory errorByAddingUserInfoEntries:v56 toError:v57];
      uint64_t v59 = *(void *)(*(void *)(a1 + 48) + 8);
      id v60 = *(void **)(v59 + 40);
      *(void *)(v59 + 40) = v58;

      if (cf) {
        CFRelease(cf);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v70 = v6;
    uint64_t v71 = @"CNInvalidRecords";
    id v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    v72[0] = v61;
    uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
    uint64_t v63 = +[CNErrorFactory errorWithCode:200 userInfo:v62];
    uint64_t v64 = *(void *)(*(void *)(a1 + 48) + 8);
    char v65 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v63;

    *a4 = 1;
  }
}

- (BOOL)_processContactMembershipsFromSaveContext:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (!a1)
  {
    BOOL v14 = 0;
    goto LABEL_10;
  }
  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000;
  BOOL v27 = __Block_byref_object_copy__16;
  uint64_t v28 = __Block_byref_object_dispose__16;
  id v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke;
  aBlock[3] = &unk_1E56B6028;
  id v7 = v5;
  id v21 = v7;
  char v22 = &v30;
  ABPropertyID v23 = &v24;
  id v8 = (void (**)(void *, void *, void *, void *))_Block_copy(aBlock);
  if (*((unsigned char *)v31 + 24))
  {
    id v9 = [v7 saveRequest];
    uint64_t v10 = [v9 addedMembersByGroupIdentifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_5;
    v18[3] = &unk_1E56B6070;
    id v11 = v7;
    id v19 = v11;
    v8[2](v8, v10, &__block_literal_global_76_0, v18);

    if (*((unsigned char *)v31 + 24))
    {
      uint64_t v12 = [v11 saveRequest];
      char v13 = [v12 removedMembersByGroupIdentifier];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_7;
      v16[3] = &unk_1E56B6070;
      id v17 = v11;
      v8[2](v8, v13, &__block_literal_global_79, v16);

      BOOL v14 = *((unsigned char *)v31 + 24) != 0;
      if (!a3) {
        goto LABEL_9;
      }
LABEL_7:
      if (!v14) {
        *a3 = (id) v25[5];
      }
      goto LABEL_9;
    }
  }
  BOOL v14 = 0;
  if (a3) {
    goto LABEL_7;
  }
LABEL_9:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
LABEL_10:

  return v14;
}

- (BOOL)_processSubgroupMembershipsFromSaveContext:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (!a1)
  {
    BOOL v14 = 0;
    goto LABEL_10;
  }
  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000;
  BOOL v27 = __Block_byref_object_copy__16;
  uint64_t v28 = __Block_byref_object_dispose__16;
  id v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke;
  aBlock[3] = &unk_1E56B6098;
  id v7 = v5;
  id v21 = v7;
  char v22 = &v30;
  ABPropertyID v23 = &v24;
  id v8 = (void (**)(void *, void *, void *, void *))_Block_copy(aBlock);
  if (*((unsigned char *)v31 + 24))
  {
    id v9 = [v7 saveRequest];
    uint64_t v10 = [v9 addedSubgroupsByGroupIdentifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_4;
    v18[3] = &unk_1E56B6070;
    id v11 = v7;
    id v19 = v11;
    v8[2](v8, v10, &__block_literal_global_83, v18);

    if (*((unsigned char *)v31 + 24))
    {
      uint64_t v12 = [v11 saveRequest];
      char v13 = [v12 removedSubgroupsByGroupIdentifier];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_6;
      v16[3] = &unk_1E56B6070;
      id v17 = v11;
      v8[2](v8, v13, &__block_literal_global_85, v16);

      BOOL v14 = *((unsigned char *)v31 + 24) != 0;
      if (!a3) {
        goto LABEL_9;
      }
LABEL_7:
      if (!v14) {
        *a3 = (id) v25[5];
      }
      goto LABEL_9;
    }
  }
  BOOL v14 = 0;
  if (a3) {
    goto LABEL_7;
  }
LABEL_9:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
LABEL_10:

  return v14;
}

void __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_2;
  v11[3] = &unk_1E56B6000;
  id v12 = *(id *)(a1 + 32);
  id v13 = v8;
  long long v15 = *(_OWORD *)(a1 + 40);
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  [a2 enumerateKeysAndObjectsUsingBlock:v11];
}

void __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) abGroupsByIdentifier];
  id v10 = [v9 objectForKeyedSubscript:v7];

  BOOL v36 = v10;
  if (v10)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v34 = v8;
      id v35 = v7;
      uint64_t v14 = *(void *)v43;
      do
      {
        long long v15 = v11;
        for (uint64_t i = 0; i != v13; ++i)
        {
          id v17 = a4;
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v15);
          }
          BOOL v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v19 = [*(id *)(a1 + 32) abPersonsByIdentifier];
          uint64_t v20 = [v18 identifier];
          id v21 = [v19 objectForKeyedSubscript:v20];

          if (v21)
          {
            uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
            id obj = *(id *)(v22 + 40);
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_3;
            v37[3] = &unk_1E56B5FD8;
            id v38 = *(id *)(a1 + 48);
            uint64_t v39 = v36;
            char v40 = v21;
            char v23 = CNBridgeBoolResultAndErrorFromBlock(&obj, (uint64_t)v37);
            objc_storeStrong((id *)(v22 + 40), obj);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v23;
            a4 = v17;
            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
              unsigned char *v17 = 1;
            }
          }
          else
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            id v46 = v18;
            long long v47 = @"CNInvalidRecords";
            uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
            long long v48 = v24;
            BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
            uint64_t v26 = +[CNErrorFactory errorWithCode:200 userInfo:v25];
            uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
            uint64_t v28 = *(void **)(v27 + 40);
            *(void *)(v27 + 40) = v26;

            a4 = v17;
            unsigned char *v17 = 1;
          }
        }
        id v11 = v15;
        uint64_t v13 = [v15 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v13);
      id v8 = v34;
      id v7 = v35;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v50 = v11;
    long long v51 = @"CNInvalidRecords";
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    v52[0] = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    uint64_t v31 = +[CNErrorFactory errorWithCode:200 userInfo:v30];
    uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
    char v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    *a4 = 1;
  }
}

uint64_t __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_3(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[4] + 16))(a1[4], a1[5], a1[6], a2);
}

BOOL __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_4(int a1, ABRecordRef group, ABRecordRef person, CFErrorRef *error)
{
  return ABGroupAddMember(group, person, error);
}

id __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_5(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 saveRequest];
  id v5 = [v4 groupWithAddedMemberForGroupIdentifier:v3];

  return v5;
}

BOOL __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_6(int a1, ABRecordRef group, ABRecordRef member, CFErrorRef *error)
{
  return ABGroupRemoveMember(group, member, error);
}

id __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_7(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 saveRequest];
  id v5 = [v4 groupWithRemovedMemberForGroupIdentifier:v3];

  return v5;
}

void __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_2;
  v11[3] = &unk_1E56B6000;
  id v12 = *(id *)(a1 + 32);
  id v13 = v8;
  long long v15 = *(_OWORD *)(a1 + 40);
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  [a2 enumerateKeysAndObjectsUsingBlock:v11];
}

void __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) abGroupsByIdentifier];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v44 = v11;
    long long v45 = @"CNInvalidRecords";
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    v46[0] = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    uint64_t v31 = +[CNErrorFactory errorWithCode:200 userInfo:v30];
    uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
    char v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    *a4 = 1;
    goto LABEL_16;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v34 = v8;
    id v35 = v7;
    uint64_t v14 = *(void *)v37;
    while (1)
    {
      long long v15 = v11;
      for (uint64_t i = 0; i != v13; ++i)
      {
        id v17 = a4;
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v15);
        }
        BOOL v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v19 = objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier", v34, v35);
        uint64_t v20 = [v18 identifier];
        id v21 = [v19 objectForKeyedSubscript:v20];

        if (v21)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
          a4 = v17;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
            continue;
          }
          uint64_t v22 = +[CNErrorFactory genericiOSABError];
          uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v22;
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          char v40 = v18;
          ABPropertyID v41 = @"CNInvalidRecords";
          uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
          long long v42 = v24;
          BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          uint64_t v26 = +[CNErrorFactory errorWithCode:200 userInfo:v25];
          uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v28 = *(void **)(v27 + 40);
          *(void *)(v27 + 40) = v26;

          a4 = v17;
        }

        *a4 = 1;
      }
      id v11 = v15;
      uint64_t v13 = [v15 countByEnumeratingWithState:&v36 objects:v43 count:16];
      if (!v13)
      {
        id v8 = v34;
        id v7 = v35;
        break;
      }
    }
  }
LABEL_16:
}

uint64_t __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4106E38](a2, a3);
}

id __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_4(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 saveRequest];
  id v5 = [v4 groupWithAddedSubgroupForGroupIdentifier:v3];

  return v5;
}

uint64_t __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4106E78](a2, a3);
}

id __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_6(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 saveRequest];
  id v5 = [v4 groupWithRemovedSubgroupForGroupIdentifier:v3];

  return v5;
}

- (id)defaultContainerIdentifier
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__16;
  uint64_t v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v4 = addressBook;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CNiOSAddressBookDataMapper_defaultContainerIdentifier__block_invoke;
  v8[3] = &unk_1E56B60E0;
  void v8[4] = self;
  v8[5] = &v9;
  id v5 = [(CNiOSAddressBook *)v4 performSynchronousWorkWithInvalidatedAddressBook:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __56__CNiOSAddressBookDataMapper_defaultContainerIdentifier__block_invoke(uint64_t a1, const void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[CNiOSAddressBookDataMapper defaultContainerIdentifierForAddressBook:error:](*(void **)(a1 + 32), a2, 0);

  return MEMORY[0x1F41817F8]();
}

- (id)_containersMatchingPredicate:(char)a3 remote:(void *)a4 error:
{
  id v7 = a2;
  id v8 = v7;
  if (a1)
  {
    if (!v7 || ([v7 conformsToProtocol:&unk_1EE0947F0] & 1) != 0)
    {
      uint64_t v31 = 0;
      uint64_t v32 = &v31;
      uint64_t v33 = 0x3032000000;
      id v34 = __Block_byref_object_copy__16;
      id v35 = __Block_byref_object_dispose__16;
      id v36 = 0;
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy__16;
      void v29[4] = __Block_byref_object_dispose__16;
      id v30 = 0;
      id v9 = a1[2];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke;
      v23[3] = &unk_1E56B6130;
      id v24 = v8;
      BOOL v25 = a1;
      uint64_t v26 = v29;
      uint64_t v27 = &v31;
      char v28 = a3;
      id v10 = [v9 performSynchronousWorkWithInvalidatedAddressBook:v23];

      if ([v10 isSuccess])
      {
        uint64_t v11 = (void *)v32[5];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        uint64_t v20 = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_4;
        id v21 = &unk_1E56B6158;
        uint64_t v22 = v29;
        a1 = v11;
        uint64_t v12 = v19;
        uint64_t v13 = v12;
        if (!a4 || a1) {
          goto LABEL_15;
        }
        v20((uint64_t)v12);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v15 = [v10 error];
        uint64_t v13 = v15;
        if (!a4)
        {
          a1 = 0;
          goto LABEL_15;
        }
        id v14 = v15;
        a1 = 0;
      }
      *a4 = v14;
LABEL_15:

      _Block_object_dispose(v29, 8);
      _Block_object_dispose(&v31, 8);

      goto LABEL_16;
    }
    BOOL v16 = +[CNErrorFactory errorWithCode:400];
    id v17 = v16;
    if (a4) {
      *a4 = v16;
    }

    a1 = 0;
  }
LABEL_16:

  return a1;
}

void __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke(uint64_t a1, const void *a2)
{
  int v4 = [*(id *)(a1 + 32) conformsToProtocol:&unk_1EE0947F0];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    char v6 = [v5 includesDisabledContainers];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v18 = *(id *)(v7 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_2;
    v15[3] = &unk_1E56B6108;
    id v16 = *(id *)(a1 + 32);
    id v17 = a2;
    CNBridgeABCFResultAndErrorFromBlock(&v18, (uint64_t)v15);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), v18);
  }
  else
  {
    if (v5)
    {
      id v8 = 0;
    }
    else
    {
      id v9 = ABAddressBookCopyArrayOfAllSources(a2);
      if (v9) {
        id v9 = (void *)CFAutorelease(v9);
      }
      id v8 = v9;
    }
    char v6 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_3;
  void v14[3] = &unk_1E56B5F18;
  v14[4] = *(void *)(a1 + 40);
  void v14[5] = a2;
  id v10 = objc_msgSend(v8, "_cn_filter:", v14);

  if (v10)
  {
    uint64_t v11 = +[CNiOSABConversions containersFromABSources:remote:includeDisabledSources:]((uint64_t)CNiOSABConversions, (uint64_t)v10, *(unsigned char *)(a1 + 64), v6);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

uint64_t __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyContainersInAddressBook:error:", *(void *)(a1 + 40), a2);
}

uint64_t __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_3(uint64_t a1)
{
  return -[CNiOSAddressBookDataMapper _hasManagedAccessToReadFromAccountCorrespondingToSource:fromAddressBook:](*(void *)(a1 + 32));
}

id __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = +[CNErrorFactory genericiOSABError];
  }

  return v2;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  return -[CNiOSAddressBookDataMapper _containersMatchingPredicate:remote:error:]((id *)&self->super.isa, a3, 0, a4);
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  return -[CNiOSAddressBookDataMapper _containersMatchingPredicate:remote:error:]((id *)&self->super.isa, a3, 1, a4);
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(CNPolicyDescription);
  [(CNPolicyDescription *)v7 setContainerIdentifier:v6];

  id v8 = [(CNiOSAddressBookDataMapper *)self policyWithDescription:v7 error:a4];

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__16;
  id v35 = __Block_byref_object_dispose__16;
  id v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__16;
  void v29[4] = __Block_byref_object_dispose__16;
  id v30 = 0;
  uint64_t v7 = [v6 containerIdentifier];
  if (!v7)
  {
    uint64_t v7 = [(CNiOSAddressBookDataMapper *)self defaultContainerIdentifier];
    if (!v7)
    {
LABEL_9:
      id v14 = (void *)v32[5];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      id v21 = __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_3;
      uint64_t v22 = &unk_1E56B6158;
      uint64_t v23 = v29;
      id v15 = v14;
      id v16 = v20;
      id v12 = v16;
      if (a4 && !v15)
      {
        v21((uint64_t)v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_15;
    }
  }
  v37[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  id v9 = +[CNContainer predicateForContainersWithIdentifiers:v8];

  if (![v9 conformsToProtocol:&unk_1EE0947F0])
  {
LABEL_8:

    goto LABEL_9;
  }
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v11 = addressBook;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke;
  v24[3] = &unk_1E56B6180;
  uint64_t v27 = v29;
  id v12 = v9;
  id v25 = v12;
  id v26 = v6;
  char v28 = &v31;
  uint64_t v13 = [(CNiOSAddressBook *)v11 performSynchronousWorkWithInvalidatedAddressBook:v24];

  if ([v13 isSuccess])
  {

    goto LABEL_8;
  }
  id v17 = [v13 error];
  id v18 = v17;
  if (a4) {
    *a4 = v17;
  }

  id v15 = 0;
LABEL_15:

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

void __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(id *)(v4 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_2;
  v10[3] = &unk_1E56B6108;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = a2;
  CNBridgeABCFResultAndErrorFromBlock(&v13, (uint64_t)v10);
  CFArrayRef v5 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), v13);
  if ([(__CFArray *)v5 count])
  {
    CFArrayGetValueAtIndex(v5, 0);
    if ([*(id *)(a1 + 40) ignoresGuardianRestrictions]) {
      ABSourceSetShouldIgnoreCapabilitiesRestrictions();
    }
    uint64_t Policy = ABSourceGetPolicy();
    uint64_t v7 = [[CNiOSABPolicy alloc] initWithAddressBookPolicy:Policy readOnly:ABSourceIsContentReadonly()];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

uint64_t __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyContainersInAddressBook:error:", *(void *)(a1 + 40), a2);
}

id __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = +[CNErrorFactory genericiOSABError];
  }

  return v2;
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  char v28 = __Block_byref_object_copy__16;
  id v29 = __Block_byref_object_dispose__16;
  id v30 = 0;
  uint64_t v7 = +[CN contactPropertiesByKey];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8 && (int v24 = 0, [v8 abPropertyID:&v24]))
  {
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    id v10 = addressBook;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke;
    v22[3] = &unk_1E56B61A8;
    void v22[4] = &v25;
    int v23 = v24;
    id v11 = [(CNiOSAddressBook *)v10 performSynchronousWorkWithInvalidatedAddressBook:v22];
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = (void *)v26[5];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  id v19 = __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke_2;
  uint64_t v20 = &unk_1E56B5BE0;
  id v13 = v11;
  id v21 = v13;
  id v14 = v12;
  id v15 = v18;
  id v16 = v15;
  if (a4 && !v14)
  {
    v19((uint64_t)v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v25, 8);

  return v14;
}

void __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke(uint64_t a1)
{
  id v2 = (const void *)ABAddressBookCopyAllLabelsForProperty();
  if (v2) {
    id v3 = (void *)CFAutorelease(v2);
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  objc_storeStrong(v4, v3);
}

id __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) error];
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[CNErrorFactory genericiOSABError];
  }
  uint64_t v4 = v3;

  return v4;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || ([v6 conformsToProtocol:&unk_1EE091E90] & 1) != 0)
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    id v34 = __Block_byref_object_copy__16;
    id v35 = __Block_byref_object_dispose__16;
    id v36 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__16;
    void v29[4] = __Block_byref_object_dispose__16;
    id v30 = 0;
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    id v9 = addressBook;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke;
    v24[3] = &unk_1E56B61D0;
    id v25 = v7;
    id v26 = self;
    uint64_t v27 = v29;
    char v28 = &v31;
    id v10 = [(CNiOSAddressBook *)v9 performSynchronousWorkWithInvalidatedAddressBook:v24];

    if ([v10 isSuccess])
    {
      id v11 = (void *)v32[5];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      id v21 = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_4;
      uint64_t v22 = &unk_1E56B6158;
      int v23 = v29;
      id v12 = v11;
      id v13 = v20;
      id v14 = v13;
      if (!a4 || v12) {
        goto LABEL_16;
      }
      v21((uint64_t)v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = [v10 error];
      id v14 = v16;
      if (!a4)
      {
        id v12 = 0;
        goto LABEL_16;
      }
      id v15 = v16;
      id v12 = 0;
    }
    *a4 = v15;
LABEL_16:

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v31, 8);

    goto LABEL_17;
  }
  id v17 = +[CNErrorFactory errorWithCode:400];
  id v18 = v17;
  if (a4) {
    *a4 = v17;
  }

  id v12 = 0;
LABEL_17:

  return v12;
}

void __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) conformsToProtocol:&unk_1EE091E90])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v26 = *(id *)(v4 + 40);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_2;
    v23[3] = &unk_1E56B6108;
    id v24 = *(id *)(a1 + 32);
    uint64_t v25 = a2;
    CNBridgeABCFResultAndErrorFromBlock(&v26, (uint64_t)v23);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v4 + 40), v26);

LABEL_3:
    BOOL v6 = 0;
    goto LABEL_18;
  }
  if (*(void *)(a1 + 32))
  {
    BOOL v6 = 0;
    id v5 = 0;
  }
  else
  {
    uint64_t v7 = (void *)ABAddressBookCopyArrayOfAllAccounts();
    if (v7) {
      uint64_t v7 = (void *)CFAutorelease(v7);
    }
    id v5 = v7;
    uint64_t v8 = (const void *)ABAddressBookCopyLocalSource();
    if (!v8) {
      goto LABEL_3;
    }
    id v9 = v8;
    id v10 = (void *)ABRecordCopyValue(v8, *MEMORY[0x1E4F49E08]);
    BOOL v6 = (!-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](*(void *)(a1 + 40))
       || ((uint64_t v11 = *(void *)(a1 + 40)) == 0 ? (v12 = 0) : (v12 = *(void **)(v11 + 40)),
           [v12 canReadFromLocalAccount]))
      && (([v10 BOOLValue] & 1) != 0 || !objc_msgSend(v5, "count"));
    CFRelease(v9);
  }
LABEL_18:
  if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](*(void *)(a1 + 40)))
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_3;
    v22[3] = &unk_1E56B5F18;
    void v22[4] = *(void *)(a1 + 40);
    void v22[5] = a2;
    uint64_t v13 = objc_msgSend(v5, "_cn_filter:", v22);

    id v5 = (id)v13;
  }
  if (v5)
  {
    uint64_t v14 = +[CNiOSABConversions accountsFromABAccounts:]((uint64_t)CNiOSABConversions, (uint64_t)v5);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  if (v6)
  {
    id v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v17)
    {
      id v18 = +[CNAccount localAccount];
      uint64_t v19 = [v17 arrayByAddingObject:v18];
      uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
  }
}

uint64_t __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyAccountsInAddressBook:error:", *(void *)(a1 + 40), a2);
}

uint64_t __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_3(uint64_t a1)
{
  ABAddressBookGetDefaultSourceForAccount();
  uint64_t v2 = *(void *)(a1 + 32);

  return -[CNiOSAddressBookDataMapper _hasManagedAccessToReadFromAccountCorrespondingToSource:fromAddressBook:](v2);
}

id __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = +[CNErrorFactory genericiOSABError];
  }

  return v2;
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || ([v6 conformsToProtocol:&unk_1EE0951A0] & 1) != 0)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__16;
    id v34 = __Block_byref_object_dispose__16;
    id v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__16;
    v28[4] = __Block_byref_object_dispose__16;
    id v29 = 0;
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    id v9 = addressBook;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke;
    v24[3] = &unk_1E56B5D18;
    id v25 = v7;
    id v26 = v28;
    uint64_t v27 = &v30;
    id v10 = [(CNiOSAddressBook *)v9 performSynchronousWorkWithInvalidatedAddressBook:v24];

    if ([v10 isSuccess])
    {
      uint64_t v11 = (void *)v31[5];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      id v21 = __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_3;
      uint64_t v22 = &unk_1E56B6158;
      int v23 = v28;
      id v12 = v11;
      uint64_t v13 = v20;
      uint64_t v14 = v13;
      if (!a4 || v12) {
        goto LABEL_16;
      }
      v21((uint64_t)v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = [v10 error];
      uint64_t v14 = v16;
      if (!a4)
      {
        id v12 = 0;
        goto LABEL_16;
      }
      id v15 = v16;
      id v12 = 0;
    }
    *a4 = v15;
LABEL_16:

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);

    goto LABEL_17;
  }
  id v17 = +[CNErrorFactory errorWithCode:400];
  id v18 = v17;
  if (a4) {
    *a4 = v17;
  }

  id v12 = 0;
LABEL_17:

  return v12;
}

void __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke(uint64_t a1, const void *a2)
{
  if ([*(id *)(a1 + 32) conformsToProtocol:&unk_1EE0951A0])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(id *)(v4 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_2;
    v10[3] = &unk_1E56B6108;
    id v11 = *(id *)(a1 + 32);
    id v12 = a2;
    CNBridgeABCFResultAndErrorFromBlock(&v13, (uint64_t)v10);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v4 + 40), v13);

    if (!v5) {
      return;
    }
LABEL_8:
    uint64_t v7 = +[CNiOSABConversions groupsFromABGroups:]((uint64_t)CNiOSABConversions, (uint64_t)v5);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    return;
  }
  if (!*(void *)(a1 + 32))
  {
    id v6 = ABAddressBookCopyArrayOfAllGroups(a2);
    if (v6) {
      id v6 = (void *)CFAutorelease(v6);
    }
    id v5 = v6;
    if (v5) {
      goto LABEL_8;
    }
  }
}

uint64_t __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyGroupsInAddressBook:error:", *(void *)(a1 + 40), a2);
}

id __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = +[CNErrorFactory genericiOSABError];
  }

  return v2;
}

- (id)groupsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = +[CNGroup predicateForGroupsWithIdentifiers:a3];
  uint64_t v7 = [(CNiOSAddressBookDataMapper *)self groupsMatchingPredicate:v6 error:a4];

  return v7;
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = +[CNErrorFactory errorWithCode:1005];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return 0;
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    logger = self->_logger;
  }
  else {
    logger = 0;
  }
  id v12 = logger;
  id v13 = [v8 predicate];
  uint64_t v14 = [v8 unifyResults];
  id v15 = [v8 keysToFetch];
  [(CNContactsLogger *)v12 fetchContactsProgressivelyMatchingPredicate:v13 unifyResults:v14 keysToFetch:v15];

  id v16 = [v8 effectivePredicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F5A368]);
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    id v29 = __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke;
    uint64_t v30 = &unk_1E56B6248;
    id v31 = v8;
    uint64_t v32 = self;
    uint64_t v33 = v12;
    id v35 = v9;
    id v19 = v10;
    id v36 = v19;
    id v20 = v17;
    id v34 = v20;
    id v21 = [(CNiOSAddressBook *)addressBook performAsynchronousWorkWithInvalidatedAddressBook:&v27];
    char v22 = objc_msgSend(v21, "isSuccess", v27, v28, v29, v30);
    if (v19 && (v22 & 1) == 0)
    {
      int v23 = [v21 error];
      (*((void (**)(id, void *))v19 + 2))(v19, v23);
    }
    id v24 = v20;
  }
  else
  {
    id v25 = +[CNErrorFactory errorWithCode:400];
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v25);
    }

    id v24 = 0;
  }

  return v24;
}

void __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [CNiOSContactFetcher alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7) {
    uint64_t v7 = (void *)v7[3];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 40);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v7;
  id v12 = [(CNiOSContactFetcher *)v6 initWithFetchRequest:v8 addressBook:a2 environment:v11 managedConfiguration:v10];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_2;
  v19[3] = &unk_1E56B61F8;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 64);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_3;
  v15[3] = &unk_1E56B6220;
  id v16 = *(id *)(a1 + 48);
  id v13 = v5;
  id v17 = v13;
  id v18 = *(id *)(a1 + 72);
  uint64_t v14 = [(CNiOSContactFetcher *)v12 executeFetchRequestWithProgressiveResults:v19 completion:v15];
  if (v14) {
    [*(id *)(a1 + 56) addCancelable:v14];
  }
}

void __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 didFetchContacts:v7 error:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    [*(id *)(a1 + 32) didFetchContacts:0 error:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (NSString)legacyTetheredSyncComputerAnchor
{
  return (NSString *)-[CNiOSAddressBookDataMapper legacyTetheredSyncAnchorForKey:]((uint64_t)self, @"LegacyTetheredSyncComputerAnchor");
}

- (id)legacyTetheredSyncAnchorForKey:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    id v3 = *(id *)(a1 + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__CNiOSAddressBookDataMapper_legacyTetheredSyncAnchorForKey___block_invoke;
    v7[3] = &unk_1E56B6270;
    v7[4] = &v8;
    void v7[5] = a2;
    id v4 = (id)[v3 performSynchronousWorkWithInvalidatedAddressBook:v7];

    id v5 = (void *)v9[3];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setLegacyTetheredSyncComputerAnchor:(id)a3
{
}

- (void)setLegacyTetheredSyncAnchor:(uint64_t)a3 forKey:
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__CNiOSAddressBookDataMapper_setLegacyTetheredSyncAnchor_forKey___block_invoke;
    v6[3] = &__block_descriptor_48_e9_v16__0_v8l;
    v6[4] = a3;
    void v6[5] = a2;
    id v4 = a2;
    id v5 = (id)[v3 performSynchronousWorkWithInvalidatedAddressBook:v6];
  }
}

- (NSString)legacyTetheredSyncDeviceAnchor
{
  return (NSString *)-[CNiOSAddressBookDataMapper legacyTetheredSyncAnchorForKey:]((uint64_t)self, @"LegacyTetheredSyncDeviceAnchor");
}

- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3
{
}

uint64_t __61__CNiOSAddressBookDataMapper_legacyTetheredSyncAnchorForKey___block_invoke(uint64_t a1)
{
  uint64_t result = ABAddressBookCopyValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __65__CNiOSAddressBookDataMapper_setLegacyTetheredSyncAnchor_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4106D58](a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__16;
  int v23 = __Block_byref_object_dispose__16;
  id v24 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v9 = addressBook;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__CNiOSAddressBookDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke;
  v15[3] = &unk_1E56B62B8;
  id v10 = v6;
  id v16 = v10;
  id v18 = &v19;
  id v11 = v7;
  id v17 = v11;
  id v12 = [(CNiOSAddressBook *)v9 performSynchronousWorkWithInvalidatedAddressBook:v15];

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

uint64_t __74__CNiOSAddressBookDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke(uint64_t a1)
{
  uint64_t PersonMatchingUserActivityUserInfo = ABAddressBookFindPersonMatchingUserActivityUserInfo();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[CNiOSABConversions contactFromABPerson:keysToConvert:mutable:]((uint64_t)CNiOSABConversions, PersonMatchingUserActivityUserInfo, *(void **)(a1 + 40), 0);

  return MEMORY[0x1F41817F8]();
}

- (id)userActivityUserInfoForContact:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__CNiOSAddressBookDataMapper_userActivityUserInfoForContact___block_invoke;
  v11[3] = &unk_1E56B5B40;
  id v7 = v4;
  id v12 = v7;
  id v13 = &v14;
  id v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

ABRecordRef __61__CNiOSAddressBookDataMapper_userActivityUserInfoForContact___block_invoke(uint64_t a1, const void *a2)
{
  ABRecordRef result = ABAddressBookGetPersonWithRecordID(a2, [*(id *)(a1 + 32) iOSLegacyIdentifier]);
  if (result)
  {
    [*(id *)(a1 + 32) isUnified];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = ABPersonGetUserActivityUserInfo();
    return (ABRecordRef)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  return @"iOSLegacyIdentifier";
}

- (id)matchingDictionaryForContact:(id)a3
{
  id v4 = a3;
  if ([v4 hasBeenPersisted])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__16;
    id v17 = __Block_byref_object_dispose__16;
    id v18 = 0;
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    id v6 = addressBook;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CNiOSAddressBookDataMapper_matchingDictionaryForContact___block_invoke;
    v10[3] = &unk_1E56B5B40;
    id v11 = v4;
    id v12 = &v13;
    id v7 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:v10];

    id v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

ABRecordRef __59__CNiOSAddressBookDataMapper_matchingDictionaryForContact___block_invoke(uint64_t a1, const void *a2)
{
  ABRecordRef result = ABAddressBookGetPersonWithRecordID(a2, [*(id *)(a1 + 32) iOSLegacyIdentifier]);
  if (result)
  {
    [*(id *)(a1 + 32) isUnified];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = ABPersonGetMatchingDictionary();
    return (ABRecordRef)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__16;
  id v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__CNiOSAddressBookDataMapper_contactIdentifierWithMatchingDictionary___block_invoke;
  v11[3] = &unk_1E56B5B40;
  id v7 = v4;
  id v12 = v7;
  uint64_t v13 = &v14;
  id v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __70__CNiOSAddressBookDataMapper_contactIdentifierWithMatchingDictionary___block_invoke(uint64_t a1)
{
  PersonMatchingMatchingDictionary = (const void *)ABAddressBookFindPersonMatchingMatchingDictionary();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[CNiOSABConversions contactIdentifierFromABPerson:]((uint64_t)CNiOSABConversions, PersonMatchingMatchingDictionary);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v10 = +[CNErrorFactory errorWithCode:600];
    id v11 = v10;
    if (a5) {
      *a5 = v10;
    }

    char v12 = 0;
  }
  else
  {
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __97__CNiOSAddressBookDataMapper_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v18[3] = &unk_1E56B62E0;
    void v18[4] = self;
    id v19 = v9;
    id v20 = v8;
    uint64_t v14 = [(CNiOSAddressBook *)addressBook performSynchronousWorkWithInvalidatedAddressBook:v18];
    char v12 = [v14 isSuccess];
    uint64_t v15 = [v14 error];
    uint64_t v16 = v15;
    if (a5 && (v12 & 1) == 0) {
      *a5 = v15;
    }
  }
  return v12;
}

void __97__CNiOSAddressBookDataMapper_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  ABChangeHistoryRegisterClientForSource();
  if (v1)
  {
    CFRelease(v1);
  }
}

- (uint64_t)copySourceForContainerIdentifier:(uint64_t)a1 fromAddressBook:(void *)a2
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    v7[0] = v3;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v5 = (void *)ABAddressBookCopySourcesWithUUIDs();
    uint64_t v4 = [v5 firstObject];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v10 = +[CNErrorFactory errorWithCode:600];
    id v11 = v10;
    if (a5) {
      *a5 = v10;
    }

    BOOL v12 = 0;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__16;
    id v29 = __Block_byref_object_dispose__16;
    id v30 = 0;
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    uint64_t v14 = addressBook;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __99__CNiOSAddressBookDataMapper_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v19[3] = &unk_1E56B6308;
    int v23 = &v25;
    id v20 = v8;
    uint64_t v21 = self;
    id v22 = v9;
    id v24 = &v31;
    uint64_t v15 = [(CNiOSAddressBook *)v14 performSynchronousWorkWithInvalidatedAddressBook:v19];

    if ([v15 isSuccess])
    {
      BOOL v12 = *((unsigned char *)v32 + 24) != 0;
      if (a5 && !*((unsigned char *)v32 + 24))
      {
        BOOL v12 = 0;
        *a5 = (id) v26[5];
      }
    }
    else
    {
      uint64_t v16 = [v15 error];
      id v17 = v16;
      if (a5) {
        *a5 = v16;
      }

      BOOL v12 = 0;
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }

  return v12;
}

void __99__CNiOSAddressBookDataMapper_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  if (ABChangeHistoryHasClientWithIdentifier())
  {
    id v2 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](*(void *)(a1 + 40), *(void **)(a1 + 48));
    ABChangeHistoryUnregisterClientForSource();
    if (v2) {
      CFRelease(v2);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = +[CNErrorFactory errorWithCode:601];
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v5;
  }
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 shouldEnforceClientIdentifer]
    || (uint64_t v7 = *MEMORY[0x1E4F5A298],
        [v6 clientIdentifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
        v8,
        !v7))
  {
    if ([v6 shouldUnifyResults] && objc_msgSend(v6, "includeLinkingChanges"))
    {
      uint64_t v9 = 605;
      goto LABEL_7;
    }
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke;
    int v23 = &unk_1E56B6358;
    id v24 = v6;
    uint64_t v25 = self;
    uint64_t v14 = [(CNiOSAddressBook *)addressBook resultWithInvalidatedAddressBook:&v20];
    if (objc_msgSend(v14, "isSuccess", v20, v21, v22, v23))
    {
      id v15 = [v14 value];
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A1C0] + 16))())
      {
        BOOL v12 = [v15 left];
LABEL_21:

        goto LABEL_22;
      }
      id v17 = [v15 right];
      id v18 = v17;
      if (a4) {
        *a4 = v17;
      }
    }
    else
    {
      uint64_t v16 = [v14 error];
      id v15 = v16;
      if (a4)
      {
        id v15 = v16;
        BOOL v12 = 0;
        *a4 = v15;
        goto LABEL_21;
      }
    }
    BOOL v12 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = 600;
LABEL_7:
  id v10 = +[CNErrorFactory errorWithCode:v9];
  id v11 = v10;
  if (a4) {
    *a4 = v10;
  }

  BOOL v12 = 0;
LABEL_22:

  return v12;
}

id __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) shouldEnforceClientIdentifer];
  if (!v4
    || ([*(id *)(a1 + 32) clientIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char HasClientWithIdentifier = ABChangeHistoryHasClientWithIdentifier(),
        v5,
        (HasClientWithIdentifier & 1) != 0))
  {
    uint64_t v7 = objc_alloc_init(CNChangeHistoryResult);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 32) containerIdentifier];
    id v10 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](v8, v9);

    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke_2;
    uint64_t v27 = &unk_1E56B6330;
    id v28 = *(id *)(a1 + 32);
    uint64_t v30 = a2;
    uint64_t v31 = v10;
    id v11 = v7;
    id v29 = v11;
    BOOL v12 = (void (**)(void *, void))_Block_copy(&v24);
    if (v4
      && (objc_msgSend(*(id *)(a1 + 32), "clientIdentifier", v24, v25, v26, v27, v28),
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          int LatestConsumedSequenceNumberForClient = ABChangeHistoryGetLatestConsumedSequenceNumberForClient(),
          v13,
          LatestConsumedSequenceNumberForClient == -1))
    {
      id v22 = [[CNChangeHistoryAnchor alloc] initWithSequenceNumber:(int)ABAddressBookGetSequenceNumber()];
      [(CNChangeHistoryResult *)v11 setLatestChangeAnchor:v22];

      [(CNChangeHistoryResult *)v11 setChangesTruncated:1];
    }
    else
    {
      id v15 = v12[2](v12, 0);
      [(CNChangeHistoryResult *)v11 setContactChanges:v15];

      if ([*(id *)(a1 + 32) includeGroupChanges])
      {
        uint64_t v16 = v12[2](v12, 1);
        [(CNChangeHistoryResult *)v11 setGroupChanges:v16];
      }
      if (objc_msgSend(*(id *)(a1 + 32), "includeLabeledValueChanges", v24, v25, v26, v27))
      {
        id v17 = v12[2](v12, 2);
        [(CNChangeHistoryResult *)v11 setLabeledValueChanges:v17];
      }
      if ([(CNChangeHistoryResult *)v11 changesTruncated]
        && [*(id *)(a1 + 32) resultType] == 1)
      {
        id v18 = +[CNErrorFactory errorWithCode:603];
        if (!v10) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    id v18 = 0;
    if (!v10)
    {
LABEL_17:
      if (v18) {
        [MEMORY[0x1E4F5A3B8] eitherWithRight:v18];
      }
      else {
      uint64_t v21 = [MEMORY[0x1E4F5A3B8] eitherWithLeft:v11];
      }

      goto LABEL_21;
    }
LABEL_16:
    CFRelease(v10);
    goto LABEL_17;
  }
  id v19 = (void *)MEMORY[0x1E4F5A3B8];
  uint64_t v20 = +[CNErrorFactory errorWithCode:601];
  uint64_t v21 = [v19 eitherWithRight:v20];

LABEL_21:

  return v21;
}

id __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke_2(uint64_t a1, int a2)
{
  v71[12] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F49928];
  uint64_t v5 = *MEMORY[0x1E4F49948];
  v71[0] = *MEMORY[0x1E4F49928];
  v71[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F49970];
  uint64_t v7 = (void *)*MEMORY[0x1E4F49930];
  v71[2] = *MEMORY[0x1E4F49970];
  v71[3] = v7;
  key = v7;
  uint64_t v8 = (void *)*MEMORY[0x1E4F49920];
  CFArrayRef theArray = (CFArrayRef)*MEMORY[0x1E4F49978];
  v71[4] = *MEMORY[0x1E4F49978];
  v71[5] = v8;
  uint64_t v53 = v8;
  uint64_t v9 = (void *)*MEMORY[0x1E4F49940];
  uint64_t v55 = *MEMORY[0x1E4F49938];
  v71[6] = *MEMORY[0x1E4F49938];
  v71[7] = v9;
  uint64_t v64 = v9;
  uint64_t v10 = *MEMORY[0x1E4F49958];
  uint64_t v68 = (void *)*MEMORY[0x1E4F49968];
  v71[8] = *MEMORY[0x1E4F49968];
  v71[9] = v10;
  uint64_t v57 = v10;
  uint64_t v11 = *MEMORY[0x1E4F49960];
  id v66 = (id)*MEMORY[0x1E4F49950];
  v71[10] = *MEMORY[0x1E4F49950];
  v71[11] = v11;
  uint64_t v69 = v11;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:12];
  int v63 = a2;
  if (!a2)
  {
    [*(id *)(a1 + 32) shouldUnifyResults];
    [*(id *)(a1 + 32) includeLinkingChanges];
    [*(id *)(a1 + 32) includeMeCardChanges];
  }
  BOOL v12 = [*(id *)(a1 + 32) startingAnchor];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) startingAnchor];
    [v13 sequenceNumber];
  }
  if ([*(id *)(a1 + 32) shouldEnforceClientIdentifer])
  {
    [*(id *)(a1 + 32) clientIdentifier];
  }
  uint64_t v14 = [*(id *)(a1 + 32) excludedTransactionAuthors];

  if (v14)
  {
    [*(id *)(a1 + 32) excludedTransactionAuthors];
  }
  uint64_t v45 = *(void *)(a1 + 56);
  id v15 = ABChangeHistoryGetChanges();
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A270] + 16))(*MEMORY[0x1E4F5A270])) {
    goto LABEL_13;
  }
  if (!v63) {
    objc_msgSend(*(id *)(a1 + 40), "setUnifyResults:", objc_msgSend(*(id *)(a1 + 32), "shouldUnifyResults", v45));
  }
  uint64_t v16 = *(void **)(a1 + 40);
  id v17 = objc_msgSend(v15, "objectForKeyedSubscript:", v4, v45);
  objc_msgSend(v16, "setChangesTruncated:", objc_msgSend(v17, "BOOLValue") | objc_msgSend(v16, "changesTruncated"));

  if ([*(id *)(a1 + 40) changesTruncated])
  {
LABEL_13:
    id v67 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_47;
  }
  id v18 = [v15 objectForKeyedSubscript:v5];
  uint64_t v19 = (int)[v18 intValue];

  uint64_t v20 = [*(id *)(a1 + 40) latestChangeAnchor];
  if (!v20
    || (uint64_t v21 = (void *)v20,
        [*(id *)(a1 + 40) latestChangeAnchor],
        id v22 = objc_claimAutoreleasedReturnValue(),
        uint64_t v23 = [v22 sequenceNumber],
        v22,
        v21,
        v23 < v19))
  {
    uint64_t v24 = [[CNChangeHistoryAnchor alloc] initWithSequenceNumber:v19];
    [*(id *)(a1 + 40) setLatestChangeAnchor:v24];
  }
  uint64_t v25 = [v15 objectForKeyedSubscript:v6];
  if ([*(id *)(a1 + 32) resultType] != 1)
  {
    CFArrayRef keya = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, key);
    CFArrayRef theArraya = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, theArray);
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, v53);
    BOOL v54 = [v15 objectForKeyedSubscript:v55];
    CFArrayRef v47 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, v64);
    long long v51 = [v15 objectForKeyedSubscript:v57];
    CFArrayRef v48 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, v68);
    id v50 = [v15 objectForKeyedSubscript:v66];
    char v49 = [v15 objectForKeyedSubscript:v69];
    uint64_t v26 = [v25 count];
    if (!v26)
    {
      id v67 = (id)MEMORY[0x1E4F1CBF0];
LABEL_45:

      goto LABEL_46;
    }
    uint64_t v27 = v26;
    id v46 = v15;
    id v67 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v26];
    CFIndex v28 = 0;
    uint64_t v29 = *MEMORY[0x1E4F5A2B0];
    int v30 = v63;
    long long v56 = v25;
    uint64_t v58 = v27;
    while (1)
    {
      uint64_t v31 = [v25 objectAtIndexedSubscript:v28];
      id v70 = (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v31);

      ValueAtIndex = (void *)CFArrayGetValueAtIndex(keya, v28);
      uint64_t v32 = [[CNChangeHistoryAnchor alloc] initWithSequenceNumber:CFArrayGetValueAtIndex(theArraya, v28)];
      if ([*(id *)(a1 + 32) includeChangeIDs])
      {
        uint64_t v33 = objc_msgSend(NSNumber, "numberWithInt:", CFArrayGetValueAtIndex(Value, v28));
      }
      else
      {
        uint64_t v33 = 0;
      }
      if ([*(id *)(a1 + 32) includeExternalIDs])
      {
        char v34 = [v54 objectAtIndexedSubscript:v28];
        id v35 = (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v34);

        if (!v30) {
          goto LABEL_30;
        }
      }
      else
      {
        id v35 = 0;
        if (!v30)
        {
LABEL_30:
          if ([*(id *)(a1 + 32) includeImagesChanged])
          {
            objc_msgSend(NSNumber, "numberWithBool:", CFArrayGetValueAtIndex(v47, v28) != 0);
            id v36 = (CNChangeHistoryGroupChange *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v36 = 0;
          }
          if ([*(id *)(a1 + 32) includeLinkingChanges])
          {
            long long v39 = [v50 objectAtIndexedSubscript:v28];
            char v40 = (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v39);
          }
          else
          {
            char v40 = 0;
          }
          if ([*(id *)(a1 + 32) includeLinkingChanges])
          {
            ABPropertyID v41 = [v49 objectAtIndexedSubscript:v28];
            long long v42 = (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v41);
          }
          else
          {
            long long v42 = 0;
          }
          long long v43 = [[CNChangeHistoryContactChange alloc] initWithIdentifier:v70 changeType:ValueAtIndex changeAnchor:v32 changeID:v33 externalID:v35 imagesChanged:v36 linkToPersonUUID:v40 personLinkUUID:v42];
          [v67 addObject:v43];

          int v30 = v63;
          uint64_t v25 = v56;
          goto LABEL_41;
        }
      }
      if (v30 == 2) {
        break;
      }
      if (v30 == 1)
      {
        id v36 = [[CNChangeHistoryGroupChange alloc] initWithIdentifier:v70 changeType:ValueAtIndex changeAnchor:v32 changeID:v33 externalID:v35];
        [v67 addObject:v36];
LABEL_41:

        uint64_t v27 = v58;
      }

      if (v27 == ++v28)
      {
        id v15 = v46;
        goto LABEL_45;
      }
    }
    id v36 = [v51 objectAtIndexedSubscript:v28];
    long long v37 = +[CNContact contactPropertyKeyFromABPropertyID:CFArrayGetValueAtIndex(v48, v28)];
    long long v38 = [[CNChangeHistoryLabeledValueChange alloc] initWithContactIdentifier:v70 propertyKey:v37 labeledValueIdentifier:v36 changeType:2];
    [v67 addObject:v38];

    uint64_t v25 = v56;
    goto LABEL_41;
  }
  objc_msgSend(*(id *)(a1 + 40), "setChangesCount:", objc_msgSend(*(id *)(a1 + 40), "changesCount") + objc_msgSend(v25, "count"));
  id v67 = (id)MEMORY[0x1E4F1CBF0];
LABEL_46:

LABEL_47:

  return v67;
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  uint64_t v8 = [v6 clientIdentifier];
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if (v7)
  {
    uint64_t v9 = 600;
LABEL_3:
    uint64_t v10 = +[CNErrorFactory errorWithCode:v9];
    uint64_t v11 = v10;
    if (a4) {
      *a4 = v10;
    }

    BOOL v12 = 0;
    goto LABEL_19;
  }
  uint64_t v13 = [v6 toChangeAnchor];
  if (v13
    || ([v6 contactChangeIDs],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v13 count]))
  {
  }
  else
  {
    uint64_t v20 = [v6 groupChangeIDs];
    uint64_t v21 = [v20 count];

    if (!v21)
    {
      uint64_t v9 = 1002;
      goto LABEL_3;
    }
  }
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__16;
  char v34 = __Block_byref_object_dispose__16;
  id v35 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v15 = addressBook;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __69__CNiOSAddressBookDataMapper_executeChangeHistoryClearRequest_error___block_invoke;
  uint64_t v25 = &unk_1E56B61D0;
  id v26 = v6;
  uint64_t v27 = self;
  CFIndex v28 = &v30;
  uint64_t v29 = &v36;
  uint64_t v16 = [(CNiOSAddressBook *)v15 performSynchronousWorkWithInvalidatedAddressBook:&v22];

  if (objc_msgSend(v16, "isSuccess", v22, v23, v24, v25))
  {
    BOOL v12 = *((unsigned char *)v37 + 24) != 0;
    if (a4 && !*((unsigned char *)v37 + 24))
    {
      BOOL v12 = 0;
      *a4 = (id) v31[5];
    }
  }
  else
  {
    id v17 = [v16 error];
    id v18 = v17;
    if (a4) {
      *a4 = v17;
    }

    BOOL v12 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
LABEL_19:

  return v12;
}

void __69__CNiOSAddressBookDataMapper_executeChangeHistoryClearRequest_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clientIdentifier];

  if (ABChangeHistoryHasClientWithIdentifier())
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 32) containerIdentifier];
    uint64_t v4 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](v2, v3);

    uint64_t v5 = [*(id *)(a1 + 32) toChangeAnchor];

    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      uint64_t v7 = [v6 toChangeAnchor];
      [v7 sequenceNumber];
      ABChangeHistoryClearChangesUpToSequenceNumberForClient();
    }
    else
    {
      uint64_t v10 = [v6 contactChangeIDs];

      if (v10)
      {
        uint64_t v11 = *(__CFArray **)(a1 + 40);
        BOOL v12 = [*(id *)(a1 + 32) contactChangeIDs];
        uint64_t v13 = -[CNiOSAddressBookDataMapper copyChangeTableRowIDsFromChangeIDs:](v11, v12);

        ABChangeHistoryClearEntityChangeTableRowIDsForClient();
        CFRelease(v13);
      }
      uint64_t v14 = [*(id *)(a1 + 32) groupChangeIDs];

      if (v14)
      {
        id v15 = *(__CFArray **)(a1 + 40);
        uint64_t v16 = [*(id *)(a1 + 32) groupChangeIDs];
        id v17 = -[CNiOSAddressBookDataMapper copyChangeTableRowIDsFromChangeIDs:](v15, v16);

        ABChangeHistoryClearEntityChangeTableRowIDsForClient();
        CFRelease(v17);
      }
    }
    if (v4) {
      CFRelease(v4);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v18 = +[CNErrorFactory errorWithCode:601];
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v18;
  }
}

- (__CFArray)copyChangeTableRowIDsFromChangeIDs:(__CFArray *)Mutable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          CFArrayAppendValue(Mutable, (const void *)(int)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "intValue", (void)v10));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return Mutable;
}

+ (id)_copyEligiblePrimarySourceForAccountWithIdentifier:(uint64_t)a3 addressBook:(void *)a4 error:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  self;
  v22[0] = v5;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  CFArrayRef v6 = (const __CFArray *)ABAddressBookCopyAccountsWithUUIDs();
  if (!v6) {
    goto LABEL_14;
  }
  CFArrayRef v7 = v6;
  if (CFArrayGetCount(v6) < 1)
  {
    CFRelease(v7);
LABEL_14:
    id v17 = +[CNErrorFactory errorWithCode:200];
    long long v13 = 0;
    goto LABEL_19;
  }
  CFArrayGetValueAtIndex(v7, 0);
  uint64_t DefaultSourceForAccount = ABAddressBookGetDefaultSourceForAccount();
  if (!DefaultSourceForAccount
    || ((uint64_t v9 = (const void *)DefaultSourceForAccount,
         int IntValue = ABRecordGetIntValue(),
         int v11 = ABRecordGetIntValue() & 0x1000000,
         IntValue == 1)
      ? (BOOL v12 = v11 == 0)
      : (BOOL v12 = 0),
        !v12 || (long long v13 = (void *)CFRetain(v9)) == 0))
  {
    uint64_t v14 = (void *)ABAddressBookCopyArrayOfAllSourcesInAccount();
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = (const void *)objc_msgSend(v14, "_cn_firstObjectPassingTest:", &__block_literal_global_161);
      if (v16) {
        long long v13 = (void *)CFRetain(v16);
      }
      else {
        long long v13 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      long long v13 = 0;
    }
  }
  CFRelease(v7);
  id v17 = 0;
LABEL_19:
  id v18 = v13;
  uint64_t v19 = v18;
  if (a4 && !v18) {
    *a4 = v17;
  }
  id v20 = v19;

  return v20;
}

+ (const)_copyLocalSourceIfEnabledInAddressBook:
{
  self;
  v0 = (const void *)ABAddressBookCopyLocalSource();
  if (v0)
  {
    int IntValue = ABRecordGetIntValue();
    int v2 = ABRecordGetIntValue() & 0x1000000;
    if (IntValue != 1 || v2 != 0)
    {
      CFRelease(v0);
      return 0;
    }
  }
  return v0;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    CFArrayRef v7 = +[CNErrorFactory errorWithCode:200];
    uint64_t v8 = v7;
    if (a4) {
      *a4 = v7;
    }

    BOOL v9 = 0;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__16;
    uint64_t v24 = __Block_byref_object_dispose__16;
    id v25 = 0;
    if (self) {
      addressBoouint64_t k = self->_addressBook;
    }
    else {
      addressBoouint64_t k = 0;
    }
    int v11 = addressBook;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __64__CNiOSAddressBookDataMapper_setDefaultAccountIdentifier_error___block_invoke;
    v16[3] = &unk_1E56B5D18;
    id v17 = v6;
    id v18 = &v20;
    uint64_t v19 = &v26;
    BOOL v12 = [(CNiOSAddressBook *)v11 performSynchronousWorkWithInvalidatedAddressBook:v16];

    if ([v12 isSuccess])
    {
      BOOL v9 = *((unsigned char *)v27 + 24) != 0;
      if (a4 && !*((unsigned char *)v27 + 24))
      {
        BOOL v9 = 0;
        *a4 = (id) v21[5];
      }
    }
    else
    {
      long long v13 = [v12 error];
      uint64_t v14 = v13;
      if (a4) {
        *a4 = v13;
      }

      BOOL v9 = 0;
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v9;
}

void __64__CNiOSAddressBookDataMapper_setDefaultAccountIdentifier_error___block_invoke(void *a1, uint64_t a2)
{
  id v4 = (void *)a1[4];
  id v5 = +[CNAccount localAccount];
  id v6 = [v5 identifier];
  LODWORD(v4) = [v4 isEqualToString:v6];

  if (v4)
  {
    CFArrayRef v7 = +[CNiOSAddressBookDataMapper _copyLocalSourceIfEnabledInAddressBook:]();
    if (v7)
    {
LABEL_3:
      ABAddressBookSetDefaultSource();
      CFRelease(v7);
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      return;
    }
  }
  else
  {
    uint64_t v8 = (void *)a1[4];
    uint64_t v9 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v9 + 40);
    CFArrayRef v7 = +[CNiOSAddressBookDataMapper _copyEligiblePrimarySourceForAccountWithIdentifier:addressBook:error:]((uint64_t)CNiOSAddressBookDataMapper, v8, a2, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    if (v7) {
      goto LABEL_3;
    }
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v10 = +[CNErrorFactory errorWithCode:1002];
    uint64_t v11 = *(void *)(a1[5] + 8);
    BOOL v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  return 1;
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v3 = addressBook;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CNiOSAddressBookDataMapper_hasMultipleGroupsOrAccounts__block_invoke;
  v6[3] = &unk_1E56B5B18;
  v6[4] = &v7;
  id v4 = [(CNiOSAddressBook *)v3 performSynchronousWorkWithInvalidatedAddressBook:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

CFIndex __57__CNiOSAddressBookDataMapper_hasMultipleGroupsOrAccounts__block_invoke(uint64_t a1, ABAddressBookRef addressBook)
{
  CFIndex result = ABAddressBookGetGroupCount(addressBook);
  if (result > 0 || (CFIndex result = ABAddressBookGetSourceCountIncludingDisabled(), result >= 2)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)hasGroups
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v3 = addressBook;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CNiOSAddressBookDataMapper_hasGroups__block_invoke;
  v6[3] = &unk_1E56B5B18;
  v6[4] = &v7;
  id v4 = [(CNiOSAddressBook *)v3 performSynchronousWorkWithInvalidatedAddressBook:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

CFIndex __39__CNiOSAddressBookDataMapper_hasGroups__block_invoke(uint64_t a1, ABAddressBookRef addressBook)
{
  CFIndex result = ABAddressBookGetGroupCount(addressBook);
  if (result >= 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__16;
  uint64_t v24 = __Block_byref_object_dispose__16;
  id v25 = (id)MEMORY[0x1E4F1CBF0];
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __76__CNiOSAddressBookDataMapper_fetchLimitedAccessContactIdentifiersForBundle___block_invoke;
  id v17 = &unk_1E56B60E0;
  uint64_t v19 = &v20;
  id v7 = v4;
  id v18 = v7;
  uint64_t v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:&v14];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "value", v14, v15, v16, v17);
    if ([v9 isEqual:MEMORY[0x1E4F1CC38]])
    {
      uint64_t v10 = v21[5];

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  uint64_t v11 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CNiOSAddressBookDataMapper fetchLimitedAccessContactIdentifiersForBundle:]();
  }

LABEL_11:
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __76__CNiOSAddressBookDataMapper_fetchLimitedAccessContactIdentifiersForBundle___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = ABLimitedAccessContactIdentifiersForBundle();

  return MEMORY[0x1F41817F8]();
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v9 = addressBook;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __74__CNiOSAddressBookDataMapper_addLimitedAccessForBundle_contactIdentifier___block_invoke;
  v16[3] = &unk_1E56B63A0;
  uint64_t v19 = &v20;
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  id v12 = [(CNiOSAddressBook *)v9 performSynchronousWorkWithInvalidatedAddressBook:v16];

  if (v12)
  {
    long long v13 = [v12 value];
    if ([v13 isEqual:MEMORY[0x1E4F1CC38]])
    {
      BOOL v14 = *((unsigned char *)v21 + 24) == 0;

      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  uint64_t v15 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    char v29 = v12;
    _os_log_error_impl(&dword_1909E3000, v15, OS_LOG_TYPE_ERROR, "addLimitedAccessForBundle: %@, id: %@, failed: %@", buf, 0x20u);
  }

LABEL_11:
  _Block_object_dispose(&v20, 8);
}

uint64_t __74__CNiOSAddressBookDataMapper_addLimitedAccessForBundle_contactIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = ABAddLimitedAccessForBundle();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v9 = addressBook;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __75__CNiOSAddressBookDataMapper_addLimitedAccessForBundle_contactIdentifiers___block_invoke;
  v16[3] = &unk_1E56B63A0;
  uint64_t v19 = &v20;
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  id v12 = [(CNiOSAddressBook *)v9 performSynchronousWorkWithInvalidatedAddressBook:v16];

  if (v12)
  {
    long long v13 = [v12 value];
    if ([v13 isEqual:MEMORY[0x1E4F1CC38]])
    {
      BOOL v14 = *((unsigned char *)v21 + 24) == 0;

      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  uint64_t v15 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    char v29 = v12;
    _os_log_error_impl(&dword_1909E3000, v15, OS_LOG_TYPE_ERROR, "addLimitedAccessForBundle: %@, ids: %@, failed: %@", buf, 0x20u);
  }

LABEL_11:
  _Block_object_dispose(&v20, 8);
}

uint64_t __75__CNiOSAddressBookDataMapper_addLimitedAccessForBundle_contactIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t result = ABAddLimitedAccessIdentifiersForBundle();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __84__CNiOSAddressBookDataMapper_removeContactIdentifiersFromLimitedAcessForAllBundles___block_invoke(uint64_t a1)
{
  uint64_t result = ABRemoveContactIdentifiersFromLimitedAccessForAllBundles();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v9 = addressBook;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __77__CNiOSAddressBookDataMapper_removeLimitedAccessForBundle_contactIdentifier___block_invoke;
  v16[3] = &unk_1E56B63A0;
  uint64_t v19 = &v20;
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  id v12 = [(CNiOSAddressBook *)v9 performSynchronousWorkWithInvalidatedAddressBook:v16];

  if (v12)
  {
    long long v13 = [v12 value];
    if ([v13 isEqual:MEMORY[0x1E4F1CC38]])
    {
      BOOL v14 = *((unsigned char *)v21 + 24) == 0;

      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  uint64_t v15 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    char v29 = v12;
    _os_log_error_impl(&dword_1909E3000, v15, OS_LOG_TYPE_ERROR, "removeLimitedAccessForBundle: %@, id: %@, failed: %@", buf, 0x20u);
  }

LABEL_11:
  _Block_object_dispose(&v20, 8);
}

uint64_t __77__CNiOSAddressBookDataMapper_removeLimitedAccessForBundle_contactIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = ABRemoveLimitedAccessForBundle();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v9 = addressBook;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __78__CNiOSAddressBookDataMapper_removeLimitedAccessForBundle_contactIdentifiers___block_invoke;
  v16[3] = &unk_1E56B63A0;
  uint64_t v19 = &v20;
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  id v12 = [(CNiOSAddressBook *)v9 performSynchronousWorkWithInvalidatedAddressBook:v16];

  if (v12)
  {
    long long v13 = [v12 value];
    if ([v13 isEqual:MEMORY[0x1E4F1CC38]])
    {
      BOOL v14 = *((unsigned char *)v21 + 24) == 0;

      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  uint64_t v15 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    char v29 = v12;
    _os_log_error_impl(&dword_1909E3000, v15, OS_LOG_TYPE_ERROR, "removeLimitedAccessForBundle: %@, ids: %@, failed: %@", buf, 0x20u);
  }

LABEL_11:
  _Block_object_dispose(&v20, 8);
}

uint64_t __78__CNiOSAddressBookDataMapper_removeLimitedAccessForBundle_contactIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t result = ABRemoveLimitedAccessIdentifiersForBundle();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__16;
  id v25 = __Block_byref_object_dispose__16;
  id v26 = (id)MEMORY[0x1E4F1CC08];
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __83__CNiOSAddressBookDataMapper_populateSyncTableForLimitedAccessAboveSequenceNumber___block_invoke;
  id v18 = &unk_1E56B60E0;
  uint64_t v20 = &v21;
  id v7 = v4;
  id v19 = v7;
  uint64_t v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:&v15];

  if (!v8
    || ((objc_msgSend(v8, "value", v15, v16, v17, v18),
         uint64_t v9 = objc_claimAutoreleasedReturnValue(),
         char v10 = [v9 isEqual:MEMORY[0x1E4F1CC38]],
         v7)
      ? (char v11 = v10)
      : (char v11 = 0),
        v9,
        (v11 & 1) == 0))
  {
    objc_opt_class();
    id v12 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNiOSAddressBookDataMapper populateSyncTableForLimitedAccessAboveSequenceNumber:]();
    }
  }
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v13;
}

uint64_t __83__CNiOSAddressBookDataMapper_populateSyncTableForLimitedAccessAboveSequenceNumber___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = ABPopulateSyncTableForLimitedAccessAboveSequenceNumber();

  return MEMORY[0x1F41817F8]();
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __65__CNiOSAddressBookDataMapper_purgeLimitedAccessRecordsForBundle___block_invoke;
  uint64_t v15 = &unk_1E56B60E0;
  id v17 = &v18;
  id v7 = v4;
  id v16 = v7;
  uint64_t v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:&v12];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "value", v12, v13, v14, v15);
    if ([v9 isEqual:MEMORY[0x1E4F1CC38]])
    {
      int v10 = *((unsigned __int8 *)v19 + 24);

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  char v11 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CNiOSAddressBookDataMapper purgeLimitedAccessRecordsForBundle:]();
  }

LABEL_11:
  _Block_object_dispose(&v18, 8);
}

uint64_t __65__CNiOSAddressBookDataMapper_purgeLimitedAccessRecordsForBundle___block_invoke(uint64_t a1)
{
  uint64_t result = ABPurgeLimitedAccessRecordsForBundle();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updateLimitedAccessTable:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __55__CNiOSAddressBookDataMapper_updateLimitedAccessTable___block_invoke;
  uint64_t v15 = &unk_1E56B60E0;
  id v17 = &v18;
  id v7 = v4;
  id v16 = v7;
  uint64_t v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:&v12];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "value", v12, v13, v14, v15);
    if ([v9 isEqual:MEMORY[0x1E4F1CC38]])
    {
      int v10 = *((unsigned __int8 *)v19 + 24);

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  char v11 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CNiOSAddressBookDataMapper updateLimitedAccessTable:]();
  }

LABEL_11:
  _Block_object_dispose(&v18, 8);
}

uint64_t __55__CNiOSAddressBookDataMapper_updateLimitedAccessTable___block_invoke(uint64_t a1)
{
  uint64_t result = ABLimitedAccessUpdateTable();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__16;
  uint64_t v24 = __Block_byref_object_dispose__16;
  id v25 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __69__CNiOSAddressBookDataMapper_getLimitedAccessContactsCountForBundle___block_invoke;
  id v17 = &unk_1E56B60E0;
  id v19 = &v20;
  id v7 = v4;
  id v18 = v7;
  uint64_t v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:&v14];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "value", v14, v15, v16, v17);
    if ([v9 isEqual:MEMORY[0x1E4F1CC38]])
    {
      uint64_t v10 = v21[5];

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  char v11 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CNiOSAddressBookDataMapper getLimitedAccessContactsCountForBundle:]();
  }

LABEL_11:
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v12;
}

uint64_t __69__CNiOSAddressBookDataMapper_getLimitedAccessContactsCountForBundle___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = ABLimitedAccessContactsCountForBundle();

  return MEMORY[0x1F41817F8]();
}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__16;
  id v19 = __Block_byref_object_dispose__16;
  id v20 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v5 = addressBook;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__CNiOSAddressBookDataMapper_getLimitedAccessLastSyncSequenceNumber___block_invoke;
  void v14[3] = &unk_1E56B5B18;
  v14[4] = &v15;
  id v6 = [(CNiOSAddressBook *)v5 performSynchronousWorkWithInvalidatedAddressBook:v14];

  if (v6
    && ([v6 value],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:MEMORY[0x1E4F1CC38]],
        v7,
        (v8 & 1) != 0))
  {
    uint64_t v9 = 0;
  }
  else
  {
    objc_opt_class();
    uint64_t v10 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNiOSAddressBookDataMapper getLimitedAccessLastSyncSequenceNumber:]();
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNErrorDomain" code:1 userInfo:0];
  }
  id v11 = (id)v16[5];
  id v12 = v11;
  if (a3 && !v11) {
    *a3 = v9;
  }

  _Block_object_dispose(&v15, 8);

  return v12;
}

uint64_t __69__CNiOSAddressBookDataMapper_getLimitedAccessLastSyncSequenceNumber___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = ABGetLimitedAccessLastSyncSequenceNumber();

  return MEMORY[0x1F41817F8]();
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__16;
  uint64_t v24 = __Block_byref_object_dispose__16;
  id v25 = objc_alloc_init(CNLimitedAccessSyncData);
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  id v6 = addressBook;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __84__CNiOSAddressBookDataMapper_getWatchLimitedAccessSyncDataStartingAtSequenceNumber___block_invoke;
  uint64_t v17 = &unk_1E56B5B40;
  id v7 = v4;
  id v18 = v7;
  id v19 = &v20;
  char v8 = [(CNiOSAddressBook *)v6 performSynchronousWorkWithInvalidatedAddressBook:&v14];

  if (!v8
    || (objc_msgSend(v8, "value", v14, v15, v16, v17),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqual:MEMORY[0x1E4F1CC38]],
        v9,
        (v10 & 1) == 0))
  {
    objc_opt_class();
    id v11 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CNiOSAddressBookDataMapper getWatchLimitedAccessSyncDataStartingAtSequenceNumber:]((uint64_t)v8, buf, [v7 integerValue], v11);
    }
  }
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v12;
}

void __84__CNiOSAddressBookDataMapper_getWatchLimitedAccessSyncDataStartingAtSequenceNumber___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) integerValue];
  int v2 = ABGetWatchLimitedAccessSyncDataStartingAtSequenceNumber();
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setFullSyncRequired:", objc_msgSend(v2, "fullSyncRequired"));
  uint64_t v13 = a1;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setCurrentSequenceNumber:", objc_msgSend(v2, "currentSequenceNumber"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v2 syncEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        char v10 = objc_alloc_init(CNLimitedAccessSyncEvent);
        id v11 = [v9 bundleID];
        [(CNLimitedAccessSyncEvent *)v10 setBundleID:v11];

        id v12 = [v9 contactID];
        [(CNLimitedAccessSyncEvent *)v10 setContactID:v12];

        -[CNLimitedAccessSyncEvent setSequenceNumber:](v10, "setSequenceNumber:", [v9 sequenceNumber]);
        -[CNLimitedAccessSyncEvent setIsActive:](v10, "setIsActive:", [v9 isActive]);
        [v3 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(*(void *)(v13 + 40) + 8) + 40) setSyncEventsArray:v3];
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        id v11 = objc_alloc_init(MEMORY[0x1E4F49898]);
        id v12 = [v10 bundleID];
        [v11 setBundleID:v12];

        uint64_t v13 = [v10 contactID];
        [v11 setContactID:v13];

        objc_msgSend(v11, "setSequenceNumber:", objc_msgSend(v10, "sequenceNumber"));
        objc_msgSend(v11, "setIsActive:", objc_msgSend(v10, "isActive"));
        [v5 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v7);
  }

  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  long long v15 = addressBook;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __59__CNiOSAddressBookDataMapper_applyLimitedAccessSyncEvents___block_invoke;
  uint64_t v24 = &unk_1E56B60E0;
  id v26 = &v31;
  id v16 = v5;
  id v25 = v16;
  long long v17 = [(CNiOSAddressBook *)v15 performSynchronousWorkWithInvalidatedAddressBook:&v21];

  if (v17)
  {
    id v18 = objc_msgSend(v17, "value", v21, v22, v23, v24);
    if ([v18 isEqual:MEMORY[0x1E4F1CC38]])
    {
      BOOL v19 = *((unsigned char *)v32 + 24) == 0;

      if (!v19) {
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  uint64_t v20 = +[CNiOSAddressBookDataMapper os_log]();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CNiOSAddressBookDataMapper applyLimitedAccessSyncEvents:]();
  }

LABEL_18:
  _Block_object_dispose(&v31, 8);
}

uint64_t __59__CNiOSAddressBookDataMapper_applyLimitedAccessSyncEvents___block_invoke(uint64_t a1)
{
  uint64_t result = ABApplyLimitedAccessSyncEvents();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dropAllLimitedAccessRows
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "dropAllLimitedAccessRows failed: %@", v2, v3, v4, v5, v6);
}

uint64_t __54__CNiOSAddressBookDataMapper_dropAllLimitedAccessRows__block_invoke(uint64_t a1)
{
  uint64_t result = ABDropAllLimitedAccessRows();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "dropAllLimitedAccessRowsAndSyncNotify failed: %@", v2, v3, v4, v5, v6);
}

uint64_t __67__CNiOSAddressBookDataMapper_dropAllLimitedAccessRowsAndSyncNotify__block_invoke(uint64_t a1)
{
  uint64_t result = ABDropAllLimitedAccessRows();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  id v4 = a3;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CNiOSAddressBookDataMapper_setLimitedAccessTableCurrentSequenceNumber___block_invoke;
  v12[3] = &unk_1E56B63C8;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = addressBook;
  uint64_t v8 = [(CNiOSAddressBook *)v7 performSynchronousWorkWithInvalidatedAddressBook:v12];

  if (!v8
    || ([v8 value],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqual:MEMORY[0x1E4F1CC38]],
        v9,
        (v10 & 1) == 0))
  {
    objc_opt_class();
    id v11 = +[CNiOSAddressBookDataMapper os_log]();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CNiOSAddressBookDataMapper setLimitedAccessTableCurrentSequenceNumber:]();
    }
  }
}

uint64_t __73__CNiOSAddressBookDataMapper_setLimitedAccessTableCurrentSequenceNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) integerValue];

  return MEMORY[0x1F4107158](a2, v3);
}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  if (self) {
    addressBoouint64_t k = self->_addressBook;
  }
  else {
    addressBoouint64_t k = 0;
  }
  uint64_t v5 = addressBook;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__CNiOSAddressBookDataMapper_shouldAnalyzeDatabaseWithError___block_invoke;
  v13[3] = &unk_1E56B5B18;
  void v13[4] = v14;
  id v6 = [(CNiOSAddressBook *)v5 performSynchronousWorkWithInvalidatedAddressBook:v13];

  id v7 = v6;
  uint64_t v8 = [v7 value];

  if (v8)
  {
    uint64_t v9 = [v7 value];
    char v10 = v9;
  }
  else
  {
    id v11 = [v7 error];
    uint64_t v9 = v11;
    char v10 = 0;
    if (a3) {
      *a3 = v11;
    }
  }

  _Block_object_dispose(v14, 8);
  return v10 != 0;
}

uint64_t __61__CNiOSAddressBookDataMapper_shouldAnalyzeDatabaseWithError___block_invoke(uint64_t a1, ABAddressBookRef addressBook)
{
  ABAddressBookGetPersonCount(addressBook);
  uint64_t result = ABAddressBookShouldAnalyzeDatabase();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  if (self) {
    self = (CNiOSAddressBookDataMapper *)self->_addressBook;
  }
  id v4 = [(CNiOSAddressBookDataMapper *)self performSynchronousWorkWithInvalidatedAddressBook:&__block_literal_global_167];
  uint64_t v5 = [v4 value];

  if (v5)
  {
    id v6 = [v4 value];
    id v7 = v6;
  }
  else
  {
    id v6 = [v4 error];
    if (a3)
    {
      id v6 = v6;
      id v7 = 0;
      *a3 = v6;
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7 != 0;
}

uint64_t __55__CNiOSAddressBookDataMapper_analyzeDatabaseWithError___block_invoke(int a1, ABAddressBookRef addressBook)
{
  CFIndex PersonCount = ABAddressBookGetPersonCount(addressBook);

  return MEMORY[0x1F4106AC0](addressBook, PersonCount);
}

void __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Error decoding CNLabeledValue: could not create save context", v1, 2u);
}

- (void)updateLimitedAccessListForSaveRequest:(uint64_t)a1 authorizationContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 clientBundleIdentifier];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "authorization context is nil (Client: %@)", v5, 0xCu);
}

- (void)removeContactIdentifiersFromLimitedAcessForAllBundles:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "removeContactIdentifiersFromLimitedAcessForAllBundles failed; id: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_logDeleteHasRemovedRecordWithResult:(os_log_t)log err:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"success";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"failed";
  }
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1909E3000, log, OS_LOG_TYPE_DEBUG, "_processContactsFromSaveContext delete, ABAddressBookRemoveRecord %{public}@, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_logDeleteHasError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1909E3000, v0, OS_LOG_TYPE_DEBUG, "_processContactsFromSaveContext delete, error: %{public}@", v1, 0xCu);
}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "Attempt to save fullscreen image data without setting image data", buf, 2u);
}

- (void)fetchLimitedAccessContactIdentifiersForBundle:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "fetchLimitedAccessContactIdentifiersForBundle: %@, failed: %@");
}

- (void)populateSyncTableForLimitedAccessAboveSequenceNumber:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "populateSyncTableForLimitedAccessAboveSequenceNumber: %@, failed: %@");
}

- (void)purgeLimitedAccessRecordsForBundle:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "purgeLimitedAccessRecordsForBundle: %@ failed: %@");
}

- (void)updateLimitedAccessTable:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "updateLimitedAccessTable failed: %@", v2, v3, v4, v5, v6);
}

- (void)getLimitedAccessContactsCountForBundle:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "getLimitedAccessContactsCountForBundle failed: %@", v2, v3, v4, v5, v6);
}

- (void)getLimitedAccessLastSyncSequenceNumber:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "getLimitedAccessLastSyncSequenceNumber failed: %@", v2, v3, v4, v5, v6);
}

- (void)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "getWatchLimitedAccessSyncDataStartingAtSequenceNumber: %ld, failed: %@", buf, 0x16u);
}

- (void)applyLimitedAccessSyncEvents:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "applyLimitedAccessSyncEvents failed: %@", v2, v3, v4, v5, v6);
}

- (void)setLimitedAccessTableCurrentSequenceNumber:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "setLimitedAccessTableCurrentSequenceNumber failed: %@", v2, v3, v4, v5, v6);
}

@end