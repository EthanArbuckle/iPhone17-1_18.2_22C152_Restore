@interface LNConnection
+ (Class)connectionOptionsClass;
+ (LNConnectionOptions)defaultOptions;
+ (id)optionsForAction:(id)a3 interactionMode:(int64_t)a4 source:(unsigned __int16)a5 sourceOverride:(id)a6;
+ (void)fetchEntitiesFromActiveApplicationsWithInteractionIDs:(id)a3 bundleIdentifiers:(id)a4 completionHandler:(id)a5;
+ (void)fetchEntitiesFromActiveApplicationsWithInteractionIDs:(id)a3 completionHandler:(id)a4;
+ (void)invalidateAllConnections;
+ (void)resolveEntitiesForInteractionIDs:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)connectUsingProcessIdentifierWithOptions:(id)a3 setupWithAssertions:(BOOL)a4;
- (BOOL)isDaemon;
- (BOOL)isPerformActionOperationPending;
- (BOOL)refreshWithOptions:(id)a3;
- (BOOL)shouldRefreshWithOptions:(id)a3;
- (BOOL)targetIsBeingDebugged;
- (LNConnection)initWithBundleIdentifier:(id)a3;
- (LNConnection)initWithBundleIdentifier:(id)a3 metadataVersion:(int64_t)a4 error:(id *)a5;
- (LNConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8;
- (LNConnectionDelegate)manager;
- (LNConnectionHostInterface)connectionInterface;
- (LNConnectionOptions)currentOptions;
- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier;
- (LNUserIdentity)userIdentity;
- (LNWatchdogTimer)idleTimer;
- (NSMapTable)assertionsMapTable;
- (NSMapTable)executors;
- (NSMutableSet)connectionOperations;
- (NSOperationQueue)getConnectionInterfaceQueue;
- (NSSet)currentConnectionOperations;
- (NSString)appBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)logPrefix;
- (NSString)processInstanceIdentifier;
- (NSURL)bundleURL;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (OS_os_activity)activity;
- (RBSProcessMonitor)processMonitor;
- (id)executorForAction:(id)a3 interactionMode:(int64_t)a4 label:(id)a5 delegate:(id)a6;
- (id)executorForAction:(id)a3 interactionMode:(int64_t)a4 label:(id)a5 source:(unsigned __int16)a6 delegate:(id)a7;
- (id)executorForAction:(id)a3 label:(id)a4 delegate:(id)a5;
- (id)executorForAction:(id)a3 metadata:(id)a4 appBundleIdentifier:(id)a5 options:(id)a6 delegate:(id)a7;
- (id)executorForAction:(id)a3 metadata:(id)a4 options:(id)a5 delegate:(id)a6;
- (id)executorForAction:(id)a3 options:(id)a4 delegate:(id)a5;
- (id)getConnectionInterfaceCompletionHandler;
- (id)operationWithIdentifier:(id)a3;
- (int64_t)metadataVersion;
- (int64_t)state;
- (void)_invalidateAllAssertions;
- (void)acquireAssertionsForConnectionOperation:(id)a3;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)cancelIdleTimeout;
- (void)cancelTimeoutForOperationWithIdentifier:(id)a3;
- (void)close;
- (void)closeWithError:(id)a3;
- (void)completeWithError:(id)a3;
- (void)connectUsingListenerEndpoint:(id)a3 auditToken:(id *)a4 setupWithAssertions:(BOOL)a5;
- (void)connectWithOptions:(id)a3;
- (void)connectionOperation:(id)a3 didFinishWithError:(id)a4;
- (void)connectionOperationWillStart:(id)a3;
- (void)createAsyncIteratorForSequence:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)enqueueConnectionOperation:(id)a3;
- (void)exportEntities:(id)a3 metadata:(id)a4 withConfiguration:(id)a5 completionHandler:(id)a6;
- (void)extendIdleTimeout;
- (void)extendTimeoutForOperationWithIdentifier:(id)a3;
- (void)fetchActionAppContextForAction:(id)a3 completionHandler:(id)a4;
- (void)fetchActionForAppShortcutIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchActionForAutoShortcutPhrase:(id)a3 completionHandler:(id)a4;
- (void)fetchActionOutputValue:(id)a3 completionHandler:(id)a4;
- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3;
- (void)fetchDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(id)a5 completionHandler:(id)a6;
- (void)fetchDefaultValueForActionMetadata:(id)a3 parameterIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4;
- (void)fetchDisplayRepresentationForActions:(id)a3 completionHandler:(id)a4;
- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4;
- (void)fetchListenerEndpointFromApplicationServiceWithCompletionHandler:(id)a3;
- (void)fetchOptionsDefaultValueForAction:(id)a3 completionHandler:(id)a4;
- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 completionHandler:(id)a9;
- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 searchTerm:(id)a6 localeIdentifier:(id)a7 completionHandler:(id)a8;
- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 completionHandler:(id)a5;
- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 localeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 searchTerm:(id)a5 localeIdentifier:(id)a6 completionHandler:(id)a7;
- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4;
- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3;
- (void)fetchSuggestedActionsWithSiriLanguageCode:(id)a3 completionHandler:(id)a4;
- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5;
- (void)fetchURLForEnumWithIdentifier:(id)a3 caseIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchURLsForEnumWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchValueForPropertyWithIdentifier:(id)a3 entity:(id)a4 completionHandler:(id)a5;
- (void)fetchViewActionsWithCompletionHandler:(id)a3;
- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchViewEntitiesWithOptions:(id)a3 interactionIDs:(id)a4 completionHandler:(id)a5;
- (void)getConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4;
- (void)getListenerEndpointForBundleIdentifier:(id)a3 action:(id)a4 completionHandler:(id)a5;
- (void)invalidateAssertionsForConnectionOperation:(id)a3;
- (void)nextAsyncIteratorResults:(id)a3 completionHandler:(id)a4;
- (void)performAllEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4;
- (void)performConfigurableQuery:(id)a3 completionHandler:(id)a4;
- (void)performGetConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4;
- (void)performQuery:(id)a3 completionHandler:(id)a4;
- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4;
- (void)performSuggestedResultsQueryWithEntityType:(id)a3 completionHandler:(id)a4;
- (void)releaseAsyncSequence:(id)a3 completionHandler:(id)a4;
- (void)removeConnectionOperation:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setConnected;
- (void)setCurrentOptions:(id)a3;
- (void)setDisconnectedWithError:(id)a3;
- (void)setGetConnectionInterfaceCompletionHandler:(id)a3;
- (void)setIdleTimer;
- (void)setLogPrefix:(id)a3;
- (void)setManager:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUpConnectionContextWithAssertions:(BOOL)a3 completionHandler:(id)a4;
- (void)setXPCConnection:(id)a3;
- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3;
- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5;
@end

@implementation LNConnection

uint64_t __43__LNConnection_enqueueConnectionOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (NSString)logPrefix
{
  v2 = NSString;
  v3 = [(LNConnection *)self bundleIdentifier];
  v4 = [v2 stringWithFormat:@"[%@]", v3];

  return (NSString *)v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LNUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setManager:(id)a3
{
}

- (void)setIdleTimer
{
  v3 = [(LNConnection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__LNConnection_setIdleTimer__block_invoke;
  block[3] = &unk_1E5B3A0B0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (LNConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = [v15 bundleIdentifier];
  if ([(LNConnection *)self isMemberOfClass:objc_opt_class()])
  {
    if (v15)
    {
      if ([v15 type] == 3)
      {
        if (!v16)
        {
          v21 = [LNFrameworkConnection alloc];
          id v22 = v15;
          id v23 = 0;
          goto LABEL_24;
        }
        id v20 = v16;

        BOOL v10 = 0;
        id v19 = v20;
      }
      if ([v15 type] == 2)
      {
        v21 = [LNDaemonConnection alloc];
        id v22 = v15;
        id v23 = v16;
LABEL_24:
        v47 = [(LNConnection *)v21 initWithEffectiveBundleIdentifier:v22 appBundleIdentifier:v23 processInstanceIdentifier:v17 appIntentsEnabledOnly:v10 userIdentity:v18 error:a8];
        goto LABEL_32;
      }
    }
    id v60 = 0;
    v48 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v19 allowPlaceholder:0 error:&v60];
    id v49 = v60;
    if (v48)
    {
      if (!v10 || (objc_msgSend(v48, "ln_isAppIntentsEnabled") & 1) != 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v50 = &off_1E5B37D18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v47 = 0;
            goto LABEL_30;
          }
          v50 = off_1E5B37F18;
        }
        v47 = (LNConnection *)[objc_alloc(*v50) initWithEffectiveBundleIdentifier:v15 appBundleIdentifier:v16 processInstanceIdentifier:v17 appIntentsEnabledOnly:v10 userIdentity:v18 error:a8];
LABEL_30:
        [(LNConnection *)v47 setBundleIdentifier:v19];
        goto LABEL_31;
      }
      v52 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v62 = v19;
        _os_log_impl(&dword_1A4419000, v52, OS_LOG_TYPE_ERROR, "Connection request for non-AppIntents enabled bundle %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v51 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v62 = v19;
        __int16 v63 = 2114;
        id v64 = v49;
        _os_log_impl(&dword_1A4419000, v51, OS_LOG_TYPE_ERROR, "Unable to create a bundle record for %{public}@: %{public}@", buf, 0x16u);
      }

      if (a8)
      {
        v47 = 0;
        *a8 = v49;
LABEL_31:

        goto LABEL_32;
      }
    }
    v47 = 0;
    goto LABEL_31;
  }
  v59.receiver = self;
  v59.super_class = (Class)LNConnection;
  v24 = [(LNConnection *)&v59 init];
  if (v24)
  {
    v25 = v24;
    objc_storeStrong((id *)&v24->_bundleIdentifier, v19);
    objc_storeStrong((id *)&v25->_appBundleIdentifier, a4);
    objc_storeStrong((id *)&v25->_effectiveBundleIdentifier, a3);
    v25->_state = 0;
    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connectionOperations = v25->_connectionOperations;
    v25->_connectionOperations = v26;

    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.link.LNConnection.internal-queue", v29);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v30;

    uint64_t v32 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    executors = v25->_executors;
    v25->_executors = (NSMapTable *)v32;

    os_activity_t v34 = _os_activity_create(&dword_1A4419000, "appintents:connection", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v25->_activity;
    v25->_activity = (OS_os_activity *)v34;

    v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    getConnectionInterfaceQueue = v25->_getConnectionInterfaceQueue;
    v25->_getConnectionInterfaceQueue = v36;

    [(NSOperationQueue *)v25->_getConnectionInterfaceQueue setUnderlyingQueue:v25->_queue];
    [(NSOperationQueue *)v25->_getConnectionInterfaceQueue setMaxConcurrentOperationCount:1];
    uint64_t v38 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    assertionsMapTable = v25->_assertionsMapTable;
    v25->_assertionsMapTable = (NSMapTable *)v38;

    uint64_t v40 = [v17 copy];
    processInstanceIdentifier = v25->_processInstanceIdentifier;
    v25->_processInstanceIdentifier = (NSString *)v40;

    v42 = (void *)MEMORY[0x1E4F96418];
    uint64_t v54 = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    v56 = __137__LNConnection_initWithEffectiveBundleIdentifier_appBundleIdentifier_processInstanceIdentifier_appIntentsEnabledOnly_userIdentity_error___block_invoke;
    v57 = &unk_1E5B3A038;
    id v19 = v19;
    id v58 = v19;
    uint64_t v43 = [v42 monitorWithConfiguration:&v54];
    processMonitor = v25->_processMonitor;
    v25->_processMonitor = (RBSProcessMonitor *)v43;

    uint64_t v45 = objc_msgSend(v18, "copy", v54, v55, v56, v57);
    userIdentity = v25->_userIdentity;
    v25->_userIdentity = (LNUserIdentity *)v45;

    self = v25;
    v47 = self;
LABEL_32:

    goto LABEL_33;
  }
  v47 = 0;
LABEL_33:

  return v47;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([(LNConnection *)self isMemberOfClass:objc_opt_class()] & 1) == 0
    && ([(LNConnection *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    v3 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "%{public}@ Invalidating RunningBoard Assertions", buf, 0xCu);
    }
    [(LNConnection *)self _invalidateAllAssertions];
    v5 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(LNConnection *)self logPrefix];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ Invalidating XPC connection on %{public}@ dealloc", buf, 0x16u);
    }
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    v9 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_INFO, "%{public}@ Invalidating process monitor on dealloc", buf, 0xCu);
    }
    v11 = [(LNConnection *)self processMonitor];
    [v11 invalidate];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNConnection;
  [(LNConnection *)&v12 dealloc];
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setUpConnectionContextWithAssertions:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x1E4F223F8];
  v9 = [(LNConnection *)self bundleIdentifier];
  BOOL v10 = [v8 bundleRecordWithBundleIdentifier:v9 allowPlaceholder:0 error:0];

  v11 = [(LNConnection *)self effectiveBundleIdentifier];
  objc_super v12 = [v11 url];
  if (v12)
  {
    v13 = [(LNConnection *)self effectiveBundleIdentifier];
    BOOL v14 = [v13 type] == 3;
  }
  else
  {
    BOOL v14 = 0;
  }

  if (!v10)
  {
    LOBYTE(v63) = 0;
    if (v4) {
      goto LABEL_17;
    }
LABEL_11:
    id v26 = 0;
LABEL_32:
    id v49 = [LNConnectionContext alloc];
    v50 = [(LNConnection *)self userIdentity];
    if ((v14 | v63))
    {
      v51 = [(LNConnection *)self effectiveBundleIdentifier];
      v52 = [(LNConnectionContext *)v49 initWithUserIdentity:v50 effectiveBundleIdentifier:v51];
    }
    else
    {
      v52 = [(LNConnectionContext *)v49 initWithUserIdentity:v50 effectiveBundleIdentifier:0];
    }

    v53 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      uint64_t v54 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543618;
      v72 = v54;
      __int16 v73 = 2112;
      v74 = (__CFString *)v52;
      _os_log_impl(&dword_1A4419000, v53, OS_LOG_TYPE_INFO, "%{public}@ Updating connection connection context with: %@", buf, 0x16u);
    }
    uint64_t v55 = [(LNConnection *)self xpcConnection];
    v56 = [v55 remoteObjectProxy];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __71__LNConnection_setUpConnectionContextWithAssertions_completionHandler___block_invoke;
    v64[3] = &unk_1E5B3A148;
    id v26 = v26;
    id v65 = v26;
    id v66 = v6;
    [v56 updateConnectionContext:v52 completionHandler:v64];

    goto LABEL_38;
  }
  __int16 v15 = [(LNConnection *)self effectiveBundleIdentifier];
  id v16 = [v15 url];
  if (!v16)
  {
    LOBYTE(v63) = 0;
    goto LABEL_16;
  }
  BOOL v57 = v4;
  BOOL v17 = v14;
  objc_super v59 = v10;
  id v61 = v6;
  id v18 = [v10 URL];
  id v19 = [v18 fileReferenceURL];
  id v20 = [(LNConnection *)self effectiveBundleIdentifier];
  v21 = [v20 url];
  id v22 = [v21 fileReferenceURL];
  id v23 = v19;
  id v24 = v22;
  v25 = v24;
  if (v23 == v24)
  {
    LOBYTE(v63) = 0;
  }
  else
  {
    LOBYTE(v63) = 1;
    if (v23)
    {
      BOOL v14 = v17;
      if (v24) {
        int v63 = [v23 isEqual:v24] ^ 1;
      }
      goto LABEL_15;
    }
  }
  BOOL v14 = v17;
LABEL_15:

  BOOL v10 = v59;
  id v6 = v61;
  BOOL v4 = v57;
LABEL_16:

  if (!v4) {
    goto LABEL_11;
  }
LABEL_17:
  v27 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [(LNConnection *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    v72 = v28;
    _os_log_impl(&dword_1A4419000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Assertions requested for context setup", buf, 0xCu);
  }
  v29 = (void *)MEMORY[0x1E4F4F6A8];
  [(LNConnection *)self auditToken];
  dispatch_queue_t v30 = [v29 tokenFromAuditToken:v69];
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v30, "pid"));
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v68 = 0;
  uint64_t v32 = [MEMORY[0x1E4F963E8] handleForIdentifier:v31 error:&v68];
  id v33 = v68;
  if (v32)
  {
    id v58 = v30;
    id v60 = v10;
    BOOL v34 = v14;
    id v62 = (void (**)(void, id))v6;
    v35 = @"com.apple.siri";
    v36 = @"IntentStartupGrant";
    v37 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.siri" name:@"IntentStartupGrant"];
    v70 = v37;
    uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];

    id v39 = objc_alloc(MEMORY[0x1E4F96318]);
    uint64_t v40 = [MEMORY[0x1E4F96478] targetWithProcessIdentifier:v32];
    id v26 = (id)[v39 initWithExplanation:@"Application connection" target:v40 attributes:v38];

    id v67 = 0;
    LOBYTE(v39) = [v26 acquireWithError:&v67];
    id v41 = v67;

    v42 = getLNLogCategoryConnection();
    uint64_t v43 = v42;
    if (v39)
    {
      BOOL v14 = v34;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v44 = [(LNConnection *)self logPrefix];
        *(_DWORD *)buf = 138543618;
        v72 = v44;
        __int16 v73 = 2114;
        v74 = v31;
        _os_log_impl(&dword_1A4419000, v43, OS_LOG_TYPE_INFO, "%{public}@ Successfully acquired process assertion (pid: %{public}@) for context setup", buf, 0x16u);
      }
      int v45 = 0;
    }
    else
    {
      BOOL v14 = v34;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v48 = [(LNConnection *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v72 = v48;
        __int16 v73 = 2114;
        v74 = @"IntentStartupGrant";
        __int16 v75 = 2114;
        id v76 = v41;
        _os_log_impl(&dword_1A4419000, v43, OS_LOG_TYPE_ERROR, "%{public}@ Failed to acquire assertion %{public}@: %{public}@", buf, 0x20u);
      }
      v62[2](v62, v41);
      int v45 = 1;
    }
    dispatch_queue_t v30 = v58;

    id v33 = v41;
    BOOL v10 = v60;
    id v6 = v62;
  }
  else
  {
    v46 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v72 = v47;
      __int16 v73 = 2114;
      v74 = v31;
      __int16 v75 = 2114;
      id v76 = v33;
      _os_log_impl(&dword_1A4419000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);
    }
    (*((void (**)(id, id))v6 + 2))(v6, v33);
    id v26 = 0;
    int v45 = 1;
  }

  if (!v45) {
    goto LABEL_32;
  }
LABEL_38:
}

- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (void)connectUsingListenerEndpoint:(id)a3 auditToken:(id *)a4 setupWithAssertions:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  BOOL v10 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v10);

  v11 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_super v12 = [(LNConnection *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    v27 = v12;
    _os_log_impl(&dword_1A4419000, v11, OS_LOG_TYPE_INFO, "%{public}@ Establishing a direct connection to the target process via a listener endpoint", buf, 0xCu);
  }
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNConnection.m", 651, @"Invalid parameter not satisfying: %@", @"listenerEndpoint" object file lineNumber description];
  }
  if ([(LNConnection *)self state] != 1)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"LNConnection.m", 652, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateConnecting" object file lineNumber description];
  }
  long long v13 = *(_OWORD *)&a4->var0[4];
  v25[0] = *(_OWORD *)a4->var0;
  v25[1] = v13;
  [(LNConnection *)self setAuditToken:v25];
  BOOL v14 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v9];
  [(LNConnection *)self setXPCConnection:v14];

  __int16 v15 = [(LNConnection *)self xpcConnection];
  id v16 = [(LNConnection *)self bundleIdentifier];
  BOOL v17 = LNConnectionHostXPCInterface();
  objc_msgSend(v15, "ln_configureWithBundleIdentifier:interface:", v16, v17);

  id v18 = [(LNConnection *)self xpcConnection];
  id v19 = [MEMORY[0x1E4F29128] UUID];
  [v18 _setUUID:v19];

  id v20 = [(LNConnection *)self xpcConnection];
  [v20 resume];

  objc_initWeak((id *)buf, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__LNConnection_connectUsingListenerEndpoint_auditToken_setupWithAssertions___block_invoke;
  v23[3] = &unk_1E5B3A4A8;
  objc_copyWeak(&v24, (id *)buf);
  [(LNConnection *)self setUpConnectionContextWithAssertions:v5 completionHandler:v23];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (void)setXPCConnection:(id)a3
{
  id v5 = a3;
  id v6 = [(LNConnection *)self activity];
  v7 = [(LNConnection *)self bundleIdentifier];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  objc_storeStrong((id *)&self->_xpcConnection, a3);
  objc_initWeak(&location, self);
  v8 = [(LNConnection *)self queue];
  [v5 _setQueue:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__LNConnection_setXPCConnection___block_invoke;
  v11[3] = &unk_1E5B3A060;
  v11[4] = v6;
  objc_copyWeak(&v12, &location);
  [v5 setInterruptionHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__LNConnection_setXPCConnection___block_invoke_69;
  v9[3] = &unk_1E5B3A088;
  v9[4] = v6;
  objc_copyWeak(&v10, &location);
  v9[5] = v7;
  [v5 setInvalidationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setConnected
{
  BOOL v4 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v4);

  if ([(LNConnection *)self state] != 1 && [(LNConnection *)self state] != 2)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"LNConnection.m", 479, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateConnecting || self.state == LNConnectionStateRefreshing" object file lineNumber description];
  }
  [(LNConnection *)self setState:3];
  [(LNConnection *)self completeWithError:0];
}

- (void)setState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  int64_t state = self->_state;
  if (state != a3)
  {
    switch(state)
    {
      case 0:
        if (a3 != 1)
        {
          v8 = [MEMORY[0x1E4F28B00] currentHandler];
          [v8 handleFailureInMethod:a2, self, @"LNConnection.m", 271, @"Invalid parameter not satisfying: %@", @"state == LNConnectionStateConnecting" object file lineNumber description];
          goto LABEL_11;
        }
        break;
      case 1:
        if (a3 && a3 != 3)
        {
          v8 = [MEMORY[0x1E4F28B00] currentHandler];
          [v8 handleFailureInMethod:a2, self, @"LNConnection.m", 274, @"Invalid parameter not satisfying: %@", @"state == LNConnectionStateConnected || state == LNConnectionStateDisconnected" object file lineNumber description];
          goto LABEL_11;
        }
        break;
      case 2:
        if (a3 && a3 != 3)
        {
          v8 = [MEMORY[0x1E4F28B00] currentHandler];
          [v8 handleFailureInMethod:a2, self, @"LNConnection.m", 277, @"Invalid parameter not satisfying: %@", @"state == LNConnectionStateConnected || state == LNConnectionStateDisconnected" object file lineNumber description];
          goto LABEL_11;
        }
        break;
      case 3:
        if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
        {
          v8 = [MEMORY[0x1E4F28B00] currentHandler];
          [v8 handleFailureInMethod:a2, self, @"LNConnection.m", 280, @"Invalid parameter not satisfying: %@", @"state == LNConnectionStateDisconnected || state == LNConnectionStateRefreshing" object file lineNumber description];
LABEL_11:
        }
        break;
      default:
        break;
    }
    id v9 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(LNConnection *)self logPrefix];
      v11 = (void *)v10;
      unint64_t v12 = self->_state - 1;
      if (v12 > 2) {
        long long v13 = @"Not Connected";
      }
      else {
        long long v13 = off_1E5B3A238[v12];
      }
      if ((unint64_t)(a3 - 1) > 2) {
        BOOL v14 = @"Not Connected";
      }
      else {
        BOOL v14 = off_1E5B3A238[a3 - 1];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v13;
      __int16 v19 = 2114;
      id v20 = v14;
    }
    self->_int64_t state = a3;
  }
}

void __28__LNConnection_setIdleTimer__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [LNWatchdogTimer alloc];
  double v3 = *(double *)&LNConnectionIdleTimeout;
  BOOL v4 = [*(id *)(a1 + 32) queue];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __28__LNConnection_setIdleTimer__block_invoke_2;
  unint64_t v12 = &unk_1E5B3A1D0;
  objc_copyWeak(&v13, &location);
  uint64_t v5 = [(LNWatchdogTimer *)v2 initWithTimeoutInterval:v4 onQueue:&v9 timeoutHandler:v3];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 32), "idleTimer", v9, v10, v11, v12);
  [v8 start];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)connectionOperation:(id)a3 didFinishWithError:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  [(LNConnection *)self invalidateAssertionsForConnectionOperation:v5];
  id v8 = v5;
  if (v8 && ([v8 conformsToProtocol:&unk_1EF7FCA18] & 1) != 0)
  {
    [v8 invalidateRuntimeAssertions];
    v7 = v8;
  }
  else
  {

    v7 = 0;
  }
  [(LNConnection *)self removeConnectionOperation:v8];
}

- (void)removeConnectionOperation:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(LNConnection *)self connectionOperations];
  [v5 removeObject:v6];

  [v6 setConnection:0];
}

- (void)invalidateAssertionsForConnectionOperation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(LNConnection *)self logPrefix];
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_INFO, "%{public}@ Invalidating assertions for %{public}@", buf, 0x16u);
  }
  if ([v4 priority])
  {
    id v8 = [(LNConnection *)self assertionsMapTable];
    uint64_t v9 = [v8 objectForKey:v4];

    [v9 removeObserver:self];
    if ([v9 isValid])
    {
      id v16 = 0;
      char v10 = [v9 invalidateWithError:&v16];
      v11 = v16;
      if ((v10 & 1) == 0)
      {
        unint64_t v12 = getLNLogCategoryConnection();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = [(LNConnection *)self logPrefix];
          *(_DWORD *)buf = 138543874;
          id v18 = v13;
          __int16 v19 = 2114;
          id v20 = v4;
          __int16 v21 = 2114;
          id v22 = v11;
          _os_log_impl(&dword_1A4419000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to invalidate process assertion for %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      v11 = 0;
    }
    __int16 v15 = [(LNConnection *)self assertionsMapTable];
    [v15 removeObjectForKey:v4];
  }
  else
  {
    v11 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543618;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_1A4419000, v11, OS_LOG_TYPE_INFO, "%{public}@ %{public}@ has no priority and thus no associated assertion", buf, 0x16u);
    }
  }
}

- (NSMapTable)assertionsMapTable
{
  return self->_assertionsMapTable;
}

- (void)connectionOperationWillStart:(id)a3
{
  id v4 = a3;
  id v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = v4;
  if (v7 && ([v7 conformsToProtocol:&unk_1EF7FCA18] & 1) != 0)
  {
    [v7 acquireRuntimeAssertions];
    id v6 = v7;
  }
  else
  {

    id v6 = 0;
  }
  [(LNConnection *)self acquireAssertionsForConnectionOperation:v7];
}

- (void)enqueueConnectionOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(LNConnection *)self connectionOperations];
  [v6 addObject:v4];

  [v4 setConnection:self];
  [(LNConnection *)self extendIdleTimeout];
  id v7 = [v4 activity];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__LNConnection_enqueueConnectionOperation___block_invoke;
  block[3] = &unk_1E5B3A0B0;
  id v10 = v4;
  id v8 = v4;
  os_activity_apply(v7, block);
}

- (NSMutableSet)connectionOperations
{
  double v3 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  connectionOperations = self->_connectionOperations;
  return connectionOperations;
}

- (void)extendIdleTimeout
{
  double v3 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(LNConnection *)self idleTimer];

  if (v4)
  {
    id v5 = [(LNConnection *)self idleTimer];
    [v5 reset];
  }
}

- (LNWatchdogTimer)idleTimer
{
  double v3 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  idleTimer = self->_idleTimer;
  return idleTimer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)acquireAssertionsForConnectionOperation:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 priority])
  {
    id v6 = (void *)MEMORY[0x1E4F4F6A8];
    [(LNConnection *)self auditToken];
    id v7 = [v6 tokenFromAuditToken:v35];
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v7, "pid"));
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v34 = 0;
    uint64_t v9 = [MEMORY[0x1E4F963E8] handleForIdentifier:v8 error:&v34];
    id v10 = v34;
    if (v9)
    {
      if ([v9 isDaemon])
      {
        v11 = getLNLogCategoryConnection();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          unint64_t v12 = [(LNConnection *)self logPrefix];
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v12;
          __int16 v39 = 2114;
          uint64_t v40 = v8;
          _os_log_impl(&dword_1A4419000, v11, OS_LOG_TYPE_INFO, "%{public}@ pid %{public}@ is a daemon; assertion is not required",
            buf,
            0x16u);
        }
      }
      else
      {
        uint64_t v15 = [v4 priority];
        id v16 = @"com.apple.siri";
        if (v15 == 3) {
          id v16 = @"com.apple.siri.pushtotalk";
        }
        __int16 v17 = v16;
        uint64_t v18 = [v4 priority];
        if ((unint64_t)(v18 - 1) > 2) {
          __int16 v19 = 0;
        }
        else {
          __int16 v19 = off_1E5B388C0[v18 - 1];
        }
        v31 = v19;
        uint64_t v32 = v17;
        id v20 = objc_msgSend(MEMORY[0x1E4F96358], "attributeWithDomain:name:", v17);
        v36 = v20;
        __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];

        id v22 = objc_alloc(MEMORY[0x1E4F96318]);
        uint64_t v23 = [MEMORY[0x1E4F96478] targetWithProcessIdentifier:v9];
        id v24 = (void *)[v22 initWithExplanation:@"Application connection" target:v23 attributes:v21];

        id v33 = 0;
        LOBYTE(v23) = [v24 acquireWithError:&v33];
        id v10 = v33;
        v25 = getLNLogCategoryConnection();
        id v26 = v25;
        if (v23)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v27 = [(LNConnection *)self logPrefix];
            *(_DWORD *)buf = 138543874;
            uint64_t v38 = v27;
            __int16 v39 = 2114;
            uint64_t v40 = v8;
            __int16 v41 = 2114;
            v42 = v4;
            _os_log_impl(&dword_1A4419000, v26, OS_LOG_TYPE_INFO, "%{public}@ Successfully acquired process assertion (pid: %{public}@) for %{public}@", buf, 0x20u);
          }
          [v24 addObserver:self];
          uint64_t v28 = [(LNConnection *)self assertionsMapTable];
          [v28 setObject:v24 forKey:v4];

          v29 = v31;
        }
        else
        {
          v29 = v31;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            dispatch_queue_t v30 = [(LNConnection *)self logPrefix];
            *(_DWORD *)buf = 138543874;
            uint64_t v38 = v30;
            __int16 v39 = 2114;
            uint64_t v40 = v31;
            __int16 v41 = 2114;
            v42 = v10;
            _os_log_impl(&dword_1A4419000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Failed to acquire assertion %{public}@: %{public}@", buf, 0x20u);
          }
          [v4 finishWithError:v10];
        }
      }
    }
    else
    {
      id v13 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        BOOL v14 = [(LNConnection *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = v14;
        __int16 v39 = 2114;
        uint64_t v40 = v8;
        __int16 v41 = 2114;
        v42 = v10;
        _os_log_impl(&dword_1A4419000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);
      }
      [v4 finishWithError:v10];
    }

    goto LABEL_26;
  }
  id v10 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v7 = [(LNConnection *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v7;
    _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_INFO, "%{public}@ Connection has no background or foreground priority; assertion not required",
      buf,
      0xCu);
LABEL_26:
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[5].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[5].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)performGetConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(LNConnection *)self logPrefix];
    *(_DWORD *)buf = 138543618;
    v29 = v10;
    __int16 v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_INFO, "%{public}@ Getting connection interface with options: %{public}@", buf, 0x16u);
  }
  v11 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unint64_t v12 = [(LNConnection *)self logPrefix];
    int64_t v13 = [(LNConnection *)self state];
    if ((unint64_t)(v13 - 1) > 2) {
      BOOL v14 = @"Not Connected";
    }
    else {
      BOOL v14 = off_1E5B3A238[v13 - 1];
    }
    *(_DWORD *)buf = 138543618;
    v29 = v12;
    __int16 v30 = 2114;
    v31 = v14;
  }
  uint64_t v15 = (void *)[v7 copy];

  [(LNConnection *)self setGetConnectionInterfaceCompletionHandler:v15];
  if (!v6)
  {
    id v6 = [(id)objc_opt_class() defaultOptions];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5B3A0D8;
  aBlock[4] = self;
  id v16 = v6;
  v27 = v16;
  __int16 v17 = (void (**)(void))_Block_copy(aBlock);
  if ([(__CFString *)v16 authenticationPolicy] == 1)
  {
    uint64_t v18 = [LNUnlockService alloc];
    __int16 v19 = [(LNConnection *)self queue];
    id v20 = [(LNUnlockService *)v18 initWithQueue:v19];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
    v22[3] = &unk_1E5B3A100;
    uint64_t v23 = v20;
    id v24 = self;
    v25 = v17;
    __int16 v21 = v20;
    [(LNUnlockService *)v21 requestUnlockIfNeeded:v22];
  }
  else
  {
    v17[2](v17);
  }
}

uint64_t __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  if (v2)
  {
    if (v2 == 3) {
      [*(id *)(a1 + 32) refreshWithOptions:*(void *)(a1 + 40)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) connectWithOptions:*(void *)(a1 + 40)];
  }
  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 setCurrentOptions:v4];
}

- (void)setCurrentOptions:(id)a3
{
}

+ (LNConnectionOptions)defaultOptions
{
  [a1 connectionOptionsClass];
  uint64_t v2 = objc_opt_new();
  return (LNConnectionOptions *)v2;
}

- (void)completeWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  if ([(LNConnection *)self state] && [(LNConnection *)self state] != 3)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LNConnection.m", 414, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateDisconnected || self.state == LNConnectionStateConnected" object file lineNumber description];
  }
  id v7 = [(LNConnection *)self getConnectionInterfaceCompletionHandler];
  BOOL v8 = v7 == 0;

  if (!v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__LNConnection_completeWithError___block_invoke;
    aBlock[3] = &unk_1E5B3A0B0;
    aBlock[4] = self;
    uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
    if (v5)
    {
      id v10 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [(LNConnection *)self logPrefix];
        unint64_t v12 = [v5 localizedDescription];
        *(_DWORD *)buf = 138543874;
        __int16 v19 = v11;
        __int16 v20 = 2114;
        id v21 = v5;
        __int16 v22 = 2114;
        uint64_t v23 = v12;
        _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get connection interface: %{public}@ (%{public}@)", buf, 0x20u);
      }
      int64_t v13 = [(LNConnection *)self getConnectionInterfaceCompletionHandler];
      ((void (**)(void, void, id))v13)[2](v13, 0, v5);
    }
    else
    {
      int64_t v13 = [(LNConnection *)self getConnectionInterfaceCompletionHandler];
      BOOL v14 = [(LNConnection *)self connectionInterface];
      ((void (**)(void, void *, void))v13)[2](v13, v14, 0);
    }
    v9[2](v9);
  }
  os_activity_scope_leave(&state);
}

- (int64_t)state
{
  return self->_state;
}

- (id)getConnectionInterfaceCompletionHandler
{
  return self->_getConnectionInterfaceCompletionHandler;
}

- (LNConnectionHostInterface)connectionInterface
{
  objc_initWeak(&location, self);
  long long v3 = [(LNConnection *)self xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__LNConnection_connectionInterface__block_invoke;
  v6[3] = &unk_1E5B3A4A8;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (LNConnectionHostInterface *)v4;
}

void __122__LNConnection_FetchOptionsDefaultValue__fetchDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    long long v3 = [LNFetchParameterOptionDefaultValueConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 56) queue];
    BOOL v8 = [(LNFetchParameterOptionDefaultValueConnectionOperation *)v3 initWithConnectionInterface:v9 action:v4 actionMetadata:v5 parameterIdentifier:v6 queue:v7 completionHandler:*(void *)(a1 + 64)];

    [*(id *)(a1 + 56) enqueueConnectionOperation:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (BOOL)refreshWithOptions:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(LNConnection *)self state] != 3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"LNConnection.m", 466, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateConnected" object file lineNumber description];
  }
  BOOL v7 = [(LNConnection *)self shouldRefreshWithOptions:v5];
  if (v7) {
    [(LNConnection *)self setState:2];
  }
  else {
    [(LNConnection *)self completeWithError:0];
  }

  return v7;
}

void __156__LNConnection_FetchOptions__fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12)
  {
    long long v3 = [LNFetchOptionsConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    id v10 = [*(id *)(a1 + 80) queue];
    v11 = [(LNFetchOptionsConnectionOperation *)v3 initWithConnectionInterface:v12 action:v4 actionMetadata:v5 parameterMetadata:v6 optionsProviderReference:v7 searchTerm:v8 localeIdentifier:v9 queue:v10 completionHandler:*(void *)(a1 + 88)];

    [*(id *)(a1 + 80) enqueueConnectionOperation:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

+ (Class)connectionOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)connectWithOptions:(id)a3
{
  uint64_t v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(LNConnection *)self state])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"LNConnection.m", 436, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateDisconnected" object file lineNumber description];
  }
  [(LNConnection *)self setState:1];
}

- (BOOL)connectUsingProcessIdentifierWithOptions:(id)a3 setupWithAssertions:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(LNConnection *)self processInstanceIdentifier];

  if (v7)
  {
    uint64_t v8 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(LNConnection *)self logPrefix];
      id v10 = [(LNConnection *)self processInstanceIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      __int16 v17 = v10;
      _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "%{public}@ Connecting using processInstanceIdentifier: %{public}@ from ApplicationService", buf, 0x16u);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__LNConnection_connectUsingProcessIdentifierWithOptions_setupWithAssertions___block_invoke;
    v12[3] = &unk_1E5B3A170;
    v12[4] = self;
    BOOL v13 = a4;
    [(LNConnection *)self fetchListenerEndpointFromApplicationServiceWithCompletionHandler:v12];
  }
  return v7 != 0;
}

- (NSString)processInstanceIdentifier
{
  return self->_processInstanceIdentifier;
}

void __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getConnectionInterfaceQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5B3A318;
  long long v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 addOperationWithBlock:v4];
}

uint64_t __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getConnectionInterfaceQueue];
  [v2 setSuspended:1];

  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v3 performGetConnectionInterfaceWithOptions:v4 completionHandler:v5];
}

void __34__LNConnection_completeWithError___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setGetConnectionInterfaceCompletionHandler:0];
  uint64_t v2 = [*(id *)(a1 + 32) getConnectionInterfaceQueue];
  [v2 setSuspended:0];

  long long v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [*(id *)(a1 + 32) logPrefix];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "%{public}@ Resuming the getConnectionInterface queue", (uint8_t *)&v5, 0xCu);
  }
}

- (NSOperationQueue)getConnectionInterfaceQueue
{
  return self->_getConnectionInterfaceQueue;
}

- (void)setGetConnectionInterfaceCompletionHandler:(id)a3
{
}

void __71__LNConnection_setUpConnectionContextWithAssertions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__LNConnection_connectUsingListenerEndpoint_auditToken_setupWithAssertions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (v3)
  {
    id v6 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_ERROR, "Failed to set connection context: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = [v5 xpcConnection];
    [v7 invalidate];

    [v5 setDisconnectedWithError:v3];
  }
  else
  {
    [WeakRetained setConnected];
  }
}

void __137__LNConnection_initWithEffectiveBundleIdentifier_appBundleIdentifier_processInstanceIdentifier_appIntentsEnabledOnly_userIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F96430];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  int v5 = [v2 predicateMatchingBundleIdentifier:v3];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 setPredicates:v6];

  uint64_t v7 = [MEMORY[0x1E4F96448] descriptor];
  [v7 setValues:1];
  [v4 setStateDescriptor:v7];
}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = (void (**)(id, void *, id))a9;
  __int16 v22 = [v16 effectiveBundleIdentifiers];
  if ([v22 count] != 1) {
    goto LABEL_15;
  }
  id v45 = v20;
  id v46 = v15;
  uint64_t v23 = [v16 effectiveBundleIdentifiers];
  uint64_t v24 = [v23 firstObject];
  if ([v24 type] != 3)
  {

    id v20 = v45;
    id v15 = v46;
LABEL_15:

    goto LABEL_16;
  }
  [v17 name];
  v25 = id v44 = v18;
  int v26 = [v25 isEqualToString:@"app"];

  id v18 = v44;
  id v20 = v45;
  id v15 = v46;
  if (v26)
  {
    v27 = [v16 effectiveBundleIdentifiers];
    uint64_t v28 = [v27 firstObject];

    v29 = [v28 bundleIdentifier];
    __int16 v30 = v29;
    if (v29 != @"com.apple.UIKitCore")
    {
      if (!v29
        || (char v31 = [(__CFString *)v29 isEqualToString:@"com.apple.UIKitCore"],
            v30,
            (v31 & 1) == 0))
      {
        uint64_t v32 = [v28 bundleIdentifier];
        id v33 = v32;
        if (v32 != @"com.apple.UIKit")
        {
          if (!v32
            || (char v34 = [(__CFString *)v32 isEqualToString:@"com.apple.UIKit"],
                v33,
                (v34 & 1) == 0))
          {
            v35 = [v28 bundleIdentifier];
            if (v35 != @"com.apple.AppKit")
            {
              v36 = v35;
              if (!v35)
              {

LABEL_23:
                uint64_t v40 = (void *)MEMORY[0x1E4F223C8];
                __int16 v41 = [(LNConnection *)self effectiveBundleIdentifier];
                [v41 url];
                uint64_t v43 = v42 = v28;
                id v56 = 0;
                __int16 v39 = objc_msgSend(v40, "ln_dynamicOptionsWithAppsImplementingFrameworkAtURL:matchingSearchTerm:options:error:", v43, v19, 0, &v56);
                uint64_t v38 = (void (**)(id, void *, id))v56;

                uint64_t v28 = v42;
                goto LABEL_21;
              }
              char v37 = [(__CFString *)v35 isEqualToString:@"com.apple.AppKit"];

              if ((v37 & 1) == 0) {
                goto LABEL_23;
              }
LABEL_20:
              id v57 = 0;
              __int16 v39 = objc_msgSend(MEMORY[0x1E4F223C8], "ln_dynamicOptionsWithAppsImplementingFrameworkAtURL:matchingSearchTerm:options:error:", 0, v19, 0, &v57);
              uint64_t v38 = (void (**)(id, void *, id))v57;
LABEL_21:
              id v15 = v46;
              v21[2](v21, v39, v38);

              id v18 = v44;
              id v20 = v45;
              goto LABEL_17;
            }
          }
        }
      }
    }

    goto LABEL_20;
  }
LABEL_16:
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __156__LNConnection_FetchOptions__fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke;
  v47[3] = &unk_1E5B38840;
  uint64_t v55 = v21;
  id v48 = v15;
  id v49 = v16;
  id v50 = v17;
  id v51 = v18;
  id v52 = v19;
  id v53 = v20;
  uint64_t v54 = self;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v47];

  uint64_t v38 = v55;
LABEL_17:
}

- (void)fetchDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __122__LNConnection_FetchOptionsDefaultValue__fetchDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E5B391C0;
  __int16 v22 = self;
  id v23 = v13;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v18];
}

- (void)getConnectionInterfaceWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(LNConnection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__LNConnection_getConnectionInterfaceWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E5B3A318;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_executors, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_processInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_assertionsMapTable, 0);
  objc_storeStrong((id *)&self->_currentOptions, 0);
  objc_storeStrong((id *)&self->_getConnectionInterfaceQueue, 0);
  objc_storeStrong(&self->_getConnectionInterfaceCompletionHandler, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_connectionOperations, 0);
}

- (BOOL)shouldRefreshWithOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(LNConnection *)self state] != 3)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNConnection.m", 443, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateConnected" object file lineNumber description];
  }
  id v7 = [(LNConnection *)self userIdentity];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v10 = [(LNConnection *)self effectiveBundleIdentifier];
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = [(LNConnection *)self effectiveBundleIdentifier];
    uint64_t v13 = [v12 type];

    if (v13 == 3) {
      goto LABEL_4;
    }
  }
  id v14 = [(LNConnection *)self currentOptions];
  id v15 = v5;
  id v16 = v15;
  if (v14 != v15)
  {
    if (v15 && v14)
    {
      int v17 = [v14 isEqual:v15];

      if (v17) {
        goto LABEL_14;
      }
    }
    else
    {
    }
LABEL_4:
    BOOL v8 = 1;
    goto LABEL_5;
  }

LABEL_14:
  id v18 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v16;
    _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_INFO, "Options %{public}@ haven't changed, skipping refresh", buf, 0xCu);
  }

  BOOL v8 = 0;
LABEL_5:

  return v8;
}

- (LNConnectionOptions)currentOptions
{
  return self->_currentOptions;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)exportEntities:(id)a3 metadata:(id)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  sub_1A4438ECC(0, &qword_1E9647980);
  uint64_t v10 = sub_1A44F9650();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a4;
  id v13 = a5;
  id v14 = self;
  sub_1A44431E4(v10, v12, v13, (uint64_t)sub_1A44442C4, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchURLForEnumWithIdentifier:(id)a3 caseIdentifier:(id)a4 completionHandler:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = sub_1A44F94E0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1A44F94E0();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  id v14 = self;
  sub_1A44485FC(v7, v9, v10, v12, (uint64_t)sub_1A4449F00, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchURLsForEnumWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A44F94E0();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1A4448A54(v6, v8, (uint64_t)sub_1A4449E9C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchValueForPropertyWithIdentifier:(id)a3 entity:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A44F94E0();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = a4;
  uint64_t v13 = self;
  sub_1A444FEB4(v8, v10, v12, (uint64_t)sub_1A44442C4, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_1A4453470();
  uint64_t v8 = sub_1A44F9650();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1A4452860(v8, v10, (uint64_t)sub_1A44534F0, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1A446FDA4(v8, (uint64_t)sub_1A4449F00, v7);

  swift_release();
}

- (void)fetchActionOutputValue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDeferred])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__LNConnection_FetchActionOutputValue__fetchActionOutputValue_completionHandler___block_invoke;
    v9[3] = &unk_1E5B397D8;
    id v12 = v7;
    id v10 = v6;
    uint64_t v11 = self;
    [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v9];
  }
  else
  {
    id v8 = [v6 value];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v8, 0);
  }
}

void __81__LNConnection_FetchActionOutputValue__fetchActionOutputValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [LNFetchActionOutputValueOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchActionOutputValueOperation *)v3 initWithConnectionInterface:v7 actionOutput:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__LNConnection_FetchMDMProperties__fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __100__LNConnection_FetchMDMProperties__fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [LNFetchMDMPropertiesConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchMDMPropertiesConnectionOperation *)v3 initWithConnectionInterface:v7 action:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__LNConnection_FetchAppShortcutParameters__fetchAppShortcutParametersWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5B39788;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v6];
}

void __92__LNConnection_FetchAppShortcutParameters__fetchAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = [LNFetchAppShortcutParametersConnectionOperation alloc];
    id v4 = [*(id *)(a1 + 32) queue];
    id v5 = [(LNFetchAppShortcutParametersConnectionOperation *)v3 initWithConnectionInterface:v6 queue:v4 completionHandler:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) enqueueConnectionOperation:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchDisplayRepresentationForActions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__LNConnection_FetchDisplayRepresentation__fetchDisplayRepresentationForActions_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __99__LNConnection_FetchDisplayRepresentation__fetchDisplayRepresentationForActions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [LNFetchDisplayRepresentationConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchDisplayRepresentationConnectionOperation *)v3 initWithConnectionInterface:v7 actions:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)getListenerEndpointForBundleIdentifier:(id)a3 action:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__LNConnection_FetchListenerEndpoint__getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke;
  v14[3] = &unk_1E5B3A5E8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v14];
}

void __103__LNConnection_FetchListenerEndpoint__getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = [LNFetchListenerEndpointConnectionOperation alloc];
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    id v5 = [(LNFetchListenerEndpointConnectionOperation *)v3 initWithConnectionInterface:v6 queue:v4 bundleIdentifier:*(void *)(a1 + 40) action:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];

    [*(id *)(a1 + 32) enqueueConnectionOperation:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 localeIdentifier:(id)a5 completionHandler:(id)a6
{
}

- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchOptionsForActionMetadata:(id)a3 parameterMetadata:(id)a4 searchTerm:(id)a5 localeIdentifier:(id)a6 completionHandler:(id)a7
{
}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 searchTerm:(id)a6 localeIdentifier:(id)a7 completionHandler:(id)a8
{
}

- (void)fetchActionForAppShortcutIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAppShortcutIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __104__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAppShortcutIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [LNFetchActionForAppShortcutIdentifierOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchActionForAppShortcutIdentifierOperation *)v3 initWithConnectionInterface:v7 appShortcutIdentifier:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchActionForAutoShortcutPhrase:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAutoShortcutPhrase_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __101__LNConnection_FetchActionForAutoShortcutPhrase__fetchActionForAutoShortcutPhrase_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [LNFetchActionForAutoShortcutPhraseOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchActionForAutoShortcutPhraseOperation *)v3 initWithConnectionInterface:v7 autoShortcutPhrase:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)releaseAsyncSequence:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__LNConnection_AsyncSequence__releaseAsyncSequence_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __70__LNConnection_AsyncSequence__releaseAsyncSequence_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [LNAsyncSequenceReleaseOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNAsyncSequenceReleaseOperation *)v3 initWithConnectionInterface:v7 sequence:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)nextAsyncIteratorResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__LNConnection_AsyncSequence__nextAsyncIteratorResults_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __74__LNConnection_AsyncSequence__nextAsyncIteratorResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = [LNAsyncIteratorNextResultsOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNAsyncIteratorNextResultsOperation *)v3 initWithConnectionInterface:v7 iterator:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)createAsyncIteratorForSequence:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__LNConnection_AsyncSequence__createAsyncIteratorForSequence_options_completionHandler___block_invoke;
  v14[3] = &unk_1E5B3A5E8;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v14];
}

void __88__LNConnection_AsyncSequence__createAsyncIteratorForSequence_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [LNAsyncIteratorCreateOperation alloc];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) queue];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __88__LNConnection_AsyncSequence__createAsyncIteratorForSequence_options_completionHandler___block_invoke_2;
    id v13 = &unk_1E5B38A90;
    id v8 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = v8;
    id v9 = [(LNAsyncIteratorCreateOperation *)v4 initWithConnectionInterface:v3 sequence:v5 options:v6 queue:v7 completionHandler:&v10];

    objc_msgSend(*(id *)(a1 + 48), "enqueueConnectionOperation:", v9, v10, v11, v12, v13);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __88__LNConnection_AsyncSequence__createAsyncIteratorForSequence_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = [[LNAsyncIterator alloc] initWithReference:v6 connection:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)performAllEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__LNConnection_PerformQuery_Deprecated__performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __108__LNConnection_PerformQuery_Deprecated__performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [LNPerformAllResultsQueryOperation alloc];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) queue];
    id v9 = [(LNPerformAllResultsQueryOperation *)v6 initWithConnectionInterface:v10 entityMangledTypeName:v7 queue:v8 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v9];
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__LNConnection_PerformQuery_Deprecated__performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __114__LNConnection_PerformQuery_Deprecated__performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [LNPerformSuggestedResultsQueryOperation alloc];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) queue];
    id v9 = [(LNPerformSuggestedResultsQueryOperation *)v6 initWithConnectionInterface:v10 entityMangledTypeName:v7 queue:v8 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v9];
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)performSuggestedResultsQueryWithEntityType:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__LNConnection_PerformQuery_Deprecated__performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __102__LNConnection_PerformQuery_Deprecated__performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [LNPerformSuggestedResultsQueryOperation alloc];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) queue];
    id v9 = [(LNPerformSuggestedResultsQueryOperation *)v6 initWithConnectionInterface:v10 entityType:v7 queue:v8 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v9];
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)performQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__LNConnection_PerformQuery__performQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __61__LNConnection_PerformQuery__performQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [LNPerformQueryConnectionOperation alloc];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) queue];
    id v9 = [(LNPerformQueryConnectionOperation *)v6 initWithConnectionInterface:v10 query:v7 queue:v8 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v9];
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)performConfigurableQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__LNConnection_PerformQuery__performConfigurableQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __73__LNConnection_PerformQuery__performConfigurableQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [LNPerformConfigurableQueryConnectionOperation alloc];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) queue];
    id v9 = [(LNPerformConfigurableQueryConnectionOperation *)v6 initWithConnectionInterface:v10 query:v7 queue:v8 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v9];
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchActionAppContextForAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__LNConnection_FetchActionAppContext__fetchActionAppContextForAction_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __88__LNConnection_FetchActionAppContext__fetchActionAppContextForAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [LNFetchActionAppContextConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchActionAppContextConnectionOperation *)v3 initWithConnectionInterface:v7 action:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__LNConnection_FetchAppIntentState__fetchStateForAppIntentIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __89__LNConnection_FetchAppIntentState__fetchStateForAppIntentIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [LNFetchAppIntentStateConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchAppIntentStateConnectionOperation *)v3 initWithConnectionInterface:v7 appIntentIdentifiers:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchDefaultValueForActionMetadata:(id)a3 parameterIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchOptionsDefaultValueForAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__LNConnection_FetchOptionsDefaultValue__fetchOptionsDefaultValueForAction_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __94__LNConnection_FetchOptionsDefaultValue__fetchOptionsDefaultValueForAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [LNFetchOptionsDefaultValueConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchOptionsDefaultValueConnectionOperation *)v3 initWithConnectionInterface:v7 action:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__LNConnection_FetchSuggestedActions__fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __100__LNConnection_FetchSuggestedActions__fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [LNFetchSuggestedActionsForStartWorkoutConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchSuggestedActionsForStartWorkoutConnectionOperation *)v3 initWithConnectionInterface:v7 action:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchSuggestedActionsWithSiriLanguageCode:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__LNConnection_FetchSuggestedActions__fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke;
  v10[3] = &unk_1E5B397D8;
  id v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v10];
}

void __99__LNConnection_FetchSuggestedActions__fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [LNFetchSuggestedActionsConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) queue];
    id v6 = [(LNFetchSuggestedActionsConnectionOperation *)v3 initWithConnectionInterface:v7 siriLanguageCode:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) enqueueConnectionOperation:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__LNConnection_FetchSuggestedActions__fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5B39788;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v6];
}

void __90__LNConnection_FetchSuggestedActions__fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    id v3 = [LNFetchSuggestedActionsFromViewAppIntentConnectionOperation alloc];
    id v4 = [*(id *)(a1 + 32) queue];
    id v5 = [(LNFetchSuggestedActionsFromViewAppIntentConnectionOperation *)v3 initWithConnectionInterface:v6 queue:v4 completionHandler:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) enqueueConnectionOperation:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5B39648;
  void v10[4] = self;
  if (+[LNEntitlementsValidator validateEntitlement:@"com.apple.private.appintents.update-app-shortcut-apps" forCurrentTaskWithValidator:v10])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke_9;
    v8[3] = &unk_1E5B39788;
    v8[4] = self;
    id v9 = v4;
    [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v8];
    id v5 = v9;
  }
  else
  {
    id v6 = getLNLogCategoryMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(LNConnection *)self bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_ERROR, "Unable to update App Shortcuts for %{public}@ because the current process isn't entitled to do so.", buf, 0xCu);
    }
    id v5 = LNConnectionErrorWithCode(1004);
    (*((void (**)(id, void *))v4 + 2))(v4, v5);
  }
}

uint64_t __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v5 = [v3 containsObject:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __88__LNConnection_AppShortcutParameters__updateAppShortcutParametersWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = [LNUpdateAppShortcutParametersOperation alloc];
    id v7 = [*(id *)(a1 + 32) queue];
    id v8 = [(LNUpdateAppShortcutParametersOperation *)v6 initWithConnectionInterface:v9 queue:v7 completionHandler:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) enqueueConnectionOperation:v8];
  }
  else
  {
    if (!v5)
    {
      LNConnectionErrorWithCode(1003);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled])
  {
    id v10 = getLNLogCategoryView();
    id v11 = v10;
    if ((unint64_t)&self->super.isa + 1 >= 2 && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4419000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "LinkServices_fetchStructuredData", "", buf, 2u);
    }

    id v12 = [(id)objc_opt_class() defaultOptions];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v15 = v13;

    [v15 setOpenApplicationPriority:2];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke;
    v16[3] = &unk_1E5B39F58;
    id v19 = v9;
    int64_t v20 = a3;
    id v17 = v8;
    id v18 = self;
    id v21 = self;
    [(LNConnection *)self getConnectionInterfaceWithOptions:v15 completionHandler:v16];
  }
  else
  {
    uint64_t v14 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v14, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Structured data fetching skipped", buf, 2u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CC08], 0);
  }
}

void __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [LNFetchStructuredDataConnectionOperation alloc];
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) queue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2;
    uint64_t v14 = &unk_1E5B39E28;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 64);
    id v15 = v8;
    uint64_t v16 = v9;
    id v10 = [(LNFetchStructuredDataConnectionOperation *)v4 initWithConnectionInterface:v3 typeIdentifier:v5 entityIdentifiers:v6 queue:v7 completionHandler:&v11];

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v10, v11, v12, v13, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __111__LNConnection_FetchViewObjects__fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = getLNLogCategoryView();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LinkServices_fetchStructuredData", "", v5, 2u);
  }
}

- (void)fetchViewActionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled])
  {
    uint64_t v5 = getLNLogCategoryView();
    uint64_t v6 = v5;
    if ((unint64_t)&self->super.isa + 1 >= 2 && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "LinkServices_fetchViewActions", "", buf, 2u);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5B39E00;
    v8[4] = self;
    id v9 = v4;
    id v10 = self;
    [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v8];
  }
  else
  {
    id v7 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Action fetching skipped", buf, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [LNFetchViewActionsConnectionOperation alloc];
    uint64_t v5 = [*(id *)(a1 + 32) queue];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke_2;
    uint64_t v12 = &unk_1E5B39DB0;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v13 = v6;
    uint64_t v14 = v7;
    id v8 = [(LNFetchViewActionsConnectionOperation *)v4 initWithConnectionInterface:v3 queue:v5 completionHandler:&v9];

    objc_msgSend(*(id *)(a1 + 32), "enqueueConnectionOperation:", v8, v9, v10, v11, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__LNConnection_FetchViewObjects__fetchViewActionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = getLNLogCategoryView();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LinkServices_fetchViewActions", "", v5, 2u);
  }
}

- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled])
  {
    [(LNConnection *)self fetchViewEntitiesWithOptions:0 interactionIDs:v6 completionHandler:v7];
  }
  else
  {
    id v8 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", v9, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void)fetchViewEntitiesWithOptions:(id)a3 interactionIDs:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled])
  {
    uint64_t v11 = getLNLogCategoryView();
    uint64_t v12 = v11;
    if ((unint64_t)&self->super.isa + 1 >= 2 && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4419000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "LinkServices_fetchViewEntitiesWithOptions", "", buf, 2u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5B39DD8;
    id v17 = v10;
    id v15 = v9;
    uint64_t v16 = self;
    id v18 = self;
    [(LNConnection *)self getConnectionInterfaceWithOptions:v8 completionHandler:v14];
  }
  else
  {
    id v13 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v13, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_signpost_id_t v4 = [LNFetchViewEntitiesConnectionOperation alloc];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) queue];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke_2;
    uint64_t v12 = &unk_1E5B39DB0;
    id v7 = *(void **)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    id v13 = v7;
    id v8 = [(LNFetchViewEntitiesConnectionOperation *)v4 initWithConnectionInterface:v3 interactionIDs:v5 queue:v6 completionHandler:&v9];

    objc_msgSend(*(id *)(a1 + 40), "enqueueConnectionOperation:", v8, v9, v10, v11, v12);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __96__LNConnection_FetchViewObjects__fetchViewEntitiesWithOptions_interactionIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = getLNLogCategoryView();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_fetchViewEntitiesWithOptions", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)resolveEntitiesForInteractionIDs:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = getLNLogCategoryView();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = getLNLogCategoryView();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LinkServices_resolveEntitiesForInteractionIDs", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5B39DB0;
  os_signpost_id_t v46 = v11;
  id v14 = v9;
  id v45 = v14;
  id v15 = _Block_copy(aBlock);
  if (+[LNFeatureFlags isViewActionAnnotationEnabled])
  {
    uint64_t v16 = (void *)[v7 copy];
    id v17 = (void *)[v8 copy];
    uint64_t v18 = [v16 count];
    id v19 = getLNLogCategoryView();
    int64_t v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v48 = v16;
        __int16 v49 = 2112;
        id v50 = v17;
        _os_log_impl(&dword_1A4419000, v20, OS_LOG_TYPE_INFO, "Requesting entities for identifiers %@ from %@", buf, 0x16u);
      }

      id v21 = getLNLogCategoryView();
      os_signpost_id_t v22 = os_signpost_id_generate(v21);

      id v23 = getLNLogCategoryView();
      uint64_t v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4419000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "LinkServices_establishViewFetchConnection", "", buf, 2u);
      }

      v25 = +[LNConnectionPolicy policyWithBundleIdentifier:v17];
      id v43 = 0;
      int v26 = [v25 connectionWithError:&v43];
      id v38 = v43;
      v27 = getLNLogCategoryView();
      uint64_t v28 = v27;
      if (v26)
      {
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4419000, v28, OS_SIGNPOST_INTERVAL_END, v22, "LinkServices_establishViewFetchConnection", "", buf, 2u);
        }
        char v37 = v25;

        v29 = objc_opt_new();
        [v29 setSceneless:0];
        [v29 setOpenApplicationPriority:2];
        __int16 v30 = getLNLogCategoryView();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v17;
          __int16 v49 = 2112;
          id v50 = v16;
          _os_log_impl(&dword_1A4419000, v30, OS_LOG_TYPE_INFO, "Fetching entities from %@ for interactionIDs %@", buf, 0x16u);
        }

        char v31 = getLNLogCategoryView();
        os_signpost_id_t v32 = os_signpost_id_generate(v31);

        id v33 = getLNLogCategoryView();
        char v34 = v33;
        if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4419000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "LinkServices_fetchViewEntitiesWithOptions", "", buf, 2u);
        }

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke_35;
        v39[3] = &unk_1E5B39F80;
        os_signpost_id_t v42 = v32;
        id v40 = v17;
        id v41 = v15;
        [v26 fetchViewEntitiesWithOptions:v29 interactionIDs:v16 completionHandler:v39];

        v25 = v37;
        v35 = v38;
      }
      else
      {
        v35 = v38;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v17;
          __int16 v49 = 2114;
          id v50 = v38;
          _os_log_impl(&dword_1A4419000, v28, OS_LOG_TYPE_ERROR, "Error establishing connection with %@ to fetch view entities: %{public}@", buf, 0x16u);
        }

        (*((void (**)(void *, void, id))v15 + 2))(v15, MEMORY[0x1E4F1CBF0], v38);
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4419000, v20, OS_LOG_TYPE_ERROR, "No interactionIDs were provided, exiting.", buf, 2u);
      }

      (*((void (**)(void *, void, void))v15 + 2))(v15, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    v36 = getLNLogCategoryView();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v36, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", buf, 2u);
    }

    (*((void (**)(void *, void, void))v15 + 2))(v15, MEMORY[0x1E4F1CBF0], 0);
  }
}

void __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = getLNLogCategoryView();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_resolveEntitiesForInteractionIDs", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__LNConnection_FetchViewObjects__resolveEntitiesForInteractionIDs_bundleIdentifier_completionHandler___block_invoke_35(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getLNLogCategoryView();
  id v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_fetchViewEntitiesWithOptions", "", (uint8_t *)&v12, 2u);
  }

  if (v6)
  {
    uint64_t v10 = getLNLogCategoryView();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[4];
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_ERROR, "Error fetching entities from %@: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  (*(void (**)(void))(a1[5] + 16))();
}

+ (void)fetchEntitiesFromActiveApplicationsWithInteractionIDs:(id)a3 bundleIdentifiers:(id)a4 completionHandler:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = getLNLogCategoryView();
  int v12 = v11;
  if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a1, "LinkServices_fetchEntitiesFromActiveApplications", "", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5B39E28;
  id v81 = a1;
  id v13 = v10;
  id v80 = v13;
  __int16 v14 = _Block_copy(aBlock);
  if (+[LNFeatureFlags isViewActionAnnotationEnabled])
  {
    if (v9 && [v9 count])
    {
      id v15 = v9;
LABEL_20:
      uint64_t v24 = getLNLogCategoryView();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_1A4419000, v24, OS_LOG_TYPE_INFO, "Requesting entities for identifiers %@ for bundles %@", buf, 0x16u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v83 = __Block_byref_object_copy__11915;
      v84 = __Block_byref_object_dispose__11916;
      id v85 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v73 = 0;
      v74 = (os_unfair_lock_s *)&v73;
      uint64_t v75 = 0x2810000000;
      id v76 = &unk_1A451FA67;
      int v77 = 0;
      uint64_t v67 = 0;
      id v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__11915;
      v71 = __Block_byref_object_dispose__11916;
      id v72 = 0;
      uint64_t v61 = 0;
      id v62 = &v61;
      uint64_t v63 = 0x3032000000;
      id v64 = __Block_byref_object_copy__11915;
      id v65 = __Block_byref_object_dispose__11916;
      id v66 = 0;
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_15;
      v60[3] = &unk_1E5B39E50;
      v60[4] = &v67;
      int v26 = _Block_copy(v60);
      v27 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
      [v27 setNeedsUserInteractivePriority:1];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_2;
      v49[3] = &unk_1E5B39F08;
      uint64_t v55 = &v73;
      id v56 = &v67;
      id v57 = &v61;
      id v28 = v26;
      id v53 = v28;
      id v58 = buf;
      id v9 = v15;
      id v50 = v9;
      id v29 = v25;
      id v51 = v29;
      id v52 = v8;
      id v59 = a1;
      id v30 = v14;
      id v54 = v30;
      [v27 setTransitionHandler:v49];
      char v31 = getLNLogCategoryView();
      os_signpost_id_t v32 = v31;
      if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v31))
      {
        *(_WORD *)id v48 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4419000, v32, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a1, "LinkServices_invokeFBSDisplayLayoutMonitor", "", v48, 2u);
      }

      os_unfair_lock_lock(v74 + 8);
      uint64_t v33 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v27];
      char v34 = (void *)v68[5];
      v68[5] = v33;

      v35 = [LNWatchdogTimer alloc];
      uint64_t v40 = MEMORY[0x1E4F143A8];
      uint64_t v41 = 3221225472;
      os_signpost_id_t v42 = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_32;
      id v43 = &unk_1E5B39F30;
      os_signpost_id_t v46 = &v73;
      v47 = &v67;
      id v36 = v28;
      id v44 = v36;
      id v45 = v30;
      uint64_t v37 = [(LNWatchdogTimer *)v35 initWithTimeoutInterval:&v40 timeoutHandler:0.5];
      id v38 = (void *)v62[5];
      v62[5] = v37;

      objc_msgSend((id)v62[5], "start", v40, v41, v42, v43);
      os_unfair_lock_unlock(v74 + 8);

      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v67, 8);

      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_29;
    }
    id v17 = getLNLogCategoryMetadata();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_DEBUG, "No bundleIDs provided, using all enabled applications", buf, 2u);
    }

    uint64_t v18 = getLNLogCategoryView();
    id v19 = v18;
    if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4419000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a1, "LinkServices_fetchMetadataBundles", "", buf, 2u);
    }

    int64_t v20 = objc_alloc_init(LNMetadataProvider);
    id v78 = 0;
    id v15 = [(LNMetadataProvider *)v20 bundlesWithError:&v78];
    id v21 = v78;

    os_signpost_id_t v22 = getLNLogCategoryView();
    id v23 = v22;
    if ((unint64_t)a1 + 1 >= 2 && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4419000, v23, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)a1, "LinkServices_fetchMetadataBundles", "", buf, 2u);
    }

    if (v15 && [v15 count])
    {

      goto LABEL_20;
    }
    __int16 v39 = getLNLogCategoryView();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v39, OS_LOG_TYPE_ERROR, "Aborting early because no bundles could be found to query", buf, 2u);
    }

    (*((void (**)(void *, void, id))v14 + 2))(v14, 0, v21);
    id v9 = v15;
  }
  else
  {
    uint64_t v16 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Action fetching skipped", buf, 2u);
    }

    (*((void (**)(void *, void, void))v14 + 2))(v14, MEMORY[0x1E4F1CC08], 0);
  }
LABEL_29:
}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = getLNLogCategoryView();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LinkServices_fetchEntitiesFromActiveApplications", "", v11, 2u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_15(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v58 = a2;
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
  id v59 = v7;
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
    if (v7)
    {
      id v57 = v8;
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) cancel];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
      os_signpost_id_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v10 = [v7 elements];
      uint64_t v11 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_11922);
      uint64_t v12 = [v9 setWithArray:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 96) + 8);
      __int16 v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      id v15 = getLNLogCategoryView();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4419000, v15, OS_LOG_TYPE_INFO, "Querying all entities for each application", (uint8_t *)&buf, 2u);
      }

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v74 objects:v88 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v75 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v74 + 1) + 8 * i);
            if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) containsObject:v20])
            {
              uint64_t v21 = *(void *)(a1 + 48);
              if (v21)
              {
                [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:v20];
              }
              else
              {
                id v23 = objc_opt_new();
                [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:v20];
              }
            }
            else
            {
              os_signpost_id_t v22 = getLNLogCategoryView();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v20;
                _os_log_impl(&dword_1A4419000, v22, OS_LOG_TYPE_DEBUG, "Filtering out offscreen bundle %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v74 objects:v88 count:16];
        }
        while (v17);
      }

      uint64_t v24 = getLNLogCategoryView();
      id v25 = v24;
      os_signpost_id_t v26 = *(void *)(a1 + 104);
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4419000, v25, OS_SIGNPOST_INTERVAL_END, v26, "LinkServices_invokeFBSDisplayLayoutMonitor", "", (uint8_t *)&buf, 2u);
      }

      v27 = getLNLogCategoryView();
      id v28 = v27;
      os_signpost_id_t v29 = *(void *)(a1 + 104);
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4419000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "LinkServices_establishViewFetchConnections", "", (uint8_t *)&buf, 2u);
      }

      id v30 = [*(id *)(a1 + 40) allKeys];
      char v31 = objc_msgSend(v30, "if_compactMap:", &__block_literal_global_24);

      os_signpost_id_t v32 = getLNLogCategoryView();
      uint64_t v33 = v32;
      os_signpost_id_t v34 = *(void *)(a1 + 104);
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4419000, v33, OS_SIGNPOST_INTERVAL_END, v34, "LinkServices_establishViewFetchConnections", "", (uint8_t *)&buf, 2u);
      }

      uint64_t v61 = objc_opt_new();
      [v61 setSceneless:0];
      [v61 setOpenApplicationPriority:2];
      v35 = getLNLogCategoryView();
      id v36 = v35;
      os_signpost_id_t v37 = *(void *)(a1 + 104);
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4419000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "LinkServices_aggregatingEntities", "", (uint8_t *)&buf, 2u);
      }

      id v38 = getLNLogCategoryView();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v39 = [*(id *)(a1 + 40) allKeys];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v39;
        _os_log_impl(&dword_1A4419000, v38, OS_LOG_TYPE_DEFAULT, "Aggregating entities from bundles %@", (uint8_t *)&buf, 0xCu);
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v84 = 0x3032000000;
      id v85 = __Block_byref_object_copy__11915;
      uint64_t v86 = __Block_byref_object_dispose__11916;
      v87 = objc_alloc_init(LNViewEntityAggregationResult);
      uint64_t v40 = dispatch_group_create();
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obj = v31;
      uint64_t v41 = [obj countByEnumeratingWithState:&v70 objects:v82 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v71;
        do
        {
          uint64_t v43 = 0;
          do
          {
            if (*(void *)v71 != v42) {
              objc_enumerationMutation(obj);
            }
            id v44 = *(void **)(*((void *)&v70 + 1) + 8 * v43);
            dispatch_group_enter(v40);
            id v45 = *(void **)(a1 + 40);
            os_signpost_id_t v46 = [v44 bundleIdentifier];
            v47 = [v45 objectForKeyedSubscript:v46];

            id v48 = getLNLogCategoryView();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              __int16 v49 = [v44 bundleIdentifier];
              *(_DWORD *)id v78 = 138412546;
              v79 = v49;
              __int16 v80 = 2112;
              id v81 = v47;
              _os_log_impl(&dword_1A4419000, v48, OS_LOG_TYPE_INFO, "Fetching entities from %@ for interactionIDs %@", v78, 0x16u);
            }
            id v50 = getLNLogCategoryView();
            id v51 = v50;
            if ((unint64_t)v44 + 1 >= 2 && os_signpost_enabled(v50))
            {
              *(_WORD *)id v78 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A4419000, v51, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v44, "LinkServices_fetchViewEntitiesWithOptions", "", v78, 2u);
            }

            if ([v47 count]) {
              id v52 = v47;
            }
            else {
              id v52 = 0;
            }
            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_27;
            v66[3] = &unk_1E5B39EB8;
            p_long long buf = &buf;
            v66[4] = v44;
            uint64_t v67 = v40;
            uint64_t v69 = v44;
            [v44 fetchViewEntitiesWithOptions:v61 interactionIDs:v52 completionHandler:v66];

            ++v43;
          }
          while (v41 != v43);
          uint64_t v53 = [obj countByEnumeratingWithState:&v70 objects:v82 count:16];
          uint64_t v41 = v53;
        }
        while (v53);
      }

      id v54 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_28;
      block[3] = &unk_1E5B39EE0;
      uint64_t v65 = *(void *)(a1 + 104);
      id v63 = *(id *)(a1 + 64);
      id v64 = &buf;
      dispatch_group_notify(v40, v54, block);

      _Block_object_dispose(&buf, 8);
      id v8 = v57;
    }
  }
  else
  {
    id v55 = v8;
    id v56 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A4419000, v56, OS_LOG_TYPE_ERROR, "Detected second call to transition handler before first has completed.", (uint8_t *)&buf, 2u);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
    id v8 = v55;
  }
}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_32(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    (*(void (**)(void))(a1[4] + 16))();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 32));
    uint64_t v2 = a1[5];
    LNConnectionErrorWithCode(2200);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v4);
  }
  else
  {
    id v3 = (os_unfair_lock_s *)(*(void *)(a1[6] + 8) + 32);
    os_unfair_lock_unlock(v3);
  }
}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  os_signpost_id_t v9 = [v6 bundleIdentifier];
  [v5 addResults:v8 error:v7 forBundle:v9];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  uint64_t v10 = getLNLogCategoryView();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v11, OS_SIGNPOST_INTERVAL_END, v12, "LinkServices_fetchViewEntitiesWithOptions", "", v13, 2u);
  }
}

void __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_28(void *a1)
{
  id v3 = getLNLogCategoryView();
  id v4 = v3;
  os_signpost_id_t v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v4, OS_SIGNPOST_INTERVAL_END, v5, "LinkServices_aggregatingEntities", "", buf, 2u);
  }

  id v6 = getLNLogCategoryView();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v12 = 0;
    _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_DEFAULT, "Entity aggregation completed", v12, 2u);
  }

  uint64_t v7 = a1[4];
  id v8 = [*(id *)(*(void *)(a1[5] + 8) + 40) entities];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    v1 = [*(id *)(*(void *)(a1[5] + 8) + 40) entities];
    uint64_t v10 = (void *)[v1 copy];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [*(id *)(*(void *)(a1[5] + 8) + 40) error];
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v10, v11);

  if (v9)
  {
  }
}

id __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[LNConnectionPolicy policyWithBundleIdentifier:v2];
  id v8 = 0;
  id v4 = [v3 connectionWithError:&v8];
  id v5 = v8;
  if (!v4)
  {
    id v6 = getLNLogCategoryView();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v10 = v2;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_ERROR, "Error establishing connection with %@ to fetch view entities: %{public}@", buf, 0x16u);
    }
  }
  return v4;
}

uint64_t __124__LNConnection_FetchViewObjects__fetchEntitiesFromActiveApplicationsWithInteractionIDs_bundleIdentifiers_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

+ (void)fetchEntitiesFromActiveApplicationsWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[LNFeatureFlags isViewActionAnnotationEnabled])
  {
    [a1 fetchEntitiesFromActiveApplicationsWithInteractionIDs:v6 bundleIdentifiers:0 completionHandler:v7];
  }
  else
  {
    id v8 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "Link/viewActions flag disabled. Entity fetching skipped", v9, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08], 0);
  }
}

- (NSMapTable)executors
{
  return self->_executors;
}

- (void)setLogPrefix:(id)a3
{
}

- (LNConnectionDelegate)manager
{
  return self->_manager;
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v8 = [(LNConnection *)self activity];
  os_activity_scope_enter(v8, &state);

  uint64_t v9 = [(LNConnection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__LNConnection_assertion_didInvalidateWithError___block_invoke;
  block[3] = &unk_1E5B3A1F8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);

  os_activity_scope_leave(&state);
}

void __49__LNConnection_assertion_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = [*(id *)(a1 + 32) processMonitor];
  id v3 = [v2 states];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (!v4)
  {

LABEL_12:
    uint64_t v9 = LNConnectionErrorWithCode(1003);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = objc_msgSend(*(id *)(a1 + 32), "assertionsMapTable", 0);
    id v10 = (void *)[v12 copy];

    uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v18 = [*(id *)(a1 + 32) assertionsMapTable];
          id v19 = [v18 objectForKey:v17];
          uint64_t v20 = *(void **)(a1 + 48);

          if (v19 == v20) {
            [v17 finishWithError:v9];
          }
        }
        uint64_t v14 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v26;
  int v7 = 1;
  do
  {
    for (uint64_t j = 0; j != v5; ++j)
    {
      if (*(void *)v26 != v6) {
        objc_enumerationMutation(v3);
      }
      v7 &= [*(id *)(*((void *)&v25 + 1) + 8 * j) taskState];
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v34 count:16];
  }
  while (v5);

  if (v7) {
    goto LABEL_12;
  }
  uint64_t v9 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = [*(id *)(a1 + 32) logPrefix];
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    char v31 = v10;
    __int16 v32 = 2114;
    uint64_t v33 = v11;
    _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Application process assertion was dropped after timeout: %{public}@", buf, 0x16u);
LABEL_21:
  }
}

- (id)executorForAction:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v15);
  uint64_t v11 = [[LNActionExecutor alloc] initWithAction:v8 connection:self options:v9];
  [(LNActionExecutor *)v11 setDelegate:v10];
  id v12 = [(LNConnection *)self executors];
  uint64_t v13 = [(LNActionExecutor *)v11 identifier];
  [v12 setObject:v11 forKey:v13];

  os_activity_scope_leave(&v15);
  return v11;
}

- (void)closeWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LNConnection *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__LNConnection_closeWithError___block_invoke;
  v7[3] = &unk_1E5B3A0D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __31__LNConnection_closeWithError___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = getLNLogCategoryConnection();
  id v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v5 = [*(id *)(a1 + 40) bundleIdentifier];
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    long long v25 = v5;
    __int16 v26 = 2114;
    uint64_t v27 = v6;
    int v7 = "Connection to %@ closed due to error %{public}@";
    id v8 = v4;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v5 = [*(id *)(a1 + 40) bundleIdentifier];
    *(_DWORD *)long long buf = 138412290;
    long long v25 = v5;
    int v7 = "Connection to %@ closed";
    id v8 = v4;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_1A4419000, v8, v9, v7, buf, v10);

LABEL_7:
  [*(id *)(a1 + 40) cancelIdleTimeout];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "currentConnectionOperations", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) finishWithError:*(void *)(a1 + 32)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v16 = [*(id *)(a1 + 40) manager];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v18 = [*(id *)(a1 + 40) manager];
    [v18 connection:*(void *)(a1 + 40) didCloseWithError:*(void *)(a1 + 32)];
  }
}

- (void)close
{
}

- (void)cancelIdleTimeout
{
  id v3 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(LNConnection *)self idleTimer];

  if (v4)
  {
    id v5 = [(LNConnection *)self idleTimer];
    [v5 cancel];
  }
}

void __28__LNConnection_setIdleTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && ([(os_activity_t *)WeakRetained targetIsBeingDebugged] & 1) == 0)
  {
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2[19], &v4);
    id v3 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Closing idle connection (%@)", buf, 0xCu);
    }

    [(os_activity_t *)v2 closeWithError:0];
    os_activity_scope_leave(&v4);
  }
}

- (void)fetchListenerEndpointFromApplicationServiceWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(LNConnection *)self logPrefix];
    id v8 = [(LNConnection *)self processInstanceIdentifier];
    *(_DWORD *)long long buf = 138543618;
    long long v22 = v7;
    __int16 v23 = 2114;
    long long v24 = v8;
    _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_INFO, "%{public}@ Fetching XPC listener endpoint for processInstanceIdentifier: %{public}@ from ApplicationService", buf, 0x16u);
  }
  os_log_type_t v9 = [(LNConnection *)self processInstanceIdentifier];

  if (v9)
  {
    uint32_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.autoShortcut" options:0];
    uint64_t v11 = LNDaemonApplicationXPCInterface();
    [v10 setRemoteObjectInterface:v11];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__LNConnection_fetchListenerEndpointFromApplicationServiceWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E5B3A0B0;
    v20[4] = self;
    [v10 setInvalidationHandler:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__LNConnection_fetchListenerEndpointFromApplicationServiceWithCompletionHandler___block_invoke_111;
    v19[3] = &unk_1E5B3A0B0;
    v19[4] = self;
    [v10 setInterruptionHandler:v19];
    uint64_t v12 = [(LNConnection *)self queue];
    [v10 _setQueue:v12];

    [v10 resume];
    uint64_t v13 = [v10 remoteObjectProxy];
    uint64_t v14 = [(LNConnection *)self processInstanceIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__LNConnection_fetchListenerEndpointFromApplicationServiceWithCompletionHandler___block_invoke_112;
    v16[3] = &unk_1E5B3A1A8;
    id v17 = v10;
    id v18 = v4;
    id v15 = v10;
    [v13 fetchListenerEndpointForProcessInstanceIdentifier:v14 reply:v16];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LNConnectionErrorDomain" code:2302 userInfo:0];
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v15);
  }
}

void __81__LNConnection_fetchListenerEndpointFromApplicationServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) logPrefix];
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_INFO, "%{public}@ ApplicationService connection invalidated", (uint8_t *)&v4, 0xCu);
  }
}

void __81__LNConnection_fetchListenerEndpointFromApplicationServiceWithCompletionHandler___block_invoke_111(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) logPrefix];
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_INFO, "%{public}@ ApplicationService connection interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void __81__LNConnection_fetchListenerEndpointFromApplicationServiceWithCompletionHandler___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__LNConnection_connectUsingProcessIdentifierWithOptions_setupWithAssertions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  id v7 = *(void **)(a1 + 32);
  if (v5)
  {
    id v8 = [v5 xpcListenerEndpoint];
    [v6 auditToken];
    [v7 connectUsingListenerEndpoint:v8 auditToken:&v9 setupWithAssertions:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    [*(id *)(a1 + 32) setDisconnectedWithError:a3];
  }
}

- (BOOL)isDaemon
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F4F6A8];
  [(LNConnection *)self auditToken];
  int v4 = [v3 tokenFromAuditToken:v13];
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "pid"));
  id v12 = 0;
  id v6 = [MEMORY[0x1E4F963E8] handleForIdentifier:v5 error:&v12];
  id v7 = v12;
  if (v6)
  {
    char v8 = [v6 isDaemon];
  }
  else
  {
    uint64_t v9 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint32_t v10 = [(LNConnection *)self logPrefix];
      *(_DWORD *)long long buf = 138543874;
      id v15 = v10;
      __int16 v16 = 2114;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);
    }
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isPerformActionOperationPending
{
  id v3 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(LNConnection *)self connectionOperations];
  id v5 = [v4 objectsPassingTest:&__block_literal_global_12433];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

uint64_t __47__LNConnection_isPerformActionOperationPending__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)targetIsBeingDebugged
{
  [(LNConnection *)self auditToken];
  if ((int)LNPIDForAuditToken(&v3) < 1) {
    return 0;
  }
  else {
    return BSPIDIsBeingDebugged();
  }
}

- (void)extendTimeoutForOperationWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"LNConnection.m", 528, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  BOOL v6 = [(LNConnection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__LNConnection_extendTimeoutForOperationWithIdentifier___block_invoke;
  block[3] = &unk_1E5B3A0D8;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __56__LNConnection_extendTimeoutForOperationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) operationWithIdentifier:*(void *)(a1 + 40)];
  long long v3 = v2;
  if (v2)
  {
    [v2 extendTimeout];
    [*(id *)(a1 + 32) extendIdleTimeout];
    [*(id *)(a1 + 32) invalidateAssertionsForConnectionOperation:v3];
    [*(id *)(a1 + 32) acquireAssertionsForConnectionOperation:v3];
  }
  else
  {
    int v4 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543618;
      char v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Operation not found: unable to extend timeout for operation with identifier %{public}@.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)cancelTimeoutForOperationWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"LNConnection.m", 513, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v6 = [(LNConnection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__LNConnection_cancelTimeoutForOperationWithIdentifier___block_invoke;
  block[3] = &unk_1E5B3A0D8;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __56__LNConnection_cancelTimeoutForOperationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) operationWithIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 32) invalidateAssertionsForConnectionOperation:v2];
    [v2 cancelTimeout];
    [*(id *)(a1 + 32) cancelIdleTimeout];
  }
  else
  {
    long long v3 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138543618;
      id v7 = v4;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Operation not found: unable to cancel timeout for operation with identifier %{public}@.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (NSSet)currentConnectionOperations
{
  long long v3 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(LNConnection *)self connectionOperations];
  uint64_t v5 = (void *)[v4 copy];

  return (NSSet *)v5;
}

- (id)operationWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LNConnection.m", 495, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(LNConnection *)self connectionOperations];
  id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 identifier];
        char v13 = [v12 isEqual:v5];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_13;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v8;
}

- (void)setDisconnectedWithError:(id)a3
{
  id v7 = a3;
  id v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(LNConnection *)self state] != 3
    && [(LNConnection *)self state] != 1
    && [(LNConnection *)self state] != 2)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"LNConnection.m", 487, @"Invalid parameter not satisfying: %@", @"self.state == LNConnectionStateConnected || self.state == LNConnectionStateConnecting || self.state == LNConnectionStateRefreshing" object file lineNumber description];
  }
  [(LNConnection *)self setState:0];
  [(LNConnection *)self completeWithError:v7];
}

void __75__LNConnection_performGetConnectionInterfaceWithOptions_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    long long v3 = *(void **)(a1 + 40);
    LNConnectionErrorWithCode(1900);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 completeWithError:v4];
  }
}

void __35__LNConnection_connectionInterface__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = [WeakRetained logPrefix];
    *(_DWORD *)long long buf = 138543618;
    long long v18 = v6;
    __int16 v19 = 2114;
    id v20 = v3;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Remote object proxy error: %{public}@", buf, 0x16u);
  }
  if ([WeakRetained state] == 3)
  {
    [WeakRetained setDisconnectedWithError:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = objc_msgSend(WeakRetained, "currentConnectionOperations", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) finishWithError:v3];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void __33__LNConnection_setXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [WeakRetained logPrefix];
    *(_DWORD *)long long buf = 138543362;
    __int16 v19 = v4;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_ERROR, "%{public}@ XPC connection has been interrupted", buf, 0xCu);
  }
  if (WeakRetained)
  {
    id v5 = [WeakRetained xpcConnection];
    [v5 invalidate];

    [WeakRetained setXPCConnection:0];
    [WeakRetained setState:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v6 = objc_msgSend(WeakRetained, "currentConnectionOperations", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          uint64_t v11 = LNConnectionErrorWithCode(1004);
          [v10 finishWithError:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  os_activity_scope_leave(&state);
}

void __33__LNConnection_setXPCConnection___block_invoke_69(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "[%@] XPC connection has been invalidated", buf, 0xCu);
  }

  if (WeakRetained)
  {
    [WeakRetained setXPCConnection:0];
    [WeakRetained setState:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(WeakRetained, "currentConnectionOperations", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          uint64_t v10 = LNConnectionErrorWithCode(1005);
          [v9 finishWithError:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }
  }
  os_activity_scope_leave(&state);
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return (NSString *)v6;
}

- (void)_invalidateAllAssertions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMapTable *)self->_assertionsMapTable objectEnumerator];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 removeObserver:self];
        [v8 invalidate];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(NSMapTable *)self->_assertionsMapTable removeAllObjects];
}

+ (id)optionsForAction:(id)a3 interactionMode:(int64_t)a4 source:(unsigned __int16)a5 sourceOverride:(id)a6
{
  id v7 = a3;
  uint64_t v8 = [a1 defaultOptions];
  long long v9 = [v7 systemProtocols];
  long long v10 = [MEMORY[0x1E4F72710] audioStartingProtocol];
  if ([v9 containsObject:v10])
  {
  }
  else
  {
    long long v11 = [v7 systemProtocols];
    long long v12 = [MEMORY[0x1E4F72710] audioRecordingProtocol];
    int v13 = [v11 containsObject:v12];

    if (!v13) {
      goto LABEL_5;
    }
  }
  [v8 setInitiatesAudioSession:1];
LABEL_5:

  return v8;
}

+ (void)invalidateAllConnections
{
  id v2 = +[LNConnectionManager sharedInstance];
  [v2 invalidateAllConnections];
}

- (id)executorForAction:(id)a3 interactionMode:(int64_t)a4 label:(id)a5 source:(unsigned __int16)a6 delegate:(id)a7
{
  uint64_t v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  long long v15 = objc_opt_new();
  [v15 setClientLabel:v13];

  [v15 setInteractionMode:a4];
  [v15 setSource:v7];
  long long v16 = [(LNConnection *)self executorForAction:v14 options:v15 delegate:v12];

  return v16;
}

- (id)executorForAction:(id)a3 interactionMode:(int64_t)a4 label:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setClientLabel:v11];

  [v13 setInteractionMode:a4];
  [v13 setSource:0];
  id v14 = [(LNConnection *)self executorForAction:v12 options:v13 delegate:v10];

  return v14;
}

- (id)executorForAction:(id)a3 label:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  [v11 setClientLabel:v9];

  [v11 setInteractionMode:0];
  [v11 setSource:0];
  id v12 = [(LNConnection *)self executorForAction:v10 options:v11 delegate:v8];

  return v12;
}

- (id)executorForAction:(id)a3 metadata:(id)a4 options:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [a4 effectiveBundleIdentifiers];
  id v14 = [v13 array];
  long long v15 = objc_msgSend(v14, "if_firstObjectPassingTest:", &__block_literal_global_346);
  long long v16 = [v15 bundleIdentifier];
  appBundleIdentifier = self->_appBundleIdentifier;
  self->_appBundleIdentifier = v16;

  uint64_t v18 = [(LNConnection *)self executorForAction:v12 options:v11 delegate:v10];

  return v18;
}

BOOL __72__LNConnection_Deprecated__executorForAction_metadata_options_delegate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 0;
}

- (id)executorForAction:(id)a3 metadata:(id)a4 appBundleIdentifier:(id)a5 options:(id)a6 delegate:(id)a7
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a5);
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  id v14 = [(LNConnection *)self executorForAction:v13 options:v12 delegate:v11];

  return v14;
}

- (LNConnection)initWithBundleIdentifier:(id)a3
{
  return [(LNConnection *)self initWithBundleIdentifier:a3 metadataVersion:0 error:0];
}

- (LNConnection)initWithBundleIdentifier:(id)a3 metadataVersion:(int64_t)a4 error:(id *)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F223F8];
  id v8 = a3;
  id v9 = [v7 bundleRecordWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
  objc_opt_class();
  uint64_t v10 = objc_opt_isKindOfClass() & 1;
  id v11 = objc_alloc(MEMORY[0x1E4F72630]);
  id v12 = [v9 URL];
  id v13 = (void *)[v11 initWithType:v10 bundleIdentifier:v8 url:v12];

  id v14 = +[LNConnectionManager sharedInstance];
  long long v15 = [v14 connectionForEffectiveBundleIdentifier:v13 appBundleIdentifier:0 processInstanceIdentifier:0 mangledTypeName:0 userIdentity:0 error:a5];

  return v15;
}

- (int64_t)metadataVersion
{
  return 1;
}

- (NSURL)bundleURL
{
  id v2 = [(LNConnection *)self effectiveBundleIdentifier];
  id v3 = [v2 url];

  return (NSURL *)v3;
}

- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __124__LNConnection_FetchSuggestedFocusActions__fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke;
  v14[3] = &unk_1E5B3A5E8;
  id v15 = v8;
  id v16 = v9;
  long long v17 = self;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(LNConnection *)self getConnectionInterfaceWithOptions:0 completionHandler:v14];
}

void __124__LNConnection_FetchSuggestedFocusActions__fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = [LNFetchSuggestedFocusActionsConnectionOperation alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) queue];
    uint64_t v7 = [(LNFetchSuggestedFocusActionsConnectionOperation *)v3 initWithConnectionInterface:v8 actionMetadata:v4 suggestionContext:v5 queue:v6 completionHandler:*(void *)(a1 + 56)];

    [*(id *)(a1 + 48) enqueueConnectionOperation:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

@end