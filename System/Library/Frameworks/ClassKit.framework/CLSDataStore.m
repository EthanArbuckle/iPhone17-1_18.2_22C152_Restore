@interface CLSDataStore
+ (BOOL)isAvailable;
+ (BOOL)isDashboardApp;
+ (BOOL)isPDTool;
+ (BOOL)isPrivateSearchAPIEnabled;
+ (BOOL)isSearchAPIEnabled;
+ (CLSCurrentUser)currentUser;
+ (CLSDataStore)shared;
+ (Class)endpointClass;
+ (id)handoutGraphFromHandout:(id)a3;
+ (id)handoutSubgraphContainingAsset:(id)a3;
+ (id)newDatastore;
- (BOOL)isAllowedToInsertObject:(id)a3;
- (BOOL)isAppClient;
- (BOOL)isDashboardAPIEnabled;
- (BOOL)isPrivateSearchAPIEnabled;
- (BOOL)isRemovedObject:(id)a3;
- (BOOL)isSearchAPIEnabled;
- (CLSActivity)runningActivity;
- (CLSAuthTree)authTree;
- (CLSAuthTree)handoutAssignedItemsAuthTree;
- (CLSContext)activeContext;
- (CLSContext)mainAppContext;
- (CLSCurrentUser)cachedCurrentUser;
- (CLSDataStore)init;
- (CLSDataStore)initWithEndpoint:(id)a3;
- (CLSEndpointConnection)endpointConnection;
- (CLSGraph)graph;
- (id)_addObject:(id)a3;
- (id)_arrangeObjectsIfNeeded:(id)a3;
- (id)_filterObjectsBeingSavedFromObjects:(id)a3;
- (id)_modifiedObjects;
- (id)_validateObjects:(id)a3;
- (id)addObject:(id)a3;
- (id)allContexts;
- (id)appIdentifier;
- (id)cachedMainAppContext;
- (id)currentUser;
- (id)dataServer:(id)a3;
- (id)delegate;
- (id)objectWithObjectID:(id)a3;
- (id)orphanedAssets:(id *)a3;
- (id)runningActivities;
- (id)serverInternalState:(unint64_t)a3 error:(id *)a4;
- (id)syncDataServer:(id)a3;
- (id)syncFetchContextsForContextIDs:(id)a3;
- (id)syncFetchProgressReportingCapabilitiesForContextID:(id)a3;
- (id)syncFetchThumbnailBlobForContext:(id)a3;
- (id)syncUtilityServer:(id)a3;
- (id)uploadAsset:(id)a3;
- (id)utilityServer:(id)a3;
- (unint64_t)serverSyncStatus;
- (void)_classesForCurrentUserWithRole:(unint64_t)a3 completion:(id)a4;
- (void)_connectionConnected;
- (void)_createMainAppContext;
- (void)_fetchHandoutAttachmentForDocumentURL:(id)a3 completion:(id)a4;
- (void)_generatePartialTimeIntervalsForRunningActivities;
- (void)_reconnect;
- (void)_reenableObservers;
- (void)_refreshMainAppContext;
- (void)_registerForAccountChangedDarwinNotification;
- (void)_save;
- (void)_saveObjects:(id)a3 completion:(id)a4;
- (void)_validateAndCreateHandoutAssignedItemFor:(id)a3 completion:(id)a4;
- (void)addCollection:(id)a3;
- (void)addFavorite:(id)a3;
- (void)addHandout:(id)a3;
- (void)addRunningActivitiesObject:(id)a3;
- (void)addSurveyAnswerItem:(id)a3;
- (void)adminRequestorForEmail:(id)a3 completion:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)awaitExecuteQuery:(id)a3 completion:(id)a4;
- (void)canSearchRostersWithCompletion:(id)a3;
- (void)childrenOfAdminRequestID:(id)a3 completion:(id)a4;
- (void)classesForPersonID:(id)a3 role:(unint64_t)a4 completion:(id)a5;
- (void)cloudKitThumbnailUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4;
- (void)cloudKitUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4;
- (void)cloudKitUrlSuitableForStreamingAsset:(id)a3 completion:(id)a4;
- (void)collaborationStatesForObjectWithID:(id)a3 classID:(id)a4 forOwnersWithRole:(unint64_t)a5 completion:(id)a6;
- (void)collaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4 completion:(id)a5;
- (void)completeAllAssignedActivitiesMatching:(NSArray *)contextPath;
- (void)contextsMatchingIdentifier:(id)a3 completion:(id)a4;
- (void)contextsMatchingIdentifierPath:(NSArray *)identifierPath completion:(void *)completion;
- (void)contextsMatchingIdentifierPath:(id)a3 parentContext:(id)a4 completion:(id)a5;
- (void)contextsMatchingPredicate:(NSPredicate *)predicate completion:(void *)completion;
- (void)createShareIfNeededForURL:(id)a3 completion:(id)a4;
- (void)currentUserWithCompletion:(id)a3;
- (void)currentUserWithServer:(id)a3 completion:(id)a4;
- (void)dataServer:(id)a3 executeQuery:(id)a4 issueServerRequest:(BOOL)a5;
- (void)dealloc;
- (void)deleteAdminRequestID:(id)a3 completion:(id)a4;
- (void)deleteArchivedCollectionObjects:(id)a3 withCompletion:(id)a4;
- (void)deleteBackingStoreForAsset:(id)a3 completion:(id)a4;
- (void)deregisterDataObserver:(id)a3;
- (void)developerModeChanged:(id)a3;
- (void)enrolledClassesWithCompletion:(id)a3;
- (void)executeQuery:(id)a3;
- (void)executeQuery:(id)a3 issueServerRequest:(BOOL)a4;
- (void)faultMainAppContext;
- (void)featureIsEnabled:(int)a3 completion:(id)a4;
- (void)fetchActivityForURL:(NSURL *)url completion:(void *)completion;
- (void)fetchAndCompleteAllAssignedActivitiesForContextPath:(id)a3 withCompletion:(id)a4;
- (void)fetchAppBasedAssignmentUsage:(id)a3 completion:(id)a4;
- (void)fetchAssignedItemFor:(id)a3 completion:(id)a4;
- (void)fetchCollectionItemsWithCompletion:(id)a3;
- (void)fetchCollectionsWithCompletion:(id)a3;
- (void)fetchReportsWithPredicate:(id)a3 completion:(id)a4;
- (void)fetchSurveyAnswers:(id)a3 responderIDs:(id)a4 completion:(id)a5;
- (void)fetchTransparencyMessageInfoForAttachmentID:(id)a3 withCompletion:(id)a4;
- (void)fetchTransparencyMessageInfoWithCompletion:(id)a3;
- (void)getCurrentUseriCloudQuotaInfoWithCompletion:(id)a3;
- (void)handoutAttachmentForDocumentURL:(id)a3 completion:(id)a4;
- (void)instructedClassesWithCompletion:(id)a3;
- (void)lock;
- (void)markObjectAsDeleted:(id)a3;
- (void)membersOfGroupWithIdentifier:(id)a3 completion:(id)a4;
- (void)objectsMatching:(id)a3 completion:(id)a4;
- (void)personsInClassWithClassID:(id)a3 role:(unint64_t)a4 completion:(id)a5;
- (void)presentTransparencyMessageForHandoutAssignedItemInfo:(id)a3;
- (void)presentTransparencyMessageInfo:(id)a3;
- (void)pruneDeletedObjectsWithCompletion:(id)a3;
- (void)publishAdminRequests:(id)a3 withRequestor:(id)a4 adminRequestAccounts:(id)a5 completion:(id)a6;
- (void)publishAnswersForSurvey:(id)a3 completion:(id)a4;
- (void)publishCollaborationStateChanges:(id)a3 completion:(id)a4;
- (void)publishHandout:(id)a3 completion:(id)a4;
- (void)refreshAuthTreeForAttachment:(id)a3 withCompletion:(id)a4;
- (void)refreshAuthTreeWithCompletion:(id)a3;
- (void)refreshMainAppContext;
- (void)registerDataObserver:(id)a3;
- (void)relayRequestWithData:(id)a3 requestType:(unint64_t)a4 completion:(id)a5;
- (void)removeActivityWithObjectID:(id)a3;
- (void)removeAsset:(id)a3;
- (void)removeClass:(id)a3;
- (void)removeClass:(id)a3 completion:(id)a4;
- (void)removeCollection:(id)a3;
- (void)removeContextWithObjectID:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeObjectWithObjectID:(id)a3 class:(Class)a4;
- (void)removeRunningActivitiesObject:(id)a3;
- (void)removeSurveyAnswerItem:(id)a3;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)repairHandoutAttachments:(id)a3 completion:(id)a4;
- (void)reset;
- (void)saveClass:(id)a3 completion:(id)a4;
- (void)saveInsightEvents:(id)a3 completion:(id)a4;
- (void)saveObjects:(id)a3 completion:(id)a4;
- (void)saveWithCompletion:(void *)completion;
- (void)setCachedCurrentUser:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEndpointConnection:(id)a3;
- (void)setMainAppContext:(id)a3;
- (void)setShouldSyncTeacherBrowsedContexts:(BOOL)a3 completion:(id)a4;
- (void)setTestSharedDataStore:(id)a3;
- (void)shouldPerformSearchAPIOperation:(id)a3 completion:(id)a4;
- (void)shouldSyncTeacherBrowsedContextsWithCompletion:(id)a3;
- (void)startActivity:(id)a3 activityType:(int)a4 bundleID:(id)a5 completion:(id)a6;
- (void)startActivityFailed:(id)a3 activityType:(int)a4 completion:(id)a5;
- (void)studentActivityForAttachmentsWithIDs:(id)a3 completion:(id)a4;
- (void)syncDeleteProgressReportingCapabilitiesForContextID:(id)a3;
- (void)syncDeleteThumbnailBlobForContext:(id)a3;
- (void)syncFetchWithCompletion:(id)a3;
- (void)syncServerConfigWithCompletion:(id)a3;
- (void)triggerProgressTransparencyMessageForAttachmentID:(id)a3;
- (void)triggerUserNotificationHandoutAssigned:(id)a3 completion:(id)a4;
- (void)triggerUserNotificationHandoutDueSoonWithReferenceDate:(id)a3 completion:(id)a4;
- (void)triggerUserNotificationHandoutPastDueSummaryWithReferenceDate:(id)a3 completion:(id)a4;
- (void)triggerUserNotificationReviewDueHandoutsWithReferenceDate:(id)a3 completion:(id)a4;
- (void)triggerUserNotificationRevisedSubmissionWithAttachmentID:(id)a3 studentName:(id)a4 completion:(id)a5;
- (void)triggerUserNotificationRevisionRequested:(id)a3 completion:(id)a4;
- (void)unlock;
- (void)urlSuitableForOpeningForExpectedURL:(id)a3 itemID:(id)a4 ownerName:(id)a5 zoneName:(id)a6 completion:(id)a7;
@end

@implementation CLSDataStore

+ (Class)endpointClass
{
  return (Class)objc_opt_class();
}

- (void)setTestSharedDataStore:(id)a3
{
}

+ (CLSDataStore)shared
{
  if (CurrentProcessNameMatches(@"progressd"))
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v3 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1DC60F000, v3, OS_LOG_TYPE_FAULT, "ERROR: CLSDataStore is not available to progressd", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC64BAE8;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4A90 != -1) {
    dispatch_once(&qword_1EB5D4A90, block);
  }
  v4 = (void *)qword_1EB5D4A88;

  return (CLSDataStore *)v4;
}

+ (BOOL)isAvailable
{
  return ((uint64_t (*)(void, char *))MEMORY[0x1F4181798])(MEMORY[0x1E4F179C8], sel_cls_hasEligibleAccount);
}

+ (id)newDatastore
{
  id v2 = objc_alloc((Class)a1);

  return (id)objc_msgSend_initWithEndpoint_(v2, v3, 0);
}

+ (BOOL)isPDTool
{
  if (qword_1EB5D4A98 != -1) {
    dispatch_once(&qword_1EB5D4A98, &unk_1F37A15F0);
  }
  return byte_1EB5D4A80;
}

- (BOOL)isDashboardAPIEnabled
{
  id v2 = objc_opt_class();

  return objc_msgSend_isDashboardApp(v2, v3, v4);
}

- (BOOL)isSearchAPIEnabled
{
  id v2 = objc_opt_class();

  return objc_msgSend_isSearchAPIEnabled(v2, v3, v4);
}

- (BOOL)isPrivateSearchAPIEnabled
{
  id v2 = objc_opt_class();

  return objc_msgSend_isPrivateSearchAPIEnabled(v2, v3, v4);
}

- (BOOL)isAllowedToInsertObject:(id)a3
{
  id v4 = a3;
  v5 = CLSDashboardClasses();
  uint64_t v6 = objc_opt_class();
  int v8 = objc_msgSend_containsObject_(v5, v7, v6);

  v9 = CLSSearchClasses();
  uint64_t v10 = objc_opt_class();

  int v12 = objc_msgSend_containsObject_(v9, v11, v10);
  return (objc_msgSend_isDashboardAPIEnabled(self, v13, v14) & 1) != 0
      || !v8
      || (objc_msgSend_isSearchAPIEnabled(self, v15, v16) & 1) != 0
      || v12 != 1;
}

- (CLSDataStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSDataStore)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)CLSDataStore;
  v5 = [(CLSDataStore *)&v83 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock = 0;
    uint64_t v7 = objc_opt_new();
    deletedObjectsByID = v6->_deletedObjectsByID;
    v6->_deletedObjectsByID = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    objectGenerationsByID = v6->_objectGenerationsByID;
    v6->_objectGenerationsByID = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    graph = v6->_graph;
    v6->_graph = (CLSGraph *)v11;

    uint64_t v15 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v13, v14);
    lastPruneDate = v6->_lastPruneDate;
    v6->_lastPruneDate = (NSDate *)v15;

    v19 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18);
    objc_msgSend_addObserver_selector_name_object_(v19, v20, (uint64_t)v6, sel_applicationWillResignActive_, @"UIApplicationWillResignActiveNotification", 0);
    objc_msgSend_addObserver_selector_name_object_(v19, v21, (uint64_t)v6, sel_applicationDidBecomeActive_, @"UIApplicationDidBecomeActiveNotification", 0);
    objc_msgSend_addObserver_selector_name_object_(v19, v22, (uint64_t)v6, sel_developerModeChanged_, @"CLSDeveloperModeDidChangeNotification", 0);
    objc_msgSend_addObserver_selector_name_object_(v19, v23, (uint64_t)v6, sel_reset, @"CLSSignificantBackingStoreChangeNotification", 0);
    uint64_t v24 = objc_opt_new();
    dataObservers = v6->_dataObservers;
    v6->_dataObservers = (NSMutableSet *)v24;

    v26 = objc_opt_class();
    v29 = objc_msgSend_endpointClass(v26, v27, v28);
    uint64_t v31 = objc_msgSend_instanceForEndpoint_(v29, v30, (uint64_t)v4);
    endpointConnection = v6->_endpointConnection;
    v6->_endpointConnection = (CLSEndpointConnection *)v31;

    objc_initWeak(&location, v6);
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = sub_1DC64C2BC;
    v80[3] = &unk_1E6C965E8;
    objc_copyWeak(&v81, &location);
    objc_msgSend_setOnInterupt_(v6->_endpointConnection, v33, (uint64_t)v80);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = sub_1DC64C300;
    v78[3] = &unk_1E6C965E8;
    objc_copyWeak(&v79, &location);
    objc_msgSend_setOnConnect_(v6->_endpointConnection, v34, (uint64_t)v78);
    if (objc_msgSend_isDashboardAPIEnabled(v6, v35, v36)) {
      objc_msgSend__registerForAccountChangedDarwinNotification(v6, v37, v38);
    }
    uint64_t v39 = objc_opt_new();
    pendingSaves = v6->_pendingSaves;
    v6->_pendingSaves = (NSMutableArray *)v39;

    v41 = (void *)MEMORY[0x1E01A0360]();
    v44 = objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E4F223F8], v42, v43);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = v44;
      v50 = objc_msgSend_containingBundleRecord(v47, v48, v49);
      uint64_t v53 = objc_msgSend_bundleIdentifier(v50, v51, v52);
      appBundleIdentifier = v6->_appBundleIdentifier;
      v6->_appBundleIdentifier = (NSString *)v53;

      uint64_t v57 = objc_msgSend_localizedName(v50, v55, v56);
      appName = v6->_appName;
      v6->_appName = (NSString *)v57;

      if (!objc_msgSend_length(v6->_appName, v59, v60)) {
        objc_storeStrong((id *)&v6->_appName, v6->_appBundleIdentifier);
      }
    }
    else
    {
      uint64_t v61 = objc_msgSend_bundleIdentifier(v44, v45, v46);
      v62 = v6->_appBundleIdentifier;
      v6->_appBundleIdentifier = (NSString *)v61;

      uint64_t v65 = objc_msgSend_localizedName(v44, v63, v64);
      v47 = v6->_appName;
      v6->_appName = (NSString *)v65;
    }

    if (!objc_msgSend_length(v6->_appBundleIdentifier, v66, v67))
    {
      v70 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v68, v69);
      v73 = objc_msgSend_UUIDString(v70, v71, v72);
      uint64_t v75 = objc_msgSend_stringByAppendingString_(@"com.apple.", v74, (uint64_t)v73);
      v76 = v6->_appBundleIdentifier;
      v6->_appBundleIdentifier = (NSString *)v75;
    }
    if (!objc_msgSend_length(v6->_appName, v68, v69)) {
      objc_storeStrong((id *)&v6->_appName, v6->_appBundleIdentifier);
    }
    objc_destroyWeak(&v79);
    objc_destroyWeak(&v81);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)dealloc
{
  id v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  int v8 = objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v6, v7);
  objc_msgSend_removeObserver_notificationName_(v8, v9, (uint64_t)self, @"com.apple.progressd.accountChanged");

  v10.receiver = self;
  v10.super_class = (Class)CLSDataStore;
  [(CLSDataStore *)&v10 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

+ (BOOL)isDashboardApp
{
  if (qword_1EB5D4AA0 != -1) {
    dispatch_once(&qword_1EB5D4AA0, &unk_1F37A1390);
  }
  return byte_1EB5D4A81;
}

+ (BOOL)isPrivateSearchAPIEnabled
{
  if (qword_1EB5D4AA8 != -1) {
    dispatch_once(&qword_1EB5D4AA8, &unk_1F37A13B0);
  }
  return byte_1EB5D4A82;
}

+ (BOOL)isSearchAPIEnabled
{
  if (qword_1EB5D4AB0 != -1) {
    dispatch_once(&qword_1EB5D4AB0, &unk_1F37A13F0);
  }
  return byte_1EB5D4A83;
}

- (void)_connectionConnected
{
}

- (void)_registerForAccountChangedDarwinNotification
{
  objc_initWeak(&location, self);
  v5 = objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v3, v4);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DC64C840;
  v7[3] = &unk_1E6C96630;
  objc_copyWeak(&v8, &location);
  objc_msgSend_addObserver_notificationName_block_(v5, v6, (uint64_t)self, @"com.apple.progressd.accountChanged", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_reenableObservers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self, a2, v2);
  uint64_t v4 = self->_dataObservers;
  v5 = (NSMutableSet *)objc_opt_new();
  dataObservers = self->_dataObservers;
  self->_dataObservers = v5;

  objc_msgSend_unlock(self, v7, v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = objc_msgSend_objectEnumerator(v4, v9, v10, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v25, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v11);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend_isInvalidated(v19, v14, v15) & 1) == 0)
        {
          objc_msgSend_setDataStore_(v19, v14, 0);
          objc_msgSend_registerDataObserver_(self, v20, (uint64_t)v19);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
    }
    while (v16);
  }
}

- (void)_reconnect
{
  objc_msgSend_connect(self->_endpointConnection, a2, v2);
  objc_msgSend_refreshMainAppContext(self, v4, v5);
  uint64_t v6 = objc_opt_class();
  if (objc_msgSend_isDashboardApp(v6, v7, v8))
  {
    objc_msgSend_currentUserWithCompletion_(self, v9, (uint64_t)&unk_1F37A1030);
  }
}

- (CLSCurrentUser)cachedCurrentUser
{
  objc_msgSend_lock(self, a2, v2);
  uint64_t v4 = self->_cachedCurrentUser;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)setCachedCurrentUser:(id)a3
{
  uint64_t v4 = (CLSCurrentUser *)a3;
  objc_msgSend_lock(self, v5, v6);
  cachedCurrentUser = self->_cachedCurrentUser;
  self->_cachedCurrentUser = v4;

  objc_msgSend_unlock(self, v8, v9);
}

- (void)executeQuery:(id)a3
{
}

- (void)executeQuery:(id)a3 issueServerRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC64CED4;
  v11[3] = &unk_1E6C96658;
  id v12 = v6;
  id v7 = v6;
  uint64_t v9 = objc_msgSend_dataServer_(self, v8, (uint64_t)v11);
  objc_msgSend_dataServer_executeQuery_issueServerRequest_(self, v10, (uint64_t)v9, v7, v4);
}

- (void)dataServer:(id)a3 executeQuery:(id)a4 issueServerRequest:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_isExecuting(v9, v10, v11))
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    uint64_t v13 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412290;
      id v27 = v9;
      _os_log_error_impl(&dword_1DC60F000, v13, OS_LOG_TYPE_ERROR, "ERROR: trying to execute query that is already being executed: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    objc_msgSend_setExecuting_(v9, v12, 1);
    objc_msgSend_setDataStore_(v9, v14, (uint64_t)self);
    uint64_t v17 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16);
    objc_msgSend_setStartDate_(v9, v18, (uint64_t)v17);

    long long v21 = objc_msgSend_querySpec(v9, v19, v20);
    long long v24 = objc_msgSend_searchSpec(v9, v22, v23);
    objc_msgSend_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_(v8, v25, (uint64_t)v9, v21, v24, v5, &unk_1F37A1050);
  }
}

- (void)awaitExecuteQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1F37A1410);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1DC64D254;
  v19[3] = &unk_1E6C96680;
  id v20 = v7;
  id v21 = v8;
  id v9 = v8;
  id v10 = v7;
  objc_msgSend_setCompletion_(v6, v11, (uint64_t)v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DC64D2A0;
  v17[3] = &unk_1E6C96658;
  id v18 = v6;
  id v12 = v6;
  uint64_t v14 = objc_msgSend_syncDataServer_(self, v13, (uint64_t)v17);
  objc_msgSend_dataServer_executeQuery_issueServerRequest_(self, v15, (uint64_t)v14, v12, 1);
  dispatch_time_t v16 = dispatch_time(0, 60000000000);
  dispatch_block_wait(v9, v16);
}

- (void)fetchCollectionsWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC64D3B4;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_fetchCollectionsWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)fetchCollectionItemsWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC64D474;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_fetchCollectionItemsWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)deleteArchivedCollectionObjects:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC64D550;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_deleteCollectionRelatedObjectsWithCompletion_completion_(v10, v11, (uint64_t)v8, v7);
}

- (id)cachedMainAppContext
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_mainAppContext;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (CLSContext)mainAppContext
{
  id v4 = objc_msgSend_cachedMainAppContext(self, a2, v2);
  if (!v4)
  {
    objc_msgSend__createMainAppContext(self, v5, v6);
    id v4 = objc_msgSend_cachedMainAppContext(self, v7, v8);
  }
  id v9 = v4;

  return (CLSContext *)v9;
}

- (void)_createMainAppContext
{
  v25[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self, a2, v2);
  uint64_t v6 = objc_msgSend_appIdentifier(self, v4, v5);
  id v7 = self->_appName;
  uint64_t v8 = [CLSContext alloc];
  id v10 = objc_msgSend_initWithInternalType_identifier_title_(v8, v9, 1, v6, v7);
  objc_msgSend_setTemporary_(v10, v11, 0);
  int isClassKitEnabled = objc_msgSend_isClassKitEnabled(CLSEndpointConnection, v12, v13);
  v25[0] = v6;
  dispatch_time_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v25, 1);
  objc_msgSend_setIdentifierPathAndGenerateObjectID_(v10, v17, (uint64_t)v16);

  objc_msgSend_addObject_(self, v18, (uint64_t)v10);
  v19 = (CLSContext *)objc_claimAutoreleasedReturnValue();
  mainAppContext = self->_mainAppContext;
  self->_mainAppContext = v19;

  objc_msgSend_unlock(self, v21, v22);
  if (isClassKitEnabled) {
    objc_msgSend__refreshMainAppContext(self, v23, v24);
  }
}

- (void)refreshMainAppContext
{
  objc_msgSend_lock(self, a2, v2);
  if (self->_mainAppContext) {
    objc_msgSend__refreshMainAppContext(self, v4, v5);
  }

  objc_msgSend_unlock(self, v4, v5);
}

- (void)faultMainAppContext
{
  objc_msgSend_lock(self, a2, v2);
  if (self->_mainAppContext
    || (uint64_t v6 = objc_opt_class(), !objc_msgSend_isDashboardApp(v6, v7, v8))
    || (id v9 = objc_opt_class(), (objc_msgSend_isPDTool(v9, v10, v11) & 1) != 0))
  {
    objc_msgSend_unlock(self, v4, v5);
    id v12 = [CLSFaultProcessor alloc];
    uint64_t v14 = objc_msgSend_initWithDelegate_(v12, v13, (uint64_t)self);
    uint64_t v17 = objc_msgSend_mainAppContext(self, v15, v16);
    objc_msgSend_faultObject_(v14, v18, (uint64_t)v17);

    if (v14)
    {
      objc_msgSend_waitUntilDone_(v14, v19, v20, 60.0);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = sub_1DC64D8B8;
      v22[3] = &unk_1E6C96320;
      v22[4] = self;
      objc_msgSend_enumerate_(v14, v21, (uint64_t)v22);
    }
  }
  else
  {
    objc_msgSend_unlock(self, v4, v5);
  }
}

- (void)_refreshMainAppContext
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_mainAppContext;
  objc_msgSend_unlock(self, v5, v6);
  id v9 = objc_msgSend_endpointConnection(self, v7, v8);
  uint64_t v11 = objc_msgSend_dataServer_(v9, v10, (uint64_t)&unk_1F37A1090);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC64D9DC;
  v14[3] = &unk_1E6C966A8;
  uint64_t v15 = v4;
  id v16 = &unk_1F37A1090;
  id v12 = v4;
  objc_msgSend_remote_mainAppContextWithCompletion_(v11, v13, (uint64_t)v14);
}

- (id)appIdentifier
{
  id v4 = objc_msgSend_endpointConnection(self, a2, v2);
  id v7 = objc_msgSend_overrideBundleIdentifier(v4, v5, v6);

  if (!objc_msgSend_length(v7, v8, v9))
  {
    id v10 = self->_appBundleIdentifier;

    id v7 = v10;
  }

  return v7;
}

- (id)allContexts
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1DC64DC24;
  uint64_t v20 = sub_1DC64DC34;
  id v21 = 0;
  id v4 = objc_msgSend_appIdentifier(self, a2, v2);
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v6, @"appIdentifier = %@", v4);
  id v15 = 0;
  uint64_t v9 = objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v8, v5, v7, &v15);
  id v10 = v15;

  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1DC64DC3C;
    v14[3] = &unk_1E6C966D0;
    void v14[4] = &v16;
    objc_msgSend_awaitExecuteQuery_completion_(self, v11, (uint64_t)v9, v14);
  }
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v12;
}

- (void)contextsMatchingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (objc_msgSend_length(v6, v8, v9))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_predicateForObjectsWithIdentifier_(CLSQuery, v12, (uint64_t)v6);
    id v20 = 0;
    id v15 = objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v14, v11, v13, &v20);
    id v16 = v20;

    if (v15)
    {
      objc_msgSend_setCompletion_(v15, v17, (uint64_t)v7);
      objc_msgSend_executeQuery_(self, v18, (uint64_t)v15);
    }
    else
    {
      v7[2](v7, 0, v16);
    }
  }
  else
  {
    v19 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v10, 2, @"No identifier specified.");
    v7[2](v7, 0, v19);
  }
}

- (void)contextsMatchingPredicate:(NSPredicate *)predicate completion:(void *)completion
{
  id v6 = completion;
  id v7 = predicate;
  uint64_t v8 = objc_opt_class();
  id v14 = 0;
  id v10 = objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v9, v8, v7, &v14);

  id v12 = v14;
  if (v10)
  {
    objc_msgSend_setCompletion_(v10, v11, (uint64_t)v6);

    objc_msgSend_executeQuery_(self, v13, (uint64_t)v10);
  }
  else
  {
    (*((void (**)(void *, void, id))v6 + 2))(v6, 0, v12);
  }
}

- (id)syncFetchContextsForContextIDs:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1DC64DC24;
  uint64_t v18 = sub_1DC64DC34;
  id v19 = 0;
  id v6 = objc_msgSend_syncDataServer_(self, v5, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC64DFAC;
  v11[3] = &unk_1E6C966F8;
  id v7 = v4;
  id v12 = v7;
  uint64_t v13 = &v14;
  objc_msgSend_remote_fetchContextsForContextIDs_completion_(v6, v8, (uint64_t)v7, v11);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)syncFetchThumbnailBlobForContext:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1DC64DC24;
  uint64_t v18 = sub_1DC64DC34;
  id v19 = 0;
  id v6 = objc_msgSend_syncDataServer_(self, v5, 0);
  id v9 = objc_msgSend_objectID(v4, v7, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC64E214;
  v13[3] = &unk_1E6C96720;
  v13[4] = &v14;
  objc_msgSend_remote_fetchThumbnailBlobForContextID_completion_(v6, v10, (uint64_t)v9, v13);

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)syncDeleteThumbnailBlobForContext:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend_syncDataServer_(self, v5, 0);
  id v9 = objc_msgSend_objectID(v4, v7, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC64E2F4;
  v12[3] = &unk_1E6C96748;
  id v13 = v4;
  id v10 = v4;
  objc_msgSend_remote_deleteThumbnailBlobForContextID_completion_(v6, v11, (uint64_t)v9, v12);
}

- (id)syncFetchProgressReportingCapabilitiesForContextID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1DC64DC24;
  id v15 = sub_1DC64DC34;
  id v16 = 0;
  id v6 = objc_msgSend_syncDataServer_(self, v5, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DC64E544;
  v10[3] = &unk_1E6C966D0;
  v10[4] = &v11;
  objc_msgSend_remote_fetchProgressReportingCapabilitiesForContextID_completion_(v6, v7, (uint64_t)v4, v10);
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)syncDeleteProgressReportingCapabilitiesForContextID:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend_syncDataServer_(self, v5, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC64E608;
  v9[3] = &unk_1E6C96748;
  id v10 = v4;
  id v7 = v4;
  objc_msgSend_remote_deleteProgressReportingCapabilitiesForContextID_completion_(v6, v8, (uint64_t)v7, v9);
}

- (unint64_t)serverSyncStatus
{
  uint64_t v2 = objc_msgSend_syncDataServer_(self, a2, 0);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1DC64E7D4;
  v6[3] = &unk_1E6C95D40;
  v6[4] = &v7;
  objc_msgSend_remote_getServerSyncStatusWithCompletion_(v2, v3, (uint64_t)v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)serverInternalState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1DC64DC24;
  uint64_t v24 = sub_1DC64DC34;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3)
  {
    id v8 = objc_msgSend_syncDataServer_(self, v7, 0);
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = sub_1DC64DC24;
    uint64_t v18 = sub_1DC64DC34;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1DC64EACC;
    v13[3] = &unk_1E6C96770;
    v13[4] = &v14;
    void v13[5] = &v20;
    v13[6] = a3;
    objc_msgSend_remote_getServerInternalStateInfoWithCompletion_(v8, v9, (uint64_t)v13);
    if (v15[5])
    {
      objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E4F28C58], v10, (uint64_t)a4);
      id v11 = 0;
    }
    else
    {
      id v11 = (id)v21[5];
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E4F28C58], v7, (uint64_t)a4, 2, @"options cannot equal CLSServerInternalStateInfoNone");
    id v11 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

- (void)completeAllAssignedActivitiesMatching:(NSArray *)contextPath
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v4 = contextPath;
  uint64_t v7 = v4;
  if (v4 && objc_msgSend_count(v4, v5, v6))
  {
    if ((objc_msgSend_isAppClient(self, v8, v9) & 1) != 0
      || (id v12 = objc_opt_class(), (objc_msgSend_isPDTool(v12, v13, v14) & 1) != 0))
    {
      objc_msgSend_lock(self, v10, v11);
      self->_saveInProgress = 1;
      objc_msgSend_unlock(self, v15, v16);
      objc_initWeak(location, self);
      uint64_t v17 = v7;
      uint64_t v20 = objc_msgSend_mainAppContext(self, v18, v19);
      uint64_t v23 = objc_msgSend_identifier(v20, v21, v22);

      if (v23)
      {
        int v26 = objc_msgSend_firstObject(v17, v24, v25);
        if (objc_msgSend_isEqualToString_(v26, v27, (uint64_t)v23))
        {
          uint64_t v28 = v17;
        }
        else
        {
          id v37 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v28 = objc_msgSend_initWithArray_(v37, v38, (uint64_t)v17);
          objc_msgSend_insertObject_atIndex_(v28, v39, (uint64_t)v23, 0);
        }
      }
      else
      {
        uint64_t v28 = v17;
      }
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1DC64F078;
      v41[3] = &unk_1E6C96798;
      objc_copyWeak(&v42, location);
      objc_msgSend_fetchAndCompleteAllAssignedActivitiesForContextPath_withCompletion_(self, v40, (uint64_t)v28, v41);
      objc_destroyWeak(&v42);

      objc_destroyWeak(location);
    }
    else
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      v30 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = v30;
        v32 = objc_opt_class();
        LODWORD(location[0]) = 67109376;
        HIDWORD(location[0]) = objc_msgSend_isPDTool(v32, v33, v34);
        LOWORD(location[1]) = 1024;
        *(_DWORD *)((char *)&location[1] + 2) = objc_msgSend_isAppClient(self, v35, v36);
        _os_log_debug_impl(&dword_1DC60F000, v31, OS_LOG_TYPE_DEBUG, "CLSDataStore completeAllAssignedActivitiesMatching isPDTool: %d, is an app or app extension client: %d", (uint8_t *)location, 0xEu);
      }
    }
  }
  else
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v29 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_debug_impl(&dword_1DC60F000, v29, OS_LOG_TYPE_DEBUG, "CLSDataStore completeAllAssignedActivitiesMatching must provide a contextPath: %@", (uint8_t *)location, 0xCu);
    }
  }
}

- (void)fetchAndCompleteAllAssignedActivitiesForContextPath:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  id v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1DC60F000, v8, OS_LOG_TYPE_DEFAULT, "CLSDataStore fetchAllAssignedActivitiesForContextPath called for contextpath: %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC64F380;
  v13[3] = &unk_1E6C95CF8;
  id v14 = v7;
  id v9 = v7;
  uint64_t v11 = objc_msgSend_dataServer_(self, v10, (uint64_t)v13);
  objc_msgSend_remote_fetchAndCompleteActiveAssignedActivitiesForContextPath_withCompletion_(v11, v12, (uint64_t)v6, v9);
}

- (void)fetchActivityForURL:(NSURL *)url completion:(void *)completion
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = url;
  id v9 = completion;
  if (!v6)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v7, 2, @"URL not valid.");
    id v16 = LABEL_11:;
    v9[2](v9, 0, v16);

    goto LABEL_12;
  }
  if ((objc_msgSend_isAppClient(self, v7, v8) & 1) == 0)
  {
    uint64_t v10 = objc_opt_class();
    if ((objc_msgSend_isPDTool(v10, v11, v12) & 1) == 0)
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      id v14 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = v14;
        *(_DWORD *)buf = 67109120;
        int isAppClient = objc_msgSend_isAppClient(self, v18, v19);
        _os_log_debug_impl(&dword_1DC60F000, v17, OS_LOG_TYPE_DEBUG, "CLSDataStore fetchAssignedItemFor: is not an app or app extension client: %d", buf, 8u);
      }
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v15, 4, @"Not Authorized");
      goto LABEL_11;
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1DC64F57C;
  v20[3] = &unk_1E6C967E8;
  v20[4] = self;
  id v21 = v9;
  objc_msgSend__fetchHandoutAttachmentForDocumentURL_completion_(self, v13, (uint64_t)v6, v20);

LABEL_12:
}

- (void)_fetchHandoutAttachmentForDocumentURL:(id)a3 completion:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v6;
    _os_log_debug_impl(&dword_1DC60F000, v8, OS_LOG_TYPE_DEBUG, "CLSDataStore _fetchHandoutAttachmentForDocumentURL called for url: %@", (uint8_t *)location, 0xCu);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DC64FA34;
  v17[3] = &unk_1E6C95CF8;
  id v9 = v7;
  id v18 = v9;
  uint64_t v11 = objc_msgSend_dataServer_(self, v10, (uint64_t)v17);
  objc_initWeak(location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC64FA4C;
  v14[3] = &unk_1E6C96860;
  id v12 = v9;
  id v15 = v12;
  objc_copyWeak(&v16, location);
  objc_msgSend_remote_fetchHandoutAttachmentForDocumentURL_withCompletion_(v11, v13, (uint64_t)v6, v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(location);
}

- (void)saveWithCompletion:(void *)completion
{
  id v4 = completion;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC6500B4;
  v15[3] = &unk_1E6C95CF8;
  id v5 = v4;
  id v16 = v5;
  id v6 = (void *)MEMORY[0x1E01A05F0](v15);
  objc_initWeak(&location, self);
  id v7 = clsNotificationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC650190;
  block[3] = &unk_1E6C96888;
  objc_copyWeak(&v13, &location);
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_save
{
  objc_msgSend_lock(self, a2, v2);
  if (self->_saveInProgress || !objc_msgSend_count(self->_pendingSaves, v4, v5))
  {
    objc_msgSend_unlock(self, v4, v5);
  }
  else
  {
    self->_saveInProgress = 1;
    id v6 = objc_msgSend_firstObject(self->_pendingSaves, v4, v5);
    objc_msgSend_removeObjectAtIndex_(self->_pendingSaves, v7, 0);
    objc_initWeak(&location, self);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1DC6504C4;
    v31[3] = &unk_1E6C968B0;
    id v8 = v6;
    id v32 = v8;
    objc_copyWeak(&v33, &location);
    id v9 = (void (**)(void, void))MEMORY[0x1E01A05F0](v31);
    id v12 = objc_msgSend__modifiedObjects(self, v10, v11);
    id v16 = objc_msgSend__validateObjects_(self, v13, (uint64_t)v12);
    if (v16)
    {
      objc_msgSend_unlock(self, v14, v15);
      ((void (**)(void, void *))v9)[2](v9, v16);
    }
    else
    {
      uint64_t v17 = objc_msgSend_objectEnumerator(self->_deletedObjectsByID, v14, v15);
      uint64_t v20 = objc_msgSend_allObjects(v17, v18, v19);

      objc_msgSend_addObjectsFromArray_(v12, v21, (uint64_t)v20);
      uint64_t v23 = objc_msgSend__filterObjectsBeingSavedFromObjects_(self, v22, (uint64_t)v12);

      id v12 = objc_msgSend__arrangeObjectsIfNeeded_(self, v24, (uint64_t)v23);

      if (objc_msgSend_count(v12, v25, v26))
      {
        objc_msgSend_saveObjects_completion_(self, v27, (uint64_t)v12, v9);
        objc_msgSend_unlock(self, v29, v30);
      }
      else
      {
        objc_msgSend_unlock(self, v27, v28);
        v9[2](v9, 0);
      }
    }
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }
}

- (CLSAuthTree)authTree
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_authTree;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (CLSAuthTree)handoutAssignedItemsAuthTree
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_handoutAssignedItemsAuthTree;
  objc_msgSend_unlock(self, v5, v6);

  return v4;
}

- (void)refreshAuthTreeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = objc_msgSend_dataServer_(self, v5, (uint64_t)v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC65073C;
  v9[3] = &unk_1E6C968D8;
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v11, &location);
  objc_msgSend_remote_authTreeWithCompletion_(v6, v8, (uint64_t)v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)refreshAuthTreeForAttachment:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v9 = objc_msgSend_dataServer_(self, v8, (uint64_t)v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC650958;
  v12[3] = &unk_1E6C968D8;
  id v10 = v7;
  id v13 = v10;
  objc_copyWeak(&v14, &location);
  objc_msgSend_remote_authTreeForAttachment_withCompletion_(v9, v11, (uint64_t)v6, v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)saveObjects:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC650B64;
  v11[3] = &unk_1E6C96900;
  id v8 = v7;
  id v13 = v8;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  objc_msgSend_refreshAuthTreeWithCompletion_(self, v10, (uint64_t)v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_saveObjects:(id)a3 completion:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  val = self;
  id v42 = v6;
  id v10 = objc_msgSend__filterObjectsBeingSavedFromObjects_(self, v9, (uint64_t)v6);
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3042000000;
  v61[3] = sub_1DC6511D4;
  v61[4] = sub_1DC6511E0;
  objc_initWeak(&v62, self);
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = sub_1DC64DC24;
  v59 = sub_1DC64DC34;
  id v60 = (id)objc_opt_new();
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1DC6511E8;
  v49[3] = &unk_1E6C96928;
  uint64_t v53 = v61;
  id v43 = v7;
  id v52 = v43;
  v54 = &v55;
  id v11 = v10;
  id v50 = v11;
  id v12 = v8;
  id v51 = v12;
  objc_msgSend_setCompletion_((void *)v56[5], v13, (uint64_t)v49);
  objc_msgSend_lock(self, v14, v15);
  id v16 = self->_objectGenerationsByID;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v17 = v11;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v45, v63, 16);
  if (v21)
  {
    uint64_t v22 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v25 = objc_msgSend_objectID(v24, v19, v20);
        uint64_t v26 = NSNumber;
        uint64_t v29 = objc_msgSend_generation(v24, v27, v28);
        uint64_t v31 = objc_msgSend_numberWithUnsignedInt_(v26, v30, v29);
        objc_msgSend_setObject_forKeyedSubscript_(v16, v32, (uint64_t)v31, v25);
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, (uint64_t)v31, v25);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v45, v63, 16);
    }
    while (v21);
  }

  objc_msgSend_unlock(val, v34, v35);
  if (objc_msgSend_count(v17, v36, v37))
  {
    objc_msgSend_dataServer_(val, v38, (uint64_t)v43);
    v40 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_remote_saveObjects_saveResponse_completion_(v40, v41, (uint64_t)v17, v56[5], &unk_1F37A1110);
  }
  else
  {
    objc_msgSend_completion((void *)v56[5], v38, v39);
    v40 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v40[2](v40, 0);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v61, 8);
  objc_destroyWeak(&v62);
}

- (id)_filterObjectsBeingSavedFromObjects:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  uint64_t v30 = self;
  id v7 = self->_objectGenerationsByID;
  id v31 = (id)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, v38, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v33;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v8);
        }
        id v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
        id v17 = objc_msgSend_objectID(v16, v11, v12);
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v7, v18, (uint64_t)v17);
        int v22 = objc_msgSend_generation(v16, v20, v21);
        if (!v19 || objc_msgSend_integerValue(v19, v23, v24) != v22)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (qword_1EB5D4D10 != -1) {
                dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
              }
              uint64_t v25 = CLSLogDefault;
              if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v37 = v16;
                _os_log_debug_impl(&dword_1DC60F000, v25, OS_LOG_TYPE_DEBUG, "_filterObjectsBeingSavedFromObjects Adding %@.", buf, 0xCu);
              }
              objc_msgSend_addObject_(v31, v26, (uint64_t)v16);
            }
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v32, v38, 16);
    }
    while (v13);
  }

  objc_msgSend_unlock(v30, v27, v28);

  return v31;
}

- (id)_arrangeObjectsIfNeeded:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  id v7 = objc_opt_new();
  id v31 = v4;
  objc_msgSend__cls_filter_(v4, v8, (uint64_t)&unk_1F37A1130);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v37, v44, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * v13);
        if (qword_1EB5D4D10 != -1) {
          dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
        }
        uint64_t v15 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v43 = v14;
          _os_log_debug_impl(&dword_1DC60F000, v15, OS_LOG_TYPE_DEBUG, "_arrangeObjectsIfNeeded Adding %@.", buf, 0xCu);
        }
        objc_msgSend_addObject_(v7, v16, v14);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v37, v44, 16);
    }
    while (v11);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v31;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, v41, 16);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (qword_1EB5D4D10 != -1) {
                dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
              }
              uint64_t v26 = CLSLogDefault;
              if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v43 = v24;
                _os_log_debug_impl(&dword_1DC60F000, v26, OS_LOG_TYPE_DEBUG, "_arrangeObjectsIfNeeded Adding %@.", buf, 0xCu);
              }
              objc_msgSend_addObject_(v7, v27, v24);
            }
          }
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v25, (uint64_t)&v33, v41, 16);
    }
    while (v21);
  }

  objc_msgSend_unlock(self, v28, v29);

  return v7;
}

- (id)_modifiedObjects
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = objc_opt_new();
  id v7 = objc_msgSend_graph(self, v5, v6);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC651E2C;
  v13[3] = &unk_1E6C96990;
  id v8 = v4;
  id v14 = v8;
  objc_msgSend_traverseVerticesPassingTest_enumerationBlock_(v7, v9, (uint64_t)&unk_1F37A1150, v13);

  objc_msgSend_unlock(self, v10, v11);

  return v8;
}

- (id)_validateObjects:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  id v9 = objc_msgSend_appIdentifier(self, v7, v8);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v4;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v30, v34, 16);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v17 = (void *)MEMORY[0x1E01A0360]();
        objc_msgSend_setAppIdentifier_(v16, v18, (uint64_t)v9);
        id v29 = 0;
        int v20 = objc_msgSend_validateObject_(v16, v19, (uint64_t)&v29);
        id v21 = v29;
        uint64_t v24 = v21;
        if (!v20)
        {
          objc_msgSend_unlock(self, v22, v23);

          goto LABEL_11;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v25, (uint64_t)&v30, v34, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }

  objc_msgSend_unlock(self, v26, v27);
  uint64_t v24 = 0;
LABEL_11:

  return v24;
}

- (id)objectWithObjectID:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  id v9 = objc_msgSend_graph(self, v7, v8);
  uint64_t v11 = objc_msgSend_vertexWithVertexID_(v9, v10, (uint64_t)v4);

  objc_msgSend_unlock(self, v12, v13);

  return v11;
}

- (id)addObject:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  uint64_t v8 = objc_msgSend__addObject_(self, v7, (uint64_t)v4);

  objc_msgSend_unlock(self, v9, v10);

  return v8;
}

- (id)_addObject:(id)a3
{
  id v4 = a3;
  objc_msgSend_dataStore(v4, v5, v6);
  id v7 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  if (v7 == self)
  {
    id v10 = v4;
    goto LABEL_22;
  }
  if (v7)
  {
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(MEMORY[0x1E4F28C58], v8, 3, v4, @"Cannot add objects from other data stores.");
  }
  else
  {
    if (objc_msgSend_isAllowedToInsertObject_(self, v8, (uint64_t)v4))
    {
LABEL_9:
      uint64_t v14 = objc_msgSend_objectID(v4, v11, v12);
      id v16 = objc_msgSend_objectForKey_(self->_deletedObjectsByID, v15, (uint64_t)v14);
      if (v16)
      {
        id v19 = v16;
        id v10 = v19;
      }
      else
      {
        int v20 = objc_msgSend_graph(self, v17, v18);
        objc_msgSend_vertexWithVertexID_(v20, v21, (uint64_t)v14);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = v22;
        if (!v22 || v22 == v4)
        {
          id v29 = objc_msgSend_parentObjectID(v4, v23, v24);
          if (v29
            && (objc_msgSend_vertexWithVertexID_(v20, v28, (uint64_t)v29),
                (long long v30 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            long long v31 = v30;
            objc_msgSend_addChild_(v30, v28, (uint64_t)v4);
          }
          else
          {
            objc_msgSend_addVertex_(v20, v28, (uint64_t)v4);
          }
          objc_msgSend_setDataStore_(v4, v32, (uint64_t)self);
          id v10 = v4;
        }
        else
        {
          uint64_t isModified = objc_msgSend_isModified(v22, v23, v24);
          objc_msgSend_mergeWithObject_(v19, v26, (uint64_t)v4);
          objc_msgSend_setModified_(v19, v27, isModified);
          id v10 = v19;
        }
      }
      goto LABEL_21;
    }
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(MEMORY[0x1E4F28C58], v11, 3, v4, @"Not allowed to add objects of this kind to data store.");
  uint64_t v13 = };
  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = v13;
  objc_msgSend_cls_log_(v13, v11, CLSLogDefault);
  id v10 = 0;
LABEL_21:

LABEL_22:

  return v10;
}

- (void)removeObjectWithObjectID:(id)a3 class:(Class)a4
{
  id v11 = a3;
  uint64_t v8 = objc_msgSend_objectWithObjectID_(self, v6, (uint64_t)v11);
  if (!v8)
  {
    id v9 = [a4 alloc];
    uint64_t v8 = objc_msgSend_initWithDeletedObjectID_(v9, v10, (uint64_t)v11);
  }
  objc_msgSend_removeObject_(self, v7, (uint64_t)v8);
}

- (void)removeObject:(id)a3
{
  id v9 = a3;
  id v7 = objc_msgSend_parent(v9, v4, v5);
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_markObjectAsDeleted_(self, v8, (uint64_t)v7);
    }
    else {
      objc_msgSend_removeChild_(v7, v8, (uint64_t)v9);
    }
  }
  else
  {
    objc_msgSend_markObjectAsDeleted_(self, v6, (uint64_t)v9);
  }
}

- (void)markObjectAsDeleted:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  deletedObjectsByID = self->_deletedObjectsByID;
  id v10 = objc_msgSend_objectID(v4, v8, v9);
  objc_msgSend_setObject_forKey_(deletedObjectsByID, v11, (uint64_t)v4, v10);

  id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_msgSend_initWithObjects_(v12, v13, (uint64_t)v4, 0);
  id v17 = objc_msgSend_graph(self, v15, v16);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1DC652618;
  v40[3] = &unk_1E6C96990;
  id v18 = v14;
  id v41 = v18;
  objc_msgSend_traverseStartingAtVertex_enumerationBlock_(v17, v19, (uint64_t)v4, v40);

  objc_msgSend_setDeleted_(v4, v20, 1);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v18;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v36, v42, 16);
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * v26);
        uint64_t v28 = (void *)MEMORY[0x1E01A0360]();
        long long v31 = objc_msgSend_graph(self, v29, v30);
        objc_msgSend_removeVertex_(v31, v32, v27);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v33, (uint64_t)&v36, v42, 16);
    }
    while (v24);
  }

  objc_msgSend_unlock(self, v34, v35);
}

- (BOOL)isRemovedObject:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  deletedObjectsByID = self->_deletedObjectsByID;
  id v10 = objc_msgSend_objectID(v4, v8, v9);

  id v12 = objc_msgSend_objectForKey_(deletedObjectsByID, v11, (uint64_t)v10);
  LOBYTE(v4) = v12 != 0;

  objc_msgSend_unlock(self, v13, v14);
  return (char)v4;
}

- (void)_generatePartialTimeIntervalsForRunningActivities
{
  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_runningActivity(self, v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8) {
    objc_msgSend__generatePartialTimeOnSave(v8, v6, v7);
  }
  objc_msgSend_unlock(self, v6, v7);
}

+ (id)handoutGraphFromHandout:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_msgSend_addObject_(v4, v5, (uint64_t)v3);
  id v8 = objc_msgSend_recipients(v3, v6, v7);
  objc_msgSend_addObjectsFromArray_(v4, v9, (uint64_t)v8);

  id v12 = objc_msgSend_assets(v3, v10, v11);
  objc_msgSend_addObjectsFromArray_(v4, v13, (uint64_t)v12);

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  objc_msgSend_attachments(v3, v14, v15);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v91, v97, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v92;
    id v21 = &selRef_filenameForCKContentStoreCache;
    uint64_t v74 = *(void *)v92;
    id v75 = v3;
    do
    {
      uint64_t v22 = 0;
      uint64_t v76 = v19;
      do
      {
        if (*(void *)v92 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v91 + 1) + 8 * v22);
        objc_msgSend_addObject_(v4, v18, (uint64_t)v23);
        if (objc_msgSend_type(v23, v24, v25) == 5)
        {
          uint64_t v28 = objc_msgSend_survey(v23, v26, v27);

          if (v28)
          {
            id v79 = v23;
            uint64_t v80 = v22;
            id v29 = objc_msgSend_survey(v23, v26, v27);
            objc_msgSend_addObject_(v4, v30, (uint64_t)v29);
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            v78 = v29;
            long long v33 = objc_msgSend_surveySteps(v29, v31, v32);
            uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v87, v96, 16);
            if (v35)
            {
              uint64_t v37 = v35;
              uint64_t v38 = *(void *)v88;
              uint64_t v81 = *(void *)v88;
              v82 = v33;
              do
              {
                for (uint64_t i = 0; i != v37; ++i)
                {
                  if (*(void *)v88 != v38) {
                    objc_enumerationMutation(v33);
                  }
                  long long v40 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  objc_msgSend_addObject_(v4, v36, (uint64_t)v40);
                  if (objc_msgSend_conformsToProtocol_(v40, v41, (uint64_t)v21[339]))
                  {
                    id v42 = v40;
                    long long v47 = objc_msgSend_answerFormat(v42, v43, v44);
                    if (v47)
                    {
                      objc_msgSend_addObject_(v4, v45, (uint64_t)v47);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v48 = objc_msgSend_answerChoiceItems(v47, v45, v46);
                        objc_msgSend_addObjectsFromArray_(v4, v49, (uint64_t)v48);

                        long long v85 = 0u;
                        long long v86 = 0u;
                        long long v83 = 0u;
                        long long v84 = 0u;
                        id v52 = objc_msgSend_answerChoiceItems(v47, v50, v51);
                        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v83, v95, 16);
                        if (v54)
                        {
                          uint64_t v57 = v54;
                          uint64_t v58 = *(void *)v84;
                          do
                          {
                            for (uint64_t j = 0; j != v57; ++j)
                            {
                              if (*(void *)v84 != v58) {
                                objc_enumerationMutation(v52);
                              }
                              id v60 = objc_msgSend_assets(*(void **)(*((void *)&v83 + 1) + 8 * j), v55, v56);
                              objc_msgSend_addObjectsFromArray_(v4, v61, (uint64_t)v60);
                            }
                            uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v83, v95, 16);
                          }
                          while (v57);
                        }

                        id v21 = &selRef_filenameForCKContentStoreCache;
                        uint64_t v38 = v81;
                        long long v33 = v82;
                      }
                    }
                    id v62 = objc_msgSend_assets(v42, v45, v46);
                    objc_msgSend_addObjectsFromArray_(v4, v63, (uint64_t)v62);
                  }
                }
                uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v87, v96, 16);
              }
              while (v37);
            }

            uint64_t v20 = v74;
            id v3 = v75;
            uint64_t v19 = v76;
            uint64_t v23 = v79;
            uint64_t v22 = v80;
          }
        }
        uint64_t v64 = objc_msgSend_assets(v23, v26, v27);
        objc_msgSend_addObjectsFromArray_(v4, v65, (uint64_t)v64);

        ++v22;
      }
      while (v22 != v19);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v91, v97, 16);
    }
    while (v19);
  }

  v68 = objc_msgSend_schedule(v3, v66, v67);

  if (v68)
  {
    v71 = objc_msgSend_schedule(v3, v69, v70);
    objc_msgSend_addObject_(v4, v72, (uint64_t)v71);
  }

  return v4;
}

- (void)removeContextWithObjectID:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_length(v8, v4, v5))
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_removeObjectWithObjectID_class_(self, v7, (uint64_t)v8, v6);
  }
}

- (void)removeActivityWithObjectID:(id)a3
{
  id v8 = a3;
  if (objc_msgSend_length(v8, v4, v5))
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_removeObjectWithObjectID_class_(self, v7, (uint64_t)v8, v6);
  }
}

- (void)contextsMatchingIdentifierPath:(NSArray *)identifierPath completion:(void *)completion
{
  uint64_t v6 = identifierPath;
  uint64_t v7 = completion;
  id v10 = objc_msgSend_mainAppContext(self, v8, v9);
  uint64_t v15 = objc_msgSend_identifier(v10, v11, v12);
  if (!v15)
  {
    uint64_t v30 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC652D98;
    block[3] = &unk_1E6C95B58;
    id v32 = v7;
    dispatch_async(v30, block);

    goto LABEL_8;
  }
  uint64_t v16 = objc_msgSend_firstObject(v6, v13, v14);
  uint64_t v19 = objc_msgSend_firstObject(v6, v17, v18);
  if (!v19) {
    goto LABEL_5;
  }
  uint64_t v22 = (void *)v19;
  uint64_t v23 = objc_msgSend_firstObject(v6, v20, v21);
  int isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)v15);

  if (isEqualToString)
  {
    uint64_t v28 = objc_msgSend_count(v6, v26, v27);
    objc_msgSend_subarrayWithRange_(v6, v29, 1, v28 - 1);
    uint64_t v16 = v6;
    uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  }
  objc_msgSend_contextsMatchingIdentifierPath_parentContext_completion_(self, v26, (uint64_t)v6, v10, v7);
LABEL_8:
}

- (void)contextsMatchingIdentifierPath:(id)a3 parentContext:(id)a4 completion:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v8 = a4;
  id v9 = a5;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = sub_1DC653224;
  v72[3] = &unk_1E6C969B8;
  id v53 = v9;
  id v73 = v53;
  id v10 = (void (**)(void, void, void))MEMORY[0x1E01A05F0](v72);
  if (objc_msgSend_count(v54, v11, v12))
  {
    objc_msgSend_lock(self, v13, v14);
    uint64_t v15 = objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v16 = v54;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v68, v74, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v69 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v23 = objc_msgSend_childContextWithIdentifier_(v8, v18, *(void *)(*((void *)&v68 + 1) + 8 * i));
          if (v23)
          {
            objc_msgSend_addObject_(v15, v22, (uint64_t)v23);
            id v24 = v23;

            id v8 = v24;
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v68, v74, 16);
      }
      while (v19);
    }

    objc_msgSend_unlock(self, v25, v26);
    uint64_t v29 = objc_msgSend_count(v15, v27, v28);
    if (v29 == objc_msgSend_count(v16, v30, v31))
    {
      ((void (**)(void, void *, void))v10)[2](v10, v15, 0);
    }
    else
    {
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = sub_1DC653328;
      v66[3] = &unk_1E6C95CF8;
      id v32 = v10;
      id v67 = v32;
      long long v34 = objc_msgSend_dataServer_(self, v33, (uint64_t)v66);
      uint64_t v39 = objc_msgSend_count(v15, v35, v36);
      if (v39)
      {
        uint64_t v40 = objc_msgSend_count(v16, v37, v38);
        objc_msgSend_subarrayWithRange_(v16, v41, v39, v40 - v39);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v42 = v16;
      }
      uint64_t v43 = v42;
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x3042000000;
      v64[3] = sub_1DC6511D4;
      v64[4] = sub_1DC6511E0;
      objc_initWeak(&v65, self);
      uint64_t v46 = objc_msgSend_delegate(self, v44, v45);
      uint64_t v49 = objc_msgSend_objectID(v8, v47, v48);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = sub_1DC653340;
      v55[3] = &unk_1E6C96A08;
      v63 = v64;
      id v62 = v32;
      id v56 = v8;
      id v50 = v43;
      id v57 = v50;
      id v58 = v15;
      v59 = self;
      id v60 = v16;
      id v51 = v46;
      id v61 = v51;
      objc_msgSend_remote_contextsMatchingIdentifierPath_parentContextID_completion_(v34, v52, (uint64_t)v50, v49, v55);

      _Block_object_dispose(v64, 8);
      objc_destroyWeak(&v65);
    }
  }
  else
  {
    v10[2](v10, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (id)dataServer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_endpointConnection(self, v5, v6);
  id v9 = objc_msgSend_dataServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)syncDataServer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_endpointConnection(self, v5, v6);
  id v9 = objc_msgSend_syncDataServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)utilityServer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_endpointConnection(self, v5, v6);
  id v9 = objc_msgSend_utilityServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)syncUtilityServer:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_endpointConnection(self, v5, v6);
  id v9 = objc_msgSend_syncUtilityServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (CLSContext)activeContext
{
  id v4 = objc_msgSend_cachedMainAppContext(self, a2, v2);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1DC64DC24;
  uint64_t v20 = sub_1DC64DC34;
  id v21 = 0;
  objc_msgSend_lock(self, v5, v6);
  id v9 = objc_msgSend_graph(self, v7, v8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC653EBC;
  v15[3] = &unk_1E6C96A30;
  void v15[4] = &v16;
  objc_msgSend_traverseStartingAtVertex_enumerationBlock_(v9, v10, (uint64_t)v4, v15);

  objc_msgSend_unlock(self, v11, v12);
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return (CLSContext *)v13;
}

- (CLSActivity)runningActivity
{
  id v3 = objc_msgSend_runningActivities(self, a2, v2);
  uint64_t v6 = objc_msgSend_lastObject(v3, v4, v5);

  return (CLSActivity *)v6;
}

- (id)runningActivities
{
  objc_msgSend_lock(self, a2, v2);
  uint64_t v6 = objc_msgSend_copy(self->_runningActivities, v4, v5);
  objc_msgSend_unlock(self, v7, v8);
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  return v10;
}

- (void)addRunningActivitiesObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v17 = v4;
    objc_msgSend_lock(self, v5, v6);
    if ((objc_msgSend_containsObject_(self->_runningActivities, v7, (uint64_t)v17) & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v8, @"runningActivity");
      objc_msgSend_willChangeValueForKey_(self, v10, @"runningActivities");
      runningActivities = self->_runningActivities;
      if (!runningActivities)
      {
        id v13 = (NSMutableArray *)objc_opt_new();
        uint64_t v14 = self->_runningActivities;
        self->_runningActivities = v13;

        runningActivities = self->_runningActivities;
      }
      objc_msgSend_addObject_(runningActivities, v11, (uint64_t)v17);
      objc_msgSend_didChangeValueForKey_(self, v15, @"runningActivities");
      objc_msgSend_didChangeValueForKey_(self, v16, @"runningActivity");
    }
    objc_msgSend_unlock(self, v8, v9);
    id v4 = v17;
  }
}

- (void)removeRunningActivitiesObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    objc_msgSend_lock(self, v5, v6);
    if (objc_msgSend_containsObject_(self->_runningActivities, v7, (uint64_t)v14))
    {
      objc_msgSend_willChangeValueForKey_(self, v8, @"runningActivity");
      objc_msgSend_willChangeValueForKey_(self, v10, @"runningActivities");
      objc_msgSend_removeObject_(self->_runningActivities, v11, (uint64_t)v14);
      objc_msgSend_didChangeValueForKey_(self, v12, @"runningActivities");
      objc_msgSend_didChangeValueForKey_(self, v13, @"runningActivity");
    }
    objc_msgSend_unlock(self, v8, v9);
    id v4 = v14;
  }
}

- (void)applicationWillResignActive:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  id v4 = CLSLogApp;
  if (os_log_type_enabled((os_log_t)CLSLogApp, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_INFO, "App will resign active.", buf, 2u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend_runningActivities(self, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v16, v21, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend_isBackgroudTimeTrackingEnabled(v15, v10, v11) & 1) == 0) {
          objc_msgSend_pause(v15, v10, v11);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v16, v21, 16);
    }
    while (v12);
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  id v4 = CLSLogApp;
  if (os_log_type_enabled((os_log_t)CLSLogApp, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_INFO, "App did become active.", buf, 2u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend_runningActivities(self, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v16, v21, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend_isBackgroudTimeTrackingEnabled(v15, v10, v11) & 1) == 0) {
          objc_msgSend_resume(v15, v10, v11);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v16, v21, 16);
    }
    while (v12);
  }
}

- (BOOL)isAppClient
{
  id v3 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, v2);
  uint64_t v6 = objc_msgSend_bundlePath(v3, v4, v5);

  if (v6)
  {
    uint64_t v9 = objc_msgSend_pathExtension(v6, v7, v8);
    uint64_t v12 = objc_msgSend_lowercaseString(v9, v10, v11);

    if (objc_msgSend_isEqualToString_(v12, v13, @"app")) {
      char isEqualToString = 1;
    }
    else {
      char isEqualToString = objc_msgSend_isEqualToString_(v12, v14, @"appex");
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (void)triggerProgressTransparencyMessageForAttachmentID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isAppClient(self, v5, v6))
  {
    if (objc_msgSend_length(v4, v7, v8))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_1DC654614;
      v11[3] = &unk_1E6C96A58;
      void v11[4] = self;
      objc_msgSend_fetchTransparencyMessageInfoForAttachmentID_withCompletion_(self, v9, (uint64_t)v4, v11);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1DC654628;
      v10[3] = &unk_1E6C96A58;
      v10[4] = self;
      objc_msgSend_fetchTransparencyMessageInfoWithCompletion_(self, v9, (uint64_t)v10);
    }
  }
}

- (void)presentTransparencyMessageInfo:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"showModal");
  int v9 = objc_msgSend_BOOLValue(v6, v7, v8);

  if (v9)
  {
    id v11 = sub_1DC6548B0();
    id v14 = objc_msgSend_shared(v11, v12, v13);
    objc_msgSend_showPrivacyModalViewWithInfo_(v14, v15, (uint64_t)v4);
  }
  else
  {
    id v14 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"classNames");
    long long v17 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"localizedTitle");
    long long v19 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"localizedMessageFormat");
    if (objc_msgSend_count(v14, v20, v21) && v17 && v19)
    {
      uint64_t v23 = objc_msgSend_localizedStringByJoiningStrings_(MEMORY[0x1E4F28DF8], v22, (uint64_t)v14);
      id v24 = (void *)MEMORY[0x1E01A0360]();
      uint64_t v27 = objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E4F223F8], v25, v26);
      uint64_t v30 = objc_msgSend_localizedName(v27, v28, v29);

      id v38 = 0;
      id v32 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v31, (uint64_t)v19, @"%@ %@", &v38, v30, v23);
      id v34 = v38;
      if (v34)
      {
        if (qword_1EB5D4D10 != -1) {
          dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
        }
        uint64_t v35 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v40 = v19;
          __int16 v41 = 2112;
          id v42 = v34;
          _os_log_error_impl(&dword_1DC60F000, v35, OS_LOG_TYPE_ERROR, "Failed to validate messageFormat: '%@', error: %@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v36 = objc_msgSend_dataServer_(self, v33, (uint64_t)&unk_1F37A18D0);
        objc_msgSend_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_(v36, v37, (uint64_t)v17, v32, 0);
      }
    }
  }
}

- (void)presentTransparencyMessageForHandoutAssignedItemInfo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"showModal");
  int v9 = objc_msgSend_BOOLValue(v6, v7, v8);

  if (v9)
  {
    id v11 = sub_1DC6548B0();
    objc_msgSend_shared(v11, v12, v13);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_showPrivacyModalViewWithInfo_(v30, v14, (uint64_t)v4);
  }
  else
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"classNames");
    long long v17 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"attachmentTitle");
    long long v19 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"localizedTitle");
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v4, v20, @"localizedMessageFormat");

    if (v15 && v17 && v19 && v21)
    {
      id v31 = 0;
      uint64_t v23 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v22, (uint64_t)v21, @"%@ %@", &v31, v17, v15);
      id v24 = v31;
      if (v24)
      {
        uint64_t v26 = v24;
        if (qword_1EB5D4D10 != -1) {
          dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
        }
        uint64_t v27 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          long long v33 = v21;
          __int16 v34 = 2112;
          uint64_t v35 = v26;
          _os_log_error_impl(&dword_1DC60F000, v27, OS_LOG_TYPE_ERROR, "Failed to validate messageFormat: '%@', error: %@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v28 = objc_msgSend_dataServer_(self, v25, (uint64_t)&unk_1F37A1190);
        objc_msgSend_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_(v28, v29, (uint64_t)v19, v23, 0);
      }
    }
  }
}

- (void)fetchTransparencyMessageInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC654E6C;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  uint64_t v7 = objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_fetchTransparencyMessageInfoWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)fetchTransparencyMessageInfoForAttachmentID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC654F48;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_fetchTransparencyMessageInfoForAttachmentID_withCompletion_(v10, v11, (uint64_t)v8, v7);
}

- (void)shouldSyncTeacherBrowsedContextsWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC655008;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_shouldSyncTeacherBrowsedContextsWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)setShouldSyncTeacherBrowsedContexts:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_msgSend_dataServer_(self, v7, (uint64_t)v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setShouldSyncTeacherBrowsedContexts_completion_(v9, v8, v4, v6);
}

- (void)developerModeChanged:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  BOOL v4 = CLSLogApp;
  if (os_log_type_enabled((os_log_t)CLSLogApp, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_INFO, "Developer mode changed;", buf, 2u);
  }
  objc_msgSend_reset(self, v5, v6);
  objc_msgSend_lock(self, v7, v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = objc_msgSend_objectEnumerator(self->_dataObservers, v9, v10, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v26, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend_reset(*(void **)(*((void *)&v21 + 1) + 8 * i), v14, v15);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v26, 16);
    }
    while (v16);
  }

  objc_msgSend_unlock(self, v19, v20);
}

- (void)reset
{
  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_removeAllObjects(self->_deletedObjectsByID, v4, v5);
  objc_msgSend_removeAllObjects(self->_objectGenerationsByID, v6, v7);
  uint64_t v10 = objc_msgSend_graph(self, v8, v9);
  objc_msgSend_reset(v10, v11, v12);

  cachedCurrentUser = self->_cachedCurrentUser;
  self->_cachedCurrentUser = 0;

  mainAppContext = self->_mainAppContext;
  if (mainAppContext)
  {
    objc_msgSend_setDataStore_(mainAppContext, v14, 0);
    id v17 = (id)objc_msgSend__addObject_(self, v16, (uint64_t)self->_mainAppContext);
    objc_msgSend_setDataStore_(self->_mainAppContext, v18, (uint64_t)self);
  }
  long long v19 = objc_opt_class();
  if (!objc_msgSend_isDashboardApp(v19, v20, v21)
    || (long long v24 = objc_opt_class(), objc_msgSend_isPDTool(v24, v25, v26)))
  {
    objc_msgSend__createMainAppContext(self, v22, v23);
  }
  objc_msgSend_date(MEMORY[0x1E4F1C9C8], v22, v23);
  uint64_t v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastPruneDate = self->_lastPruneDate;
  self->_lastPruneDate = v27;

  objc_msgSend_unlock(self, v29, v30);

  MEMORY[0x1F4181798](self, sel_faultMainAppContext, v31);
}

+ (CLSCurrentUser)currentUser
{
  if (CurrentProcessNameMatches(@"progressd"))
  {
    Class v4 = objc_lookUpClass("PDDaemon");
    uint64_t v7 = objc_msgSend_shared(v4, v5, v6);
    objc_msgSend(v7, NSSelectorFromString(&cfstr_Currentuser.isa));
  }
  else
  {
    uint64_t v7 = objc_msgSend_shared(CLSDataStore, v2, v3);
    objc_msgSend_currentUser(v7, v8, v9);
  uint64_t v10 = };

  return (CLSCurrentUser *)v10;
}

- (id)currentUser
{
  if (objc_msgSend_isDashboardAPIEnabled(self, a2, v2))
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = sub_1DC64DC24;
    id v17 = sub_1DC64DC34;
    objc_msgSend_cachedCurrentUser(self, v4, v5);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (void *)v14[5];
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      uint64_t v9 = objc_msgSend_syncDataServer_(self, v6, 0);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = sub_1DC6554F0;
      v12[3] = &unk_1E6C96A80;
      void v12[4] = &v13;
      objc_msgSend_currentUserWithServer_completion_(self, v10, (uint64_t)v9, v12);
      id v8 = (id)v14[5];
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)currentUserWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isDashboardAPIEnabled(self, v5, v6))
  {
    uint64_t v9 = objc_msgSend_cachedCurrentUser(self, v7, v8);
    uint64_t v12 = objc_msgSend_person(v9, v10, v11);

    if (v12)
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v13 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC60F000, v13, OS_LOG_TYPE_INFO, "Called CLSDataStore currentUserWithCompletion, localCurrentUser.person is not nil returning cached localCurrentUser", buf, 2u);
      }
      qos_class_t v14 = qos_class_self();
      uint64_t v15 = dispatch_get_global_queue(v14, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1DC655824;
      block[3] = &unk_1E6C95DB8;
      uint64_t v16 = &v25;
      id v25 = v4;
      id v24 = v9;
      dispatch_async(v15, block);

      id v17 = v24;
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1DC65583C;
      v21[3] = &unk_1E6C95CF8;
      uint64_t v16 = &v22;
      id v18 = v4;
      id v22 = v18;
      id v17 = objc_msgSend_dataServer_(self, v19, (uint64_t)v21);
      objc_msgSend_currentUserWithServer_completion_(self, v20, (uint64_t)v17, v18);
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v7, 4, @"Not Authorized");
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

- (void)currentUserWithServer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC60F000, v8, OS_LOG_TYPE_INFO, "Calling CLSDataStore currentUserWithServer", buf, 2u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC6559B8;
  v11[3] = &unk_1E6C96AA8;
  id v9 = v7;
  id v12 = v9;
  objc_copyWeak(&v13, &location);
  objc_msgSend_remote_currentUserWithCompletion_(v6, v10, (uint64_t)v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (void)getCurrentUseriCloudQuotaInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isDashboardAPIEnabled(self, v5, v6))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1DC655CA4;
    v15[3] = &unk_1E6C95CF8;
    id v8 = v4;
    id v16 = v8;
    uint64_t v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v15);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1DC655CC4;
    v13[3] = &unk_1E6C96AD0;
    id v14 = v8;
    objc_msgSend_remote_getCurrentUseriCloudQuotaInfoWithCompletion_(v10, v11, (uint64_t)v13);
  }
  else
  {
    id v12 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v7, 4, @"Not Authorized");
    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v12);
  }
}

- (void)registerDataObserver:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_dataStore(v4, v5, v6);
  id v7 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v7;
  if (v7 != self)
  {
    if (v7)
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v11 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v4;
        _os_log_impl(&dword_1DC60F000, v11, OS_LOG_TYPE_INFO, "Refusing to register observer belonging to different data store; %@",
          buf,
          0xCu);
      }
    }
    else
    {
      objc_msgSend_lock(self, v8, v9);
      objc_msgSend_addObject_(self->_dataObservers, v12, (uint64_t)v4);
      objc_msgSend_setDataStore_(v4, v13, (uint64_t)self);
      objc_msgSend_unlock(self, v14, v15);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1DC655ED8;
      v30[3] = &unk_1E6C96658;
      id v16 = v4;
      id v31 = v16;
      id v17 = (void *)MEMORY[0x1E01A05F0](v30);
      long long v19 = objc_msgSend_dataServer_(self, v18, (uint64_t)v17);
      id v22 = objc_msgSend_observerID(v16, v20, v21);
      id v25 = objc_msgSend_querySpec(v16, v23, v24);
      uint64_t v28 = objc_msgSend_changeTag(v16, v26, v27);
      objc_msgSend_remote_registerDataObserver_withID_querySpecification_oldChangeTag_completion_(v19, v29, (uint64_t)v16, v22, v25, v28, v17);
    }
  }
}

- (void)deregisterDataObserver:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_dataObservers;
  objc_msgSend_dataStore(v4, v6, v7);
  uint64_t v10 = (CLSDataStore *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    uint64_t v11 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_1DC60F000, v11, OS_LOG_TYPE_INFO, "Refusing to deregister non registered observer: %@;",
        buf,
        0xCu);
    }
  }
  if (v10 == self)
  {
    objc_msgSend_lock(self, v8, v9);
    objc_msgSend_setDataStore_(v4, v13, 0);
    objc_msgSend_removeObject_(v5, v14, (uint64_t)v4);
    objc_msgSend_unlock(self, v15, v16);
    long long v19 = objc_msgSend_observerID(v4, v17, v18);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1DC6562FC;
    v26[3] = &unk_1E6C96658;
    id v20 = v4;
    id v27 = v20;
    id v22 = objc_msgSend_dataServer_(self, v21, (uint64_t)v26);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1DC6563EC;
    v24[3] = &unk_1E6C96348;
    id v25 = v20;
    objc_msgSend_remote_deregisterDataObserverWithID_completion_(v22, v23, (uint64_t)v19, v24);
  }
  else
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    id v12 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_1DC60F000, v12, OS_LOG_TYPE_INFO, "Refusing to deregister observer belonging to different data store; %@",
        buf,
        0xCu);
    }
  }
}

- (void)pruneDeletedObjectsWithCompletion:(id)a3
{
  id v4 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1DC656678;
  v20[3] = &unk_1E6C95CF8;
  id v5 = v4;
  id v21 = v5;
  uint64_t v7 = objc_msgSend_dataServer_(self, v6, (uint64_t)v20);
  objc_msgSend_lock(self, v8, v9);
  uint64_t v10 = self->_lastPruneDate;
  objc_msgSend_unlock(self, v11, v12);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3042000000;
  v18[3] = sub_1DC6511D4;
  v18[4] = sub_1DC6511E0;
  objc_initWeak(&v19, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC656688;
  v15[3] = &unk_1E6C96AF8;
  id v17 = v18;
  id v13 = v5;
  id v16 = v13;
  objc_msgSend_remote_fetchDeletedObjectIDsNewerThanDate_completion_(v7, v14, (uint64_t)v10, v15);

  _Block_object_dispose(v18, 8);
  objc_destroyWeak(&v19);
}

- (void)syncFetchWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC656934;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  uint64_t v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_syncFetchWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC6569F4;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  uint64_t v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_syncBootstrapWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)fetchReportsWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC656AD0;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_fetchReportsWithPredicate_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)featureIsEnabled:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC656BA0;
  v11[3] = &unk_1E6C95CF8;
  id v12 = v6;
  id v7 = v6;
  uint64_t v9 = objc_msgSend_utilityServer_(self, v8, (uint64_t)v11);
  objc_msgSend_remote_featureIsEnabled_completion_(v9, v10, v4, v7);
}

- (void)triggerUserNotificationReviewDueHandoutsWithReferenceDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC656C84;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v10 = v6;
  objc_msgSend_remote_triggerUserNotificationReviewDueHandoutsWithReferenceDate_completion_(v9, v11, (uint64_t)v7, v12);
}

- (void)triggerUserNotificationHandoutPastDueSummaryWithReferenceDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC656D60;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v10 = v6;
  objc_msgSend_remote_triggerUserNotificationHandoutPastDueSummaryWithReferenceDate_completion_(v9, v11, (uint64_t)v7, v12);
}

- (void)triggerUserNotificationHandoutDueSoonWithReferenceDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC656E3C;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v10 = v6;
  objc_msgSend_remote_triggerUserNotificationHandoutDueSoonWithReferenceDate_completion_(v9, v11, (uint64_t)v7, v12);
}

- (void)triggerUserNotificationRevisionRequested:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC656F18;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v10 = v6;
  objc_msgSend_remote_triggerUserNotificationRevisionRequestedWithAttachmentID_completion_(v9, v11, (uint64_t)v7, v12);
}

- (void)triggerUserNotificationRevisedSubmissionWithAttachmentID:(id)a3 studentName:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend_dataServer_(self, v11, (uint64_t)v8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC657008;
  v15[3] = &unk_1E6C95CF8;
  id v16 = v8;
  id v13 = v8;
  objc_msgSend_remote_triggerUserNotificationRevisedSubmissionWithAttachmentID_studentName_completion_(v12, v14, (uint64_t)v10, v9, v15);
}

- (void)triggerUserNotificationHandoutAssigned:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend_dataServer_(self, v8, (uint64_t)v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC6570E4;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v10 = v6;
  objc_msgSend_remote_triggerUserNotificationHandoutAssignedWithHandoutID_completion_(v9, v11, (uint64_t)v7, v12);
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DC6571B4;
  v10[3] = &unk_1E6C95CF8;
  id v11 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E01A05F0](v10);
  id v8 = objc_msgSend_utilityServer_(self, v7, (uint64_t)v6);
  objc_msgSend_remote_renewCredentialsWithCompletion_(v8, v9, (uint64_t)v5);
}

+ (id)handoutSubgraphContainingAsset:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_parent(v3, v4, v5);
  id v10 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v7, (uint64_t)v3);
  if (v6)
  {
    do
    {
      objc_msgSend_insertObject_atIndex_(v10, v8, (uint64_t)v6, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v13 = objc_msgSend_parent(v6, v11, v12);

      id v6 = (void *)v13;
    }
    while (v13);
  }
  id v14 = objc_msgSend_copy(v10, v8, v9);

  return v14;
}

- (void)setMainAppContext:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (CLSEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (CLSGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainAppContext, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastPruneDate, 0);
  objc_storeStrong((id *)&self->_runningActivities, 0);
  objc_storeStrong((id *)&self->_handoutAssignedItemsAuthTree, 0);
  objc_storeStrong((id *)&self->_authTree, 0);
  objc_storeStrong((id *)&self->_pendingSaves, 0);
  objc_storeStrong((id *)&self->_cachedCurrentUser, 0);
  objc_storeStrong((id *)&self->_objectGenerationsByID, 0);
  objc_storeStrong((id *)&self->_deletedObjectsByID, 0);

  objc_storeStrong((id *)&self->_dataObservers, 0);
}

- (void)fetchAssignedItemFor:(id)a3 completion:(id)a4
{
  v32[2] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a4;
  if (!v6 || !objc_msgSend_length(v6, v7, v8))
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    id v16 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DC60F000, v16, OS_LOG_TYPE_DEBUG, "CLSDataStore -fetchAssignedItemFor, invalid handout attachment id", buf, 2u);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend_isAppClient(self, v10, v11) & 1) == 0)
  {
    uint64_t v12 = objc_opt_class();
    if ((objc_msgSend_isPDTool(v12, v13, v14) & 1) == 0)
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      id v19 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        id v20 = v19;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = objc_msgSend_isAppClient(self, v21, v22);
        _os_log_debug_impl(&dword_1DC60F000, v20, OS_LOG_TYPE_DEBUG, "CLSDataStore fetchAssignedItemFor: is not an app or app extension client: %d", buf, 8u);
      }
LABEL_10:
      uint64_t v18 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v17, 4, @"Not Authorized");
      v9[2](v9, 0, v18);

      goto LABEL_11;
    }
  }
  *(void *)buf = 0;
  uint64_t v28 = buf;
  uint64_t v29 = 0x3042000000;
  uint64_t v30 = sub_1DC6511D4;
  id v31 = sub_1DC6511E0;
  objc_initWeak(v32, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1DC657710;
  v23[3] = &unk_1E6C96B98;
  uint64_t v26 = buf;
  id v25 = v9;
  id v24 = v6;
  objc_msgSend_refreshAuthTreeForAttachment_withCompletion_(self, v15, (uint64_t)v24, v23);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v32);
LABEL_11:
}

- (void)_validateAndCreateHandoutAssignedItemFor:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_debug_impl(&dword_1DC60F000, v8, OS_LOG_TYPE_DEBUG, "CLSDataStore _validateAndCreateHandoutAssignedItemFor called for handoutAttachmentID: %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC657E34;
  v13[3] = &unk_1E6C95CF8;
  id v14 = v7;
  id v9 = v7;
  uint64_t v11 = objc_msgSend_dataServer_(self, v10, (uint64_t)v13);
  objc_msgSend_remote_validateAndCreateHandoutAssignedItem_withCompletion_(v11, v12, (uint64_t)v6, v9);
}

- (void)addHandout:(id)a3
{
  id v3 = (id)objc_msgSend_addObject_(self, a2, (uint64_t)a3);
}

- (void)publishHandout:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = a4;
  objc_msgSend_handoutGraphFromHandout_(CLSDataStore, v6, (uint64_t)v5);
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  long long v47 = sub_1DC64DC24;
  uint64_t v48 = sub_1DC64DC34;
  id v49 = 0;
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v36, v50, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v12;
          dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1F37A18F0);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = sub_1DC658244;
          v31[3] = &unk_1E6C96BC0;
          id v32 = v7;
          uint64_t v34 = &v40;
          uint64_t v35 = &v44;
          id v16 = v15;
          id v33 = v16;
          objc_msgSend_createShareIfNeeded_(v14, v17, (uint64_t)v31);
          dispatch_block_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v36, v50, 16);
    }
    while (v9);
  }

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1DC6582FC;
  v29[3] = &unk_1E6C96BE8;
  id v18 = v26;
  id v30 = v18;
  id v19 = (void *)MEMORY[0x1E01A05F0](v29);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1DC658424;
  v27[3] = &unk_1E6C95CF8;
  id v20 = v19;
  id v28 = v20;
  uint64_t v22 = objc_msgSend_dataServer_(self, v21, (uint64_t)v27);
  id v24 = v22;
  if (*((unsigned char *)v41 + 24)) {
    (*((void (**)(id, void, uint64_t))v20 + 2))(v20, 0, v45[5]);
  }
  else {
    objc_msgSend_remote_publishHandoutGraph_completion_(v22, v23, (uint64_t)v7, v20);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

- (void)repairHandoutAttachments:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = sub_1DC65862C;
  v25[3] = &unk_1E6C96BE8;
  id v7 = v6;
  id v26 = v7;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E01A05F0](v25);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1DC658754;
  v23[3] = &unk_1E6C95CF8;
  id v10 = v9;
  id v24 = v10;
  uint64_t v12 = objc_msgSend_dataServer_(self, v11, (uint64_t)v23);
  id v14 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v13, @"type = %d OR type = %d", 2, 4);
  id v16 = objc_msgSend_filteredArrayUsingPredicate_(v8, v15, (uint64_t)v14);

  if (objc_msgSend_count(v16, v17, v18))
  {
    objc_msgSend_remote_repairHandoutAttachments_completion_(v12, v19, (uint64_t)v16, v10);
  }
  else
  {
    id v20 = clsNotificationQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1DC65876C;
    block[3] = &unk_1E6C95B58;
    id v22 = v7;
    dispatch_async(v20, block);
  }
}

- (void)handoutAttachmentForDocumentURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_isDashboardAPIEnabled(self, v8, v9))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1DC6588DC;
    v13[3] = &unk_1E6C96C10;
    id v14 = v7;
    objc_msgSend__fetchHandoutAttachmentForDocumentURL_completion_(self, v11, (uint64_t)v6, v13);
  }
  else
  {
    uint64_t v12 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v10, 4, @"Use of API not allowed.");
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)addCollection:(id)a3
{
  id v3 = (id)objc_msgSend_addObject_(self, a2, (uint64_t)a3);
}

- (void)removeCollection:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_type(v4, v5, v6) == 2 || objc_msgSend_type(v4, v7, v8) == 5)
  {
    v11[0] = v4;
    uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v11, 1);
    objc_msgSend_deleteArchivedCollectionObjects_withCompletion_(self, v10, (uint64_t)v9, &unk_1F37A1910);
  }
  else
  {
    objc_msgSend_removeObject_(self, v7, (uint64_t)v4);
  }
}

- (void)addFavorite:(id)a3
{
  id v3 = (id)objc_msgSend_addObject_(self, a2, (uint64_t)a3);
}

- (void)_classesForCurrentUserWithRole:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC658A9C;
  v9[3] = &unk_1E6C96C58;
  void v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v7 = v6;
  objc_msgSend_currentUserWithCompletion_(self, v8, (uint64_t)v9);
}

- (void)instructedClassesWithCompletion:(id)a3
{
  id v7 = a3;
  if (objc_msgSend_isDashboardAPIEnabled(self, v4, v5)) {
    objc_msgSend__classesForCurrentUserWithRole_completion_(self, v6, 2, v7);
  }
  else {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)personsInClassWithClassID:(id)a3 role:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC658D08;
  v13[3] = &unk_1E6C96CA8;
  id v10 = v9;
  id v15 = v10;
  v16[1] = (id)a4;
  id v11 = v8;
  id v14 = v11;
  objc_copyWeak(v16, &location);
  objc_msgSend_currentUserWithCompletion_(self, v12, (uint64_t)v13);
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
}

- (void)classesForPersonID:(id)a3 role:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a5;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_opt_class();
  id v11 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, a4);
  id v15 = objc_msgSend_predicateWithFormat_(v11, v14, @"personID == %@ && %K = %@", v8, @"roles", v13);
  id v24 = 0;
  uint64_t v17 = objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v16, v10, v15, &v24);
  id v18 = v24;

  if (v18)
  {
    v9[2](v9, 0, v18);
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1DC659314;
    v21[3] = &unk_1E6C96CD0;
    id v22 = v9;
    objc_copyWeak(&v23, &location);
    objc_msgSend_setCompletion_(v17, v19, (uint64_t)v21);
    objc_msgSend_executeQuery_(self, v20, (uint64_t)v17);
    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);
}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1DC6598DC;
  v38[3] = &unk_1E6C96CF8;
  id v8 = v6;
  id v39 = v8;
  id v9 = v7;
  id v40 = v9;
  uint64_t v10 = (void *)MEMORY[0x1E01A05F0](v38);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1DC659A24;
  v36[3] = &unk_1E6C95CF8;
  id v11 = v10;
  id v37 = v11;
  uint64_t v13 = objc_msgSend_dataServer_(self, v12, (uint64_t)v36);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1DC64DC24;
  v34[4] = sub_1DC64DC34;
  uint64_t v14 = objc_opt_class();
  objc_msgSend_childrenOfClass_(v8, v15, v14);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = (void *)MEMORY[0x1E4F28F60];
  id v19 = objc_msgSend_objectID(v8, v17, v18);
  id v21 = objc_msgSend_predicateWithFormat_(v16, v20, @"parentObjectID = %@", v19);

  uint64_t v22 = objc_opt_class();
  id v33 = 0;
  id v24 = objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v23, v22, v21, &v33);
  id v25 = v33;
  if (v24)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1DC659A3C;
    v27[3] = &unk_1E6C96D20;
    id v30 = v9;
    id v32 = v34;
    id v28 = v13;
    id v29 = v8;
    id v31 = v11;
    objc_msgSend_awaitExecuteQuery_completion_(self, v26, (uint64_t)v24, v27);
  }
  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v25);
  }

  _Block_object_dispose(v34, 8);
}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1DC659F44;
  v18[3] = &unk_1E6C96CF8;
  id v19 = v6;
  id v20 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = (void *)MEMORY[0x1E01A05F0](v18);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = sub_1DC65A08C;
  v16[3] = &unk_1E6C95CF8;
  id v17 = v10;
  id v11 = v10;
  uint64_t v13 = objc_msgSend_dataServer_(self, v12, (uint64_t)v16);
  objc_msgSend_setDeleted_(v9, v14, 1);
  objc_msgSend_remote_publishClass_membersToInsert_membersToDelete_completion_(v13, v15, (uint64_t)v9, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v11);
}

- (void)removeClass:(id)a3
{
}

- (id)orphanedAssets:(id *)a3
{
  id v4 = objc_msgSend_syncDataServer_(self, a2, 0);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1DC64DC24;
  id v21 = sub_1DC64DC34;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1DC64DC24;
  id v15 = sub_1DC64DC34;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DC65A244;
  v10[3] = &unk_1E6C96D48;
  void v10[4] = &v17;
  void v10[5] = &v11;
  objc_msgSend_remote_fetchOrphanedAssetsWithCompletion_(v4, v5, (uint64_t)v10);
  id v6 = (void *)v12[5];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    id v8 = (id)v18[5];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (void)removeAsset:(id)a3
{
  id v7 = a3;
  if (objc_msgSend_isDashboardAPIEnabled(self, v4, v5)) {
    objc_msgSend_removeObject_(self, v6, (uint64_t)v7);
  }
}

- (void)enrolledClassesWithCompletion:(id)a3
{
}

- (void)studentActivityForAttachmentsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC65A3F8;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_studentActivityForAttachmentsWithIDs_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)addSurveyAnswerItem:(id)a3
{
  id v7 = a3;
  objc_msgSend_setAction_(v7, v4, 1);
  id v6 = (id)objc_msgSend_addObject_(self, v5, (uint64_t)v7);
}

- (void)removeSurveyAnswerItem:(id)a3
{
  id v7 = a3;
  objc_msgSend_setState_(v7, v4, 1);
  objc_msgSend_setAction_(v7, v5, 3);
  objc_msgSend_removeObject_(self, v6, (uint64_t)v7);
}

- (void)startActivity:(id)a3 activityType:(int)a4 bundleID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1DC65A6E4;
  id v32[3] = &unk_1E6C95CF8;
  id v13 = v12;
  id v33 = v13;
  id v15 = objc_msgSend_dataServer_(self, v14, (uint64_t)v32);
  uint64_t v18 = objc_msgSend_currentUser(self, v16, v17);
  int isInstructor = objc_msgSend_isInstructor(v18, v19, v20);

  if (isInstructor)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v22, 0, @"API only applicable for student.");
    id v26 = LABEL_10:;
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v26);
    goto LABEL_11;
  }
  if ((objc_msgSend_isDashboardAPIEnabled(self, v22, v23) & 1) == 0)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v24, 4, @"Use of API not allowed.");
    goto LABEL_10;
  }
  if (!v11 || !v10 || (a4 & 0xFFFFFFFD) != 1)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v24, 307, @"Invalid input");
    goto LABEL_10;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1DC65A6FC;
  v27[3] = &unk_1E6C96D70;
  id v30 = v13;
  id v28 = v15;
  id v29 = v11;
  int v31 = a4;
  objc_msgSend_fetchAssignedItemFor_completion_(self, v25, (uint64_t)v10, v27);

  id v26 = v30;
LABEL_11:
}

- (void)startActivityFailed:(id)a3 activityType:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1DC65AAA4;
  v23[3] = &unk_1E6C95CF8;
  id v10 = v9;
  id v24 = v10;
  id v12 = objc_msgSend_dataServer_(self, v11, (uint64_t)v23);
  id v15 = objc_msgSend_currentUser(self, v13, v14);
  int isInstructor = objc_msgSend_isInstructor(v15, v16, v17);

  if (isInstructor)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v19, 0, @"API only applicable for student.");
    id v22 = LABEL_9:;
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v22);

    goto LABEL_10;
  }
  if ((objc_msgSend_isDashboardAPIEnabled(self, v19, v20) & 1) == 0)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v21, 4, @"Use of API not allowed.");
    goto LABEL_9;
  }
  if (!v8 || a4 != 3)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v21, 2, @"Invalid argument, nil attachmentID or incorrect attachment type");
    goto LABEL_9;
  }
  objc_msgSend_remote_startActivityFailed_completion_(v12, v21, (uint64_t)v8, v10);
LABEL_10:
}

- (void)fetchAppBasedAssignmentUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC65ABD0;
  v15[3] = &unk_1E6C95CF8;
  id v8 = v7;
  id v16 = v8;
  id v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v15);
  if (objc_msgSend_isDashboardAPIEnabled(self, v11, v12))
  {
    objc_msgSend_remote_fetchAppBasedAssignmentUsage_completion_(v10, v13, (uint64_t)v6, v8);
  }
  else
  {
    uint64_t v14 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v13, 4, @"Use of API not allowed.");
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v14);
  }
}

- (void)canSearchRostersWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC65AC90;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_dataServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_canSearchRostersWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)shouldPerformSearchAPIOperation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1DC65AD7C();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC65ADD0;
  block[3] = &unk_1E6C96D98;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)objectsMatching:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 1;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_1DC64DC24;
  void v29[4] = sub_1DC64DC34;
  id v30 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1DC65B18C;
  v26[3] = &unk_1E6C96DC0;
  void v26[4] = self;
  id v28 = v31;
  id v8 = v7;
  id v27 = v8;
  id v9 = (void *)MEMORY[0x1E01A05F0](v26);
  dispatch_time_t v10 = dispatch_time(0, 2700000000);
  id v11 = sub_1DC65AD7C();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC65B474;
  block[3] = &unk_1E6C96DE8;
  id v24 = v31;
  id v25 = v29;
  id v12 = v9;
  id v23 = v12;
  dispatch_after(v10, v11, block);

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = sub_1DC65B57C;
  v16[3] = &unk_1E6C96E10;
  objc_copyWeak(&v20, &location);
  id v13 = v12;
  id v18 = v13;
  id v14 = v6;
  id v17 = v14;
  uint64_t v19 = v29;
  objc_msgSend_shouldPerformSearchAPIOperation_completion_(self, v15, (uint64_t)v14, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

- (void)membersOfGroupWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  id v8 = CLSLogSearch;
  if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_debug_impl(&dword_1DC60F000, v8, OS_LOG_TYPE_DEBUG, "Query for members of CLSClass/CLSGroup: %@", buf, 0xCu);
  }
  id v9 = [CLSSearchSpecification alloc];
  id v11 = objc_msgSend_initWithOptions_behaviors_(v9, v10, 1, 1);
  id v16 = v6;
  id v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)&v16, 1);
  objc_msgSend_requireClassMemberRole_forClassIDs_(v11, v14, 3, v13);

  objc_msgSend_objectsMatching_completion_(self, v15, (uint64_t)v11, v7);
}

- (void)collaborationStatesForObjectWithID:(id)a3 ownerPersonID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = sub_1DC65B9D0;
  v16[3] = &unk_1E6C95CF8;
  id v11 = v10;
  id v17 = v11;
  id v13 = objc_msgSend_dataServer_(self, v12, (uint64_t)v16);
  id v15 = v13;
  if (v13) {
    objc_msgSend_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_(v13, v14, (uint64_t)v8, v9, v11);
  }
}

- (void)collaborationStatesForObjectWithID:(id)a3 classID:(id)a4 forOwnersWithRole:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1DC65BAD8;
  v18[3] = &unk_1E6C95CF8;
  id v13 = v12;
  id v19 = v13;
  id v15 = objc_msgSend_dataServer_(self, v14, (uint64_t)v18);
  id v17 = v15;
  if (v15) {
    objc_msgSend_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_(v15, v16, (uint64_t)v10, v11, a5, v13);
  }
}

- (void)publishCollaborationStateChanges:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1DC65BD00;
  v30[3] = &unk_1E6C95CF8;
  id v8 = v7;
  id v31 = v8;
  id v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v30);
  if (objc_msgSend_count(v6, v11, v12))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v6;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v32, 16);
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v13);
          }
          id v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v25 = 0;
          char v21 = objc_msgSend_validateObject_(v20, v16, (uint64_t)&v25);
          id v22 = v25;
          id v23 = v22;
          if ((v21 & 1) == 0)
          {
            (*((void (**)(id, void, void, id))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v22);

            goto LABEL_13;
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v26, v32, 16);
        if (v17) {
          continue;
        }
        break;
      }
    }

    objc_msgSend_remote_publishCollaborationStateChanges_completion_(v10, v24, (uint64_t)v13, v8);
  }
  else
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0);
  }
LABEL_13:
}

- (void)publishAdminRequests:(id)a3 withRequestor:(id)a4 adminRequestAccounts:(id)a5 completion:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = sub_1DC65C0AC;
  v67[3] = &unk_1E6C95CF8;
  id v14 = v13;
  id v68 = v14;
  id v16 = objc_msgSend_dataServer_(self, v15, (uint64_t)v67);
  if (objc_msgSend_count(v10, v17, v18))
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v10;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v63, v69, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v62 = *(void *)v64;
      id v58 = v12;
      id v59 = v10;
      id v56 = v16;
      id v57 = v14;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v64 != v62) {
            objc_enumerationMutation(obj);
          }
          long long v26 = *(void **)(*((void *)&v63 + 1) + 8 * v25);
          long long v27 = objc_msgSend_requestorID(v26, v22, v23);
          if (v27 || (objc_msgSend_objectID(v11, v22, v23), (id v61 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v28 = objc_msgSend_requestorID(v26, v22, v23);
            if (!v28) {
              goto LABEL_22;
            }
            id v31 = (void *)v28;
            uint64_t v32 = objc_msgSend_objectID(v11, v29, v30);
            if (!v32)
            {

LABEL_22:
              if (!v27) {
                long long v27 = v61;
              }

LABEL_25:
              uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
              long long v47 = NSString;
              uint64_t v48 = objc_msgSend_requestorID(v26, v22, v23);
              uint64_t v51 = objc_msgSend_objectID(v11, v49, v50);
              id v53 = objc_msgSend_stringWithFormat_(v47, v52, @"Invalid RequestorID. (got:%@, expected:%@)", v48, v51);
              uint64_t v55 = objc_msgSend_cls_createErrorWithCode_description_(v46, v54, 2, v53);

              id v14 = v57;
              (*((void (**)(id, void, void *))v57 + 2))(v57, 0, v55);

              id v12 = v58;
              id v10 = v59;
              id v16 = v56;
              goto LABEL_26;
            }
            id v35 = (void *)v32;
            long long v36 = objc_msgSend_requestorID(v26, v33, v34);
            id v37 = v11;
            id v40 = objc_msgSend_objectID(v11, v38, v39);
            char isEqualToString = objc_msgSend_isEqualToString_(v36, v41, (uint64_t)v40);

            if (v27) {
            else
            }

            id v11 = v37;
            if ((isEqualToString & 1) == 0) {
              goto LABEL_25;
            }
          }
          else
          {
            id v61 = 0;
          }
          ++v25;
        }
        while (v24 != v25);
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v63, v69, 16);
        uint64_t v24 = v43;
        id v12 = v58;
        id v10 = v59;
        id v16 = v56;
        id v14 = v57;
      }
      while (v43);
    }

    objc_msgSend_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_(v16, v44, (uint64_t)obj, v11, v12, v14);
  }
  else
  {
    uint64_t v45 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v19, 2, @"Empty adminRequests.");
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v45);
  }
LABEL_26:
}

- (void)adminRequestorForEmail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = objc_opt_class();
  id v10 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v9, @"email == %@", v6);
  id v19 = 0;
  id v12 = objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v11, v8, v10, &v19);
  id v13 = v19;

  if (v13)
  {
    v7[2](v7, 0, v13);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v16[2] = sub_1DC65C224;
    v16[3] = &unk_1E6C96C80;
    uint64_t v18 = v7;
    id v17 = v6;
    objc_msgSend_setCompletion_(v12, v14, (uint64_t)v16);
    objc_msgSend_executeQuery_(self, v15, (uint64_t)v12);
  }
}

- (void)childrenOfAdminRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = objc_opt_class();
  id v10 = objc_msgSend_predicateForObjectsWithParentObjectID_(CLSDataObserver, v9, (uint64_t)v6);
  id v23 = 0;
  id v12 = objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v11, v8, v10, &v23);
  id v13 = v23;

  if (v13)
  {
    v7[2](v7, 0, v13);
  }
  else
  {
    objc_initWeak(&location, self);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_1DC64DC24;
    void v20[4] = sub_1DC64DC34;
    id v21 = (id)objc_opt_new();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v16[2] = sub_1DC65C4EC;
    v16[3] = &unk_1E6C96E60;
    id v17 = v7;
    objc_copyWeak(&v19, &location);
    uint64_t v18 = v20;
    objc_msgSend_setCompletion_(v12, v14, (uint64_t)v16);
    objc_msgSend_executeQuery_(self, v15, (uint64_t)v12);
    objc_destroyWeak(&v19);

    _Block_object_dispose(v20, 8);
    objc_destroyWeak(&location);
  }
}

- (void)deleteAdminRequestID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC65C93C;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_deleteAdminRequestID_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)publishAnswersForSurvey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC65CA18;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_publishSurveyAnswers_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)fetchSurveyAnswers:(id)a3 responderIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = sub_1DC65CB48;
  v16[3] = &unk_1E6C95CF8;
  id v11 = v10;
  id v17 = v11;
  uint64_t v15 = objc_msgSend_dataServer_(self, v12, (uint64_t)v16);
  if (v8 && objc_msgSend_count(v8, v13, v14) || v9 && objc_msgSend_count(v9, v13, v14)) {
    objc_msgSend_remote_fetchSurveyAnswer_responderIDs_completion_(v15, v13, (uint64_t)v8, v9, v11);
  }
  else {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
}

- (void)relayRequestWithData:(id)a3 requestType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v11 = (void (**)(void, void, void))v9;
  if (a4 == 1)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1DC65CE70;
    v47[3] = &unk_1E6C95CF8;
    id v12 = v9;
    id v48 = v12;
    uint64_t v14 = objc_msgSend_dataServer_(self, v13, (uint64_t)v47);
    uint64_t v15 = (void *)MEMORY[0x1E4F1CB10];
    id v16 = NSTemporaryDirectory();
    uint64_t v18 = objc_msgSend_fileURLWithPath_isDirectory_(v15, v17, (uint64_t)v16, 1);

    id v21 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v19, v20);
    uint64_t v24 = objc_msgSend_UUIDString(v21, v22, v23);
    long long v26 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v18, v25, (uint64_t)v24, 0);

    long long v29 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v27, v28);
    uint64_t v32 = objc_msgSend_path(v26, v30, v31);
    char FileAtPath_contents_attributes = objc_msgSend_createFileAtPath_contents_attributes_(v29, v33, (uint64_t)v32, 0, 0);

    if (FileAtPath_contents_attributes)
    {
      id v46 = 0;
      long long v36 = objc_msgSend_fileHandleForUpdatingURL_error_(MEMORY[0x1E4F28CB0], v35, (uint64_t)v26, &v46);
      id v37 = v46;
      if (v36)
      {
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = sub_1DC65CE88;
        v42[3] = &unk_1E6C96E88;
        id v45 = v12;
        id v38 = v36;
        id v43 = v38;
        id v44 = v26;
        uint64_t v39 = (void *)MEMORY[0x1E01A05F0](v42);
        objc_msgSend_remote_relayRequestWithData_requestType_fileHandle_completion_(v14, v40, (uint64_t)v8, 1, v38, v39);
      }
      else
      {
        (*((void (**)(id, void, id))v12 + 2))(v12, 0, v37);
      }
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v35, 100, @"failed to create file");
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, id))v12 + 2))(v12, 0, v37);
    }
  }
  else
  {
    __int16 v41 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v10, 2, @"Invalid requestType");
    ((void (**)(void, void, void *))v11)[2](v11, 0, v41);
  }
}

- (void)saveInsightEvents:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC65D1BC;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_dataServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_saveInsightEvents_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)urlSuitableForOpeningForExpectedURL:(id)a3 itemID:(id)a4 ownerName:(id)a5 zoneName:(id)a6 completion:(id)a7
{
  id v12 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1DC65ECA4;
  v24[3] = &unk_1E6C95CF8;
  id v13 = v12;
  id v25 = v13;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v19 = objc_msgSend_utilityServer_(self, v18, (uint64_t)v24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1DC65ECBC;
  v22[3] = &unk_1E6C96EF0;
  id v23 = v13;
  id v20 = v13;
  objc_msgSend_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_(v19, v21, (uint64_t)v17, v16, v15, v14, v22);
}

- (void)cloudKitUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC65EE78;
  v15[3] = &unk_1E6C95CF8;
  id v7 = v6;
  id v16 = v7;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC65EE90;
  v13[3] = &unk_1E6C96EF0;
  id v14 = v7;
  id v11 = v7;
  objc_msgSend_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_(v10, v12, (uint64_t)v8, v8, v13);
}

- (void)cloudKitThumbnailUrlSuitableForOpeningForAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC65F048;
  v15[3] = &unk_1E6C95CF8;
  id v7 = v6;
  id v16 = v7;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC65F060;
  v13[3] = &unk_1E6C96EF0;
  id v14 = v7;
  id v11 = v7;
  objc_msgSend_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_(v10, v12, (uint64_t)v8, v13);
}

- (void)cloudKitUrlSuitableForStreamingAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC65F21C;
  v15[3] = &unk_1E6C95CF8;
  id v7 = v6;
  id v16 = v7;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC65F238;
  v13[3] = &unk_1E6C96F18;
  id v14 = v7;
  id v11 = v7;
  objc_msgSend_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_(v10, v12, (uint64_t)v8, v8, v13);
}

- (void)deleteBackingStoreForAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC65F368;
  v15[3] = &unk_1E6C95CF8;
  id v7 = v6;
  id v16 = v7;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DC65F380;
  v13[3] = &unk_1E6C96BE8;
  id v14 = v7;
  id v11 = v7;
  objc_msgSend_remote_deleteBackingStoreForAsset_completion_(v10, v12, (uint64_t)v8, v13);
}

- (void)createShareIfNeededForURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC65F45C;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_createShareIfNeededForURL_completion_(v10, v11, (uint64_t)v8, v7);
}

- (id)uploadAsset:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend_syncUtilityServer_(self, v5, (uint64_t)&unk_1F37A1610);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1DC65F69C;
  id v16 = sub_1DC65F6AC;
  id v17 = 0;
  int v7 = CLSExecutableLinkedOnOrAfter_iOS16_2_macOS_13_1();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = sub_1DC65F6B4;
  v11[3] = &unk_1E6C96F40;
  void v11[4] = &v12;
  objc_msgSend_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_(v6, v8, (uint64_t)v4, v7 ^ 1u, v4, v11);
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

@end