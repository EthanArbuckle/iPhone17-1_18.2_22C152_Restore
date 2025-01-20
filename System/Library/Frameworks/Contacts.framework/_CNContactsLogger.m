@interface _CNContactsLogger
- (OS_os_log)log;
- (_CNContactsLogger)init;
- (void)SPIUsageLackingEntitlementGrantedForPID:(int)a3;
- (void)SPIUsageLackingEntitlementRejectedForPID:(int)a3;
- (void)XPCConnectionWasInterruptedForService:(id)a3;
- (void)XPCConnectionWasInvalidatedForService:(id)a3;
- (void)_commonFetchContactsMatchingPredicate:(id)a3 fetchType:(const char *)a4 unifyResults:(BOOL)a5 keysToFetch:(id)a6;
- (void)accessAuthorizationStatusWasDenied;
- (void)addingContacts:(id)a3 toContainerWithIdentifier:(id)a4;
- (void)applyContactUpdateOfKind:(const char *)a3 value:(id)a4 property:(id)a5;
- (void)changedMeContact:(id)a3;
- (void)changingMeContact:(id)a3;
- (void)clearingChangeHistory:(id)a3;
- (void)contactsAccessWasDeniedWithError:(id)a3;
- (void)contactsAccessWasGranted;
- (void)deleteImageRecentsMetadataRequestFailed:(id)a3;
- (void)deletePosterRecentsMetadataRequestFailed:(id)a3;
- (void)deletingContact:(id)a3;
- (void)didFetchContacts:(id)a3 error:(id)a4;
- (void)didFetchEncodedContacts:(id)a3 error:(id)a4;
- (void)errorWhenQueryingTetheredSyncData:(id)a3;
- (void)fetchContactsMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5;
- (void)fetchContactsProgressivelyMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5;
- (void)fetchEncodedContactsMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5;
- (void)fetchingChangeHistory:(id)a3;
- (void)fetchingContactCount:(id)a3;
- (void)fetchingContactIdentifierWithMatchingDictionary:(id)a3;
- (void)fetchingContactSectionCounts:(id)a3;
- (void)fetchingContactWithUserActivity:(id)a3;
- (void)fetchingContacts:(id)a3;
- (void)fetchingContactsBatch:(id)a3;
- (void)fetchingContainers:(id)a3;
- (void)fetchingDefaultContainerIdentifier:(id)a3;
- (void)fetchingGroups:(id)a3;
- (void)fetchingMeContactIdentifier:(id)a3;
- (void)gettingBackgroundColor:(id)a3;
- (void)internalError:(id)a3;
- (void)postingNotification:(id)a3;
- (void)postingNotificationWithName:(id)a3;
- (void)registeringForChangeHistory:(id)a3;
- (void)removeContactImageData;
- (void)requestAuthorizationWasDenied;
- (void)requestingAccessForContacts:(id)a3;
- (void)requestingProviderDomainCommand:(id)a3;
- (void)resettingSortDataIfNeeded:(id)a3;
- (void)saveRequestFailed:(id)a3;
- (void)saveRequestInvalid:(id)a3;
- (void)saving:(id)a3;
- (void)serviceError:(id)a3;
- (void)servicingContactsRequest:(id)a3;
- (void)setContactImageData:(id)a3;
- (void)setContactImageData:(id)a3 format:(const char *)a4 cropRect:(CGRect)a5;
- (void)setContactImageDataZeroCropRect:(id)a3 format:(const char *)a4;
- (void)settingDefaultAccount:(id)a3;
- (void)unregisteringForChangeHistory:(id)a3;
- (void)updatingContact:(id)a3;
@end

@implementation _CNContactsLogger

- (void)fetchEncodedContactsMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5
{
}

- (void)_commonFetchContactsMatchingPredicate:(id)a3 fetchType:(const char *)a4 unifyResults:(BOOL)a5 keysToFetch:(id)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (os_variant_has_internal_diagnostics())
  {
    if (objc_opt_respondsToSelector()) {
      [v10 shortDebugDescription];
    }
    else {
    v12 = [v10 description];
    }
    v13 = [(_CNContactsLogger *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 136316162;
      v15 = a4;
      __int16 v16 = 2112;
      ClassName = (const char *)v12;
      __int16 v18 = 1024;
      BOOL v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = [v11 count];
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_1909E3000, v13, OS_LOG_TYPE_INFO, "Fetching contacts %smatching predicate %@, unifyResults: %d, keysToFetch(%ld):%@", (uint8_t *)&v14, 0x30u);
    }
  }
  else
  {
    v12 = [(_CNContactsLogger *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 136446978;
      v15 = a4;
      __int16 v16 = 2082;
      ClassName = object_getClassName(v10);
      __int16 v18 = 1024;
      BOOL v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = [v11 count];
      _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_INFO, "Fetching contacts %{public}smatching predicate of class %{public}s, unifyResults: %d, keysToFetch: %ld", (uint8_t *)&v14, 0x26u);
    }
  }
}

- (void)fetchingContactsBatch:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingNextContactsBatch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_fetchingContactsBatch___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_fetchingContactsBatch___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (_CNContactsLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNContactsLogger;
  v2 = [(_CNContactsLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts", "Contacts");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)fetchingContacts:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingContacts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38___CNContactsLogger_fetchingContacts___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___CNContactsLogger_fetchingContacts___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)contactsAccessWasGranted
{
  v2 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_INFO, "Contacts access was granted", v3, 2u);
  }
}

- (void)didFetchEncodedContacts:(id)a3 error:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_CNContactsLogger *)self log];
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      uint64_t v11 = [v6 length];
      _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_INFO, "Did fetch contacts data, length: %ld", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[_CNContactsLogger didFetchEncodedContacts:error:]();
  }
}

- (void)didFetchContacts:(id)a3 error:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_CNContactsLogger *)self log];
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      uint64_t v11 = [v6 count];
      _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_INFO, "Did fetch %ld contacts", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[_CNContactsLogger didFetchContacts:error:]();
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)fetchingMeContactIdentifier:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingMeContactIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___CNContactsLogger_fetchingMeContactIdentifier___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___CNContactsLogger_fetchingMeContactIdentifier___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingContactCount:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingContactCount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42___CNContactsLogger_fetchingContactCount___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___CNContactsLogger_fetchingContactCount___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)servicingContactsRequest:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "ServicingContactsRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46___CNContactsLogger_servicingContactsRequest___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___CNContactsLogger_servicingContactsRequest___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingContactSectionCounts:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingContactSectionCount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___CNContactsLogger_fetchingContactSectionCounts___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___CNContactsLogger_fetchingContactSectionCounts___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)SPIUsageLackingEntitlementGrantedForPID:(int)a3
{
  os_activity_t v4 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger SPIUsageLackingEntitlementGrantedForPID:](a3, v4);
  }
}

- (void)SPIUsageLackingEntitlementGrantedForPID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Unauthorized Contacts SPI usage! Allowing it, please file a radar for pid %d", (uint8_t *)v2, 8u);
}

- (void)requestingAccessForContacts:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "RequestAccessForContacts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___CNContactsLogger_requestingAccessForContacts___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___CNContactsLogger_requestingAccessForContacts___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)changingMeContact:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "ChangingMeContact", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___CNContactsLogger_changingMeContact___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___CNContactsLogger_changingMeContact___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingContactWithUserActivity:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingContactWithUserActivity", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___CNContactsLogger_fetchingContactWithUserActivity___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___CNContactsLogger_fetchingContactWithUserActivity___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingContactIdentifierWithMatchingDictionary:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingContactIdentifierWithMatchingDictionary", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69___CNContactsLogger_fetchingContactIdentifierWithMatchingDictionary___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___CNContactsLogger_fetchingContactIdentifierWithMatchingDictionary___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingGroups:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingGroups", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___CNContactsLogger_fetchingGroups___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___CNContactsLogger_fetchingGroups___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingContainers:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingContainers", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___CNContactsLogger_fetchingContainers___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___CNContactsLogger_fetchingContainers___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingDefaultContainerIdentifier:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingDefaultContainerID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___CNContactsLogger_fetchingDefaultContainerIdentifier___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___CNContactsLogger_fetchingDefaultContainerIdentifier___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)saving:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "Saving", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __28___CNContactsLogger_saving___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28___CNContactsLogger_saving___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)registeringForChangeHistory:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "RegisteringForChangeHistory", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___CNContactsLogger_registeringForChangeHistory___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___CNContactsLogger_registeringForChangeHistory___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)unregisteringForChangeHistory:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "UnregisteringForChangeHistory", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___CNContactsLogger_unregisteringForChangeHistory___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___CNContactsLogger_unregisteringForChangeHistory___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingChangeHistory:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingChangeHistory", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_fetchingChangeHistory___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_fetchingChangeHistory___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)clearingChangeHistory:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "ClearingChangeHistory", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_clearingChangeHistory___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_clearingChangeHistory___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)resettingSortDataIfNeeded:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "ResettingSortDataIfNeeded", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47___CNContactsLogger_resettingSortDataIfNeeded___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___CNContactsLogger_resettingSortDataIfNeeded___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)settingDefaultAccount:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "SettingDefaultAccount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_settingDefaultAccount___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_settingDefaultAccount___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)postingNotification:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "PostingContactsNotification", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41___CNContactsLogger_postingNotification___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___CNContactsLogger_postingNotification___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)requestingProviderDomainCommand:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "RequestingProviderDomainCommand", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___CNContactsLogger_requestingProviderDomainCommand___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___CNContactsLogger_requestingProviderDomainCommand___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)gettingBackgroundColor:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "GettingBackgroundColor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___CNContactsLogger_gettingBackgroundColor___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  id v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___CNContactsLogger_gettingBackgroundColor___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)accessAuthorizationStatusWasDenied
{
  v2 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_INFO, "Contacts TCC acccess status was denied", v3, 2u);
  }
}

- (void)requestAuthorizationWasDenied
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Contacts TCC acccess request was denied", v1, 2u);
}

- (void)contactsAccessWasDeniedWithError:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Contacts access was denied, error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)fetchContactsMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5
{
}

- (void)fetchContactsProgressivelyMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5
{
}

- (void)saveRequestInvalid:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger saveRequestInvalid:]();
  }
}

- (void)saveRequestFailed:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger saveRequestFailed:]();
  }
}

- (void)addingContacts:(id)a3 toContainerWithIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_128);
  v9 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218498;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_INFO, "Adding %ld contacts to container with identifier %@: contact identifiers %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)deletingContact:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 identifier];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Deleting contact with identifier: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)updatingContact:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 identifier];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Updating contact with identifier: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)changedMeContact:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Changed me contact: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)serviceError:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger serviceError:]();
  }
}

- (void)SPIUsageLackingEntitlementRejectedForPID:(int)a3
{
  id v4 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger SPIUsageLackingEntitlementRejectedForPID:](a3, v4);
  }
}

- (void)internalError:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger internalError:]();
  }
}

- (void)errorWhenQueryingTetheredSyncData:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger errorWhenQueryingTetheredSyncData:]();
  }
}

- (void)XPCConnectionWasInterruptedForService:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger XPCConnectionWasInterruptedForService:]();
  }
}

- (void)XPCConnectionWasInvalidatedForService:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Service connection to %@ was invalidated", (uint8_t *)&v6, 0xCu);
  }
}

- (void)postingNotificationWithName:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Posting notification %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)applyContactUpdateOfKind:(const char *)a3 value:(id)a4 property:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  char v10 = objc_opt_respondsToSelector();
  uint64_t v11 = [(_CNContactsLogger *)self log];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
    {
      int v14 = 136446722;
      v15 = a3;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2048;
      ClassName = (const char *)[v8 length];
      id v13 = "Updating contact %{public}s, key: '%{public}@', value length %ld";
LABEL_7:
      _os_log_debug_impl(&dword_1909E3000, v11, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v14, 0x20u);
    }
  }
  else if (v12)
  {
    int v14 = 136446722;
    v15 = a3;
    __int16 v16 = 2114;
    id v17 = v9;
    __int16 v18 = 2082;
    ClassName = object_getClassName(v8);
    id v13 = "Updating contact %{public}s, key: '%{public}@', value class <%{public}s>";
    goto LABEL_7;
  }
}

- (void)setContactImageData:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v4 length];
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Setting image data: %ld bytes with no cropRect specified", (uint8_t *)&v6, 0xCu);
  }
}

- (void)removeContactImageData
{
  v2 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Removing image data", v3, 2u);
  }
}

- (void)setContactImageData:(id)a3 format:(const char *)a4 cropRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  BOOL v12 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134219266;
    uint64_t v14 = [v11 length];
    __int16 v15 = 2048;
    CGFloat v16 = x;
    __int16 v17 = 2048;
    CGFloat v18 = y;
    __int16 v19 = 2048;
    CGFloat v20 = width;
    __int16 v21 = 2048;
    CGFloat v22 = height;
    __int16 v23 = 2082;
    uint64_t v24 = a4;
    _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Setting image data: %ld bytes with cropRect: {%.2f, %.2f, %.2f, %.2f}, %{public}s format", (uint8_t *)&v13, 0x3Eu);
  }
}

- (void)setContactImageDataZeroCropRect:(id)a3 format:(const char *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = [v6 length];
    __int16 v10 = 2082;
    id v11 = a4;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Setting image data: %ld bytes with zero cropRect, %{public}s format", (uint8_t *)&v8, 0x16u);
  }
}

- (void)deleteImageRecentsMetadataRequestFailed:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger deleteImageRecentsMetadataRequestFailed:]();
  }
}

- (void)deletePosterRecentsMetadataRequestFailed:(id)a3
{
  id v4 = a3;
  v5 = [(_CNContactsLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNContactsLogger deletePosterRecentsMetadataRequestFailed:]();
  }
}

- (void).cxx_destruct
{
}

- (void)didFetchContacts:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Unable to fetch contacts, error: %@", v2, v3, v4, v5, v6);
}

- (void)didFetchEncodedContacts:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Unable to fetch contacts data, error: %@", v2, v3, v4, v5, v6);
}

- (void)saveRequestInvalid:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Save request was invalid with error: %@", v2, v3, v4, v5, v6);
}

- (void)saveRequestFailed:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Save request failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)serviceError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error communicating with XPC Service: %@", v2, v3, v4, v5, v6);
}

- (void)SPIUsageLackingEntitlementRejectedForPID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Unauthorized Contacts SPI usage! Rejecting it, please file a radar for pid %d", (uint8_t *)v2, 8u);
}

- (void)internalError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Unexpected internal error: %@", v2, v3, v4, v5, v6);
}

- (void)errorWhenQueryingTetheredSyncData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error querying Tethered Sync data: %@", v2, v3, v4, v5, v6);
}

- (void)XPCConnectionWasInterruptedForService:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error: service connection to %@ was interrupted", v2, v3, v4, v5, v6);
}

- (void)deleteImageRecentsMetadataRequestFailed:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Save request to delete contact image recents metadata failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)deletePosterRecentsMetadataRequestFailed:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Save request to delete contact poster recents metadata failed with error: %@", v2, v3, v4, v5, v6);
}

@end