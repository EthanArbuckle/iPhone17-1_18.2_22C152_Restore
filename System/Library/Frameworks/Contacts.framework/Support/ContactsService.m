@interface ContactsService
+ (Class)dataMapperClassForConnection:(id)a3;
+ (id)managedConfigurationForConnection:(id)a3;
- (BOOL)clientAllowedToUseSPI:(id *)a3;
- (BOOL)shouldNotReportFavoritesError:(id)a3;
- (CNAccessAuthorization)accessAuthorization;
- (CNContactProviderSupportManager)contactProviderManager;
- (CNContactStore)contactStore;
- (CNContactsEnvironment)environment;
- (CNContactsLogger)logger;
- (CNDataMapperConfiguration)dataMapperConfiguration;
- (CNQueryAnalyticsLogger)queryAnalyticsLogger;
- (CNRegulatoryLogger)regulatoryLogger;
- (CNScheduler)highPriorityWorkQueue;
- (CNScheduler)workQueue;
- (CNUIImageRemoteBackgroundColorAnalyzer)backgroundColorAnalyzer;
- (CNiOSAddressBookDataMapper)dataMapper;
- (ContactsService)initWithDataMapper:(id)a3 dataMapperConfiguration:(id)a4 workQueue:(id)a5 highPriorityWorkQueue:(id)a6 connection:(id)a7 accessAuthorization:(id)a8;
- (ContactsService)initWithWorkQueue:(id)a3 highPriorityWorkQueue:(id)a4 connection:(id)a5;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)backgroundColorQueue;
- (OS_tcc_identity)assumedIdentity;
- (id)_bestWorkQueueForAuditToken:(id *)a3;
- (id)unitTestBaseURLWithOptions:(id)a3;
- (void)accountsMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4 withReply:(id)a5;
- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4 withReply:(id)a5;
- (void)analyzeDatabaseWithReply:(id)a3;
- (void)authorizedKeysForContactKeys:(id)a3 withReply:(id)a4;
- (void)bestSenderIdentityForHandle:(id)a3 withReply:(id)a4;
- (void)changeHistoryWithFetchRequest:(id)a3 withReply:(id)a4;
- (void)configureAssumedIdentityWithOptions:(id)a3;
- (void)configureServiceWithOptions:(id)a3;
- (void)configureUnitTestWithOptions:(id)a3;
- (void)contactCountForFetchRequest:(id)a3 withReply:(id)a4;
- (void)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4 withReply:(id)a5;
- (void)contactsForFetchRequest:(id)a3 withMatchInfoReply:(id)a4;
- (void)containersMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)currentHistoryAnchorWithReply:(id)a3;
- (void)currentHistoryTokenWithReply:(id)a3;
- (void)defaultContainerIdentifierWithReply:(id)a3;
- (void)dropAllLimitedAccessRowsAndSyncNotifyWithReply:(id)a3;
- (void)encodedContactsAndCursorForFetchRequest:(id)a3 withReply:(id)a4;
- (void)executeChangeHistoryClearRequest:(id)a3 withReply:(id)a4;
- (void)executeSaveRequest:(id)a3 withReply:(id)a4;
- (void)favoritesEntryDictionariesAtPath:(id)a3 withReply:(id)a4;
- (void)fetchLimitedAccessContactIdentifiersForBundle:(id)a3 withReply:(id)a4;
- (void)geminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 withReply:(id)a5;
- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 withReply:(id)a5;
- (void)getLimitedAccessContactsCountForBundle:(id)a3 withReply:(id)a4;
- (void)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3 withReply:(id)a4;
- (void)groupsMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)identifierWithReply:(id)a3;
- (void)meContactIdentifiersWithReply:(id)a3;
- (void)performAsyncWorkWithDataMapper:(id)a3;
- (void)performServicingRequestWork:(id)a3;
- (void)performWorkServicingSPI:(id)a3 authenticationFailureHandler:(id)a4;
- (void)performWorkWithContactStore:(id)a3;
- (void)performWorkWithDataMapper:(id)a3;
- (void)policyForContainerWithIdentifier:(id)a3 withReply:(id)a4;
- (void)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3 withReply:(id)a4;
- (void)progressiveContactsForFetchRequest:(id)a3 progressHandler:(id)a4 reply:(id)a5;
- (void)purgeLimitedAccessRecordsForBundle:(id)a3 withReply:(id)a4;
- (void)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 withReply:(id)a4;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4 withReply:(id)a5;
- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4 withReply:(id)a5;
- (void)reportFavoritesIssue:(id)a3;
- (void)sectionListOffsetsForSortOrder:(int64_t)a3 reply:(id)a4;
- (void)serverSearchContainersMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)setAssumedIdentity:(id)a3;
- (void)setBackgroundColorAnalyzer:(id)a3;
- (void)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 withReply:(id)a6;
- (void)setDataMapper:(id)a3;
- (void)setDefaultAccountIdentifier:(id)a3 withReply:(id)a4;
- (void)setMeContact:(id)a3 forContainer:(id)a4 withReply:(id)a5;
- (void)setMeContact:(id)a3 withReply:(id)a4;
- (void)setQueryAnalyticsLogger:(id)a3;
- (void)setRegulatoryLogger:(id)a3;
- (void)shouldAnalyzeDatabaseWithReply:(id)a3;
- (void)subgroupsOfGroupWithIdentifier:(id)a3 withReply:(id)a4;
- (void)unifiedContactCountWithReply:(id)a3;
- (void)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5;
- (void)userActivityForContact:(id)a3 withReply:(id)a4;
- (void)verifyIndexWithReply:(id)a3;
- (void)writeFavoritesPropertyListData:(id)a3 toPath:(id)a4 withReply:(id)a5;
@end

@implementation ContactsService

- (ContactsService)initWithWorkQueue:(id)a3 highPriorityWorkQueue:(id)a4 connection:(id)a5
{
  id v21 = a3;
  id v20 = a4;
  id v8 = a5;
  v9 = v8;
  long long v23 = 0u;
  long long v24 = 0u;
  if (v8) {
    [v8 auditToken];
  }
  v22[0] = v23;
  v22[1] = v24;
  v10 = +[CNAuditToken auditToken:v22];
  v19 = +[CNContactsEnvironment currentEnvironment];
  v11 = [(id)objc_opt_class() managedConfigurationForConnection:v9];
  id v12 = [objc_alloc((Class)CNAccessAuthorization) initWithAuditToken:v10];
  id v13 = [objc_alloc((Class)CNContactProviderSupportManager) initWithAuditToken:v10];
  id v14 = objc_alloc_init((Class)CNDataMapperConfiguration);
  [v14 setEnvironment:v19];
  [v14 setManagedConfiguration:v11];
  [v14 setIdentifierAuditMode:1];
  v15 = [v12 authorizer];
  [v14 setAuthorizationContext:v15];

  [v14 setContactProviderManager:v13];
  id v16 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "dataMapperClassForConnection:", v9)), "initWithConfiguration:", v14);
  v17 = [(ContactsService *)self initWithDataMapper:v16 dataMapperConfiguration:v14 workQueue:v21 highPriorityWorkQueue:v20 connection:v9 accessAuthorization:v12];

  return v17;
}

- (ContactsService)initWithDataMapper:(id)a3 dataMapperConfiguration:(id)a4 workQueue:(id)a5 highPriorityWorkQueue:(id)a6 connection:(id)a7 accessAuthorization:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v38 = a5;
  id v37 = a6;
  id v17 = a7;
  id v36 = a8;
  v40.receiver = self;
  v40.super_class = (Class)ContactsService;
  v18 = [(ContactsService *)&v40 init];
  if (v18)
  {
    v19 = [v16 environment];
    objc_storeStrong((id *)&v18->_dataMapper, a3);
    id v20 = (CNContactStore *)[objc_alloc((Class)CNDataMapperContactStore) initWithDataMapper:v15 dataMapperConfiguration:v16];
    contactStore = v18->_contactStore;
    v18->_contactStore = v20;

    objc_storeStrong((id *)&v18->_workQueue, a5);
    objc_storeStrong((id *)&v18->_highPriorityWorkQueue, a6);
    v22 = [v19 loggerProvider];
    uint64_t v23 = [v22 contactsLogger];
    logger = v18->_logger;
    v18->_logger = (CNContactsLogger *)v23;

    objc_storeStrong((id *)&v18->_environment, v19);
    objc_storeWeak((id *)&v18->_connection, v17);
    objc_storeStrong((id *)&v18->_accessAuthorization, a8);
    uint64_t v25 = [v16 contactProviderManager];
    contactProviderManager = v18->_contactProviderManager;
    v18->_contactProviderManager = (CNContactProviderSupportManager *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("contactsBackgroundColorQueue", 0);
    backgroundColorQueue = v18->_backgroundColorQueue;
    v18->_backgroundColorQueue = (OS_dispatch_queue *)v27;

    if (v17) {
      [v17 auditToken];
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    v29 = +[CNAuditToken auditToken:v39];
    v30 = (CNRegulatoryLogger *)[objc_alloc((Class)CNRegulatoryLogger) initWithAuditToken:v29 assumedIdentity:0];
    regulatoryLogger = v18->_regulatoryLogger;
    v18->_regulatoryLogger = v30;

    v32 = (CNQueryAnalyticsLogger *)[objc_alloc((Class)CNQueryAnalyticsLogger) initWithAuditToken:v29 assumedIdentity:0];
    queryAnalyticsLogger = v18->_queryAnalyticsLogger;
    v18->_queryAnalyticsLogger = v32;

    objc_storeStrong((id *)&v18->_dataMapperConfiguration, a4);
    v34 = v18;
  }
  return v18;
}

+ (id)managedConfigurationForConnection:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[CNContactProviderSupportManager isConnectionForContactProvider:v3];
  id v5 = [objc_alloc((Class)CNManagedConfiguration) initForContactProvider];
  id v6 = v5;
  if ((v4 & 1) == 0)
  {

    id v7 = objc_alloc((Class)CNManagedConfiguration);
    if (v3)
    {
      [v3 auditToken];
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }
    id v8 = +[CNManagedProfileConnection sharedConnection];
    id v6 = [v7 initWithAuditToken:&v10 managedProfileConnection:v8];
  }

  return v6;
}

+ (Class)dataMapperClassForConnection:(id)a3
{
  unsigned int v3 = +[CNContactProviderSupportManager isConnectionForContactProvider:a3];
  unsigned __int8 v4 = objc_opt_class();
  if (v3)
  {
    id v5 = v4;
  }
  else
  {
    objc_opt_class();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v5;
}

- (void)configureServiceWithOptions:(id)a3
{
  id v4 = a3;
  [(ContactsService *)self configureUnitTestWithOptions:v4];
  [(ContactsService *)self configureAssumedIdentityWithOptions:v4];
}

- (void)configureUnitTestWithOptions:(id)a3
{
  id v4 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = [(ContactsService *)self connection];
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }

  id v7 = +[CNEnvironment currentEnvironment];
  id v8 = [v7 entitlementVerifier];
  long long v38 = v40;
  long long v39 = v41;
  unsigned int v9 = [v8 auditToken:&v38 hasBooleanEntitlement:CNEntitlementNameContactsServiceProxyConfigurable error:0];

  if (v9)
  {
    long long v10 = [(ContactsService *)self unitTestBaseURLWithOptions:v4];
    if (v10)
    {
      long long v38 = v40;
      long long v39 = v41;
      uint64_t v11 = +[CNAuditToken auditToken:&v38];
      id v12 = objc_alloc((Class)CNContactsEnvironment);
      id v13 = [(ContactsService *)self environment];
      id v14 = [v13 schedulerProvider];
      id v15 = [(ContactsService *)self environment];
      id v16 = [v15 loggerProvider];
      id v17 = [v12 initWithSchedulerProvider:v14 loggerProvider:v16];

      id v36 = v17;
      [v17 setBaseURL:v10];
      v18 = objc_opt_class();
      v19 = [(ContactsService *)self connection];
      v35 = [v18 managedConfigurationForConnection:v19];

      id v37 = (void *)v11;
      id v20 = [objc_alloc((Class)CNAccessAuthorization) initWithAuditToken:v11];
      id v34 = [objc_alloc((Class)CNContactProviderSupportManager) initWithAuditToken:v11];
      id v21 = objc_alloc_init((Class)CNDataMapperConfiguration);
      [v21 setEnvironment:v17];
      [v21 setManagedConfiguration:v35];
      v22 = [v20 authorizer];
      [v21 setAuthorizationContext:v22];

      [v21 setContactProviderManager:v34];
      uint64_t v23 = objc_opt_class();
      long long v24 = [(ContactsService *)self connection];
      uint64_t v25 = (objc_class *)[v23 dataMapperClassForConnection:v24];

      id v26 = [[v25 alloc] initWithConfiguration:v21];
      dispatch_queue_t v27 = [ContactsService alloc];
      v28 = [(ContactsService *)self workQueue];
      v29 = [(ContactsService *)self highPriorityWorkQueue];
      v30 = [(ContactsService *)self connection];
      v31 = [(ContactsService *)v27 initWithDataMapper:v26 dataMapperConfiguration:v21 workQueue:v28 highPriorityWorkQueue:v29 connection:v30 accessAuthorization:v20];

      v32 = self;
      v33 = [(ContactsService *)v32 connection];
      [v33 setExportedObject:v31];
    }
  }
}

- (id)unitTestBaseURLWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"CNiOSAddressBookDataMapperUnitTestPathKey"];
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = +[NSURL fileURLWithPath:v5];
  }
  else
  {
    id v7 = [v3 objectForKey:@"CNiOSAddressBookDataMapperUnitTestInMemoryStoreKey"];
    if ([v7 BOOLValue])
    {
      id v6 = +[CNContactsEnvironment inMemoryURL];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (void)configureAssumedIdentityWithOptions:(id)a3
{
  id v4 = [a3 objectForKey:@"CNAssumedIdentity"];
  if (v4)
  {
    id v5 = [(ContactsService *)self connection];
    id v6 = v5;
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v31, 0, sizeof(v31));
    }
    id v7 = +[CNAuditToken auditToken:v31];

    id v8 = [v4 identity];
    assumedIdentity = self->_assumedIdentity;
    self->_assumedIdentity = v8;

    id v10 = objc_alloc((Class)CNRegulatoryLogger);
    uint64_t v11 = [(ContactsService *)self assumedIdentity];
    id v12 = (CNRegulatoryLogger *)[v10 initWithAuditToken:v7 assumedIdentity:v11];
    regulatoryLogger = self->_regulatoryLogger;
    self->_regulatoryLogger = v12;

    id v14 = objc_alloc((Class)CNQueryAnalyticsLogger);
    id v15 = [(ContactsService *)self assumedIdentity];
    id v16 = (CNQueryAnalyticsLogger *)[v14 initWithAuditToken:v7 assumedIdentity:v15];
    queryAnalyticsLogger = self->_queryAnalyticsLogger;
    self->_queryAnalyticsLogger = v16;

    id v18 = objc_alloc((Class)CNAccessAuthorization);
    v19 = [(ContactsService *)self assumedIdentity];
    id v20 = (CNAccessAuthorization *)[v18 initWithAuditToken:v7 assumedIdentity:v19];

    accessAuthorization = self->_accessAuthorization;
    self->_accessAuthorization = v20;
    v22 = v20;

    uint64_t v23 = [(CNAccessAuthorization *)v22 authorizer];

    long long v24 = [(ContactsService *)self dataMapperConfiguration];
    [v24 setAuthorizationContext:v23];

    uint64_t v25 = objc_opt_class();
    id v26 = [(ContactsService *)self connection];
    dispatch_queue_t v27 = (objc_class *)[v25 dataMapperClassForConnection:v26];

    id v28 = [v27 alloc];
    v29 = [(ContactsService *)self dataMapperConfiguration];
    id v30 = [v28 initWithConfiguration:v29];

    [(ContactsService *)self setDataMapper:v30];
  }
}

- (BOOL)clientAllowedToUseSPI:(id *)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(ContactsService *)self connection];
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }

  id v7 = +[CNEnvironment currentEnvironment];
  id v8 = [v7 entitlementVerifier];
  id v26 = 0;
  long long buffer = v27;
  long long v32 = v28;
  unsigned __int8 v9 = [v8 auditToken:&buffer hasBooleanEntitlement:CNEntitlementNameContactsFrameworkSPI error:&v26];
  id v10 = v26;

  if (v9)
  {
    LOBYTE(v11) = 1;
    if (v10)
    {
LABEL_6:
      v29[0] = NSUnderlyingErrorKey;
      v29[1] = NSLocalizedFailureReasonErrorKey;
      v30[0] = v10;
      v30[1] = @"Couldn't check if caller had private entitlement";
      id v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
      goto LABEL_14;
    }
  }
  else
  {
    id v13 = +[CNEnvironment currentEnvironment];
    id v14 = [v13 entitlementVerifier];
    id v25 = 0;
    long long buffer = v27;
    long long v32 = v28;
    unsigned int v11 = [v14 auditToken:&buffer isFirstOrSecondPartyWithError:&v25];
    id v15 = v25;

    id v16 = [(ContactsService *)self connection];
    id v17 = [v16 processIdentifier];

    if (v11)
    {
      id v18 = [(ContactsService *)self logger];
      [v18 SPIUsageLackingEntitlementGrantedForPID:v17];
    }
    else
    {
      if (v15)
      {
        v19 = [(ContactsService *)self logger];
        [v19 internalError:v15];
      }
      id v20 = [(ContactsService *)self logger];
      [v20 SPIUsageLackingEntitlementRejectedForPID:v17];

      long long v43 = xmmword_10001B838;
      long long v44 = unk_10001B848;
      memset(v45, 0, sizeof(v45));
      long long v39 = xmmword_10001B7F8;
      long long v40 = unk_10001B808;
      long long v41 = xmmword_10001B818;
      long long v42 = unk_10001B828;
      long long v35 = xmmword_10001B7B8;
      long long v36 = unk_10001B7C8;
      long long v37 = xmmword_10001B7D8;
      long long v38 = unk_10001B7E8;
      long long buffer = *(_OWORD *)"<unknown>";
      long long v32 = unk_10001B788;
      long long v33 = xmmword_10001B798;
      long long v34 = unk_10001B7A8;
      proc_name((int)v17, &buffer, 0xFFu);
      +[NSString stringWithFormat:@"Contacts client is attempting to use SPI without authorization: %s", &buffer];
      ABLogSimulateCrashReport();
    }

    if (v10) {
      goto LABEL_6;
    }
  }
  id v12 = 0;
LABEL_14:
  id v21 = +[CNErrorFactory errorWithCode:100 userInfo:v12];
  v22 = v21;
  if (a3) {
    char v23 = v11;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0) {
    *a3 = v21;
  }

  return v11;
}

- (void)performWorkWithDataMapper:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003DF8;
  v5[3] = &unk_100024670;
  id v6 = a3;
  id v4 = v6;
  [(ContactsService *)self performAsyncWorkWithDataMapper:v5];
}

- (void)performAsyncWorkWithDataMapper:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003F1C;
  v4[3] = &unk_100024698;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performServicingRequestWork:v4];
}

- (void)performWorkWithContactStore:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004044;
  v4[3] = &unk_100024698;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performServicingRequestWork:v4];
}

- (id)_bestWorkQueueForAuditToken:(id *)a3
{
  id v5 = +[CNEnvironment currentEnvironment];
  id v6 = [v5 entitlementVerifier];
  id v16 = 0;
  long long v7 = *(_OWORD *)&a3->var0[4];
  v15[0] = *(_OWORD *)a3->var0;
  v15[1] = v7;
  unsigned int v8 = [v6 auditToken:v15 allowsHighPriorityWithError:&v16];
  id v9 = v16;

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    if (v9)
    {
      unsigned int v11 = [(ContactsService *)self logger];
      [v11 serviceError:v9];
    }
    uint64_t v12 = [(ContactsService *)self workQueue];
  }
  else
  {
    uint64_t v12 = [(ContactsService *)self highPriorityWorkQueue];
  }
  id v13 = (void *)v12;

  return v13;
}

- (void)performServicingRequestWork:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100004364;
  id v17 = sub_100004374;
  id v18 = +[CNInhibitor os_transactionInhibitorWithLabel:@"com.apple.contactsd.ContactsService"];
  [(id)v14[5] start];
  id v5 = [(ContactsService *)self connection];
  id v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  long long v7 = [(ContactsService *)self _bestWorkQueueForAuditToken:v12];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000437C;
  v9[3] = &unk_100024710;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  unsigned int v11 = &v13;
  [v7 performBlock:v9];

  _Block_object_dispose(&v13, 8);
}

- (void)performWorkServicingSPI:(id)a3 authenticationFailureHandler:(id)a4
{
  id v6 = (void (**)(void))a3;
  long long v7 = (void (**)(id, id))a4;
  id v10 = 0;
  unsigned int v8 = [(ContactsService *)self clientAllowedToUseSPI:&v10];
  id v9 = v10;
  if (v8) {
    v6[2](v6);
  }
  else {
    v7[2](v7, v9);
  }
}

- (void)unifiedContactCountWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000468C;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (void)contactCountForFetchRequest:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004828;
  v9[3] = &unk_100024788;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004958;
  v7[3] = &unk_1000247B0;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  [(ContactsService *)v10 performWorkServicingSPI:v9 authenticationFailureHandler:v7];
}

- (void)sectionListOffsetsForSortOrder:(int64_t)a3 reply:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004A84;
  v10[3] = &unk_100024800;
  v10[4] = self;
  int64_t v12 = a3;
  id v5 = a4;
  id v11 = v5;
  id v6 = objc_retainBlock(v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004BA0;
  v8[3] = &unk_1000247B0;
  id v9 = v5;
  id v7 = v5;
  [(ContactsService *)self performWorkServicingSPI:v6 authenticationFailureHandler:v8];
}

- (void)contactsForFetchRequest:(id)a3 withMatchInfoReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004D90;
  v18[3] = &unk_100024788;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v10 = objc_retainBlock(v18);
  id v11 = [(ContactsService *)self queryAnalyticsLogger];
  [v11 recordQueryWithFetchRequest:v8];

  if ([v8 requiresMeContactAuthorization])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004F34;
    v16[3] = &unk_1000247B0;
    int64_t v12 = &v17;
    id v17 = v9;
    [(ContactsService *)self performWorkServicingSPI:v10 authenticationFailureHandler:v16];
  }
  else
  {
    uint64_t v13 = [(ContactsService *)self accessAuthorization];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100004F50;
    v14[3] = &unk_1000247B0;
    int64_t v12 = &v15;
    id v15 = v9;
    [v13 performWork:v10 authorizingFetchRequest:v8 failureHandler:v14];
  }
}

- (void)encodedContactsAndCursorForFetchRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100005144;
  v18[3] = &unk_100024788;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v10 = objc_retainBlock(v18);
  id v11 = [(ContactsService *)self queryAnalyticsLogger];
  [v11 recordQueryWithFetchRequest:v8];

  if ([v8 requiresMeContactAuthorization])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005430;
    v16[3] = &unk_1000247B0;
    int64_t v12 = &v17;
    id v17 = v9;
    [(ContactsService *)self performWorkServicingSPI:v10 authenticationFailureHandler:v16];
  }
  else
  {
    uint64_t v13 = [(ContactsService *)self accessAuthorization];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005454;
    v14[3] = &unk_1000247B0;
    int64_t v12 = &v15;
    id v15 = v9;
    [v13 performWork:v10 authorizingFetchRequest:v8 failureHandler:v14];
  }
}

- (void)progressiveContactsForFetchRequest:(id)a3 progressHandler:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = [(ContactsService *)self queryAnalyticsLogger];
  [v11 recordQueryWithFetchRequest:v8];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _OWORD v15[2] = sub_1000055A4;
  v15[3] = &unk_100024918;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = objc_alloc_init((Class)CNCancelationToken);
  id v12 = v18;
  id v13 = v9;
  id v14 = v8;
  [(ContactsService *)self performAsyncWorkWithDataMapper:v15];
  v10[2](v10, v12);
}

- (void)identifierWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005840;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (void)meContactIdentifiersWithReply:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000059B4;
  v6[3] = &unk_100024940;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005AC8;
  v4[3] = &unk_1000247B0;
  id v5 = v8;
  id v3 = v8;
  [(ContactsService *)v7 performWorkServicingSPI:v6 authenticationFailureHandler:v4];
}

- (void)executeSaveRequest:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005BA0;
  v7[3] = &unk_100024968;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithContactStore:v7];
}

- (void)containersMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005D38;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)serverSearchContainersMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005E80;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)policyForContainerWithIdentifier:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005FC8;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)accountsMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006110;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)groupsMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006258;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)subgroupsOfGroupWithIdentifier:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000063A0;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)defaultContainerIdentifierWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000064BC;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (void)setDefaultAccountIdentifier:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006648;
  v9[3] = &unk_100024788;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006764;
  v7[3] = &unk_1000247B0;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  [(ContactsService *)v10 performWorkServicingSPI:v9 authenticationFailureHandler:v7];
}

- (void)setMeContact:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006894;
  v9[3] = &unk_100024788;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006938;
  v7[3] = &unk_1000247B0;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  [(ContactsService *)v10 performWorkServicingSPI:v9 authenticationFailureHandler:v7];
}

- (void)setMeContact:(id)a3 forContainer:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_100006A8C;
  v12[3] = &unk_1000249B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006BD4;
  v10[3] = &unk_1000247B0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(ContactsService *)v13 performWorkServicingSPI:v12 authenticationFailureHandler:v10];
}

- (void)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 withReply:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _OWORD v15[2] = sub_100006D50;
  v15[3] = &unk_100024A08;
  id v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006EB0;
  v13[3] = &unk_1000247B0;
  id v14 = v20;
  id v9 = v20;
  id v10 = v19;
  id v11 = v18;
  id v12 = v17;
  [(ContactsService *)v16 performWorkServicingSPI:v15 authenticationFailureHandler:v13];
}

- (void)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007004;
  v14[3] = &unk_100024A58;
  void v14[4] = self;
  id v16 = a4;
  id v17 = a5;
  id v15 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_100007138;
  v12[3] = &unk_1000248C8;
  void v12[4] = self;
  id v13 = v17;
  id v9 = v17;
  id v10 = v16;
  id v11 = v8;
  [(ContactsService *)self performWorkServicingSPI:v14 authenticationFailureHandler:v12];
}

- (void)userActivityForContact:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000072C4;
  v9[3] = &unk_100024AA8;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000073E4;
  v7[3] = &unk_1000248C8;
  void v7[4] = v10;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  [(ContactsService *)v10 performWorkServicingSPI:v9 authenticationFailureHandler:v7];
}

- (void)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_100007594;
  v12[3] = &unk_1000249B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000076DC;
  v10[3] = &unk_1000247B0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(ContactsService *)v13 performWorkServicingSPI:v12 authenticationFailureHandler:v10];
}

- (void)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_100007830;
  v12[3] = &unk_1000249B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007978;
  v10[3] = &unk_1000247B0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(ContactsService *)v13 performWorkServicingSPI:v12 authenticationFailureHandler:v10];
}

- (void)changeHistoryWithFetchRequest:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007A50;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)executeChangeHistoryClearRequest:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007BF0;
  v9[3] = &unk_100024788;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007D24;
  v7[3] = &unk_1000247B0;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  [(ContactsService *)v10 performWorkServicingSPI:v9 authenticationFailureHandler:v7];
}

- (void)currentHistoryTokenWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007DD0;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (void)currentHistoryAnchorWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007F04;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (void)reportFavoritesIssue:(id)a3
{
  id v3 = a3;
  ABDiagnosticsEnabled();
  _ABLog2();
  ABLogSimulateCrashReport();
  ABLogDisplayInternalAlert();
}

- (BOOL)shouldNotReportFavoritesError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v4, "code") == (id)260)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v7 = [v4 domain];
      if ([v7 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v4, "code") == (id)257)
      {
        BOOL v6 = 1;
      }
      else
      {
        id v8 = [v4 domain];
        if ([v8 isEqualToString:NSCocoaErrorDomain]) {
          BOOL v6 = [v4 code] == (id)513;
        }
        else {
          BOOL v6 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)favoritesEntryDictionariesAtPath:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000820C;
  v7[3] = &unk_100024940;
  id v8 = self;
  id v9 = a4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008410;
  v5[3] = &unk_1000247B0;
  id v6 = v9;
  id v4 = v9;
  [(ContactsService *)v8 performWorkServicingSPI:v7 authenticationFailureHandler:v5];
}

- (void)writeFavoritesPropertyListData:(id)a3 toPath:(id)a4 withReply:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008540;
  v10[3] = &unk_100024788;
  id v11 = self;
  id v12 = a3;
  id v13 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008788;
  v8[3] = &unk_1000247B0;
  id v9 = v13;
  id v6 = v13;
  id v7 = v12;
  [(ContactsService *)v11 performWorkServicingSPI:v10 authenticationFailureHandler:v8];
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 withReply:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008924;
  v10[3] = &unk_100024940;
  id v11 = a3;
  id v12 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000089E4;
  v8[3] = &unk_1000248C8;
  void v8[4] = self;
  id v9 = v12;
  id v6 = v12;
  id v7 = v11;
  [(ContactsService *)self performWorkServicingSPI:v10 authenticationFailureHandler:v8];
}

- (void)verifyIndexWithReply:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008B40;
  v7[3] = &unk_1000248F0;
  id v8 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008BCC;
  v5[3] = &unk_1000248C8;
  void v5[4] = self;
  id v6 = v8;
  id v4 = v8;
  [(ContactsService *)self performWorkServicingSPI:v7 authenticationFailureHandler:v5];
}

- (void)geminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 withReply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  id v10 = +[CNEnvironment currentEnvironment];
  id v11 = [v10 entitlementVerifier];
  id v12 = [(ContactsService *)self connection];
  id v13 = v12;
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  id v20 = 0;
  unsigned int v14 = [v11 auditToken:v21 hasBooleanEntitlement:CNEntitlementNameContactsDatabaseInProcess error:&v20];
  id v15 = v20;

  if (v14)
  {
    id v16 = objc_alloc_init((Class)CNGeminiManager);
    id v19 = 0;
    id v17 = [v16 geminiResultForContact:v8 substituteDefaultForDangling:v6 error:&v19];
    id v18 = v19;
  }
  else
  {
    if (v15)
    {
      v22[0] = NSUnderlyingErrorKey;
      v22[1] = NSLocalizedFailureReasonErrorKey;
      v23[0] = v15;
      v23[1] = @"Client not authorized";
      id v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    }
    else
    {
      id v16 = 0;
    }
    id v18 = +[CNErrorFactory errorWithCode:100 userInfo:v16];
    id v17 = 0;
  }

  v9[2](v9, v17, v18);
}

- (void)bestSenderIdentityForHandle:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = +[CNEnvironment currentEnvironment];
  id v9 = [v8 entitlementVerifier];
  id v10 = [(ContactsService *)self connection];
  id v11 = v10;
  if (v10) {
    [v10 auditToken];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  id v18 = 0;
  unsigned int v12 = [v9 auditToken:v19 hasBooleanEntitlement:CNEntitlementNameContactsDatabaseInProcess error:&v18];
  id v13 = v18;

  if (v12)
  {
    id v14 = objc_alloc_init((Class)CNGeminiManager);
    id v17 = 0;
    id v15 = [v14 bestSenderIdentityForHandle:v6 contactStore:0 error:&v17];
    id v16 = v17;
  }
  else
  {
    if (v13)
    {
      v20[0] = NSUnderlyingErrorKey;
      v20[1] = NSLocalizedFailureReasonErrorKey;
      v21[0] = v13;
      v21[1] = @"Client not authorized";
      id v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    }
    else
    {
      id v14 = 0;
    }
    id v16 = +[CNErrorFactory errorWithCode:100 userInfo:v14];
    id v15 = 0;
  }

  v7[2](v7, v15, v16);
}

- (void)authorizedKeysForContactKeys:(id)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = [(ContactsService *)self accessAuthorization];
  id v9 = [v8 authorizedKeysForContactKeys:v7];

  v6[2](v6, v9, 0);
}

- (CNUIImageRemoteBackgroundColorAnalyzer)backgroundColorAnalyzer
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIImageRemoteBackgroundColorAnalyzer *)v2;
}

- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ContactsService *)self backgroundColorQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _OWORD v15[2] = sub_100009358;
  v15[3] = &unk_1000249B8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)fetchLimitedAccessContactIdentifiersForBundle:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000964C;
  v9[3] = &unk_100024788;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000976C;
  v7[3] = &unk_1000247B0;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  [(ContactsService *)v10 performWorkServicingSPI:v9 authenticationFailureHandler:v7];
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_1000098C0;
  v12[3] = &unk_1000249B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000099DC;
  v10[3] = &unk_1000247B0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(ContactsService *)v13 performWorkServicingSPI:v12 authenticationFailureHandler:v10];
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_100009B30;
  v12[3] = &unk_1000249B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009C4C;
  v10[3] = &unk_1000247B0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(ContactsService *)v13 performWorkServicingSPI:v12 authenticationFailureHandler:v10];
}

- (void)getLimitedAccessContactsCountForBundle:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009D7C;
  v9[3] = &unk_100024788;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009E9C;
  v7[3] = &unk_1000247B0;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  [(ContactsService *)v10 performWorkServicingSPI:v9 authenticationFailureHandler:v7];
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_100009FF0;
  v12[3] = &unk_1000249B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A10C;
  v10[3] = &unk_1000247B0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(ContactsService *)v13 performWorkServicingSPI:v12 authenticationFailureHandler:v10];
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifiers:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _OWORD v12[2] = sub_10000A260;
  v12[3] = &unk_1000249B8;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A37C;
  v10[3] = &unk_1000247B0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  [(ContactsService *)v13 performWorkServicingSPI:v12 authenticationFailureHandler:v10];
}

- (void)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A454;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A58C;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A6B4;
  v7[3] = &unk_100024760;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ContactsService *)v8 performWorkWithDataMapper:v7];
}

- (void)dropAllLimitedAccessRowsAndSyncNotifyWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A7C8;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (void)shouldAnalyzeDatabaseWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A8C0;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (void)analyzeDatabaseWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AA0C;
  v4[3] = &unk_100024738;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ContactsService *)v5 performWorkWithDataMapper:v4];
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNiOSAddressBookDataMapper)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (CNDataMapperConfiguration)dataMapperConfiguration
{
  return self->_dataMapperConfiguration;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNScheduler)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (CNAccessAuthorization)accessAuthorization
{
  return self->_accessAuthorization;
}

- (CNRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (void)setRegulatoryLogger:(id)a3
{
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (void)setAssumedIdentity:(id)a3
{
}

- (CNContactProviderSupportManager)contactProviderManager
{
  return self->_contactProviderManager;
}

- (OS_dispatch_queue)backgroundColorQueue
{
  return self->_backgroundColorQueue;
}

- (void)setBackgroundColorAnalyzer:(id)a3
{
}

- (CNQueryAnalyticsLogger)queryAnalyticsLogger
{
  return self->_queryAnalyticsLogger;
}

- (void)setQueryAnalyticsLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_backgroundColorAnalyzer, 0);
  objc_storeStrong((id *)&self->_backgroundColorQueue, 0);
  objc_storeStrong((id *)&self->_contactProviderManager, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_accessAuthorization, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_highPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataMapperConfiguration, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_dataMapper, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end