@interface CNXPCDataMapper
+ (id)contactBuffersDecoderForFetchRequest:(id)a3;
+ (id)cursorProtocolInterface;
+ (id)os_log;
+ (id)serviceProtocolInterface;
- (BOOL)analyzeDatabaseWithError:(id *)a3;
- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)fetchEncodedContactsForFetchRequest:(void *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:;
- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4;
- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6;
- (BOOL)setMeContact:(id)a3 error:(id *)a4;
- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5;
- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3;
- (BOOL)shouldLogContactsAccess;
- (BOOL)shouldLogPrivacyAccountingAccessEvents;
- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5;
- (BOOL)writeFavoritesPropertyListData:(id)a3 toPath:(id)a4 error:(id *)a5;
- (CNXPCDataMapper)init;
- (CNXPCDataMapper)initWithConfiguration:(id)a3;
- (CNXPCDataMapper)initWithConfiguration:(id)a3 connection:(id)a4;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4;
- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactObservableForFetchRequest:(id)a3;
- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4;
- (id)containersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)currentHistoryAnchor;
- (id)currentHistoryToken;
- (id)defaultContainerIdentifier;
- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5;
- (id)favoritesEntryDictionariesAtPath:(id)a3 error:(id *)a4;
- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3;
- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5;
- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3;
- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3;
- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)identifierWithError:(id *)a3;
- (id)meContactIdentifiers:(id *)a3;
- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4;
- (id)policyWithDescription:(id)a3 error:(id *)a4;
- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3;
- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4;
- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4;
- (id)unifiedContactCountWithError:(id *)a3;
- (id)unitTestPathFromEnvironment:(uint64_t)a1;
- (id)userActivityUserInfoForContact:(id)a3;
- (uint64_t)fetchAndDecodeEncodedContactsForFetchRequest:(void *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:;
- (uint64_t)fetchContactsForFetchRequest:(void *)a3 error:(void *)a4 batchHandler:;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)applyLimitedAccessSyncEvents:(id)a3;
- (void)dropAllLimitedAccessRows;
- (void)dropAllLimitedAccessRowsAndSyncNotify;
- (void)purgeLimitedAccessRecordsForBundle:(id)a3;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4;
- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3;
- (void)updateLimitedAccessTable:(id)a3;
@end

@implementation CNXPCDataMapper

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self && self->_serviceConnection)
  {
    if (self->_serviceProxy)
    {
      ensureFetchRequestHasKeyboardState(v4, self->_keyboardStateMonitor);
      v6 = (void *)MEMORY[0x1E4F5A480];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke;
      v12[3] = &unk_1E56B4910;
      id v13 = v5;
      v14 = self;
      v7 = [v6 observableWithBlock:v12];

      goto LABEL_8;
    }
    v8 = (void *)MEMORY[0x1E4F5A480];
    uint64_t v9 = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F5A480];
    uint64_t v9 = 100;
  }
  v10 = +[CNErrorFactory errorWithCode:v9 userInfo:0];
  v7 = [v8 observableWithError:v10];

LABEL_8:

  return v7;
}

- (BOOL)shouldLogContactsAccess
{
  return 1;
}

- (id)meContactIdentifiers:(id *)a3
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_meContactIdentifiersWithReply_ error:a3];
}

- (CNXPCDataMapper)initWithConfiguration:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CNXPCDataMapper;
  v8 = [(CNXPCDataMapper *)&v35 init];
  if (v8)
  {
    uint64_t v9 = [v6 environment];
    v10 = [v9 loggerProvider];
    v11 = [v10 contactsLogger];

    objc_storeStrong((id *)&v8->_logger, v11);
    v12 = +[CNXPCDataMapper serviceProtocolInterface];
    id v13 = [[CNXPCConnection alloc] initWithConnection:v7 interface:v12 logger:v11];
    serviceConnection = v8->_serviceConnection;
    v8->_serviceConnection = v13;

    uint64_t v15 = [(CNXPCConnection *)v8->_serviceConnection serviceProxy];
    serviceProxy = v8->_serviceProxy;
    v8->_serviceProxy = (CNXPCDataMapperService *)v15;

    v17 = [CNAuthorization alloc];
    v18 = [v6 assumedIdentity];
    uint64_t v19 = [(CNAuthorization *)v17 initWithAssumedIdentity:v18];
    authorization = v8->_authorization;
    v8->_authorization = (CNAuthorization *)v19;

    v21 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v22 = [v21 keyboardStateMonitor];
    keyboardStateMonitor = v8->_keyboardStateMonitor;
    v8->_keyboardStateMonitor = (CNKeyboardStateMonitor *)v22;

    v24 = objc_opt_new();
    v25 = [v6 environment];
    int v26 = [v25 useInMemoryStores];

    if (v26)
    {
      [v24 setObject:MEMORY[0x1E4F1CC38] forKey:@"CNiOSAddressBookDataMapperUnitTestInMemoryStoreKey"];
    }
    else
    {
      v27 = [v6 environment];
      v28 = -[CNXPCDataMapper unitTestPathFromEnvironment:]((uint64_t)v8, v27);

      if (v28 && [v28 length]) {
        [v24 setObject:v28 forKey:@"CNiOSAddressBookDataMapperUnitTestPathKey"];
      }
    }
    v29 = [v6 assumedIdentity];

    if (v29)
    {
      id v30 = objc_alloc(getPABridgedTCCIdentityClass());
      v31 = [v6 assumedIdentity];
      v32 = (void *)[v30 initWithTCCIdentity:v31];

      if (v32) {
        [v24 setObject:v32 forKey:@"CNAssumedIdentity"];
      }
    }
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A270] + 16))() & 1) == 0) {
      [(CNXPCDataMapperService *)v8->_serviceProxy configureServiceWithOptions:v24];
    }
    v33 = v8;
  }
  return v8;
}

- (id)unitTestPathFromEnvironment:(uint64_t)a1
{
  if (a1)
  {
    v2 = [a2 baseURL];
    v3 = [v2 path];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_authorization;
  }
  return [(CNXPCDataMapper *)self requestAccessForEntityType:0 error:a4];
}

- (BOOL)shouldLogPrivacyAccountingAccessEvents
{
  return 0;
}

- (CNXPCDataMapper)initWithConfiguration:(id)a3
{
  v5 = @"com.apple.contactsd";
  id v6 = a3;
  if ([v6 isContactProvider])
  {
    id v7 = @"com.apple.contactsd.contact-provider";

    v5 = v7;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v5 options:0];
  uint64_t v9 = [(CNXPCDataMapper *)self initWithConfiguration:v6 connection:v8];

  return v9;
}

+ (id)serviceProtocolInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE0B8460];
  v221 = +[CNXPCDataMapper cursorProtocolInterface]();
  v3 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v220 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  objc_msgSend(v220, "_cn_addNonNilObject:", getPABridgedTCCIdentityClass());
  [v2 setClasses:v220 forSelector:sel_configureServiceWithOptions_ argumentIndex:0 ofReply:0];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_identifierWithReply_ argumentIndex:0 ofReply:1];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_identifierWithReply_ argumentIndex:1 ofReply:1];

  v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_unifiedContactCountWithReply_ argumentIndex:0 ofReply:1];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_unifiedContactCountWithReply_ argumentIndex:1 ofReply:1];

  v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_contactCountForFetchRequest_withReply_ argumentIndex:0 ofReply:0];

  v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_contactCountForFetchRequest_withReply_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_contactCountForFetchRequest_withReply_ argumentIndex:1 ofReply:1];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  [v2 setClasses:v19 forSelector:sel_sectionListOffsetsForSortOrder_reply_ argumentIndex:0 ofReply:1];

  v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:sel_sectionListOffsetsForSortOrder_reply_ argumentIndex:1 ofReply:1];

  v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v21 forSelector:sel_contactsForFetchRequest_withMatchInfoReply_ argumentIndex:0 ofReply:0];

  uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v2 setClasses:v24 forSelector:sel_contactsForFetchRequest_withMatchInfoReply_ argumentIndex:0 ofReply:1];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  [v2 setClasses:v28 forSelector:sel_contactsForFetchRequest_withMatchInfoReply_ argumentIndex:1 ofReply:1];

  v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  [v2 setClasses:v31 forSelector:sel_contactsForFetchRequest_withMatchInfoReply_ argumentIndex:2 ofReply:1];

  v32 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v32 forSelector:sel_encodedContactsAndCursorForFetchRequest_withReply_ argumentIndex:0 ofReply:0];

  v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v33 forSelector:sel_encodedContactsAndCursorForFetchRequest_withReply_ argumentIndex:0 ofReply:1];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v34, "setWithObjects:", v35, v36, v37, objc_opt_class(), 0);
  [v2 setClasses:v38 forSelector:sel_encodedContactsAndCursorForFetchRequest_withReply_ argumentIndex:1 ofReply:1];

  [v2 setInterface:v221 forSelector:sel_encodedContactsAndCursorForFetchRequest_withReply_ argumentIndex:2 ofReply:1];
  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  v41 = objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  [v2 setClasses:v41 forSelector:sel_encodedContactsAndCursorForFetchRequest_withReply_ argumentIndex:4 ofReply:1];

  v42 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE091B88];
  v219 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE0B84C0];
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  [v42 setClasses:v45 forSelector:sel_receiveProgressiveContacts_matchInfos_ argumentIndex:0 ofReply:0];

  v46 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  v49 = objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
  [v42 setClasses:v49 forSelector:sel_receiveProgressiveContacts_matchInfos_ argumentIndex:1 ofReply:0];

  v50 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v50 forSelector:sel_progressiveContactsForFetchRequest_progressHandler_reply_ argumentIndex:0 ofReply:0];

  [v2 setInterface:v42 forSelector:sel_progressiveContactsForFetchRequest_progressHandler_reply_ argumentIndex:1 ofReply:0];
  [v2 setInterface:v219 forSelector:sel_progressiveContactsForFetchRequest_progressHandler_reply_ argumentIndex:0 ofReply:1];
  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = objc_opt_class();
  v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  [v2 setClasses:v53 forSelector:sel_meContactIdentifiersWithReply_ argumentIndex:0 ofReply:1];

  v54 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v54 forSelector:sel_meContactIdentifiersWithReply_ argumentIndex:1 ofReply:1];

  v55 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v55 forSelector:sel_executeSaveRequest_withReply_ argumentIndex:0 ofReply:0];

  v56 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v56 forSelector:sel_executeSaveRequest_withReply_ argumentIndex:1 ofReply:1];

  v57 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v60 = objc_opt_class();
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  v63 = objc_msgSend(v57, "setWithObjects:", v58, v59, v60, v61, v62, objc_opt_class(), 0);
  [v2 setClasses:v63 forSelector:sel_executeSaveRequest_withReply_ argumentIndex:2 ofReply:1];

  v64 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v64 forSelector:sel_containersMatchingPredicate_withReply_ argumentIndex:0 ofReply:0];

  v65 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v66 = objc_opt_class();
  v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
  [v2 setClasses:v67 forSelector:sel_containersMatchingPredicate_withReply_ argumentIndex:0 ofReply:1];

  v68 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v68 forSelector:sel_containersMatchingPredicate_withReply_ argumentIndex:1 ofReply:1];

  v69 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v69 forSelector:sel_serverSearchContainersMatchingPredicate_withReply_ argumentIndex:0 ofReply:0];

  v70 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v71 = objc_opt_class();
  v72 = objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  [v2 setClasses:v72 forSelector:sel_serverSearchContainersMatchingPredicate_withReply_ argumentIndex:0 ofReply:1];

  v73 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v73 forSelector:sel_serverSearchContainersMatchingPredicate_withReply_ argumentIndex:1 ofReply:1];

  v74 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v74 forSelector:sel_policyForContainerWithIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v75 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v76 = objc_opt_class();
  v77 = objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
  [v2 setClasses:v77 forSelector:sel_policyForContainerWithIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v78 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v78 forSelector:sel_policyForContainerWithIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v79 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v79 forSelector:sel_accountsMatchingPredicate_withReply_ argumentIndex:0 ofReply:0];

  v80 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v81 = objc_opt_class();
  v82 = objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
  [v2 setClasses:v82 forSelector:sel_accountsMatchingPredicate_withReply_ argumentIndex:0 ofReply:1];

  v83 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v83 forSelector:sel_accountsMatchingPredicate_withReply_ argumentIndex:1 ofReply:1];

  v84 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v84 forSelector:sel_groupsMatchingPredicate_withReply_ argumentIndex:0 ofReply:0];

  v85 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v86 = objc_opt_class();
  v87 = objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
  [v2 setClasses:v87 forSelector:sel_groupsMatchingPredicate_withReply_ argumentIndex:0 ofReply:1];

  v88 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v88 forSelector:sel_groupsMatchingPredicate_withReply_ argumentIndex:1 ofReply:1];

  v89 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v89 forSelector:sel_subgroupsOfGroupWithIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v90 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v91 = objc_opt_class();
  v92 = objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
  [v2 setClasses:v92 forSelector:sel_subgroupsOfGroupWithIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v93 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v93 forSelector:sel_subgroupsOfGroupWithIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v94 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v94 forSelector:sel_defaultContainerIdentifierWithReply_ argumentIndex:0 ofReply:0];

  v95 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v95 forSelector:sel_defaultContainerIdentifierWithReply_ argumentIndex:0 ofReply:1];

  v96 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v96 forSelector:sel_defaultContainerIdentifierWithReply_ argumentIndex:1 ofReply:1];

  v97 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v97 forSelector:sel_setDefaultAccountIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v98 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v98 forSelector:sel_setDefaultAccountIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v99 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v99 forSelector:sel_setDefaultAccountIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v100 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v100 forSelector:sel_setMeContact_withReply_ argumentIndex:0 ofReply:0];

  v101 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v101 forSelector:sel_setMeContact_withReply_ argumentIndex:0 ofReply:1];

  v102 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v102 forSelector:sel_setMeContact_withReply_ argumentIndex:1 ofReply:1];

  v103 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v103 forSelector:sel_setMeContact_forContainer_withReply_ argumentIndex:0 ofReply:0];

  v104 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v104 forSelector:sel_setMeContact_forContainer_withReply_ argumentIndex:1 ofReply:0];

  v105 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v105 forSelector:sel_setMeContact_forContainer_withReply_ argumentIndex:0 ofReply:1];

  v106 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v106 forSelector:sel_setMeContact_forContainer_withReply_ argumentIndex:1 ofReply:1];

  v107 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v107 forSelector:sel_setBestMeIfNeededForGivenName_familyName_email_withReply_ argumentIndex:0 ofReply:0];

  v108 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v108 forSelector:sel_setBestMeIfNeededForGivenName_familyName_email_withReply_ argumentIndex:1 ofReply:0];

  v109 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v109 forSelector:sel_setBestMeIfNeededForGivenName_familyName_email_withReply_ argumentIndex:2 ofReply:0];

  v110 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v110 forSelector:sel_setBestMeIfNeededForGivenName_familyName_email_withReply_ argumentIndex:0 ofReply:1];

  v111 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v111 forSelector:sel_setBestMeIfNeededForGivenName_familyName_email_withReply_ argumentIndex:1 ofReply:1];

  v112 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v112 forSelector:sel_favoritesEntryDictionariesAtPath_withReply_ argumentIndex:0 ofReply:0];

  v113 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v114 = objc_opt_class();
  uint64_t v115 = objc_opt_class();
  uint64_t v116 = objc_opt_class();
  v117 = objc_msgSend(v113, "setWithObjects:", v114, v115, v116, objc_opt_class(), 0);
  [v2 setClasses:v117 forSelector:sel_favoritesEntryDictionariesAtPath_withReply_ argumentIndex:0 ofReply:1];

  v118 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v118 forSelector:sel_favoritesEntryDictionariesAtPath_withReply_ argumentIndex:1 ofReply:1];

  v119 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v119 forSelector:sel_writeFavoritesPropertyListData_toPath_withReply_ argumentIndex:0 ofReply:0];

  v120 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v120 forSelector:sel_writeFavoritesPropertyListData_toPath_withReply_ argumentIndex:1 ofReply:0];

  v121 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v121 forSelector:sel_writeFavoritesPropertyListData_toPath_withReply_ argumentIndex:0 ofReply:1];

  v122 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v122 forSelector:sel_writeFavoritesPropertyListData_toPath_withReply_ argumentIndex:1 ofReply:1];

  v123 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v123 forSelector:sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v124 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v124 forSelector:sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:1 ofReply:0];

  v125 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v125 forSelector:sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v126 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v126 forSelector:sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v127 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v127 forSelector:sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v128 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v128 forSelector:sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:1 ofReply:0];

  v129 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v129 forSelector:sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v130 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v130 forSelector:sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v131 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v131 forSelector:sel_changeHistoryWithFetchRequest_withReply_ argumentIndex:0 ofReply:0];

  v132 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v132 forSelector:sel_changeHistoryWithFetchRequest_withReply_ argumentIndex:0 ofReply:1];

  v133 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v134 = objc_opt_class();
  v135 = objc_msgSend(v133, "setWithObjects:", v134, objc_opt_class(), 0);
  [v2 setClasses:v135 forSelector:sel_changeHistoryWithFetchRequest_withReply_ argumentIndex:1 ofReply:1];

  v136 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v136 forSelector:sel_currentHistoryTokenWithReply_ argumentIndex:0 ofReply:1];

  v137 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v137 forSelector:sel_currentHistoryTokenWithReply_ argumentIndex:1 ofReply:1];

  v138 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v138 forSelector:sel_currentHistoryAnchorWithReply_ argumentIndex:0 ofReply:1];

  v139 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v139 forSelector:sel_currentHistoryAnchorWithReply_ argumentIndex:1 ofReply:1];

  v140 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v140 forSelector:sel_executeChangeHistoryClearRequest_withReply_ argumentIndex:0 ofReply:0];

  v141 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v141 forSelector:sel_executeChangeHistoryClearRequest_withReply_ argumentIndex:0 ofReply:1];

  v142 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v142 forSelector:sel_executeChangeHistoryClearRequest_withReply_ argumentIndex:1 ofReply:1];

  v143 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v144 = objc_opt_class();
  v145 = objc_msgSend(v143, "setWithObjects:", v144, objc_opt_class(), 0);
  [v2 setClasses:v145 forSelector:sel_reindexSearchableItemsWithIdentifiers_withReply_ argumentIndex:0 ofReply:0];

  v146 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v146 forSelector:sel_verifyIndexWithReply_ argumentIndex:0 ofReply:1];

  v147 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v147 forSelector:sel_verifyIndexWithReply_ argumentIndex:1 ofReply:1];

  v148 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v148 forSelector:sel_geminiResultForContact_substituteDefaultForDangling_withReply_ argumentIndex:0 ofReply:0];

  v149 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v149 forSelector:sel_geminiResultForContact_substituteDefaultForDangling_withReply_ argumentIndex:0 ofReply:1];

  v150 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v150 forSelector:sel_geminiResultForContact_substituteDefaultForDangling_withReply_ argumentIndex:1 ofReply:1];

  v151 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v151 forSelector:sel_bestSenderIdentityForHandle_withReply_ argumentIndex:0 ofReply:0];

  v152 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", getTUSenderIdentityClass_0(), 0);
  [v2 setClasses:v152 forSelector:sel_bestSenderIdentityForHandle_withReply_ argumentIndex:0 ofReply:1];

  v153 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v153 forSelector:sel_bestSenderIdentityForHandle_withReply_ argumentIndex:1 ofReply:1];

  v154 = +[CNSecureCodingClassSets keyDescriptorClasses];
  [v2 setClasses:v154 forSelector:sel_authorizedKeysForContactKeys_withReply_ argumentIndex:0 ofReply:0];

  v155 = +[CNSecureCodingClassSets keyDescriptorClasses];
  [v2 setClasses:v155 forSelector:sel_authorizedKeysForContactKeys_withReply_ argumentIndex:0 ofReply:1];

  v156 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v156 forSelector:sel_authorizedKeysForContactKeys_withReply_ argumentIndex:1 ofReply:1];

  v157 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v157 forSelector:sel_getBackgroundColorOnImageData_bitmapFormat_withReply_ argumentIndex:0 ofReply:0];

  v158 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v158 forSelector:sel_getBackgroundColorOnImageData_bitmapFormat_withReply_ argumentIndex:1 ofReply:0];

  v159 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v160 = objc_opt_class();
  uint64_t v161 = objc_opt_class();
  uint64_t v162 = objc_opt_class();
  v163 = objc_msgSend(v159, "setWithObjects:", v160, v161, v162, objc_opt_class(), 0);
  [v2 setClasses:v163 forSelector:sel_getBackgroundColorOnImageData_bitmapFormat_withReply_ argumentIndex:0 ofReply:1];

  v164 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v164 forSelector:sel_addLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v165 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v165 forSelector:sel_addLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:1 ofReply:0];

  v166 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v166 forSelector:sel_addLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v167 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v167 forSelector:sel_addLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v168 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v168 forSelector:sel_addLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:0 ofReply:0];

  v169 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v170 = objc_opt_class();
  v171 = objc_msgSend(v169, "setWithObjects:", v170, objc_opt_class(), 0);
  [v2 setClasses:v171 forSelector:sel_addLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:1 ofReply:0];

  v172 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v172 forSelector:sel_addLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:0 ofReply:1];

  v173 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v173 forSelector:sel_addLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:1 ofReply:1];

  v174 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v174 forSelector:sel_getLimitedAccessContactsCountForBundle_withReply_ argumentIndex:0 ofReply:0];

  v175 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v175 forSelector:sel_getLimitedAccessContactsCountForBundle_withReply_ argumentIndex:0 ofReply:1];

  v176 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v176 forSelector:sel_removeLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v177 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v177 forSelector:sel_removeLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:1 ofReply:0];

  v178 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v178 forSelector:sel_removeLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v179 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v179 forSelector:sel_removeLimitedAccessForBundle_contactIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v180 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v180 forSelector:sel_removeLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:0 ofReply:0];

  v181 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v182 = objc_opt_class();
  v183 = objc_msgSend(v181, "setWithObjects:", v182, objc_opt_class(), 0);
  [v2 setClasses:v183 forSelector:sel_removeLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:1 ofReply:0];

  v184 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v184 forSelector:sel_removeLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:0 ofReply:1];

  v185 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v185 forSelector:sel_removeLimitedAccessForBundle_contactIdentifiers_withReply_ argumentIndex:1 ofReply:1];

  v186 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v186 forSelector:sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_ argumentIndex:0 ofReply:0];

  v187 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v188 = objc_opt_class();
  v189 = objc_msgSend(v187, "setWithObjects:", v188, objc_opt_class(), 0);
  [v2 setClasses:v189 forSelector:sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_ argumentIndex:0 ofReply:1];

  v190 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v190 forSelector:sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_ argumentIndex:1 ofReply:1];

  v191 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v191 forSelector:sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_ argumentIndex:0 ofReply:0];

  v192 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v192 forSelector:sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_ argumentIndex:0 ofReply:1];

  v193 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v193 forSelector:sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_ argumentIndex:1 ofReply:1];

  v194 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v194 forSelector:sel_updateLimitedAccessTable_withReply_ argumentIndex:0 ofReply:0];

  v195 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v195 forSelector:sel_updateLimitedAccessTable_withReply_ argumentIndex:0 ofReply:1];

  v196 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v196 forSelector:sel_updateLimitedAccessTable_withReply_ argumentIndex:1 ofReply:1];

  v197 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v197 forSelector:sel_getLimitedAccessLastSyncSequenceNumberWithReply_ argumentIndex:0 ofReply:1];

  v198 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v198 forSelector:sel_getLimitedAccessLastSyncSequenceNumberWithReply_ argumentIndex:1 ofReply:1];

  v199 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v199 forSelector:sel_purgeLimitedAccessRecordsForBundle_withReply_ argumentIndex:0 ofReply:0];

  v200 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v200 forSelector:sel_purgeLimitedAccessRecordsForBundle_withReply_ argumentIndex:0 ofReply:1];

  v201 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v201 forSelector:sel_purgeLimitedAccessRecordsForBundle_withReply_ argumentIndex:1 ofReply:1];

  v202 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v202 forSelector:sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_ argumentIndex:0 ofReply:0];

  v203 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v203 forSelector:sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_ argumentIndex:0 ofReply:1];

  v204 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v204 forSelector:sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_ argumentIndex:1 ofReply:1];

  v205 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v205 forSelector:sel_applyLimitedAccessSyncEvents_withReply_ argumentIndex:0 ofReply:0];

  v206 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v206 forSelector:sel_applyLimitedAccessSyncEvents_withReply_ argumentIndex:0 ofReply:1];

  v207 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v207 forSelector:sel_applyLimitedAccessSyncEvents_withReply_ argumentIndex:1 ofReply:1];

  v208 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v208 forSelector:sel_dropAllLimitedAccessRowsWithReply_ argumentIndex:0 ofReply:1];

  v209 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v209 forSelector:sel_dropAllLimitedAccessRowsWithReply_ argumentIndex:1 ofReply:1];

  v210 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v210 forSelector:sel_dropAllLimitedAccessRowsAndSyncNotifyWithReply_ argumentIndex:0 ofReply:1];

  v211 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v211 forSelector:sel_dropAllLimitedAccessRowsAndSyncNotifyWithReply_ argumentIndex:1 ofReply:1];

  v212 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v212 forSelector:sel_setLimitedAccessTableCurrentSequenceNumber_withReply_ argumentIndex:0 ofReply:0];

  v213 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v213 forSelector:sel_setLimitedAccessTableCurrentSequenceNumber_withReply_ argumentIndex:0 ofReply:1];

  v214 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v214 forSelector:sel_setLimitedAccessTableCurrentSequenceNumber_withReply_ argumentIndex:1 ofReply:1];

  v215 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v215 forSelector:sel_shouldAnalyzeDatabaseWithReply_ argumentIndex:1 ofReply:1];

  v216 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v216 forSelector:sel_analyzeDatabaseWithReply_ argumentIndex:0 ofReply:1];

  v217 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v217 forSelector:sel_analyzeDatabaseWithReply_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)cursorProtocolInterface
{
  self;
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE096B48];
  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_fetchNextBatchWithReply_ argumentIndex:0 ofReply:1];

  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_fetchNextBatchWithReply_ argumentIndex:2 ofReply:1];

  return v0;
}

id __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_2;
  aBlock[3] = &unk_1E56B48E8;
  id v5 = v3;
  id v21 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = [*(id *)(a1 + 32) effectivePredicate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "cn_supportsEncodedFetching"))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v19 = 0;
    char v10 = -[CNXPCDataMapper fetchAndDecodeEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:](v8, v9, &v19, v4, v6);
    v11 = v19;
  }
  else
  {
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v18 = 0;
    char v10 = -[CNXPCDataMapper fetchContactsForFetchRequest:error:batchHandler:](v12, v13, &v18, v6);
    v11 = v18;
  }
  id v14 = v11;
  uint64_t v15 = v14;
  if (v10)
  {
    [v5 observerDidComplete];
  }
  else
  {
    if (!v14)
    {
      uint64_t v16 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_cold_1(v16);
      }

      uint64_t v15 = +[CNErrorFactory errorWithCode:2 userInfo:0];
    }
    [v5 observerDidFailWithError:v15];
  }

  return v4;
}

- (uint64_t)fetchAndDecodeEncodedContactsForFetchRequest:(void *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (!a1)
  {
    uint64_t v18 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = +[CNXPCDataMapper contactBuffersDecoderForFetchRequest:v9];
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  id v13 = *(id *)(a1 + 24);
  id v14 = *(id *)(a1 + 40);
  ensureFetchRequestHasKeyboardState(v9, v14);

  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
  v21[3] = &unk_1E56B4988;
  v25 = &v34;
  id v15 = v12;
  id v22 = v15;
  id v24 = v11;
  id v16 = v13;
  id v23 = v16;
  uint64_t v26 = &v28;
  LOBYTE(v14) = -[CNXPCDataMapper fetchEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:](a1, v9, &v27, v10, v21);
  id v17 = v27;
  if ((v14 & 1) == 0)
  {
    [v16 didFetchContacts:0 error:v17];
    uint64_t v19 = v17;
    if (a3)
    {
LABEL_9:
      uint64_t v18 = 0;
      *a3 = v19;
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v18 = 0;
    goto LABEL_11;
  }
  if (!*((unsigned char *)v35 + 24))
  {
    [v16 didFetchContacts:0 error:v29[5]];
    if (a3)
    {
      uint64_t v19 = (void *)v29[5];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v18 = 1;
LABEL_11:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

LABEL_12:
  return v18;
}

- (BOOL)fetchEncodedContactsForFetchRequest:(void *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:
{
  id v8 = a2;
  id v22 = a4;
  id v21 = a5;
  if (a1)
  {
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__5;
    v54 = __Block_byref_object_dispose__5;
    id v55 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__5;
    uint64_t v44 = __Block_byref_object_dispose__5;
    id v45 = 0;
    uint64_t v36 = 0;
    char v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    id v9 = *(id *)(a1 + 40);
    ensureFetchRequestHasKeyboardState(v8, v9);

    id v10 = *(id *)(a1 + 16);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
    v29[3] = &unk_1E56B49D8;
    v32 = &v56;
    id v33 = &v50;
    v31 = &v46;
    v29[4] = a1;
    uint64_t v34 = &v40;
    id v11 = v21;
    id v30 = v11;
    uint64_t v35 = &v36;
    [v10 encodedContactsAndCursorForFetchRequest:v8 withReply:v29];

    uint64_t v12 = v8;
    while (!*((unsigned char *)v37 + 24))
    {
      if (v51[5] || ([v22 isCanceled] & 1) != 0) {
        break;
      }
      *((unsigned char *)v47 + 24) = 0;
      uint64_t v18 = (void *)v41[5];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_3;
      v23[3] = &unk_1E56B4A00;
      v25 = &v46;
      uint64_t v26 = &v56;
      id v27 = &v50;
      id v24 = v11;
      uint64_t v28 = &v36;
      uint64_t v19 = v18;
      uint64_t v12 = v8;
      [v19 fetchNextBatchWithReply:v23];
      if (!*((unsigned char *)v47 + 24)) {
        *((unsigned char *)v37 + 24) = 1;
      }
    }
    if (!*((unsigned char *)v47 + 24))
    {
      uint64_t v13 = +[CNErrorFactory errorWithCode:1 userInfo:0];
      id v14 = (void *)v51[5];
      v51[5] = v13;

      *((unsigned char *)v57 + 24) = 0;
      uint64_t v12 = v8;
    }
    if (a3)
    {
      id v15 = (void *)v51[5];
      if (v15) {
        *a3 = v15;
      }
    }
    BOOL v16 = *((unsigned char *)v57 + 24) != 0;

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);

    _Block_object_dispose(&v56, 8);
  }
  else
  {
    BOOL v16 = 0;
    uint64_t v12 = v8;
  }

  return v16;
}

+ (id)contactBuffersDecoderForFetchRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABContactBuffersDecoder alloc] initWithFetchRequest:v3];

  return v4;
}

id __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5A490];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 identifier];
  id v6 = [v3 objectForKeyedSubscript:v5];
  id v7 = [v2 pairWithFirst:v4 second:v6];

  return v7;
}

void __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) contactMatchInfosFromABMatchInfos:*(void *)(a1 + 40) contacts:v4];
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 48) didFetchContacts:v4 error:0];
  }
}

void __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_3;
  v8[3] = &unk_1E56B48C0;
  id v9 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a2, "_cn_map:", v8);
  [*(id *)(a1 + 32) observerDidReceiveResult:v7];
}

void __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(void *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v13 == 0;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v14 = (void *)a1[4];
    if (v14) {
      id v14 = (void *)v14[3];
    }
    id v15 = v14;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
    v20[3] = &unk_1E56B49B0;
    id v21 = v15;
    BOOL v16 = v15;
    uint64_t v17 = [a4 synchronousRemoteObjectProxyWithErrorHandler:v20];
    uint64_t v18 = *(void *)(a1[9] + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    (*(void (**)(void))(a1[5] + 16))();
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = a5;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a6);
  }
}

void __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([v7 length])
  {
    id v9 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
    v13[3] = &unk_1E56B4960;
    id v14 = v9;
    id v15 = v8;
    id v17 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v10 + 40);
    char v11 = [v14 decodeContactsFromData:v7 moreComing:a4 ^ 1u replyHandler:v13 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
  }
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (self) {
    self = (CNXPCDataMapper *)self->_authorization;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CNXPCDataMapper_requestAccessForEntityType_completionHandler___block_invoke;
  v8[3] = &unk_1E56B4AC8;
  id v9 = v6;
  id v7 = v6;
  [(CNXPCDataMapper *)self requestAccessForEntityType:a3 completionHandler:v8];
}

uint64_t __64__CNXPCDataMapper_requestAccessForEntityType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)os_log
{
  self;
  if (os_log_cn_once_token_2_1 != -1) {
    dispatch_once(&os_log_cn_once_token_2_1, &__block_literal_global_22);
  }
  v0 = (void *)os_log_cn_once_object_2_1;

  return v0;
}

uint64_t __25__CNXPCDataMapper_os_log__block_invoke()
{
  os_log_cn_once_object_2_1 = (uint64_t)os_log_create("com.apple.contacts", "CNXPCDataMapper");

  return MEMORY[0x1F41817F8]();
}

- (CNXPCDataMapper)init
{
  id v3 = objc_alloc_init(CNDataMapperConfiguration);
  id v4 = +[CNContactsEnvironment currentEnvironment];
  [(CNDataMapperConfiguration *)v3 setEnvironment:v4];

  id v5 = [(CNXPCDataMapper *)self initWithConfiguration:v3];
  return v5;
}

- (id)unifiedContactCountWithError:(id *)a3
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_unifiedContactCountWithReply_ error:a3];
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  if (self)
  {
    ensureFetchRequestHasKeyboardState(a3, self->_keyboardStateMonitor);
    serviceConnection = self->_serviceConnection;
  }
  else
  {
    ensureFetchRequestHasKeyboardState(a3, 0);
    serviceConnection = 0;
  }
  id v8 = [(CNXPCConnection *)serviceConnection remoteResultForSelector:sel_contactCountForFetchRequest_withReply_ param1:a3 error:a4];

  return v8;
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  id v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  if (self) {
    serviceProxy = self->_serviceProxy;
  }
  else {
    serviceProxy = 0;
  }
  id v7 = serviceProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__CNXPCDataMapper_sectionListOffsetsForSortOrder_error___block_invoke;
  v11[3] = &unk_1E56B4898;
  v11[4] = &v18;
  v11[5] = &v12;
  [(CNXPCDataMapperService *)v7 sectionListOffsetsForSortOrder:a3 reply:v11];

  id v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = (id) v13[5];
    id v8 = (void *)v19[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

void __56__CNXPCDataMapper_sectionListOffsetsForSortOrder_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (uint64_t)fetchContactsForFetchRequest:(void *)a3 error:(void *)a4 batchHandler:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__5;
    id v27 = __Block_byref_object_dispose__5;
    id v28 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v9 = *(id *)(a1 + 40);
    ensureFetchRequestHasKeyboardState(v7, v9);

    id v10 = *(id *)(a1 + 16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__CNXPCDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke;
    v15[3] = &unk_1E56B4938;
    id v17 = &v19;
    uint64_t v18 = &v23;
    id v16 = v8;
    [v10 contactsForFetchRequest:v7 withMatchInfoReply:v15];

    if (!*((unsigned char *)v20 + 24))
    {
      uint64_t v11 = +[CNErrorFactory errorWithCode:1 userInfo:0];
      uint64_t v12 = (void *)v24[5];
      v24[5] = v11;
    }
    id v13 = (void *)v24[5];
    a1 = v13 == 0;
    if (a3 && v13) {
      *a3 = v13;
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }
  return a1;
}

void __67__CNXPCDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
  else {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

uint64_t __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) serviceError:a2];
}

void __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_3(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v14 = a2;
  id v7 = a4;
  id v8 = v7;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  if (v7)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    uint64_t v9 = *(void *)(a1[7] + 8);
    id v10 = v7;
    uint64_t v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    uint64_t v12 = a1[4];
    uint64_t v11 = [v14 data];
    id v13 = [v14 matchInfo];
    (*(void (**)(uint64_t, void *, void *, uint64_t))(v12 + 16))(v12, v11, v13, a3);
  }
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = a3;
}

- (id)identifierWithError:(id *)a3
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_identifierWithReply_ error:a3];
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return [(CNXPCDataMapper *)self executeSaveRequest:a3 response:0 authorizationContext:0 error:a4];
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  if (self && self->_serviceConnection)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__CNXPCDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke;
    v18[3] = &unk_1E56B4A28;
    v18[4] = &v35;
    v18[5] = &v31;
    v18[6] = &v25;
    v18[7] = &v19;
    uint64_t v11 = _Block_copy(v18);
    uint64_t v12 = self->_serviceProxy;
    [(CNXPCDataMapperService *)v12 executeSaveRequest:v9 withReply:v11];

    if (*((unsigned char *)v32 + 24))
    {
      if (*((unsigned char *)v36 + 24)) {
        [(id)v20[5] applySnapshotsToSaveRequest:v9];
      }
    }
    else
    {
      uint64_t v13 = +[CNErrorFactory errorWithCode:1 userInfo:0];
      id v14 = (void *)v26[5];
      v26[5] = v13;

      *((unsigned char *)v36 + 24) = 0;
    }
  }
  else
  {
    uint64_t v15 = +[CNErrorFactory errorWithCode:100 userInfo:0];
    uint64_t v11 = (void *)v26[5];
    v26[5] = v15;
  }

  int v16 = *((unsigned __int8 *)v36 + 24);
  if (a6 && !*((unsigned char *)v36 + 24)) {
    *a6 = (id) v26[5];
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v16 != 0;
}

void __74__CNXPCDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  id v10 = a4;
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (!self || !self->_serviceConnection)
  {
    uint64_t v11 = +[CNErrorFactory errorWithCode:100 userInfo:0];
    v10[2](v10, v11);
  }
  if (self) {
    keyboardStateMonitor = self->_keyboardStateMonitor;
  }
  else {
    keyboardStateMonitor = 0;
  }
  ensureFetchRequestHasKeyboardState(v8, keyboardStateMonitor);
  uint64_t v13 = [[CNXPCDataMapperProgressiveHandler alloc] initWithProgressBlock:v9 completionBlock:v10];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__5;
  uint64_t v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  if (self) {
    serviceProxy = self->_serviceProxy;
  }
  else {
    serviceProxy = 0;
  }
  uint64_t v15 = serviceProxy;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__CNXPCDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke;
  v21[3] = &unk_1E56B4A50;
  void v21[4] = &v22;
  [(CNXPCDataMapperService *)v15 progressiveContactsForFetchRequest:v8 progressHandler:v13 reply:v21];

  if (v23[5])
  {
    objc_msgSend(MEMORY[0x1E4F5A368], "tokenWrappingCancelable:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__CNXPCDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_2;
    v19[3] = &unk_1E56B4530;
    uint64_t v20 = v13;
    [v16 addCancelationBlock:v19];
  }
  else
  {
    if (v10)
    {
      id v17 = +[CNErrorFactory errorWithCode:1 userInfo:0];
      v10[2](v10, v17);
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  }
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __69__CNXPCDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1, void *a2)
{
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_containersMatchingPredicate_withReply_ param1:a3 error:a4];
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_serverSearchContainersMatchingPredicate_withReply_ param1:a3 error:a4];
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(CNPolicyDescription);
  [(CNPolicyDescription *)v7 setContainerIdentifier:v6];

  id v8 = [(CNXPCDataMapper *)self policyWithDescription:v7 error:a4];

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v7 = serviceConnection;
  id v8 = [a3 containerIdentifier];
  id v9 = [(CNXPCConnection *)v7 remoteResultForSelector:sel_policyForContainerWithIdentifier_withReply_ param1:v8 error:a4];

  return v9;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_accountsMatchingPredicate_withReply_ param1:a3 error:a4];
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_groupsMatchingPredicate_withReply_ param1:a3 error:a4];
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_subgroupsOfGroupWithIdentifier_withReply_ param1:a3 error:a4];
}

- (id)defaultContainerIdentifier
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_defaultContainerIdentifierWithReply_ error:0];
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  id v4 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_setMeContact_withReply_ param1:a3 error:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  char v5 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_setMeContact_forContainer_withReply_ param1:a3 param2:a4 error:a5];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F28F50];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 weakObjectsPointerArray];
  [v14 addPointer:v13];

  [v14 addPointer:v12];
  [v14 addPointer:v11];

  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v16 = [(CNXPCConnection *)serviceConnection remoteResultForSelector:sel_setBestMeIfNeededForGivenName_familyName_email_withReply_ parameters:v14 error:a6];
  char v17 = [v16 BOOLValue];

  return v17;
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self && self->_serviceConnection)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__5;
    id v16 = __Block_byref_object_dispose__5;
    id v17 = 0;
    id v8 = self->_serviceProxy;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__CNXPCDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke;
    v11[3] = &unk_1E56B4A78;
    v11[4] = &v12;
    [(CNXPCDataMapperService *)v8 contactWithUserActivityUserInfo:v6 keysToFetch:v7 withReply:v11];

    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __63__CNXPCDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
}

- (id)userActivityUserInfoForContact:(id)a3
{
  id v4 = a3;
  if (self && self->_serviceConnection)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__5;
    id v13 = __Block_byref_object_dispose__5;
    id v14 = 0;
    char v5 = self->_serviceProxy;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__CNXPCDataMapper_userActivityUserInfoForContact___block_invoke;
    v8[3] = &unk_1E56B4AA0;
    void v8[4] = &v9;
    [(CNXPCDataMapperService *)v5 userActivityForContact:v4 withReply:v8];

    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __50__CNXPCDataMapper_userActivityUserInfoForContact___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  char v5 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ param1:a3 param2:a4 error:a5];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  char v5 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_ param1:a3 param2:a4 error:a5];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_changeHistoryWithFetchRequest_withReply_ param1:a3 error:a4];
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  id v4 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_executeChangeHistoryClearRequest_withReply_ param1:a3 error:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)currentHistoryToken
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v8 = 0;
  id v3 = serviceConnection;
  id v4 = [(CNXPCConnection *)v3 remoteResultForSelector:sel_currentHistoryTokenWithReply_ error:&v8];
  id v5 = v8;

  char v6 = (*(void (**)(void))(*MEMORY[0x1E4F5A2B0] + 16))();

  return v6;
}

- (id)currentHistoryAnchor
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v8 = 0;
  id v3 = serviceConnection;
  id v4 = [(CNXPCConnection *)v3 remoteResultForSelector:sel_currentHistoryAnchorWithReply_ error:&v8];
  id v5 = v8;

  char v6 = [MEMORY[0x1E4F5A4E0] resultWithValue:v4 orError:v5];

  return v6;
}

- (id)favoritesEntryDictionariesAtPath:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_favoritesEntryDictionariesAtPath_withReply_ param1:a3 error:a4];
}

- (BOOL)writeFavoritesPropertyListData:(id)a3 toPath:(id)a4 error:(id *)a5
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  id v5 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_writeFavoritesPropertyListData_toPath_withReply_ param1:a3 param2:a4 error:a5];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_authorizedKeysForContactKeys_withReply_ param1:a3 error:a4];
}

- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_getBackgroundColorOnImageData_bitmapFormat_withReply_ param1:a3 param2:a4 error:a5];
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v9 = 0;
  id v5 = serviceConnection;
  char v6 = [(CNXPCConnection *)v5 remoteResultForSelector:sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_ param1:a3 error:&v9];
  id v7 = v9;

  return v6;
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v11 = 0;
  id v7 = serviceConnection;
  id v8 = [(CNXPCConnection *)v7 remoteResultForSelector:sel_addLimitedAccessForBundle_contactIdentifier_withReply_ param1:a3 param2:a4 error:&v11];
  id v9 = v11;

  if (v9)
  {
    objc_opt_class();
    id v10 = +[CNXPCDataMapper os_log]();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNXPCDataMapper addLimitedAccessForBundle:contactIdentifier:]();
    }
  }
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v11 = 0;
  id v7 = serviceConnection;
  id v8 = [(CNXPCConnection *)v7 remoteResultForSelector:sel_addLimitedAccessForBundle_contactIdentifiers_withReply_ param1:a3 param2:a4 error:&v11];
  id v9 = v11;

  if (v9)
  {
    objc_opt_class();
    id v10 = +[CNXPCDataMapper os_log]();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNXPCDataMapper addLimitedAccessForBundle:contactIdentifier:]();
    }
  }
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v11 = 0;
  id v7 = serviceConnection;
  id v8 = [(CNXPCConnection *)v7 remoteResultForSelector:sel_removeLimitedAccessForBundle_contactIdentifier_withReply_ param1:a3 param2:a4 error:&v11];
  id v9 = v11;

  if (v9)
  {
    objc_opt_class();
    id v10 = +[CNXPCDataMapper os_log]();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNXPCDataMapper removeLimitedAccessForBundle:contactIdentifier:]();
    }
  }
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v11 = 0;
  id v7 = serviceConnection;
  id v8 = [(CNXPCConnection *)v7 remoteResultForSelector:sel_removeLimitedAccessForBundle_contactIdentifiers_withReply_ param1:a3 param2:a4 error:&v11];
  id v9 = v11;

  if (v9)
  {
    objc_opt_class();
    id v10 = +[CNXPCDataMapper os_log]();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNXPCDataMapper removeLimitedAccessForBundle:contactIdentifier:]();
    }
  }
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v9 = 0;
  id v5 = serviceConnection;
  id v6 = [(CNXPCConnection *)v5 remoteResultForSelector:sel_purgeLimitedAccessRecordsForBundle_withReply_ param1:a3 error:&v9];
  id v7 = v9;

  if (v7)
  {
    objc_opt_class();
    id v8 = +[CNXPCDataMapper os_log]();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNXPCDataMapper purgeLimitedAccessRecordsForBundle:]();
    }
  }
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v9 = 0;
  id v5 = serviceConnection;
  id v6 = [(CNXPCConnection *)v5 remoteResultForSelector:sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_ param1:a3 error:&v9];
  id v7 = v9;

  return v6;
}

- (void)updateLimitedAccessTable:(id)a3
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v8 = 0;
  id v5 = serviceConnection;
  id v6 = [(CNXPCConnection *)v5 remoteResultForSelector:sel_updateLimitedAccessTable_withReply_ param1:a3 error:&v8];
  id v7 = v8;
}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  return (id)[(CNXPCDataMapper *)self remoteResultForSelector:sel_getLimitedAccessLastSyncSequenceNumber_ error:a3];
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v9 = 0;
  id v5 = serviceConnection;
  id v6 = [(CNXPCConnection *)v5 remoteResultForSelector:sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_ param1:a3 error:&v9];
  id v7 = v9;

  return v6;
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v8 = 0;
  id v5 = serviceConnection;
  id v6 = [(CNXPCConnection *)v5 remoteResultForSelector:sel_applyLimitedAccessSyncEvents_withReply_ param1:a3 error:&v8];
  id v7 = v8;
}

- (void)dropAllLimitedAccessRows
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v6 = 0;
  id v3 = serviceConnection;
  id v4 = [(CNXPCConnection *)v3 remoteResultForSelector:sel_dropAllLimitedAccessRowsWithReply_ error:&v6];
  id v5 = v6;
}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v6 = 0;
  id v3 = serviceConnection;
  id v4 = [(CNXPCConnection *)v3 remoteResultForSelector:sel_dropAllLimitedAccessRowsAndSyncNotifyWithReply_ error:&v6];
  id v5 = v6;
}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  if (self) {
    serviceConnection = self->_serviceConnection;
  }
  else {
    serviceConnection = 0;
  }
  id v8 = 0;
  id v5 = serviceConnection;
  id v6 = [(CNXPCConnection *)v5 remoteResultForSelector:sel_setLimitedAccessTableCurrentSequenceNumber_withReply_ param1:a3 error:&v8];
  id v7 = v8;
}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  id v3 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_shouldAnalyzeDatabaseWithReply_ error:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  if (self) {
    self = (CNXPCDataMapper *)self->_serviceConnection;
  }
  id v3 = [(CNXPCDataMapper *)self remoteResultForSelector:sel_analyzeDatabaseWithReply_ error:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardStateMonitor, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Fetch error", v1, 2u);
}

- (void)addLimitedAccessForBundle:contactIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "addLimitedAccessForBundle error: %@", v2, v3, v4, v5, v6);
}

- (void)removeLimitedAccessForBundle:contactIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "removeLimitedAccessForBundle error: %@", v2, v3, v4, v5, v6);
}

- (void)purgeLimitedAccessRecordsForBundle:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "purgeLimitedAccessRecordsForBundle error: %@", v2, v3, v4, v5, v6);
}

@end