@interface FBKData
+ (FBKData)sharedInstance;
+ (id)fixtureInstance;
+ (id)modelWithFormResponsePropertiesFromModel:(id)a3;
+ (void)addFetchedFormResponseProperty:(id)a3 forAnswersWithRole:(id)a4 toModel:(id)a5;
- (BOOL)fetchedAFormByTat;
- (BOOL)hasFinishedFirstLoad;
- (BOOL)isRefreshingContent;
- (BOOL)isRefreshingForms;
- (BOOL)isRefreshingTeams;
- (BOOL)isReloadingApp;
- (BOOL)isReloadingContentAndFormItems;
- (BOOL)saveToStore:(id *)a3;
- (FBKData)initWithLoginManager:(id)a3 api:(id)a4;
- (FBKLoginManager)loginManager;
- (FBKSeedPortalAPI)api;
- (FBKTeam)defaultTeam;
- (FBKTeam)personalTeam;
- (FBKUploadStatusManager)uploadManager;
- (FBKUser)currentUser;
- (NSArray)pendingConsents;
- (NSManagedObjectContext)mainQueueContext;
- (NSManagedObjectContext)privateQueueContext;
- (NSNotificationCenter)notificationCenter;
- (NSPersistentStoreCoordinator)persistentStoreCoordinatorInternal;
- (id)_followupSubmissionBodyWithFlags:(unint64_t)a3 responses:(id)a4;
- (id)allActiveUploadTasksInContext:(id)a3;
- (id)bundle;
- (id)createPersistentStoreError:(id *)a3;
- (id)deleteEntityWithRequest:(id)a3 inContext:(id)a4;
- (id)formReloadCompletion;
- (id)localDeviceForSubmission;
- (id)mainQueueObjectFromPrivate:(id)a3;
- (id)managedObjectModel;
- (id)persistentStoreCoordinatorURL;
- (id)persistentStoreType;
- (id)userForUsername:(id)a3;
- (id)userForUsername:(id)a3 inContext:(id)a4;
- (void)_closeFeedbackItem:(id)a3 completion:(id)a4;
- (void)_didGetFeedback:(id)a3 error:(id)a4 withContentItem:(id)a5 completion:(id)a6;
- (void)_logUploadTasks;
- (void)_newFormResponseForBugFormID:(id)a3 formStub:(id)a4 inTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7 completion:(id)a8;
- (void)_refreshContentItemsForTeam:(id)a3 withCompletion:(id)a4;
- (void)_refreshContentItemsWithCompletion:(id)a3;
- (void)_refreshFormItemsForTeam:(id)a3 formTat:(id)a4 withCompletion:(id)a5;
- (void)_refreshFormItemsWithCompletion:(id)a3;
- (void)_reloadItems:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5;
- (void)actuallyFetchFormItemByTat:(id)a3 completion:(id)a4;
- (void)addDeviceDataToSubmissionInfo:(id)a3 withCollector:(id)a4;
- (void)assignFeedback:(id)a3 toParticipant:(id)a4 completion:(id)a5;
- (void)beginFileSubmissionForFilerForm:(id)a3 withCollector:(id)a4 completion:(id)a5;
- (void)beginSubmissionForFollowup:(id)a3 withResponses:(id)a4 didOptOut:(BOOL)a5 withCollector:(id)a6 completion:(id)a7;
- (void)beginSubmissionForFormResponse:(id)a3 withCollector:(id)a4 completion:(id)a5;
- (void)bugFormFromForDraftItem:(id)a3 withCompletion:(id)a4;
- (void)clearUploadTasksWithIdentifier:(unint64_t)a3;
- (void)closeFeedbackItems:(id)a3 completion:(id)a4;
- (void)createEnhancedLoggingFollowupForItem:(id)a3 completion:(id)a4;
- (void)createFeedbackFollowupOfType:(unint64_t)a3 forItem:(id)a4 completion:(id)a5;
- (void)createUnsolicitedFeedbackFollowupForItem:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteDraftFromContentItem:(id)a3 completion:(id)a4;
- (void)deleteDraftFromContentItem:(id)a3 shouldSave:(BOOL)a4 completion:(id)a5;
- (void)deleteDraftsFromContentItems:(id)a3 completion:(id)a4;
- (void)deleteFilePromiseWithUUID:(id)a3 object:(id)a4 completion:(id)a5;
- (void)deleteTargetedSurveyItemFromInboxIfNeeded:(id)a3;
- (void)deleteUnsolicitedFollowup:(id)a3 withFeedbackItem:(id)a4 completion:(id)a5;
- (void)deleteUploadForTask:(id)a3 completion:(id)a4;
- (void)demoteFeedback:(id)a3 completion:(id)a4;
- (void)destroyPersistentStoreWithUrl:(id)a3;
- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4;
- (void)didLogOutWithCompletion:(id)a3;
- (void)feedbackFollowupForID:(id)a3 completion:(id)a4;
- (void)feedbackFrameworkLoadDataWithFormTat:(id)a3 orFormID:(id)a4 completion:(id)a5;
- (void)fetchFeedbackStatusForFeedback:(id)a3 completion:(id)a4;
- (void)fetchFormItemByTat:(id)a3 completion:(id)a4;
- (void)formResponseStubForID:(id)a3 completion:(id)a4;
- (void)getAllContentForFeedback:(id)a3 completion:(id)a4;
- (void)getFeedbackFollowupForFeedback:(id)a3 atIndex:(unint64_t)a4 completion:(id)a5;
- (void)getFeedbackForContentItem:(id)a3 completion:(id)a4;
- (void)getFeedbackForContentItem:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5;
- (void)getFeedbackForFeedbackID:(id)a3 completion:(id)a4;
- (void)getFeedbackForFollowupID:(id)a3 completion:(id)a4;
- (void)getFeedbackForFormResponseID:(id)a3 completion:(id)a4;
- (void)getFileDownloadURLForFilePromise:(id)a3 completion:(id)a4;
- (void)getFormResponseStubForFeedback:(id)a3 completion:(id)a4;
- (void)getFormResponseStubForFeedback:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5;
- (void)initCoreData;
- (void)mainQueueContextDidSave:(id)a3;
- (void)markAnnouncementRead:(id)a3 completion:(id)a4;
- (void)markFormResponseComplete:(id)a3 withFiles:(BOOL)a4 collector:(id)a5 completion:(id)a6;
- (void)newFormResponseForBugForm:(id)a3 inTeam:(id)a4 completion:(id)a5;
- (void)newFormResponseForBugFormStub:(id)a3 inTeam:(id)a4 completion:(id)a5;
- (void)newFormResponseForBugFormStub:(id)a3 inTeam:(id)a4 requestPlugIns:(id)a5 appToken:(id)a6 completion:(id)a7;
- (void)prepareFilerFormForSubmission:(id)a3;
- (void)privateQueueContextDidSave:(id)a3;
- (void)promoteFeedback:(id)a3 toTeam:(id)a4 completion:(id)a5;
- (void)purgeOrphanedEntities;
- (void)purgeOrphanedForms;
- (void)recordConsentResponseForConsent:(id)a3 response:(BOOL)a4 completion:(id)a5;
- (void)reduceToFault:(id)a3;
- (void)refreshAnnouncementFromContentItem:(id)a3 completion:(id)a4;
- (void)refreshBugFormWithID:(id)a3 fromStub:(id)a4 forTeam:(id)a5 completion:(id)a6;
- (void)refreshBugFormWithID:(id)a3 fromStub:(id)a4 forTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7 completion:(id)a8;
- (void)refreshContentItems;
- (void)refreshFormItems;
- (void)refreshFormResponse:(id)a3 completion:(id)a4;
- (void)refreshFormResponseFromContentItem:(id)a3 completion:(id)a4;
- (void)refreshFormResponseOnlyWithID:(id)a3 completion:(id)a4;
- (void)refreshFormResponseStubFromContentItem:(id)a3 completion:(id)a4;
- (void)refreshFormResponseWithID:(id)a3 contentItem:(id)a4 completion:(id)a5;
- (void)refreshParticipantsWithTeam:(id)a3 completion:(id)a4;
- (void)refreshSurveyFromContentItem:(id)a3 forTeam:(id)a4 completion:(id)a5;
- (void)refreshTeamsWithCompletion:(id)a3;
- (void)refreshUnreadCountWithCompletion:(id)a3;
- (void)reloadAllContentWithCompletion:(id)a3;
- (void)reloadDataSkippingContentItems:(BOOL)a3 reloadsTeams:(BOOL)a4 formTat:(id)a5 completion:(id)a6;
- (void)reloadItems:(id)a3 completion:(id)a4;
- (void)resetAllLocalDataWithCompletion:(id)a3;
- (void)resetContentAndFormItems;
- (void)respondToFollowup:(id)a3 withResponses:(id)a4 collector:(id)a5 optingOut:(BOOL)a6 completion:(id)a7;
- (void)runAfterFormItemsLoad:(id)a3;
- (void)saveFormResponse:(id)a3 completion:(id)a4;
- (void)setApi:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setFetchedAFormByTat:(BOOL)a3;
- (void)setFormReloadCompletion:(id)a3;
- (void)setHasFinishedFirstLoad:(BOOL)a3;
- (void)setIsRefreshingContent:(BOOL)a3;
- (void)setIsRefreshingForms:(BOOL)a3;
- (void)setIsRefreshingTeams:(BOOL)a3;
- (void)setLoginManager:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPendingConsents:(id)a3;
- (void)setPersistentStoreCoordinatorInternal:(id)a3;
- (void)setUploadManager:(id)a3;
- (void)storeUploadWithFormResponse:(id)a3 bugSessions:(id)a4;
- (void)takeMainQueueObject:(id)a3 andContinueWithPrivateQueueObject:(id)a4;
- (void)updateResolversForLocalBugForms;
- (void)updateTask:(id)a3 withSubmissionStage:(unint64_t)a4;
@end

@implementation FBKData

+ (id)fixtureInstance
{
  v3 = [_TtC12FeedbackCore16FBKFixtureLoader alloc];
  v4 = [MEMORY[0x263F086E0] bundleForClass:a1];
  id v5 = [(FBKFixtureLoader *)v3 initForBundle:v4];

  v6 = [[FBKSeedPortalAPI alloc] initWithEnvironment:+[FBKSSharedConstants environment] client:v5];
  v7 = [[FBKLoginManager alloc] initWithAPI:v6];
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLoginManager:v7 api:v6];
  v9 = [v8 privateQueueContext];
  [(FBKSeedPortalAPI *)v6 set_managedObjectContext:v9];

  [(FBKSeedPortalAPI *)v6 setLoginManager:v7];
  [(FBKLoginManager *)v7 setFBKData:v8];

  return v8;
}

+ (FBKData)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__FBKData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return (FBKData *)v2;
}

void __25__FBKData_sharedInstance__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = FBKIsInternalInstall(a1, a2);
  if (v2)
  {
    v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __25__FBKData_sharedInstance__block_invoke_cold_1(v4);
    }
  }
  if (!FBKIsInternalInstall(v2, v3)) {
    goto LABEL_10;
  }
  id v5 = [MEMORY[0x263F08AB0] processInfo];
  v6 = [v5 environment];
  v7 = [v6 objectForKeyedSubscript:@"FBK_FIXTURES_ENABLED"];
  int v8 = [v7 isEqualToString:@"1"];

  if (v8)
  {
    v9 = Log_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "FBK Data in fixture mode enabled", (uint8_t *)v19, 2u);
    }

    uint64_t v10 = [(id)objc_opt_class() fixtureInstance];
    v11 = (FBKHTTPClient *)sharedInstance_sharedInstance_1;
    sharedInstance_sharedInstance_1 = v10;
  }
  else
  {
LABEL_10:
    v11 = objc_alloc_init(FBKHTTPClient);
    uint64_t v12 = +[FBKSSharedConstants environment];
    v13 = Log_5();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v19[0] = 67109120;
      v19[1] = v12;
      _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_INFO, "Initializing FBK Data with environment [%hd]", (uint8_t *)v19, 8u);
    }

    v14 = [[FBKSeedPortalAPI alloc] initWithEnvironment:v12 client:v11];
    v15 = [[FBKLoginManager alloc] initWithAPI:v14];
    uint64_t v16 = [objc_alloc((Class)objc_opt_class()) initWithLoginManager:v15 api:v14];
    v17 = (void *)sharedInstance_sharedInstance_1;
    sharedInstance_sharedInstance_1 = v16;

    [(FBKLoginManager *)v15 setFBKData:sharedInstance_sharedInstance_1];
    v18 = [(id)sharedInstance_sharedInstance_1 privateQueueContext];
    [(FBKSeedPortalAPI *)v14 set_managedObjectContext:v18];

    [(FBKSeedPortalAPI *)v14 setLoginManager:v15];
  }
}

- (FBKUploadStatusManager)uploadManager
{
  uploadManager = self->_uploadManager;
  if (!uploadManager)
  {
    v4 = [MEMORY[0x263F08AB0] processInfo];
    id v5 = [v4 environment];
    v6 = [v5 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

    if (v6) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Unit Test Failure", @"%s should not be called while unit testing", "-[FBKData uploadManager]");
    }
    v7 = [FBKUploadStatusManager alloc];
    int v8 = [MEMORY[0x263F3A150] sharedInstance];
    v9 = +[FBKDeviceManager sharedInstance];
    uint64_t v10 = [(FBKUploadStatusManager *)v7 initWithData:self ded:v8 deviceManager:v9];
    v11 = self->_uploadManager;
    self->_uploadManager = v10;

    uploadManager = self->_uploadManager;
  }

  return uploadManager;
}

- (FBKData)initWithLoginManager:(id)a3 api:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FBKData;
  v9 = [(FBKData *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    [(FBKData *)v9 initCoreData];
    objc_storeStrong((id *)&v10->_api, a4);
    objc_storeStrong((id *)&v10->_loginManager, a3);
    v11 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x263F08A00]);
    notificationCenter = v10->_notificationCenter;
    v10->_notificationCenter = v11;

    currentUser = v10->_currentUser;
    v10->_currentUser = 0;

    *(_WORD *)&v10->_hasFinishedFirstLoad = 0;
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v15 = *MEMORY[0x263EFF040];
    uint64_t v16 = [(FBKData *)v10 privateQueueContext];
    [v14 addObserver:v10 selector:sel_privateQueueContextDidSave_ name:v15 object:v16];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    v18 = [(FBKData *)v10 mainQueueContext];
    [v17 addObserver:v10 selector:sel_mainQueueContextDidSave_ name:v15 object:v18];
  }
  return v10;
}

- (id)createPersistentStoreError:(id *)a3
{
  id v5 = [(FBKData *)self persistentStoreCoordinatorInternal];
  v6 = [(FBKData *)self persistentStoreType];
  id v7 = [(FBKData *)self persistentStoreCoordinatorURL];
  id v8 = [v5 addPersistentStoreWithType:v6 configuration:0 URL:v7 options:MEMORY[0x263EFFA78] error:a3];

  return v8;
}

- (void)initCoreData
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Error locating/creating SQLite store directory.", v2, v3, v4, v5, v6);
}

void __23__FBKData_initCoreData__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[FBKUser fetchRequest];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  [v2 countForFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v5 = [*(id *)(a1 + 40) persistentStoreCoordinatorInternal];
      uint8_t v6 = [v5 persistentStores];
      int v7 = [v6 containsObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      if (v7)
      {
        id v8 = [*(id *)(a1 + 40) persistentStoreCoordinatorInternal];
        [v8 removePersistentStore:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error:0];
      }
    }
    [*(id *)(a1 + 40) destroyPersistentStoreWithUrl:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(id *)(v12 + 40);
    uint64_t v13 = [v11 createPersistentStoreError:&v16];
    objc_storeStrong((id *)(v12 + 40), v16);
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBKData;
  [(FBKData *)&v4 dealloc];
}

- (BOOL)saveToStore:(id *)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(FBKData *)self mainQueueContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23__FBKData_saveToStore___block_invoke;
  v7[3] = &unk_2648762A0;
  v7[4] = &v10;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  [v5 performBlockAndWait:v7];

  LOBYTE(a3) = *((unsigned char *)v11 + 24);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);
  return (char)a3;
}

void __23__FBKData_saveToStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained mainQueueContext];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 save:*(void *)(a1 + 48)];
}

- (void)reduceToFault:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__FBKData_reduceToFault___block_invoke;
  v6[3] = &unk_264873FE8;
  id v7 = v3;
  id v5 = v3;
  [v4 performBlockAndWait:v6];
}

void __25__FBKData_reduceToFault___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 refreshObject:*(void *)(a1 + 32) mergeChanges:1];
}

- (id)mainQueueObjectFromPrivate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  objc_initWeak(&location, self);
  uint8_t v6 = [(FBKData *)self mainQueueContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__FBKData_mainQueueObjectFromPrivate___block_invoke;
  v10[3] = &unk_2648762C8;
  uint64_t v12 = &v15;
  objc_copyWeak(&v13, &location);
  id v7 = v5;
  id v11 = v7;
  [v6 performBlockAndWait:v10];

  id v8 = (id)v16[5];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __38__FBKData_mainQueueObjectFromPrivate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained mainQueueContext];
  uint64_t v3 = [v2 objectWithID:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)takeMainQueueObject:(id)a3 andContinueWithPrivateQueueObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectID];
  objc_initWeak(&location, self);
  uint64_t v9 = [(FBKData *)self privateQueueContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__FBKData_takeMainQueueObject_andContinueWithPrivateQueueObject___block_invoke;
  v12[3] = &unk_2648762F0;
  id v10 = v8;
  id v13 = v10;
  objc_copyWeak(&v15, &location);
  id v11 = v7;
  id v14 = v11;
  [v9 performBlock:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __65__FBKData_takeMainQueueObject_andContinueWithPrivateQueueObject___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v3 = [WeakRetained privateQueueContext];
    id v5 = [v3 objectWithID:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Object ID is nil, cannot continue in private queue context", buf, 2u);
    }
  }
}

- (FBKTeam)personalTeam
{
  uint64_t v3 = [(FBKData *)self currentUser];
  uint64_t v4 = [(FBKData *)self mainQueueContext];
  id v5 = +[FBKTeam personalTeamForUser:v3 inContext:v4];

  return (FBKTeam *)v5;
}

- (FBKTeam)defaultTeam
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FBKData *)self personalTeam];
  uint64_t v4 = [v3 forms];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(FBKData *)self personalTeam];
  }
  else
  {
    id v7 = [(FBKData *)self currentUser];
    id v8 = [v7 activeTeams];
    id v6 = objc_msgSend(v8, "ded_findWithBlock:", &__block_literal_global_37);

    uint64_t v9 = Log_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 shortDescription];
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "Default team is not personal team. Using [%{public}@]", (uint8_t *)&v12, 0xCu);
    }
  }

  return (FBKTeam *)v6;
}

uint64_t __22__FBKData_defaultTeam__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasContent];
}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKData *)self persistentStoreCoordinatorInternal];

  if (!v8)
  {
    [(FBKData *)self initCoreData];
    uint64_t v9 = [(FBKData *)self privateQueueContext];
    id v10 = [(FBKData *)self api];
    objc_msgSend(v10, "set_managedObjectContext:", v9);
  }
  id v11 = [v6 pendingConsents];
  [(FBKData *)self setPendingConsents:v11];

  objc_initWeak(&location, self);
  int v12 = [(FBKData *)self loginManager];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke;
  v15[3] = &unk_264876368;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v16 = v13;
  id v14 = v7;
  id v17 = v14;
  [v12 runAfterLogin:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = [WeakRetained privateQueueContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2;
  v5[3] = &unk_2648746C0;
  objc_copyWeak(&v8, v2);
  id v6 = a1[4];
  id v7 = a1[5];
  [v4 performBlock:v5];

  objc_destroyWeak(&v8);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2(id *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v2 = +[FBKSSharedConstants environment];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_3;
  aBlock[3] = &unk_264876340;
  uint64_t v3 = a1 + 6;
  id location = &v27;
  objc_copyWeak(&v27, a1 + 6);
  id v25 = a1[4];
  __int16 v28 = v2;
  id v26 = a1[5];
  uint64_t v4 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v5 = +[FBKUser fetchRequest];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v7 = [WeakRetained privateQueueContext];
  id v23 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v23];
  id v9 = v23;

  if (v9 || (unint64_t)objc_msgSend(v8, "count", &v27) >= 2)
  {
    id v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2_cold_1();
    }
LABEL_5:

    id v11 = objc_loadWeakRetained(a1 + 6);
    [v11 resetAllLocalDataWithCompletion:v4];
LABEL_6:

    goto LABEL_7;
  }
  if (+[FBKSharedConstants hasDifferentLanguageSinceLastLaunch])
  {
    id v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "Language preference changed since last launch. Reseting all data", buf, 2u);
    }
    goto LABEL_5;
  }
  if ([v8 count] == 1)
  {
    id v11 = [v8 firstObject];
    if ([v11 environment] == v2
      && ([v11 ID],
          int v12 = objc_claimAutoreleasedReturnValue(),
          [a1[4] participantID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v12 isEqualToNumber:v13],
          v13,
          v12,
          (v14 & 1) != 0))
    {
      id v15 = Log_5();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_INFO, "same user logging in", buf, 2u);
      }

      v4[2](v4);
    }
    else
    {
      id v17 = Log_5();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v11 ID];
        int v19 = [v18 intValue];
        int v20 = [v11 environment];
        *(_DWORD *)buf = 67109376;
        int v30 = v19;
        __int16 v31 = 1024;
        int v32 = v20;
        _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_DEFAULT, "will delete all data from previous user ID [%i] env [%i]", buf, 0xEu);
      }
      id v21 = objc_loadWeakRetained(v3);
      [v21 resetAllLocalDataWithCompletion:v4];
    }
    goto LABEL_6;
  }
  id v16 = Log_5();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_INFO, "no previous user", buf, 2u);
  }

  v4[2](v4);
LABEL_7:

  objc_destroyWeak(location);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_3(uint64_t a1)
{
  +[FBKSharedConstants recordCurrentLanguagePreference];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained privateQueueContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_4;
  v4[3] = &unk_264876318;
  id v5 = *(id *)(a1 + 32);
  __int16 v8 = *(_WORD *)(a1 + 56);
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  [v3 performBlock:v4];

  objc_destroyWeak(&v7);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) participantID];
    int v4 = [v3 intValue];
    int v5 = *(__int16 *)(a1 + 56);
    *(_DWORD *)buf = 67109376;
    int v23 = v4;
    __int16 v24 = 1024;
    int v25 = v5;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "Inserting user with ID [%i] env [%i]", buf, 0xEu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(__int16 *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = [WeakRetained privateQueueContext];
  id v10 = +[FBKUser createUserFromUserLoginInfo:v6 forEnvironment:v7 inContext:v9];

  id v11 = objc_loadWeakRetained((id *)(a1 + 48));
  int v12 = [v11 privateQueueContext];
  id v21 = 0;
  [v12 save:&v21];
  id v13 = v21;

  id v14 = objc_loadWeakRetained((id *)(a1 + 48));
  id v15 = [v14 mainQueueObjectFromPrivate:v10];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_100;
  v17[3] = &unk_2648746C0;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v18 = v15;
  id v19 = *(id *)(a1 + 40);
  id v16 = v15;
  dispatch_async(MEMORY[0x263EF83A0], v17);

  objc_destroyWeak(&v20);
}

uint64_t __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_100(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCurrentUser:v2];

  int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4 = a3;
  [(FBKData *)self setCurrentUser:0];
  int v5 = [(FBKData *)self uploadManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__FBKData_didLogOutWithCompletion___block_invoke;
  v7[3] = &unk_264874038;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 didLogOutWithCompletion:v7];
}

uint64_t __35__FBKData_didLogOutWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetAllLocalDataWithCompletion:*(void *)(a1 + 40)];
}

- (BOOL)isReloadingContentAndFormItems
{
  if ([(FBKData *)self isRefreshingForms]) {
    return 1;
  }

  return [(FBKData *)self isRefreshingContent];
}

- (void)reloadAllContentWithCompletion:(id)a3
{
}

- (void)runAfterFormItemsLoad:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(FBKData *)self isReloadingApp]) {
    [(FBKData *)self setFormReloadCompletion:v4];
  }
  else {
    v4[2]();
  }
}

- (void)fetchFormItemByTat:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FBKData *)self setFetchedAFormByTat:1];
  if ([(FBKData *)self isReloadingApp])
  {
    id v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[FBKData fetchFormItemByTat:completion:]();
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__FBKData_fetchFormItemByTat_completion___block_invoke;
    v9[3] = &unk_264874388;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(FBKData *)self runAfterFormItemsLoad:v9];
  }
  else
  {
    [(FBKData *)self actuallyFetchFormItemByTat:v6 completion:v7];
  }
}

uint64_t __41__FBKData_fetchFormItemByTat_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actuallyFetchFormItemByTat:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)actuallyFetchFormItemByTat:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FBKData *)self setIsRefreshingForms:1];
  id v8 = [(FBKData *)self defaultTeam];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke;
  v11[3] = &unk_264876390;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(FBKData *)self takeMainQueueObject:v8 andContinueWithPrivateQueueObject:v11];
}

void __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_2;
  v5[3] = &unk_2648745B0;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  [v3 _refreshFormItemsForTeam:a2 formTat:v4 withCompletion:v5];
}

void __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_3;
  block[3] = &unk_264874388;
  uint64_t v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_3(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setIsRefreshingForms:0];
  uint64_t v2 = [*(id *)(a1 + 32) currentUser];
  [v2 setDidFetchFormStubs:1];

  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) mainQueueContext];
    id v6 = [*(id *)(a1 + 32) currentUser];
    [v5 refreshObject:v6 mergeChanges:1];

    id v7 = [*(id *)(a1 + 32) currentUser];
    id v8 = [v7 bugFormStubs];

    if (v8)
    {
      id v14 = @"formsOrError";
      id v9 = [*(id *)(a1 + 32) currentUser];
      id v10 = [v9 bugFormStubs];
      v15[0] = v10;
      id v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

      id v12 = [*(id *)(a1 + 32) notificationCenter];
      [v12 postNotificationName:@"FBKDidRefreshFormStubsNotification" object:*(void *)(a1 + 32) userInfo:v11];

      uint64_t v13 = *(void *)(a1 + 48);
      if (v13) {
        (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
      }
    }
  }
}

- (void)feedbackFrameworkLoadDataWithFormTat:(id)a3 orFormID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "Loading data for Form Preview", (uint8_t *)buf, 2u);
    }

    id v12 = objc_initWeak(buf, self);
    id WeakRetained = objc_loadWeakRetained(buf);
    id v14 = [WeakRetained currentUser];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke;
    v15[3] = &unk_2648763B8;
    objc_copyWeak(&v18, buf);
    id v17 = v10;
    id v16 = v9;
    [(FBKData *)self takeMainQueueObject:v14 andContinueWithPrivateQueueObject:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
  else
  {
    [(FBKData *)self reloadDataSkippingContentItems:1 reloadsTeams:0 formTat:v8 completion:v10];
  }
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained privateQueueContext];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFF280]);
    id v7 = +[FBKBugFormStub entity];
    id v8 = (void *)[v6 initWithEntity:v7 insertIntoManagedObjectContext:v5];

    [v8 setID:*(void *)(a1 + 32)];
    [v8 setName:@"Form Preview"];
    id v9 = +[FBKGroupedDevice currentDevicePlatform];
    [v8 setPlatform:v9];

    [v8 setUser:v3];
    id v23 = 0;
    [v5 save:&v23];
    id v10 = v23;
    if (v10)
    {
      id v11 = +[FBKLog data];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_3();
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_113;
      block[3] = &unk_2648741D0;
      id v22 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);
      id v12 = v22;
    }
    else
    {
      id v14 = objc_loadWeakRetained((id *)(a1 + 48));
      id v12 = [v14 mainQueueObjectFromPrivate:v8];

      id v15 = +[FBKLog data];
      id v16 = v15;
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v27 = v12;
          _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_INFO, "Inserted BugFormStub: %{public}@", buf, 0xCu);
        }

        id v17 = v19;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        id v18 = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_115;
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_2();
        }

        id v17 = v20;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        id v18 = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_114;
      }
      v17[2] = v18;
      v17[3] = &unk_2648741D0;
      void v17[4] = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], v17);
    }
  }
  else
  {
    uint64_t v13 = +[FBKLog data];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_1();
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_106;
    v24[3] = &unk_2648741D0;
    id v25 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v24);
    id v8 = v25;
  }
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_106(uint64_t a1)
{
  FBKErrorOfType(-1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_113(uint64_t a1)
{
  FBKErrorOfType(-1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_114(uint64_t a1)
{
  FBKErrorOfType(-1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isReloadingApp
{
  if ([(FBKData *)self isRefreshingForms]
    || [(FBKData *)self isRefreshingTeams])
  {
    return 1;
  }

  return [(FBKData *)self isRefreshingContent];
}

- (void)reloadDataSkippingContentItems:(BOOL)a3 reloadsTeams:(BOOL)a4 formTat:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(FBKData *)self currentUser];

  if (v12)
  {
    if ([(FBKData *)self isRefreshingTeams])
    {
      uint64_t v13 = Log_5();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v14 = "is refreshing teams in FBKData, cannot refresh again.";
LABEL_13:
        _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      }
    }
    else if ([(FBKData *)self isRefreshingContent])
    {
      uint64_t v13 = Log_5();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v14 = "is refreshing content in FBKData, cannot refresh again.";
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v15 = [(FBKData *)self isRefreshingForms];
      uint64_t v13 = Log_5();
      BOOL v16 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          id v14 = "is refreshing forms in FBKData, cannot refresh again.";
          goto LABEL_13;
        }
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "Reloading teams, content items, forms.", buf, 2u);
        }

        uint64_t v13 = dispatch_group_create();
        dispatch_group_t v17 = dispatch_group_create();
        dispatch_group_t v18 = dispatch_group_create();
        id v19 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
        id v20 = +[FBKTimeIntervals sharedInstance];
        [v20 willStartEvent:9 context:0];
        [v20 willStartEvent:7 context:0];
        if (v7)
        {
          dispatch_group_enter(v13);
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke;
          v33[3] = &unk_2648763E0;
          id v34 = v19;
          v35 = v13;
          [(FBKData *)self refreshTeamsWithCompletion:v33];
        }
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_2;
        v25[3] = &unk_264876458;
        BOOL v32 = a3;
        v25[4] = self;
        dispatch_group_t v26 = v18;
        id v27 = v19;
        dispatch_group_t v28 = v17;
        id v29 = v10;
        id v30 = v20;
        id v31 = v11;
        id v21 = v20;
        id v22 = v17;
        id v23 = v19;
        __int16 v24 = v18;
        dispatch_group_notify(v13, MEMORY[0x263EF83A0], v25);
      }
    }
  }
  else
  {
    uint64_t v13 = Log_5();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FBKData reloadDataSkippingContentItems:reloadsTeams:formTat:completion:]();
    }
  }
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsRefreshingForms:1];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentUser];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_3;
  v5[3] = &unk_264876430;
  uint64_t v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 88);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  [v2 takeMainQueueObject:v3 andContinueWithPrivateQueueObject:v5];
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) privateQueueContext];
  id v5 = +[FBKTeam personalTeamForUser:v3 inContext:v4];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  dispatch_group_t v17 = v3;
  id obj = [v3 teams];
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * v9);
        if (!*(unsigned char *)(a1 + 88))
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          id v11 = *(void **)(a1 + 32);
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_4;
          v29[3] = &unk_2648763E0;
          id v30 = *(id *)(a1 + 48);
          id v31 = *(id *)(a1 + 40);
          [v11 _refreshContentItemsForTeam:v10 withCompletion:v29];
        }
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        char v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 64);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_5;
        v25[3] = &unk_264876408;
        id v26 = *(id *)(a1 + 48);
        id v27 = *(id *)(a1 + 56);
        id v28 = *(id *)(a1 + 40);
        [v12 _refreshFormItemsForTeam:v10 formTat:v13 withCompletion:v25];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  id v14 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_6;
  block[3] = &unk_264874270;
  void block[4] = *(void *)(a1 + 32);
  id v24 = *(id *)(a1 + 72);
  BOOL v15 = MEMORY[0x263EF83A0];
  dispatch_group_notify(v14, MEMORY[0x263EF83A0], block);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  _DWORD v19[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_118;
  v19[3] = &unk_264874400;
  BOOL v16 = *(NSObject **)(a1 + 40);
  v19[4] = *(void *)(a1 + 32);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 72);
  id v22 = *(id *)(a1 + 80);
  dispatch_group_notify(v16, v15, v19);
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v3 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v3);
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_6(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setIsRefreshingForms:0];
  id v2 = [*(id *)(a1 + 32) currentUser];
  [v2 setDidFetchFormStubs:1];

  id v3 = Log_5();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "Did reload all Form Items", v13, 2u);
  }

  [*(id *)(a1 + 32) purgeOrphanedForms];
  uint64_t v4 = [*(id *)(a1 + 32) currentUser];
  id v5 = [v4 bugFormStubs];

  if (v5)
  {
    id v14 = @"formsOrError";
    uint64_t v6 = [*(id *)(a1 + 32) currentUser];
    uint64_t v7 = [v6 bugFormStubs];
    v15[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

    id v9 = (id)[*(id *)(a1 + 40) didEndEvent:7];
    uint64_t v10 = [*(id *)(a1 + 32) notificationCenter];
    [v10 postNotificationName:@"FBKDidRefreshFormStubsNotification" object:*(void *)(a1 + 32) userInfo:v8];

    id v11 = [*(id *)(a1 + 32) formReloadCompletion];

    if (v11)
    {
      char v12 = [*(id *)(a1 + 32) formReloadCompletion];
      v12[2]();

      [*(id *)(a1 + 32) setFormReloadCompletion:0];
    }
  }
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_118(uint64_t a1)
{
  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "Did reload", buf, 2u);
  }

  [*(id *)(a1 + 32) purgeOrphanedEntities];
  id v3 = [*(id *)(a1 + 32) currentUser];
  uint64_t v4 = [v3 managedObjectContext];
  id v5 = [*(id *)(a1 + 32) currentUser];
  [(id)v4 refreshObject:v5 mergeChanges:1];

  uint64_t v6 = [*(id *)(a1 + 32) currentUser];
  LOBYTE(v4) = [v6 isInAnyProgram];

  if ((v4 & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) notificationCenter];
    [v7 postNotificationName:@"FBKUserNoPrograms" object:*(void *)(a1 + 32)];
  }
  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v8 = FBKAggregatedErrorOfType(-1011, *(void **)(a1 + 40));
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [*(id *)(a1 + 48) didEndEvent:9];
  if (v9)
  {
    id v24 = (void *)MEMORY[0x263F3A148];
    uint64_t v10 = [*(id *)(a1 + 32) currentUser];
    id v25 = [v10 contentItems];
    uint64_t v22 = [v25 count];
    id v23 = [*(id *)(a1 + 32) currentUser];
    id v11 = [v23 bugFormStubs];
    uint64_t v12 = [v11 count];
    uint64_t v13 = [*(id *)(a1 + 32) currentUser];
    id v14 = [v13 teams];
    uint64_t v15 = [v14 count];
    uint64_t v16 = [*(id *)(a1 + 40) count];
    [v9 startTimeInterval];
    double v18 = v17;
    [v9 endTimeInterval];
    [v24 logDataLoadWithContentItemCount:v22 formItemsCount:v12 teamCount:v15 errorsCount:v16 startedAt:v18 endedAt:v19];
  }
  else
  {
    uint64_t v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_118_cold_1();
    }
  }

  [*(id *)(a1 + 32) setHasFinishedFirstLoad:1];
  uint64_t v20 = *(void *)(a1 + 56);
  if (v20) {
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v8);
  }
  id v21 = [*(id *)(a1 + 32) notificationCenter];
  [v21 postNotificationName:@"FBKDidReloadAppNotification" object:*(void *)(a1 + 32)];
}

- (void)resetContentAndFormItems
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [(FBKData *)self currentUser];

  if (v3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v4 = [(FBKData *)self currentUser];
    id v5 = [v4 bugFormStubs];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v11 = [v10 bugForm];

          if (v11)
          {
            uint64_t v12 = [(FBKData *)self mainQueueContext];
            uint64_t v13 = [v10 bugForm];
            [v12 deleteObject:v13];
          }
          id v14 = [(FBKData *)self mainQueueContext];
          [v14 deleteObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v15 = [(FBKData *)self currentUser];
    uint64_t v16 = [v15 contentItems];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          uint64_t v22 = [v21 formResponse];

          if (v22)
          {
            id v23 = [(FBKData *)self mainQueueContext];
            id v24 = [v21 formResponse];
            [v23 deleteObject:v24];
          }
          id v25 = [(FBKData *)self mainQueueContext];
          [v25 deleteObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }

    [(FBKData *)self saveToStore:0];
  }
}

- (void)refreshContentItems
{
}

- (void)_refreshContentItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKData *)self currentUser];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__FBKData__refreshContentItemsWithCompletion___block_invoke;
  v7[3] = &unk_264876480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FBKData *)self takeMainQueueObject:v5 andContinueWithPrivateQueueObject:v7];
}

void __46__FBKData__refreshContentItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 privateQueueContext];
  id v5 = +[FBKTeam personalTeamForUser:v4 inContext:v6];

  [v3 _refreshContentItemsForTeam:v5 withCompletion:*(void *)(a1 + 40)];
}

- (void)_refreshContentItemsForTeam:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FBKData *)self setIsRefreshingContent:1];
  id v8 = objc_initWeak(&location, self);
  id v9 = [(FBKData *)self api];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke;
  v11[3] = &unk_2648764A8;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 updateContentItemsForTeam:v6 withCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke_2;
  block[3] = &unk_2648746C0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke_2(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setIsRefreshingContent:0];

  id v4 = objc_loadWeakRetained(v2);
  id v5 = [v4 currentUser];
  [v5 setDidFetchContentItems:1];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      uint64_t v7 = *(void *)(a1 + 32);
    }
    uint64_t v22 = @"contentItemsOrError";
    v23[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v9 = objc_loadWeakRetained(v2);
    id v10 = [v9 notificationCenter];
    id v11 = objc_loadWeakRetained(v2);
    [v10 postNotificationName:@"FBKDidRefreshContentItemsNotification" object:v11 userInfo:v8];
  }
  else
  {
    if (v6)
    {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    else
    {
      id v12 = objc_loadWeakRetained(v2);
      id v13 = [v12 mainQueueContext];
      id v14 = objc_loadWeakRetained(v2);
      uint64_t v15 = [v14 currentUser];
      [v13 refreshObject:v15 mergeChanges:1];
    }
    id v16 = objc_loadWeakRetained(v2);
    uint64_t v17 = [v16 notificationCenter];
    id v18 = objc_loadWeakRetained(v2);
    [v17 postNotificationName:@"FBKLocalDataDidChangeNotification" object:v18];

    id v21 = objc_loadWeakRetained(v2);
    uint64_t v19 = [v21 notificationCenter];
    id v20 = objc_loadWeakRetained(v2);
    [v19 postNotificationName:@"FBKDidRefreshContentItemsNotification" object:v20];
  }
}

- (void)reloadItems:(id)a3 completion:(id)a4
{
}

- (void)_reloadItems:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = Log_5();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    long long v29 = "-[FBKData _reloadItems:retryCount:completion:]";
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  if (a4 < 0x28)
  {
    if ([(FBKData *)self isReloadingApp])
    {
      uint64_t v19 = Log_5();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        long long v29 = "-[FBKData _reloadItems:retryCount:completion:]";
        _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}s while app is reloading. Will try again later", buf, 0xCu);
      }

      dispatch_time_t v20 = dispatch_time(0, 250000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke;
      block[3] = &unk_2648756A8;
      void block[4] = self;
      id v25 = v8;
      unint64_t v27 = a4;
      id v26 = v9;
      dispatch_after(v20, MEMORY[0x263EF83A0], block);

      id v21 = v25;
    }
    else
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke_2;
      v22[3] = &unk_264876480;
      v22[4] = self;
      id v23 = v9;
      [(FBKData *)self takeMainQueueObject:v8 andContinueWithPrivateQueueObject:v22];
      id v21 = v23;
    }
  }
  else
  {
    id v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FBKData _reloadItems:retryCount:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t __46__FBKData__reloadItems_retryCount_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadItems:*(void *)(a1 + 40) retryCount:*(void *)(a1 + 56) + 1 completion:*(void *)(a1 + 48)];
}

void __46__FBKData__reloadItems_retryCount_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke_3;
  v4[3] = &unk_2648745B0;
  void v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _refreshContentItemsForTeam:a2 withCompletion:v4];
}

void __46__FBKData__reloadItems_retryCount_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke_4;
  block[3] = &unk_264874588;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__FBKData__reloadItems_retryCount_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentUser];
  id v3 = [v2 managedObjectContext];
  id v4 = [*(id *)(a1 + 32) currentUser];
  [v3 refreshObject:v4 mergeChanges:1];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:(id)a3
{
  id v4 = a3;
  if (!+[FBKSharedConstants isRunningInFBA])
  {
    uint64_t v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FBKData deleteTargetedSurveyItemFromInboxIfNeeded:]();
    }
    goto LABEL_11;
  }
  if (!v4)
  {
    uint64_t v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FBKData deleteTargetedSurveyItemFromInboxIfNeeded:]();
    }
    goto LABEL_11;
  }
  if (([v4 isTargetedSurvey] & 1) == 0)
  {
    uint64_t v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FBKData deleteTargetedSurveyItemFromInboxIfNeeded:]();
    }
LABEL_11:

    goto LABEL_12;
  }
  id v5 = [(FBKData *)self mainQueueContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke;
  v7[3] = &unk_264874270;
  v7[4] = self;
  id v8 = v4;
  [v5 performBlock:v7];

LABEL_12:
}

void __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mainQueueContext];
  [v2 deleteObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) mainQueueContext];
  id v6 = 0;
  [v3 save:&v6];
  id v4 = v6;

  if (v4)
  {
    id v5 = Log_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke_cold_1();
    }
  }
}

- (void)refreshFormItems
{
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  id v4 = [v3 environment];
  id v5 = [v4 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (v5)
  {
    [(FBKData *)self setIsRefreshingForms:1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v8[2] = __27__FBKData_refreshFormItems__block_invoke;
    v8[3] = &unk_264874E00;
    v8[4] = self;
    [(FBKData *)self _refreshFormItemsWithCompletion:v8];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF498];
    [v6 raise:v7, @"Basic for item refresh is called, but app is not unit testing." format];
  }
}

void __27__FBKData_refreshFormItems__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) setIsRefreshingForms:0];
  id v4 = [*(id *)(a1 + 32) currentUser];
  [v4 setDidFetchFormStubs:1];

  if (v3)
  {
    id v11 = @"formsOrError";
    v12[0] = v3;
    id v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    id v9 = @"formsOrError";
    id v6 = [*(id *)(a1 + 32) currentUser];
    uint64_t v7 = [v6 bugFormStubs];
    id v10 = v7;
    id v5 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  id v8 = [*(id *)(a1 + 32) notificationCenter];
  [v8 postNotificationName:@"FBKDidRefreshFormStubsNotification" object:*(void *)(a1 + 32) userInfo:v5];
}

- (void)_refreshFormItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKData *)self currentUser];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__FBKData__refreshFormItemsWithCompletion___block_invoke;
  v7[3] = &unk_264876480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FBKData *)self takeMainQueueObject:v5 andContinueWithPrivateQueueObject:v7];
}

void __43__FBKData__refreshFormItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 privateQueueContext];
  id v6 = +[FBKTeam personalTeamForUser:v4 inContext:v5];

  [*(id *)(a1 + 32) _refreshFormItemsForTeam:v6 formTat:0 withCompletion:*(void *)(a1 + 40)];
}

- (void)_refreshFormItemsForTeam:(id)a3 formTat:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FBKData _refreshFormItemsForTeam:formTat:withCompletion:]();
    }
  }
  objc_initWeak(&location, self);
  uint64_t v12 = [(FBKData *)self currentUser];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke;
  v16[3] = &unk_264876520;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  [(FBKData *)self takeMainQueueObject:v12 andContinueWithPrivateQueueObject:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) api];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_2;
  v7[3] = &unk_2648764F8;
  id v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v9, (id *)(a1 + 64));
  [v4 updateFormItemsForUser:v3 inTeam:v5 formTat:v6 withCompletion:v7];

  objc_destroyWeak(&v9);
}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3;
  block[3] = &unk_2648764D0;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v9);
}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (void *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = Log_5();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3_cold_1();
    }

    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, *v2);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v6 = [WeakRetained currentUser];
    id v7 = [v6 bugFormStubs];

    id v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v7 count];
      id v10 = objc_loadWeakRetained((id *)(a1 + 48));
      id v11 = [v10 currentUser];
      uint64_t v12 = [v11 ID];
      v14[0] = 67109376;
      v14[1] = v9;
      __int16 v15 = 1024;
      int v16 = [v12 intValue];
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "[%i] bug forms for user [%i]", (uint8_t *)v14, 0xEu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
}

- (void)purgeOrphanedForms
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Does not use persistent store. Skipping Forms purge", v2, v3, v4, v5, v6);
}

uint64_t __29__FBKData_purgeOrphanedForms__block_invoke(uint64_t a1, void *a2)
{
  return [a2 formID];
}

- (void)purgeOrphanedEntities
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Does not use persistent store. Skipping entities purge", v2, v3, v4, v5, v6);
}

void __32__FBKData_purgeOrphanedEntities__block_invoke(uint64_t a1)
{
  uint64_t v172 = *MEMORY[0x263EF8340];
  uint64_t v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "purge orphaned entities start", buf, 2u);
  }

  uint64_t v3 = +[FBKContentItem fetchRequest];
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"teams.@count == 0"];
  [v3 setPredicate:v4];

  [v3 setPropertiesToFetch:&unk_26DE1EF10];
  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained privateQueueContext];
  id v160 = 0;
  v128 = v3;
  id v8 = [v7 executeFetchRequest:v3 error:&v160];
  id v9 = v160;

  if (v9)
  {
    id v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_5();
    }
  }
  v131 = v9;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v156 objects:v171 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v157;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v157 != v13) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v156 + 1) + 8 * i);
        int v16 = +[FBKLog net];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [v15 remoteID];
          int v18 = [v17 intValue];
          *(_DWORD *)buf = 67109120;
          int v164 = v18;
          _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_INFO, "Removing orphan item [%i]", buf, 8u);
        }
        id v19 = objc_loadWeakRetained(v5);
        id v20 = [v19 privateQueueContext];
        [v20 deleteObject:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v156 objects:v171 count:16];
    }
    while (v12);
  }

  id v21 = +[FBKFilePredicate fetchRequest];
  uint64_t v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"bugForms.@count == 0"];
  [v21 setPredicate:v22];

  id v23 = objc_loadWeakRetained(v5);
  id v24 = [v23 privateQueueContext];
  id v155 = 0;
  v127 = v21;
  id v25 = [v24 executeFetchRequest:v21 error:&v155];
  id v26 = v155;

  if (v26)
  {
    unint64_t v27 = Log_5();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_4();
    }
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v133 = v25;
  uint64_t v28 = [v133 countByEnumeratingWithState:&v151 objects:v170 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v152;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v152 != v30) {
          objc_enumerationMutation(v133);
        }
        long long v32 = *(void **)(*((void *)&v151 + 1) + 8 * j);
        long long v33 = Log_5();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          long long v34 = [v32 ID];
          int v35 = [v34 intValue];
          *(_DWORD *)buf = 67109120;
          int v164 = v35;
          _os_log_impl(&dword_22A36D000, v33, OS_LOG_TYPE_DEFAULT, "Deleting orphan Predicate [%i]", buf, 8u);
        }
        id v36 = objc_loadWeakRetained(v5);
        uint64_t v37 = [v36 privateQueueContext];
        [v37 deleteObject:v32];
      }
      uint64_t v29 = [v133 countByEnumeratingWithState:&v151 objects:v170 count:16];
    }
    while (v29);
  }

  v38 = +[FBKFileMatcher fetchRequest];
  v39 = [MEMORY[0x263F08A98] predicateWithFormat:@"filePredicates.@count == 0"];
  v169[0] = v39;
  v40 = [MEMORY[0x263F08A98] predicateWithFormat:@"feedbackFollowups.@count == 0"];
  v169[1] = v40;
  uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v169 count:2];

  v125 = (void *)v41;
  v124 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:v41];
  objc_msgSend(v38, "setPredicate:");
  id v42 = objc_loadWeakRetained(v5);
  v43 = [v42 privateQueueContext];
  id v150 = 0;
  v126 = v38;
  v44 = [v43 executeFetchRequest:v38 error:&v150];
  id v45 = v150;

  if (v45)
  {
    v46 = Log_5();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_3();
    }
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v132 = v44;
  uint64_t v47 = [v132 countByEnumeratingWithState:&v146 objects:v168 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v147;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v147 != v49) {
          objc_enumerationMutation(v132);
        }
        v51 = *(void **)(*((void *)&v146 + 1) + 8 * k);
        v52 = Log_5();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [v51 ID];
          int v54 = [v53 intValue];
          *(_DWORD *)buf = 67109120;
          int v164 = v54;
          _os_log_impl(&dword_22A36D000, v52, OS_LOG_TYPE_DEFAULT, "Deleting orphan FileMatcher [%i]", buf, 8u);
        }
        id v55 = objc_loadWeakRetained(v5);
        v56 = [v55 privateQueueContext];
        [v56 deleteObject:v51];
      }
      uint64_t v48 = [v132 countByEnumeratingWithState:&v146 objects:v168 count:16];
    }
    while (v48);
  }

  v57 = +[FBKFormResponse fetchRequest];
  [v57 setPropertiesToFetch:&unk_26DE1EF28];
  v58 = [MEMORY[0x263F08A98] predicateWithFormat:@"contentItem == nil"];
  [v57 setPredicate:v58];

  id v59 = objc_loadWeakRetained(v5);
  v60 = [v59 privateQueueContext];
  id v145 = 0;
  v123 = v57;
  v61 = [v60 executeFetchRequest:v57 error:&v145];
  id v62 = v145;

  v129 = v61;
  if ([v61 count])
  {
    id v122 = v62;
    id v63 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v63 setHour:-1];
    v64 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v65 = objc_alloc_init(MEMORY[0x263EFF910]);
    v121 = v63;
    v66 = [v64 dateByAddingComponents:v63 toDate:v65 options:0];

    long long v144 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    long long v141 = 0u;
    id v67 = v129;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v141 objects:v167 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v142;
      v71 = &dword_22A36D000;
      do
      {
        uint64_t v72 = 0;
        uint64_t v130 = v69;
        do
        {
          if (*(void *)v142 != v70) {
            objc_enumerationMutation(v67);
          }
          v73 = *(void **)(*((void *)&v141 + 1) + 8 * v72);
          v74 = Log_5();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            v75 = [v73 ID];
            int v76 = [v75 intValue];
            *(_DWORD *)buf = 67109120;
            int v164 = v76;
            _os_log_impl(v71, v74, OS_LOG_TYPE_DEFAULT, "Found orphan FR [%i]", buf, 8u);
          }
          v77 = [v73 createdAt];
          int v78 = [v66 isEarlierThan:v77];

          if (v78)
          {
            v79 = Log_5();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              v80 = [v73 ID];
              v81 = v5;
              uint64_t v82 = v70;
              v83 = v66;
              id v84 = v67;
              v85 = v71;
              int v86 = [v80 intValue];
              v87 = [v73 createdAt];
              *(_DWORD *)buf = 67109378;
              int v164 = v86;
              v71 = v85;
              id v67 = v84;
              v66 = v83;
              uint64_t v70 = v82;
              uint64_t v5 = v81;
              uint64_t v69 = v130;
              __int16 v165 = 2114;
              v166 = v87;
              _os_log_impl(v71, v79, OS_LOG_TYPE_DEFAULT, "Orphan FR [%i] was recently created (%{public}@). Will defer deletion.", buf, 0x12u);
            }
          }
          else
          {
            v79 = objc_loadWeakRetained(v5);
            v88 = [v79 privateQueueContext];
            [v88 deleteObject:v73];
          }
          ++v72;
        }
        while (v69 != v72);
        uint64_t v69 = [v67 countByEnumeratingWithState:&v141 objects:v167 count:16];
      }
      while (v69);
    }

    id v62 = v122;
  }

  v89 = +[FBKParticipant fetchRequest];
  [v89 setPropertiesToFetch:&unk_26DE1EF40];
  v90 = (void *)MEMORY[0x263F08730];
  v91 = [MEMORY[0x263F08A98] predicateWithFormat:@"originatedFeedback.@count == 0"];
  v162[0] = v91;
  v92 = [MEMORY[0x263F08A98] predicateWithFormat:@"assignedFeedback.@count == 0"];
  v162[1] = v92;
  v93 = [MEMORY[0x263F08A98] predicateWithFormat:@"teams.@count == 0"];
  v162[2] = v93;
  v94 = [MEMORY[0x263F08A98] predicateWithFormat:@"followups.@count == 0"];
  v162[3] = v94;
  v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v162 count:4];
  v96 = [v90 andPredicateWithSubpredicates:v95];
  [v89 setPredicate:v96];

  id v97 = objc_loadWeakRetained(v5);
  v98 = [v97 privateQueueContext];
  id v140 = 0;
  v99 = [v98 executeFetchRequest:v89 error:&v140];
  id v100 = v140;

  if (v100)
  {
    v101 = Log_5();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_2();
    }
  }
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v102 = v99;
  uint64_t v103 = [v102 countByEnumeratingWithState:&v136 objects:v161 count:16];
  if (v103)
  {
    uint64_t v104 = v103;
    uint64_t v105 = *(void *)v137;
    do
    {
      for (uint64_t m = 0; m != v104; ++m)
      {
        if (*(void *)v137 != v105) {
          objc_enumerationMutation(v102);
        }
        uint64_t v107 = *(void *)(*((void *)&v136 + 1) + 8 * m);
        id v108 = objc_loadWeakRetained(v5);
        v109 = [v108 privateQueueContext];
        [v109 deleteObject:v107];
      }
      uint64_t v104 = [v102 countByEnumeratingWithState:&v136 objects:v161 count:16];
    }
    while (v104);
  }

  id v110 = objc_loadWeakRetained(v5);
  v111 = [v110 privateQueueContext];
  int v112 = [v111 hasChanges];

  if (v112)
  {
    id v113 = objc_loadWeakRetained(v5);
    v114 = [v113 privateQueueContext];
    id v135 = v100;
    [v114 save:&v135];
    id v115 = v135;

    id v100 = v115;
  }
  if (v100)
  {
    v116 = Log_5();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_1();
    }
  }
  v117 = Log_5();
  if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v117, OS_LOG_TYPE_INFO, "purge orphaned entities end", buf, 2u);
  }

  id v118 = objc_loadWeakRetained(v5);
  v119 = [v118 notificationCenter];
  id v120 = objc_loadWeakRetained(v5);
  [v119 postNotificationName:@"FBKDidPurgeOrphanEntitiesNotification" object:v120];
}

- (id)userForUsername:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__FBKData_userForUsername_inContext___block_invoke;
  v11[3] = &unk_264876590;
  id v7 = v5;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v15;
  [v8 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __37__FBKData_userForUsername_inContext___block_invoke(void *a1)
{
  uint64_t v2 = +[FBKUser fetchRequest];
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"username = %@", a1[4]];
  [v2 setPredicate:v3];

  [v2 setReturnsObjectsAsFaults:0];
  uint64_t v4 = (void *)a1[5];
  id v11 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v11];
  id v6 = v11;
  if (v5 && [v5 count])
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

- (id)userForUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKData *)self mainQueueContext];
  id v6 = [(FBKData *)self userForUsername:v4 inContext:v5];

  return v6;
}

- (void)refreshUnreadCountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKData *)self loginManager];
  uint64_t v6 = [v5 loginState];

  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [(FBKData *)self mainQueueContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v8[2] = __44__FBKData_refreshUnreadCountWithCompletion___block_invoke;
    v8[3] = &unk_2648762F0;
    v8[4] = self;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v7 performBlock:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __44__FBKData_refreshUnreadCountWithCompletion___block_invoke(id *a1)
{
  uint64_t v2 = +[FBKContentItem fetchRequest];
  uint64_t v3 = [a1[4] currentUser];
  id v4 = +[FBKContentItem unreadContentItemsPredicateForUser:v3];
  [v2 setPredicate:v4];

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v6 = [WeakRetained mainQueueContext];
  id v14 = 0;
  uint64_t v7 = [v6 countForFetchRequest:v2 error:&v14];
  id v8 = v14;

  if (v8)
  {
    id v9 = +[FBKLog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_cold_1();
    }
  }
  if (a1[5])
  {
    id v10 = [a1[4] mainQueueContext];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_194;
    v11[3] = &unk_2648765B8;
    id v12 = a1[5];
    uint64_t v13 = v7;
    [v10 performBlockAndWait:v11];
  }
}

uint64_t __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_194(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)updateResolversForLocalBugForms
{
  uint64_t v3 = +[FBKBugForm fetchRequest];
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"active = YES"];
  [v3 setPredicate:v4];

  id v5 = objc_initWeak(&location, self);
  uint64_t v6 = [(FBKData *)self privateQueueContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  id v8[2] = __42__FBKData_updateResolversForLocalBugForms__block_invoke;
  v8[3] = &unk_2648765E0;
  objc_copyWeak(&v10, &location);
  id v7 = v3;
  id v9 = v7;
  [v6 performBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __42__FBKData_updateResolversForLocalBugForms__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained privateQueueContext];
  id v5 = [v4 executeFetchRequest:*(void *)(a1 + 32) error:0];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v10++) updateResolvableQuestions];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v11 = objc_loadWeakRetained(v2);
  id v12 = [v11 privateQueueContext];
  id v15 = 0;
  [v12 save:&v15];
  id v13 = v15;

  if (v13)
  {
    id v14 = Log_5();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __42__FBKData_updateResolversForLocalBugForms__block_invoke_cold_1();
    }
  }
}

- (void)refreshBugFormWithID:(id)a3 fromStub:(id)a4 forTeam:(id)a5 completion:(id)a6
{
}

- (void)refreshBugFormWithID:(id)a3 fromStub:(id)a4 forTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_initWeak(&location, self);
  id v20 = [(FBKData *)self mainQueueContext];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke;
  v27[3] = &unk_264876630;
  id v21 = v15;
  id v28 = v21;
  objc_copyWeak(&v35, &location);
  id v22 = v14;
  id v29 = v22;
  id v23 = v19;
  id v34 = v23;
  uint64_t v30 = self;
  id v24 = v16;
  id v31 = v24;
  id v25 = v17;
  id v32 = v25;
  id v26 = v18;
  id v33 = v26;
  [v20 performBlock:v27];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) bugForm];
  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    id v4 = [WeakRetained mainQueueContext];
    id v5 = +[FBKBugForm entityName];
    id v2 = [v4 findFeedbackObjectWithEntityName:v5 remoteID:*(void *)(a1 + 40)];
  }
  id v6 = *(void **)(a1 + 32);
  if (v6
    && ([v6 bugForm], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, !v7)
    && v2)
  {
    [*(id *)(a1 + 32) setBugForm:v2];
    id v8 = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v9 = [v8 mainQueueContext];
    id v45 = 0;
    [v9 save:&v45];
    id v10 = v45;

    if (v10)
    {
      id v11 = Log_5();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(v2);
      }
    }
  }
  else if (!v2)
  {
LABEL_28:
    if ([*(id *)(a1 + 56) teamType])
    {
      id v21 = [*(id *)(a1 + 56) ID];
    }
    else
    {
      id v21 = 0;
    }
    id v28 = objc_loadWeakRetained((id *)(a1 + 88));
    id v29 = [v28 api];
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 64);
    uint64_t v32 = *(void *)(a1 + 72);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_199;
    v38[3] = &unk_264876608;
    objc_copyWeak(&v41, (id *)(a1 + 88));
    id v40 = *(id *)(a1 + 80);
    id v39 = *(id *)(a1 + 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_201;
    v34[3] = &unk_2648742C0;
    id v35 = *(id *)(a1 + 40);
    id v33 = *(id *)(a1 + 80);
    uint64_t v36 = *(void *)(a1 + 48);
    id v37 = v33;
    [v29 fetchBugFormWithID:v30 forTeamID:v21 requestPlugIns:v31 appToken:v32 success:v38 error:v34];

    objc_destroyWeak(&v41);
    id v2 = 0;
    goto LABEL_32;
  }
  id v12 = [v2 questionGroups];
  BOOL v13 = [v12 count] == 0;

  if (v13)
  {
    id v22 = Log_5();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_27:

      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    id v23 = "Bug form has no question groups, fetching from server.";
    id v24 = v22;
    os_log_type_t v25 = OS_LOG_TYPE_INFO;
LABEL_26:
    _os_log_impl(&dword_22A36D000, v24, v25, v23, buf, 2u);
    goto LABEL_27;
  }
  int v14 = [v2 matchesFormStubSignature:*(void *)(a1 + 32)];
  id v15 = Log_5();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      id v26 = [v2 signatureDescription];
      unint64_t v27 = [*(id *)(a1 + 32) signatureDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v26;
      __int16 v48 = 2114;
      uint64_t v49 = v27;
      _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] does not match [%{public}@]", buf, 0x16u);
    }
    id v22 = Log_5();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    id v23 = "Cache signature mismatch, will fetch form from server.";
    id v24 = v22;
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_26;
  }
  if (v16)
  {
    id v17 = [v2 signatureDescription];
    id v18 = [*(id *)(a1 + 32) signatureDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v47 = v17;
    __int16 v48 = 2114;
    uint64_t v49 = v18;
    _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] matches [%{public}@]", buf, 0x16u);
  }
  id v19 = Log_5();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "Proceeding with cached form.", buf, 2u);
  }

  if (*(void *)(a1 + 80))
  {
    id v20 = [*(id *)(a1 + 48) mainQueueContext];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_198;
    v42[3] = &unk_2648741F8;
    id v44 = *(id *)(a1 + 80);
    id v2 = v2;
    id v43 = v2;
    [v20 performBlockAndWait:v42];

    id v21 = v44;
LABEL_32:
  }
}

uint64_t __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_198(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_199(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_2;
  aBlock[3] = &unk_2648746C0;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  id v4 = v3;
  id v13 = v4;
  id v14 = *(id *)(a1 + 40);
  id v5 = _Block_copy(aBlock);
  id v6 = v5;
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4;
    v9[3] = &unk_264876480;
    id v10 = v4;
    id v11 = v6;
    [WeakRetained takeMainQueueObject:v8 andContinueWithPrivateQueueObject:v9];
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }

  objc_destroyWeak(&v15);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_2(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [WeakRetained mainQueueContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_3;
  v5[3] = &unk_2648746C0;
  objc_copyWeak(&v8, v2);
  id v6 = a1[4];
  id v7 = a1[5];
  [v4 performBlock:v5];

  objc_destroyWeak(&v8);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained mainQueueObjectFromPrivate:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
  }
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setStub:v3];
  id v5 = [*(id *)(a1 + 32) signature];
  if (v5)
  {
    [*v4 setSignature:v5];
  }
  else
  {
    id v6 = [v3 signature];
    [*v4 setSignature:v6];
  }
  id v7 = [*v4 managedObjectContext];
  id v10 = 0;
  [v7 save:&v10];
  id v8 = v10;

  if (v8)
  {
    uint64_t v9 = Log_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4_cold_1((id *)(a1 + 32));
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_201(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_201_cold_1();
  }

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_202;
    v6[3] = &unk_2648741F8;
    id v8 = *(id *)(a1 + 48);
    id v7 = v3;
    [v5 performBlockAndWait:v6];
  }
}

uint64_t __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)closeFeedbackItems:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v16 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
        dispatch_group_enter(v8);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __41__FBKData_closeFeedbackItems_completion___block_invoke;
        v22[3] = &unk_2648763E0;
        id v23 = v7;
        id v24 = v8;
        [(FBKData *)self _closeFeedbackItem:v13 completion:v22];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__FBKData_closeFeedbackItems_completion___block_invoke_2;
  block[3] = &unk_264874388;
  id v19 = v7;
  id v20 = self;
  id v21 = v16;
  id v14 = v16;
  id v15 = v7;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], block);
}

void __41__FBKData_closeFeedbackItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __41__FBKData_closeFeedbackItems_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(a1 + 32)];
    id v3 = FBKAggregatedErrorOfType(-1009, v2);

    id v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing all content, encountered error on close: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) reloadAllContentWithCompletion:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) notificationCenter];
    [v6 postNotificationName:@"FBKLocalDataDidChangeNotification" object:*(void *)(a1 + 40)];

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

- (void)_closeFeedbackItem:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = Log_5();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 shortDescription];
    *(_DWORD *)buf = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Closing feedback [%{public}@]", buf, 0xCu);
  }
  uint64_t v10 = [(FBKData *)self api];
  uint64_t v11 = [v6 ID];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__FBKData__closeFeedbackItem_completion___block_invoke;
  v13[3] = &unk_2648743D8;
  id v14 = v7;
  id v12 = v7;
  [v10 closeFeedbackItemWithID:v11 withCompletion:v13];
}

void __41__FBKData__closeFeedbackItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__FBKData__closeFeedbackItem_completion___block_invoke_2;
  v6[3] = &unk_2648741F8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __41__FBKData__closeFeedbackItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)newFormResponseForBugFormStub:(id)a3 inTeam:(id)a4 completion:(id)a5
{
}

- (void)newFormResponseForBugFormStub:(id)a3 inTeam:(id)a4 requestPlugIns:(id)a5 appToken:(id)a6 completion:(id)a7
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v12 ID];
    v20[0] = 67109120;
    v20[1] = [v18 intValue];
    _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_DEFAULT, "new form response for bug form stub [%d]", (uint8_t *)v20, 8u);
  }
  id v19 = [v12 ID];
  [(FBKData *)self _newFormResponseForBugFormID:v19 formStub:v12 inTeam:v16 requestPlugIns:v15 appToken:v14 completion:v13];
}

- (void)newFormResponseForBugForm:(id)a3 inTeam:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 ID];
    v14[0] = 67109120;
    v14[1] = [v12 intValue];
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "new form response for bug form [%d]", (uint8_t *)v14, 8u);
  }
  id v13 = [v8 ID];
  [(FBKData *)self _newFormResponseForBugFormID:v13 formStub:0 inTeam:v10 requestPlugIns:0 appToken:0 completion:v9];
}

- (void)_newFormResponseForBugFormID:(id)a3 formStub:(id)a4 inTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke;
  v24[3] = &unk_2648766D0;
  id v20 = v14;
  id v25 = v20;
  id v21 = v19;
  id v29 = v21;
  long long v26 = self;
  id v22 = v16;
  id v27 = v22;
  objc_copyWeak(&v30, &location);
  id v23 = v18;
  id v28 = v23;
  [(FBKData *)self refreshBugFormWithID:v20 fromStub:v15 forTeam:v22 requestPlugIns:v17 appToken:v23 completion:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = [*(id *)(a1 + 48) ID];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_2;
    v15[3] = &unk_2648766A8;
    objc_copyWeak(&v20, (id *)(a1 + 72));
    id v10 = v8;
    id v16 = v10;
    id v17 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    int8x16_t v14 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v14.i64[0];
    int8x16_t v18 = vextq_s8(v14, v14, 8uLL);
    [WeakRetained takeMainQueueObject:v5 andContinueWithPrivateQueueObject:v15];

    objc_destroyWeak(&v20);
LABEL_8:

    goto LABEL_9;
  }
  id v12 = Log_5();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(a1);
  }

  if (*(void *)(a1 + 64))
  {
    id v13 = [*(id *)(a1 + 40) mainQueueContext];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_203;
    v21[3] = &unk_2648741F8;
    id v23 = *(id *)(a1 + 64);
    id v22 = v7;
    [v13 performBlockAndWait:v21];

    id v10 = v23;
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_203(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 stub];
  id v5 = [v4 user];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = [WeakRetained privateQueueContext];
  id v24 = +[FBKTeam personalTeamForUser:v5 inContext:v7];

  id v8 = [v3 surveyContentItem];
  if (v8) {
    [v3 surveyContentItem];
  }
  else {
  id v9 = [v3 stub];
  }
  id v10 = [v9 teams];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v16 = [v15 ID];
        int v17 = [v16 isEqualToNumber:*(void *)(a1 + 32)];

        if (v17)
        {
          id v18 = v15;

          id v24 = v18;
          goto LABEL_14;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  id v19 = objc_loadWeakRetained((id *)(a1 + 72));
  id v20 = [v19 api];
  uint64_t v21 = *(void *)(a1 + 40);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_3;
  v29[3] = &unk_264876680;
  id v22 = *(id *)(a1 + 64);
  void v29[4] = *(void *)(a1 + 48);
  id v30 = v22;
  objc_copyWeak(&v31, (id *)(a1 + 72));
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5;
  v25[3] = &unk_2648742C0;
  id v26 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  uint64_t v27 = *(void *)(a1 + 48);
  id v28 = v23;
  [v20 createFormResponseForBugForm:v3 inTeam:v24 appToken:v21 success:v29 error:v25];

  objc_destroyWeak(&v31);
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (a1[5])
  {
    id v4 = [a1[4] mainQueueContext];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_4;
    v5[3] = &unk_264876658;
    id v7 = a1[5];
    objc_copyWeak(&v8, a1 + 6);
    id v6 = v3;
    [v4 performBlockAndWait:v5];

    objc_destroyWeak(&v8);
  }
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained mainQueueObjectFromPrivate:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5_cold_1(a1);
  }

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_205;
    v6[3] = &unk_2648741F8;
    id v8 = *(id *)(a1 + 48);
    id v7 = v3;
    [v5 performBlockAndWait:v6];
  }
}

uint64_t __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_205(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)refreshFormResponseFromContentItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 ID];
  [(FBKData *)self refreshFormResponseWithID:v8 contentItem:v7 completion:v6];
}

- (void)refreshFormResponse:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 ID];
  id v8 = [v7 contentItem];

  [(FBKData *)self refreshFormResponseWithID:v9 contentItem:v8 completion:v6];
}

- (void)refreshFormResponseOnlyWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FBKData *)self api];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke;
  v15[3] = &unk_264876720;
  objc_copyWeak(&v17, &location);
  void v15[4] = self;
  id v16 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_208;
  v11[3] = &unk_2648742C0;
  id v9 = v6;
  id v12 = v9;
  id v10 = v16;
  uint64_t v13 = self;
  id v14 = v10;
  [v8 updateFormResponseWithID:v9 success:v15 error:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = [WeakRetained privateQueueContext];
  int v6 = [v5 hasChanges];

  if (!v6) {
    goto LABEL_7;
  }
  id v7 = objc_loadWeakRetained(a1 + 6);
  id v8 = [v7 privateQueueContext];
  id v25 = 0;
  [v8 save:&v25];
  id v9 = v25;

  if (!v9)
  {
LABEL_7:
    uint64_t v13 = [a1[4] mainQueueObjectFromPrivate:v3];
    id v14 = objc_loadWeakRetained(a1 + 6);
    id v15 = [v14 mainQueueContext];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    _DWORD v20[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2;
    v20[3] = &unk_2648766F8;
    objc_copyWeak(&v24, a1 + 6);
    id v12 = v13;
    id v21 = v12;
    id v16 = a1[5];
    id v22 = a1[4];
    id v23 = v16;
    [v15 performBlock:v20];

    objc_destroyWeak(&v24);
    id v9 = 0;
    goto LABEL_8;
  }
  id v10 = Log_5();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_cold_1(v9);
  }

  if (a1[5])
  {
    id v11 = [a1[4] mainQueueContext];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_207;
    v17[3] = &unk_2648741F8;
    id v19 = a1[5];
    id v9 = v9;
    id v18 = v9;
    [v11 performBlockAndWait:v17];

    id v12 = v19;
LABEL_8:
  }
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = [WeakRetained mainQueueContext];
  [v3 refreshObject:a1[4] mergeChanges:1];

  if (a1[6])
  {
    id v4 = [a1[5] mainQueueContext];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_3;
    v5[3] = &unk_2648741F8;
    id v7 = a1[6];
    id v6 = a1[4];
    [v4 performBlockAndWait:v5];
  }
}

uint64_t __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_207(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_208(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_208_cold_1();
  }

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_209;
    v6[3] = &unk_2648741F8;
    id v8 = *(id *)(a1 + 48);
    id v7 = v3;
    [v5 performBlockAndWait:v6];
  }
}

uint64_t __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_209(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)refreshFormResponseWithID:(id)a3 contentItem:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v8 intValue];
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_INFO, "refreshing form response [%i]", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  id v12 = [v9 singleTeam];
  uint64_t v13 = [(FBKData *)self api];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke;
  v22[3] = &unk_2648767E8;
  objc_copyWeak(&v28, &buf);
  id v14 = v12;
  id v23 = v14;
  id v24 = v8;
  id v27 = v10;
  id v25 = self;
  id v15 = v9;
  id v26 = v15;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_5;
  v18[3] = &unk_2648742C0;
  id v16 = v24;
  id v19 = v16;
  id v17 = v27;
  id v20 = self;
  id v21 = v17;
  [v13 updateFormResponseWithID:v16 success:v22 error:v18];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&buf);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = [v3 formID];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2;
  v10[3] = &unk_2648766D0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  id v15 = v7;
  uint64_t v12 = v8;
  id v9 = v3;
  id v13 = v9;
  objc_copyWeak(&v16, (id *)(a1 + 72));
  id v14 = *(id *)(a1 + 56);
  [WeakRetained refreshBugFormWithID:v5 fromStub:0 forTeam:v6 completion:v10];

  objc_destroyWeak(&v16);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_211;
    aBlock[3] = &unk_264876798;
    id v26 = *(id *)(a1 + 48);
    objc_copyWeak(&v31, (id *)(a1 + 72));
    id v27 = v5;
    id v28 = 0;
    id v8 = *(id *)(a1 + 64);
    uint64_t v29 = *(void *)(a1 + 40);
    id v30 = v8;
    id v9 = _Block_copy(aBlock);
    uint64_t v10 = *(void *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v12 = WeakRetained;
    if (v10)
    {
      uint64_t v13 = *(void *)(a1 + 56);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      void v23[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_220;
      v23[3] = &unk_2648767C0;
      id v24 = v9;
      [v12 takeMainQueueObject:v13 andContinueWithPrivateQueueObject:v23];
      id v14 = &v24;
    }
    else
    {
      id v18 = WeakRetained;
      id v19 = [v18 currentUser];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      _DWORD v20[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_3;
      v20[3] = &unk_264876480;
      id v21 = *(id *)(a1 + 48);
      id v22 = v9;
      [v18 takeMainQueueObject:v19 andContinueWithPrivateQueueObject:v20];
      id v14 = &v21;

      uint64_t v12 = v22;
    }
    id v17 = &v26;

    objc_destroyWeak(&v31);
    goto LABEL_11;
  }
  id v15 = Log_5();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_cold_1();
  }

  if (*(void *)(a1 + 64))
  {
    id v16 = [*(id *)(a1 + 40) mainQueueContext];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_210;
    v32[3] = &unk_2648741F8;
    id v17 = &v34;
    id v34 = *(id *)(a1 + 64);
    id v33 = v7;
    [v16 performBlockAndWait:v32];

LABEL_11:
  }
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_210(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_211(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 setFormResponse:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = Log_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_211_cold_1(a1);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_212;
  v9[3] = &unk_264876770;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  objc_copyWeak(&v15, (id *)(a1 + 72));
  id v12 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = v8;
  [WeakRetained takeMainQueueObject:v7 andContinueWithPrivateQueueObject:v9];

  objc_destroyWeak(&v15);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_212(id *a1, void *a2)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v46 = a2;
  objc_msgSend(a1[4], "setBugForm:");
  id v44 = a1 + 5;
  id v45 = a1[5];
  v52 = a1;
  id v3 = [a1[4] answers];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v72 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        id v9 = Log_5();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = [v8 questionID];
          id v14 = [v8 values];
          *(_DWORD *)id buf = 138412546;
          int v78 = v13;
          __int16 v79 = 2112;
          v80 = v14;
          _os_log_debug_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEBUG, "Existing Answer [%@] -> values: [%@]", buf, 0x16u);
        }
        id v10 = [v8 questionID];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          id v12 = Log_5();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)id buf = 138543362;
            int v78 = v8;
            _os_log_fault_impl(&dword_22A36D000, v12, OS_LOG_TYPE_FAULT, "FBKAnswer [%{public}@] has nil questionID", buf, 0xCu);
          }
        }
        else
        {
          id v12 = [v8 questionID];
          [v4 setObject:v8 forKeyedSubscript:v12];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v5);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v47 = [v46 questionGroups];
  uint64_t v49 = [v47 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v68;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v68 != v48)
        {
          uint64_t v16 = v15;
          objc_enumerationMutation(v47);
          uint64_t v15 = v16;
        }
        uint64_t v50 = v15;
        id v17 = *(void **)(*((void *)&v67 + 1) + 8 * v15);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v18 = [v17 questions];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v75 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v64 != v20) {
                objc_enumerationMutation(v18);
              }
              id v22 = *(void **)(*((void *)&v63 + 1) + 8 * j);
              id v23 = [v22 ID];
              id v24 = [v4 objectForKeyedSubscript:v23];

              if (v24)
              {
                id v25 = [v22 answers];
                id v26 = v25;
                if (v25) {
                  id v27 = v25;
                }
                else {
                  id v27 = (id)objc_opt_new();
                }
                uint64_t v29 = v27;

                id v30 = [v29 setByAddingObject:v24];
                [v22 setAnswers:v30];
              }
              else
              {
                id v28 = +[FBKAnswer emptyLocalAnswerForQuestion:v22 inFormResponse:v52[4]];
              }
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v75 count:16];
          }
          while (v19);
        }

        uint64_t v15 = v50 + 1;
      }
      while (v50 + 1 != v49);
      uint64_t v49 = [v47 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v49);
  }

  id v31 = v52 + 9;
  id WeakRetained = objc_loadWeakRetained(v52 + 9);
  id v33 = [WeakRetained privateQueueContext];
  int v34 = [v33 hasChanges];

  if (v34)
  {
    id v35 = objc_loadWeakRetained(v31);
    uint64_t v36 = [v35 privateQueueContext];
    id v62 = v45;
    [v36 save:&v62];
    id v37 = v62;
  }
  else
  {
    id v37 = v45;
  }
  v38 = v37;
  if (v37)
  {
    id v39 = Log_5();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_212_cold_1(v46, v44, v39);
    }

    if (v52[8])
    {
      id v40 = [v52[7] mainQueueContext];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_218;
      v53[3] = &unk_2648741F8;
      id v55 = v52[8];
      id v54 = v37;
      [v40 performBlockAndWait:v53];
    }
  }
  else
  {
    id v41 = objc_loadWeakRetained(v31);
    id v42 = [v41 mainQueueContext];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_216;
    v56[3] = &unk_264876748;
    objc_copyWeak(&v61, v31);
    id v57 = v52[4];
    id v58 = v52[6];
    id v43 = v52[8];
    id v59 = v52[7];
    id v60 = v43;
    [v42 performBlock:v56];

    objc_destroyWeak(&v61);
  }
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_216(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [WeakRetained mainQueueObjectFromPrivate:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 mainQueueContext];
  [v6 refreshObject:v4 mergeChanges:1];

  id v7 = objc_loadWeakRetained(v2);
  id v8 = [v7 mainQueueContext];
  [v8 refreshObject:*(void *)(a1 + 40) mergeChanges:1];

  if (*(void *)(a1 + 56))
  {
    id v9 = [*(id *)(a1 + 48) mainQueueContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_217;
    v10[3] = &unk_2648741F8;
    id v12 = *(id *)(a1 + 56);
    id v11 = v4;
    [v9 performBlockAndWait:v10];
  }
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_217(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_218(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_220(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 formResponseContentItems];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_4;
  v5[3] = &unk_264876118;
  id v6 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "ded_findWithBlock:", v5);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 ID];
  id v4 = [*(id *)(a1 + 32) ID];
  uint64_t v5 = [v3 isEqualToNumber:v4];

  return v5;
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      uint64_t v5 = [*(id *)(a1 + 40) mainQueueContext];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_222;
      v6[3] = &unk_2648741F8;
      id v8 = *(id *)(a1 + 48);
      id v7 = v3;
      [v5 performBlockAndWait:v6];
    }
  }
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)deleteDraftFromContentItem:(id)a3 shouldSave:(BOOL)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 ID];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke;
  aBlock[3] = &unk_2648745B0;
  id v11 = v10;
  id v33 = v11;
  id v12 = v9;
  id v34 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [v8 ID];
  uint64_t v15 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v8 ID];
    int v17 = [v16 intValue];
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v17;
    _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "deleting form response %d", (uint8_t *)&buf, 8u);
  }
  objc_initWeak(&buf, self);
  id v18 = [(FBKData *)self api];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_223;
  v26[3] = &unk_264876810;
  id v19 = v8;
  id v27 = v19;
  id v28 = v14;
  BOOL v31 = a4;
  objc_copyWeak(&v30, &buf);
  id v29 = v13;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_225;
  v22[3] = &unk_2648742C0;
  id v20 = v28;
  id v23 = v20;
  id v21 = v29;
  id v24 = self;
  id v25 = v21;
  [v18 deleteFormResponseWithID:v20 success:v26 error:v22];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&buf);
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3 && +[FBKSharedConstants isRunningInFBA]) {
    +[FBKSharedConstants deleteAttachmentLegalTextForDraftID:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_223(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2;
  v4[3] = &unk_264876810;
  id v3 = v2;
  id v5 = v3;
  id v6 = *(id *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 64);
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  [v3 performBlock:v4];

  objc_destroyWeak(&v8);
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[FBKFormResponseStub entityName];
  id v4 = (id *)(a1 + 40);
  id v5 = [v2 findFeedbackObjectWithEntityName:v3 remoteID:*(void *)(a1 + 40)];

  if (v5)
  {
    id v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = [*v4 intValue];
      *(_DWORD *)id buf = 67109120;
      int v24 = v7;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "Deleting response stub [%i]", buf, 8u);
    }

    [*(id *)(a1 + 32) deleteObject:v5];
  }
  id v8 = *(void **)(a1 + 32);
  char v9 = +[FBKFormResponse entityName];
  id v10 = [v8 findFeedbackObjectWithEntityName:v9 remoteID:*(void *)(a1 + 40)];

  if (v10)
  {
    id v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = [*v4 intValue];
      *(_DWORD *)id buf = 67109120;
      int v24 = v12;
      _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_INFO, "Deleting response [%i]", buf, 8u);
    }

    [*(id *)(a1 + 32) deleteObject:v10];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v13 = *(void **)(a1 + 32);
    id v22 = 0;
    [v13 save:&v22];
    id v14 = v22;
    if (v14)
    {
      uint64_t v15 = Log_5();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2_cold_1();
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    int v17 = [WeakRetained currentUser];

    if (v17)
    {
      id v18 = *(void **)(a1 + 32);
      id v19 = objc_loadWeakRetained((id *)(a1 + 56));
      id v20 = [v19 currentUser];
      [v18 refreshObject:v20 mergeChanges:1];
    }
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21) {
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v14);
  }
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_225(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_225_cold_1(a1);
  }

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_226;
    v6[3] = &unk_2648741F8;
    id v8 = *(id *)(a1 + 48);
    id v7 = v3;
    [v5 performBlockAndWait:v6];
  }
}

uint64_t __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)deleteDraftFromContentItem:(id)a3 completion:(id)a4
{
}

- (void)deleteDraftsFromContentItems:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v25 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  char v9 = dispatch_group_create();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v15 = Log_5();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          [v14 ID];
          uint64_t v16 = v12;
          int v17 = v8;
          id v18 = v7;
          id v20 = v19 = self;
          int v21 = [v20 intValue];
          *(_DWORD *)id buf = 67109120;
          int v40 = v21;
          _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "deleting draft [%d]", buf, 8u);

          self = v19;
          id v7 = v18;
          id v8 = v17;
          uint64_t v12 = v16;
        }

        dispatch_group_enter(v9);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke;
        v31[3] = &unk_264876838;
        v31[4] = v14;
        id v32 = v7;
        id v33 = v8;
        id v34 = v9;
        [(FBKData *)self deleteDraftFromContentItem:v14 shouldSave:0 completion:v31];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v11);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_227;
  block[3] = &unk_264876860;
  void block[4] = self;
  id v28 = v7;
  id v29 = v8;
  id v30 = v25;
  id v22 = v8;
  id v23 = v25;
  id v24 = v7;
  dispatch_group_notify(v9, MEMORY[0x263EF83A0], block);
}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) addObject:v3];
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_227(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mainQueueContext];
  id v11 = 0;
  [v2 save:&v11];
  id v3 = v11;

  if (v3)
  {
    id v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_227_cold_1();
    }
  }
  id v5 = [*(id *)(a1 + 32) currentUser];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) mainQueueContext];
    id v7 = [*(id *)(a1 + 32) currentUser];
    [v6 refreshObject:v7 mergeChanges:1];
  }
  uint64_t v8 = [*(id *)(a1 + 40) count];
  uint64_t v9 = *(void *)(a1 + 56);
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = FBKAggregatedErrorOfType(-1007, *(void **)(a1 + 40));
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, *(void *)(a1 + 48));
    }
  }
  else if (v9)
  {
    (*(void (**)(void, void, void))(v9 + 16))(*(void *)(a1 + 56), 0, 0);
  }
}

- (void)saveFormResponse:(id)a3 completion:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v36 = a4;
  id v6 = [v5 ID];
  int v7 = [v6 intValue];

  uint64_t v8 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 67109120;
    int v56 = v7;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "saving form response %d", buf, 8u);
  }
  int v37 = v7;

  [v5 updateExtractedValuesFromAnswers];
  uint64_t v9 = (void *)MEMORY[0x263EFF980];
  uint64_t v10 = [v5 answers];
  id v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v39 = v5;
  uint64_t v12 = [v5 answers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v12);
        }
        int v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v18 = [v17 values];
        if (v18)
        {
          id v19 = (void *)v18;
          id v20 = [v17 values];
          if ([v20 count])
          {
          }
          else
          {
            char v21 = [v17 isOptedOut];

            if ((v21 & 1) == 0) {
              continue;
            }
          }
        }
        else if (![v17 isOptedOut])
        {
          continue;
        }
        id v22 = [v17 question];
        uint64_t v23 = [v22 answerType];

        id v24 = (void *)MEMORY[0x263EFFA68];
        if (v23 != 5)
        {
          id v24 = [v17 values];
        }
        v52[0] = @"question_id";
        id v25 = [v17 questionID];
        v52[1] = @"values";
        v53[0] = v25;
        v53[1] = v24;
        id v26 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
        id v27 = (void *)[v26 mutableCopy];

        id v28 = [v17 ID];
        uint64_t v29 = [v28 integerValue];

        if ((v29 & 0x8000000000000000) == 0)
        {
          id v30 = [v17 ID];
          [v27 setObject:v30 forKey:@"id"];
        }
        if ([v17 isOptedOut]) {
          [v27 setObject:MEMORY[0x263EFFA88] forKey:@"ignore_required"];
        }
        [v11 addObject:v27];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v14);
  }

  uint64_t v50 = @"answers";
  v51 = v11;
  BOOL v31 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  id v32 = [(FBKData *)self api];
  id v33 = [v39 ID];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __39__FBKData_saveFormResponse_completion___block_invoke;
  v43[3] = &unk_264874388;
  v43[4] = self;
  id v44 = v39;
  id v45 = v36;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __39__FBKData_saveFormResponse_completion___block_invoke_2_244;
  v40[3] = &unk_2648768B0;
  int v42 = v37;
  v40[4] = self;
  id v41 = v45;
  id v34 = v45;
  id v35 = v39;
  [v32 saveAnswersForFormResponseWithID:v33 answers:v31 success:v43 error:v40];
}

void __39__FBKData_saveFormResponse_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentUser];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__FBKData_saveFormResponse_completion___block_invoke_2;
  v5[3] = &unk_264876390;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v2 takeMainQueueObject:v3 andContinueWithPrivateQueueObject:v5];
}

void __39__FBKData_saveFormResponse_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] privateQueueContext];
  [v4 refreshObject:v3 mergeChanges:1];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  int v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  if ([a1[5] hasChanges])
  {
    id v5 = [a1[5] managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__FBKData_saveFormResponse_completion___block_invoke_3;
    v10[3] = &unk_264876888;
    id v11 = a1[5];
    uint64_t v12 = &v13;
    [v5 performBlockAndWait:v10];
  }
  if (v14[5])
  {
    id v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __39__FBKData_saveFormResponse_completion___block_invoke_2_cold_1();
    }
  }
  else
  {
    id v6 = [a1[4] notificationCenter];
    [v6 postNotificationName:@"FBKLocalDataDidChangeNotification" object:a1[4]];
  }

  if (a1[6])
  {
    id v7 = [a1[4] mainQueueContext];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v8[2] = __39__FBKData_saveFormResponse_completion___block_invoke_243;
    v8[3] = &unk_2648741D0;
    id v9 = a1[6];
    [v7 performBlockAndWait:v8];
  }
  _Block_object_dispose(&v13, 8);
}

void __39__FBKData_saveFormResponse_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  [v2 save:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

uint64_t __39__FBKData_saveFormResponse_completion___block_invoke_243(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__FBKData_saveFormResponse_completion___block_invoke_2_244(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__FBKData_saveFormResponse_completion___block_invoke_2_244_cold_1();
  }

  if (*(void *)(a1 + 40))
  {
    id v5 = [*(id *)(a1 + 32) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__FBKData_saveFormResponse_completion___block_invoke_245;
    v6[3] = &unk_2648741F8;
    id v8 = *(id *)(a1 + 40);
    id v7 = v3;
    [v5 performBlockAndWait:v6];
  }
}

uint64_t __39__FBKData_saveFormResponse_completion___block_invoke_245(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)formResponseStubForID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FBKData *)self api];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__FBKData_formResponseStubForID_completion___block_invoke;
  v11[3] = &unk_2648768D8;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v14 = v10;
  objc_copyWeak(&v15, &location);
  uint64_t v13 = self;
  [v8 getFormResponseStubWithID:v9 withCompletion:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __44__FBKData_formResponseStubForID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__FBKData_formResponseStubForID_completion___block_invoke_2;
    block[3] = &unk_264874588;
    id v16 = a1[4];
    id v18 = a1[6];
    id v17 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v9 = v16;
LABEL_7:

    goto LABEL_8;
  }
  if (a1[6])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v9 = [WeakRetained mainQueueObjectFromPrivate:v5];

    if (a1[6])
    {
      id v10 = [a1[5] mainQueueContext];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __44__FBKData_formResponseStubForID_completion___block_invoke_246;
      v11[3] = &unk_264874450;
      id v14 = a1[6];
      id v9 = v9;
      id v12 = v9;
      id v13 = 0;
      [v10 performBlockAndWait:v11];
    }
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __44__FBKData_formResponseStubForID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __44__FBKData_formResponseStubForID_completion___block_invoke_2_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __44__FBKData_formResponseStubForID_completion___block_invoke_246(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)refreshFormResponseStubFromContentItem:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([v6 isDeleted])
  {
    id v8 = +[FBKLog appHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FBKData refreshFormResponseStubFromContentItem:completion:](v6);
    }

    id v9 = FBKErrorOfType(-1016);
    v7[2](v7, 0, v9);
    goto LABEL_23;
  }
  id v10 = [v6 formResponseStub];
  id v9 = v10;
  if (!v10)
  {
    id v14 = Log_5();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    LOWORD(buf[0]) = 0;
    id v16 = "No FormResponseStub for ContentItem, fetching.";
    goto LABEL_15;
  }
  id v11 = [v10 updatedAt];
  id v12 = [v6 updatedAt];
  uint64_t v13 = [v11 compare:v12];

  id v14 = Log_5();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13 == 1)
  {
    if (v15)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "Content item not updated since last refresh, using existing Core Data object.", (uint8_t *)buf, 2u);
    }

    if (v7) {
      ((void (**)(id, void *, void *))v7)[2](v7, v9, 0);
    }
    goto LABEL_23;
  }
  if (v15)
  {
    LOWORD(buf[0]) = 0;
    id v16 = "Content item indicates Core Data object is out of date, refreshing FormResponseStub.";
LABEL_15:
    _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)buf, 2u);
  }
LABEL_16:

  objc_initWeak(buf, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke;
  aBlock[3] = &unk_264876950;
  objc_copyWeak(&v30, buf);
  id v17 = v7;
  id v29 = v17;
  id v18 = v6;
  id v28 = v18;
  id v19 = _Block_copy(aBlock);
  if ([v18 itemType] == 4 || objc_msgSend(v18, "itemType") == 5)
  {
    id v20 = Log_5();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      char v21 = [v18 ID];
      int v22 = [v21 intValue];
      *(_DWORD *)id v32 = 67109120;
      int v33 = v22;
      _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_INFO, "Item is Feedback, need to fetch feedback details for feedback [%i]", v32, 8u);
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_249;
    v24[3] = &unk_264876978;
    id v25 = v17;
    id v26 = v19;
    [(FBKData *)self getFeedbackForContentItem:v18 completion:v24];

    uint64_t v23 = v25;
  }
  else
  {
    uint64_t v23 = [v18 ID];
    (*((void (**)(void *, void *))v19 + 2))(v19, v23);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(buf);
LABEL_23:
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = [WeakRetained api];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_2;
  v7[3] = &unk_264876928;
  objc_copyWeak(&v11, a1 + 6);
  id v6 = v3;
  id v8 = v6;
  id v10 = a1[5];
  id v9 = a1[4];
  [v5 getFormResponseStubWithID:v6 withCompletion:v7];

  objc_destroyWeak(&v11);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v8 = [WeakRetained mainQueueContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3;
  v11[3] = &unk_264876900;
  id v9 = v6;
  id v12 = v9;
  id v10 = v5;
  id v13 = v10;
  id v14 = a1[4];
  id v16 = a1[6];
  objc_copyWeak(&v17, a1 + 7);
  id v15 = a1[5];
  [v8 performBlock:v11];

  objc_destroyWeak(&v17);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 || !*(void *)(a1 + 40))
  {
    if (([v2 isFBKErrorWithCode:-1010] & 1) == 0)
    {
      id v3 = Log_5();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_1(a1);
      }
    }
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, *(void *)(a1 + 32));
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v6 = [WeakRetained mainQueueObjectFromPrivate:*(void *)(a1 + 40)];

    [*(id *)(a1 + 56) setFormResponseStub:v6];
    id v7 = objc_loadWeakRetained((id *)(a1 + 72));
    id v8 = [v7 mainQueueContext];
    id v18 = 0;
    [v8 save:&v18];
    id v9 = v18;

    id v10 = [v6 contentItem];

    if (!v10)
    {
      id v11 = +[FBKLog appHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_3();
      }
    }
    id v12 = [*(id *)(a1 + 56) formResponseStub];

    if (!v12)
    {
      id v13 = +[FBKLog appHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_2();
      }
    }
    id v14 = Log_5();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [*(id *)(a1 + 56) ID];
      int v16 = [v15 intValue];
      *(_DWORD *)id buf = 67109120;
      int v20 = v16;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "Fetched form response stub for ID [%d]", buf, 8u);
    }
    uint64_t v17 = *(void *)(a1 + 64);
    if (v17) {
      (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v6, 0);
    }
  }
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_249(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = v6;
    if (v7)
    {
      id v10 = v11;
      id v12 = Log_5();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_249_cold_2();
      }

      goto LABEL_12;
    }
  }
  else
  {
    id v8 = [v5 formResponseID];

    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [v5 formResponseID];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
      goto LABEL_14;
    }
  }
  id v13 = Log_5();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_249_cold_1();
  }

  id v10 = FBKErrorOfType(-8);
LABEL_12:
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v10);
  }
LABEL_14:
}

- (void)bugFormFromForDraftItem:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 formID];
  uint64_t v9 = [v6 singleTeam];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke;
  v12[3] = &unk_2648769A0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(FBKData *)self refreshBugFormWithID:v8 fromStub:0 forTeam:v9 completion:v12];
}

void __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = Log_5();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke_cold_1(a1, v7);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (void)fetchFeedbackStatusForFeedback:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    id v8 = [(FBKData *)self api];
    uint64_t v9 = [v6 ID];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke;
    v12[3] = &unk_2648769C8;
    id v13 = v6;
    id v14 = v7;
    objc_copyWeak(&v15, &location);
    [v8 getFeedbackStatusForFeedbackID:v9 completion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FBKData fetchFeedbackStatusForFeedback:completion:]();
    }

    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:-1001 userInfo:0];
    if (v7) {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

void __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2;
    block[3] = &unk_264874388;
    id v15 = a1[4];
    id v16 = v6;
    id v17 = a1[5];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v8 = [WeakRetained mainQueueContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_252;
    v9[3] = &unk_264874600;
    objc_copyWeak(&v13, a1 + 6);
    id v10 = v5;
    id v11 = a1[4];
    id v12 = a1[5];
    [v8 performBlock:v9];

    objc_destroyWeak(&v13);
  }
}

uint64_t __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 40));
  }
  return result;
}

void __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_252(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained mainQueueObjectFromPrivate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setStatus:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
  }
}

- (void)refreshSurveyFromContentItem:(id)a3 forTeam:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 detailedItem];
  if (!v11)
  {
    id v12 = +[FBKLog appHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_INFO, "no form (Survey) for item, Will fetch", (uint8_t *)buf, 2u);
    }
    goto LABEL_8;
  }
  id v12 = v11;
  id v13 = [v8 updatedAt];
  id v14 = [v12 updatedAt];
  uint64_t v15 = [v13 compare:v14];

  if (v15 == 1)
  {
    id v16 = +[FBKLog appHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_INFO, "form (Survey) is stale, will refresh", (uint8_t *)buf, 2u);
    }

LABEL_8:
    id v17 = [v8 ID];
    objc_initWeak(buf, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    _DWORD v19[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke;
    v19[3] = &unk_264876A40;
    id v18 = v17;
    id v20 = v18;
    id v24 = v10;
    uint64_t v21 = self;
    objc_copyWeak(&v25, buf);
    id v22 = v8;
    id v23 = v9;
    [(FBKData *)self refreshBugFormWithID:v18 fromStub:0 forTeam:v23 completion:v19];

    objc_destroyWeak(&v25);
    objc_destroyWeak(buf);

    id v12 = 0;
    goto LABEL_11;
  }
  if (v10) {
    (*((void (**)(id, NSObject *, void))v10 + 2))(v10, v12, 0);
  }
LABEL_11:
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 9);
    id v9 = [WeakRetained mainQueueContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    _DWORD v14[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_2;
    v14[3] = &unk_264876A18;
    id v15 = v5;
    id v16 = a1[6];
    id v17 = a1[7];
    objc_copyWeak(&v20, a1 + 9);
    id v18 = a1[5];
    id v19 = a1[8];
    [v9 performBlock:v14];
    id v10 = &v15;
    uint64_t v11 = &v16;

    objc_destroyWeak(&v20);
    id v12 = v17;
LABEL_8:

    goto LABEL_9;
  }
  id v13 = Log_5();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_cold_1();
  }

  if (a1[8])
  {
    id v12 = [a1[5] mainQueueContext];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_254;
    v21[3] = &unk_2648741F8;
    id v10 = &v23;
    id v23 = a1[8];
    uint64_t v11 = &v22;
    id v22 = v7;
    [v12 performBlockAndWait:v21];
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_254(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setSurveyContentItem:*(void *)(a1 + 40)];
  uint64_t v21 = (id *)a1;
  uint64_t v2 = [*(id *)(a1 + 32) completedResponsesContentItemsForTeam:*(void *)(a1 + 48)];
  id v23 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v36 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained(v21 + 9);
        id v8 = [WeakRetained mainQueueContext];
        id v9 = +[FBKFeedback entityName];
        id v10 = [v6 ID];
        uint64_t v11 = [v8 findFeedbackObjectWithEntityName:v9 remoteID:v10];

        if (!v11) {
          [v23 addObject:v6];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v3);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_3;
  aBlock[3] = &unk_2648766F8;
  id v12 = v21 + 9;
  objc_copyWeak(&v34, v21 + 9);
  id v13 = v21[8];
  void aBlock[4] = v21[7];
  id v33 = v13;
  id v32 = v21[4];
  blocuint64_t k = (void (**)(void))_Block_copy(aBlock);
  if ([v23 count])
  {
    id v14 = dispatch_group_create();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = v23;
    uint64_t v15 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v22);
          }
          uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          dispatch_group_enter(v14);
          id v19 = objc_loadWeakRetained(v12);
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5;
          v25[3] = &unk_2648769F0;
          void v25[4] = v18;
          id v26 = v14;
          [v19 getFeedbackForContentItem:v18 completion:v25];
        }
        uint64_t v15 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v15);
    }

    dispatch_group_notify(v14, MEMORY[0x263EF83A0], block);
  }
  else
  {
    block[2]();
  }

  objc_destroyWeak(&v34);
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained mainQueueContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_4;
  v4[3] = &unk_264874588;
  void v4[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 performBlock:v4];
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mainQueueContext];
  id v6 = 0;
  [v2 save:&v6];
  id v3 = v6;

  uint64_t v4 = *(void *)(a1 + 48);
  if (v3)
  {
    id v5 = *(void (**)(void))(v4 + 16);
LABEL_5:
    v5();
    goto LABEL_6;
  }
  if (v4)
  {
    id v5 = *(void (**)(void))(v4 + 16);
    goto LABEL_5;
  }
LABEL_6:
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[FBKLog appHandle];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v7 = [*(id *)(a1 + 32) ID];
    v8[0] = 67109120;
    v8[1] = [v7 intValue];
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "refreshed survey Feedback [%i]", (uint8_t *)v8, 8u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)getFeedbackForContentItem:(id)a3 completion:(id)a4
{
}

- (void)getFeedbackForContentItem:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  if (v6)
  {
    id v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v8 ID];
      *(_DWORD *)id buf = 138543362;
      long long v27 = v11;
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Content item for feedback [%{public}@] is forced fetching.", buf, 0xCu);
    }
LABEL_14:

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke;
    v22[3] = &unk_264876A90;
    objc_copyWeak(&v24, &location);
    id v23 = v9;
    [(FBKData *)self takeMainQueueObject:v8 andContinueWithPrivateQueueObject:v22];

    objc_destroyWeak(&v24);
    goto LABEL_15;
  }
  id v12 = [v8 feedback];

  if (!v12)
  {
    id v10 = Log_5();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v20 = [v8 ID];
      *(_DWORD *)id buf = 138543362;
      long long v27 = v20;
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Content item has no feedback object for ID [%{public}@], fetching.", buf, 0xCu);
    }
    goto LABEL_14;
  }
  id v13 = [v8 feedback];
  id v14 = [v13 updatedAt];
  uint64_t v15 = [v8 updatedAt];
  BOOL v16 = [v14 compare:v15] == 1;

  id v10 = Log_5();
  BOOL v17 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v17)
    {
      uint64_t v21 = [v8 ID];
      *(_DWORD *)id buf = 138543362;
      long long v27 = v21;
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Content item for feedback ID [%{public}@] is out of date, fetching.", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (v17)
  {
    uint64_t v18 = [v8 ID];
    *(_DWORD *)id buf = 138543362;
    long long v27 = v18;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Content item for feedback ID [%{public}@] has not changed, returning Core Data object.", buf, 0xCu);
  }
  if (v9)
  {
    id v19 = [v8 feedback];
    (*((void (**)(id, void *, void))v9 + 2))(v9, v19, 0);
  }
LABEL_15:
  objc_destroyWeak(&location);
}

void __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke_2;
  aBlock[3] = &unk_264876A68;
  id v4 = (id *)(a1 + 40);
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v5 = v3;
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  BOOL v6 = _Block_copy(aBlock);
  uint64_t v7 = [v5 itemType];
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained api];
  if (v7 == 5) {
    id v9 = {;
  }
    id v10 = [v5 ID];
    [v9 feedbackForSurveyFeedbackID:v10 completion:v6];
  }
  else {
    id v9 = {;
  }
    id v10 = [v5 ID];
    [v9 feedbackForFeedbackID:v10 completion:v6];
  }

  objc_destroyWeak(&v14);
}

void __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _didGetFeedback:v7 error:v6 withContentItem:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)getFeedbackForFeedbackID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FBKData *)self api];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__FBKData_getFeedbackForFeedbackID_completion___block_invoke;
  v10[3] = &unk_264876AB8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 feedbackForFeedbackID:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __47__FBKData_getFeedbackForFeedbackID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _didGetFeedback:v7 error:v6 withContentItem:0 completion:*(void *)(a1 + 32)];
}

- (void)getFeedbackForFormResponseID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FBKData *)self api];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__FBKData_getFeedbackForFormResponseID_completion___block_invoke;
  v10[3] = &unk_264876AB8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 feedbackForFormResponseID:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __51__FBKData_getFeedbackForFormResponseID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _didGetFeedback:v7 error:v6 withContentItem:0 completion:*(void *)(a1 + 32)];
}

- (void)getFeedbackForFollowupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FBKData *)self api];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__FBKData_getFeedbackForFollowupID_completion___block_invoke;
  v10[3] = &unk_264876AB8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 feedbackForFollowupID:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __47__FBKData_getFeedbackForFollowupID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _didGetFeedback:v7 error:v6 withContentItem:0 completion:*(void *)(a1 + 32)];
}

- (void)_didGetFeedback:(id)a3 error:(id)a4 withContentItem:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(FBKData *)self currentUser];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  _DWORD v19[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke;
  v19[3] = &unk_264876AE0;
  id v23 = v10;
  id v24 = v13;
  id v20 = v11;
  uint64_t v21 = self;
  id v22 = v12;
  id v15 = v10;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  [(FBKData *)self takeMainQueueObject:v14 andContinueWithPrivateQueueObject:v19];
}

void __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 32))
  {
    id v7 = *(void **)(a1 + 48);
    if (v7)
    {
      id v6 = v7;
    }
    else
    {
      id v8 = [v3 feedbackContentItems];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      _DWORD v20[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_3;
      v20[3] = &unk_264876118;
      id v21 = *(id *)(a1 + 56);
      objc_msgSend(v8, "ded_findWithBlock:", v20);
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        id v10 = Log_5();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_1((id *)(a1 + 56));
        }
        id v6 = 0;
        goto LABEL_14;
      }
    }
    [*(id *)(a1 + 56) setContentItem:v6];
    id v9 = [*(id *)(a1 + 56) managedObjectContext];
    id v19 = 0;
    [v9 save:&v19];
    id v10 = v19;

    if (v10)
    {
      id v11 = Log_5();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_2();
      }
    }
LABEL_14:

    id v12 = [*(id *)(a1 + 40) mainQueueObjectFromPrivate:*(void *)(a1 + 56)];
    id v13 = [v12 managedObjectContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_257;
    v15[3] = &unk_264874450;
    id v18 = *(id *)(a1 + 64);
    id v16 = v12;
    id v17 = *(id *)(a1 + 32);
    id v14 = v12;
    [v13 performBlock:v15];

    goto LABEL_15;
  }
  if (*(void *)(a1 + 64))
  {
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_2;
    v22[3] = &unk_2648741F8;
    id v24 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 32);
    [v5 performBlockAndWait:v22];

    id v6 = v24;
LABEL_15:
  }
}

uint64_t __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 ID];
  id v4 = [*(id *)(a1 + 32) ID];
  uint64_t v5 = [v3 isEqualToNumber:v4];

  return v5;
}

uint64_t __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_257(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)getFormResponseStubForFeedback:(id)a3 completion:(id)a4
{
}

- (void)getFormResponseStubForFeedback:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a5;
  if (a4) {
    goto LABEL_7;
  }
  uint64_t v10 = [v8 formResponseStub];
  if (!v10) {
    goto LABEL_7;
  }
  id v11 = (void *)v10;
  id v12 = [v8 formResponseStub];
  id v13 = [v12 updatedAt];
  id v14 = [v8 contentItem];
  id v15 = [v14 updatedAt];
  uint64_t v16 = [v13 compare:v15];

  if (v16 == 1)
  {
    id v17 = Log_5();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v8 ID];
      *(_DWORD *)id buf = 134217984;
      uint64_t v27 = [v18 longValue];
      _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_INFO, "Using cached content item for feedback [%ld]", buf, 0xCu);
    }
    id v19 = [v8 formResponseStub];
    v9[2](v9, v19, 0);
  }
  else
  {
LABEL_7:
    id v20 = Log_5();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v8 ID];
      *(_DWORD *)id buf = 134217984;
      uint64_t v27 = [v21 longValue];
      _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_INFO, "Feedback [%ld] has stale or nil Response Stub, refreshing from server.", buf, 0xCu);
    }
    id v22 = [v8 formResponseID];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    void v23[2] = __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke;
    v23[3] = &unk_264876B08;
    id v25 = v9;
    id v24 = v8;
    [(FBKData *)self formResponseStubForID:v22 completion:v23];

    id v19 = v25;
  }
}

void __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 || (uint64_t v14 = *(void *)(a1 + 40)) == 0)
  {
    id v7 = [*(id *)(a1 + 32) contentItem];
    [v7 setFormResponseStub:v5];

    id v8 = [*(id *)(a1 + 32) managedObjectContext];
    id v9 = [*(id *)(a1 + 32) contentItem];
    [v8 refreshObject:v9 mergeChanges:1];

    uint64_t v10 = [*(id *)(a1 + 32) managedObjectContext];
    id v17 = 0;
    [v10 save:&v17];
    id v11 = v17;

    uint64_t v12 = *(void *)(a1 + 40);
    if (v11)
    {
      if (v12)
      {
        id v13 = *(void (**)(void))(v12 + 16);
LABEL_10:
        v13();
      }
    }
    else if (v12)
    {
      id v13 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }

    goto LABEL_16;
  }
  if (v6)
  {
    id v15 = *(void (**)(void))(v14 + 16);
  }
  else
  {
    uint64_t v16 = Log_5();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke_cold_1();
    }

    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v15();
LABEL_16:
}

- (void)getAllContentForFeedback:(id)a3 completion:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v39 = a4;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [v5 feedbackFollowups];
  id v8 = [v7 valueForKeyPath:@"remoteID"];
  int v42 = [v6 setWithArray:v8];

  v53[0] = 0;
  v53[1] = v53;
  void v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__3;
  void v53[4] = __Block_byref_object_dispose__3;
  id v54 = 0;
  group = dispatch_group_create();
  id v9 = [v5 contentItem];
  uint64_t v10 = [v9 formResponseStub];
  if (v10)
  {
    id v11 = [v5 contentItem];
    uint64_t v12 = [v11 formResponseStub];
    id v13 = [v12 updatedAt];
    uint64_t v14 = [v5 contentItem];
    id v15 = [v14 updatedAt];
    BOOL v16 = [v13 compare:v15] == -1;

    if (!v16)
    {
      id v17 = Log_5();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [v5 formResponseID];
        int v19 = [v18 intValue];
        id v20 = [v5 ID];
        int v21 = [v20 intValue];
        *(_DWORD *)id buf = 67109376;
        int v56 = v19;
        __int16 v57 = 1024;
        int v58 = v21;
        _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_INFO, "Using cached Response Stub with ID [%i] for feedback [%i]", buf, 0xEu);
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v22 = Log_5();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v5 formResponseID];
    int v24 = [v23 intValue];
    id v25 = [v5 ID];
    int v26 = [v25 intValue];
    *(_DWORD *)id buf = 67109376;
    int v56 = v24;
    __int16 v57 = 1024;
    int v58 = v26;
    _os_log_impl(&dword_22A36D000, v22, OS_LOG_TYPE_DEFAULT, "Will fetch Response Stub with ID [%i] for feedback [%i]", buf, 0xEu);
  }
  dispatch_group_enter(group);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __47__FBKData_getAllContentForFeedback_completion___block_invoke;
  v50[3] = &unk_264876B30;
  v52 = v53;
  v51 = group;
  [(FBKData *)self getFormResponseStubForFeedback:v5 completion:v50];
  id v17 = v51;
LABEL_9:

  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v28 = [v5 feedbackFollowupIDs];
    BOOL v29 = [v28 count] > i;

    if (!v29) {
      break;
    }
    long long v30 = [NSNumber numberWithInt:i];
    if (([v42 containsObject:v30] & 1) == 0)
    {
      BOOL v31 = Log_5();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = [v5 feedbackFollowupIDs];
        id v33 = [v32 objectAtIndexedSubscript:i];
        int v34 = [v33 intValue];
        long long v35 = [v5 ID];
        int v36 = [v35 intValue];
        *(_DWORD *)id buf = 67109376;
        int v56 = v34;
        __int16 v57 = 1024;
        int v58 = v36;
        _os_log_impl(&dword_22A36D000, v31, OS_LOG_TYPE_DEFAULT, "Will fetch FFU with ID [%i] for feedback [%i]", buf, 0xEu);
      }
      dispatch_group_enter(group);
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __47__FBKData_getAllContentForFeedback_completion___block_invoke_259;
      v47[3] = &unk_264876B58;
      long long v49 = v53;
      long long v48 = group;
      [(FBKData *)self getFeedbackFollowupForFeedback:v5 atIndex:i completion:v47];
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__FBKData_getAllContentForFeedback_completion___block_invoke_2;
  block[3] = &unk_264876B80;
  id v44 = v5;
  id v45 = v39;
  long long v46 = v53;
  id v37 = v39;
  id v38 = v5;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v53, 8);
}

void __47__FBKData_getAllContentForFeedback_completion___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__FBKData_getAllContentForFeedback_completion___block_invoke_259(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __47__FBKData_getAllContentForFeedback_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 refreshAllObjects];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)getFeedbackFollowupForFeedback:(id)a3 atIndex:(unint64_t)a4 completion:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v43 = a5;
  id v8 = +[FBKLog ffu];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 ID];
    *(_DWORD *)id buf = 134218240;
    unint64_t v51 = a4;
    __int16 v52 = 2048;
    uint64_t v53 = [v9 unsignedIntegerValue];
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "Getting FFU at index [%lu] for FB [%lu]", buf, 0x16u);
  }
  uint64_t v10 = [v7 feedbackFollowups];
  unint64_t v11 = [v10 count];

  uint64_t v12 = &off_22A4BE000;
  if (v11 <= a4)
  {
    BOOL v16 = 0;
LABEL_22:
    id v39 = objc_msgSend(v7, "feedbackFollowupIDs", self);
    int v40 = [v39 objectAtIndexedSubscript:a4];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = *((void *)v12 + 331);
    v44[2] = __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_262;
    v44[3] = &unk_264876BD0;
    id v46 = v43;
    id v45 = v7;
    unint64_t v47 = a4;
    [v42 feedbackFollowupForID:v40 completion:v44];

    uint64_t v14 = v46;
    goto LABEL_23;
  }
  id v13 = [v7 feedbackFollowupIDs];
  uint64_t v14 = [v13 objectAtIndexedSubscript:a4];

  id v15 = [v7 feedbackFollowups];
  BOOL v16 = [v15 objectAtIndexedSubscript:a4];

  id v17 = +[FBKLog ffu];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [v7 ID];
    uint64_t v19 = [v18 unsignedIntegerValue];
    uint64_t v20 = [v14 unsignedIntegerValue];
    int v21 = [v16 ID];
    uint64_t v22 = [v21 unsignedIntegerValue];
    *(_DWORD *)id buf = 134218752;
    unint64_t v51 = a4;
    __int16 v52 = 2048;
    uint64_t v53 = v19;
    __int16 v54 = 2048;
    uint64_t v55 = v20;
    uint64_t v12 = &off_22A4BE000;
    __int16 v56 = 2048;
    uint64_t v57 = v22;
    _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_INFO, "FFU ID at index [%lu] for FB [%lu] is [%lu]. FFU ID through relationship has ID [%lu]", buf, 0x2Au);
  }
  id v23 = [v16 ID];
  char v24 = [v14 isEqualToNumber:v23];

  if ((v24 & 1) == 0)
  {

    id v25 = [v7 feedbackFollowups];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = *((void *)v12 + 331);
    v48[2] = __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke;
    v48[3] = &unk_264876BA8;
    id v49 = v14;
    uint64_t v26 = [v25 indexOfObjectPassingTest:v48];

    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v16 = 0;
    }
    else
    {
      uint64_t v27 = [v7 feedbackFollowups];
      BOOL v16 = [v27 objectAtIndexedSubscript:v26];
    }
  }
  if (!v16)
  {
    id v32 = Log_5();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = [v14 unsignedIntegerValue];
      *(_DWORD *)id buf = 134217984;
      unint64_t v51 = v36;
      _os_log_impl(&dword_22A36D000, v32, OS_LOG_TYPE_INFO, "Followup [%lu] was not in Core Data cache, fetching.", buf, 0xCu);
    }
    goto LABEL_21;
  }
  uint64_t v28 = [v16 updatedAt];
  BOOL v29 = [v7 contentItem];
  long long v30 = [v29 updatedAt];
  uint64_t v31 = [v28 compare:v30];

  id v32 = Log_5();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
  if (v31 != 1)
  {
    if (v33)
    {
      id v37 = [v16 ID];
      uint64_t v38 = [v37 unsignedIntegerValue];
      *(_DWORD *)id buf = 134217984;
      unint64_t v51 = v38;
      _os_log_impl(&dword_22A36D000, v32, OS_LOG_TYPE_INFO, "Followup [%lu] is out of date, fetching.", buf, 0xCu);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (v33)
  {
    int v34 = objc_msgSend(v16, "ID", self);
    uint64_t v35 = [v34 unsignedIntegerValue];
    *(_DWORD *)id buf = 134217984;
    unint64_t v51 = v35;
    _os_log_impl(&dword_22A36D000, v32, OS_LOG_TYPE_INFO, "Followup [%lu] is not stale, using local cache", buf, 0xCu);
  }
  (*((void (**)(id, void *, void))v43 + 2))(v43, v16, 0);
LABEL_23:
}

uint64_t __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 ID];
  uint64_t v4 = [v2 isEqualToNumber:v3];

  return v4;
}

void __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_262(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v6 && v11)
    {
      uint64_t v12 = *(void (**)(void))(v11 + 16);
    }
    else
    {
      if (!v11) {
        goto LABEL_23;
      }
      int v21 = Log_5();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_262_cold_1();
      }

      uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v12();
    goto LABEL_23;
  }
  id v7 = [*(id *)(a1 + 32) feedbackFollowups];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) feedbackFollowups];
    id v9 = (void *)[v8 mutableCopy];

    unint64_t v10 = *(void *)(a1 + 48);
    if (v10 >= [v9 count]) {
      [v9 addObject:v5];
    }
    else {
      [v9 insertObject:v5 atIndex:*(void *)(a1 + 48)];
    }
    id v13 = (void *)[v9 copy];
    [*(id *)(a1 + 32) setFeedbackFollowups:v13];
  }
  else
  {
    v23[0] = v5;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    [*(id *)(a1 + 32) setFeedbackFollowups:v9];
  }

  uint64_t v14 = [*(id *)(a1 + 32) managedObjectContext];
  id v15 = [*(id *)(a1 + 32) contentItem];
  BOOL v16 = [v15 user];
  [v14 refreshObject:v16 mergeChanges:1];

  id v17 = [*(id *)(a1 + 32) managedObjectContext];
  id v22 = 0;
  [v17 save:&v22];
  id v18 = v22;

  uint64_t v19 = *(void *)(a1 + 40);
  if (v18)
  {
    if (v19)
    {
      uint64_t v20 = *(void (**)(void))(v19 + 16);
LABEL_16:
      v20();
    }
  }
  else if (v19)
  {
    uint64_t v20 = *(void (**)(void))(v19 + 16);
    goto LABEL_16;
  }

LABEL_23:
}

- (void)updateTask:(id)a3 withSubmissionStage:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__FBKData_updateTask_withSubmissionStage___block_invoke;
  v9[3] = &unk_264875D28;
  uint64_t v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlockAndWait:v9];
}

void __42__FBKData_updateTask_withSubmissionStage___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) taskIdentifier];
    int v4 = [v3 intValue];
    id v5 = [*(id *)(a1 + 32) formID];
    int v6 = [v5 intValue];
    unint64_t v7 = [*(id *)(a1 + 32) localSubmissionStage];
    if (v7 > 8) {
      id v8 = "Unknown";
    }
    else {
      id v8 = off_264877040[v7];
    }
    unint64_t v9 = *(void *)(a1 + 48);
    if (v9 > 8) {
      id v10 = "Unknown";
    }
    else {
      id v10 = off_264877040[v9];
    }
    *(_DWORD *)id buf = 67109890;
    int v23 = v4;
    __int16 v24 = 1024;
    int v25 = v6;
    __int16 v26 = 2080;
    uint64_t v27 = v8;
    __int16 v28 = 2080;
    BOOL v29 = v10;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "Changing upload task [%d] for form [%d] state from [%s] to [%s]", buf, 0x22u);
  }
  [*(id *)(a1 + 32) setLocalSubmissionStage:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v11 = [*(id *)(a1 + 32) managedObjectContext];
    id v21 = 0;
    [v11 save:&v21];
    id v12 = v21;

    id v13 = [*(id *)(a1 + 32) formResponse];

    if (v13)
    {
      uint64_t v14 = [*(id *)(a1 + 32) managedObjectContext];
      id v15 = [*(id *)(a1 + 32) formResponse];
      [v14 refreshObject:v15 mergeChanges:1];
    }
    BOOL v16 = [*(id *)(a1 + 32) feedbackFollowup];

    if (v16)
    {
      id v17 = [*(id *)(a1 + 32) managedObjectContext];
      id v18 = [*(id *)(a1 + 32) feedbackFollowup];
      [v17 refreshObject:v18 mergeChanges:1];
    }
    if (v12)
    {
      uint64_t v19 = Log_5();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __42__FBKData_updateTask_withSubmissionStage___block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v19 = [*(id *)(a1 + 40) notificationCenter];
      uint64_t v20 = [*(id *)(a1 + 32) filerForm];
      [v19 postNotificationName:@"FBKFormUploadStatusChangeNotification" object:v20];

      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  [*(id *)(a1 + 40) _logUploadTasks];
}

- (void)deleteUploadForTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 taskIdentifier];
  unint64_t v9 = [v6 managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke;
  v13[3] = &unk_264874400;
  id v14 = v6;
  id v15 = v8;
  BOOL v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  [v9 performBlock:v13];
}

void __42__FBKData_deleteUploadForTask_completion___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__3;
  v37[4] = __Block_byref_object_dispose__3;
  id v38 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 fileURL];
    BOOL v4 = v3 == 0;

    if (v4)
    {
      id v15 = 0;
    }
    else
    {
      id v5 = [MEMORY[0x263F08850] defaultManager];
      id v6 = [*(id *)(a1 + 32) fileURL];
      id v36 = 0;
      [v5 removeItemAtURL:v6 error:&v36];
      id v7 = v36;

      if (v7)
      {
        id v8 = Log_5();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = [*(id *)(a1 + 32) fileURL];
          int v25 = [v24 path];
          uint64_t v26 = *(void *)(a1 + 40);
          uint64_t v27 = [v7 localizedDescription];
          *(_DWORD *)id buf = 138543874;
          int v40 = v25;
          __int16 v41 = 2114;
          uint64_t v42 = v26;
          __int16 v43 = 2114;
          id v44 = v27;
          _os_log_error_impl(&dword_22A36D000, v8, OS_LOG_TYPE_ERROR, "upload task: %{public}@ failed to remove file %{public}@ with error: %{public}@", buf, 0x20u);
        }
      }

      unint64_t v9 = [*(id *)(a1 + 32) fileURL];
      id v10 = [v9 URLByDeletingPathExtension];
      id v11 = [v10 URLByDeletingPathExtension];

      id v12 = [MEMORY[0x263F08850] defaultManager];
      id v13 = [v11 path];
      LODWORD(v10) = [v12 fileExistsAtPath:v13];

      if (v10)
      {
        id v14 = [MEMORY[0x263F08850] defaultManager];
        id v35 = 0;
        [v14 removeItemAtURL:v11 error:&v35];
        id v15 = v35;

        if (v15)
        {
          BOOL v16 = Log_5();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = *(void *)(a1 + 40);
            id v18 = [v15 localizedDescription];
            __42__FBKData_deleteUploadForTask_completion___block_invoke_cold_1(v17, v18, buf, v16);
          }
        }
      }
      else
      {
        id v15 = 0;
      }
    }
    uint64_t v19 = *(void **)(a1 + 32);
    if (v19)
    {
      uint64_t v20 = [v19 managedObjectContext];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke_263;
      v28[3] = &unk_264876C20;
      id v29 = *(id *)(a1 + 32);
      int v34 = v37;
      id v15 = v15;
      id v30 = v15;
      id v21 = *(id *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      int v23 = *(void **)(a1 + 56);
      id v31 = v21;
      uint64_t v32 = v22;
      id v33 = v23;
      [v20 performBlock:v28];
    }
  }
  else
  {
    id v15 = 0;
  }
  _Block_object_dispose(v37, 8);
}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_263(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) taskIdentifier];
  int v3 = [v2 intValue];

  BOOL v4 = [*(id *)(a1 + 32) managedObjectContext];
  [v4 deleteObject:*(void *)(a1 + 32)];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id v18 = *(id *)(v6 + 40);
  [v5 save:&v18];
  objc_storeStrong((id *)(v6 + 40), v18);

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = Log_5();
  unint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__FBKData_deleteUploadForTask_completion___block_invoke_263_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 67109120;
      int v20 = v3;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "Deleted upload task [%i]", buf, 8u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke_264;
    block[3] = &unk_264874270;
    void block[4] = *(void *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (*(void *)(a1 + 64))
  {
    id v10 = [*(id *)(a1 + 56) mainQueueContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke_2;
    v13[3] = &unk_264876BF8;
    id v11 = *(id *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 72);
    id v14 = v11;
    uint64_t v15 = v12;
    [v10 performBlockAndWait:v13];
  }
}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_264(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationCenter];
  [v2 postNotificationName:@"FBKLocalDataDidDeleteUploadTask" object:*(void *)(a1 + 40)];
}

uint64_t __42__FBKData_deleteUploadForTask_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)prepareFilerFormForSubmission:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 uploadTask];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x263EFF240];
    uint64_t v6 = +[FBKUploadTask entityName];
    uint64_t v7 = [(FBKData *)self mainQueueContext];
    id v8 = [v5 insertNewObjectForEntityForName:v6 inManagedObjectContext:v7];

    [v8 setTaskIdentifier:&unk_26DE1E9A8];
    [v8 setFileURL:0];
    [v8 setLocalSubmissionStage:0];
    [v9 setUploadTask:v8];
  }
}

- (void)clearUploadTasksWithIdentifier:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = Log_5();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 134217984;
    unint64_t v29 = a3;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "clearing upload tasks with identifier %lu", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"UploadTask"];
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [v7 predicateWithFormat:@"taskIdentifier = %@", v8];
  [v6 setPredicate:v9];

  [v6 setIncludesPropertyValues:0];
  id v10 = [(FBKData *)self mainQueueContext];
  id v26 = 0;
  id v11 = [v10 executeFetchRequest:v6 error:&v26];
  id v12 = v26;

  if (v12)
  {
    id v13 = Log_5();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FBKData clearUploadTasksWithIdentifier:]();
    }
  }
  else
  {
    if (![v11 count]) {
      goto LABEL_7;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v21 = v11;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v19 = Log_5();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            -[FBKData clearUploadTasksWithIdentifier:]((uint64_t)buf, v18);
          }

          int v20 = [(FBKData *)self mainQueueContext];
          [v20 deleteObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
      id v11 = v21;
    }
  }

LABEL_7:
}

- (id)allActiveUploadTasksInContext:(id)a3
{
  int v3 = (void *)MEMORY[0x263EFF260];
  id v4 = a3;
  id v5 = +[FBKUploadTask entityName];
  uint64_t v6 = [v3 fetchRequestWithEntityName:v5];

  id v13 = 0;
  uint64_t v7 = [v4 executeFetchRequest:v6 error:&v13];

  id v8 = v13;
  if (v8)
  {
    id v9 = Log_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FBKData allActiveUploadTasksInContext:](v8);
    }
LABEL_11:

    id v11 = (id)MEMORY[0x263EFFA68];
    goto LABEL_12;
  }
  if (!v7 || ![v7 count])
  {
    id v9 = Log_5();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FBKData allActiveUploadTasksInContext:]();
    }
    goto LABEL_11;
  }
  id v10 = Log_5();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FBKData allActiveUploadTasksInContext:]();
  }

  id v11 = v7;
LABEL_12:

  return v11;
}

- (void)getFileDownloadURLForFilePromise:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 UUIDString], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = [(FBKData *)self api];
    id v10 = [v6 UUIDString];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke;
    v12[3] = &unk_264876C48;
    id v13 = v7;
    [v9 getFileDownloadURLForFilePromiseUUID:v10 completion:v12];
  }
  else
  {
    id v11 = Log_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FBKData getFileDownloadURLForFilePromise:completion:]();
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = Log_5();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_followupSubmissionBodyWithFlags:(unint64_t)a3 responses:(id)a4
{
  char v4 = a3;
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  id v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKey:@"responses"];
  }
  id v8 = [NSNumber numberWithUnsignedInteger:v4 & 4];
  [v7 setObject:v8 forKeyedSubscript:@"ignore_required"];

  id v9 = [NSNumber numberWithUnsignedInteger:v4 & 8];
  [v7 setObject:v9 forKeyedSubscript:@"used_filer"];

  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"answers_complete"];

  return v7;
}

- (void)createUnsolicitedFeedbackFollowupForItem:(id)a3 completion:(id)a4
{
}

- (void)createFeedbackFollowupOfType:(unint64_t)a3 forItem:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if ([v8 itemType] == 4)
  {
    id v10 = [v8 feedback];
    id v11 = [v10 formResponseID];

    id v12 = [v8 ID];
    if (a3 == 7)
    {
      id v13 = [v8 formResponse];
      uint64_t v14 = [v13 ID];
    }
    else
    {
      if (a3)
      {
        id v17 = v11;
        if (v11)
        {
LABEL_11:
          uint64_t v19 = Log_5();
          int v20 = v19;
          if (v12)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 67109632;
              HIDWORD(buf) = [v17 unsignedIntValue];
              __int16 v42 = 1024;
              int v43 = [v12 unsignedIntValue];
              __int16 v44 = 2048;
              unint64_t v45 = a3;
              _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_DEFAULT, "Creating FFU on FR [%u] FB [%u] type [%lu]", (uint8_t *)&buf, 0x18u);
            }

            objc_initWeak(&buf, self);
            uint64_t v21 = [(FBKData *)self api];
            v30[0] = MEMORY[0x263EF8330];
            v30[1] = 3221225472;
            v30[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_286;
            v30[3] = &unk_264876C70;
            objc_copyWeak(&v34, &buf);
            id v31 = v8;
            uint64_t v32 = self;
            id v33 = v9;
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_289;
            v25[3] = &unk_264876C98;
            id v26 = v17;
            unint64_t v29 = a3;
            uint64_t v27 = self;
            id v28 = v33;
            [v21 createFollowupWithType:a3 forFeedbackWithID:v12 success:v30 error:v25];

            objc_destroyWeak(&v34);
            objc_destroyWeak(&buf);
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[FBKData createFeedbackFollowupOfType:forItem:completion:]();
            }

            if (v9)
            {
              long long v24 = [(FBKData *)self mainQueueContext];
              v35[0] = MEMORY[0x263EF8330];
              v35[1] = 3221225472;
              v35[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_285;
              v35[3] = &unk_2648741D0;
              id v36 = v9;
              [v24 performBlockAndWait:v35];
            }
          }
LABEL_24:

          goto LABEL_25;
        }
LABEL_16:
        long long v22 = Log_5();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[FBKData createFeedbackFollowupOfType:forItem:completion:]();
        }

        if (v9)
        {
          long long v23 = [(FBKData *)self mainQueueContext];
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_284;
          v37[3] = &unk_2648741D0;
          id v38 = v9;
          [v23 performBlockAndWait:v37];
        }
        goto LABEL_24;
      }
      id v13 = [v8 feedback];
      uint64_t v14 = [v13 formResponseID];
    }
    id v17 = (void *)v14;

    uint64_t v18 = [v8 ID];

    id v12 = (void *)v18;
    if (v17) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  uint64_t v15 = Log_5();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[FBKData createFeedbackFollowupOfType:forItem:completion:]();
  }

  if (v9)
  {
    uint64_t v16 = [(FBKData *)self mainQueueContext];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke;
    v39[3] = &unk_2648741D0;
    id v40 = v9;
    [v16 performBlockAndWait:v39];

    id v17 = v40;
LABEL_25:
  }
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:-6 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_284(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:-6 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_285(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:-6 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_286(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained mainQueueContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2;
  v8[3] = &unk_264876748;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v6 = v3;
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v7;
  [v5 performBlockAndWait:v8];

  objc_destroyWeak(&v13);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained mainQueueObjectFromPrivate:*(void *)(a1 + 32)];

  char v4 = [*(id *)(a1 + 40) feedback];
  [v4 addFollowup:v3];

  id v5 = [*(id *)(a1 + 40) managedObjectContext];
  int v6 = [v5 hasChanges];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) managedObjectContext];
    id v14 = 0;
    [v7 save:&v14];
    id v8 = v14;

    if (v8)
    {
      id v9 = Log_5();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_cold_1();
      }
    }
  }
  if (*(void *)(a1 + 56))
  {
    id v10 = [*(id *)(a1 + 48) mainQueueContext];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_287;
    v11[3] = &unk_2648741F8;
    id v13 = *(id *)(a1 + 56);
    id v12 = v3;
    [v10 performBlockAndWait:v11];
  }
}

uint64_t __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_289(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_289_cold_1(a1);
  }

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_290;
    v6[3] = &unk_2648741F8;
    id v8 = *(id *)(a1 + 48);
    id v7 = v3;
    [v5 performBlockAndWait:v6];
  }
}

uint64_t __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_290(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)respondToFollowup:(id)a3 withResponses:(id)a4 collector:(id)a5 optingOut:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  objc_initWeak(location, self);
  int v16 = [v14 hasFilePromises];
  uint64_t v17 = 4;
  if (!v8) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = 10;
  if (!v16) {
    uint64_t v18 = 1;
  }
  uint64_t v19 = [(FBKData *)self _followupSubmissionBodyWithFlags:v18 | v17 responses:v13];
  [(FBKData *)self addDeviceDataToSubmissionInfo:v19 withCollector:v14];
  id v28 = v13;
  int v20 = [v12 ID];
  id WeakRetained = objc_loadWeakRetained(location);
  long long v22 = [WeakRetained api];
  long long v23 = [v12 feedback];
  long long v24 = [v23 ID];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke;
  v33[3] = &unk_264876C70;
  objc_copyWeak(&v37, location);
  id v25 = v14;
  id v34 = v25;
  id v35 = self;
  id v36 = v15;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5;
  v29[3] = &unk_264876CC0;
  id v26 = v20;
  id v30 = v26;
  id v31 = self;
  id v27 = v36;
  id v32 = v27;
  [v22 sendFollowupResponseWithData:v19 forFollowupID:v26 feedbackID:v24 success:v33 error:v29];

  objc_destroyWeak(&v37);
  objc_destroyWeak(location);
}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained mainQueueContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_2;
  v8[3] = &unk_264876748;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v6 = v3;
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v7;
  [v5 performBlock:v8];

  objc_destroyWeak(&v13);
}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  char v4 = [WeakRetained mainQueueObjectFromPrivate:*(void *)(a1 + 32)];

  LODWORD(WeakRetained) = [*(id *)(a1 + 40) hasFilePromises];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 notificationCenter];
  id v7 = objc_loadWeakRetained(v2);
  [v6 postNotificationName:@"FBKLocalDataDidChangeNotification" object:v7];

  uint64_t v8 = *(void *)(a1 + 56);
  if (WeakRetained)
  {
    if (v8)
    {
      id v9 = [*(id *)(a1 + 48) mainQueueContext];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      _DWORD v19[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_3;
      v19[3] = &unk_2648741F8;
      id v10 = &v21;
      id v21 = *(id *)(a1 + 56);
      uint64_t v11 = &v20;
      id v20 = v4;
      id v12 = v19;
LABEL_6:
      objc_msgSend(v9, "performBlockAndWait:", v12, v13, v14, v15, v16, v17);
    }
  }
  else if (v8)
  {
    id v9 = [*(id *)(a1 + 48) mainQueueContext];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_4;
    int v16 = &unk_2648741F8;
    id v10 = &v18;
    id v18 = *(id *)(a1 + 56);
    uint64_t v11 = &v17;
    id v17 = v4;
    id v12 = &v13;
    goto LABEL_6;
  }
}

uint64_t __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5_cold_1(a1);
  }

  id v5 = [MEMORY[0x263F08A48] mainQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_292;
  v8[3] = &unk_264874388;
  id v6 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 addOperationWithBlock:v8];
}

uint64_t __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_292(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) reloadAllContentWithCompletion:0];
  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 40) description];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing all content, encountered error on respond to FFU: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deleteUnsolicitedFollowup:(id)a3 withFeedbackItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke;
  aBlock[3] = &unk_264876D10;
  void aBlock[4] = self;
  id v11 = v9;
  id v38 = v11;
  id v12 = v8;
  id v39 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = [v11 feedback];
  id v15 = [v14 contentItem];
  int v16 = [v15 formResponseStub];

  if (v16 && ([v16 ID], id v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    objc_initWeak(&location, self);
    long long v24 = [(FBKData *)self api];
    long long v23 = [v12 ID];
    id v18 = [v11 feedback];
    uint64_t v19 = [v18 ID];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2_295;
    v29[3] = &unk_264876D60;
    id v30 = v10;
    id v31 = v13;
    objc_copyWeak(&v32, &location);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_4;
    v25[3] = &unk_264876DB0;
    id v26 = v31;
    id v27 = v30;
    objc_copyWeak(&v28, &location);
    [v24 deleteFollowupWithID:v23 feedbackID:v19 success:v29 error:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }
  else
  {
    id v20 = Log_5();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[FBKData deleteUnsolicitedFollowup:withFeedbackItem:completion:]();
    }

    if (v10)
    {
      id v21 = [(FBKData *)self mainQueueContext];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_294;
      v34[3] = &unk_264876D38;
      id v35 = v10;
      id v36 = v13;
      [v21 performBlockAndWait:v34];
    }
    long long v22 = [(FBKData *)self notificationCenter];
    [v22 postNotificationName:@"FBKLocalDataDidChangeNotification" object:self];
  }
}

id __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke(id *a1)
{
  id v2 = [a1[4] mainQueueContext];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  id v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2;
  v6[3] = &unk_264876CE8;
  id v7 = a1[5];
  id v8 = a1[6];
  id v3 = v2;
  id v9 = v3;
  id v10 = &v11;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v4;
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) feedback];
  [v2 deleteFollowup:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  [v3 save:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_294(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2_295(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_3;
  block[3] = &unk_264876D60;
  id v3 = a1[4];
  id v4 = a1[5];
  objc_copyWeak(&v5, a1 + 6);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained(v4);
  id v5 = [WeakRetained notificationCenter];
  id v6 = objc_loadWeakRetained(v4);
  [v5 postNotificationName:@"FBKLocalDataDidChangeNotification" object:v6];
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5;
  v5[3] = &unk_264876D88;
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v9);
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5(void *a1)
{
  uint64_t v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_2();
  }

  id v3 = (*(void (**)(void))(a1[5] + 16))();
  if (v3)
  {
    id v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_1();
    }
  }
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, a1[4]);
  }
  id v6 = (id *)(a1 + 7);
  id WeakRetained = objc_loadWeakRetained(v6);
  id v8 = [WeakRetained notificationCenter];
  id v9 = objc_loadWeakRetained(v6);
  [v8 postNotificationName:@"FBKLocalDataDidChangeNotification" object:v9];
}

- (void)feedbackFollowupForID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FBKData *)self api];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__FBKData_feedbackFollowupForID_completion___block_invoke;
  v10[3] = &unk_264876DD8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  void v10[4] = self;
  id v11 = v9;
  [v8 getFeedbackFollowupWithID:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __44__FBKData_feedbackFollowupForID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v7 = [WeakRetained mainQueueObjectFromPrivate:v5];
  }
  if (a1[5])
  {
    id v9 = [a1[4] mainQueueContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__FBKData_feedbackFollowupForID_completion___block_invoke_2;
    v10[3] = &unk_264874450;
    id v13 = a1[5];
    id v11 = v7;
    id v12 = v6;
    [v9 performBlockAndWait:v10];
  }
}

uint64_t __44__FBKData_feedbackFollowupForID_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)createEnhancedLoggingFollowupForItem:(id)a3 completion:(id)a4
{
}

- (void)refreshAnnouncementFromContentItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 detailedItem];
  if (!v8)
  {
    id v9 = +[FBKLog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_INFO, "no announcement for item, Will fetch", (uint8_t *)buf, 2u);
    }
    goto LABEL_8;
  }
  id v9 = v8;
  id v10 = [v6 updatedAt];
  id v11 = [v9 updatedAt];
  uint64_t v12 = [v10 compare:v11];

  if (v12 == 1)
  {
    id v13 = +[FBKLog appHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_INFO, "announcement is stale, will refresh", (uint8_t *)buf, 2u);
    }

LABEL_8:
    objc_initWeak(buf, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    _DWORD v14[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke;
    v14[3] = &unk_264876E28;
    objc_copyWeak(&v17, buf);
    id v15 = v6;
    id v16 = v7;
    [(FBKData *)self takeMainQueueObject:v15 andContinueWithPrivateQueueObject:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
    id v9 = 0;
    goto LABEL_11;
  }
  if (v7) {
    (*((void (**)(id, NSObject *, void))v7 + 2))(v7, v9, 0);
  }
LABEL_11:
}

void __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = [WeakRetained api];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_2;
  v6[3] = &unk_264876E00;
  id v7 = a1[4];
  id v8 = a1[5];
  objc_copyWeak(&v9, a1 + 6);
  [v5 fetchAnnouncementForContentItem:v3 withCompletion:v6];

  objc_destroyWeak(&v9);
}

void __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3;
    block[3] = &unk_264874588;
    id v18 = a1[4];
    id v20 = a1[5];
    id v19 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v7 = v18;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v9 = [WeakRetained mainQueueObjectFromPrivate:v5];

    id v10 = objc_loadWeakRetained(a1 + 6);
    id v11 = [v10 mainQueueContext];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_296;
    v12[3] = &unk_2648766F8;
    objc_copyWeak(&v16, a1 + 6);
    id v13 = a1[4];
    id v15 = a1[5];
    id v7 = v9;
    id v14 = v7;
    [v11 performBlock:v12];

    objc_destroyWeak(&v16);
  }
}

uint64_t __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_296(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained mainQueueContext];
  [v3 refreshObject:*(void *)(a1 + 32) mergeChanges:1];

  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) ID];
    v7[0] = 67109120;
    v7[1] = [v5 intValue];
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_INFO, "Did fetch announcement [%i]", (uint8_t *)v7, 8u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 40), 0);
  }
  return result;
}

- (void)markAnnouncementRead:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 ID];
  id v9 = [(FBKData *)self api];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke;
  v17[3] = &unk_264874388;
  id v18 = v6;
  id v19 = self;
  id v20 = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_4;
  v13[3] = &unk_2648742C0;
  id v15 = self;
  id v16 = v20;
  id v14 = v8;
  id v10 = v20;
  id v11 = v8;
  id v12 = v6;
  [v9 acknowledgeAnnouncementWithID:v11 success:v17 error:v13];
}

void __43__FBKData_markAnnouncementRead_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_2;
  v6[3] = &unk_264874388;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v2 performBlock:v6];
}

void __43__FBKData_markAnnouncementRead_completion___block_invoke_2(id *a1)
{
  [a1[4] setUnread:0];
  uint64_t v2 = [a1[4] contentItem];
  [v2 markAsRead];

  if (([a1[4] hasChanges] & 1) != 0
    || ([a1[4] contentItem],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 hasChanges],
        v3,
        v4))
  {
    id v5 = [a1[4] managedObjectContext];
    id v12 = 0;
    [v5 save:&v12];
    id v6 = v12;

    if (v6) {
      goto LABEL_6;
    }
    id v7 = [a1[5] notificationCenter];
    [v7 postNotificationName:@"FBKLocalDataDidChangeNotification" object:a1[5]];
  }
  id v6 = 0;
LABEL_6:
  if (a1[6])
  {
    uint64_t v8 = [a1[5] mainQueueContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_3;
    v9[3] = &unk_2648741F8;
    id v11 = a1[6];
    id v10 = v6;
    [v8 performBlockAndWait:v9];
  }
}

uint64_t __43__FBKData_markAnnouncementRead_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __43__FBKData_markAnnouncementRead_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__FBKData_markAnnouncementRead_completion___block_invoke_4_cold_1(a1);
  }

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_298;
    v6[3] = &unk_2648741F8;
    id v8 = *(id *)(a1 + 48);
    id v7 = v3;
    [v5 performBlockAndWait:v6];
  }
}

uint64_t __43__FBKData_markAnnouncementRead_completion___block_invoke_298(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)recordConsentResponseForConsent:(id)a3 response:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = Log_5();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    id v12 = [v8 ID];
    *(_DWORD *)id buf = 138543618;
    id v27 = v11;
    __int16 v28 = 1024;
    int v29 = [v12 intValue];
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "User responded [%{public}@] to consent with ID [%d]", buf, 0x12u);
  }
  [(FBKData *)self setPendingConsents:0];
  id v13 = [(FBKData *)self api];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke;
  v21[3] = &unk_264874360;
  BOOL v25 = v6;
  id v22 = v8;
  long long v23 = self;
  id v24 = v9;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_6;
  v16[3] = &unk_264876E50;
  BOOL v20 = v6;
  id v17 = v22;
  id v18 = self;
  id v19 = v24;
  id v14 = v24;
  id v15 = v22;
  [v13 respondToConsent:v15 didAgree:v6 success:v21 error:v16];
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2;
  v5[3] = &unk_264874360;
  char v9 = *(unsigned char *)(a1 + 56);
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) || ![*(id *)(a1 + 32) isRequired])
  {
    [*(id *)(a1 + 40) setPendingConsents:0];
    if (!*(void *)(a1 + 48)) {
      return;
    }
    id v5 = [*(id *)(a1 + 40) mainQueueContext];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_5;
    v6[3] = &unk_2648741D0;
    id v7 = *(id *)(a1 + 48);
    [v5 performBlockAndWait:v6];

    int v4 = v7;
  }
  else
  {
    id v2 = [*(id *)(a1 + 40) loginManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3;
    v8[3] = &unk_264874038;
    uint64_t v3 = *(void **)(a1 + 48);
    void v8[4] = *(void *)(a1 + 40);
    id v9 = v3;
    [v2 logOutIfNeededAndRun:v8];

    int v4 = v9;
  }
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingConsents:0];
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) mainQueueContext];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_4;
    v3[3] = &unk_2648741D0;
    id v4 = *(id *)(a1 + 40);
    [v2 performBlockAndWait:v3];
  }
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7;
  block[3] = &unk_2648744E8;
  id v9 = v3;
  char v13 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7(uint64_t a1)
{
  id v2 = Log_5();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7_cold_1();
  }

  if (*(unsigned char *)(a1 + 64) || ![*(id *)(a1 + 40) isRequired])
  {
    [*(id *)(a1 + 48) setPendingConsents:0];
    if (!*(void *)(a1 + 56)) {
      return;
    }
    id v6 = [*(id *)(a1 + 48) mainQueueContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    _DWORD v7[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3_307;
    v7[3] = &unk_2648741D0;
    id v8 = *(id *)(a1 + 56);
    [v6 performBlockAndWait:v7];

    uint64_t v5 = v8;
  }
  else
  {
    id v3 = [*(id *)(a1 + 48) loginManager];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_305;
    v9[3] = &unk_264874038;
    id v4 = *(void **)(a1 + 56);
    void v9[4] = *(void *)(a1 + 48);
    id v10 = v4;
    [v3 logOutIfNeededAndRun:v9];

    uint64_t v5 = v10;
  }
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_305(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingConsents:0];
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) mainQueueContext];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2_306;
    v3[3] = &unk_2648741D0;
    id v4 = *(id *)(a1 + 40);
    [v2 performBlockAndWait:v3];
  }
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2_306(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3_307(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)destroyPersistentStoreWithUrl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKData *)self persistentStoreCoordinatorInternal];
  id v6 = [(FBKData *)self persistentStoreType];
  uint64_t v9 = 0;
  [v5 destroyPersistentStoreAtURL:v4 withType:v6 options:MEMORY[0x263EFFA78] error:&v9];

  uint64_t v7 = v9;
  if (v7)
  {
    id v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FBKData destroyPersistentStoreWithUrl:]();
    }
  }
}

+ (void)addFetchedFormResponseProperty:(id)a3 forAnswersWithRole:(id)a4 toModel:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 entitiesByName];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"FormResponse"];

  id v12 = objc_alloc_init(MEMORY[0x263EFF268]);
  [v12 setName:v9];

  id v17 = @"role";
  v18[0] = v8;
  char v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  [v12 setUserInfo:v13];
  id v14 = [v11 properties];
  id v15 = [v14 arrayByAddingObject:v12];
  [v11 setProperties:v15];

  id v16 = [v7 fetchRequestTemplateForName:@"AnswersWithRole"];

  [v16 setFetchOffset:0];
  [v12 setFetchRequest:v16];
}

- (id)managedObjectModel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__FBKData_managedObjectModel__block_invoke;
  block[3] = &unk_264873FE8;
  void block[4] = self;
  if (managedObjectModel_onceToken != -1) {
    dispatch_once(&managedObjectModel_onceToken, block);
  }
  return (id)managedObjectModel_managedObjectModel;
}

void __29__FBKData_managedObjectModel__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundle];
  id v2 = [v1 URLForResource:@"Feedback" withExtension:@"momd"];

  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v2];
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() modelWithFormResponsePropertiesFromModel:v3];
    uint64_t v5 = (void *)managedObjectModel_managedObjectModel;
    managedObjectModel_managedObjectModel = v4;
  }
  else
  {
    id v6 = Log_5();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __29__FBKData_managedObjectModel__block_invoke_cold_1();
    }
  }
}

+ (id)modelWithFormResponsePropertiesFromModel:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  [a1 addFetchedFormResponseProperty:@"titleAnswers" forAnswersWithRole:@":title" toModel:v4];
  [a1 addFetchedFormResponseProperty:@"problemDescriptionAnswers" forAnswersWithRole:@":description" toModel:v4];
  [a1 addFetchedFormResponseProperty:@"issueAreaAnswers" forAnswersWithRole:@":area" toModel:v4];
  [a1 addFetchedFormResponseProperty:@"issueTypeAnswers" forAnswersWithRole:@":type" toModel:v4];

  return v4;
}

- (void)privateQueueContextDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKData *)self loginManager];
  uint64_t v6 = [v5 loginState];

  if (v6)
  {
    objc_initWeak(location, self);
    id v7 = [(FBKData *)self mainQueueContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__FBKData_privateQueueContextDidSave___block_invoke;
    v9[3] = &unk_2648765E0;
    objc_copyWeak(&v11, location);
    id v10 = v4;
    [v7 performBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    id v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "logged out will not merge private into main context", (uint8_t *)location, 2u);
    }
  }
}

void __38__FBKData_privateQueueContextDidSave___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained mainQueueContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 32)];
}

- (void)mainQueueContextDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKData *)self loginManager];
  uint64_t v6 = [v5 loginState];

  if (v6)
  {
    objc_initWeak(location, self);
    id v7 = [(FBKData *)self privateQueueContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__FBKData_mainQueueContextDidSave___block_invoke;
    v9[3] = &unk_2648765E0;
    objc_copyWeak(&v11, location);
    id v10 = v4;
    [v7 performBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    id v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "logged out will not merge main into private context", (uint8_t *)location, 2u);
    }
  }
}

void __35__FBKData_mainQueueContextDidSave___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained privateQueueContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 32)];
}

- (id)persistentStoreType
{
  BOOL v2 = +[FBKSharedConstants usesPersistentStore];
  id v3 = (void **)MEMORY[0x263EFF000];
  if (v2) {
    id v3 = (void **)MEMORY[0x263EFF168];
  }
  id v4 = *v3;

  return v4;
}

- (id)bundle
{
  BOOL v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (void)resetAllLocalDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = Log_5();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Resetting local data", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v6 = [(FBKData *)self privateQueueContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __43__FBKData_resetAllLocalDataWithCompletion___block_invoke;
  v8[3] = &unk_2648746C0;
  objc_copyWeak(&v10, buf);
  void v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 performBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained privateQueueContext];
  [v4 reset];

  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 mainQueueContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2;
  v8[3] = &unk_2648746C0;
  objc_copyWeak(&v10, v2);
  id v7 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v6 performBlock:v8];

  objc_destroyWeak(&v10);
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained mainQueueContext];
  [v4 reset];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setIsRefreshingContent:0];

  id v6 = objc_loadWeakRetained(v2);
  [v6 setIsRefreshingForms:0];

  id v7 = objc_loadWeakRetained(v2);
  id v8 = [v7 persistentStoreCoordinatorInternal];
  id v9 = [v8 persistentStores];
  id v10 = [v9 firstObject];

  id v11 = objc_loadWeakRetained(v2);
  id v12 = [v11 persistentStoreCoordinatorInternal];
  char v13 = [v12 URLForPersistentStore:v10];

  id v14 = objc_loadWeakRetained(v2);
  id v15 = [v14 persistentStoreCoordinatorInternal];
  id v30 = 0;
  [v15 removePersistentStore:v10 error:&v30];
  id v16 = v30;

  if (v16)
  {
    id v17 = Log_5();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_3();
    }
  }
  id v18 = [MEMORY[0x263F08AB0] processInfo];
  id v19 = [v18 environment];
  BOOL v20 = [v19 objectForKeyedSubscript:@"FBK_UNIT_TEST"];
  if (v20)
  {

LABEL_7:
    goto LABEL_12;
  }
  id v21 = [*(id *)(a1 + 32) persistentStoreType];
  char v22 = [v21 isEqualToString:*MEMORY[0x263EFF000]];

  if ((v22 & 1) == 0)
  {

    long long v23 = [MEMORY[0x263F08850] defaultManager];
    id v29 = 0;
    [v23 removeItemAtURL:v13 error:&v29];
    id v16 = v29;

    if (v16)
    {
      id v18 = Log_5();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_2();
      }
      goto LABEL_7;
    }
  }
LABEL_12:

  id v24 = objc_loadWeakRetained(v2);
  id v28 = 0;
  id v25 = (id)[v24 createPersistentStoreError:&v28];
  id v26 = v28;

  if (v26)
  {
    id v27 = Log_5();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)deleteEntityWithRequest:(id)a3 inContext:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263EFF1D0];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithFetchRequest:v7];

  id v12 = 0;
  id v9 = (id)[v5 executeRequest:v8 error:&v12];
  id v10 = v12;

  return v10;
}

- (id)persistentStoreCoordinatorURL
{
  BOOL v2 = +[FBKFileManager applicationSupportDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"feedback.sqlite"];

  return v3;
}

- (void)_logUploadTasks
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "logging all upload tasks", v2, v3, v4, v5, v6);
}

- (void)beginSubmissionForFormResponse:(id)a3 withCollector:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 ID];
  int v12 = [v11 intValue];

  int v13 = [v9 hasFilePromises];
  id v14 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109376;
    int v33 = v12;
    __int16 v34 = 1024;
    int v35 = v13;
    _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "user did begin feedback submission for form [%d], has files? [%d]", buf, 0xEu);
  }

  id v15 = [MEMORY[0x263EFF910] date];
  [v8 setCreatedAt:v15];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke;
  aBlock[3] = &unk_2648745B0;
  id v16 = v8;
  id v30 = v16;
  id v31 = v10;
  id v17 = v10;
  id v18 = _Block_copy(aBlock);
  [(FBKData *)self prepareFilerFormForSubmission:v16];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2;
  v22[3] = &unk_264876EA0;
  int v27 = v12;
  id v23 = v16;
  id v24 = self;
  char v28 = v13;
  id v25 = v9;
  id v26 = v18;
  id v19 = v9;
  id v20 = v18;
  id v21 = v16;
  [(FBKData *)self saveFormResponse:v21 completion:v22];
}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!v4 && +[FBKSharedConstants isRunningInFBA])
  {
    uint64_t v3 = [*(id *)(a1 + 32) ID];
    +[FBKSharedConstants deleteAttachmentLegalTextForDraftID:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    uint8_t v6 = [*(id *)(a1 + 32) managedObjectContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    _DWORD v14[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_3;
    v14[3] = &unk_264876E78;
    char v19 = *(unsigned char *)(a1 + 68);
    int v18 = *(_DWORD *)(a1 + 64);
    int8x16_t v12 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v12.i64[0];
    int8x16_t v15 = vextq_s8(v12, v12, 8uLL);
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    [v6 performBlockAndWait:v14];

    id v8 = (void *)v15.i64[1];
LABEL_10:

    goto LABEL_11;
  }
  if (!FBKSErrorContainsSP2ErrorCode())
  {
    id v9 = +[FBKLog clientHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_cold_1(a1, v3);
    }

    id v10 = [*(id *)(a1 + 32) managedObjectContext];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    _DWORD v20[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_343;
    v20[3] = &unk_264876860;
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v13.i64[0];
    int8x16_t v21 = vextq_s8(v13, v13, 8uLL);
    id v23 = *(id *)(a1 + 56);
    id v22 = v3;
    [v10 performBlockAndWait:v20];

    id v8 = (void *)v21.i64[1];
    goto LABEL_10;
  }
  id v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)id buf = 67109120;
    int v25 = v5;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Failed due to authentication error while submitting response [%i]. FBK will retry with device token", buf, 8u);
  }

LABEL_11:
}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_343(id *a1)
{
  id v2 = a1[4];
  id v3 = [a1[5] uploadTask];
  [v2 updateTask:v3 withSubmissionStage:5];

  if (a1[7])
  {
    id v4 = [a1[4] mainQueueContext];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_344;
    v5[3] = &unk_2648741F8;
    id v7 = a1[7];
    id v6 = a1[6];
    [v4 performBlockAndWait:v5];
  }
}

uint64_t __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_344(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 68);
  id v3 = Log_5();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v5 = *(_DWORD *)(a1 + 64);
      int v8 = 67109120;
      int v9 = v5;
      _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "form [%i] has files, will begin upload", (uint8_t *)&v8, 8u);
    }

    return [*(id *)(a1 + 32) beginFileSubmissionForFilerForm:*(void *)(a1 + 40) withCollector:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    if (v4)
    {
      int v7 = *(_DWORD *)(a1 + 64);
      int v8 = 67109120;
      int v9 = v7;
      _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "no files, making form [%i] as complete", (uint8_t *)&v8, 8u);
    }

    return [*(id *)(a1 + 32) markFormResponseComplete:*(void *)(a1 + 40) withFiles:0 collector:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (void)beginFileSubmissionForFilerForm:(id)a3 withCollector:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = Log_5();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int8x16_t v12 = [v8 filerFormID];
    *(_DWORD *)id buf = 67109120;
    int v29 = [v12 intValue];
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "beginning file submission with form %d", buf, 8u);
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke;
  aBlock[3] = &unk_264874400;
  id v14 = v9;
  id v24 = v14;
  id v15 = v8;
  id v25 = v15;
  uint64_t v26 = self;
  id v16 = v10;
  id v27 = v16;
  id v17 = _Block_copy(aBlock);
  int v18 = v17;
  if (isKindOfClass)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    _DWORD v19[2] = __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_349;
    v19[3] = &unk_264876F10;
    id v20 = v15;
    id v21 = v16;
    id v22 = v18;
    [(FBKData *)self markFormResponseComplete:v20 withFiles:1 collector:v14 completion:v19];
  }
  else
  {
    (*((void (**)(void *))v17 + 2))(v17);
  }
}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke(void *a1)
{
  id v3 = (void *)a1[4];
  int v2 = (void *)a1[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_2;
  v7[3] = &unk_264876EE8;
  id v4 = v2;
  uint64_t v5 = a1[6];
  id v6 = (void *)a1[7];
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  [v3 commitAllFilesForForm:v4 withCompletion:v7];
}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a2, "ded_selectItemsPassingTest:", &__block_literal_global_347);
  if (+[FBKSharedConstants tracksFileUploadsLocally])
  {
    id v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) filerFormID];
      *(_DWORD *)id buf = 138543362;
      uint64_t v26 = v5;
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Tracking file uploads locally for FilerForm [%{public}@]", buf, 0xCu);
    }
    id v6 = [*(id *)(a1 + 32) uploadTask];
    [v6 addFBKSessionsWithDEDSessions:v3];

    int v7 = [*(id *)(a1 + 32) filerFormID];
    id v8 = [*(id *)(a1 + 32) uploadTask];
    [v8 setTaskIdentifier:v7];

    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) uploadTask];
    [v9 updateTask:v10 withSubmissionStage:2];

    id v11 = [*(id *)(a1 + 40) notificationCenter];
    [v11 postNotificationName:@"FBKLocalDataDidChangeNotification" object:*(void *)(a1 + 40)];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
          int v18 = objc_msgSend(*(id *)(a1 + 40), "uploadManager", (void)v20);
          [v17 setUploadDelegate:v18];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    char v19 = [*(id *)(a1 + 40) uploadManager];
    [v19 trackUploadIfNeeded:*(void *)(a1 + 32)];
  }
  else if (![*(id *)(a1 + 32) filerFormType] && objc_msgSend(v3, "count"))
  {
    [*(id *)(a1 + 40) storeUploadWithFormResponse:*(void *)(a1 + 32) bugSessions:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 filePromises];
  uint64_t v4 = [v3 count];

  uint64_t v5 = +[FBKLog ded];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v2 identifier];
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "did commit session [%{public}@] with [%i] promises", (uint8_t *)&v10, 0x12u);
  }
  if (!v4)
  {
    int v7 = +[FBKLog ded];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v2 identifier];
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "session [%{public}@] has no promises, will not track", (uint8_t *)&v10, 0xCu);
    }
  }

  return v4 != 0;
}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_349(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = Log_5();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_349_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)markFormResponseComplete:(id)a3 withFiles:(BOOL)a4 collector:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v25 = a6;
  __int16 v12 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v10 ID];
    *(_DWORD *)id buf = 67109376;
    int v39 = [v13 intValue];
    __int16 v40 = 1024;
    BOOL v41 = v8;
    _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "marking form response [%i] complete with files [%i]", buf, 0xEu);
  }
  uint64_t v14 = [v10 ID];
  int v15 = [v14 intValue];

  uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  if ([v10 collectsFiles])
  {
    [(FBKData *)self addDeviceDataToSubmissionInfo:v16 withCollector:v11];
  }
  else
  {
    id v17 = +[FBKLog clientHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[FBKData markFormResponseComplete:withFiles:collector:completion:]();
    }
  }
  int v18 = [(FBKData *)self api];
  char v19 = [v10 ID];
  long long v20 = [v10 bugForm];
  long long v21 = [v20 ID];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke;
  v31[3] = &unk_264876E78;
  int v36 = v15;
  BOOL v37 = v8;
  id v32 = v10;
  int v33 = self;
  id v34 = v11;
  id v35 = v25;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7;
  v26[3] = &unk_264876F88;
  int v30 = v15;
  id v27 = v32;
  char v28 = self;
  id v29 = v35;
  id v22 = v35;
  id v23 = v32;
  id v24 = v11;
  [v18 markCompleteForFormResponseWithID:v19 bugFormID:v21 withFiles:v8 metadata:v16 success:v31 error:v26];
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2;
  v6[3] = &unk_264876E78;
  id v3 = *(id *)(a1 + 32);
  int v11 = *(_DWORD *)(a1 + 64);
  char v12 = *(unsigned char *)(a1 + 68);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 56);
  [v2 performBlockAndWait:v6];
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setCompleted:1];
  id v2 = +[FBKLog clientHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)id buf = 67109120;
    int v32 = v3;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "did mark form response [%d] complete", buf, 8u);
  }

  if (!*(unsigned char *)(a1 + 68))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) uploadTask];
    [v4 updateTask:v5 withSubmissionStage:0];

    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) uploadTask];
    [v6 deleteUploadForTask:v7 completion:0];
  }
  id v8 = *(id *)(a1 + 48);
  id v9 = [v8 deferredAttachmentCollections];
  if ([v9 count])
  {
    id v10 = [v9 anyObject];
    int v11 = [v10 allMatchers];
    char v12 = [v11 anyObject];
    int v13 = [v12 filePredicate];

    if (v13)
    {
      uint64_t v14 = *(void **)(a1 + 40);
      int v15 = [*(id *)(a1 + 32) contentItem];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_352;
      v22[3] = &unk_264876F60;
      uint64_t v16 = &v26;
      id v17 = *(id *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 40);
      id v26 = v17;
      void v22[4] = v18;
      id v23 = v8;
      id v24 = *(id *)(a1 + 32);
      id v25 = v13;
      [v14 createEnhancedLoggingFollowupForItem:v15 completion:v22];
    }
    else
    {
      long long v20 = Log_5();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_cold_1();
      }

      if (!*(void *)(a1 + 56)) {
        goto LABEL_15;
      }
      long long v21 = [*(id *)(a1 + 40) mainQueueContext];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_351;
      v27[3] = &unk_2648741D0;
      uint64_t v16 = &v28;
      id v28 = *(id *)(a1 + 56);
      [v21 performBlockAndWait:v27];
    }
LABEL_15:

    goto LABEL_16;
  }
  if (*(void *)(a1 + 56))
  {
    char v19 = [*(id *)(a1 + 40) mainQueueContext];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_350;
    v29[3] = &unk_2648741D0;
    id v30 = *(id *)(a1 + 56);
    [v19 performBlockAndWait:v29];

    int v13 = v30;
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_350(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_351(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_352(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_4;
    v13[3] = &unk_264876F38;
    id v8 = &v17;
    id v11 = *(id *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 32);
    id v17 = v11;
    void v13[4] = v12;
    id v14 = *(id *)(a1 + 48);
    id v15 = v5;
    id v16 = *(id *)(a1 + 56);
    +[FBKDEDHelper completeEnhancedLoggingWithFollowup:v15 devicesController:v10 completion:v13];

    id v9 = v14;
    goto LABEL_5;
  }
  if (*(void *)(a1 + 64))
  {
    id v7 = [*(id *)(a1 + 32) mainQueueContext];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_3;
    v18[3] = &unk_2648741F8;
    id v8 = &v20;
    id v20 = *(id *)(a1 + 64);
    id v19 = v6;
    [v7 performBlockAndWait:v18];

    id v9 = v19;
LABEL_5:
  }
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (*(void *)(a1 + 64))
    {
      id v7 = [*(id *)(a1 + 32) mainQueueContext];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      _DWORD v14[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_5;
      v14[3] = &unk_2648741F8;
      id v8 = &v16;
      id v16 = *(id *)(a1 + 64);
      id v15 = v6;
      [v7 performBlockAndWait:v14];

      id v9 = v15;
LABEL_6:
    }
  }
  else
  {
    uint64_t v10 = +[FBKEnhancedLoggingPersistence sharedInstance];
    id v11 = [*(id *)(a1 + 40) contentItem];
    [v10 saveSessionForContentItem:v11 followup:*(void *)(a1 + 48) filePredicate:*(void *)(a1 + 56) devices:v5];

    if (*(void *)(a1 + 64))
    {
      id v9 = [*(id *)(a1 + 32) mainQueueContext];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      void v12[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_6;
      v12[3] = &unk_2648741D0;
      id v8 = &v13;
      id v13 = *(id *)(a1 + 64);
      [v9 performBlockAndWait:v12];
      goto LABEL_6;
    }
  }
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = Log_5();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7_cold_1();
  }

  if (FBKSErrorContainsSP2ErrorCode())
  {
    id v5 = Log_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)id buf = 67109120;
      int v15 = v6;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Failed due to authentication error while marking response [%i] complete. FBK will retry with device token", buf, 8u);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_355;
    v10[3] = &unk_264876860;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    id v13 = *(id *)(a1 + 48);
    id v12 = v3;
    [v7 performBlockAndWait:v10];
  }
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_355(id *a1)
{
  id v2 = a1[4];
  id v3 = [a1[5] uploadTask];
  [v2 updateTask:v3 withSubmissionStage:7];

  if (a1[7])
  {
    uint64_t v4 = [a1[4] mainQueueContext];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_356;
    v5[3] = &unk_2648741F8;
    id v7 = a1[7];
    id v6 = a1[6];
    [v4 performBlockAndWait:v5];
  }
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_356(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)beginSubmissionForFollowup:(id)a3 withResponses:(id)a4 didOptOut:(BOOL)a5 withCollector:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v12 ID];
  int v17 = [v16 intValue];

  int v18 = [v14 hasFilePromises];
  id v19 = Log_5();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      *(_DWORD *)id buf = 67109120;
      int v34 = v17;
      _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "FFU [%i] submission with files", buf, 8u);
    }

    [(FBKData *)self prepareFilerFormForSubmission:v12];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke;
    v26[3] = &unk_264876FB0;
    int v31 = v17;
    long long v21 = &v30;
    id v30 = v15;
    id v27 = v12;
    id v28 = v13;
    id v29 = v14;
    BOOL v32 = v9;
    id v22 = v15;
    [(FBKData *)self beginFileSubmissionForFilerForm:v27 withCollector:v29 completion:v26];
  }
  else
  {
    if (v20)
    {
      *(_DWORD *)id buf = 67109120;
      int v34 = v17;
      _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "FFU [%i] submission without files", buf, 8u);
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_358;
    v24[3] = &unk_264875C88;
    long long v21 = &v25;
    id v25 = v15;
    id v23 = v15;
    [(FBKData *)self respondToFollowup:v12 withResponses:v13 collector:v14 optingOut:v9 completion:v24];
  }
}

void __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[FBKLog ffu];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = +[FBKData sharedInstance];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 68);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_357;
    v10[3] = &unk_264875C88;
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    [v5 respondToFollowup:v6 withResponses:v7 collector:v9 optingOut:v8 completion:v10];
  }
}

uint64_t __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_357(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_358(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDeviceDataToSubmissionInfo:(id)a3 withCollector:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FBKData *)self localDeviceForSubmission];
  uint64_t v9 = [v8 identifier];
  uint64_t v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = @"Unknown";
  }
  [v6 setObject:v11 forKeyedSubscript:@"from_identifier"];

  if (v7)
  {
    id v12 = [v7 deviceDataForSubmission];
    [v6 setObject:v12 forKeyedSubscript:@"devices"];
    id v13 = [v12 ded_mapWithBlock:&__block_literal_global_370];
    id v14 = Log_5();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "Will send devices: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v12 = Log_5();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FBKData addDeviceDataToSubmissionInfo:withCollector:]();
    }
  }
}

uint64_t __55__FBKData_addDeviceDataToSubmissionInfo_withCollector___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"identifier"];
}

- (id)localDeviceForSubmission
{
  id v2 = +[FBKDeviceManager sharedInstance];
  id v3 = [v2 thisDevice];

  return v3;
}

- (void)deleteFilePromiseWithUUID:(id)a3 object:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FBKData *)self api];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke;
  v15[3] = &unk_264877020;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [v11 deleteFilePromiseWithUUID:v13 completion:v15];
}

void __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] mainQueueContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2;
  v7[3] = &unk_264876FF8;
  id v8 = v3;
  id v9 = a1[5];
  id v10 = v4;
  id v11 = a1[6];
  id v12 = a1[7];
  id v5 = v4;
  id v6 = v3;
  [v5 performBlock:v7];
}

uint64_t __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2(void *a1)
{
  if (a1[4]) {
    return (*(uint64_t (**)(void))(a1[8] + 16))();
  }
  id v2 = (void **)(a1 + 5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = (uint64_t)&unk_26DE1E9C0;
    uint64_t v4 = *v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = Log_5();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_2();
      }

      goto LABEL_10;
    }
    uint64_t v4 = *v2;
    uint64_t v3 = 14;
  }
  [v4 setStatusEnum:v3];
LABEL_10:
  id v6 = (void *)a1[6];
  id v10 = 0;
  [v6 save:&v10];
  id v7 = v10;
  if (v7)
  {
    id v8 = Log_5();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (NSManagedObjectContext)mainQueueContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSManagedObjectContext)privateQueueContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24, 1);
}

- (FBKLoginManager)loginManager
{
  return self->_loginManager;
}

- (void)setLoginManager:(id)a3
{
}

- (FBKSeedPortalAPI)api
{
  return self->_api;
}

- (void)setApi:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (BOOL)isRefreshingContent
{
  return self->_isRefreshingContent;
}

- (void)setIsRefreshingContent:(BOOL)a3
{
  self->_isRefreshingContent = a3;
}

- (BOOL)isRefreshingForms
{
  return self->_isRefreshingForms;
}

- (void)setIsRefreshingForms:(BOOL)a3
{
  self->_isRefreshingForms = a3;
}

- (FBKUser)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
}

- (NSArray)pendingConsents
{
  return self->_pendingConsents;
}

- (void)setPendingConsents:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinatorInternal
{
  return self->_persistentStoreCoordinatorInternal;
}

- (void)setPersistentStoreCoordinatorInternal:(id)a3
{
}

- (id)formReloadCompletion
{
  return self->_formReloadCompletion;
}

- (void)setFormReloadCompletion:(id)a3
{
}

- (BOOL)hasFinishedFirstLoad
{
  return self->_hasFinishedFirstLoad;
}

- (void)setHasFinishedFirstLoad:(BOOL)a3
{
  self->_hasFinishedFirstLoad = a3;
}

- (BOOL)fetchedAFormByTat
{
  return self->_fetchedAFormByTat;
}

- (void)setFetchedAFormByTat:(BOOL)a3
{
  self->_fetchedAFormByTat = a3;
}

- (void)setUploadManager:(id)a3
{
}

- (BOOL)isRefreshingTeams
{
  return self->_isRefreshingTeams;
}

- (void)setIsRefreshingTeams:(BOOL)a3
{
  self->_isRefreshingTeams = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadManager, 0);
  objc_storeStrong(&self->_formReloadCompletion, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinatorInternal, 0);
  objc_storeStrong((id *)&self->_pendingConsents, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_api, 0);
  objc_storeStrong((id *)&self->_loginManager, 0);
  objc_storeStrong((id *)&self->_privateQueueContext, 0);

  objc_storeStrong((id *)&self->_mainQueueContext, 0);
}

- (void)storeUploadWithFormResponse:(id)a3 bugSessions:(id)a4
{
  sub_22A4474F4();
  sub_22A447534();
  sub_22A4B36B8();
  id v6 = (char *)a3;
  id v7 = self;
  sub_22A44758C(v6);

  swift_bridgeObjectRelease();
}

- (void)refreshTeamsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_22A40F8A8;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  sub_22A486478((uint64_t)v7, v6);
  sub_22A42F47C((uint64_t)v7);
}

- (void)promoteFeedback:(id)a3 toTeam:(id)a4 completion:(id)a5
{
  id v7 = (uint64_t (*)())_Block_copy(a5);
  sub_22A40F5A0(0, &qword_268375FA8);
  unint64_t v8 = sub_22A4B3628();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    id v7 = sub_22A40F8A8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a4;
  id v11 = self;
  sub_22A486E2C(v8, v10, (uint64_t)v7, v9);
  sub_22A42F47C((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)demoteFeedback:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_22A40F5A0(0, &qword_268375FA8);
  unint64_t v6 = sub_22A4B3628();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    unint64_t v8 = sub_22A40F8A8;
  }
  else
  {
    unint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v9 = self;
  sub_22A4874B4(v6, (uint64_t)v8, v7);
  sub_22A42F47C((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)refreshParticipantsWithTeam:(id)a3 completion:(id)a4
{
  unint64_t v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    unint64_t v6 = sub_22A40F8A8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  sub_22A488344(v8, (uint64_t)v6, v7);
  sub_22A42F47C((uint64_t)v6);
}

- (void)assignFeedback:(id)a3 toParticipant:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void (*)(id))_Block_copy(a5);
  sub_22A40F5A0(0, &qword_268375FA8);
  unint64_t v8 = sub_22A4B3628();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    uint64_t v7 = (void (*)(id))sub_22A40EFC8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = (uint64_t *)a4;
  id v11 = self;
  sub_22A489720(v8, v10, v7, v9);
  sub_22A42F47C((uint64_t)v7);

  swift_bridgeObjectRelease();
}

void __25__FBKData_sharedInstance__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = +[FBKFileManager applicationSupportDirectory];
  uint64_t v3 = [v2 path];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, a1, OS_LOG_TYPE_DEBUG, "FBK App Support Dir: %@", v4, 0xCu);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Found invalid user, will reset all data", v2, v3, v4, v5, v6);
}

- (void)fetchFormItemByTat:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Handling form item fetch by tat. Will run after load", v2, v3, v4, v5, v6);
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_16(&dword_22A36D000, v0, v1, "Nil private queue context. Cannot load data", v2, v3, v4, v5, v6);
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_16(&dword_22A36D000, v0, v1, "Failed to save load form item from main queue context. Cannot load data", v2, v3, v4, v5, v6);
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_22A36D000, v0, OS_LOG_TYPE_FAULT, "Failed to save private queue context. Cannot load data. [%{public}@]", v1, 0xCu);
}

- (void)reloadDataSkippingContentItems:reloadsTeams:formTat:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "no currentUser in FBKData, cannot continue.", v2, v3, v4, v5, v6);
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_118_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_16(&dword_22A36D000, v0, v1, "FBKTimeIntervalEvent is nil. Cannot track reload event", v2, v3, v4, v5, v6);
}

- (void)_reloadItems:(uint64_t)a3 retryCount:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Nil targeted survey ContentItem. Cannot delete", v2, v3, v4, v5, v6);
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Not targeted survey. Will not delete content item", v2, v3, v4, v5, v6);
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Not running in FBA. No need to delete survey content item", v2, v3, v4, v5, v6);
}

void __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "[%{public}s] failed to save [%{public}@]", (uint8_t *)v1, 0x16u);
}

- (void)_refreshFormItemsForTeam:formTat:withCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "[%{public}s] using form tat [%{public}@]", (uint8_t *)v1, 0x16u);
}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to refresh bug forms with error %@", v2, v3, v4, v5, v6);
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to save after purging orphaned entities: [%{public}@]", v2, v3, v4, v5, v6);
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to fetch Participants to remove: %@", v2, v3, v4, v5, v6);
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to fetch FileMatchers to purge: %@", v2, v3, v4, v5, v6);
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to fetch FilePredicates to purge: %@", v2, v3, v4, v5, v6);
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to fetch ContentItems to purge: %@", v2, v3, v4, v5, v6);
}

void __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to refresh unread count with error %@", v2, v3, v4, v5, v6);
}

void __42__FBKData_updateResolversForLocalBugForms__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "Error saving local resolver updates: %@", v1, 0xCu);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 ID];
  [v1 intValue];
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v2, v3, "failed to save while refreshing form [%i] with error %@", v4, v5, v6, v7, 2u);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4_cold_1(id *a1)
{
  uint64_t v1 = [*a1 ID];
  [v1 intValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v2, v3, "Failed to save after fetching form with ID [%i]", v4, v5, v6, v7, v8);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_201_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_17(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Could not update Form [%d]: %@", v3, v4, v5, v6, v7);
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v1, v2, "API failed to refresh bug form when creating new response for form [%i]", v3, v4, v5, v6, v7);
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v1, v2, "API failed to create new response for form [%i]", v3, v4, v5, v6, v7);
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "Error saving form response: %{public}@", v4, v5, v6, v7, v8);
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_208_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_17(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Error fetching formResponse (refreshFormResponseOnly) with ID [%d] %@", v3, v4, v5, v6, v7);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_17(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Error fetching formResponse with ID [%d] %@", v3, v4, v5, v6, v7);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_211_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ID];
  [v1 intValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v2, v3, "Could not find matching item for response [%i]", v4, v5, v6, v7, v8);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_212_cold_1(void *a1, id *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 ID];
  int v6 = [v5 intValue];
  uint64_t v7 = [*a2 localizedDescription];
  v8[0] = 67109378;
  v8[1] = v6;
  OUTLINED_FUNCTION_14();
  _os_log_error_impl(&dword_22A36D000, a3, OS_LOG_TYPE_ERROR, "Error fetching Bug Form with ID=%d: %{public}@", (uint8_t *)v8, 0x12u);
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_10();
  [*v0 intValue];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Failed to save after deleting draft with id [%i] with error: %@", v3, v4, v5, v6, v7);
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_225_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v1, v2, "Deleting draft with ID [%i] failed", v3, v4, v5, v6, v7);
}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(v0) ID];
  [v1 intValue];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v2, v3, "Failed to delete item [%i] with error [%@]", v4, v5, v6, v7, v8);
}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_227_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to save after bulk deleting drafts with error %@", v2, v3, v4, v5, v6);
}

void __39__FBKData_saveFormResponse_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Local FR save failed with error %@", v2, v3, v4, v5, v6);
}

void __39__FBKData_saveFormResponse_completion___block_invoke_2_244_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8(&dword_22A36D000, v0, v1, "Remote FR save failed [%i]", v2);
}

void __44__FBKData_formResponseStubForID_completion___block_invoke_2_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v1, v2, "Fetching form response stub failed for ID [%d].", v3, v4, v5, v6, v7);
}

- (void)refreshFormResponseStubFromContentItem:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 ID];
  [v1 unsignedIntValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v2, v3, "Draft item [%u] is deleted. Cannot refresh FormResponseStub.", v4, v5, v6, v7, v8);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 48) intValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v1, v2, "Updating form response stub failed for Form Response ID [%d].", v3, v4, v5, v6, v7);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Item to FormResponseStub relationship is nil", v2, v3, v4, v5, v6);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "FormResponseStub to Item relationship is nil", v2, v3, v4, v5, v6);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_249_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Failed to fetch Feedback for FormResponseStub loading: Error [Cannot find Form Response ID]", v2, v3, v4, v5, v6);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_249_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to fetch Feedback for FormResponseStub loading: Error [%@]", v2, v3, v4, v5, v6);
}

void __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = [(id)OUTLINED_FUNCTION_13(a1) formID];
  int v5 = [v4 intValue];
  uint8_t v6 = [*(id *)(a1 + 32) ID];
  v7[0] = 67109376;
  v7[1] = v5;
  __int16 v8 = 1024;
  int v9 = [v6 intValue];
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Failed to refresh form [%i] for item [%i]", (uint8_t *)v7, 0xEu);
}

- (void)fetchFeedbackStatusForFeedback:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Requested feedback status but feedback is nil", v2, v3, v4, v5, v6);
}

void __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(a1) ID];
  [v1 intValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v2, v3, "Updating status failed for Feedback [%{public}d]. Error: [%{public}@]", v4, v5, v6, v7, v8);
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_17(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Update Survey [%i] failed with error %@", v3, v4, v5, v6, v7);
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_10();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(v0) ID];
  [v1 intValue];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v2, v3, "failed to refresh Feedback with ID [%i] error %@", v4, v5, v6, v7, v8);
}

void __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 ID];
  [v1 intValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v2, v3, "Could not find matching item for feedback with id [%i]", v4, v5, v6, v7, v8);
}

void __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Save error %@", v2, v3, v4, v5, v6);
}

void __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "No FR stub was found for feedback, but also no error.", v2, v3, v4, v5, v6);
}

void __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_262_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "No feedback followup was found for feedback, but also no error.", v2, v3, v4, v5, v6);
}

void __42__FBKData_updateTask_withSubmissionStage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "UploadTask MOC save failed with error: %@", v2, v3, v4, v5, v6);
}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)id buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "upload task: %{public}@ failed to delete enclosing directory with error: %{public}@", buf, 0x16u);
}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_263_cold_1()
{
  OUTLINED_FUNCTION_10();
  [*(id *)(v1 + 48) intValue];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)v0 + 8) + 40) localizedDescription];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v3, v4, "Error deleting upload task: %d error: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)clearUploadTasksWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "taskIdentifier");
  int v6 = [v5 intValue];
  *(_DWORD *)uint64_t v4 = 67109120;
  _DWORD *v3 = v6;
  _os_log_debug_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEBUG, "deleting upload task with identifier [%i]", v4, 8u);
}

- (void)clearUploadTasksWithIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Fetch request for clearing existing tasks failed with error %@", v2, v3, v4, v5, v6);
}

- (void)allActiveUploadTasksInContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "did not find any upload tasks, done.", v2, v3, v4, v5, v6);
}

- (void)allActiveUploadTasksInContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "found upload tasks", v2, v3, v4, v5, v6);
}

- (void)allActiveUploadTasksInContext:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "failed to fetch Upload Tasks with error : %{public}@", v4, v5, v6, v7, v8);
}

- (void)getFileDownloadURLForFilePromise:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "FilePromise or FilePromise UUID was nil.", v2, v3, v4, v5, v6);
}

void __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "File download errored out: %{public}@.", v2, v3, v4, v5, v6);
}

- (void)createFeedbackFollowupOfType:forItem:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Tried to add an unsolicited follow-up to item without FormResponse ID", v2, v3, v4, v5, v6);
}

- (void)createFeedbackFollowupOfType:forItem:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Tried to add an unsolicited follow-up to item without Feedback ID", v2, v3, v4, v5, v6);
}

- (void)createFeedbackFollowupOfType:forItem:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Tried to add an unsolicited follow-up to non Feedback type content item", v2, v3, v4, v5, v6);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Error saving: [%{public}@]", v2, v3, v4, v5, v6);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_289_cold_1(uint64_t a1)
{
  [(id)OUTLINED_FUNCTION_13(a1) unsignedIntValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Could not create FFU on FR [%u] type [%lu]", v3, v4, v5, v6, v7);
}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5_cold_1(uint64_t a1)
{
  [(id)OUTLINED_FUNCTION_13(a1) unsignedIntegerValue];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v1, v2, "Could not send response for followup [%lu]", v3, v4, v5, v6, v7);
}

- (void)deleteUnsolicitedFollowup:withFeedbackItem:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "tried to delete ffu with nil FR ID", v2, v3, v4, v5, v6);
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Also failed to delete FFU locally: %@", v2, v3, v4, v5, v6);
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "failed to delete ffu server side with error: [%{public}@]", v2, v3, v4, v5, v6);
}

void __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ID];
  [v1 intValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v2, v3, "Update announcement [%i] failed", v4, v5, v6, v7, v8);
}

void __43__FBKData_markAnnouncementRead_completion___block_invoke_4_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_22A36D000, v1, v2, "Announcement [%d] acknowledgement failed.", v3, v4, v5, v6, v7);
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Error recording consent: %{public}@", v2, v3, v4, v5, v6);
}

- (void)destroyPersistentStoreWithUrl:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Error scrubbing outdated local store.", v2, v3, v4, v5, v6);
}

void __29__FBKData_managedObjectModel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Failed to create managed object model.", v2, v3, v4, v5, v6);
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to add persistent store: [%{public}@]", v2, v3, v4, v5, v6);
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to remove persistent store URL: [%{public}@]", v2, v3, v4, v5, v6);
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to remove persistent store: [%{public}@]", v2, v3, v4, v5, v6);
}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v3, v4, "Error saving form response [%d]: %{public}@", v5, v6, v7, v8, 2u);
}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_349_cold_1()
{
  OUTLINED_FUNCTION_10();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(v0) filerFormID];
  [v1 intValue];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v2, v3, "Failed to mark answers complete on [%i] with error [%{public}@]", v4, v5, v6, v7, v8);
}

- (void)markFormResponseComplete:withFiles:collector:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_22A36D000, v0, v1, "Surveys do not save device info", v2, v3, v4, v5, v6);
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8(&dword_22A36D000, v0, v1, "Failed to start EL session because configuration file predicate was not found. formID [%i]", v2);
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8(&dword_22A36D000, v0, v1, "Failed to mark FR [%i] completed", v2);
}

void __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8(&dword_22A36D000, v0, v1, "error on begin file submission for FFU [%i]", v2);
}

- (void)addDeviceDataToSubmissionInfo:withCollector:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "No collector given. Cannot build device data.", v2, v3, v4, v5, v6);
}

void __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_22A36D000, v1, OS_LOG_TYPE_ERROR, "Failed to save file promise [%{public}@] with error [%{public}@]", v2, 0x16u);
}

void __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Unknown type sent. Cannot update file promise [%{public}@]", v2, v3, v4, v5, v6);
}

@end