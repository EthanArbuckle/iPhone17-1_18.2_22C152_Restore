@interface DEDBugSession
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (id)testingInstance;
- (BOOL)finisherDidCommit;
- (BOOL)hasCapability:(id)a3;
- (BOOL)hasDirectory;
- (BOOL)hasStaleDirectory;
- (BOOL)isCancelling;
- (BOOL)isRunningDE:(id)a3;
- (BOOL)isTarget;
- (BOOL)readyToCancel;
- (BOOL)readyToFinish;
- (BOOL)readyToNotify;
- (BOOL)shouldCollectDiagnosticWithId:(id)a3;
- (DEDBugSession)initWithCoder:(id)a3;
- (DEDBugSession)initWithConfiguration:(id)a3;
- (DEDBugSessionConfiguration)config;
- (DEDClientProtocol)client;
- (DEDExtensionIdentifierManager)identifierManager;
- (DEDFinisher)_finisher;
- (DEDNotifier)_notifier;
- (DEDUploadStatusDelegate)__uploadDelegate;
- (DEDUploadStatusDelegate)uploadDelegate;
- (DEDWorkerProtocol)worker;
- (NSArray)allExtensionIdentifiers;
- (NSDate)uploadStartTime;
- (NSDictionary)cachedExtensions;
- (NSMutableArray)adoptFilesCompletions;
- (NSMutableArray)deListCompletions;
- (NSMutableDictionary)deCompletions;
- (NSMutableDictionary)ongoingCompletionHandlers;
- (NSMutableDictionary)pendingOperations;
- (NSMutableSet)filePromises;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)identifier;
- (NSString)priorClientAddress;
- (OS_dispatch_queue)_diskAccessQueue;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)diskAccessQueue;
- (OS_os_log)log;
- (id)configuration;
- (id)deTextDataLoadCompletion;
- (id)finisher;
- (id)finisherWithState;
- (id)hashExtensions:(id)a3;
- (id)knownExtensions;
- (id)nextCompletionBlockForIdentifier:(id)a3;
- (id)notifier;
- (id)ongoingCollectOperationsWithOperations:(id)a3;
- (id)ongoingExtensionCollectionOperations;
- (id)pingHandler;
- (id)prettyDescription;
- (id)scheduledDeferredExtensionCollectionOperations;
- (id)sessionStateCompletionBlock;
- (id)shortDescription;
- (id)startDiagnosticExtensionWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5;
- (id)startDiagnosticExtensionWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 completion:(id)a6;
- (id)stateInfo;
- (id)statusCompletionBlock;
- (id)syncCompletionBlock;
- (int64_t)instanceType;
- (int64_t)priorClientTransportType;
- (int64_t)priorWorkerTransportType;
- (int64_t)state;
- (void)_addSessionData:(id)a3 filename:(id)a4;
- (void)_cancel;
- (void)_logOperationQueue;
- (void)_prepareForStartDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 newCollectRemovedPendingKill:(BOOL *)a5 completion:(id)a6;
- (void)_streamOperationQueue;
- (void)_terminateExtensionWithIdentifier:(id)a3 info:(id)a4;
- (void)addData:(id)a3 withFilename:(id)a4;
- (void)adoptFiles:(id)a3 withCompletion:(id)a4;
- (void)attachCompletionHandlerForDEDExtensionIdentifier:(id)a3 handler:(id)a4;
- (void)attachCompletionHandlerForOngoingOperation:(id)a3 handler:(id)a4;
- (void)cancel;
- (void)cancelDiagnosticExtension:(id)a3;
- (void)cancelDiagnosticExtensionWithDEDExtensionIdentifier:(id)a3;
- (void)cancelDiagnosticExtensionWithIdentifier:(id)a3;
- (void)cancelDiagnosticExtensionWithIdentifier:(id)a3 invocationNumber:(int64_t)a4;
- (void)cleanup;
- (void)cleanupFinishedUploads:(BOOL)a3;
- (void)clearNotification;
- (void)clearNotificationOnFilingDevice;
- (void)commit;
- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4;
- (void)configuration;
- (void)didAdoptFilesWithError:(id)a3;
- (void)didAdoptGroup:(id)a3;
- (void)didCancel;
- (void)didCommit;
- (void)didFinishAllUploads;
- (void)didFinishOperation:(int64_t)a3 withIdentifier:(id)a4;
- (void)didGetState:(int64_t)a3 info:(id)a4;
- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4;
- (void)didStart;
- (void)didTerminateDiagnosticExtension:(id)a3 info:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)finallyStartDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4;
- (void)getSessionStatusWithCompletion:(id)a3;
- (void)getStateWithCompletion:(id)a3;
- (void)hasCollected:(id)a3 isCollecting:(id)a4;
- (void)hasCollected:(id)a3 isCollecting:(id)a4 identifiers:(id)a5;
- (void)idsInbound_clearNotificationOnFilingDevice;
- (void)idsInbound_didClearNotificationOnFilingDevice;
- (void)idsInbound_didPresentNotificationOnFilingDevice;
- (void)idsInbound_presentNotificationOnFilingDevice;
- (void)instanceType;
- (void)listDiagnosticExtensionsWithCompletion:(id)a3;
- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 completion:(id)a5;
- (void)notifier;
- (void)notifyPromiseCancellationIfNeeded:(id)a3 info:(id)a4;
- (void)pingWithCallback:(id)a3;
- (void)pong;
- (void)presentNotificationOnFilingDevice;
- (void)removeAttachment:(id)a3;
- (void)removeFromStore;
- (void)resumePendingOperations;
- (void)save;
- (void)scheduleDiagnosticCollectionForClassBAccessWithIdentifier:(id)a3 parameters:(id)a4;
- (void)scheduleNotification;
- (void)setAdoptFilesCompletions:(id)a3;
- (void)setCachedExtensions:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setClient:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDeCompletions:(id)a3;
- (void)setDeListCompletions:(id)a3;
- (void)setDeTextDataLoadCompletion:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFilePromises:(id)a3;
- (void)setFinisherDidCommit:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierManager:(id)a3;
- (void)setOngoingCompletionHandlers:(id)a3;
- (void)setPendingOperations:(id)a3;
- (void)setPingHandler:(id)a3;
- (void)setPriorClientAddress:(id)a3;
- (void)setPriorClientTransportType:(int64_t)a3;
- (void)setPriorWorkerTransportType:(int64_t)a3;
- (void)setSessionStateCompletionBlock:(id)a3;
- (void)setStatusCompletionBlock:(id)a3;
- (void)setSyncCompletionBlock:(id)a3;
- (void)setUploadDelegate:(id)a3;
- (void)setUploadStartTime:(id)a3;
- (void)setWorker:(id)a3;
- (void)set__uploadDelegate:(id)a3;
- (void)set_diskAccessQueue:(id)a3;
- (void)set_finisher:(id)a3;
- (void)set_notifier:(id)a3;
- (void)startDiagnosticExtension:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)startDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)startDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 completion:(id)a6;
- (void)storeCollectionCompletion:(id)a3 forIdentifier:(id)a4;
- (void)supportsDiagnostics:(id)a3;
- (void)synchronizeSessionStatusWithCompletion:(id)a3;
- (void)terminateExtension:(id)a3 withInfo:(id)a4;
- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4;
- (void)willPerformOperationWithID:(id)a3 type:(int64_t)a4 options:(id)a5;
@end

@implementation DEDBugSession

- (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __20__DEDBugSession_log__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-bs");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;
}

- (OS_dispatch_queue)callbackQueue
{
  p_callbackQueue = &self->_callbackQueue;
  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    objc_storeStrong((id *)p_callbackQueue, MEMORY[0x263EF83A0]);
    callbackQueue = *p_callbackQueue;
  }
  return callbackQueue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDBugSession)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DEDBugSession;
  v6 = [(DEDBugSession *)&v16 init];
  v7 = v6;
  if (v6)
  {
    [(DEDBugSession *)v6 setFinisherDidCommit:0];
    v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    [(DEDBugSession *)v7 setDeListCompletions:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [(DEDBugSession *)v7 setDeCompletions:v9];

    v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    [(DEDBugSession *)v7 setAdoptFilesCompletions:v10];

    v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [(DEDBugSession *)v7 setPendingOperations:v11];

    v12 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [(DEDBugSession *)v7 setOngoingCompletionHandlers:v12];

    [(DEDBugSession *)v7 setPriorClientTransportType:0];
    [(DEDBugSession *)v7 setPriorWorkerTransportType:0];
    v13 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
    [(DEDBugSession *)v7 setFilePromises:v13];

    objc_storeStrong((id *)&v7->_config, a3);
    [(DEDBugSession *)v7 set_finisher:0];
    v14 = objc_opt_new();
    [(DEDBugSession *)v7 setIdentifierManager:v14];

    [(DEDBugSession *)v7 _logOperationQueue];
  }

  return v7;
}

- (id)finisher
{
  if (![(DEDBugSession *)self isTarget])
  {
    v7 = 0;
    goto LABEL_14;
  }
  v3 = [(DEDBugSession *)self _finisher];

  if (!v3)
  {
    v4 = [(DEDBugSession *)self config];
    uint64_t v5 = [v4 finishingMove];

    if (v5 == 1)
    {
      v6 = DEDSeedingFinisher;
LABEL_12:
      id v14 = [v6 alloc];
      v15 = [(DEDBugSession *)self config];
      objc_super v16 = (void *)[v14 initWithConfiguration:v15 session:self];
      [(DEDBugSession *)self set_finisher:v16];

      goto LABEL_13;
    }
    v8 = [(DEDBugSession *)self config];
    uint64_t v9 = [v8 finishingMove];

    if (v9 == 2)
    {
      v6 = DEDRadarFinisher;
      goto LABEL_12;
    }
    v10 = [(DEDBugSession *)self config];
    uint64_t v11 = [v10 finishingMove];

    if (v11 == 3)
    {
      v6 = DEDCloudKitFinisher;
      goto LABEL_12;
    }
    v12 = [(DEDBugSession *)self config];
    uint64_t v13 = [v12 finishingMove];

    if (v13 == 4)
    {
      v6 = DEDTestingFinisher;
      goto LABEL_12;
    }
  }
LABEL_13:
  v7 = [(DEDBugSession *)self _finisher];
LABEL_14:
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  v4 = [(DEDBugSession *)self identifier];
  [v23 encodeObject:v4 forKey:@"identifier"];

  uint64_t v5 = [(DEDBugSession *)self deviceIdentifier];
  [v23 encodeObject:v5 forKey:@"deviceIdentifier"];

  v6 = [(DEDBugSession *)self config];
  [v23 encodeObject:v6 forKey:@"config"];

  v7 = [(DEDBugSession *)self client];
  objc_msgSend(v23, "encodeInteger:forKey:", objc_msgSend(v7, "transportType"), @"clientTransportType");

  v8 = [(DEDBugSession *)self client];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(DEDBugSession *)self client];
    uint64_t v11 = [v10 clientAddress];
    [v23 encodeObject:v11 forKey:@"clientAddress"];
  }
  v12 = [(DEDBugSession *)self worker];
  objc_msgSend(v23, "encodeInteger:forKey:", objc_msgSend(v12, "transportType"), @"workerTransportType");

  uint64_t v13 = [(DEDBugSession *)self identifierManager];
  [v23 encodeObject:v13 forKey:@"identifierManager"];

  objc_msgSend(v23, "encodeBool:forKey:", -[DEDBugSession finisherDidCommit](self, "finisherDidCommit"), @"didCommit");
  id v14 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v14);
  v15 = [(DEDBugSession *)self pendingOperations];
  [v23 encodeObject:v15 forKey:@"operations"];

  objc_sync_exit(v14);
  objc_super v16 = [(DEDBugSession *)self _finisher];

  if (v16)
  {
    v17 = [(DEDBugSession *)self _finisher];
    [v23 encodeObject:v17 forKey:@"finisher"];
  }
  uint64_t v18 = [(DEDBugSession *)self _notifier];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(DEDBugSession *)self _notifier];
    int v21 = [v20 conformsToProtocol:&unk_26D1B0B00];

    if (v21)
    {
      v22 = [(DEDBugSession *)self _notifier];
      [v23 encodeObject:v22 forKey:@"notifier"];
    }
  }
}

- (DEDBugSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DEDBugSession;
  uint64_t v5 = [(DEDBugSession *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    v10 = +[DEDBugSessionConfiguration archivedClasses];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"config"];
    config = v5->_config;
    v5->_config = (DEDBugSessionConfiguration *)v11;

    v5->_priorClientTransportType = [v4 decodeIntegerForKey:@"clientTransportType"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAddress"];
    priorClientAddress = v5->_priorClientAddress;
    v5->_priorClientAddress = (NSString *)v13;

    v5->_priorWorkerTransportType = [v4 decodeIntegerForKey:@"workerTransportType"];
    v15 = [(id)objc_opt_class() archivedClasses];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"operations"];
    pendingOperations = v5->_pendingOperations;
    v5->_pendingOperations = (NSMutableDictionary *)v16;

    uint64_t v18 = [(id)objc_opt_class() archivedClasses];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"finisher"];
    finisher = v5->__finisher;
    v5->__finisher = (DEDFinisher *)v19;

    int v21 = +[DEDExtensionIdentifierManager archivedClasses];
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"identifierManager"];
    identifierManager = v5->_identifierManager;
    v5->_identifierManager = (DEDExtensionIdentifierManager *)v22;

    if (!v5->_identifierManager)
    {
      uint64_t v24 = objc_opt_new();
      v25 = v5->_identifierManager;
      v5->_identifierManager = (DEDExtensionIdentifierManager *)v24;
    }
    v26 = [(id)objc_opt_class() archivedClasses];
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"notifier"];
    notifier = v5->__notifier;
    v5->__notifier = (DEDNotifier *)v27;

    int v29 = [v4 containsValueForKey:@"didCommit"];
    if (v29) {
      LOBYTE(v29) = [v4 decodeBoolForKey:@"didCommit"];
    }
    v5->_finisherDidCommit = v29;
    [(DEDBugSession *)v5 _logOperationQueue];
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)DEDBugSession;
  id v4 = [(DEDBugSession *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ - identifier: [%@] - client: [%@] - worker: [%@]", v4, self->_identifier, self->_client, self->_worker];

  return (NSString *)v5;
}

- (id)prettyDescription
{
  v3 = NSString;
  id v4 = [(DEDBugSession *)self identifier];
  int64_t v5 = [(DEDBugSession *)self state];
  if ((unint64_t)(v5 + 1) > 9) {
    uint64_t v6 = "Unknown";
  }
  else {
    uint64_t v6 = off_26453A760[v5 + 1];
  }
  objc_super v7 = [v3 stringWithFormat:@"BugSession identifier: %@ state: %s", v4, v6];

  return v7;
}

- (id)shortDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DEDBugSession;
  id v4 = [(DEDBugSession *)&v8 description];
  int64_t v5 = [(DEDBugSession *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@: ID: %@", v4, v5];

  return v6;
}

+ (id)archivedClasses
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__DEDBugSession_archivedClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (archivedClasses_onceToken_0 != -1) {
    dispatch_once(&archivedClasses_onceToken_0, block);
  }
  id v2 = (void *)archivedClasses__classes;
  return v2;
}

void __32__DEDBugSession_archivedClasses__block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = +[DEDBugSessionConfiguration archivedClasses];
  [v18 unionSet:v6];

  objc_super v7 = +[DEDNotifierConfiguration archivedClasses];
  [v18 unionSet:v7];

  objc_super v8 = +[DEDBugSessionOperation archivedClasses];
  [v18 unionSet:v8];

  char v9 = +[DEDSeedingFinisher archivedClasses];
  [v18 unionSet:v9];

  v10 = +[DEDRadarFinisher archivedClasses];
  [v18 unionSet:v10];

  uint64_t v11 = +[DEDCloudKitFinisher archivedClasses];
  [v18 unionSet:v11];

  v12 = +[DEDTestingFinisher archivedClasses];
  [v18 unionSet:v12];

  uint64_t v13 = +[DEDExtensionIdentifierManager archivedClasses];
  [v18 unionSet:v13];

  id v14 = +[DEDUserNotificationNotifier archivedClasses];
  [v18 unionSet:v14];

  v15 = +[DEDFollowUpNotifier archivedClasses];
  [v18 unionSet:v15];

  uint64_t v16 = [MEMORY[0x263EFFA08] setWithSet:v18];
  v17 = (void *)archivedClasses__classes;
  archivedClasses__classes = v16;
}

- (id)configuration
{
  uint64_t v3 = [(DEDBugSession *)self config];

  if (v3)
  {
    uint64_t v4 = [(DEDBugSession *)self config];
    uint64_t v5 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v6 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession configuration]();
    }

    uint64_t v5 = 0;
  }
  return v5;
}

- (void)attachCompletionHandlerForOngoingOperation:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "attaching completion handler to ongoing operation", v13, 2u);
  }

  char v9 = (void *)[v6 copy];
  v10 = (void *)MEMORY[0x223C5FFB0](v9);
  uint64_t v11 = [(DEDBugSession *)self ongoingCompletionHandlers];
  v12 = [v7 identifier];

  [v11 setObject:v10 forKeyedSubscript:v12];
}

- (void)attachCompletionHandlerForDEDExtensionIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(DEDBugSession *)self identifierManager];
  char v9 = [v8 isKnownIdentifier:v6];

  if ((v9 & 1) == 0)
  {
    v10 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession attachCompletionHandlerForDEDExtensionIdentifier:handler:]((uint64_t)v6, self);
    }
  }
  uint64_t v11 = (void *)[v7 copy];
  v12 = (void *)MEMORY[0x223C5FFB0]();
  uint64_t v13 = [(DEDBugSession *)self ongoingCompletionHandlers];
  id v14 = [v6 stringValue];
  [v13 setObject:v12 forKeyedSubscript:v14];
}

- (id)knownExtensions
{
  uint64_t v3 = [(DEDBugSession *)self cachedExtensions];

  if (v3)
  {
    uint64_t v4 = [(DEDBugSession *)self cachedExtensions];
    uint64_t v5 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA78];
  }
  return v5;
}

- (void)resumePendingOperations
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "BS [%@] will resume %@", buf, 0x16u);
}

- (NSArray)allExtensionIdentifiers
{
  uint64_t v2 = [(DEDBugSession *)self identifierManager];
  uint64_t v3 = [v2 allIdentifiers];

  return (NSArray *)v3;
}

- (void)pingWithCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDBugSession pingWithCallback:]((uint64_t)v4, self);
  }

  [(DEDBugSession *)self setPingHandler:v4];
  worker = self->_worker;
  id v7 = [(DEDBugSession *)self identifier];
  [(DEDWorkerProtocol *)worker pingSession:v7];
}

- (void)listDiagnosticExtensionsWithCompletion:(id)a3
{
  uint64_t v11 = (void (**)(id, void *))a3;
  id v4 = [(DEDBugSession *)self cachedExtensions];

  if (v4)
  {
    uint64_t v5 = [(DEDBugSession *)self cachedExtensions];
    id v6 = [v5 allValues];
    v11[2](v11, v6);
  }
  else
  {
    if (v11)
    {
      id v7 = [(DEDBugSession *)self deListCompletions];
      objc_super v8 = (void *)[v11 copy];
      char v9 = (void *)MEMORY[0x223C5FFB0]();
      [v7 addObject:v9];
    }
    worker = self->_worker;
    uint64_t v5 = [(DEDBugSession *)self identifier];
    [(DEDWorkerProtocol *)worker listAvailableExtensionsForSession:v5];
  }
}

- (void)getStateWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DEDSessionStateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(DEDBugSession *)self identifier];
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_INFO, "Getting session state on [%{public}@]", buf, 0xCu);
  }
  if ([(DEDBugSession *)self hasCapability:@"session-state"])
  {
    [(DEDBugSession *)self setSessionStateCompletionBlock:v4];
    worker = self->_worker;
    id v8 = [(DEDBugSession *)self identifier];
    [(DEDWorkerProtocol *)worker getSessionStateWithSession:v8];
  }
  else
  {
    char v9 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession getStateWithCompletion:](self);
    }

    v10 = (void *)MEMORY[0x223C5FFB0](v4);
    [(DEDBugSession *)self setSessionStateCompletionBlock:0];
    uint64_t v11 = [(DEDBugSession *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__DEDBugSession_getStateWithCompletion___block_invoke;
    block[3] = &unk_26453A598;
    id v13 = v10;
    id v8 = v10;
    dispatch_async(v11, block);
  }
}

void __40__DEDBugSession_getStateWithCompletion___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithFormat:@"Device does not have capability %@", @"session-state", *MEMORY[0x263F08320]];
  v9[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = +[DEDConfiguration sharedInstance];
  id v6 = [v5 errorDomain];
  id v7 = [v4 errorWithDomain:v6 code:103 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addData:(id)a3 withFilename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DEDBugSession *)self hasCapability:@"enhanced-execution-v2"])
  {
    worker = self->_worker;
    char v9 = [(DEDBugSession *)self identifier];
    [(DEDWorkerProtocol *)worker addSessionData:v6 withFilename:v7 forSession:v9];
  }
  else
  {
    v10 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession addData:withFilename:](self);
    }
  }
}

- (void)_addSessionData:(id)a3 filename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DEDBugSession *)self finisher];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(DEDBugSession *)self finisher];
    [v10 writeData:v6 filename:v7];
  }
  else
  {
    v10 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession _addSessionData:filename:]();
    }
  }
}

- (void)getSessionStatusWithCompletion:(id)a3
{
  [(DEDBugSession *)self setStatusCompletionBlock:a3];
  worker = self->_worker;
  id v5 = [(DEDBugSession *)self identifier];
  [(DEDWorkerProtocol *)worker getSessionStatusWithSession:v5];
}

- (void)synchronizeSessionStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(DEDBugSession *)self hasCapability:@"enhanced-execution"])
  {
    [(DEDBugSession *)self setSyncCompletionBlock:v4];
    worker = self->_worker;
    id v6 = [(DEDBugSession *)self identifier];
    [(DEDWorkerProtocol *)worker syncSessionStatusWithSession:v6];
  }
  else
  {
    id v6 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession synchronizeSessionStatusWithCompletion:]();
    }
  }
}

- (void)startDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    uint64_t v24 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:]();
    }
    goto LABEL_15;
  }
  if (![(DEDBugSession *)self hasCapability:@"enhanced-execution"])
  {
    uint64_t v24 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:]();
    }
LABEL_15:

    goto LABEL_22;
  }
  id v14 = [(DEDBugSession *)self filePromises];
  v15 = [v10 stringValue];
  [v14 addObject:v15];

  if (v13)
  {
    uint64_t v16 = [v10 stringValue];
    [(DEDBugSession *)self storeCollectionCompletion:v13 forIdentifier:v16];
  }
  if (![(DEDBugSession *)self isTarget]) {
    goto LABEL_20;
  }
  v17 = [MEMORY[0x263EFF910] date];
  id v18 = [v12 earlierDate:v17];

  if (v18 != v12)
  {
    uint64_t v19 = [(DEDBugSession *)self identifier];
    v20 = +[DEDDeferredExtensionInfo activityStringForBugSessionIdentifier:v19 dedIdentifier:v10];

    int v21 = +[DEDDeferredExtensionInfo allInfo];
    uint64_t v22 = [v21 objectForKey:v20];

    [(DEDBugSession *)self willPerformOperationWithID:v20 type:2 options:v11];
    [(DEDBugSession *)self save];
    if (v22)
    {
      id v23 = [(DEDBugSession *)self log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_21FE04000, v23, OS_LOG_TYPE_DEFAULT, "Rescheduling an existing collect operation.", (uint8_t *)&v27, 2u);
      }

      [v22 schedule];
      goto LABEL_21;
    }

LABEL_20:
    v20 = [(DEDBugSession *)self worker];
    uint64_t v22 = [v10 stringValue];
    v26 = [(DEDBugSession *)self identifier];
    [v20 startDiagnosticWithIdentifier:v22 parameters:v11 deferRunUntil:v12 session:v26];

LABEL_21:
    goto LABEL_22;
  }
  v25 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138543362;
    id v28 = v12;
    _os_log_impl(&dword_21FE04000, v25, OS_LOG_TYPE_DEFAULT, "Deferred execution was scheduled in past (%{public}@), running immediately.", (uint8_t *)&v27, 0xCu);
  }

  [(DEDBugSession *)self finallyStartDiagnosticWithIdentifier:v10 parameters:v11 completion:v13];
LABEL_22:
}

- (void)startDiagnosticExtension:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  char v9 = [a3 identifier];
  id v10 = [(DEDBugSession *)self startDiagnosticExtensionWithIdentifier:v9 parameters:v11 completion:v8];
}

- (id)startDiagnosticExtensionWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(DEDBugSession *)self hasCapability:@"enhanced-execution"])
  {
    id v14 = [MEMORY[0x263EFF910] date];
    id v15 = [v12 earlierDate:v14];

    if (v15 == v12)
    {
      uint64_t v19 = [(DEDBugSession *)self log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v21 = 0;
        _os_log_impl(&dword_21FE04000, v19, OS_LOG_TYPE_DEFAULT, "Deferred execution was scheduled in past, running immediately.", v21, 2u);
      }

      v17 = [(DEDBugSession *)self startDiagnosticExtensionWithIdentifier:v10 parameters:v11 completion:v13];
    }
    else
    {
      uint64_t v16 = [(DEDBugSession *)self identifierManager];
      v17 = [v16 identifierForExtensionIdentifier:v10];

      [(DEDBugSession *)self startDiagnosticExtensionWithDEDIdentifier:v17 parameters:v11 deferRunUntil:v12 completion:v13];
    }
  }
  else
  {
    id v18 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:]();
    }

    v17 = 0;
  }

  return v17;
}

- (id)startDiagnosticExtensionWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DEDBugSession *)self identifierManager];
  id v12 = [v11 identifierForExtensionIdentifier:v10];

  [(DEDBugSession *)self startDiagnosticExtensionWithDEDIdentifier:v12 parameters:v9 completion:v8];
  return v12;
}

- (void)startDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v13 = 0;
  [(DEDBugSession *)self _prepareForStartDiagnosticExtensionWithDEDIdentifier:v8 parameters:v9 newCollectRemovedPendingKill:&v13 completion:a5];
  if (!v13)
  {
    worker = self->_worker;
    id v11 = [v8 stringValue];
    id v12 = [(DEDBugSession *)self identifier];
    [(DEDWorkerProtocol *)worker startDiagnosticWithIdentifier:v11 parameters:v9 session:v12];
  }
}

- (void)_prepareForStartDiagnosticExtensionWithDEDIdentifier:(id)a3 parameters:(id)a4 newCollectRemovedPendingKill:(BOOL *)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 invocationNumber] < 1
    || [(DEDBugSession *)self hasCapability:@"enhanced-execution"])
  {
    char v13 = [(DEDBugSession *)self filePromises];
    id v14 = [v10 stringValue];
    [v13 addObject:v14];

    if (v12)
    {
      id v15 = [v10 stringValue];
      [(DEDBugSession *)self storeCollectionCompletion:v12 forIdentifier:v15];
    }
    if ([(DEDBugSession *)self isTarget])
    {
      if ([(DEDBugSession *)self hasCapability:@"enhanced-execution"])
      {
        LODWORD(v16) = 0;
      }
      else
      {
        id v18 = [v10 extensionIdentifier];
        v41 = +[DEDBugSessionOperation hashingKeyWithId:v18 type:0];

        uint64_t v19 = [v10 extensionIdentifier];
        v40 = +[DEDBugSessionOperation hashingKeyWithId:v19 type:1];

        v20 = [(DEDBugSession *)self pendingOperations];
        objc_sync_enter(v20);
        int v21 = [(DEDBugSession *)self pendingOperations];
        uint64_t v22 = [v21 objectForKeyedSubscript:v41];
        if (v22)
        {
          id v23 = [(DEDBugSession *)self pendingOperations];
          uint64_t v16 = [v23 objectForKeyedSubscript:v40];

          if (v16)
          {
            uint64_t v24 = [(DEDBugSession *)self log];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = [v10 stringValue];
              *(_DWORD *)buf = 138543362;
              v44 = v25;
              _os_log_impl(&dword_21FE04000, v24, OS_LOG_TYPE_DEFAULT, "Found matching kill operation for new requested DE [%{public}@], will let it finish", buf, 0xCu);
            }
            v26 = [(DEDBugSession *)self log];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              int v27 = [(DEDBugSession *)self pendingOperations];
              id v28 = [v27 objectForKeyedSubscript:v41];
              *(_DWORD *)buf = 138412290;
              v44 = v28;
              _os_log_impl(&dword_21FE04000, v26, OS_LOG_TYPE_INFO, "Removing matching kill operation: %@", buf, 0xCu);
            }
            uint64_t v16 = [(DEDBugSession *)self pendingOperations];
            [v16 removeObjectForKey:v41];

            LODWORD(v16) = 1;
          }
        }
        else
        {

          LODWORD(v16) = 0;
        }
        objc_sync_exit(v20);
      }
      if (a5) {
        *a5 = (char)v16;
      }
      if (v16)
      {
        uint64_t v29 = [(DEDBugSession *)self log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = [(DEDBugSession *)self identifier];
          *(_DWORD *)buf = 138543362;
          v44 = v30;
          _os_log_impl(&dword_21FE04000, v29, OS_LOG_TYPE_DEFAULT, "Start collection command found matching cancel on DE: [%{public}@]", buf, 0xCu);
        }
      }
      else
      {
        objc_super v31 = [(DEDBugSession *)self client];
        if (objc_opt_respondsToSelector())
        {
          v32 = [(DEDBugSession *)self client];
          uint64_t v33 = [v32 transportType];
        }
        else
        {
          uint64_t v33 = 0;
        }

        if (+[DEDCollectionNotification shouldFireNotificationForTransport:v33])
        {
          v34 = _os_activity_create(&dword_21FE04000, "Collect Notify", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __121__DEDBugSession__prepareForStartDiagnosticExtensionWithDEDIdentifier_parameters_newCollectRemovedPendingKill_completion___block_invoke;
          block[3] = &unk_26453A5C0;
          void block[4] = self;
          os_activity_apply(v34, block);
        }
        v35 = [(DEDBugSession *)self finisher];
        char v36 = objc_opt_respondsToSelector();

        if (v36)
        {
          v37 = [(DEDBugSession *)self finisher];
          v38 = [v10 stringValue];
          [v37 didStartCollectingDiagnosticExtensionWithIdentifier:v38];
        }
        v39 = [v10 stringValue];
        [(DEDBugSession *)self willPerformOperationWithID:v39 type:1 options:v11];

        [(DEDBugSession *)self save];
      }
    }
  }
  else
  {
    v17 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v17, OS_LOG_TYPE_DEFAULT, "Running the same extension multiple times requires enhanced execution.", buf, 2u);
    }
  }
}

void __121__DEDBugSession__prepareForStartDiagnosticExtensionWithDEDIdentifier_parameters_newCollectRemovedPendingKill_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "will fire collection notification for bug session %{public}@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) config];
  +[DEDCollectionNotification fireNotificationWithFinishingMove:](DEDCollectionNotification, "fireNotificationWithFinishingMove:", [v4 finishingMove]);
}

- (void)finallyStartDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(DEDBugSession *)self isTarget])
  {
    id v11 = [(DEDBugSession *)self identifier];
    id v12 = +[DEDDeferredExtensionInfo activityStringForBugSessionIdentifier:v11 dedIdentifier:v8];

    char v13 = +[DEDDeferredExtensionInfo allInfo];
    id v14 = [v13 objectForKey:v12];

    [v14 unschedule];
    [(DEDBugSession *)self didFinishOperation:2 withIdentifier:v12];
    [(DEDBugSession *)self save];
    [(DEDBugSession *)self _prepareForStartDiagnosticExtensionWithDEDIdentifier:v8 parameters:v9 newCollectRemovedPendingKill:0 completion:v10];
    id v15 = +[DEDDaemon sharedInstance];
    uint64_t v16 = [v8 stringValue];
    v17 = [(DEDBugSession *)self identifier];
    [v15 finallyStartDiagnosticWithIdentifier:v16 parameters:v9 session:v17];
  }
  else
  {
    id v12 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(DEDBugSession *)self identifier];
      int v19 = 136446466;
      v20 = "-[DEDBugSession finallyStartDiagnosticWithIdentifier:parameters:completion:]";
      __int16 v21 = 2114;
      uint64_t v22 = v18;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}s] called on non target instance of [%{public}@]", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)scheduleDiagnosticCollectionForClassBAccessWithIdentifier:(id)a3 parameters:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "Will reschedule attachment collection for Class B availability for extension [%{public}@]", (uint8_t *)&v16, 0xCu);
  }

  id v9 = [[DEDExtensionIdentifier alloc] initWithString:v6];
  id v10 = [(DEDBugSession *)self identifier];
  id v11 = +[DEDDeferredExtensionInfo activityStringForBugSessionIdentifier:v10 dedIdentifier:v9];

  [(DEDBugSession *)self willPerformOperationWithID:v11 type:2 options:v7];
  id v12 = [DEDDeferredExtensionInfo alloc];
  char v13 = [(DEDBugSession *)self identifier];
  id v14 = [MEMORY[0x263EFF910] distantFuture];
  id v15 = [(DEDDeferredExtensionInfo *)v12 initWithBugSessionIdentifier:v13 dedIdentifier:v9 runOnDate:v14 withGracePeriod:0.0];

  [(DEDDeferredExtensionInfo *)v15 setRequiresClassBDataAccess:1];
  [(DEDDeferredExtensionInfo *)v15 setParameters:v7];

  [(DEDDeferredExtensionInfo *)v15 schedule];
}

- (void)removeAttachment:(id)a3
{
  id v4 = a3;
  int v5 = [v4 extensionID];

  if (v5)
  {
    id v6 = [v4 rootURL];
    id v7 = [v6 lastPathComponent];
    [(DEDBugSession *)self terminateExtension:v7 withInfo:0];
  }
  else
  {
    id v8 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession removeAttachment:]();
    }
  }
}

- (void)cancelDiagnosticExtension:(id)a3
{
  id v4 = a3;
  int v5 = [v4 identifier];

  if (v5)
  {
    id v6 = [v4 identifier];
    [(DEDBugSession *)self cancelDiagnosticExtensionWithIdentifier:v6];
  }
  else
  {
    id v7 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession cancelDiagnosticExtension:]();
    }
  }
}

- (void)cancelDiagnosticExtensionWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(DEDBugSession *)self identifierManager];
  id v6 = [v5 knownIdentifiersForExtensionIdentifier:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v13 = objc_msgSend(v12, "stringValue", (void)v15);
        [(DEDBugSession *)self terminateExtension:v13 withInfo:0];

        id v14 = [(DEDBugSession *)self identifierManager];
        [v14 revokeIdentifier:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(DEDBugSession *)self save];
}

- (void)cancelDiagnosticExtensionWithIdentifier:(id)a3 invocationNumber:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 && ![(DEDBugSession *)self hasCapability:@"enhanced-execution"])
  {
    uint64_t v9 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling a non-zero invocation requires enhanced execution.", buf, 2u);
    }
  }
  else
  {
    id v7 = [(DEDBugSession *)self identifierManager];
    uint64_t v8 = [v7 knownIdentifiersForExtensionIdentifier:v6];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v14, "invocationNumber", (void)v15) == a4) {
            [(DEDBugSession *)self cancelDiagnosticExtensionWithDEDExtensionIdentifier:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }

    [(DEDBugSession *)self save];
  }
}

- (void)cancelDiagnosticExtensionWithDEDExtensionIdentifier:(id)a3
{
  id v4 = a3;
  if ([(DEDBugSession *)self hasCapability:@"enhanced-execution"])
  {
    int v5 = [(DEDBugSession *)self identifierManager];
    char v6 = [v5 isKnownIdentifier:v4];

    if (v6)
    {
      id v7 = [v4 stringValue];
      [(DEDBugSession *)self terminateExtension:v7 withInfo:0];

      uint64_t v8 = [(DEDBugSession *)self identifierManager];
      [v8 revokeIdentifier:v4];

      [(DEDBugSession *)self save];
    }
    else
    {
      uint64_t v10 = [(DEDBugSession *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[DEDBugSession cancelDiagnosticExtensionWithDEDExtensionIdentifier:]((uint64_t)v4, self);
      }
    }
  }
  else
  {
    uint64_t v9 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession cancelDiagnosticExtensionWithDEDExtensionIdentifier:]();
    }
  }
}

- (void)_terminateExtensionWithIdentifier:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v8 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession _terminateExtensionWithIdentifier:info:]();
    }
  }
  worker = self->_worker;
  uint64_t v10 = [(DEDBugSession *)self identifier];
  [(DEDWorkerProtocol *)worker terminateExtension:v6 info:v7 session:v10];
}

- (void)commit
{
  if ([(DEDBugSession *)self isTarget])
  {
    [(DEDBugSession *)self clearNotification];
    uint64_t v3 = [(DEDBugSession *)self pendingOperations];
    objc_sync_enter(v3);
    id v4 = [(DEDBugSession *)self pendingOperations];
    int v5 = +[DEDBugSessionOperation hashingKeyWithId:@"finishOperation" type:1000];
    id v6 = [v4 objectForKey:v5];

    objc_sync_exit(v3);
    if (v6)
    {
      id v7 = [(DEDBugSession *)self log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "received commit more than once", buf, 2u);
      }

      return;
    }
    [(DEDBugSession *)self willPerformOperationWithID:@"finishOperation" type:1000 options:0];
    [(DEDBugSession *)self save];
  }
  worker = self->_worker;
  id v9 = [(DEDBugSession *)self identifier];
  [(DEDWorkerProtocol *)worker commitSession:v9];
}

- (void)cancel
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ([(DEDBugSession *)self isTarget])
  {
    [(DEDBugSession *)self clearNotification];
    [(DEDBugSession *)self willPerformOperationWithID:@"cancelOperation" type:2000 options:MEMORY[0x263EFFA78]];
    [(DEDBugSession *)self save];
    uint64_t v3 = [(DEDBugSession *)self ongoingExtensionCollectionOperations];
    id v4 = [(DEDBugSession *)self scheduledDeferredExtensionCollectionOperations];
    if ([v3 count] || objc_msgSend(v4, "count"))
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v27;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v27 != v8) {
              objc_enumerationMutation(v5);
            }
            [(DEDBugSession *)self cancelDiagnosticExtensionWithIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * v9++)];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v7);
      }

      uint64_t v10 = +[DEDDeferredExtensionInfo allInfo];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v4;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = objc_msgSend(v10, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * v15), (void)v22);
            long long v17 = v16;
            if (v16)
            {
              long long v18 = [v16 dedIdentifier];
              [(DEDBugSession *)self cancelDiagnosticExtensionWithDEDExtensionIdentifier:v18];

              [v17 unschedule];
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v13);
      }
    }
    else
    {
      [(DEDBugSession *)self _cancel];
    }
  }
  else
  {
    int v19 = [(DEDBugSession *)self worker];
    uint64_t v20 = [(DEDBugSession *)self identifier];
    [v19 cancelSession:v20];

    [(DEDBugSession *)self cleanup];
  }
  uint64_t v21 = [(DEDBugSession *)self identifierManager];
  [v21 reset];
}

- (void)adoptFiles:(id)a3 withCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(DEDBugSession *)self adoptFilesCompletions];
    uint64_t v9 = (void *)MEMORY[0x223C5FFB0](v7);
    [v8 insertObject:v9 atIndex:0];
  }
  uint64_t v10 = objc_alloc_init(DEDAttachmentHandler);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = -[DEDAttachmentHandler identifierForAdoptingFile:](v10, "identifierForAdoptingFile:", *(void *)(*((void *)&v20 + 1) + 8 * v15), (void)v20);
        if (v16)
        {
          long long v17 = [(DEDBugSession *)self filePromises];
          [v17 addObject:v16];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  worker = self->_worker;
  int v19 = [(DEDBugSession *)self identifier];
  [(DEDWorkerProtocol *)worker adoptFiles:v11 forSession:v19];
}

- (void)scheduleNotification
{
  uint64_t v1 = [a1 deviceIdentifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "Target device [%{public}@] does not have Remote Notification capability. Cannot schedule notification", v4, v5, v6, v7, v8);
}

- (void)clearNotification
{
  uint64_t v1 = [a1 deviceIdentifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "Target device [%{public}@] does not have Remote Notification capability. Cannot clear notification", v4, v5, v6, v7, v8);
}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(DEDBugSession *)self hasCapability:@"enhanced-execution-v2"])
  {
    if (v10) {
      [(DEDBugSession *)self setDeTextDataLoadCompletion:v10];
    }
    worker = self->_worker;
    uint64_t v12 = [(DEDBugSession *)self identifier];
    [(DEDWorkerProtocol *)worker loadTextDataForExtensions:v8 localization:v9 sessionID:v12];
  }
  else
  {
    uint64_t v13 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession loadTextDataForExtensions:localization:completion:](self);
    }
  }
}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DEDBugSession *)self deTextDataLoadCompletion];

  if (v8)
  {
    id v9 = [(DEDBugSession *)self deTextDataLoadCompletion];
    id v10 = (void *)[v9 copy];

    [(DEDBugSession *)self setDeTextDataLoadCompletion:0];
    id v11 = [(DEDBugSession *)self callbackQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__DEDBugSession_didLoadTextDataForExtensions_localization___block_invoke;
    v15[3] = &unk_26453A5E8;
    id v17 = v10;
    id v16 = v6;
    id v12 = v10;
    dispatch_async(v11, v15);
  }
  else
  {
    client = self->_client;
    uint64_t v14 = [(DEDBugSession *)self identifier];
    [(DEDClientProtocol *)client didLoadTextDataForExtensions:v6 localization:v7 session:v14];
  }
}

uint64_t __59__DEDBugSession_didLoadTextDataForExtensions_localization___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)pong
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void __21__DEDBugSession_pong__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) identifier];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)supportsDiagnostics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDBugSession supportsDiagnostics:](self);
  }

  uint64_t v6 = [(DEDBugSession *)self deListCompletions];
  uint64_t v7 = [v6 lastObject];

  if (v7)
  {
    id v8 = [(DEDBugSession *)self deListCompletions];
    [v8 removeLastObject];

    id v9 = [(DEDBugSession *)self hashExtensions:v4];
    [(DEDBugSession *)self setCachedExtensions:v9];

    id v10 = [(DEDBugSession *)self callbackQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__DEDBugSession_supportsDiagnostics___block_invoke;
    v13[3] = &unk_26453A5E8;
    id v15 = v7;
    id v14 = v4;
    dispatch_async(v10, v13);

    id v11 = v15;
  }
  else
  {
    client = self->_client;
    id v11 = [(DEDBugSession *)self identifier];
    [(DEDClientProtocol *)client deviceSupportsDiagnosticExtensions:v4 session:v11];
  }
}

uint64_t __37__DEDBugSession_supportsDiagnostics___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)didAdoptFilesWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDBugSession *)self adoptFilesCompletions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(DEDBugSession *)self adoptFilesCompletions];
    id v8 = [v7 lastObject];

    id v9 = [(DEDBugSession *)self adoptFilesCompletions];
    [v9 removeLastObject];

    id v10 = [(DEDBugSession *)self callbackQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__DEDBugSession_didAdoptFilesWithError___block_invoke;
    v14[3] = &unk_26453A5E8;
    id v16 = v8;
    id v15 = v4;
    id v11 = v8;
    dispatch_async(v10, v14);
  }
  else
  {
    client = self->_client;
    uint64_t v13 = [(DEDBugSession *)self identifier];
    [(DEDClientProtocol *)client didAdoptFilesWithError:v4 forSession:v13];
  }
}

uint64_t __40__DEDBugSession_didAdoptFilesWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  client = self->_client;
  id v8 = [(DEDBugSession *)self identifier];
  [(DEDClientProtocol *)client uploadProgress:a3 total:a4 sessionID:v8];

  id v9 = [(DEDBugSession *)self uploadDelegate];

  if (v9)
  {
    id v10 = [(DEDBugSession *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__DEDBugSession_uploadProgress_total___block_invoke;
    block[3] = &unk_26453A610;
    void block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    dispatch_async(v10, block);
LABEL_3:

    goto LABEL_4;
  }
  if (self->_client && [(DEDBugSession *)self instanceType] == 1)
  {
    id v10 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(DEDBugSession *)self identifier];
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "uploadDelegate is nil in session [%{public}@]. Cannot send update", buf, 0xCu);
    }
    goto LABEL_3;
  }
LABEL_4:
  BOOL v11 = [(DEDBugSession *)self isTarget];
  if (a3 == a4 && !v11) {
    [(DEDBugSession *)self cleanupFinishedUploads:1];
  }
}

void __38__DEDBugSession_uploadProgress_total___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uploadDelegate];
  [v2 uploadProgress:*(void *)(a1 + 40) total:*(void *)(a1 + 48) session:*(void *)(a1 + 32)];
}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  client = self->_client;
  id v8 = [(DEDBugSession *)self identifier];
  [(DEDClientProtocol *)client compressionProgress:a3 total:a4 sessionID:v8];

  uint64_t v9 = [(DEDBugSession *)self uploadDelegate];
  if (v9
    && (id v10 = (void *)v9,
        [(DEDBugSession *)self uploadDelegate],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    uint64_t v13 = [(DEDBugSession *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__DEDBugSession_compressionProgress_total___block_invoke;
    block[3] = &unk_26453A610;
    void block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    dispatch_async(v13, block);
  }
  else if (self->_client && [(DEDBugSession *)self instanceType] == 1)
  {
    id v14 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(DEDBugSession *)self identifier];
      *(_DWORD *)buf = 138543362;
      long long v18 = v15;
      _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_DEFAULT, "uploadDelegate is nil or doesn't respond to compressionProgress in session [%{public}@]. Cannot send update", buf, 0xCu);
    }
  }
}

void __43__DEDBugSession_compressionProgress_total___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uploadDelegate];
  [v2 compressionProgress:*(void *)(a1 + 40) total:*(void *)(a1 + 48) session:*(void *)(a1 + 32)];
}

- (void)didCommit
{
  client = self->_client;
  id v4 = [(DEDBugSession *)self identifier];
  [(DEDClientProtocol *)client didCommitSession:v4];

  [(DEDBugSession *)self setFinisherDidCommit:1];
}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_client)
  {
    id v8 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "_finishedDiagnosticWithIdentifier without client", buf, 2u);
    }
  }
  [v7 setFromBugSession:self];
  [(DEDBugSession *)self didFinishOperation:1 withIdentifier:v6];
  if ([(DEDBugSession *)self shouldCollectDiagnosticWithId:v6])
  {
    uint64_t v9 = [(DEDBugSession *)self ongoingCompletionHandlers];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];

    BOOL v11 = [(DEDBugSession *)self ongoingCompletionHandlers];
    [v11 removeObjectForKey:v6];

    uint64_t v12 = [(DEDBugSession *)self nextCompletionBlockForIdentifier:v6];
    uint64_t v13 = [(DEDBugSession *)self finisher];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = [(DEDBugSession *)self finisher];
      [v15 didCollectAttachmentGroup:v7];
    }
    if (v12 | v10)
    {
      uint64_t v16 = [(DEDBugSession *)self callbackQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__DEDBugSession_finishedDiagnosticWithIdentifier_result___block_invoke;
      block[3] = &unk_26453A638;
      id v28 = (id)v12;
      id v27 = v7;
      id v29 = (id)v10;
      dispatch_async(v16, block);

      id v17 = v28;
    }
    else
    {
      client = self->_client;
      id v17 = [(DEDBugSession *)self identifier];
      [(DEDClientProtocol *)client finishedDiagnosticWithIdentifier:v6 result:v7 session:v17];
    }
  }
  else
  {
    long long v18 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v18, OS_LOG_TYPE_DEFAULT, "DE has finished but should be aborted, will delete all files", buf, 2u);
    }

    [(DEDBugSession *)self _terminateExtensionWithIdentifier:v6 info:0];
  }
  if ([(DEDBugSession *)self isTarget])
  {
    if ([(DEDBugSession *)self readyToCancel])
    {
      [(DEDBugSession *)self _cancel];
    }
    else
    {
      if ([(DEDBugSession *)self readyToNotify])
      {
        worker = self->_worker;
        long long v21 = [(DEDBugSession *)self identifier];
        [(DEDWorkerProtocol *)worker scheduleNotificationForSession:v21];
      }
      else
      {
        if (![(DEDBugSession *)self readyToFinish]) {
          goto LABEL_24;
        }
        long long v22 = self->_worker;
        long long v21 = [(DEDBugSession *)self identifier];
        [(DEDWorkerProtocol *)v22 commitSession:v21];
      }

      long long v23 = [(DEDBugSession *)self finisher];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        uint64_t v25 = [(DEDBugSession *)self finisher];
        [v25 didFinishAllCollections];
      }
    }
  }
LABEL_24:
}

uint64_t __57__DEDBugSession_finishedDiagnosticWithIdentifier_result___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t result = a1[6];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)didGetState:(int64_t)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = [(DEDBugSession *)self sessionStateCompletionBlock];

  if (v7)
  {
    id v8 = [(DEDBugSession *)self sessionStateCompletionBlock];
    uint64_t v9 = (void *)[v8 copy];

    [(DEDBugSession *)self setSessionStateCompletionBlock:0];
    uint64_t v10 = [(DEDBugSession *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__DEDBugSession_didGetState_info___block_invoke;
    block[3] = &unk_26453A660;
    id v16 = v9;
    int64_t v17 = a3;
    id v15 = v6;
    id v11 = v9;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v12 = [(DEDBugSession *)self client];
    uint64_t v13 = [(DEDBugSession *)self identifier];
    [v12 didGetState:a3 info:v6 sessionID:v13];
  }
}

uint64_t __34__DEDBugSession_didGetState_info___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4], 0);
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4
{
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 identifiers:(id)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DEDBugSession hasCollected:isCollecting:identifiers:](v8);
  }
  v43 = v10;

  uint64_t v12 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[DEDBugSession hasCollected:isCollecting:identifiers:](v9);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v19 = [v18 extensionID];

        if (v19)
        {
          long long v20 = [(DEDBugSession *)self filePromises];
          long long v21 = [v18 rootURL];
          long long v22 = [v21 lastPathComponent];
          [v20 addObject:v22];
        }
        else
        {
          long long v20 = [(DEDBugSession *)self log];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[DEDBugSession hasCollected:isCollecting:identifiers:](&buf, v59, v20);
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v15);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v55 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        id v29 = [(DEDBugSession *)self filePromises];
        v30 = [v28 identifier];
        [v29 addObject:v30];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v25);
  }

  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke;
  v53[3] = &unk_26453A688;
  v53[4] = self;
  [v13 enumerateObjectsUsingBlock:v53];
  if (v43)
  {
    objc_super v31 = [[DEDExtensionIdentifierManager alloc] initWithExtensionIdentifiers:v43];
    [(DEDBugSession *)self setIdentifierManager:v31];
  }
  uint64_t v32 = [(DEDBugSession *)self statusCompletionBlock];
  if (v32)
  {
  }
  else
  {
    uint64_t v33 = [(DEDBugSession *)self syncCompletionBlock];

    if (!v33)
    {
      client = self->_client;
      id v41 = [(DEDBugSession *)self identifier];
      if (v43) {
        [(DEDClientProtocol *)client hasCollected:v13 isCollecting:v23 withIdentifiers:v43 inSession:v41];
      }
      else {
        [(DEDClientProtocol *)client hasCollected:v13 isCollecting:v23 inSession:v41];
      }
      goto LABEL_32;
    }
  }
  v34 = [(DEDBugSession *)self statusCompletionBlock];

  if (v34)
  {
    v35 = [(DEDBugSession *)self statusCompletionBlock];
    [(DEDBugSession *)self setStatusCompletionBlock:0];
    char v36 = [(DEDBugSession *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_2;
    block[3] = &unk_26453A6B0;
    id v52 = v35;
    id v50 = v13;
    id v51 = v23;
    id v37 = v35;
    dispatch_async(v36, block);
  }
  v38 = [(DEDBugSession *)self syncCompletionBlock];

  if (v38)
  {
    v39 = [(DEDBugSession *)self syncCompletionBlock];
    [(DEDBugSession *)self setSyncCompletionBlock:0];
    v40 = [(DEDBugSession *)self callbackQueue];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_3;
    v44[3] = &unk_26453A6D8;
    id v48 = v39;
    id v45 = v13;
    id v46 = v23;
    id v47 = v43;
    id v41 = v39;
    dispatch_async(v40, v44);

LABEL_32:
  }
}

uint64_t __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFromBugSession:*(void *)(a1 + 32)];
}

uint64_t __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __55__DEDBugSession_hasCollected_isCollecting_identifiers___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)terminateExtension:(id)a3 withInfo:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v25 = a4;
  id v7 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138543362;
    id v35 = v6;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Will terminate extension [%{public}@]", buf, 0xCu);
  }

  id v8 = [[DEDExtensionIdentifier alloc] initWithString:v6];
  id v9 = +[DEDDeferredExtensionInfo allInfo];
  id v10 = [v9 allValues];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __45__DEDBugSession_terminateExtension_withInfo___block_invoke;
  v30[3] = &unk_26453A700;
  uint64_t v24 = v8;
  objc_super v31 = v24;
  uint64_t v32 = self;
  id v11 = objc_msgSend(v10, "ded_selectItemsPassingTest:", v30);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        int64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v17 unschedule];
        long long v18 = [(DEDBugSession *)self scheduledDeferredExtensionCollectionOperations];
        uint64_t v19 = [v17 activityString];
        int v20 = [v18 containsObject:v19];

        if (v20)
        {
          long long v21 = [v17 activityString];
          [(DEDBugSession *)self didFinishOperation:2 withIdentifier:v21];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v14);
  }

  long long v22 = [(DEDBugSession *)self identifierManager];
  [v22 revokeIdentifier:v24];

  id v23 = [(DEDBugSession *)self filePromises];
  [v23 removeObject:v6];

  [(DEDBugSession *)self willPerformOperationWithID:v6 type:0 options:v25];
  [(DEDBugSession *)self save];
  [(DEDBugSession *)self _terminateExtensionWithIdentifier:v6 info:v25];
}

uint64_t __45__DEDBugSession_terminateExtension_withInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dedIdentifier];
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [v3 bugSessionIdentifier];
    id v6 = [*(id *)(a1 + 40) identifier];
    uint64_t v7 = [v5 isEqualToString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)didCancel
{
  client = self->_client;
  id v4 = [(DEDBugSession *)self identifier];
  [(DEDClientProtocol *)client didCancelSession:v4];

  if ([(DEDBugSession *)self isTarget])
  {
    [(DEDBugSession *)self didFinishOperation:2000 withIdentifier:@"cancelOperation"];
  }
}

- (OS_dispatch_queue)diskAccessQueue
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(DEDBugSession *)v2 _diskAccessQueue];

  if (!v3)
  {
    id v4 = NSString;
    uint64_t v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v5 UUIDString];
    uint64_t v7 = [v4 stringWithFormat:@"com.apple.ded.disk-access-queue-%@", v6];

    id v8 = [(DEDBugSession *)v2 log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(DEDBugSession *)v2 identifier];
      *(_DWORD *)uint8_t buf = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      int64_t v17 = v9;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Creating diskAccessQueue [%{public}@] for session [%{public}@]", buf, 0x16u);
    }
    id v10 = v7;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    [(DEDBugSession *)v2 set_diskAccessQueue:v11];
  }
  objc_sync_exit(v2);

  id v12 = [(DEDBugSession *)v2 _diskAccessQueue];
  return (OS_dispatch_queue *)v12;
}

- (void)_cancel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DEDBugSession *)self identifier];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "will cancel session [%{public}@]", (uint8_t *)&v5, 0xCu);
  }
  [(DEDBugSession *)self cleanup];
  [(DEDBugSession *)self didCancel];
}

- (void)setConfig:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DEDBugSession *)self identifier];
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] setConfig", (uint8_t *)&v9, 0xCu);
  }
  if ([(DEDBugSession *)self hasCapability:@"mutable-bug-session"])
  {
    if ([v4 finishingMove])
    {
      [(DEDBugSession *)self set_finisher:0];
      [(DEDBugSession *)self set_notifier:0];
      uint64_t v7 = (DEDBugSessionConfiguration *)v4;
      p_super = &self->_config->super;
      self->_config = v7;
    }
    else
    {
      p_super = [(DEDBugSession *)self log];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21FE04000, p_super, OS_LOG_TYPE_INFO, "BugSession configuration has unset Finishing Move. Will not reset finisher", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    p_super = [(DEDBugSession *)self log];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession setConfig:](self);
    }
  }
}

- (DEDBugSessionConfiguration)config
{
  return self->_config;
}

- (void)didStart
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DEDBugSession *)self identifier];
    int v12 = 138543362;
    uint64_t v13 = v4;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] did start", (uint8_t *)&v12, 0xCu);
  }
  if ([(DEDBugSession *)self isTarget])
  {
    int v5 = [(DEDBugSession *)self pendingOperations];
    objc_sync_enter(v5);
    id v6 = +[DEDBugSessionOperation hashingKeyWithId:@"cancelOperation" type:2000];
    uint64_t v7 = [(DEDBugSession *)self pendingOperations];
    id v8 = [v7 objectForKeyedSubscript:v6];

    if (v8)
    {
      int v9 = [(DEDBugSession *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(DEDBugSession *)self identifier];
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "found cancel operation for restarted session [%{public}@], will remove", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v11 = [(DEDBugSession *)self pendingOperations];
      [v11 removeObjectForKey:v6];
    }
    objc_sync_exit(v5);
  }
}

- (void)cleanup
{
}

- (void)cleanupFinishedUploads:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v54 = *MEMORY[0x263EF8340];
  int v5 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(DEDBugSession *)self identifier];
    *(_DWORD *)uint8_t buf = 138543362;
    id v48 = v6;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "will cleanup session [%{public}@]", buf, 0xCu);
  }
  if ([(DEDBugSession *)self isTarget])
  {
    BOOL v41 = v3;
    [(DEDBugSession *)self removeFromStore];
    uint64_t v7 = objc_alloc_init(DEDAttachmentHandler);
    id v8 = [(DEDBugSession *)self identifier];
    [(DEDAttachmentHandler *)v7 removeDirectoryForBugSessionIdentifier:v8];

    uint64_t v9 = [(DEDBugSession *)self finisher];
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = [(DEDBugSession *)self finisher];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        uint64_t v13 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __40__DEDBugSession_cleanupFinishedUploads___block_invoke;
        block[3] = &unk_26453A5C0;
        void block[4] = self;
        dispatch_async(v13, block);
      }
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v14 = +[DEDDeferredExtensionInfo allInfo];
    uint64_t v15 = [v14 allValues];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          int v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v21 = [v20 bugSessionIdentifier];
          long long v22 = [(DEDBugSession *)self identifier];
          int v23 = [v21 isEqualToString:v22];

          if (v23) {
            [v20 unschedule];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v17);
    }

    BOOL v3 = v41;
  }
  if ([(DEDBugSession *)self isTarget]) {
    goto LABEL_21;
  }
  uint64_t v24 = [(DEDBugSession *)self worker];
  if ([v24 transportType] == 3)
  {

LABEL_21:
    long long v27 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[DEDBugSession cleanupFinishedUploads:]();
    }

    long long v28 = +[DEDDaemon sharedInstance];
    long long v29 = [v28 controller];

    goto LABEL_24;
  }
  id v25 = [(DEDBugSession *)self worker];
  uint64_t v26 = [v25 transportType];

  if (v26 == 4) {
    goto LABEL_21;
  }
  v38 = [(DEDBugSession *)self worker];
  uint64_t v39 = [v38 transportType];

  if (v39 == 2)
  {
    v40 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_21FE04000, v40, OS_LOG_TYPE_INFO, "Cleaning up app side", buf, 2u);
    }

    long long v29 = +[DEDManager sharedInstance];
  }
  else
  {
    long long v29 = 0;
  }
LABEL_24:
  if (v3)
  {
    v30 = [(DEDBugSession *)self identifier];
    [v29 didFinishSessionWithIdentifier:v30];
  }
  objc_super v31 = [(DEDBugSession *)self identifier];
  [v29 removeSessionWithIdentifier:v31];

  uint64_t v32 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = [(DEDBugSession *)self identifier];
    v34 = [v29 sessions];
    uint64_t v35 = [v34 count];
    uint64_t v36 = [v29 sessions];
    id v37 = [v36 allKeys];
    *(_DWORD *)uint8_t buf = 138543874;
    id v48 = v33;
    __int16 v49 = 2048;
    uint64_t v50 = v35;
    __int16 v51 = 2114;
    id v52 = v37;
    _os_log_impl(&dword_21FE04000, v32, OS_LOG_TYPE_DEFAULT, "Removed bug session from memory (%{public}@), [%lu] remaining sessions: %{public}@", buf, 0x20u);
  }
}

void __40__DEDBugSession_cleanupFinishedUploads___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) finisher];
  [v1 cleanup];
}

- (void)didFinishAllUploads
{
  if ([(DEDBugSession *)self isTarget])
  {
    [(DEDBugSession *)self didFinishOperation:1000 withIdentifier:@"finishOperation"];
    BOOL v3 = [MEMORY[0x263EFF910] date];
    id v4 = [(DEDBugSession *)self uploadStartTime];
    [v3 timeIntervalSinceDate:v4];
    double v6 = v5;

    [(DEDBugSession *)self setUploadStartTime:0];
    uint64_t v7 = objc_opt_new();
    id v8 = [(DEDBugSession *)self identifier];
    uint64_t v9 = [v7 directoryForBugSessionIdentifier:v8];

    uint64_t v10 = [MEMORY[0x263F3A0A0] getDirectorySize:v9];
    uint64_t v11 = [(DEDBugSession *)self config];
    +[DEDAnalytics finisherDidCompleteWithDuration:uploadedByteCount:usingFinishingMove:withState:](DEDAnalytics, "finisherDidCompleteWithDuration:uploadedByteCount:usingFinishingMove:withState:", (unint64_t)v6, v10, [v11 finishingMove], 1);

    +[DEDAnalytics didCompleteBugSessionWithState:1];
  }
  [(DEDBugSession *)self cleanupFinishedUploads:1];
}

- (BOOL)readyToCancel
{
  BOOL v3 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v3);
  id v4 = [(DEDBugSession *)self pendingOperations];
  double v5 = [v4 allValues];
  if ([v5 count] == 1)
  {
    double v6 = [(DEDBugSession *)self pendingOperations];
    uint64_t v7 = [v6 allValues];
    id v8 = [v7 firstObject];
    BOOL v9 = [v8 type] == 2000;
  }
  else
  {
    BOOL v9 = 0;
  }

  objc_sync_exit(v3);
  return v9;
}

- (BOOL)readyToFinish
{
  BOOL v3 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v3);
  id v4 = [(DEDBugSession *)self pendingOperations];
  double v5 = [v4 allValues];
  if ([v5 count] == 1)
  {
    double v6 = [(DEDBugSession *)self pendingOperations];
    uint64_t v7 = [v6 allValues];
    id v8 = [v7 firstObject];
    BOOL v9 = [v8 type] == 1000;
  }
  else
  {
    BOOL v9 = 0;
  }

  objc_sync_exit(v3);
  return v9;
}

- (BOOL)isRunningDE:(id)a3
{
  id v4 = a3;
  if ([(DEDBugSession *)self isTarget])
  {
    double v5 = [(DEDBugSession *)self pendingOperations];
    objc_sync_enter(v5);
    double v6 = [(DEDBugSession *)self pendingOperations];
    uint64_t v7 = +[DEDBugSessionOperation hashingKeyWithId:v4 type:1];
    id v8 = [v6 objectForKey:v7];

    BOOL v9 = v8 != 0;
    objc_sync_exit(v5);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldCollectDiagnosticWithId:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(DEDBugSession *)self isTarget]) {
    goto LABEL_6;
  }
  double v5 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v5);
  double v6 = [(DEDBugSession *)self pendingOperations];
  uint64_t v7 = +[DEDBugSessionOperation hashingKeyWithId:v4 type:0];
  id v8 = [v6 objectForKey:v7];

  objc_sync_exit(v5);
  if (v8)
  {
    BOOL v9 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 hashingKey];
      int v13 = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "found kill DE operation [%{public}@]", (uint8_t *)&v13, 0xCu);
    }
    BOOL v11 = 0;
  }
  else
  {
LABEL_6:
    BOOL v11 = 1;
  }

  return v11;
}

- (void)didTerminateDiagnosticExtension:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DEDBugSession *)self didFinishOperation:0 withIdentifier:v7];
  char v12 = [[DEDExtensionIdentifier alloc] initWithString:v7];
  id v8 = [(DEDBugSession *)self identifierManager];
  [v8 revokeIdentifier:v12];

  [(DEDBugSession *)self save];
  [(DEDBugSession *)self notifyPromiseCancellationIfNeeded:v7 info:v6];

  if ([(DEDBugSession *)self isTarget])
  {
    if ([(DEDBugSession *)self readyToCancel])
    {
      [(DEDBugSession *)self _cancel];
      goto LABEL_9;
    }
    if ([(DEDBugSession *)self readyToNotify])
    {
      worker = self->_worker;
      uint64_t v10 = [(DEDBugSession *)self identifier];
      [(DEDWorkerProtocol *)worker scheduleNotificationForSession:v10];
    }
    else
    {
      if (![(DEDBugSession *)self readyToFinish]) {
        goto LABEL_9;
      }
      BOOL v11 = self->_worker;
      uint64_t v10 = [(DEDBugSession *)self identifier];
      [(DEDWorkerProtocol *)v11 commitSession:v10];
    }
  }
LABEL_9:
}

- (void)notifyPromiseCancellationIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DEDBugSession *)self isTarget])
  {
    id v8 = [(DEDBugSession *)self finisher];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(DEDBugSession *)self finisher];
      [v10 didCancelCollectionOnExtension:v6];
    }
    BOOL v11 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[DEDBugSession notifyPromiseCancellationIfNeeded:info:]((uint64_t)v6, self);
    }

    char v12 = +[DEDDaemon sharedInstance];
    int v13 = [(DEDBugSession *)self identifier];
    [v12 teardownDeferredDiagnosticsWithIdentifier:v6 parameters:v7 session:v13];
  }
}

- (id)ongoingCollectOperationsWithOperations:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = objc_msgSend(v4, "ded_selectItemsPassingTest:", &__block_literal_global_133);
  id v6 = objc_msgSend(v5, "ded_mapWithBlock:", &__block_literal_global_136);
  id v7 = [(DEDBugSession *)self log];
  id v8 = [(DEDBugSession *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = [(DEDBugSession *)self identifier];
    *(_DWORD *)uint8_t buf = 138412802;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    long long v22 = v6;
    _os_log_debug_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEBUG, "BS [%@] Pending operations %@, to kill %@", buf, 0x20u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke_137;
  v14[3] = &unk_26453A700;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  BOOL v11 = objc_msgSend(v4, "ded_rejectItemsPassingTest:", v14);

  return v11;
}

BOOL __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 0;
}

uint64_t __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __56__DEDBugSession_ongoingCollectOperationsWithOperations___block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 type] == 1 || objc_msgSend(v3, "type") == 2)
    && (id v4 = *(void **)(a1 + 32),
        [v3 identifier],
        double v5 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = [v4 containsObject:v5],
        v5,
        v4))
  {
    id v6 = *(NSObject **)(a1 + 40);
    uint64_t v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = v6;
      id v9 = [v3 description];
      int v11 = 138543362;
      char v12 = v9;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "Found collect operation [%{public}@] marked for deletion", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)ongoingExtensionCollectionOperations
{
  id v3 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v3);
  id v4 = [(DEDBugSession *)self pendingOperations];
  double v5 = [v4 allValues];
  id v6 = [(DEDBugSession *)self ongoingCollectOperationsWithOperations:v5];
  uint64_t v7 = objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_139);
  id v8 = [v7 valueForKeyPath:@"identifier"];

  objc_sync_exit(v3);
  return v8;
}

BOOL __53__DEDBugSession_ongoingExtensionCollectionOperations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (id)scheduledDeferredExtensionCollectionOperations
{
  id v3 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v3);
  id v4 = [(DEDBugSession *)self pendingOperations];
  double v5 = [v4 allValues];
  id v6 = [(DEDBugSession *)self ongoingCollectOperationsWithOperations:v5];
  uint64_t v7 = objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_141);
  id v8 = [v7 valueForKeyPath:@"identifier"];

  objc_sync_exit(v3);
  return v8;
}

BOOL __63__DEDBugSession_scheduledDeferredExtensionCollectionOperations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

- (void)didAdoptGroup:(id)a3
{
  id v7 = a3;
  id v4 = [(DEDBugSession *)self finisher];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DEDBugSession *)self finisher];
    [v6 didAdoptAttachmentGroup:v7];
  }
}

- (int64_t)instanceType
{
  id v3 = [(DEDBugSession *)self client];
  if (v3)
  {
  }
  else
  {
    id v4 = [(DEDBugSession *)self worker];

    if (!v4)
    {
      int v11 = [(DEDBugSession *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DEDBugSession instanceType]();
      }

      return 0;
    }
  }
  char v5 = [(DEDBugSession *)self client];
  if ([v5 transportType] == 4)
  {

    return 4;
  }
  id v6 = [(DEDBugSession *)self client];
  uint64_t v7 = [v6 transportType];

  if (v7 == 3) {
    return 4;
  }
  id v9 = [(DEDBugSession *)self worker];
  uint64_t v10 = [v9 transportType];

  if (v10 == 1) {
    return 3;
  }
  char v12 = [(DEDBugSession *)self worker];
  if ([v12 transportType] == 3)
  {

    return 2;
  }
  uint64_t v13 = [(DEDBugSession *)self worker];
  uint64_t v14 = [v13 transportType];

  if (v14 == 4) {
    return 2;
  }
  id v15 = [(DEDBugSession *)self worker];
  uint64_t v16 = [v15 transportType];

  if (v16 != 2)
  {
    uint64_t v17 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession instanceType](self);
    }

    return 0;
  }
  return 1;
}

- (BOOL)isTarget
{
  uint64_t v2 = [(DEDBugSession *)self worker];
  BOOL v3 = [v2 transportType] == 1;

  return v3;
}

- (id)hashExtensions:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "identifier", (void)v14);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  char v12 = [NSDictionary dictionaryWithDictionary:v4];

  return v12;
}

- (id)nextCompletionBlockForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDBugSession *)self deCompletions];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [v6 lastObject];
    if (v7)
    {
      [v6 removeLastObject];
      uint64_t v8 = (void *)MEMORY[0x223C5FFB0](v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)storeCollectionCompletion:(id)a3 forIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(DEDBugSession *)self deCompletions];
  uint64_t v8 = [v7 objectForKey:v6];

  if (!v8) {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  }
  id v9 = (void *)[v12 copy];
  uint64_t v10 = (void *)MEMORY[0x223C5FFB0]();
  [v8 addObject:v10];

  int v11 = [(DEDBugSession *)self deCompletions];
  [v11 setObject:v8 forKey:v6];
}

- (BOOL)hasCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDBugSession *)self config];
  id v6 = [v5 requestedCapabilities];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)notifier
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(DEDBugSession *)self _notifier];

  if (v3) {
    goto LABEL_22;
  }
  unint64_t v4 = [(DEDBugSession *)self instanceType];
  if (v4 < 2)
  {
    uint64_t v8 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DEDBugSession notifier](self);
    }
  }
  else if (v4 - 2 >= 2)
  {
    if (v4 != 4) {
      goto LABEL_18;
    }
    uint64_t v8 = [(DEDBugSession *)self client];
    if ([v8 conformsToProtocol:&unk_26D1B4F50])
    {
      id v9 = [(DEDBugSession *)self client];
      int v10 = [v9 conformsToProtocol:&unk_26D1B0968];

      if (!v10) {
        goto LABEL_18;
      }
      uint64_t v8 = [(DEDBugSession *)self client];
      [(DEDBugSession *)self set_notifier:v8];
    }
  }
  else
  {
    id v5 = [(DEDBugSession *)self config];
    uint64_t v6 = [v5 notifyingMove];

    if (v6 == 1)
    {
      char v7 = DEDUserNotificationNotifier;
      goto LABEL_14;
    }
    if (v6 == 2)
    {
      char v7 = DEDFollowUpNotifier;
LABEL_14:
      id v11 = [v7 alloc];
      id v12 = [(DEDBugSession *)self config];
      uint64_t v13 = (void *)[v11 initWithConfiguration:v12 session:self];
      [(DEDBugSession *)self set_notifier:v13];

      goto LABEL_18;
    }
    uint64_t v8 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Unknown notifier specified.", (uint8_t *)&v21, 2u);
    }
  }

LABEL_18:
  long long v14 = [(DEDBugSession *)self _notifier];

  if (v14)
  {
    long long v15 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [(DEDBugSession *)self _notifier];
      long long v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      int v21 = 138543362;
      long long v22 = v18;
      _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_DEFAULT, "Using notifier [%{public}@]", (uint8_t *)&v21, 0xCu);
    }
  }
LABEL_22:
  uint64_t v19 = [(DEDBugSession *)self _notifier];
  return v19;
}

- (BOOL)readyToNotify
{
  id v3 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v3);
  unint64_t v4 = [(DEDBugSession *)self pendingOperations];
  id v5 = [v4 allValues];
  if ([v5 count] == 1)
  {
    uint64_t v6 = [(DEDBugSession *)self pendingOperations];
    char v7 = [v6 allValues];
    uint64_t v8 = [v7 firstObject];
    BOOL v9 = [v8 type] == 100;
  }
  else
  {
    BOOL v9 = 0;
  }

  objc_sync_exit(v3);
  return v9;
}

- (void)presentNotificationOnFilingDevice
{
  id v3 = [(DEDBugSession *)self notifier];
  unint64_t v4 = [(DEDBugSession *)self identifier];
  [v3 presentNotificationForSession:v4];

  if ([(DEDBugSession *)self instanceType] == 3)
  {
    [(DEDBugSession *)self didFinishOperation:100 withIdentifier:@"notifyOperation"];
  }
}

- (void)idsInbound_presentNotificationOnFilingDevice
{
  [a1 instanceType];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v1, v2, "[%{public}s] not supported in instance type [%ld]", v3, v4, v5, v6, 2u);
}

- (void)idsInbound_didPresentNotificationOnFilingDevice
{
  [a1 instanceType];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v1, v2, "[%{public}s] not supported in instance type [%ld]", v3, v4, v5, v6, 2u);
}

- (void)clearNotificationOnFilingDevice
{
  uint64_t v3 = [(DEDBugSession *)self notifier];
  uint64_t v4 = [(DEDBugSession *)self identifier];
  [v3 removeNotificationForSession:v4];

  if ([(DEDBugSession *)self instanceType] == 3)
  {
    [(DEDBugSession *)self didFinishOperation:100 withIdentifier:@"notifyOperation"];
  }
}

- (void)idsInbound_clearNotificationOnFilingDevice
{
  [a1 instanceType];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v1, v2, "[%{public}s] not supported in instance type [%ld]", v3, v4, v5, v6, 2u);
}

- (void)idsInbound_didClearNotificationOnFilingDevice
{
  [a1 instanceType];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v1, v2, "[%{public}s] not supported in instance type [%ld]", v3, v4, v5, v6, 2u);
}

- (void)removeFromStore
{
  if ([(DEDBugSession *)self isTarget])
  {
    id v3 = +[DEDPersistence sharedInstance];
    [v3 removeBugSession:self];
  }
}

- (void)save
{
  if ([(DEDBugSession *)self isTarget])
  {
    id v3 = +[DEDPersistence sharedInstance];
    [v3 updateBugSession:self];
  }
}

- (void)willPerformOperationWithID:(id)a3 type:(int64_t)a4 options:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([(DEDBugSession *)self isTarget])
  {
    int v10 = [(DEDBugSession *)self pendingOperations];
    objc_sync_enter(v10);
    id v11 = objc_opt_new();
    [v11 setIdentifier:v8];
    [v11 setType:a4];
    [v11 setOptions:v9];
    id v12 = [(DEDBugSession *)self pendingOperations];
    uint64_t v13 = [v11 hashingKey];
    [v12 setObject:v11 forKey:v13];

    long long v14 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = [v11 hashingKey];
      int v16 = 138543362;
      long long v17 = v15;
      _os_log_impl(&dword_21FE04000, v14, OS_LOG_TYPE_INFO, "will persist operation [%{public}@]", (uint8_t *)&v16, 0xCu);
    }
    objc_sync_exit(v10);
  }
  [(DEDBugSession *)self _logOperationQueue];
}

- (void)didFinishOperation:(int64_t)a3 withIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(DEDBugSession *)self isTarget])
  {
    char v7 = [(DEDBugSession *)self pendingOperations];
    objc_sync_enter(v7);
    id v8 = [(DEDBugSession *)self pendingOperations];
    id v9 = +[DEDBugSessionOperation hashingKeyWithId:v6 type:a3];
    [v8 removeObjectForKey:v9];

    objc_sync_exit(v7);
    if (a3 == 2000)
    {
      int v10 = [(DEDBugSession *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(DEDBugSession *)self identifier];
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Did finish cancel operation on [%{public}@]", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      [(DEDBugSession *)self save];
    }
  }
  [(DEDBugSession *)self _logOperationQueue];
}

- (void)setUploadDelegate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(DEDBugSession *)self instanceType] == 1)
  {
    uint64_t v5 = [(DEDBugSession *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(DEDBugSession *)self identifier];
      int v8 = 138543618;
      id v9 = v4;
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Setting uploadDelegate: [%{public}@] session [%{public}@]", (uint8_t *)&v8, 0x16u);
    }
  }
  char v7 = self;
  objc_sync_enter(v7);
  [(DEDBugSession *)v7 set__uploadDelegate:v4];
  objc_sync_exit(v7);
}

- (DEDUploadStatusDelegate)uploadDelegate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(DEDBugSession *)v2 __uploadDelegate];
  objc_sync_exit(v2);

  return (DEDUploadStatusDelegate *)v3;
}

- (void)_streamOperationQueue
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DEDBugSession__streamOperationQueue__block_invoke;
  block[3] = &unk_26453A5C0;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __38__DEDBugSession__streamOperationQueue__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _logOperationQueue];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _streamOperationQueue];
}

- (void)_logOperationQueue
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (_logOperationQueue_onceToken != -1) {
    dispatch_once(&_logOperationQueue_onceToken, &__block_literal_global_198);
  }
  if ([(DEDBugSession *)self isTarget])
  {
    dispatch_time_t v3 = [(DEDBugSession *)self pendingOperations];
    objc_sync_enter(v3);
    id v4 = (id)_logOperationQueue_opDebugLog;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [(DEDBugSession *)self identifier];
      id v6 = [(DEDBugSession *)self pendingOperations];
      char v7 = [v6 allKeys];
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_debug_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEBUG, "BS [%@] Operations %@", (uint8_t *)&v8, 0x16u);
    }
    objc_sync_exit(v3);
  }
}

void __35__DEDBugSession__logOperationQueue__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-op-watch");
  uint64_t v1 = (void *)_logOperationQueue_opDebugLog;
  _logOperationQueue_opDebugLog = (uint64_t)v0;
}

+ (id)testingInstance
{
  id v2 = objc_opt_new();
  return v2;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (int64_t)priorClientTransportType
{
  return self->_priorClientTransportType;
}

- (void)setPriorClientTransportType:(int64_t)a3
{
  self->_priorClientTransportType = a3;
}

- (int64_t)priorWorkerTransportType
{
  return self->_priorWorkerTransportType;
}

- (void)setPriorWorkerTransportType:(int64_t)a3
{
  self->_priorWorkerTransportType = a3;
}

- (NSMutableSet)filePromises
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFilePromises:(id)a3
{
}

- (OS_dispatch_queue)_diskAccessQueue
{
  return self->__diskAccessQueue;
}

- (void)set_diskAccessQueue:(id)a3
{
}

- (id)pingHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPingHandler:(id)a3
{
}

- (DEDUploadStatusDelegate)__uploadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->___uploadDelegate);
  return (DEDUploadStatusDelegate *)WeakRetained;
}

- (void)set__uploadDelegate:(id)a3
{
}

- (NSMutableArray)deListCompletions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeListCompletions:(id)a3
{
}

- (NSMutableDictionary)deCompletions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeCompletions:(id)a3
{
}

- (NSMutableArray)adoptFilesCompletions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdoptFilesCompletions:(id)a3
{
}

- (NSMutableDictionary)ongoingCompletionHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOngoingCompletionHandlers:(id)a3
{
}

- (DEDExtensionIdentifierManager)identifierManager
{
  return (DEDExtensionIdentifierManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdentifierManager:(id)a3
{
}

- (NSDate)uploadStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUploadStartTime:(id)a3
{
}

- (BOOL)finisherDidCommit
{
  return self->_finisherDidCommit;
}

- (void)setFinisherDidCommit:(BOOL)a3
{
  self->_finisherDidCommit = a3;
}

- (NSMutableDictionary)pendingOperations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPendingOperations:(id)a3
{
}

- (id)statusCompletionBlock
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setStatusCompletionBlock:(id)a3
{
}

- (id)sessionStateCompletionBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setSessionStateCompletionBlock:(id)a3
{
}

- (id)syncCompletionBlock
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setSyncCompletionBlock:(id)a3
{
}

- (id)deTextDataLoadCompletion
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setDeTextDataLoadCompletion:(id)a3
{
}

- (NSDictionary)cachedExtensions
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCachedExtensions:(id)a3
{
}

- (DEDClientProtocol)client
{
  return (DEDClientProtocol *)objc_getProperty(self, a2, 184, 1);
}

- (void)setClient:(id)a3
{
}

- (NSString)priorClientAddress
{
  return self->_priorClientAddress;
}

- (void)setPriorClientAddress:(id)a3
{
}

- (DEDWorkerProtocol)worker
{
  return (DEDWorkerProtocol *)objc_getProperty(self, a2, 200, 1);
}

- (void)setWorker:(id)a3
{
}

- (DEDFinisher)_finisher
{
  return (DEDFinisher *)objc_getProperty(self, a2, 208, 1);
}

- (void)set_finisher:(id)a3
{
}

- (DEDNotifier)_notifier
{
  return (DEDNotifier *)objc_getProperty(self, a2, 216, 1);
}

- (void)set_notifier:(id)a3
{
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->__notifier, 0);
  objc_storeStrong((id *)&self->__finisher, 0);
  objc_storeStrong((id *)&self->_worker, 0);
  objc_storeStrong((id *)&self->_priorClientAddress, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cachedExtensions, 0);
  objc_storeStrong(&self->_deTextDataLoadCompletion, 0);
  objc_storeStrong(&self->_syncCompletionBlock, 0);
  objc_storeStrong(&self->_sessionStateCompletionBlock, 0);
  objc_storeStrong(&self->_statusCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_uploadStartTime, 0);
  objc_storeStrong((id *)&self->_identifierManager, 0);
  objc_storeStrong((id *)&self->_ongoingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_adoptFilesCompletions, 0);
  objc_storeStrong((id *)&self->_deCompletions, 0);
  objc_storeStrong((id *)&self->_deListCompletions, 0);
  objc_destroyWeak((id *)&self->___uploadDelegate);
  objc_storeStrong(&self->_pingHandler, 0);
  objc_storeStrong((id *)&self->__diskAccessQueue, 0);
  objc_storeStrong((id *)&self->_filePromises, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id)stateInfo
{
  id v2 = [(DEDBugSession *)self finisherWithState];
  dispatch_time_t v3 = [v2 additionalStateInfo];
  id v4 = v3;
  if (!v3) {
    dispatch_time_t v3 = (void *)MEMORY[0x263EFFA78];
  }
  id v5 = v3;

  return v5;
}

- (int64_t)state
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = [(DEDBugSession *)self pendingOperations];
  objc_sync_enter(v3);
  if ([(DEDBugSession *)self readyToFinish])
  {
    id v4 = [(DEDBugSession *)self finisherWithState];
    char v5 = [v4 isUploading];

    if ((v5 & 1) == 0)
    {
      id v25 = [(DEDBugSession *)self finisherWithState];
      char v26 = [v25 isCompressing];

      if ((v26 & 1) == 0)
      {
        long long v27 = [(DEDBugSession *)self finisherWithState];
        char v28 = [v27 isUploading];

        if (v28)
        {
          int64_t v6 = 7;
          goto LABEL_29;
        }
        v30 = Log_4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_21FE04000, v30, OS_LOG_TYPE_DEFAULT, "Finisher not compressing, uploading or finished but session is ready to finish", (uint8_t *)v32, 2u);
        }
      }
      int64_t v6 = 5;
      goto LABEL_29;
    }
    int64_t v6 = 6;
  }
  else
  {
    char v7 = [(DEDBugSession *)self pendingOperations];
    objc_sync_enter(v7);
    int v8 = [(DEDBugSession *)self ongoingExtensionCollectionOperations];
    uint64_t v9 = [v8 count];

    __int16 v10 = [(DEDBugSession *)self scheduledDeferredExtensionCollectionOperations];
    uint64_t v11 = [v10 count];

    uint64_t v12 = [(DEDBugSession *)self pendingOperations];
    uint64_t v13 = [v12 count];

    BOOL v14 = [(DEDBugSession *)self isCancelling];
    long long v15 = [(DEDBugSession *)self pendingOperations];
    int v16 = +[DEDBugSessionOperation hashingKeyWithId:@"notifyOperation" type:100];
    long long v17 = [v15 objectForKey:v16];

    objc_sync_exit(v7);
    BOOL v18 = [(DEDBugSession *)self hasDirectory];
    BOOL v19 = [(DEDBugSession *)self hasStaleDirectory];
    id v20 = DEDSessionStateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v32[0] = 67110656;
      v32[1] = v9 != 0;
      __int16 v33 = 1024;
      BOOL v34 = v11 != 0;
      __int16 v35 = 1024;
      BOOL v36 = v13 != 0;
      __int16 v37 = 1024;
      BOOL v38 = v18;
      __int16 v39 = 1024;
      BOOL v40 = v19;
      __int16 v41 = 1024;
      BOOL v42 = v14;
      __int16 v43 = 1024;
      BOOL v44 = v17 != 0;
      _os_log_debug_impl(&dword_21FE04000, v20, OS_LOG_TYPE_DEBUG, "IC: [%i] HDCO: [%i] HPO: [%i] HDIR: [%i] HSDIR [%i] IC [%i] HNO [%i]", (uint8_t *)v32, 0x2Cu);
    }
    BOOL v21 = v9 != 0;

    BOOL v22 = v14 || v21 || v11 != 0;
    uint64_t v23 = 3;
    if (v21) {
      uint64_t v23 = 4;
    }
    if (v14) {
      int64_t v6 = 8;
    }
    else {
      int64_t v6 = v23;
    }
    if (!v22)
    {
      if (!v13 || v17)
      {
        uint64_t v29 = 2;
        if (v19) {
          uint64_t v29 = -1;
        }
        if (v18) {
          int64_t v6 = v29;
        }
        else {
          int64_t v6 = 1;
        }
      }
      else
      {
        uint64_t v24 = Log_4();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[DEDBugSession(DaemonTasks) state](v24);
        }

        int64_t v6 = -2;
      }
    }
  }
LABEL_29:
  objc_sync_exit(v3);

  return v6;
}

- (BOOL)isCancelling
{
  dispatch_time_t v3 = [(DEDBugSession *)self pendingOperations];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  char v5 = [(DEDBugSession *)self pendingOperations];
  int64_t v6 = +[DEDBugSessionOperation hashingKeyWithId:@"cancelOperation" type:2000];
  char v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v9 = [(DEDBugSession *)self pendingOperations];
    __int16 v10 = [v9 allValues];
    uint64_t v11 = objc_msgSend(v10, "ded_selectItemsPassingTest:", &__block_literal_global_25);
    uint64_t v12 = [v11 count];

    uint64_t v13 = [(DEDBugSession *)self pendingOperations];
    BOOL v14 = [v13 allValues];
    long long v15 = objc_msgSend(v14, "ded_selectItemsPassingTest:", &__block_literal_global_12_0);
    uint64_t v16 = [v15 count];

    if (v12 == v16)
    {
      long long v17 = [(DEDBugSession *)self pendingOperations];
      BOOL v18 = [v17 allValues];
      BOOL v8 = [v18 count] == 2 * v12;

      return v8;
    }
    return 0;
  }
  return 1;
}

BOOL __42__DEDBugSession_DaemonTasks__isCancelling__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 1 || objc_msgSend(v2, "type") == 2;

  return v3;
}

BOOL __42__DEDBugSession_DaemonTasks__isCancelling__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 0;
}

- (id)finisherWithState
{
  id v2 = [(DEDBugSession *)self finisher];
  if ([v2 conformsToProtocol:&unk_26D1B4230]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasDirectory
{
  id v3 = objc_alloc_init(DEDAttachmentHandler);
  uint64_t v4 = [(DEDBugSession *)self identifier];
  char v5 = [(DEDAttachmentHandler *)v3 directoryForBugSessionIdentifier:v4];

  LOBYTE(v4) = [v5 checkResourceIsReachableAndReturnError:0];
  return (char)v4;
}

- (BOOL)hasStaleDirectory
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(DEDAttachmentHandler);
  uint64_t v4 = [(DEDBugSession *)self identifier];
  char v5 = [(DEDAttachmentHandler *)v3 directoryForBugSessionIdentifier:v4];

  if ([(DEDBugSession *)self hasDirectory])
  {
    uint64_t v6 = *MEMORY[0x263EFF5F8];
    uint64_t v7 = *MEMORY[0x263EFF610];
    v20[0] = *MEMORY[0x263EFF5F8];
    v20[1] = v7;
    BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    id v19 = 0;
    uint64_t v9 = [v5 resourceValuesForKeys:v8 error:&v19];
    id v10 = v19;

    if (v10)
    {
      uint64_t v11 = Log_4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(DEDBugSession(DaemonTasks) *)self hasStaleDirectory];
      }
      BOOL v12 = 0;
    }
    else
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:v6];
      uint64_t v13 = [v9 objectForKeyedSubscript:v7];
      id v14 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v14 setDay:-7];
      long long v15 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v16 = objc_alloc_init(MEMORY[0x263EFF910]);
      long long v17 = [v15 dateByAddingComponents:v14 toDate:v16 options:0];

      if (v11 && [v11 compare:v17] == -1)
      {
        BOOL v12 = 1;
      }
      else if (v13)
      {
        BOOL v12 = [v13 compare:v17] == -1;
      }
      else
      {
        BOOL v12 = 0;
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)configuration
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "could not copy configuration because it is nil", v2, v3, v4, v5, v6);
}

- (void)attachCompletionHandlerForDEDExtensionIdentifier:(uint64_t)a1 handler:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v3, v4, "Unknown DEDExtensionIdentifier [%{public}@] for bug session [%{public}@] - adding to completion handlers anyway.", v5, v6, v7, v8, 2u);
}

- (void)pingWithCallback:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x223C5FFB0]();
  id v10 = [a2 shortDescription];
  OUTLINED_FUNCTION_12(&dword_21FE04000, v4, v5, "%s with handler %@ on %@", v6, v7, v8, v9, 2u);
}

- (void)getStateWithCompletion:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "[%{public}@] does not support session sate API.", v4, v5, v6, v7, v8);
}

- (void)addData:(void *)a1 withFilename:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_21FE04000, v2, v3, "Session [%{public}@] does not have [%{public}@]. Cannot proceed with [%{public}s]", v4, v5, v6, v7, v8);
}

- (void)_addSessionData:filename:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21FE04000, v0, OS_LOG_TYPE_ERROR, "Finisher does not handle writeData:filename:. Will drop [%{public}@]", v1, 0xCu);
}

- (void)synchronizeSessionStatusWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Synchronize session status requires enhanced execution. Use -getSessionStatusWithCompletion: instead.", v2, v3, v4, v5, v6);
}

- (void)startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Deferred execution method was called, but with no date. Aborting.", v2, v3, v4, v5, v6);
}

- (void)startDiagnosticExtensionWithDEDIdentifier:parameters:deferRunUntil:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "This session does not support deferred execution. Aborting.", v2, v3, v4, v5, v6);
}

- (void)removeAttachment:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "given attachment group has not extension identifier, cannot remove it", v2, v3, v4, v5, v6);
}

- (void)cancelDiagnosticExtension:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "extension identifier is nil", v2, v3, v4, v5, v6);
}

- (void)cancelDiagnosticExtensionWithDEDExtensionIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v3, v4, "Trying to cancel an invocation for an unknown DED identifier [%@] for bug session [%@].", v5, v6, v7, v8, 2u);
}

- (void)cancelDiagnosticExtensionWithDEDExtensionIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "Cancelling a DEDIdentifier-based collection requires enhanced execution.", v2, v3, v4, v5, v6);
}

- (void)_terminateExtensionWithIdentifier:info:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FE04000, v0, v1, "cannot terminate extensions with null identifier", v2, v3, v4, v5, v6);
}

- (void)loadTextDataForExtensions:(void *)a1 localization:completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_21FE04000, v2, v3, "Session [%{public}@] does not have [%{public}@]. Cannot proceed with [%{public}s]", v4, v5, v6, v7, v8);
}

- (void)supportsDiagnostics:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortDescription];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10(&dword_21FE04000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

- (void)hasCollected:(uint8_t *)buf isCollecting:(unsigned char *)a2 identifiers:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "group extensions id is nil, will not track file promise", buf, 2u);
}

- (void)hasCollected:(void *)a1 isCollecting:identifiers:.cold.2(void *a1)
{
  uint64_t v1 = [a1 valueForKeyPath:@"identifier"];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "is collecting %@", v4, v5, v6, v7, v8);
}

- (void)hasCollected:(void *)a1 isCollecting:identifiers:.cold.3(void *a1)
{
  uint64_t v1 = [a1 valueForKeyPath:@"rootURL"];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_21FE04000, v2, v3, "has collected %@", v4, v5, v6, v7, v8);
}

- (void)setConfig:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "tried to modify session [%{public}@] that does not have mutable capability", v4, v5, v6, v7, v8);
}

- (void)cleanupFinishedUploads:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_21FE04000, v0, v1, "Cleaning up daemon side (on device with target session or passed through to remote daemon)", v2, v3, v4, v5, v6);
}

- (void)notifyPromiseCancellationIfNeeded:(uint64_t)a1 info:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint8_t v8 = [a2 identifier];
  OUTLINED_FUNCTION_12(&dword_21FE04000, v2, v3, "%s %@ %@", v4, v5, v6, v7, 2u);
}

- (void)instanceType
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_21FE04000, v2, v3, "Cannot determine instance type in session [%{public}@]", v4, v5, v6, v7, v8);
}

- (void)notifier
{
  [a1 instanceType];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v1, v2, "[%{public}s] not supported in instance type [%ld]", v3, v4, v5, v6, 2u);
}

@end