@interface PDEndpointServer
- (BOOL)isInternalWithError:(id *)a3;
- (NSMapTable)observers;
- (NSMutableDictionary)statusReport;
- (PDClient)client;
- (PDDaemon)daemon;
- (PDDatabase)database;
- (PDEndpointServer)initWithClient:(id)a3 daemon:(id)a4;
- (id)_clientScopedPredicate:(id)a3 forEntityClass:(Class)a4;
- (id)_createHandoutAssignedItemFrom:(id)a3 withError:(id *)a4;
- (id)_createMainAppContext:(id *)a3;
- (id)userNotificationCenter;
- (int64_t)_authorizationStatusActivityWithID:(id)a3;
- (int64_t)_authorizationStatusForContext:(id)a3;
- (int64_t)_authorizationStatusForContextWithObjectID:(id)a3;
- (int64_t)_authorizationStatusForHandoutAssignedItem:(id)a3;
- (int64_t)_authorizationStatusForObject:(id)a3;
- (void)_invalidateObserver:(id)a3;
- (void)_performQuery:(id)a3 querySpecification:(id)a4 issueServerRequest:(BOOL)a5 completion:(id)a6;
- (void)databaseChanged:(id)a3;
- (void)dealloc;
- (void)entitled_publishCollaborationStateChanges:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)remote_accountChanged;
- (void)remote_addAdminRequestor:(id)a3 completion:(id)a4;
- (void)remote_addAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5;
- (void)remote_addAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5;
- (void)remote_addOrganization:(id)a3 withLocations:(id)a4 completion:(id)a5;
- (void)remote_authTreeForAttachment:(id)a3 withCompletion:(id)a4;
- (void)remote_authTreeWithCompletion:(id)a3;
- (void)remote_authorizationStatusForContextAtPath:(id)a3 completion:(id)a4;
- (void)remote_authorizationStatusForHandoutAssignedItem:(id)a3 completion:(id)a4;
- (void)remote_canSearchRostersWithCompletion:(id)a3;
- (void)remote_cloudKitThumbnailUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4;
- (void)remote_cloudKitUrlSuitableForOpeningForAsset:(id)a3 downloadObserver:(id)a4 completion:(id)a5;
- (void)remote_cloudKitUrlSuitableForStreamingAsset:(id)a3 downloadObserver:(id)a4 completion:(id)a5;
- (void)remote_collaborationStatesForObjectWithID:(id)a3 classID:(id)a4 forOwnersWithRole:(unint64_t)a5 completion:(id)a6;
- (void)remote_collaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4 completion:(id)a5;
- (void)remote_contextsMatchingIdentifierPath:(id)a3 parentContextID:(id)a4 completion:(id)a5;
- (void)remote_createShareIfNeededForURL:(id)a3 completion:(id)a4;
- (void)remote_currentUserContentStoreCacheDirectoryURLWithCompletion:(id)a3;
- (void)remote_currentUserWithCompletion:(id)a3;
- (void)remote_databasePathWithCompletion:(id)a3;
- (void)remote_deleteAdminRequestID:(id)a3 completion:(id)a4;
- (void)remote_deleteAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)remote_deleteBackingStoreForAsset:(id)a3 completion:(id)a4;
- (void)remote_deleteCollectionRelatedObjectsWithCompletion:(id)a3 completion:(id)a4;
- (void)remote_deleteOrganization:(id)a3 completion:(id)a4;
- (void)remote_deleteProgressReportingCapabilitiesForContextID:(id)a3 completion:(id)a4;
- (void)remote_deleteThumbnailBlobForContextID:(id)a3 completion:(id)a4;
- (void)remote_deregisterDataObserverWithID:(id)a3 completion:(id)a4;
- (void)remote_executeQuery:(id)a3 querySpecification:(id)a4 searchSpecification:(id)a5 issueServerRequest:(BOOL)a6 completion:(id)a7;
- (void)remote_featureIsEnabled:(int)a3 completion:(id)a4;
- (void)remote_fetchAndCompleteActiveAssignedActivitiesForContextPath:(id)a3 withCompletion:(id)a4;
- (void)remote_fetchAppBasedAssignmentUsage:(id)a3 completion:(id)a4;
- (void)remote_fetchCollectionItemsWithCompletion:(id)a3;
- (void)remote_fetchCollectionsWithCompletion:(id)a3;
- (void)remote_fetchContextsForContextIDs:(id)a3 completion:(id)a4;
- (void)remote_fetchCountOfActivitiesForContextID:(id)a3 completion:(id)a4;
- (void)remote_fetchDeletedObjectIDsNewerThanDate:(id)a3 completion:(id)a4;
- (void)remote_fetchHandoutAttachmentForDocumentURL:(id)a3 withCompletion:(id)a4;
- (void)remote_fetchOrphanedAssetsWithCompletion:(id)a3;
- (void)remote_fetchProgressReportingCapabilitiesForContextID:(id)a3 completion:(id)a4;
- (void)remote_fetchReportsWithPredicate:(id)a3 completion:(id)a4;
- (void)remote_fetchSurveyAnswer:(id)a3 responderIDs:(id)a4 completion:(id)a5;
- (void)remote_fetchThumbnailBlobForContextID:(id)a3 completion:(id)a4;
- (void)remote_fetchTransparencyMessageInfoForAttachmentID:(id)a3 withCompletion:(id)a4;
- (void)remote_fetchTransparencyMessageInfoWithCompletion:(id)a3;
- (void)remote_getBootstrapMode:(id)a3;
- (void)remote_getClassKitCatalogEnvironmentWithCompletion:(id)a3;
- (void)remote_getCurrentUseriCloudQuotaInfoWithCompletion:(id)a3;
- (void)remote_getDevModeWithCompletion:(id)a3;
- (void)remote_getServerInternalStateInfoWithCompletion:(id)a3;
- (void)remote_getServerSyncStatusWithCompletion:(id)a3;
- (void)remote_getUserDefaultForDefaultNamed:(id)a3 completion:(id)a4;
- (void)remote_getUserDefaultsConfigurationDictionaryWithCompletion:(id)a3;
- (void)remote_listAppsWithCompletion:(id)a3;
- (void)remote_mainAppContextWithCompletion:(id)a3;
- (void)remote_publishAdminRequests:(id)a3 withRequestor:(id)a4 adminRequestAccounts:(id)a5 completion:(id)a6;
- (void)remote_publishClass:(id)a3 membersToInsert:(id)a4 membersToDelete:(id)a5 completion:(id)a6;
- (void)remote_publishCollaborationStateChanges:(id)a3 completion:(id)a4;
- (void)remote_publishHandoutGraph:(id)a3 completion:(id)a4;
- (void)remote_publishSurveyAnswers:(id)a3 completion:(id)a4;
- (void)remote_recreateDatabase:(BOOL)a3 andTerminateDaemonWithCompletion:(id)a4;
- (void)remote_recreateDatabaseWithCompletion:(id)a3;
- (void)remote_recreateDevelopmentDatabaseWithCompletion:(id)a3;
- (void)remote_registerDataObserver:(id)a3 withID:(id)a4 querySpecification:(id)a5 oldChangeTag:(unint64_t)a6 completion:(id)a7;
- (void)remote_relayRequestWithData:(id)a3 requestType:(unint64_t)a4 fileHandle:(id)a5 completion:(id)a6;
- (void)remote_removeAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5;
- (void)remote_removeAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5;
- (void)remote_renewCredentialsWithCompletion:(id)a3;
- (void)remote_repairHandoutAttachments:(id)a3 completion:(id)a4;
- (void)remote_saveInsightEvents:(id)a3 completion:(id)a4;
- (void)remote_saveObjects:(id)a3 saveResponse:(id)a4 completion:(id)a5;
- (void)remote_setBootstrapMode:(int)a3 url:(id)a4 completion:(id)a5;
- (void)remote_setClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4;
- (void)remote_setDevMode:(int)a3 completion:(id)a4;
- (void)remote_setOverrideBundleIdentifier:(id)a3 completion:(id)a4;
- (void)remote_setShouldSyncTeacherBrowsedContexts:(BOOL)a3 completion:(id)a4;
- (void)remote_setUserDefaultValue:(id)a3 forDefaultNamed:(id)a4 completion:(id)a5;
- (void)remote_shouldSyncTeacherBrowsedContextsWithCompletion:(id)a3;
- (void)remote_startActivityFailed:(id)a3 completion:(id)a4;
- (void)remote_startAppActivity:(id)a3 bundleID:(id)a4 activityType:(unint64_t)a5 completion:(id)a6;
- (void)remote_statusWithCompletion:(id)a3;
- (void)remote_studentActivityForAttachmentsWithIDs:(id)a3 completion:(id)a4;
- (void)remote_syncBootstrapWithCompletion:(id)a3;
- (void)remote_syncFetchWithCompletion:(id)a3;
- (void)remote_syncPushWithCompletion:(id)a3;
- (void)remote_syncStatsWithCompletion:(id)a3;
- (void)remote_topLevelContentStoreCacheDirectoryURLWithCompletion:(id)a3;
- (void)remote_triggerUserNotificationHandoutAssignedWithHandoutID:(id)a3 completion:(id)a4;
- (void)remote_triggerUserNotificationHandoutDueSoonWithReferenceDate:(id)a3 completion:(id)a4;
- (void)remote_triggerUserNotificationHandoutPastDueSummaryWithReferenceDate:(id)a3 completion:(id)a4;
- (void)remote_triggerUserNotificationReviewDueHandoutsWithReferenceDate:(id)a3 completion:(id)a4;
- (void)remote_triggerUserNotificationRevisedSubmissionWithAttachmentID:(id)a3 studentName:(id)a4 completion:(id)a5;
- (void)remote_triggerUserNotificationRevisionRequestedWithAttachmentID:(id)a3 completion:(id)a4;
- (void)remote_triggerUserNotificationWithTitle:(id)a3 message:(id)a4 wrappedImageURL:(id)a5;
- (void)remote_uploadAsset:(id)a3 createThumbnailIfNeeded:(BOOL)a4 uploadObserver:(id)a5 completion:(id)a6;
- (void)remote_urlSuitableForOpeningForExpectedURL:(id)a3 itemID:(id)a4 ownerName:(id)a5 zoneName:(id)a6 completion:(id)a7;
- (void)remote_validateAndCreateHandoutAssignedItem:(id)a3 withCompletion:(id)a4;
- (void)saveObjects:(id)a3 saveResponse:(id)a4 isRemoteClient:(BOOL)a5 completion:(id)a6;
@end

@implementation PDEndpointServer

- (PDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (PDDaemon *)WeakRetained;
}

- (PDDatabase)database
{
  v2 = [(PDEndpointServer *)self daemon];
  v3 = [v2 database];

  return (PDDatabase *)v3;
}

- (PDEndpointServer)initWithClient:(id)a3 daemon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PDEndpointServer;
  v9 = [(PDEndpointServer *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeWeak((id *)&v10->_daemon, v8);
    uint64_t v11 = +[NSMapTable strongToStrongObjectsMapTable];
    observers = v10->_observers;
    v10->_observers = (NSMapTable *)v11;

    v13 = CLSDispatchQueueName();
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (qword_10023E458 != -1) {
      dispatch_once(&qword_10023E458, &stru_1001F25A8);
    }
    v16 = (id)qword_10023E450;
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2(v14, v15, v16);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v10 selector:"databaseChanged:" name:@"PDDataWrittenNotification" object:0];
    v20 = (PDRing *)sub_100002DB4([PDRing alloc], 20);
    previousCommands = v10->_previousCommands;
    v10->_previousCommands = v20;
  }
  return v10;
}

- (void)remote_currentUserWithCompletion:(id)a3
{
  v5 = (void (**)(id, void, void *))a3;
  CLSInitLog();
  id v7 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PDEndpointServer remote_currentUserWithCompletion", buf, 2u);
  }
  id v8 = +[PDUserDefaults sharedDefaults];
  unsigned int v9 = [v8 enableVerboseLogging];

  if (v9) {
    CLSLogDebugCurrentPersona();
  }
  sub_100005DDC((uint64_t)self, a2);
  v10 = [(PDEndpointServer *)self client];
  if (v10 && (int v11 = v10[26], v10, v11))
  {
    v12 = [(PDEndpointServer *)self client];
    v13 = sub_10000C6B4(v12);

    v14 = [(PDEndpointServer *)self client];
    if (v14) {
      BOOL v15 = v14[25] != 0;
    }
    else {
      BOOL v15 = 0;
    }

    if (v13) {
      unsigned int v49 = v15 & [v13 isEqualToString:@"com.apple.Preferences"];
    }
    else {
      unsigned int v49 = 0;
    }
    v16 = [(PDEndpointServer *)self client];
    if (v16) {
      BOOL v17 = v16[29] != 0;
    }
    else {
      BOOL v17 = 0;
    }
    v51 = v6;

    v52 = v5;
    if (v13)
    {
      unsigned int v48 = [v13 isEqualToString:@"com.apple.classroom.instructord"];
      unsigned int v47 = v15 & [v13 isEqualToString:@"com.apple.studentd"];
      unsigned int v18 = [v13 isEqualToString:@"com.apple.schoolwork.ClassKitApp"];
      unsigned int v19 = [v13 isEqualToString:@"com.apple.classroom"];
    }
    else
    {
      unsigned int v18 = 0;
      unsigned int v47 = 0;
      unsigned int v48 = 0;
      unsigned int v19 = 0;
    }
    v20 = sub_1000062FC();
    CLSCurrentPersonaUniqueIdentifier();
    v53 = id v56 = 0;
    uint64_t v21 = sub_10000594C((uint64_t)PDAccountInfo, v20, v53, &v56);
    id v50 = v56;
    CLSInitLog();
    v22 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      v36 = v22;
      v37 = [(PDEndpointServer *)self database];
      CFStringRef v38 = @"yes";
      if (!v37) {
        CFStringRef v38 = @"no";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v58 = v38;
      _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "PDEndpointServer remote_currentUserWithCompletioncalled self.database is not nil: %@. About to synchronously fetch currentUser from the DB", buf, 0xCu);
    }
    int v23 = v15 && v17;
    v24 = [(PDEndpointServer *)self daemon];
    v25 = [(PDEndpointServer *)self database];
    sub_1000064B8(v24, v25);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    CLSInitLog();
    v27 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v58 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "PDEndpointServer remote_currentUserWithCompletioncalled finished fetching currentUser from DB: %@", buf, 0xCu);
    }
    unsigned int v28 = [(__CFString *)v26 devMode];
    if (((v23 | v47 | v49 | [(__CFString *)v26 requiresPersonaMatch] ^ 1 | v18 | v19 | v48 | v21) & 1) != 0
      || v28 - 1 < 2)
    {
      [(__CFString *)v26 setClientPersonaUniqueIdentifier:v53];
      [(__CFString *)v26 setHasMatchingPersona:v21];
      v31 = [(__CFString *)v26 schoolworkUbiquitousContainerURL];
      v6 = v51;
      if (v31)
      {
        uint64_t v32 = [(PDEndpointServer *)self client];
        v33 = (void *)v32;
        if (v32 && (id v34 = *(id *)(v32 + 32)) != 0)
        {
          v35 = v34;
          [v34 auditToken];
        }
        else
        {
          v35 = 0;
          memset(v55, 0, sizeof(v55));
        }
        v39 = [v31 sandboxExtensionTokenForProcess:v55];

        [(__CFString *)v26 setSchoolworkUbiquitousContainerURLSandboxExtension:v39];
      }
      v40 = [(__CFString *)v26 multimediaCacheDirectoryURL];

      if (v40)
      {
        uint64_t v41 = [(PDEndpointServer *)self client];
        v42 = (void *)v41;
        if (v41 && (id v43 = *(id *)(v41 + 32)) != 0)
        {
          v44 = v43;
          [v43 auditToken];
        }
        else
        {
          v44 = 0;
          memset(v54, 0, sizeof(v54));
        }
        v45 = [v40 sandboxExtensionTokenForProcess:v54];

        [(__CFString *)v26 setMultimediaCacheDirectoryURLSandboxExtension:v45];
      }
      CLSInitLog();
      v46 = CLSLogDefault;
      v5 = v52;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v58 = v26;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "PDEndpointServer remote_currentUserWithCompletion calling completion with currentUser: %@", buf, 0xCu);
      }
      ((void (**)(id, __CFString *, void *))v52)[2](v52, v26, 0);

      v30 = v50;
    }
    else
    {
      CLSInitLog();
      v29 = CLSLogDefault;
      v6 = v51;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "PDEndpointServer remote_currentUserWithCompletion bailing and calling completion with nil currentUser", buf, 2u);
      }
      v5 = v52;
      v30 = v50;
      v52[2](v52, 0, v50);
    }
  }
  else
  {
    v13 = +[NSError cls_createErrorWithCode:4 description:@"Not Authorized"];
    v5[2](v5, 0, v13);
  }
}

- (PDClient)client
{
  return self->_client;
}

- (void)invalidate
{
  uint64_t v3 = [(PDEndpointServer *)self client];
  v4 = (void *)v3;
  if (v3) {
    v5 = *(void **)(v3 + 32);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  [v6 invalidate];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  id v8 = self->_observers;
  observers = self->_observers;
  self->_observers = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = [(NSMapTable *)v8 objectEnumerator];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PDEndpointServer *)self _invalidateObserver:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDEndpointServer;
  [(PDEndpointServer *)&v4 dealloc];
}

- (id)userNotificationCenter
{
  userNotificationCenter = self->_userNotificationCenter;
  if (!userNotificationCenter)
  {
    objc_super v4 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.schoolwork.ClassKitApp"];
    v5 = self->_userNotificationCenter;
    self->_userNotificationCenter = v4;

    userNotificationCenter = self->_userNotificationCenter;
  }

  return userNotificationCenter;
}

- (BOOL)isInternalWithError:(id *)a3
{
  v5 = [(PDEndpointServer *)self client];
  if (v5)
  {
    int v6 = v5[25];

    if (v6) {
      return 1;
    }
  }
  CLSInitLog();
  id v8 = (void *)CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = v8;
    v10 = [(PDEndpointServer *)self client];
    id v11 = sub_10000C6B4(v10);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not an internal client: %@", (uint8_t *)&v12, 0xCu);
  }
  +[NSError cls_assignError:a3 code:1 description:@"ClassKit is not available."];
  return 0;
}

- (void)databaseChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100029AF4;
  v9[3] = &unk_1001F2620;
  objc_copyWeak(&v12, &location);
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)remote_listAppsWithCompletion:(id)a3
{
  v5 = (void (**)(id, void, void *, id))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v20 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v20];
  id v7 = v20;
  if (v6)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    unsigned int v9 = [(PDEndpointServer *)self database];
    uint64_t v10 = objc_opt_class();
    long long v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_100029FB8;
    long long v18 = &unk_1001F2058;
    id v19 = v8;
    id v11 = v8;
    [v9 selectAll:v10 where:@"parentObjectID is NULL" orderBy:@"title asc" bindings:0 block:&v15];

    if (v7) {
      id v12 = 0;
    }
    else {
      id v12 = v11;
    }
    uint64_t v13 = [(PDEndpointServer *)self client];
    v14 = sub_10000C6B4(v13);
    ((void (**)(id, id, void *, id))v5)[2](v5, v12, v14, v7);
  }
  else
  {
    v5[2](v5, 0, 0, v7);
  }
}

- (void)remote_setOverrideBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, BOOL, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v14 = 0;
  unsigned int v9 = [(PDEndpointServer *)self isInternalWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    id v11 = [(PDEndpointServer *)self client];
    sub_1000A5920((uint64_t)v11, v7);
    id v12 = v10;

    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  v8[2](v8, v13, v10);
}

- (void)remote_deleteAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  id v8 = (void (**)(id, void, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v27 = 0;
  unsigned __int8 v9 = [(PDEndpointServer *)self isInternalWithError:&v27];
  id v10 = v27;
  if ((v9 & 1) == 0)
  {
    v8[2](v8, 0, v10);
    goto LABEL_14;
  }
  id v11 = [(PDEndpointServer *)self client];
  uint64_t v12 = sub_10000C6B4(v11);
  if (!(v7 | v12))
  {

    goto LABEL_9;
  }
  BOOL v13 = (void *)v12;
  id v14 = [(PDEndpointServer *)self client];
  long long v15 = sub_10000C6B4(v14);
  uint64_t v16 = v15;
  if (v7 && v15)
  {
    long long v17 = [(PDEndpointServer *)self client];
    long long v18 = sub_10000C6B4(v17);
    unsigned int v24 = [v18 isEqualToString:v7];

    if (!v24) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v19 = +[NSError cls_createErrorWithCode:3, @"Cannot delete app. Bundle identifier \"%@\" set as currently active app. Select another app as active app and try again.", v7 format];

    v8[2](v8, 0, (id)v19);
    id v10 = (id)v19;
    goto LABEL_14;
  }

LABEL_11:
  id v20 = [(PDEndpointServer *)self database];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002A310;
  v25[3] = &unk_1001F1ED8;
  v25[4] = self;
  id v21 = (id)v7;
  id v26 = v21;
  id v22 = [v20 withSyncEnabled:v25];

  if ((v22 & 1) == 0)
  {
    uint64_t v23 = +[NSError cls_createErrorWithCode:100, @"Failed to delete app with identifier: %@", v21 format];

    id v10 = (id)v23;
  }
  ((void (**)(id, id, id))v8)[2](v8, v22, v10);

LABEL_14:
}

- (void)remote_accountChanged
{
  sub_100005DDC((uint64_t)self, a2);
  id v15 = 0;
  unsigned __int8 v3 = [(PDEndpointServer *)self isInternalWithError:&v15];
  id v4 = v15;
  CLSInitLog();
  if (v3)
  {
    v5 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "remote_accountChanged.", v13, 2u);
    }
    unsigned __int8 v6 = +[PDUserDefaults sharedDefaults];
    unsigned int v7 = [v6 enableVerboseLogging];

    if (v7) {
      CLSLogDebugCurrentPersona();
    }
    id v8 = [(PDEndpointServer *)self daemon];
    unsigned __int8 v9 = v8;
    if (v8)
    {
      [v8 handleAccountChange];
    }
    else
    {
      CLSInitLog();
      id v11 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "PDEndpointServer has no daemon instance. Cannot notify account change.", v12, 2u);
      }
    }
  }
  else
  {
    id v10 = CLSLogConnection;
    if (os_log_type_enabled(CLSLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "tried to call remote_accountChanged from unauthorized client", buf, 2u);
    }
  }
}

- (void)remote_databasePathWithCompletion:(id)a3
{
  v5 = (void (**)(id, void *, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v14 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v14];
  id v7 = v14;
  if (v6)
  {
    id v8 = [(PDEndpointServer *)self daemon];
    unsigned int v9 = [v8 mode];
    if (v9 == 2)
    {
      uint64_t v10 = [v8 teacherDevDatabase];
    }
    else if (v9 == 1)
    {
      uint64_t v10 = [v8 studentDevDatabase];
    }
    else
    {
      if (v9)
      {
        uint64_t v12 = 0;
        goto LABEL_11;
      }
      uint64_t v10 = [(PDEndpointServer *)self database];
    }
    id v11 = (void *)v10;
    uint64_t v12 = sub_1000FA848(v10);

LABEL_11:
    BOOL v13 = [v12 objectForKeyedSubscript:@"PDDatabaseStatsPathKey"];
    v5[2](v5, v13, 0);

    goto LABEL_12;
  }
  ((void (**)(id, void *, id))v5)[2](v5, 0, v7);
LABEL_12:
}

- (void)remote_recreateDatabaseWithCompletion:(id)a3
{
  v5 = (void (**)(id, uint64_t, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v10 = 0;
  unsigned __int8 v7 = [(PDEndpointServer *)self isInternalWithError:&v10];
  id v8 = v10;
  if (v7)
  {
    unsigned int v9 = [(PDEndpointServer *)self daemon];
    [v9 recreateDatabase];

    v5[2](v5, 1, 0);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v5)[2](v5, 0, v8);
  }
}

- (void)remote_recreateDatabase:(BOOL)a3 andTerminateDaemonWithCompletion:(id)a4
{
  BOOL v4 = a3;
  unsigned __int8 v7 = (void (**)(id, uint64_t, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v11 = 0;
  unsigned __int8 v8 = [(PDEndpointServer *)self isInternalWithError:&v11];
  id v9 = v11;
  if (v8)
  {
    id v10 = [(PDEndpointServer *)self daemon];
    [v10 terminateCleanAfterRecreatingDatabase:v4];

    v7[2](v7, 1, 0);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v9);
  }
}

- (void)remote_syncStatsWithCompletion:(id)a3
{
  v5 = (void (**)(id, void *, id))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v11 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    unsigned __int8 v8 = [(PDEndpointServer *)self daemon];
    id v9 = [v8 operationsManager];
    id v10 = sub_100113E30(v9);

    v5[2](v5, v10, v7);
  }
  else
  {
    v5[2](v5, 0, v7);
  }
}

- (void)remote_syncPushWithCompletion:(id)a3
{
  id v5 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v12 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    unsigned __int8 v8 = [(PDEndpointServer *)self daemon];
    id v9 = [v8 operationsManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002AA48;
    v10[3] = &unk_1001F2698;
    id v11 = v5;
    sub_10010FF00(v9, v10);
  }
  else
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v7);
  }
}

- (void)remote_syncFetchWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, id))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v7 = [(PDEndpointServer *)self client];
  unsigned __int8 v8 = sub_10000C6B4(v7);
  if ([v8 hasPrefix:@"com.apple.schoolwork.ClassKitApp"])
  {

    id v9 = 0;
  }
  else
  {
    id v16 = 0;
    unsigned __int8 v10 = [(PDEndpointServer *)self isInternalWithError:&v16];
    id v9 = v16;

    if ((v10 & 1) == 0)
    {
      v5[2](v5, 0, v9);
      goto LABEL_6;
    }
  }
  id v11 = [(PDEndpointServer *)self database];
  sub_1000DB49C(v11, 0);

  id v12 = [(PDEndpointServer *)self daemon];
  BOOL v13 = [v12 operationsManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002ABF8;
  v14[3] = &unk_1001F2698;
  id v15 = v5;
  sub_100003784(v13, v14);

LABEL_6:
}

- (void)remote_syncBootstrapWithCompletion:(id)a3
{
  id v5 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v7 = [(PDEndpointServer *)self client];
  if (v7 && (int v8 = v7[26], v7, v8))
  {
    id v9 = [(PDEndpointServer *)self database];
    sub_1000DB49C(v9, 0);
    sub_1000DB264(v9, @"ee.setup");
    sub_1000DB264(v9, @"bootstrap");
    unsigned __int8 v10 = [(PDEndpointServer *)self daemon];
    id v11 = [v10 operationsManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002AD90;
    v12[3] = &unk_1001F2698;
    id v13 = v5;
    sub_10010F4A4(v11, v12);
  }
  else
  {
    id v9 = +[NSError cls_createErrorWithCode:4 description:@"Not Authorized"];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v9);
  }
}

- (void)remote_fetchReportsWithPredicate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  unsigned __int8 v10 = [(PDEndpointServer *)self client];
  id v11 = sub_10000C6B4(v10);
  if ([v11 hasPrefix:@"com.apple.schoolwork.ClassKitApp"])
  {

    id v12 = 0;
  }
  else
  {
    id v16 = 0;
    unsigned __int8 v13 = [(PDEndpointServer *)self isInternalWithError:&v16];
    id v12 = v16;

    if ((v13 & 1) == 0)
    {
      v8[2](v8, 0, v12);
      goto LABEL_6;
    }
  }
  id v14 = [(PDEndpointServer *)self daemon];
  id v15 = [v14 operationsManager];
  sub_1001108F4(v15, v7, v8);

LABEL_6:
}

- (void)remote_statusWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v10 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v10];
  id v7 = v10;
  if (v6)
  {
    int v8 = [(PDEndpointServer *)self daemon];
    id v9 = [v8 statusReport];

    v5[2](v5, v9, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v5)[2](v5, 0, v7);
  }
}

- (void)remote_renewCredentialsWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, uint64_t, id))a3;
  sub_100005DDC((uint64_t)self, a2);
  unsigned __int8 v6 = [(PDEndpointServer *)self client];
  id v7 = sub_10000C6B4(v6);
  if ([v7 hasPrefix:@"com.apple.schoolwork.ClassKitApp"])
  {

    id v8 = 0;
  }
  else
  {
    id v11 = 0;
    unsigned __int8 v9 = [(PDEndpointServer *)self isInternalWithError:&v11];
    id v8 = v11;

    if ((v9 & 1) == 0)
    {
      v5[2](v5, 0, 2, v8);
      goto LABEL_9;
    }
  }
  id v10 = sub_1000062FC();
  if (v10) {
    sub_100043618((uint64_t)PDAccountInfo, v10, 1, v5);
  }
  else {
    v5[2](v5, 0, 2, v8);
  }

LABEL_9:
}

- (void)remote_addAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  sub_100005DDC((uint64_t)self, a2);
  id v16 = 0;
  unsigned __int8 v11 = [(PDEndpointServer *)self isInternalWithError:&v16];
  id v12 = v16;
  if (v11)
  {
    unsigned __int8 v13 = [(PDEndpointServer *)self database];
    id v14 = sub_100142204(v13, a3, v9);

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = +[NSError cls_createErrorWithCode:100, @"failed to add authorization at path: %@", v9 format];

      id v12 = (id)v15;
    }
    v10[2](v10, v14, v12);
  }
  else
  {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_authorizationStatusForContextAtPath:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v14 = 0;
  unsigned __int8 v9 = [(PDEndpointServer *)self isInternalWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    unsigned __int8 v11 = [(PDEndpointServer *)self database];
    uint64_t v12 = sub_100142EB0((uint64_t)v11, v7);

    unsigned __int8 v13 = +[NSNumber numberWithInteger:v12];
    v8[2](v8, v13, v10);
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)remote_authorizationStatusForHandoutAssignedItem:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v14 = 0;
  unsigned __int8 v9 = [(PDEndpointServer *)self isInternalWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    unsigned __int8 v11 = [(PDEndpointServer *)self database];
    uint64_t v12 = sub_10001BC90((uint64_t)v11, v7);

    unsigned __int8 v13 = +[NSNumber numberWithInteger:v12];
    v8[2](v8, v13, v10);
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)remote_removeAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  sub_100005DDC((uint64_t)self, a2);
  id v16 = 0;
  unsigned __int8 v11 = [(PDEndpointServer *)self isInternalWithError:&v16];
  id v12 = v16;
  if (v11)
  {
    unsigned __int8 v13 = [(PDEndpointServer *)self database];
    id v14 = sub_100142518(v13, a3, v9);

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = +[NSError cls_createErrorWithCode:100, @"failed to remove authorization at path: %@", v9 format];

      id v12 = (id)v15;
    }
    v10[2](v10, v14, v12);
  }
  else
  {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_recreateDevelopmentDatabaseWithCompletion:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v9];
  id v7 = v9;
  if (v6)
  {
    id v8 = [(PDEndpointServer *)self daemon];
    [v8 recreateDevelopmentDatabases];

    v5[2](v5, 1, 0);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v5)[2](v5, 0, v7);
  }
}

- (void)remote_setDevMode:(int)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v13 = 0;
  unsigned int v8 = [(PDEndpointServer *)self isInternalWithError:&v13];
  id v9 = v13;
  id v10 = v9;
  if (v8)
  {
    if (a3 == 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = a3 == 1;
    }
    id v12 = [(PDEndpointServer *)self daemon];
    [v12 setMode:v11];

    id v10 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v10);
}

- (void)remote_getDevModeWithCompletion:(id)a3
{
  id v5 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v13 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v13];
  id v7 = v13;
  if (v6)
  {
    unsigned int v8 = [(PDEndpointServer *)self daemon];
    unsigned int v9 = [v8 mode];

    switch(v9)
    {
      case 2u:
        id v10 = (void (*)(void *, uint64_t, void))v5[2];
        uint64_t v11 = v5;
        uint64_t v12 = 2;
        goto LABEL_9;
      case 1u:
        id v10 = (void (*)(void *, uint64_t, void))v5[2];
        uint64_t v11 = v5;
        uint64_t v12 = 1;
        goto LABEL_9;
      case 0u:
        id v10 = (void (*)(void *, uint64_t, void))v5[2];
        uint64_t v11 = v5;
        uint64_t v12 = 0;
LABEL_9:
        v10(v11, v12, 0);
        break;
    }
  }
  else
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0, v7);
  }
}

- (void)remote_getBootstrapMode:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void *, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v13 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v13];
  id v7 = v13;
  if (v6)
  {
    unsigned int v8 = [(PDEndpointServer *)self database];
    unsigned int v9 = [v8 select:objc_opt_class() identity:@"bootstrap"];
    int v10 = sub_100004EE8(v8, @"bootstrapMode");
    if (v10 == 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2 * (v10 == 2);
    }
    uint64_t v12 = sub_1000DA200(v9);
    v5[2](v5, v11, v12, 0);
  }
  else
  {
    ((void (**)(id, uint64_t, void *, id))v5)[2](v5, 0, 0, v7);
  }
}

- (void)remote_setBootstrapMode:(int)a3 url:(id)a4 completion:(id)a5
{
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  sub_100005DDC((uint64_t)self, a2);
  id v24 = 0;
  unsigned __int8 v11 = [(PDEndpointServer *)self isInternalWithError:&v24];
  id v12 = v24;
  if (v11)
  {
    if (a3 == 1) {
      int64_t v13 = 1;
    }
    else {
      int64_t v13 = 2 * (a3 == 2);
    }
    id v14 = [(PDEndpointServer *)self database];
    uint64_t v15 = [v14 select:objc_opt_class() identity:@"bootstrap"];
    if (v13 == 2)
    {
      long long v17 = [v9 absoluteString];
    }
    else
    {
      CFStringRef v16 = @"https://pg-bootstrap.itunes.apple.com/v1/config";
      if (v13) {
        CFStringRef v16 = 0;
      }
      if (v13 == 1) {
        long long v17 = @"https://pg-bootstrap.classkit.apple.com/v1/config";
      }
      else {
        long long v17 = (__CFString *)v16;
      }
    }
    sub_100043608((uint64_t)v15, v17);
    if ([v14 updateObject:v15])
    {
      if (a3 == 2)
      {
        long long v18 = [PDAllowedHost alloc];
        uint64_t v19 = [v9 host];
        id v20 = sub_100064E0C(v18, v19);

        if (([v14 insertOrUpdateObject:v20] & 1) == 0)
        {
          uint64_t v23 = +[NSError cls_createErrorWithCode:100 description:@"Failed to set allowed host in database.  The endpoint itself was updated"];
          v10[2](v10, v23);

          goto LABEL_22;
        }
      }
      if (sub_10015FF5C(v14, v13, @"bootstrapMode"))
      {
        v10[2](v10, 0);
LABEL_22:

        goto LABEL_23;
      }
      CFStringRef v21 = @"Failed to set mode in database.  The endpoint itself was updated";
    }
    else
    {
      CFStringRef v21 = @"Failed to update endpoint";
    }
    id v22 = +[NSError cls_createErrorWithCode:100 description:v21];
    v10[2](v10, v22);

    goto LABEL_22;
  }
  v10[2](v10, v12);
LABEL_23:
}

- (void)remote_setClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v12 = 0;
  unsigned int v8 = [(PDEndpointServer *)self isInternalWithError:&v12];
  id v9 = v12;
  id v10 = v9;
  if (v8)
  {
    unsigned __int8 v11 = [(PDEndpointServer *)self database];
    sub_1001548AC(v11, a3);

    id v10 = 0;
  }
  ((void (**)(id, id))v7)[2](v7, v10);
}

- (void)remote_getClassKitCatalogEnvironmentWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v10 = 0;
  unsigned __int8 v6 = [(PDEndpointServer *)self isInternalWithError:&v10];
  id v7 = v10;
  if (v6)
  {
    unsigned int v8 = [(PDEndpointServer *)self database];
    id v9 = sub_10000C100(v8);
    v5[2](v5, v9, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v5)[2](v5, 0, v7);
  }
}

- (void)remote_shouldSyncTeacherBrowsedContextsWithCompletion:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  unsigned __int8 v6 = [(PDEndpointServer *)self client];
  if (v6 && (int v7 = v6[26], v6, v7))
  {
    unsigned int v8 = [(PDEndpointServer *)self database];
    id v12 = [v8 select:objc_opt_class() identity:@"syncTeacherContexts"];

    if (v12)
    {
      BOOL v9 = v12[16] != 0;
    }
    else
    {
      id v10 = [(PDEndpointServer *)self database];
      BOOL v9 = 1;
      sub_10015FEC4(v10, 1, @"syncTeacherContexts");
    }
    uint64_t v11 = +[NSNumber numberWithBool:v9];
    v5[2](v5, v11, 0);

    id v5 = (void (**)(id, uint64_t, void))v11;
  }
  else
  {
    id v12 = +[NSError cls_createErrorWithCode:1 description:@"Could not read sync teacher browse."];
    ((void (*)(void (**)(id, uint64_t, void), void))v5[2])(v5, 0);
  }
}

- (void)remote_setShouldSyncTeacherBrowsedContexts:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  int64_t v13 = (void (**)(id, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  int v7 = [(PDEndpointServer *)self client];
  if (v7 && (int v8 = v7[26], v7, v8))
  {
    BOOL v9 = [(PDEndpointServer *)self database];
    sub_10015FEC4(v9, v4, @"syncTeacherContexts");

    if (v4)
    {
      id v10 = [(PDEndpointServer *)self daemon];
      uint64_t v11 = [v10 operationsManager];
      sub_10010FF00(v11, 0);
    }
    v13[2](v13, 0);
  }
  else
  {
    id v12 = +[NSError cls_createErrorWithCode:1 description:@"Could not write sync teacher browse."];
    ((void (**)(id, void *))v13)[2](v13, v12);
  }
}

- (void)remote_fetchTransparencyMessageInfoForAttachmentID:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void *, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v10 = [(PDEndpointServer *)self client];
  if (v10 && (int v11 = v10[30], v10, v11))
  {
    id v12 = sub_10002C06C(self, v7);
    v8[2](v8, v12, 0);
  }
  else
  {
    CLSInitLog();
    int64_t v13 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      v14[0] = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Skipping remote_fetchTransparencyMessageInfoForAttachmentID from invalid client", (uint8_t *)v14, 2u);
    }
    id v12 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v12);
  }
}

- (void)remote_fetchTransparencyMessageInfoWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  unsigned __int8 v6 = [(PDEndpointServer *)self client];
  if (v6 && (int v7 = v6[30], v6, v7))
  {
    id v8 = [(PDEndpointServer *)self database];
    if (sub_100066C68(v8))
    {
      BOOL v41 = sub_100006970(v8, @"shownModalTransparency");
      BOOL v9 = [(PDEndpointServer *)self client];
      v45 = sub_10000C6B4(v9);

      *(void *)buf = 0;
      v78 = buf;
      uint64_t v79 = 0x3032000000;
      v80 = sub_10000B634;
      v81 = sub_10000B534;
      id v82 = (id)objc_opt_new();
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x3032000000;
      v74 = sub_10000B634;
      v75 = sub_10000B534;
      id v76 = (id)objc_opt_new();
      uint64_t v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x3032000000;
      v68 = sub_10000B634;
      v69 = sub_10000B534;
      id v70 = (id)objc_opt_new();
      id v10 = sub_100003E58(v8);
      int v11 = [v10 objectID];

      v88[0] = &off_10020AD40;
      v88[1] = v45;
      v44 = +[NSArray arrayWithObjects:v88 count:2];
      uint64_t v12 = objc_opt_class();
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_10002CF8C;
      v59[3] = &unk_1001F2080;
      id v8 = v8;
      id v60 = v8;
      id v13 = v11;
      id v61 = v13;
      v62 = buf;
      v63 = &v65;
      v64 = &v71;
      [v8 selectAll:v12 where:@"type = ? and bundleIdentifier = ?" bindings:v44 block:v59];
      id v43 = v13;
      id v14 = objc_opt_new();
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v15 = (id)v66[5];
      id v16 = [v15 countByEnumeratingWithState:&v55 objects:v87 count:16];
      if (v16)
      {
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v56;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v56 != v18) {
              objc_enumerationMutation(v15);
            }
            if (sub_100142EB0((uint64_t)v8, *(void **)(*((void *)&v55 + 1) + 8 * (void)v19)) == 1)
            {
              id v20 = [*((id *)v78 + 5) objectAtIndexedSubscript:(char *)v19 + v17];
              [v14 addObject:v20];
            }
            uint64_t v19 = (char *)v19 + 1;
          }
          while (v16 != v19);
          id v16 = [v15 countByEnumeratingWithState:&v55 objects:v87 count:16];
          v17 += (uint64_t)v19;
        }
        while (v16);
      }

      CFStringRef v21 = (__CFString *)[v14 mutableCopy];
      [(__CFString *)v21 minusSet:v72[5]];
      uint64_t v49 = 0;
      id v50 = &v49;
      uint64_t v51 = 0x3032000000;
      v52 = sub_10000B634;
      v53 = sub_10000B534;
      id v54 = 0;
      if ([(__CFString *)v21 count])
      {
        uint64_t v22 = objc_opt_new();
        uint64_t v23 = (void *)v50[5];
        v50[5] = v22;

        id v24 = [(__CFString *)v21 allObjects];
        v25 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10002D0B0;
        v48[3] = &unk_1001F20A8;
        v48[4] = &v49;
        [v8 selectAll:objc_opt_class() where:v25 bindings:v24 block:v48];
      }
      if ([(id)v50[5] count])
      {
        id v26 = [(id)v50[5] allObjects];
        v42 = +[PDDatabase whereSQLForArray:v26 prefix:@"objectID in "];
        *(void *)v83 = 0;
        *(void *)&v83[8] = v83;
        *(void *)&v83[16] = 0x3032000000;
        v84 = sub_10000B634;
        v85 = sub_10000B534;
        id v27 = objc_alloc((Class)NSMutableArray);
        id v86 = objc_msgSend(v27, "initWithCapacity:", objc_msgSend((id)v50[5], "count"));
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10002D118;
        v47[3] = &unk_1001F20D0;
        v47[4] = v83;
        [v8 selectAll:objc_opt_class() where:v42 bindings:v26 block:v47];
        if ([*(id *)(*(void *)&v83[8] + 40) count])
        {
          unsigned int v28 = +[NSBundle bundleForClass:objc_opt_class()];
          v29 = [v28 localizedStringForKey:@"TRANSPARENCY_BANNER_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

          v30 = +[NSBundle bundleForClass:objc_opt_class()];
          v31 = [v30 localizedStringForKey:@"TRANSPARENCY_BANNER_MESSAGE_1_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];

          if ((unint64_t)[*(id *)(*(void *)&v83[8] + 40) count] >= 2)
          {
            uint64_t v32 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v33 = [v32 localizedStringForKey:@"TRANSPARENCY_BANNER_MESSAGE_N_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];

            v31 = (void *)v33;
          }
          id v34 = objc_opt_new();
          v35 = [*(id *)(*(void *)&v83[8] + 40) sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
          [v34 setObject:v35 forKeyedSubscript:@"classNames"];

          v36 = +[NSNumber numberWithBool:!v41];
          [v34 setObject:v36 forKeyedSubscript:@"showModal"];

          if (v29) {
            [v34 setObject:v29 forKeyedSubscript:@"localizedTitle"];
          }
          if (v31) {
            [v34 setObject:v31 forKeyedSubscript:@"localizedMessageFormat"];
          }
          if (!v41) {
            sub_10015FEC4(v8, 1, @"shownModalTransparency");
          }
        }
        else
        {
          id v34 = 0;
        }
        _Block_object_dispose(v83, 8);
      }
      else
      {
        id v34 = 0;
      }
      CLSInitLog();
      CFStringRef v38 = CLSLogDefault;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        if ([(__CFString *)v21 count]) {
          CFStringRef v39 = v21;
        }
        else {
          CFStringRef v39 = @"none";
        }
        if ([(id)v50[5] count]) {
          CFStringRef v40 = (const __CFString *)v50[5];
        }
        else {
          CFStringRef v40 = @"none";
        }
        *(_DWORD *)v83 = 138412802;
        *(void *)&v83[4] = v45;
        *(_WORD *)&v83[12] = 2112;
        *(void *)&v83[14] = v39;
        *(_WORD *)&v83[22] = 2112;
        v84 = (uint64_t (*)(uint64_t, uint64_t))v40;
        _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Client %@ pertains to relevant handoutIDs: %@ classIDs: %@", v83, 0x20u);
      }

      v5[2](v5, v34, 0);
      _Block_object_dispose(&v49, 8);

      _Block_object_dispose(&v65, 8);
      _Block_object_dispose(&v71, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v5[2](v5, 0, 0);
    }
  }
  else
  {
    CLSInitLog();
    v37 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Skipping remote_fetchTransparencyMessageInfoWithCompletion from invalid client", buf, 2u);
    }
    id v8 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
    ((void (**)(id, void *, id))v5)[2](v5, 0, v8);
  }
}

- (void)remote_fetchHandoutAttachmentForDocumentURL:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  sub_100005DDC((uint64_t)self, a2);
  BOOL v9 = [(PDEndpointServer *)self client];
  if (v9 && (int v10 = v9[30], v9, v10))
  {
    int v11 = [(PDEndpointServer *)self database];
    uint64_t v12 = sub_100003A74(v11);
    id v13 = (void *)v12;
    if (v12 && *(unsigned char *)(v12 + 9))
    {
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_10002E08C;
      v63[3] = &unk_1001F2120;
      id v14 = v7;
      id v64 = v14;
      id v65 = v8;
      id v15 = objc_retainBlock(v63);
      *(void *)buf = 0;
      long long v58 = buf;
      uint64_t v59 = 0x3032000000;
      id v60 = sub_10000B634;
      id v61 = sub_10000B534;
      id v62 = 0;
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x3032000000;
      id v54 = sub_10000B634;
      long long v55 = sub_10000B534;
      id v56 = 0;
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x3032000000;
      unsigned int v48 = sub_10000B634;
      uint64_t v49 = sub_10000B534;
      id v50 = 0;
      uint64_t v16 = sub_1000062FC();
      uint64_t v17 = (void *)v16;
      if (v16) {
        uint64_t v18 = *(void **)(v16 + 72);
      }
      else {
        uint64_t v18 = 0;
      }
      id v19 = v18;
      id v44 = v14;
      CLSPerformWithPersona();

      if (v52[5] && (id v20 = (void *)v46[5]) != 0)
      {
        CFStringRef v21 = [v20 zoneID];
        id v43 = [v21 zoneName];

        uint64_t v22 = [(PDEndpointServer *)self database];
        uint64_t v23 = objc_opt_class();
        v71[0] = v52[5];
        v71[1] = v43;
        id v24 = +[NSArray arrayWithObjects:v71 count:2];
        v25 = [v22 select:v23 where:@"brItemID = ? and brZoneName = ?" bindings:v24];

        CLSInitLog();
        id v26 = CLSLogDefault;
        if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v40 = v52[5];
          *(_DWORD *)uint64_t v67 = 138412546;
          uint64_t v68 = v40;
          __int16 v69 = 2112;
          id v70 = v43;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Looking up asset matching brItemID = %@ and brZoneName = %@", v67, 0x16u);
        }
        id v27 = [v25 parentObjectID];
        BOOL v28 = v27 == 0;

        if (v28)
        {
          CLSInitLog();
          CFStringRef v39 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v41 = v52[5];
            *(_DWORD *)uint64_t v67 = 138412546;
            uint64_t v68 = v41;
            __int16 v69 = 2112;
            id v70 = v43;
            _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "failed to find asset matching brItemID = %@ and brZoneName = %@", v67, 0x16u);
          }
          objc_msgSend(*((id *)v58 + 5), "cls_log:", CLSLogHandout);
          ((void (*)(void *, void, void))v15[2])(v15, 0, *((void *)v58 + 5));
        }
        else
        {
          v29 = [(PDEndpointServer *)self database];
          uint64_t v30 = objc_opt_class();
          v31 = [v25 parentObjectID];
          v66 = v31;
          uint64_t v32 = +[NSArray arrayWithObjects:&v66 count:1];
          uint64_t v33 = [v29 select:v30 where:@"objectID = ?" bindings:v32];

          if (!v33)
          {
            id v34 = [v25 objectID];
            uint64_t v35 = +[NSError cls_createErrorWithCode:100, @"failed to find attachment for asset with id: %@", v34 format];
            v36 = (void *)*((void *)v58 + 5);
            *((void *)v58 + 5) = v35;

            objc_msgSend(*((id *)v58 + 5), "cls_log:", CLSLogHandout);
          }
          ((void (*)(void *, void *, void))v15[2])(v15, v33, *((void *)v58 + 5));
        }
      }
      else
      {
        ((void (*)(void *, void, void))v15[2])(v15, 0, *((void *)v58 + 5));
      }

      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v51, 8);

      _Block_object_dispose(buf, 8);
      CFStringRef v38 = v64;
    }
    else
    {
      CLSInitLog();
      v37 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Skipping remote_fetchHandoutAttachmentForDocumentURL from non-EDU MAID", buf, 2u);
      }
      CFStringRef v38 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v38);
    }
  }
  else
  {
    CLSInitLog();
    v42 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Skipping remote_fetchHandoutAttachmentForDocumentURL from invalid client", buf, 2u);
    }
    int v11 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v11);
  }
}

- (void)remote_validateAndCreateHandoutAssignedItem:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  BOOL v9 = [(PDEndpointServer *)self client];
  if (v9 && (int v10 = v9[30], v9, v10))
  {
    int v11 = [(PDEndpointServer *)self database];
    uint64_t v12 = v11;
    if (v11) {
      unint64_t v13 = ((unint64_t)sub_100004B84(v11) >> 1) & 1;
    }
    else {
      LODWORD(v13) = 0;
    }
    if (!sub_100066C68(v12) || v13)
    {
      CLSInitLog();
      id v20 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Unable call to remote_validateAndCreateHandoutAssignedItem. Progress tracking is not allowed.", buf, 2u);
      }
      id v37 = 0;
      +[NSError cls_assignError:&v37 code:4 description:@"Not Authorized"];
      id v19 = v37;
      v8[2](v8, 0, v19);
    }
    else
    {
      id v14 = [(PDEndpointServer *)self database];
      uint64_t v15 = objc_opt_class();
      id v41 = v7;
      uint64_t v16 = +[NSArray arrayWithObjects:&v41 count:1];
      uint64_t v17 = [v14 select:v15 where:@"parentObjectID = ?" bindings:v16];

      if (v17)
      {
        if ([v17 effectiveAuthorizationStatus] == (id)2)
        {
          CLSInitLog();
          uint64_t v18 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "handout assigned item authorization denied", buf, 2u);
          }
          id v36 = 0;
          +[NSError cls_assignError:&v36 code:4 description:@"Not Authorized"];
          id v19 = v36;
          v8[2](v8, 0, v19);
        }
        else
        {
          ((void (**)(id, void *, id))v8)[2](v8, v17, 0);
          id v19 = 0;
        }
      }
      else
      {
        CFStringRef v21 = [(PDEndpointServer *)self database];
        uint64_t v22 = objc_opt_class();
        id v40 = v7;
        uint64_t v23 = +[NSArray arrayWithObjects:&v40 count:1];
        id v24 = [v21 select:v22 where:@"objectID = ?" bindings:v23];

        if (v24)
        {
          id v34 = 0;
          v25 = [(PDEndpointServer *)self _createHandoutAssignedItemFrom:v24 withError:&v34];
          id v19 = v34;
          if ([v25 effectiveAuthorizationStatus] == (id)2)
          {
            id v33 = v19;
            +[NSError cls_assignError:&v33 code:4 description:@"Not Authorized"];
            id v26 = v33;

            v8[2](v8, 0, v26);
            uint64_t v17 = 0;
            id v19 = v26;
          }
          else
          {
            BOOL v28 = [(PDEndpointServer *)self database];
            uint64_t v29 = objc_opt_class();
            uint64_t v30 = [v25 objectID];
            CFStringRef v39 = v30;
            v31 = +[NSArray arrayWithObjects:&v39 count:1];
            uint64_t v17 = [v28 select:v29 where:@"objectID = ?" bindings:v31];

            ((void (**)(id, void *, id))v8)[2](v8, v17, v19);
          }
        }
        else
        {
          CLSInitLog();
          id v27 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Unable call to remote_validateAndCreateHandoutAssignedItem. Progress tracking is not allowed, failed to find handout attachment.", buf, 2u);
          }
          id v35 = 0;
          +[NSError cls_assignError:&v35 code:4 description:@"Not Authorized"];
          id v19 = v35;
          v8[2](v8, 0, v19);
          uint64_t v17 = 0;
        }
      }
    }
  }
  else
  {
    CLSInitLog();
    uint64_t v32 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Skipping remote_validateAndCreateHandoutAssignedItem from invalid client", buf, 2u);
    }
    id v19 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
    v8[2](v8, 0, v19);
  }
}

- (id)_createHandoutAssignedItemFrom:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10000B634;
  uint64_t v23 = sub_10000B534;
  id v24 = 0;
  id v7 = [(PDEndpointServer *)self client];
  id v8 = sub_10000C6B4(v7);
  if ([v8 length])
  {
    BOOL v9 = [(PDEndpointServer *)self database];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002EA18;
    v13[3] = &unk_1001F2198;
    id v14 = v7;
    id v15 = v6;
    id v16 = v8;
    uint64_t v17 = self;
    uint64_t v18 = &v19;
    unsigned __int8 v10 = [v9 withSyncEnabled:v13];

    if (v10)
    {
      id v11 = (id)v20[5];
    }
    else
    {
      +[NSError cls_assignError:a4 code:100 description:@"Unable to create CLSHandoutAssignedItem."];
      id v11 = 0;
    }
  }
  else
  {
    +[NSError cls_assignError:a4 code:2 description:@"Unable to determine bundle identifier."];
    id v11 = 0;
  }

  _Block_object_dispose(&v19, 8);

  return v11;
}

- (void)remote_fetchAndCompleteActiveAssignedActivitiesForContextPath:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  BOOL v9 = [(PDEndpointServer *)self client];
  if (!v9 || (int v10 = v9[30], v9, !v10))
  {
    CLSInitLog();
    id v20 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Skipping remote_fetchAndCompleteActiveAssignedActivitiesForContextPath from invalid client", buf, 2u);
    }
    uint64_t v12 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
    goto LABEL_20;
  }
  if ((sub_1000A5C14() & 1) == 0)
  {
    id v25 = 0;
    +[NSError cls_assignError:&v25 code:322 description:@"No-Op for mark all assigned activities complete. Schoolwork is not installed."];
    uint64_t v12 = v25;
    CLSInitLog();
    uint64_t v18 = CLSLogHandout;
    if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "markAsComplete: %{public}@", buf, 0xCu);
    }
LABEL_20:
    v8[2](v8, 0, v12);
    goto LABEL_21;
  }
  id v11 = [(PDEndpointServer *)self database];
  uint64_t v12 = v11;
  if (v11) {
    unint64_t v13 = ((unint64_t)sub_100004B84(v11) >> 1) & 1;
  }
  else {
    LODWORD(v13) = 0;
  }
  if (!sub_100066C68(v12) || v13)
  {
    id v24 = 0;
    +[NSError cls_assignError:&v24 code:323 description:@"Unable call to fetchAndCompleteAllAssignedActivitiesForContextPath. Progress tracking is not allowed."];
    id v16 = v24;
    CLSInitLog();
    uint64_t v19 = CLSLogHandout;
    if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "markAsComplete: %{public}@", buf, 0xCu);
    }
    v8[2](v8, 0, v16);
  }
  else
  {
    id v14 = sub_10002D20C(self, v7);
    id v15 = objc_opt_new();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002F128;
    v21[3] = &unk_1001F21C0;
    v21[4] = self;
    id v16 = v14;
    id v22 = v16;
    uint64_t v23 = v8;
    [v15 setCompletion:v21];
    if (v16) {
      uint64_t v17 = v16[3];
    }
    else {
      uint64_t v17 = 0;
    }
    [(PDEndpointServer *)self saveObjects:v17 saveResponse:v15 isRemoteClient:0 completion:&stru_1001F21E0];
  }
LABEL_21:
}

- (id)_createMainAppContext:(id *)a3
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10000B634;
  uint64_t v23 = sub_10000B534;
  id v24 = 0;
  id v5 = [(PDEndpointServer *)self client];
  id v6 = sub_10000C6B4(v5);
  if ([v6 length])
  {
    id v7 = [(PDEndpointServer *)self database];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    unint64_t v13 = sub_10002FAF0;
    id v14 = &unk_1001F2208;
    uint64_t v18 = &v19;
    id v15 = v6;
    id v16 = self;
    uint64_t v17 = v5;
    unsigned __int8 v8 = [v7 withSyncEnabled:&v11];

    if (v8)
    {
      id v9 = (id)v20[5];
    }
    else
    {
      +[NSError cls_assignError:a3, 100, @"Unable to create main app context.", v11, v12, v13, v14, v15, v16 code description];
      id v9 = 0;
    }
  }
  else
  {
    +[NSError cls_assignError:a3 code:2 description:@"Unable to determine bundle identifier."];
    id v9 = 0;
  }

  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void)remote_addAdminRequestor:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  sub_100005DDC((uint64_t)self, a2);
  unsigned __int8 v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[29], v8, v9))
  {
    int v10 = [(PDEndpointServer *)self database];
    unsigned __int8 v11 = [v10 insertOrUpdateObject:v15];

    if (v11)
    {
      uint64_t v12 = 0;
    }
    else
    {
      unint64_t v13 = [v15 email];
      uint64_t v12 = +[NSError cls_createErrorWithCode:100, @"Failed to create requestor: %@", v13 format];
    }
    if (v12) {
      id v14 = 0;
    }
    else {
      id v14 = v15;
    }
    ((void (**)(id, id, void *))v7)[2](v7, v14, v12);
  }
  else
  {
    uint64_t v12 = +[NSError cls_createErrorWithCode:4 description:@"Use pdtool"];
    v7[2](v7, 0, v12);
  }
}

- (void)remote_addOrganization:(id)a3 withLocations:(id)a4 completion:(id)a5
{
  id v20 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, void *))a5;
  sub_100005DDC((uint64_t)self, a2);
  unsigned __int8 v11 = [(PDEndpointServer *)self client];
  if (v11 && (int v12 = v11[29], v11, v12))
  {
    unint64_t v13 = [(PDEndpointServer *)self database];
    unsigned __int8 v14 = [v13 insertOrUpdateObject:v20];

    if (v14)
    {
      if ([v9 count]
        && ([(PDEndpointServer *)self database],
            id v15 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v16 = [v15 insertOrUpdateObjects:v9],
            v15,
            (v16 & 1) == 0))
      {
        uint64_t v17 = +[NSError cls_createErrorWithCode:100, @"Failed to create locations: %@", v9 format];
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v18 = [v20 objectID];
      uint64_t v17 = +[NSError cls_createErrorWithCode:100, @"Failed to create organization: %@", v18 format];
    }
    if (v17) {
      id v19 = 0;
    }
    else {
      id v19 = v20;
    }
    ((void (**)(id, id, void *))v10)[2](v10, v19, v17);
  }
  else
  {
    uint64_t v17 = +[NSError cls_createErrorWithCode:4 description:@"Use pdtool"];
    v10[2](v10, 0, v17);
  }
}

- (void)remote_deleteOrganization:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(id, id, void *))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = [(PDEndpointServer *)self client];
  if (v9 && (int v10 = v9[29], v9, v10))
  {
    unsigned __int8 v11 = [(PDEndpointServer *)self database];
    uint64_t v12 = objc_opt_class();
    id v17 = v7;
    unint64_t v13 = +[NSArray arrayWithObjects:&v17 count:1];
    id v14 = [v11 deleteAll:v12 where:@"objectID = ?" bindings:v13];

    if (v14)
    {
      id v15 = 0;
    }
    else
    {
      id v15 = +[NSError cls_createErrorWithCode:100, @"Failed to delete organization with identifier: %@", v7 format];
    }
    v8[2](v8, v14, v15);
  }
  else
  {
    unsigned __int8 v16 = +[NSError cls_createErrorWithCode:4 description:@"Use pdtool"];
    v8[2](v8, 0, v16);
  }
}

- (void)remote_mainAppContextWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *, id))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = 0;
  id v7 = [(PDEndpointServer *)self _createMainAppContext:&v9];
  id v8 = v9;
  v5[2](v5, v7, v8);
}

- (void)_performQuery:(id)a3 querySpecification:(id)a4 issueServerRequest:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  unint64_t v13 = (void (**)(void))a6;
  sub_100005DDC((uint64_t)self, a2);
  uint64_t v15 = [v12 entityName];
  Class v16 = NSClassFromString((NSString *)v15);

  id v41 = 0;
  LOBYTE(v15) = sub_10003077C((uint64_t)self, v16, (uint64_t)&v41);
  id v17 = v41;
  uint64_t v18 = v17;
  if (v15)
  {
    BOOL v29 = v7;
    id v27 = v17;
    BOOL v28 = v14;
    uint64_t v30 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_1001F2228];

    id v19 = [v12 predicate];
    v31 = [(PDEndpointServer *)self _clientScopedPredicate:v19 forEntityClass:v16];

    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:50];
    uint64_t v37 = 0;
    CFStringRef v38 = &v37;
    uint64_t v39 = 0x2020000000;
    id v40 = 0;
    id v40 = [v12 offset];
    uint64_t v21 = [(PDEndpointServer *)self database];
    id v22 = [v12 sortDescriptors];
    id v23 = [v12 limit];
    id v24 = [v12 offset];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000309C0;
    v32[3] = &unk_1001F2250;
    id v35 = &v37;
    id v25 = v20;
    id v33 = v25;
    uint64_t v36 = 50;
    id v11 = v30;
    id v34 = v11;
    sub_1000465E4(v21, v16, v31, v22, (uint64_t)v23, (uint64_t)v24, v32);

    if ([v25 count]) {
      objc_msgSend(v11, "clientRemote_deliverObject:", v25);
    }
    if (v29
      && [(objc_class *)v16 conformsToProtocol:&OBJC_PROTOCOL___PDEndpointServerEntityHooks])
    {
      id v26 = [v12 predicate];
      [(objc_class *)v16 endpointServer:self willQueryForObjectWithPredicate:v26];
    }
    objc_msgSend(v11, "clientRemote_finishWithOffset:error:", v38[3], 0);
    v13[2](v13);

    _Block_object_dispose(&v37, 8);
    uint64_t v18 = v27;
    id v14 = v28;
  }
  else
  {
    objc_msgSend(v11, "clientRemote_finishWithOffset:error:", 0, v17);
    v13[2](v13);
  }
}

- (void)remote_executeQuery:(id)a3 querySpecification:(id)a4 searchSpecification:(id)a5 issueServerRequest:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  Class v16 = (void (**)(void))a7;
  sub_100005DDC((uint64_t)self, a2);
  id v17 = [(PDEndpointServer *)self client];
  if (v17 && (int v18 = v17[30], v17, v18))
  {
    if (v15)
    {
      id v19 = [(PDEndpointServer *)self daemon];
      id v79 = 0;
      unsigned __int8 v20 = [v15 isValid:!sub_1000CCDD4(v19) error:&v79];
      id v65 = v79;

      if ((v20 & 1) == 0)
      {
        CLSInitLog();
        id v26 = (void *)CLSLogSearch;
        if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v53 = v26;
          [v15 options];
          id v54 = NSStringFromSearchOptions();
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v54;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v65;
          _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Skipping search query (options: %@). reason: %{public}@", buf, 0x16u);
        }
        objc_msgSend(v13, "clientRemote_finishWithOffset:error:", 0, 0);
        v16[2](v16);
        goto LABEL_41;
      }
      uint64_t v21 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&stru_1001F2270];

      id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:50];
      uint64_t v75 = 0;
      id v76 = &v75;
      uint64_t v77 = 0x2020000000;
      id v78 = 0;
      id v78 = [v14 offset];
      id v23 = [(PDEndpointServer *)self database];
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_1000313B4;
      v68[3] = &unk_1001F2298;
      uint64_t v73 = &v75;
      id v67 = v22;
      id v69 = v67;
      uint64_t v74 = 50;
      id v13 = v21;
      id v70 = v13;
      id v24 = v15;
      id v71 = v24;
      id v66 = v23;
      id v72 = v66;
      v63 = objc_retainBlock(v68);
      uint64_t v25 = sub_100003A74(v66);
      id v64 = (void *)v25;
      if (v25 && *(unsigned char *)(v25 + 9)) {
        [v24 sanitizeSpecForEDUMAID];
      }
      else {
        [v24 sanitizeSpecForABMMAID];
      }
      sub_100019EC8(v66, v24, (uint64_t)[v14 offset], (uint64_t)objc_msgSend(v14, "limit"), v63);
      if ([v67 count])
      {
        CLSInitLog();
        id v27 = CLSLogSearch;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v55 = [v67 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v55;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Delivering %lu remaining objects (local).", buf, 0xCu);
        }

        objc_msgSend(v13, "clientRemote_deliverObject:", v67);
        [v67 removeAllObjects];
      }
      BOOL v28 = [v24 searchString];
      BOOL v29 = (unint64_t)[v28 length] > 1;

      if (v29)
      {
        uint64_t v30 = +[PDASMSearchStringCache shared];
        v31 = [v24 searchString];
        unsigned int v32 = [v30 isCached:v31];

        if (v32)
        {
          CLSInitLog();
          id v33 = CLSLogSearch;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            id v34 = [v24 searchString];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "String: '%@' appears in search string cache.  Returning.", buf, 0xCu);
          }
          objc_msgSend(v13, "clientRemote_finishWithOffset:error:", v76[3], 0);
          v16[2](v16);
          goto LABEL_39;
        }
      }
      if ([v24 isGroupMemberSearch])
      {
        id v35 = [v24 requiredGroupMemberGroupIDs];
        BOOL v36 = [v35 count] == 0;

        if (!v36)
        {
          CLSInitLog();
          uint64_t v37 = CLSLogSearch;
          if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Search is for group expansion.  Just using local results.", buf, 2u);
          }
          objc_msgSend(v13, "clientRemote_finishWithOffset:error:", v76[3], 0);
          v16[2](v16);
          goto LABEL_40;
        }
      }
      CFStringRef v38 = [(PDEndpointServer *)self daemon];
      unsigned int v58 = [v38 mode];
      id v60 = v38;
      uint64_t v39 = [v38 operationsManager];
      BOOL v57 = sub_100003494((BOOL)v39);

      id v59 = v14;
      uint64_t v40 = v76[3];
      id v41 = v24;
      id v42 = v13;
      id v43 = v64;
      id v44 = v67;
      uint64_t v45 = v44;
      if (self)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_10003B558;
        v81 = &unk_1001F2588;
        id v82 = v44;
        id v83 = v42;
        v84 = self;
        id v85 = v41;
        id v86 = v43;
        uint64_t v87 = v40;
        id v14 = v59;
        v46 = objc_retainBlock(buf);
        id v61 = objc_retainBlock(v46);
      }
      else
      {
        id v61 = 0;
        id v14 = v59;
      }

      uint64_t v47 = sub_10001B670(v66, v41, !v57, v63, v61);
      unsigned int v48 = v47;
      if (v58
        || !v47
        || ![v47 needsToMakeNetworkRequest]
        || ([v38 operationsManager],
            uint64_t v49 = objc_claimAutoreleasedReturnValue(),
            BOOL v50 = v49 == 0,
            v49,
            v50))
      {
        CLSInitLog();
        v52 = CLSLogSearch;
        if (os_log_type_enabled(CLSLogSearch, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "Finishing query (local).", buf, 2u);
        }
        objc_msgSend(v42, "clientRemote_finishWithOffset:error:", v76[3], 0);
      }
      else
      {
        uint64_t v51 = [v60 operationsManager];
        sub_100110A9C(v51, v48);
      }
      v16[2](v16);

      uint64_t v30 = v60;
LABEL_39:

LABEL_40:
      _Block_object_dispose(&v75, 8);

LABEL_41:

      goto LABEL_45;
    }
    [(PDEndpointServer *)self _performQuery:v13 querySpecification:v14 issueServerRequest:v8 completion:v16];
  }
  else
  {
    CLSInitLog();
    id v56 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Skipping remote_executeQuery from invalid client", buf, 2u);
    }
    objc_msgSend(v13, "clientRemote_finishWithOffset:error:", 0, 0);
    v16[2](v16);
  }
LABEL_45:
}

- (void)remote_contextsMatchingIdentifierPath:(id)a3 parentContextID:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a5;
  sub_100005DDC((uint64_t)self, a2);
  id v12 = [(PDEndpointServer *)self database];
  id v13 = [v12 select:objc_opt_class() identity:v10];

  id v14 = [(PDEndpointServer *)self database];
  id v15 = sub_100143514(v14, v9, v13);

  Class v16 = [(PDEndpointServer *)self client];
  if (v16) {
    BOOL v17 = v16[24] != 0;
  }
  else {
    BOOL v17 = 0;
  }

  int v18 = [(PDEndpointServer *)self client];
  id v19 = sub_10000C6B4(v18);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v15;
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v21)
  {
    uint64_t v30 = v13;
    id v31 = v10;
    id v32 = v9;
    uint64_t v22 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v20);
        }
        if (!v17)
        {
          id v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v25 = [v24 appIdentifier];
          id v26 = v25;
          if (v19)
          {
            if (!v25) {
              goto LABEL_19;
            }
            id v27 = [v24 appIdentifier];
            unsigned __int8 v28 = [v19 isEqualToString:v27];

            if ((v28 & 1) == 0) {
              goto LABEL_19;
            }
          }
          else if (v25)
          {

LABEL_19:
            id v9 = v32;
            id v21 = +[NSError cls_createErrorWithCode:4, @"Can't fetch contexts at path: %@", v32 format];
            BOOL v29 = 0;
            goto LABEL_20;
          }
        }
      }
      id v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v21) {
        continue;
      }
      break;
    }
    BOOL v29 = v20;
    id v9 = v32;
LABEL_20:
    id v13 = v30;
    id v10 = v31;
  }
  else
  {
    BOOL v29 = v20;
  }

  v11[2](v11, v29, v21);
}

- (void)remote_fetchThumbnailBlobForContextID:(id)a3 completion:(id)a4
{
  BOOL v7 = (void (**)(id, void *, void))a4;
  id v8 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = [(PDEndpointServer *)self database];
  uint64_t v10 = objc_opt_class();
  id v13 = v8;
  id v11 = +[NSArray arrayWithObjects:&v13 count:1];

  id v12 = [v9 select:v10 where:@"parentObjectID = ?" bindings:v11];

  v7[2](v7, v12, 0);
}

- (void)remote_deleteThumbnailBlobForContextID:(id)a3 completion:(id)a4
{
  BOOL v7 = (void (**)(id, id, void))a4;
  id v8 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = [(PDEndpointServer *)self database];
  uint64_t v10 = objc_opt_class();
  id v13 = v8;
  id v11 = +[NSArray arrayWithObjects:&v13 count:1];

  id v12 = [v9 deleteAll:v10 where:@"parentObjectID = ?" bindings:v11];
  v7[2](v7, v12, 0);
}

- (void)remote_fetchProgressReportingCapabilitiesForContextID:(id)a3 completion:(id)a4
{
  BOOL v7 = (void (**)(id, id, void))a4;
  id v8 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = objc_opt_new();
  uint64_t v10 = [(PDEndpointServer *)self database];
  uint64_t v11 = objc_opt_class();
  id v16 = v8;
  id v12 = +[NSArray arrayWithObjects:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100031B94;
  v14[3] = &unk_1001F22C0;
  id v15 = v9;
  id v13 = v9;
  [v10 selectAll:v11 where:@"parentObjectID = ?" bindings:v12 block:v14];

  v7[2](v7, v13, 0);
}

- (void)remote_deleteProgressReportingCapabilitiesForContextID:(id)a3 completion:(id)a4
{
  BOOL v7 = (void (**)(id, id, void))a4;
  id v8 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = [(PDEndpointServer *)self database];
  uint64_t v10 = objc_opt_class();
  id v13 = v8;
  uint64_t v11 = +[NSArray arrayWithObjects:&v13 count:1];

  id v12 = [v9 deleteAll:v10 where:@"parentObjectID = ?" bindings:v11];
  v7[2](v7, v12, 0);
}

- (void)remote_fetchContextsForContextIDs:(id)a3 completion:(id)a4
{
  BOOL v7 = (void (**)(id, id, void))a4;
  id v8 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = objc_opt_new();
  uint64_t v10 = +[PDDatabase whereSQLForArray:v8 prefix:@"objectID in "];
  uint64_t v11 = [(PDEndpointServer *)self database];
  uint64_t v12 = objc_opt_class();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100031DF4;
  v14[3] = &unk_1001F2058;
  id v15 = v9;
  id v13 = v9;
  [v11 selectAll:v12 where:v10 bindings:v8 block:v14];

  v7[2](v7, v13, 0);
}

- (void)remote_getServerSyncStatusWithCompletion:(id)a3
{
  id v13 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v6 = [(PDEndpointServer *)self client];
  if (v6 && (int v7 = v6[26], v6, v7))
  {
    id v8 = [(PDEndpointServer *)self database];
    uint64_t v9 = sub_100051044(v8);
    if (sub_1000510B8(v8)) {
      v9 |= 2uLL;
    }
    if (sub_10005112C(v8)) {
      uint64_t v10 = v9 | 4;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:v10];
    uint64_t v12 = (void (*)(void))v13[2];
  }
  else
  {
    id v8 = +[NSError cls_createErrorWithCode:4 description:@"Not Authorized"];
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:0];
    uint64_t v12 = (void (*)(void))v13[2];
  }
  v12();
}

- (void)remote_getServerInternalStateInfoWithCompletion:(id)a3
{
  id v23 = (void (**)(id, id, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v6 = [(PDEndpointServer *)self client];
  if (v6 && (int v7 = v6[26], v6, v7))
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v9 = [(PDEndpointServer *)self database];
    uint64_t v10 = CLSSyncInitialRosterSyncDateKey;
    uint64_t v11 = sub_1001602E8(v9, CLSSyncInitialRosterSyncDateKey);
    [v8 setObject:v11 forKeyedSubscript:v10];

    uint64_t v12 = CLSSyncInitialHandoutSyncDateKey;
    id v13 = sub_1001602E8(v9, CLSSyncInitialHandoutSyncDateKey);
    [v8 setObject:v13 forKeyedSubscript:v12];

    uint64_t v14 = CLSSyncLatestRosterSyncDateKey;
    id v15 = sub_1001602E8(v9, CLSSyncLatestRosterSyncDateKey);
    [v8 setObject:v15 forKeyedSubscript:v14];

    uint64_t v16 = CLSSyncLatestHandoutSyncDateKey;
    BOOL v17 = sub_1001602E8(v9, CLSSyncLatestHandoutSyncDateKey);
    [v8 setObject:v17 forKeyedSubscript:v16];

    uint64_t v18 = CLSSyncLatestRosterSyncFailureDateKey;
    id v19 = sub_1001602E8(v9, CLSSyncLatestRosterSyncFailureDateKey);
    [v8 setObject:v19 forKeyedSubscript:v18];

    uint64_t v20 = CLSSyncLatestHandoutSyncFailureDateKey;
    id v21 = sub_1001602E8(v9, CLSSyncLatestHandoutSyncFailureDateKey);
    [v8 setObject:v21 forKeyedSubscript:v20];

    id v22 = [v8 copy];
    v23[2](v23, v22, 0);
  }
  else
  {
    id v8 = +[NSError cls_createErrorWithCode:4 description:@"Not Authorized"];
    ((void (**)(id, id, id))v23)[2](v23, 0, v8);
  }
}

- (void)remote_fetchCountOfActivitiesForContextID:(id)a3 completion:(id)a4
{
  int v7 = (void (**)(id, void *, void))a4;
  id v8 = a3;
  sub_100005DDC((uint64_t)self, a2);
  uint64_t v9 = [(PDEndpointServer *)self database];
  uint64_t v10 = objc_opt_class();
  id v14 = v8;
  uint64_t v11 = +[NSArray arrayWithObjects:&v14 count:1];
  id v12 = [v9 count:v10 where:@"parentObjectID = ?" bindings:v11];

  id v13 = +[NSNumber numberWithUnsignedInteger:v12];

  v7[2](v7, v13, 0);
}

- (void)remote_authTreeWithCompletion:(id)a3
{
  id v13 = (void (**)(id, id, id))a3;
  id v5 = [(PDEndpointServer *)self database];
  id v6 = v5;
  if (v5 && (sub_100004B84(v5) & 2) != 0)
  {
    id v11 = objc_alloc((Class)CLSAuthTree);
    uint64_t v12 = 0;
  }
  else
  {
    if (sub_100066C68(v6))
    {
      int v7 = [(PDEndpointServer *)self client];
      id v8 = sub_10000C6B4(v7);

      sub_100143838(v6, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = 0;

      goto LABEL_8;
    }
    id v11 = objc_alloc((Class)CLSAuthTree);
    uint64_t v12 = 2;
  }
  id v9 = objc_msgSend(v11, "initWithOverridingStatus:", v12, v13);
  id v10 = 0;
LABEL_8:
  v13[2](v13, v9, v10);
}

- (void)remote_authTreeForAttachment:(id)a3 withCompletion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, id, id))a4;
  id v8 = [(PDEndpointServer *)self database];
  id v9 = v8;
  if (v8 && (sub_100004B84(v8) & 2) != 0)
  {
    id v12 = objc_alloc((Class)CLSAuthTree);
    uint64_t v13 = 0;
  }
  else
  {
    if (sub_100066C68(v9))
    {
      sub_10001D644(v9, v14);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = 0;
      goto LABEL_8;
    }
    id v12 = objc_alloc((Class)CLSAuthTree);
    uint64_t v13 = 2;
  }
  id v10 = objc_msgSend(v12, "initWithOverridingStatus:", v13, v14);
  id v11 = 0;
LABEL_8:
  v6[2](v6, v10, v11);
}

- (void)remote_saveObjects:(id)a3 saveResponse:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  [(PDEndpointServer *)self saveObjects:v11 saveResponse:v8 isRemoteClient:1 completion:v9];
}

- (void)saveObjects:(id)a3 saveResponse:(id)a4 isRemoteClient:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v43 = a3;
  id v47 = a4;
  v46 = (void (**)(void))a6;
  sub_100005DDC((uint64_t)self, a2);
  id v11 = [(PDEndpointServer *)self _createMainAppContext:0];
  id v12 = [(PDEndpointServer *)self client];
  uint64_t v45 = sub_10000C6B4(v12);

  uint64_t v13 = [(PDEndpointServer *)self database];
  id v14 = v13;
  if (v13) {
    unint64_t v15 = ((unint64_t)sub_100004B84(v13) >> 1) & 1;
  }
  else {
    LOBYTE(v15) = 0;
  }
  uint64_t v16 = sub_100003E58(v14);
  id v44 = [v16 objectID];

  BOOL v17 = [(PDEndpointServer *)self client];
  if (v17) {
    BOOL v41 = v17[25] != 0;
  }
  else {
    BOOL v41 = 0;
  }

  if (v7)
  {
    uint64_t v18 = [(PDEndpointServer *)self client];
    if (v18) {
      BOOL v19 = v18[26] != 0;
    }
    else {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 1;
  }
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 0;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  void v71[2] = sub_100032D30;
  v71[3] = &unk_1001F22E0;
  char v72 = v15;
  id v42 = objc_retainBlock(v71);
  if (v7)
  {
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100032DCC;
    v69[3] = &unk_1001F2698;
    id v70 = v46;
    uint64_t v20 = [v47 synchronousRemoteObjectProxyWithErrorHandler:v69];

    id v47 = (id)v20;
  }
  id v21 = [(PDEndpointServer *)self client];
  if (v21)
  {
    BOOL v22 = v21[30] == 0;

    if (!v22)
    {
      id v23 = objc_opt_new();
      id v24 = [PDSchoolworkCollaborationStateChangeManager alloc];
      uint64_t v25 = [(PDEndpointServer *)self client];
      id v26 = sub_10000C6B4(v25);
      id v27 = [(PDEndpointServer *)self database];
      unsigned __int8 v28 = sub_1000FF428((id *)&v24->super.isa, v26, v27);

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      _OWORD v55[2] = sub_100032DDC;
      v55[3] = &unk_1001F2308;
      id v56 = v14;
      id v29 = v43;
      id v57 = v29;
      id v30 = v23;
      id v65 = v73;
      id v58 = v30;
      id v59 = self;
      BOOL v66 = v19;
      BOOL v67 = v41;
      id v60 = v45;
      id v64 = v42;
      char v68 = v15;
      id v61 = v44;
      id v31 = v28;
      id v62 = v31;
      id v32 = v47;
      id v63 = v32;
      if ([v56 withSyncEnabled:v55] && !objc_msgSend(v30, "count"))
      {
        long long v36 = 0;
        goto LABEL_25;
      }
      id v33 = [v30 count];
      if (v33)
      {
        if (v33 != (id)1)
        {
          v80[0] = CLSErrorUnderlyingErrorsKey;
          v80[1] = NSLocalizedDescriptionKey;
          v81[0] = v30;
          v81[1] = @"Save failed!";
          uint64_t v37 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
          long long v36 = +[NSError errorWithDomain:CLSClassKitDomainIdentifier code:9 userInfo:v37];

          goto LABEL_25;
        }
        uint64_t v34 = [v30 firstObject];
      }
      else
      {
        CLSInitLog();
        long long v35 = CLSLogDefault;
        if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v29;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Save failed; objects: %@",
            (uint8_t *)&buf,
            0xCu);
        }
        uint64_t v34 = +[NSError cls_createErrorWithCode:3 description:@"Save failed!"];
      }
      long long v36 = (void *)v34;
LABEL_25:
      objc_msgSend(v32, "clientRemote_saveDone:", v36);
      CFStringRef v38 = sub_1000FF7A4(v31);
      if ([v38 count])
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v76 = 0x3032000000;
        uint64_t v77 = sub_10000B634;
        id v78 = sub_10000B534;
        uint64_t v39 = [(PDEndpointServer *)self client];
        sub_10000C6B4(v39);
        id v79 = (id)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1000338B4;
        v48[3] = &unk_1001F2358;
        objc_copyWeak(&v53, &location);
        p_long long buf = &buf;
        uint64_t v49 = v31;
        BOOL v50 = self;
        uint64_t v51 = v46;
        [(PDEndpointServer *)self entitled_publishCollaborationStateChanges:v38 completion:v48];

        objc_destroyWeak(&v53);
        objc_destroyWeak(&location);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        v46[2]();
      }

      goto LABEL_34;
    }
  }
  CLSInitLog();
  uint64_t v40 = CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Skipping saveObjects from invalid client", (uint8_t *)&buf, 2u);
  }
  objc_msgSend(v47, "clientRemote_saveDone:", 0);
LABEL_34:

  _Block_object_dispose(v73, 8);
}

- (void)remote_getCurrentUseriCloudQuotaInfoWithCompletion:(id)a3
{
  id v11 = a3;
  id v6 = +[PDUserDefaults sharedDefaults];
  unsigned int v7 = [v6 enableVerboseLogging];

  if (v7) {
    CLSLogDebugCurrentPersona();
  }
  sub_100005DDC((uint64_t)self, a2);
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    sub_100043E7C((uint64_t)PDAccountInfo, v11);
  }
  else
  {
    id v10 = +[NSError cls_createErrorWithCode:4 description:@"Not Authorized"];
    (*((void (**)(id, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, v10);
  }
}

- (void)remote_registerDataObserver:(id)a3 withID:(id)a4 querySpecification:(id)a5 oldChangeTag:(unint64_t)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void (**)(id, void))a7;
  sub_100005DDC((uint64_t)self, a2);
  BOOL v17 = [(PDEndpointServer *)self client];
  if (v17 && (int v18 = v17[30], v17, v18))
  {
    uint64_t v19 = [v15 entityName];
    Class v20 = NSClassFromString((NSString *)v19);

    id v33 = 0;
    LOBYTE(v19) = sub_10003077C((uint64_t)self, v20, (uint64_t)&v33);
    id v21 = v33;
    if (v19)
    {
      BOOL v22 = sub_1000D42B8([PDDataObserver alloc], v13, (uint64_t)v20, (uint64_t)[v15 observerOptions]);
      id v23 = [(PDEndpointServer *)self database];
      id v32 = v21;
      char v24 = sub_1000D43E0((uint64_t)v22, v23, v15, a6, (uint64_t)&v32);
      id v25 = v32;

      if (v24)
      {
        queue = self->_queue;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1000342C8;
        v28[3] = &unk_1001F25F8;
        v28[4] = self;
        id v29 = v14;
        id v30 = v22;
        id v31 = v23;
        dispatch_sync(queue, v28);
        v16[2](v16, 0);
      }
      else
      {
        if (v22 && !*((unsigned char *)v22 + 48))
        {
          [v22 setInvalidated:1];
          objc_msgSend((id)v22[8], "clientRemote_invalidate");
        }
        ((void (**)(id, id))v16)[2](v16, v25);
      }
    }
    else
    {
      objc_msgSend(v13, "clientRemote_invalidate");
      ((void (**)(id, id))v16)[2](v16, v21);
      id v25 = v21;
    }
  }
  else
  {
    CLSInitLog();
    id v27 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Skipping remote_registerDataObserver from invalid client", buf, 2u);
    }
    objc_msgSend(v13, "clientRemote_invalidate");
    id v25 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
    ((void (**)(id, id))v16)[2](v16, v25);
  }
}

- (void)remote_deregisterDataObserverWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100034458;
  v10[3] = &unk_1001F2710;
  void v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  int v9 = (void (**)(void))a4;
  dispatch_sync(queue, v10);
  v9[2](v9);
}

- (void)_invalidateObserver:(id)a3
{
  if (a3 && !*((unsigned char *)a3 + 48))
  {
    [a3 setInvalidated:1];
    BOOL v4 = (void *)*((void *)a3 + 8);
    objc_msgSend(v4, "clientRemote_invalidate");
  }
}

- (void)remote_featureIsEnabled:(int)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, uint64_t))a4;
  unsigned int v7 = [(PDEndpointServer *)self client];
  if (!v7 || (int v8 = v7[30], v7, !v8))
  {
    CLSInitLog();
    id v12 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      v14[0] = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Skipping remote_featureIsEnabled from invalid client", (uint8_t *)v14, 2u);
    }
    uint64_t v9 = +[NSError cls_createErrorWithCode:4 format:@"Not Authorized"];
    goto LABEL_9;
  }
  if (a3)
  {
    uint64_t v9 = +[NSError errorWithDomain:CLSErrorCodeDomain code:314 userInfo:0];
LABEL_9:
    id v13 = (void *)v9;
    v6[2](v6, 0, v9);

    goto LABEL_10;
  }
  id v10 = [(PDEndpointServer *)self database];
  id v11 = [v10 entityExistsByClass:objc_opt_class() identity:@"ee.publishClass"];

  ((void (**)(id, id, uint64_t))v6)[2](v6, v11, 0);
LABEL_10:
}

- (void)remote_getUserDefaultsConfigurationDictionaryWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void))a3;
  id v8 = 0;
  unsigned __int8 v5 = [(PDEndpointServer *)self isInternalWithError:&v8];
  id v6 = v8;
  if (v5)
  {
    unsigned int v7 = +[PDUserDefaults configurationDictionary];
    v4[2](v4, v7, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v6);
  }
}

- (void)remote_getUserDefaultForDefaultNamed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *, void))a4;
  id v12 = 0;
  unsigned __int8 v8 = [(PDEndpointServer *)self isInternalWithError:&v12];
  id v9 = v12;
  if (v8)
  {
    id v10 = +[PDUserDefaults sharedDefaults];
    id v11 = [v10 valueForDefaultNamed:v6];
    v7[2](v7, v11, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v7)[2](v7, 0, v9);
  }
}

- (void)remote_setUserDefaultValue:(id)a3 forDefaultNamed:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  id v17 = 0;
  unsigned __int8 v11 = [(PDEndpointServer *)self isInternalWithError:&v17];
  id v12 = v17;
  if (v11)
  {
    id v13 = +[PDUserDefaults sharedDefaults];
    id v16 = v12;
    id v14 = [v13 setValue:v8 forDefaultNamed:v9 error:&v16];
    id v15 = v16;

    v10[2](v10, v14, v15);
    id v12 = v15;
  }
  else
  {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_addAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  sub_100005DDC((uint64_t)self, a2);
  id v16 = 0;
  unsigned __int8 v11 = [(PDEndpointServer *)self isInternalWithError:&v16];
  id v12 = v16;
  if (v11)
  {
    id v13 = [(PDEndpointServer *)self database];
    id v14 = sub_10001CA14(v13, a3, v9);

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = +[NSError cls_createErrorWithCode:100, @"failed to add authorization at objectID: %@", v9 format];

      id v12 = (id)v15;
    }
    v10[2](v10, v14, v12);
  }
  else
  {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_removeAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, id, id))a5;
  sub_100005DDC((uint64_t)self, a2);
  id v16 = 0;
  unsigned __int8 v11 = [(PDEndpointServer *)self isInternalWithError:&v16];
  id v12 = v16;
  if (v11)
  {
    id v13 = [(PDEndpointServer *)self database];
    id v14 = sub_10001CCEC(v13, a3, v9);

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = +[NSError cls_createErrorWithCode:100, @"failed to remove authorization at objectID: %@", v9 format];

      id v12 = (id)v15;
    }
    v10[2](v10, v14, v12);
  }
  else
  {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_urlSuitableForOpeningForExpectedURL:(id)a3 itemID:(id)a4 ownerName:(id)a5 zoneName:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(PDEndpointServer *)self client];
  if (v17 && (int v18 = v17[26], v17, v18))
  {
    uint64_t v19 = sub_100124888((uint64_t)PDFileSyncManager, 0);
    uint64_t v20 = sub_1000062FC();
    id v21 = (void *)v20;
    if (v20) {
      BOOL v22 = *(void **)(v20 + 72);
    }
    else {
      BOOL v22 = 0;
    }
    id v23 = v22;
    id v26 = v12;
    id v27 = v19;
    id v28 = v13;
    id v29 = v14;
    id v30 = v15;
    id v31 = v16;
    id v24 = v19;
    CLSPerformWithPersona();
  }
  else
  {
    id v25 = +[NSError cls_createErrorWithCode:4 description:@"Fetching URL for asset not allowed."];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v25);
  }
}

- (void)remote_cloudKitThumbnailUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    uint64_t v10 = sub_1000062FC();
    unsigned __int8 v11 = (void *)v10;
    if (v10) {
      id v12 = *(void **)(v10 + 72);
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    id v15 = v6;
    id v16 = v7;
    CLSPerformWithPersona();
  }
  else
  {
    id v14 = +[NSError cls_createErrorWithCode:4 description:@"Fetching thumbnail URL for asset not allowed."];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

- (void)remote_cloudKitUrlSuitableForOpeningForAsset:(id)a3 downloadObserver:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(PDEndpointServer *)self client];
  if (v11 && (int v12 = v11[26], v11, v12))
  {
    uint64_t v13 = sub_1000062FC();
    id v14 = (void *)v13;
    if (v13) {
      id v15 = *(void **)(v13 + 72);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    CLSPerformWithPersona();
  }
  else
  {
    id v17 = +[NSError cls_createErrorWithCode:4 description:@"Fetching URL for asset not allowed."];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v17);
  }
}

- (void)remote_cloudKitUrlSuitableForStreamingAsset:(id)a3 downloadObserver:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(PDEndpointServer *)self client];
  if (v11 && (int v12 = v11[26], v11, v12))
  {
    uint64_t v13 = sub_1000062FC();
    id v14 = (void *)v13;
    if (v13) {
      id v15 = *(void **)(v13 + 72);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    CLSPerformWithPersona();
  }
  else
  {
    id v17 = +[NSError cls_createErrorWithCode:4 description:@"Fetching streaming URL for asset not allowed."];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v17);
  }
}

- (void)remote_deleteBackingStoreForAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    uint64_t v10 = sub_1000062FC();
    unsigned __int8 v11 = (void *)v10;
    if (v10) {
      int v12 = *(void **)(v10 + 72);
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;
    id v15 = v6;
    id v16 = v7;
    CLSPerformWithPersona();
  }
  else
  {
    id v14 = +[NSError cls_createErrorWithCode:4 description:@"Deleting backing store for asset not allowed."];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

- (void)remote_createShareIfNeededForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDEndpointServer *)self client];
  if (!v8 || (int v9 = v8[26], v8, !v9))
  {
    uint64_t v10 = +[NSError cls_createErrorWithCode:4 description:@"Creating share not allowed."];
    (*((void (**)(id, uint64_t, void, void, uint64_t))v7 + 2))(v7, 1, 0, 0, v10);
    goto LABEL_12;
  }
  uint64_t v10 = sub_1000062FC();
  sub_100044604(v10);
  if (v10)
  {
    id v11 = *(id *)(v10 + 96);
    id v12 = *(id *)(v10 + 112);
    id v13 = v12;
    if (v11)
    {
      if (v12)
      {
        id v14 = *(id *)(v10 + 72);
        id v18 = v6;
        id v11 = v11;
        id v13 = v13;
        id v19 = v7;
        CLSPerformWithPersona();
      }
      else
      {
        id v17 = *(id *)(v10 + 120);
        (*((void (**)(id, uint64_t, void, void, id))v7 + 2))(v7, 1, 0, 0, v17);

        id v13 = 0;
      }
      goto LABEL_10;
    }
    id v15 = *(void **)(v10 + 104);
  }
  else
  {
    id v13 = 0;
    id v15 = 0;
  }
  id v16 = v15;
  (*((void (**)(id, uint64_t, void, void, id))v7 + 2))(v7, 1, 0, 0, v16);

  id v11 = 0;
LABEL_10:

LABEL_12:
}

- (void)remote_uploadAsset:(id)a3 createThumbnailIfNeeded:(BOOL)a4 uploadObserver:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(PDEndpointServer *)self client];
  if (v12 && (int v13 = v12[26], v12, v13))
  {
    uint64_t v14 = sub_1000062FC();
    id v15 = (void *)v14;
    if (v14) {
      id v16 = *(void **)(v14 + 72);
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    id v19 = v9;
    id v20 = v10;
    id v21 = v11;
    CLSPerformWithPersona();
  }
  else
  {
    id v18 = +[NSError cls_createErrorWithCode:4 description:@"Uploading asset not allowed."];
    (*((void (**)(id, void *))v11 + 2))(v11, v18);
  }
}

- (void)remote_topLevelContentStoreCacheDirectoryURLWithCompletion:(id)a3
{
  unsigned __int8 v5 = (void (**)(id, void *, id))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v10 = 0;
  LOBYTE(self) = [(PDEndpointServer *)self isInternalWithError:&v10];
  id v6 = v10;
  if (self)
  {
    id v9 = v6;
    id v7 = sub_1000D14B4((uint64_t)PDFileManager, (uint64_t *)&v9);
    id v8 = v9;

    v5[2](v5, v7, v8);
    id v6 = v8;
  }
  else
  {
    v5[2](v5, 0, v6);
  }
}

- (void)remote_currentUserContentStoreCacheDirectoryURLWithCompletion:(id)a3
{
  unsigned __int8 v5 = (void (**)(id, void *, id))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v10 = 0;
  LOBYTE(self) = [(PDEndpointServer *)self isInternalWithError:&v10];
  id v6 = v10;
  if (self)
  {
    id v9 = v6;
    id v7 = sub_1001248C8((uint64_t)PDFileSyncManager, &v9);
    id v8 = v9;

    v5[2](v5, v7, v8);
    id v6 = v8;
  }
  else
  {
    v5[2](v5, 0, v6);
  }
}

- (void)remote_canSearchRostersWithCompletion:(id)a3
{
  unsigned __int8 v5 = (void (**)(id, void *, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v6 = [(PDEndpointServer *)self database];
  id v7 = sub_1000062FC();
  if (sub_10000C6EC((BOOL)v7))
  {
    id v8 = sub_100003E58(v6);

    if (v8)
    {
      sub_100003A74(v6);
      id v9 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        id v10 = +[NSNumber numberWithBool:v9[8]];
        v5[2](v5, v10, 0);
      }
      else
      {
        id v16 = +[NSError cls_createErrorWithCode:100 format:@"Cannot search roster because ASMConfig is not available"];
        ((void (**)(id, void *, void *))v5)[2](v5, 0, v16);

        id v10 = &__kCFBooleanFalse;
      }

      goto LABEL_13;
    }
  }
  else
  {
  }
  id v11 = [(PDEndpointServer *)self client];
  if (v11) {
    BOOL v12 = v11[26] != 0;
  }
  else {
    BOOL v12 = 0;
  }

  int v13 = +[PDUserDefaults sharedDefaults];
  unsigned int v14 = [v13 enableVerboseLogging];

  if (v14)
  {
    CLSInitLog();
    id v15 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      id v17 = v15;
      id v18 = [(PDEndpointServer *)self client];
      uint64_t v19 = sub_10000C6B4(v18);
      id v20 = (void *)v19;
      CFStringRef v21 = @"no";
      if (v12) {
        CFStringRef v21 = @"yes";
      }
      int v22 = 138412546;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      CFStringRef v25 = v21;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Checking roster search availability for client '%@' (isDashboardClient:%@)", (uint8_t *)&v22, 0x16u);
    }
  }
  id v9 = +[NSNumber numberWithBool:v12];
  v5[2](v5, v9, 0);
LABEL_13:
}

- (void)remote_studentActivityForAttachmentsWithIDs:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  sub_100005DDC((uint64_t)self, a2);
  uint64_t v9 = [(PDEndpointServer *)self client];
  id v10 = (void *)v9;
  if (!v9
    || !*(unsigned char *)(v9 + 26)
    || ([(PDEndpointServer *)self database], (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_23;
  }
  BOOL v12 = v11;
  unsigned __int8 v13 = sub_100004B84(v11);

  if ((v13 & 1) == 0)
  {
LABEL_23:
    id v32 = +[NSError cls_createErrorWithCode:4 description:@"Fetching student activity is not allowed."];
    v8[2](v8, 0, v32);

    goto LABEL_24;
  }
  id v33 = v8;
  long long v35 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v34 = v7;
  id obj = v7;
  id v14 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v39;
    uint64_t v36 = *(void *)v39;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v17);
        id v20 = [(PDEndpointServer *)self database];
        CFStringRef v21 = [v20 select:objc_opt_class() identity:v18];

        if (v21)
        {
          int v22 = [v21 contextPath];

          if (v22)
          {
            id v23 = v15;
            __int16 v24 = [v21 contextPath];
            CFStringRef v25 = +[CLSContext objectIDForIdentifierPath:v24];

            if (v25)
            {
              id v26 = self;
              id v27 = [(PDEndpointServer *)self database];
              uint64_t v28 = objc_opt_class();
              id v44 = v25;
              id v29 = +[NSArray arrayWithObjects:&v44 count:1];
              id v30 = [v27 select:v28 where:@"parentObjectID = ?" bindings:v29];

              if (v30) {
                [v35 setObject:v30 forKeyedSubscript:v18];
              }

              self = v26;
              uint64_t v16 = v36;
            }

            id v15 = v23;
          }
        }
        else
        {
          CLSInitLog();
          id v31 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v43 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "No attachment found with objectID %@", buf, 0xCu);
          }
        }

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v15);
  }

  id v8 = v33;
  ((void (**)(id, void *, void *))v33)[2](v33, v35, 0);

  id v7 = v34;
LABEL_24:
}

- (void)remote_startAppActivity:(id)a3 bundleID:(id)a4 activityType:(unint64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  unsigned __int8 v13 = (void (**)(id, void, void *))a6;
  sub_100005DDC((uint64_t)self, a2);
  id v14 = [(PDEndpointServer *)self client];
  if (!v14 || (int v15 = v14[26], v14, !v15))
  {
    id v17 = +[NSError cls_createErrorWithCode:4 description:@"Action not allowed."];
    v13[2](v13, 0, v17);
    goto LABEL_45;
  }
  uint64_t v16 = [(PDEndpointServer *)self database];
  id v17 = v16;
  if (a5 == 3)
  {
    id v55 = [v16 select:objc_opt_class() identity:v11];
    uint64_t v21 = objc_opt_class();
    id v60 = v11;
    int v22 = +[NSArray arrayWithObjects:&v60 count:1];
    uint64_t v23 = [v17 select:v21 where:@"parentObjectID = ?" bindings:v22];

    id v24 = (id)v23;
    if (!v23)
    {
      id v24 = [objc_alloc((Class)CLSActivity) _initWithTargetClass:objc_opt_class()];
      CFStringRef v25 = [(PDEndpointServer *)self client];
      id v26 = sub_10000C6B4(v25);
      [v24 setAppIdentifier:v26];

      [v24 setParentObjectID:v11];
      id v27 = [v24 objectID];
      [v55 setCurrentActivityID:v27];

      uint64_t v28 = +[NSDate now];
      [v55 setDateLastModified:v28];

      v59[0] = v55;
      v59[1] = v24;
      id v29 = +[NSArray arrayWithObjects:v59 count:2];
      [v17 saveAndSyncObjects:v29];
    }
    id v30 = [v24 objectID];
    sub_10007D6A8(v17);
    uint64_t v31 = objc_opt_class();
    id v58 = v30;
    id v32 = +[NSArray arrayWithObjects:&v58 count:1];
    uint64_t v33 = [v17 select:v31 where:@"activityID = ?" bindings:v32];

    if (!v33) {
      uint64_t v33 = (uint64_t)sub_10007C61C((id *)[PDAppUsage alloc], v30, v12);
    }
    id v34 = [v55 parentObjectID];
    if (v34)
    {
      if (sub_10007CFD8(v17, v34))
      {
        long long v35 = [v17 select:objc_opt_class() identity:v34];
        [v35 timeExpectation];
        if (v36 == 0.0)
        {
          CLSInitLog();
          uint64_t v37 = CLSLogDefault;
          if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Not tracking time for this assignment, no time expectation specified.", buf, 2u);
          }
          long long v38 = +[NSError cls_createErrorWithCode:0 description:@"No time expectation specified"];
          v13[2](v13, 0, v38);
        }
        else
        {
          uint64_t v45 = +[NSDate now];
          sub_10007C770(v33, v45);

          if (v33) {
            *(_WORD *)(v33 + 8) = 1;
          }
          id v46 = [v17 insertOrUpdateObject:v33];
          unint64_t v47 = (unint64_t)v46;
          if (v46)
          {
            long long v38 = 0;
          }
          else
          {
            unsigned int v54 = v46;
            CLSInitLog();
            unsigned int v48 = (void *)CLSLogDefault;
            if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
            {
              log = v48;
              if (v33) {
                uint64_t v51 = *(void **)(v33 + 16);
              }
              else {
                uint64_t v51 = 0;
              }
              id v52 = v51;
              *(_DWORD *)long long buf = 138543362;
              unint64_t v57 = (unint64_t)v52;
              _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to update AppUsage. AppUsageID: %{public}@", buf, 0xCu);
            }
            long long v38 = +[NSError cls_createErrorWithCode:8, @"Failed to update AppUsage.", v52 description];
            unint64_t v47 = v54;
          }
          v13[2](v13, v47, v38);
        }

        goto LABEL_40;
      }
      CLSInitLog();
      id v44 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Not tracking time for this assignment, usage threshold reached.", buf, 2u);
      }
      CFStringRef v42 = @"Usage threshold reached";
      uint64_t v43 = 0;
    }
    else
    {
      CLSInitLog();
      long long v41 = (void *)CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = v41;
        BOOL v50 = [v55 objectID];
        *(_DWORD *)long long buf = 138543362;
        unint64_t v57 = (unint64_t)v50;
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Missing parent object Attachment. CLSAssignedItemID: %{public}@", buf, 0xCu);
      }
      CFStringRef v42 = @"Missing attachment";
      uint64_t v43 = 100;
    }
    long long v35 = +[NSError cls_createErrorWithCode:v43 description:v42];
    v13[2](v13, 0, v35);
LABEL_40:

    goto LABEL_45;
  }
  if (a5 == 1)
  {
    sub_10007D6A8(v16);
    sub_10007C7F4(v17, v12);
    uint64_t v18 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    if (!sub_10007C704((uint64_t)v18)) {
      goto LABEL_9;
    }
    if (v18) {
      v18[9] = 1;
    }
    if (([v17 insertOrUpdateObject:v18] & 1) == 0)
    {
      uint64_t v19 = +[NSError cls_createErrorWithCode:8 description:@"Failed to update PDAppUsage."];
      uint64_t v20 = 0;
    }
    else
    {
LABEL_9:
      uint64_t v19 = 0;
      uint64_t v20 = 1;
    }
    v13[2](v13, v20, v19);
  }
  else
  {
    CLSInitLog();
    long long v39 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v57 = a5;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Invoke start activity on un-supported attachment type - %lu", buf, 0xCu);
    }
    long long v40 = +[NSError cls_createErrorWithCode:2 description:@"Start activity on un-supported attachment type."];
    v13[2](v13, 0, v40);
  }
LABEL_45:
}

- (void)remote_startActivityFailed:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    id v10 = [(PDEndpointServer *)self database];
    id v11 = sub_10007CD64(v10, v16);
    if (v11)
    {
      uint64_t v12 = [v10 select:objc_opt_class() identity:v11];
      unsigned __int8 v13 = (void *)v12;
      if (v12) {
        *(unsigned char *)(v12 + 8) = 0;
      }
      id v14 = [v10 insertOrUpdateObject:v12];
      if (v14)
      {
        int v15 = 0;
      }
      else
      {
        int v15 = +[NSError cls_createErrorWithCode:8 description:@"Failed to update AppUsage"];
      }
      v7[2](v7, v14, v15);
    }
    else
    {
      unsigned __int8 v13 = +[NSError cls_createErrorWithCode:0 description:@"AppUsage not found"];
      v7[2](v7, 0, v13);
    }
  }
  else
  {
    id v10 = +[NSError cls_createErrorWithCode:4 description:@"Action not allowed."];
    v7[2](v7, 0, v10);
  }
}

- (void)remote_fetchAppBasedAssignmentUsage:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    id v10 = [(PDEndpointServer *)self database];
    uint64_t v11 = +[NSNumber numberWithDouble:sub_10007D18C(v10, v12, 0)];
    v7[2](v7, v11, 0);

    id v7 = (void (**)(id, uint64_t, void))v11;
  }
  else
  {
    id v10 = +[NSError cls_createErrorWithCode:4 description:@"Action not allowed."];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);
  }
}

- (void)remote_publishHandoutGraph:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  sub_100005DDC((uint64_t)self, a2);
  uint64_t v9 = [(PDEndpointServer *)self client];
  id v10 = (void *)v9;
  if (!v9
    || !*(unsigned char *)(v9 + 26)
    || ([(PDEndpointServer *)self database], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_25;
  }
  id v12 = v11;
  unsigned __int8 v13 = sub_100004B84(v11);

  if ((v13 & 2) == 0)
  {
LABEL_25:
    int v15 = +[NSError cls_createErrorWithCode:4 description:@"Publishing handouts not allowed."];
    v8[2](v8, 0, v15);
    goto LABEL_26;
  }
  id v14 = [(PDEndpointServer *)self client];
  int v15 = sub_10000C6B4(v14);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v32 = v7;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        int v22 = objc_msgSend(v21, "appIdentifier", v32);

        if (!v22) {
          [v21 setAppIdentifier:v15];
        }
        if ([v21 conformsToProtocol:&OBJC_PROTOCOL___PDEndpointServerEntityHooks]
          && ([v21 willBeProcessedByEndpointServer:self] & 1) == 0)
        {
          v8[2](v8, 0, 0);
          uint64_t v23 = v16;
          goto LABEL_23;
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  uint64_t v23 = [(PDEndpointServer *)self daemon];
  id v24 = [v23 operationsManager];

  if (v24)
  {
    CFStringRef v25 = [PDHandoutPublish alloc];
    id v26 = [(PDEndpointServer *)self database];
    id v27 = sub_100118F68(v25, (uint64_t)v26, v16);

    uint64_t v28 = [(PDEndpointServer *)self client];
    id v29 = sub_10000C6B4(v28);
    [v27 setSourceApplicationBundleIdentifier:v29];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100037050;
    v33[3] = &unk_1001F23F8;
    id v34 = v8;
    [v27 addOnFinishBlock:v33];
    id v30 = [v23 operationsManager];
    sub_100110A9C(v30, v27);
  }
  else
  {
    CLSInitLog();
    uint64_t v31 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
    }
    id v27 = +[NSError cls_createErrorWithCode:100, @"Operations manager is nil.", v32 description];
    v8[2](v8, 0, v27);
  }

LABEL_23:
  id v7 = v32;

LABEL_26:
}

- (void)remote_fetchDeletedObjectIDsNewerThanDate:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  uint64_t v9 = [(PDEndpointServer *)self database];
  uint64_t v10 = objc_opt_class();
  id v15 = v7;
  uint64_t v11 = +[NSArray arrayWithObjects:&v15 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100037250;
  v13[3] = &unk_1001F2758;
  id v14 = v8;
  id v12 = v8;
  [v9 selectAll:v10 where:@"deletedAtDate >= ?" bindings:v11 block:v13];

  v6[2](v6, v12);
}

- (void)remote_repairHandoutAttachments:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  sub_100005DDC((uint64_t)self, a2);
  uint64_t v9 = [(PDEndpointServer *)self client];
  if (v9 && (int v10 = v9[26], v9, v10))
  {
    uint64_t v11 = [(PDEndpointServer *)self daemon];
    id v12 = [v11 operationsManager];

    if (v12)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v7;
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * (void)v17) setNeedsRepair:1];
            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v15);
      }

      id v18 = [PDHandoutPublish alloc];
      uint64_t v19 = [(PDEndpointServer *)self database];
      uint64_t v20 = sub_100118F68(v18, (uint64_t)v19, v13);

      uint64_t v21 = [(PDEndpointServer *)self client];
      int v22 = sub_10000C6B4(v21);
      [v20 setSourceApplicationBundleIdentifier:v22];

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000375CC;
      v25[3] = &unk_1001F23F8;
      id v26 = v8;
      [v20 addOnFinishBlock:v25];
      uint64_t v23 = [v11 operationsManager];
      sub_100110A9C(v23, v20);
    }
    else
    {
      CLSInitLog();
      id v24 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
      }
      uint64_t v20 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v20);
    }
  }
  else
  {
    uint64_t v11 = +[NSError cls_createErrorWithCode:4 description:@"Repairing handout attachments not allowed."];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v11);
  }
}

- (void)remote_fetchCollectionsWithCompletion:(id)a3
{
  unsigned __int8 v5 = (void (**)(id, uint64_t, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v6 = [(PDEndpointServer *)self client];
  if (v6 && (int v7 = v6[26], v6, v7))
  {
    id v8 = [(PDEndpointServer *)self daemon];
    uint64_t v9 = [v8 operationsManager];

    if (v9)
    {
      int v10 = [PDCollectionSearchOperation alloc];
      uint64_t v11 = [(PDEndpointServer *)self database];
      id v12 = [(PDCollectionSearchOperation *)v10 initForCollectionsWithDatabase:v11];

      id v13 = [v8 operationsManager];
      sub_100110A9C(v13, v12);

      v5[2](v5, 1, 0);
    }
    else
    {
      CLSInitLog();
      id v14 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v16[0] = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Operations manager is nil!", (uint8_t *)v16, 2u);
      }
      id v15 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
      ((void (**)(id, uint64_t, void *))v5)[2](v5, 0, v15);
    }
  }
  else
  {
    id v8 = +[NSError cls_createErrorWithCode:4 description:@"Fetching Collections not allowed. Not a Dashboard Client."];
    ((void (**)(id, uint64_t, void *))v5)[2](v5, 0, v8);
  }
}

- (void)remote_fetchCollectionItemsWithCompletion:(id)a3
{
  unsigned __int8 v5 = (void (**)(id, uint64_t, void))a3;
  sub_100005DDC((uint64_t)self, a2);
  id v6 = [(PDEndpointServer *)self client];
  if (v6 && (int v7 = v6[26], v6, v7))
  {
    id v8 = [(PDEndpointServer *)self daemon];
    uint64_t v9 = [v8 operationsManager];

    if (v9)
    {
      int v10 = [PDCollectionSearchOperation alloc];
      uint64_t v11 = [(PDEndpointServer *)self database];
      id v12 = [(PDCollectionSearchOperation *)v10 initForCollectionItemsWithDatabase:v11];

      id v13 = [(PDEndpointServer *)self client];
      id v14 = sub_10000C6B4(v13);
      [v12 setSourceApplicationBundleIdentifier:v14];

      id v15 = [v8 operationsManager];
      sub_100110A9C(v15, v12);

      v5[2](v5, 1, 0);
    }
    else
    {
      CLSInitLog();
      uint64_t v16 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v18[0] = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Operations manager is nil!", (uint8_t *)v18, 2u);
      }
      id v17 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
      ((void (**)(id, uint64_t, void *))v5)[2](v5, 0, v17);
    }
  }
  else
  {
    id v8 = +[NSError cls_createErrorWithCode:4 description:@"Fetching Collection Items not allowed. Not a Dashboard Client."];
    ((void (**)(id, uint64_t, void *))v5)[2](v5, 0, v8);
  }
}

- (void)remote_deleteCollectionRelatedObjectsWithCompletion:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  sub_100005DDC((uint64_t)self, a2);
  uint64_t v9 = [(PDEndpointServer *)self client];
  if (v9 && (int v10 = v9[26], v9, v10))
  {
    uint64_t v11 = [(PDEndpointServer *)self database];
    id v12 = sub_100003E58(v11);

    if (v12)
    {
      id v13 = [(PDEndpointServer *)self daemon];
      id v14 = [v13 operationsManager];

      if (v14)
      {
        id v15 = [PDCollectionPublishOperation alloc];
        uint64_t v16 = [(PDEndpointServer *)self database];
        id v17 = [(PDCollectionPublishOperation *)v15 initWithDatabase:v16 andObjectsToDelete:v7];

        id v18 = [(PDEndpointServer *)self client];
        uint64_t v19 = sub_10000C6B4(v18);
        [(PDOperation *)v17 setSourceApplicationBundleIdentifier:v19];

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100037D30;
        v23[3] = &unk_1001F2420;
        id v24 = v8;
        [(PDOperation *)v17 addOnFinishBlock:v23];
        uint64_t v20 = [v13 operationsManager];
        sub_100110A9C(v20, v17);
      }
      else
      {
        CLSInitLog();
        int v22 = CLSLogDefault;
        if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
        }
        id v17 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
        (*((void (**)(id, void, PDCollectionPublishOperation *))v8 + 2))(v8, 0, v17);
      }
    }
    else
    {
      CLSInitLog();
      uint64_t v21 = CLSLogCollection;
      if (os_log_type_enabled(CLSLogCollection, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Must be signed in to delete collections.", buf, 2u);
      }
      id v13 = +[NSError cls_createErrorWithCode:2 description:@"Must be signed in to delete collections."];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
    }
  }
  else
  {
    uint64_t v11 = +[NSError cls_createErrorWithCode:4 description:@"Deleting Collections not allowed. Not a Dashboard Client."];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v11);
  }
}

- (void)remote_collaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *, void))a5;
  sub_100005DDC((uint64_t)self, a2);
  uint64_t v11 = [(PDEndpointServer *)self client];
  if (v11 && (int v12 = v11[26], v11, v12))
  {
    id v13 = [(PDEndpointServer *)self database];
    id v14 = sub_100159B08(v13, v15, v9);

    v10[2](v10, v14, 0);
  }
  else
  {
    id v14 = +[NSError cls_createErrorWithCode:4 description:@"Fetching assignment states not allowed. Not a Dashboard Client."];
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v14);
  }
}

- (void)remote_collaborationStatesForObjectWithID:(id)a3 classID:(id)a4 forOwnersWithRole:(unint64_t)a5 completion:(id)a6
{
  id v17 = a3;
  id v11 = a4;
  int v12 = (void (**)(id, void *, void))a6;
  sub_100005DDC((uint64_t)self, a2);
  id v13 = [(PDEndpointServer *)self client];
  if (v13 && (int v14 = v13[26], v13, v14))
  {
    id v15 = [(PDEndpointServer *)self database];
    uint64_t v16 = sub_100159D28(v15, v17, v11, a5);

    v12[2](v12, v16, 0);
  }
  else
  {
    uint64_t v16 = +[NSError cls_createErrorWithCode:4 description:@"Fetching assignment states not allowed. Not a Dashboard Client."];
    ((void (**)(id, void *, void *))v12)[2](v12, 0, v16);
  }
}

- (void)remote_publishCollaborationStateChanges:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  sub_100005DDC((uint64_t)self, a2);
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    [(PDEndpointServer *)self entitled_publishCollaborationStateChanges:v11 completion:v7];
  }
  else
  {
    int v10 = +[NSError cls_createErrorWithCode:4 description:@"Changing assignment state not allowed. Not a Dashboard Client."];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v10);
  }
}

- (void)entitled_publishCollaborationStateChanges:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDEndpointServer *)self database];
  int v9 = sub_100003E58(v8);

  if (v9)
  {
    int v10 = sub_100003E58(v8);
    id v11 = [v10 objectID];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v18 = objc_msgSend(v17, "senderPersonID", v29);

          if (!v18) {
            [v17 setSenderPersonID:v11];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [(PDEndpointServer *)self daemon];
    uint64_t v20 = [v19 operationsManager];

    if (v20)
    {
      uint64_t v21 = [PDCollaborationStateChangePublish alloc];
      int v22 = [(PDEndpointServer *)self database];
      uint64_t v23 = sub_10014FEB4(v21, (uint64_t)v22, v12);

      id v24 = [(PDEndpointServer *)self client];
      CFStringRef v25 = sub_10000C6B4(v24);
      [v23 setSourceApplicationBundleIdentifier:v25];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000384D0;
      v30[3] = &unk_1001F2448;
      id v31 = v7;
      [v23 addOnFinishBlock:v30];
      id v26 = [v19 operationsManager];
      sub_100110A9C(v26, v23);
    }
    else
    {
      CLSInitLog();
      long long v28 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
      }
      uint64_t v23 = +[NSError cls_createErrorWithCode:100, @"Operations manager is nil.", v29 description];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v23);
    }
    id v6 = v29;
  }
  else
  {
    CLSInitLog();
    long long v27 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Must be signed in to publish state changes.", buf, 2u);
    }
    id v11 = +[NSError cls_createErrorWithCode:2 description:@"Must be signed in to publish state changes."];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
  }
}

- (void)remote_triggerUserNotificationReviewDueHandoutsWithReferenceDate:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v7 = (void (**)(id, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[29], v8, v9))
  {
    int v10 = [(PDEndpointServer *)self daemon];
    id v11 = [v10 userNotificationManager];

    id v12 = [v11 reviewDueHandoutsTrigger];
    id v13 = [v12 fetchHandoutsDueYesterdayFromDate:v15];
    id v14 = [v12 dueYesterdayUserNotificationDataFromHandouts:v13];
    [v12 fireTriggerWithNotificationData:v14];
    v7[2](v7, 0);

    id v7 = (void (**)(id, void))v12;
  }
  else
  {
    id v11 = +[NSError cls_createErrorWithCode:4 description:@"Triggering notifications not allowed. Use pdtool"];
    ((void (**)(id, void *))v7)[2](v7, v11);
  }
}

- (void)remote_triggerUserNotificationHandoutDueSoonWithReferenceDate:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v7 = (void (**)(id, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[29], v8, v9))
  {
    int v10 = [(PDEndpointServer *)self daemon];
    id v11 = [v10 userNotificationManager];

    id v12 = [v11 handoutDueSoonTrigger];
    id v13 = [v12 fetchHandoutsDueNextDayFromDate:v15];
    id v14 = [v12 dueTomorrowUserNotificationDataFromHandouts:v13];
    [v12 fireTriggerWithNotificationData:v14];
    v7[2](v7, 0);

    id v7 = (void (**)(id, void))v12;
  }
  else
  {
    id v11 = +[NSError cls_createErrorWithCode:4 description:@"Triggering notifications not allowed.  Use pdtool"];
    ((void (**)(id, void *))v7)[2](v7, v11);
  }
}

- (void)remote_triggerUserNotificationHandoutPastDueSummaryWithReferenceDate:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v7 = (void (**)(id, void))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[29], v8, v9))
  {
    int v10 = [(PDEndpointServer *)self daemon];
    id v11 = [v10 userNotificationManager];

    id v12 = [v11 handoutPastDueTrigger];
    id v13 = [v12 fetchActiveHandoutsPastDueFromDate:v15];
    id v14 = [v12 pastDueUserNotificationDataFromHandouts:v13];
    [v12 fireTriggerWithNotificationData:v14];
    v7[2](v7, 0);

    id v7 = (void (**)(id, void))v12;
  }
  else
  {
    id v11 = +[NSError cls_createErrorWithCode:4 description:@"Triggering notifications not allowed.  Use pdtool"];
    ((void (**)(id, void *))v7)[2](v7, v11);
  }
}

- (void)remote_triggerUserNotificationRevisionRequestedWithAttachmentID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  sub_100005DDC((uint64_t)self, a2);
  int v9 = [(PDEndpointServer *)self client];
  if (v9 && (int v10 = v9[29], v9, v10))
  {
    id v11 = [(PDEndpointServer *)self daemon];
    id v12 = [v11 userNotificationManager];

    id v13 = [v12 revisionNeededTrigger];
    if (v13)
    {
      id v14 = [(PDEndpointServer *)self database];
      id v15 = [v14 select:objc_opt_class() identity:v7];

      if (v15)
      {
        uint64_t v16 = [(PDEndpointServer *)self database];
        uint64_t v17 = objc_opt_class();
        id v18 = [v15 parentObjectID];
        uint64_t v19 = [v16 select:v17 identity:v18];

        if (v19)
        {
          uint64_t v20 = [(PDEndpointServer *)self database];
          uint64_t v21 = objc_opt_class();
          long long v30 = v19;
          int v22 = [v19 objectID];
          id v31 = v22;
          uint64_t v23 = +[NSArray arrayWithObjects:&v31 count:1];
          id v24 = [v20 select:v21 where:@"parentObjectID = ?" bindings:v23];

          if (v24)
          {
            CFStringRef v25 = [(PDEndpointServer *)self database];
            id v26 = [v13 notificationDataWithDatabase:v25 recipient:v24 attachmentID:v7];

            [v13 fireTriggerWithNotificationData:v26];
            uint64_t v27 = 0;
          }
          else
          {
            uint64_t v27 = +[NSError cls_createErrorWithCode:2 description:@"Handout recipient does not exist"];
            id v26 = (void *)v27;
          }
          v8[2](v8, v27);

          uint64_t v19 = v30;
        }
        else
        {
          id v29 = +[NSError cls_createErrorWithCode:2 description:@"Handout does not exist"];
          v8[2](v8, (uint64_t)v29);
        }
      }
      else
      {
        long long v28 = +[NSError cls_createErrorWithCode:2 description:@"Handout attachment does not exist"];
        v8[2](v8, (uint64_t)v28);
      }
    }
    else
    {
      id v15 = +[NSError cls_createErrorWithCode:2 description:@"Revision requested notification trigger does not exist. Are you signed in as a student?"];
      v8[2](v8, (uint64_t)v15);
    }
  }
  else
  {
    id v12 = +[NSError cls_createErrorWithCode:4 description:@"Triggering notifications not allowed.  Use pdtool"];
    v8[2](v8, (uint64_t)v12);
  }
}

- (void)remote_triggerUserNotificationRevisedSubmissionWithAttachmentID:(id)a3 studentName:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void))a5;
  sub_100005DDC((uint64_t)self, a2);
  id v12 = [(PDEndpointServer *)self client];
  if (v12 && (int v13 = v12[29], v12, v13))
  {
    id v14 = [(PDEndpointServer *)self daemon];
    id v15 = [v14 userNotificationManager];

    uint64_t v16 = [v15 revisedSubmissionTrigger];
    if (v16)
    {
      uint64_t v17 = [(PDEndpointServer *)self database];
      id v18 = [v17 select:objc_opt_class() identity:v9];

      if (v18)
      {
        uint64_t v19 = [(PDEndpointServer *)self database];
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = [v18 parentObjectID];
        int v22 = [v19 select:v20 identity:v21];

        if (v22)
        {
          uint64_t v23 = objc_opt_class();
          id v24 = [v22 objectID];
          unint64_t v47 = v24;
          uint64_t v25 = +[NSArray arrayWithObjects:&v47 count:1];
          id v26 = v19;
          uint64_t v27 = (void *)v25;
          id v46 = v26;
          long long v28 = [v26 select:v23 where:@"parentObjectID = ?" bindings:v25];

          if (v28)
          {
            uint64_t v45 = v28;
            id v29 = +[NSBundle bundleForClass:objc_opt_class()];
            long long v30 = [v29 localizedStringForKey:@"NOTIFICATION_TEACHER_REVIEW_REVISED_WORK_MESSAGE_FORMAT" value:&stru_1001F6580 table:@"ClassKit"];
            [v18 title];
            long long v32 = v31 = v22;
            id v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v10, v32);

            int v22 = v31;
            long long v33 = +[NSBundle bundleForClass:objc_opt_class()];
            long long v34 = [v33 localizedStringForKey:@"NOTIFICATION_TEACHER_REVIEW_REVISED_WORK_TITLE" value:&stru_1001F6580 table:@"ClassKit"];

            uint64_t v43 = v34;
            long long v35 = sub_10012691C((id *)[PDUserNotificationData alloc], (void *)5, v34, v44);
            long long v37 = [v22 objectID];
            if (v35) {
              objc_setProperty_nonatomic_copy(v35, v36, v37, 24);
            }

            long long v39 = [v45 classID];
            uint64_t v19 = v46;
            if (v35) {
              objc_setProperty_nonatomic_copy(v35, v38, v39, 32);
            }

            long long v41 = [v18 objectID];
            if (v35) {
              objc_setProperty_nonatomic_copy(v35, v40, v41, 48);
            }

            [v16 fireTriggerWithNotificationData:v35];
            v11[2](v11, 0);

            CFStringRef v42 = v44;
            long long v28 = v45;
          }
          else
          {
            CFStringRef v42 = +[NSError cls_createErrorWithCode:2 description:@"Handout recipient does not exist"];
            ((void (**)(id, void *))v11)[2](v11, v42);
            uint64_t v19 = v46;
          }
        }
        else
        {
          long long v28 = +[NSError cls_createErrorWithCode:2 description:@"Handout does not exist"];
          ((void (**)(id, void *))v11)[2](v11, v28);
        }
      }
      else
      {
        uint64_t v19 = +[NSError cls_createErrorWithCode:2 description:@"Handout attachment does not exist"];
        ((void (**)(id, void *))v11)[2](v11, v19);
      }
    }
    else
    {
      id v18 = +[NSError cls_createErrorWithCode:2 description:@"Revised submission notification trigger does not exist. Are you signed in as a teacher?"];
      ((void (**)(id, void *))v11)[2](v11, v18);
    }
  }
  else
  {
    id v15 = +[NSError cls_createErrorWithCode:4 description:@"Triggering notifications not allowed.  Use pdtool"];
    ((void (**)(id, void *))v11)[2](v11, v15);
  }
}

- (void)remote_triggerUserNotificationHandoutAssignedWithHandoutID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = [(PDEndpointServer *)self client];
  if (v9 && (int v10 = v9[29], v9, v10))
  {
    id v11 = [(PDEndpointServer *)self daemon];
    id v12 = [v11 userNotificationManager];

    int v13 = [v12 handoutAssignedTrigger];
    if (v13)
    {
      id v14 = [(PDEndpointServer *)self database];
      id v15 = [v14 select:objc_opt_class() identity:v7];
      if (v15)
      {
        uint64_t v16 = objc_opt_class();
        id v23 = v7;
        uint64_t v17 = +[NSArray arrayWithObjects:&v23 count:1];
        id v18 = [v14 select:v16 where:@"parentObjectID = ?" bindings:v17];

        if (v18)
        {
          uint64_t v19 = [v15 objectID];
          uint64_t v20 = [v15 title];
          uint64_t v21 = [v13 notificationDataWithDatabase:v14 recipient:v18 handoutID:v19 handoutTitle:v20];

          [v13 fireTriggerWithNotificationData:v21];
          uint64_t v22 = 0;
        }
        else
        {
          uint64_t v22 = +[NSError cls_createErrorWithCode:2 description:@"Handout recipient does not exist"];
          uint64_t v21 = (void *)v22;
        }
        v8[2](v8, v22);
      }
      else
      {
        id v18 = +[NSError cls_createErrorWithCode:2 description:@"Handout does not exist"];
        v8[2](v8, (uint64_t)v18);
      }
    }
    else
    {
      id v14 = +[NSError cls_createErrorWithCode:2 description:@"Handout notification trigger does not exist.  Are you signed in as a student?"];
      v8[2](v8, (uint64_t)v14);
    }
  }
  else
  {
    id v12 = +[NSError cls_createErrorWithCode:4 description:@"Triggering notifications not allowed.  Use pdtool"];
    v8[2](v8, (uint64_t)v12);
  }
}

- (void)remote_triggerUserNotificationWithTitle:(id)a3 message:(id)a4 wrappedImageURL:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  sub_100005DDC((uint64_t)self, a2);
  id v12 = [v9 url];

  sub_100046FA4((uint64_t)PDPrivateUserNotificationManager, v11, v10, v12);
}

- (void)remote_publishClass:(id)a3 membersToInsert:(id)a4 membersToDelete:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  sub_100005DDC((uint64_t)self, a2);
  id v15 = [(PDEndpointServer *)self client];
  if (v15 && (int v16 = v15[26], v15, v16))
  {
    uint64_t v17 = [(PDEndpointServer *)self client];
    id v18 = sub_10000C6B4(v17);

    unint64_t v47 = v11;
    unsigned int v48 = v13;
    if ([v11 isDeleted])
    {
      int v19 = 3;
    }
    else if ([v11 isTemporary])
    {
      int v19 = 1;
    }
    else
    {
      int v19 = 2;
    }
    int v45 = v19;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    id v46 = v12;
    id v20 = v12;
    id v21 = [v20 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v57;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v57 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          id v26 = [v25 appIdentifier];

          if (!v26) {
            [v25 setAppIdentifier:v18];
          }
          if ([v25 conformsToProtocol:&OBJC_PROTOCOL___PDEndpointServerEntityHooks]
            && ([v25 willBeProcessedByEndpointServer:self] & 1) == 0)
          {
            (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
            long long v34 = v20;
LABEL_34:
            id v12 = v46;
            id v11 = v47;
            id v13 = v48;
            goto LABEL_35;
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
    id v44 = (void (**)(void, void, void))v14;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v27 = v48;
    id v28 = [v27 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v53;
      while (2)
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
          long long v33 = objc_msgSend(v32, "appIdentifier", v44);

          if (!v33) {
            [v32 setAppIdentifier:v18];
          }
          if ([v32 conformsToProtocol:&OBJC_PROTOCOL___PDEndpointServerEntityHooks]
            && ([v32 willBeProcessedByEndpointServer:self] & 1) == 0)
          {
            id v14 = v44;
            v44[2](v44, 0, 0);
            long long v34 = v27;
            goto LABEL_34;
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }

    long long v34 = [(PDEndpointServer *)self daemon];
    long long v35 = [v34 operationsManager];

    if (v35)
    {
      long long v36 = [PDClassPublish alloc];
      long long v37 = [(PDEndpointServer *)self database];
      long long v38 = v20;
      id v11 = v47;
      long long v39 = sub_100074468(v36, (uint64_t)v37, v47, v38, v27, v45);

      long long v40 = [(PDEndpointServer *)self client];
      long long v41 = sub_10000C6B4(v40);
      [v39 setSourceApplicationBundleIdentifier:v41];

      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100039C2C;
      v49[3] = &unk_1001F2470;
      id v14 = v44;
      BOOL v50 = v44;
      [v39 addOnFinishBlock:v49];
      CFStringRef v42 = [v34 operationsManager];
      sub_100110A9C(v42, v39);
    }
    else
    {
      CLSInitLog();
      uint64_t v43 = CLSLogDefault;
      id v14 = v44;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
      }
      long long v39 = +[NSError cls_createErrorWithCode:100, @"Operations manager is nil.", v44 description];
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v39);
      id v11 = v47;
    }
    id v12 = v46;
    id v13 = v48;

LABEL_35:
  }
  else
  {
    id v18 = +[NSError cls_createErrorWithCode:4 description:@"Creating classes not allowed. Not a Dashboard Client."];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v18);
  }
}

- (void)remote_publishSurveyAnswers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    id v10 = [(PDEndpointServer *)self daemon];
    id v11 = [v10 operationsManager];

    if (v11)
    {
      id v12 = objc_opt_new();
      id v13 = objc_opt_new();
      id v14 = [(PDEndpointServer *)self database];
      uint64_t v15 = objc_opt_class();
      uint64_t v30 = v6;
      int v16 = [v6 objectID];
      v39[0] = v16;
      v39[1] = &off_10020AD58;
      uint64_t v17 = +[NSArray arrayWithObjects:v39 count:2];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10003A2AC;
      v35[3] = &unk_1001F2498;
      id v18 = v12;
      id v36 = v18;
      id v19 = v13;
      id v37 = v19;
      [v14 selectAll:v15 where:@"surveyID = ? and state = ?" bindings:v17 block:v35];

      id v20 = objc_opt_new();
      if ([v19 count])
      {
        id v21 = +[PDDatabase whereSQLForArray:v19 prefix:@"parentObjectID in "];
        id v22 = [(PDEndpointServer *)self database];
        uint64_t v23 = objc_opt_class();
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10003A334;
        v33[3] = &unk_1001F24C0;
        id v34 = v20;
        [v22 selectAll:v23 where:v21 bindings:v19 block:v33];
      }
      id v24 = [PDPublishSurveyAnswersOperation alloc];
      uint64_t v25 = [(PDEndpointServer *)self database];
      id v6 = v30;
      id v26 = sub_1000779FC(v24, (uint64_t)v25, v30, v18, v20);

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10003A348;
      v31[3] = &unk_1001F24E8;
      id v32 = v7;
      [v26 addOnFinishBlock:v31];
      id v27 = [v10 operationsManager];
      sub_100110A9C(v27, v26);
    }
    else
    {
      CLSInitLog();
      id v28 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
      }
      id v18 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v18);
    }
  }
  else
  {
    CLSInitLog();
    id v29 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "CLSDataStore unable to publish survey answer, app is not dashboard client", buf, 2u);
    }
    id v10 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)remote_fetchSurveyAnswer:(id)a3 responderIDs:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  sub_100005DDC((uint64_t)self, a2);
  id v12 = [(PDEndpointServer *)self client];
  if (v12 && (int v13 = v12[26], v12, v13))
  {
    id v14 = [(PDEndpointServer *)self daemon];
    uint64_t v15 = [v14 operationsManager];

    if (v15)
    {
      int v16 = [PDFetchSurveyAnswerOperation alloc];
      uint64_t v17 = [(PDEndpointServer *)self database];
      id v18 = sub_1000994EC(v16, (uint64_t)v17, v9, v10);

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10003A670;
      v22[3] = &unk_1001F2510;
      id v23 = v11;
      [v18 addOnFinishBlock:v22];
      id v19 = [v14 operationsManager];
      sub_100110A9C(v19, v18);
    }
    else
    {
      CLSInitLog();
      id v20 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
      }
      id v18 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v18);
    }
  }
  else
  {
    CLSInitLog();
    id v21 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "CLSDataStore unable to publish survey answer, app is not dashboard client", buf, 2u);
    }
    id v14 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v14);
  }
}

- (void)remote_publishAdminRequests:(id)a3 withRequestor:(id)a4 adminRequestAccounts:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(PDEndpointServer *)self client];
  if (v14 && (int v15 = v14[26], v14, v15))
  {
    id v35 = v10;
    id v36 = v11;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v41;
      do
      {
        id v20 = 0;
        do
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v20);
          id v22 = [(PDEndpointServer *)self client];
          id v23 = sub_10000C6B4(v22);
          [v21 setBundleIdentifier:v23];

          id v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v18);
    }

    id v24 = [(PDEndpointServer *)self daemon];
    uint64_t v25 = [v24 operationsManager];

    if (v25)
    {
      id v26 = [v24 operationsManager];
      BOOL v27 = sub_100003494((BOOL)v26);

      if (v27)
      {
        id v28 = [PDASMPublishAccountOperation alloc];
        id v29 = [(PDEndpointServer *)self database];
        uint64_t v30 = (PDPublishAdminRequest *)sub_1000CFF3C(v28, (uint64_t)v29, (uint64_t)v16);
        id v11 = v36;
      }
      else
      {
        id v32 = [PDPublishAdminRequest alloc];
        id v29 = [(PDEndpointServer *)self database];
        long long v33 = v32;
        id v11 = v36;
        uint64_t v30 = [(PDPublishAdminRequest *)v33 initWithDatabase:v29 adminRequests:v16 requestor:v36];
      }

      [(PDPublishAdminRequest *)v30 setAdminRequestAccounts:v12];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10003AAB4;
      v37[3] = &unk_1001F2538;
      id v38 = v13;
      [(PDOperation *)v30 addOnFinishBlock:v37];
      id v34 = [v24 operationsManager];
      sub_100110A9C(v34, v30);
    }
    else
    {
      CLSInitLog();
      id v31 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
      }
      uint64_t v30 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
      (*((void (**)(id, void, PDPublishAdminRequest *))v13 + 2))(v13, 0, v30);
      id v11 = v36;
    }
    id v10 = v35;
  }
  else
  {
    id v24 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v24);
  }
}

- (void)remote_deleteAdminRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    id v10 = [(PDEndpointServer *)self database];
    uint64_t v11 = objc_opt_class();
    id v15 = v6;
    id v12 = +[NSArray arrayWithObjects:&v15 count:1];
    id v13 = [v10 deleteAll:v11 where:@"objectID = ?" bindings:v12];

    v7[2](v7, v13, 0);
  }
  else
  {
    id v14 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);
  }
}

- (void)remote_fetchOrphanedAssetsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id, void))a3;
  unsigned __int8 v5 = [(PDEndpointServer *)self client];
  if (v5 && (int v6 = v5[26], v5, v6))
  {
    id v7 = [(PDEndpointServer *)self database];
    sub_100153924(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v8, 0);
  }
  else
  {
    id v8 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    ((void (**)(id, id, id))v4)[2](v4, 0, v8);
  }
}

- (void)remote_relayRequestWithData:(id)a3 requestType:(unint64_t)a4 fileHandle:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  id v13 = [(PDEndpointServer *)self client];
  if (!v13 || (int v14 = v13[26], v13, !v14))
  {
    id v16 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    goto LABEL_11;
  }
  id v27 = 0;
  uint64_t v28 = 0;
  unsigned __int8 v15 = [v11 seekToEndReturningOffset:&v28 error:&v27];
  id v16 = v27;
  if ((v15 & 1) == 0)
  {
LABEL_11:
    v12[2](v12, 0, v16);
    goto LABEL_12;
  }
  id v17 = [(PDEndpointServer *)self daemon];
  id v18 = [v17 operationsManager];

  if (v18)
  {
    uint64_t v19 = [PDRelayRequestOperation alloc];
    id v20 = [(PDEndpointServer *)self database];
    id v21 = [(PDRelayRequestOperation *)v19 initWithDatabase:v20 data:v10 fileHandle:v11 requestType:a4];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003B188;
    v24[3] = &unk_1001F2560;
    uint64_t v25 = v12;
    [(PDOperation *)v21 addOnFinishBlock:v24];
    id v22 = [v17 operationsManager];
    sub_100110A9C(v22, v21);
  }
  else
  {
    CLSInitLog();
    id v23 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Operations manager is nil!", buf, 2u);
    }
    id v21 = +[NSError cls_createErrorWithCode:100 description:@"Operations manager is nil."];
    v12[2](v12, 0, v21);
  }

LABEL_12:
}

- (void)remote_saveInsightEvents:(id)a3 completion:(id)a4
{
  id v20 = a3;
  int v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(PDEndpointServer *)self client];
  if (!v7 || (int v8 = v7[26], v7, !v8))
  {
    CFStringRef v18 = @"Not authorized.";
    goto LABEL_9;
  }
  int v9 = [(PDEndpointServer *)self database];
  unsigned __int8 v10 = +[PDEndpointRequestOperation isEndpointAvailable:@"uploadEvents" inDatabase:v9];

  if ((v10 & 1) == 0)
  {
    CFStringRef v18 = @"Not enabled.";
LABEL_9:
    uint64_t v19 = +[NSError cls_createErrorWithCode:4 description:v18];
    goto LABEL_10;
  }
  id v11 = [(PDEndpointServer *)self database];
  unsigned __int8 v12 = [v11 insertOrUpdateObjects:v20];

  if (v12)
  {
    id v13 = [(PDEndpointServer *)self daemon];
    int v14 = [PDUploadEventsOperation alloc];
    unsigned __int8 v15 = [(PDEndpointServer *)self database];
    id v16 = [(PDURLRequestOperation *)v14 initWithDatabase:v15];

    id v17 = [v13 operationsManager];
    sub_100111240(v17, v16);

    v6[2](v6, 1, 0);
    goto LABEL_11;
  }
  uint64_t v19 = +[NSError cls_createErrorWithCode:100, @"Failed to save events: %@", v20 format];
LABEL_10:
  id v13 = (void *)v19;
  v6[2](v6, 0, v19);
LABEL_11:
}

- (int64_t)_authorizationStatusActivityWithID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PDEndpointServer *)self database];
  int v6 = [v5 select:objc_opt_class() identity:v4];

  if (v6)
  {
    id v7 = [v6 parentObjectID];
    int64_t v8 = [(PDEndpointServer *)self _authorizationStatusForHandoutAssignedItem:v7];

    if (v8 == 1)
    {
      int64_t v9 = 1;
    }
    else
    {
      unsigned __int8 v10 = [v6 parentObjectID];
      int64_t v9 = [(PDEndpointServer *)self _authorizationStatusForContextWithObjectID:v10];
    }
  }
  else
  {
    int64_t v9 = 2;
  }

  return v9;
}

- (int64_t)_authorizationStatusForContextWithObjectID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PDEndpointServer *)self database];
  uint64_t v6 = objc_opt_class();
  id v11 = v4;
  id v7 = +[NSArray arrayWithObjects:&v11 count:1];

  int64_t v8 = [v5 select:v6 where:@"objectID = ?" bindings:v7];

  int64_t v9 = [(PDEndpointServer *)self _authorizationStatusForContext:v8];
  return v9;
}

- (int64_t)_authorizationStatusForContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    unsigned __int8 v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 2;
    unsigned __int8 v5 = [(PDEndpointServer *)self database];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003BB58;
    v8[3] = &unk_1001F25D0;
    unsigned __int8 v10 = &v11;
    v8[4] = self;
    id v9 = v4;
    sub_10000749C(v5, v8);

    int64_t v6 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (int64_t)_authorizationStatusForHandoutAssignedItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [(PDEndpointServer *)self database];
    int64_t v6 = [v5 select:objc_opt_class() identity:v4];

    uint64_t v14 = 0;
    unsigned __int8 v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 2;
    id v7 = [(PDEndpointServer *)self database];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003BD7C;
    v11[3] = &unk_1001F25D0;
    uint64_t v13 = &v14;
    v11[4] = self;
    id v8 = v6;
    id v12 = v8;
    sub_10000749C(v7, v11);

    int64_t v9 = v15[3];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    int64_t v9 = 2;
  }

  return v9;
}

- (int64_t)_authorizationStatusForObject:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 2;
  unsigned __int8 v5 = [(PDEndpointServer *)self database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003BF4C;
  v9[3] = &unk_1001F2008;
  id v6 = v4;
  uint64_t v11 = self;
  id v12 = &v13;
  id v10 = v6;
  sub_10000749C(v5, v9);
  int64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)_clientScopedPredicate:(id)a3 forEntityClass:(Class)a4
{
  id v6 = a3;
  int64_t v7 = [(PDEndpointServer *)self client];
  id v8 = v7;
  if (v7 && v7[24])
  {
  }
  else
  {
    int64_t v9 = [(PDEndpointServer *)self database];
    unsigned __int8 v10 = [v9 entityClass:a4 containsColumnNamed:@"appIdentifier"];

    if (v10)
    {
      uint64_t v11 = [(PDEndpointServer *)self client];
      id v12 = sub_10000C6B4(v11);

      objc_msgSend(v6, "pd_scopeToKeyPath:value:", @"appIdentifier", v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  id v13 = v6;
LABEL_7:

  return v13;
}

- (NSMutableDictionary)statusReport
{
  unsigned __int8 v3 = [(PDEndpointServer *)self client];
  id v4 = sub_1000A5990(v3);
  id v5 = [v4 mutableCopy];

  if (self && (previousCommands = self->_previousCommands) != 0) {
    id v7 = [(NSMutableArray *)previousCommands->_buffer count];
  }
  else {
    id v7 = 0;
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Last %ld executed commands", v7);
  if (self) {
    int64_t v9 = self->_previousCommands;
  }
  else {
    int64_t v9 = 0;
  }
  unsigned __int8 v10 = v9;
  uint64_t v11 = sub_1000A4010(v10);
  [v5 setObject:v11 forKeyedSubscript:v8];

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C3FC;
  block[3] = &unk_1001F26E8;
  objc_copyWeak(&v17, &location);
  id v13 = v5;
  id v16 = v13;
  dispatch_sync(queue, block);
  [v13 setObject:&__kCFBooleanFalse forKeyedSubscript:@"is connected as dev"];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return (NSMutableDictionary *)v13;
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousCommands, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_lastProgressRecordingBannerTime, 0);

  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end