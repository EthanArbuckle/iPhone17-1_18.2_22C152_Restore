@interface NSFilePresenterProxy
+ (id)urlWithItemURL:(id)a3 subitemPath:(id)a4;
- (BOOL)allowedForURL:(id)a3;
- (BOOL)disconnected;
- (BOOL)inSubarbiter;
- (BOOL)shouldSendObservationMessageWithPurposeID:(id)a3;
- (BOOL)usesMainThreadDuringReliquishing;
- (NSFilePresenterProxy)initWithClient:(id)a3 remotePresenter:(id)a4 reactorID:(id)a5;
- (NSSet)observedUbiquityAttributes;
- (id)_clientProxy;
- (unint64_t)filePresenterResponses;
- (void)_settleNonCoordinatedChanges;
- (void)accommodateDeletionWithSubitemPath:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)disconnect;
- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 purposeID:(id)a5 subitemURL:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (void)forwardUsingProxy:(id)a3;
- (void)invalidate;
- (void)localFileWasEvicted;
- (void)observeChangeAtSubitemPath:(id)a3;
- (void)observeChangeOfUbiquityAttributes:(id)a3;
- (void)observeDisappearanceAtSubitemPath:(id)a3;
- (void)observeDisconnectionByWriterWithPurposeID:(id)a3;
- (void)observeMoveByWriterWithPurposeID:(id)a3 withPhysicalDestinationURL:(id)a4 withFSID:(fsid)a5 andFileID:(unint64_t)a6;
- (void)observeMoveOfSubitemAtURL:(id)a3 toURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7;
- (void)observeNewProvider:(id)a3;
- (void)observePresenterChange:(BOOL)a3 atSubitemURL:(id)a4;
- (void)observeReconnectionByWriterWithPurposeID:(id)a3;
- (void)observeSharingChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4;
- (void)observeUbiquityChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4;
- (void)observeVersionChangeOfKind:(id)a3 withClientID:(id)a4 name:(id)a5 subitemPath:(id)a6;
- (void)promisedFileWasFulfilled;
- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 resultHandler:(id)a6;
- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemPath:(id)a6 resultHandler:(id)a7;
- (void)saveChangesWithCompletionHandler:(id)a3;
- (void)setFilePresenterResponses:(unint64_t)a3;
- (void)setInSubarbiter:(BOOL)a3;
- (void)setItemLocation:(id)a3;
- (void)setObservedUbiquityAttributes:(id)a3;
- (void)setUsesMainThreadDuringReliquishing:(BOOL)a3;
- (void)startObservingApplicationStateWithQueue:(id)a3;
- (void)startWatchingWithQueue:(id)a3 lastEventID:(id)a4 unannouncedMoveHandler:(id)a5;
- (void)stopObservingApplicationState;
@end

@implementation NSFilePresenterProxy

- (void)setUsesMainThreadDuringReliquishing:(BOOL)a3
{
  self->_usesMainThreadDuringRelinquishing = a3;
}

- (void)setObservedUbiquityAttributes:(id)a3
{
}

- (void)setFilePresenterResponses:(unint64_t)a3
{
  self->_filePresenterResponses = a3;
  objc_msgSend(self->_remotePresenter, "setFilePresenterResponses:");
}

- (NSFilePresenterProxy)initWithClient:(id)a3 remotePresenter:(id)a4 reactorID:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFilePresenterProxy;
  v6 = [(NSFileReactorProxy *)&v8 initWithClient:a3 reactorID:a5];
  if (v6) {
    v6->_remotePresenter = [[NSFilePresenterManagedProxy alloc] initWithXPCProxy:a4];
  }
  return v6;
}

- (BOOL)inSubarbiter
{
  return self->_inSubarbiter;
}

- (BOOL)allowedForURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a3 isFileURL])
  {
    *(void *)v19 = 0;
    *(void *)&v19[8] = v19;
    *(void *)&v19[16] = 0x2020000000;
    char v20 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [(NSFileReactorProxy *)self client];
    if (v5)
    {
      [v5 auditToken];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v18;
    if (sandbox_check_by_audit_token()
      && !objc_msgSend((id)objc_msgSend(a3, "path"), "containsString:", @"/NanoPreferencesSync/NanoDomains/"))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      long long v14 = v17;
      long long v15 = v18;
      v13[2] = __38__NSFilePresenterProxy_allowedForURL___block_invoke;
      v13[3] = &unk_1E51FDAB0;
      v13[4] = v19;
      +[NSFileReactorProxy _enumerateParentDirectoriesStartingAtURL:a3 usingBlock:v13];
      if (!*(unsigned char *)(*(void *)&v19[8] + 24))
      {
        objc_super v8 = _NSFCPresenterLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id reactorID = self->super._reactorID;
          int v10 = objc_msgSend(-[NSFileReactorProxy client](self, "client"), "processIdentifier");
          uint64_t v11 = [a3 path];
          *(_DWORD *)buf = 138543875;
          *(void *)&buf[4] = reactorID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v10;
          *(_WORD *)&buf[18] = 2113;
          *(void *)&buf[20] = v11;
          _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Registering presenter %{public}@ disallowed. Process %d is not allowed to access the requested path or any of its parent directories: %{private}@", buf, 0x1Cu);
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)&v19[8] + 24) = 1;
    }
    BOOL v7 = *(unsigned char *)(*(void *)&v19[8] + 24) != 0;
    _Block_object_dispose(v19, 8);
  }
  else
  {
    v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138543619;
      *(void *)&v19[4] = self;
      *(_WORD *)&v19[12] = 2113;
      *(void *)&v19[14] = a3;
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "Registering presenter %{public}@ disallowed. Only file URLs are allowed, unlike this one: %{private}@", v19, 0x16u);
    }
    return 0;
  }
  return v7;
}

- (void)startWatchingWithQueue:(id)a3 lastEventID:(id)a4 unannouncedMoveHandler:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_queue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  uint64_t v9 = [NSFileWatcher alloc];
  client = self->super._client;
  if (client) {
    [(NSXPCConnection *)client auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  uint64_t v11 = [(NSFileWatcher *)v9 initWithQueue:a3 auditToken:v14];
  self->_watcher = v11;
  [(NSFileWatcher *)v11 setURL:[(NSFileAccessNode *)self->super._itemLocation url]];
  if (a4) {
    -[NSFileWatcher setLastObservedEventID:](self->_watcher, "setLastObservedEventID:", [a4 unsignedLongLongValue]);
  }
  watcher = self->_watcher;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke;
  v13[3] = &unk_1E51FDB00;
  v13[4] = self;
  void v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  [(NSFileWatcher *)watcher setObserver:v13];
  [(NSFileWatcher *)self->_watcher start];
}

void __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke(uint64_t a1, uint64_t a2, __int16 a3, void *a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x100) != 0)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 72))
    {
      uint64_t v9 = _NSFCPresenterLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ detected non-coordinated event", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 125) = 1;
      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_80;
      block[3] = &unk_1E51F71D0;
      v12 = *(NSObject **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v11, v12, block);
    }
  }
  else
  {
    char v6 = a3;
    if ((a3 & 0x200) != 0)
    {
      if (a5 != -1 && *(void *)(a1 + 48))
      {
        v13 = *(void **)(*(void *)(a1 + 32) + 40);
        [v13 updateLastEventID:a5];
      }
    }
    else
    {
      if (!a2)
      {
        if ((a3 & 0x10) != 0)
        {
          uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 24) url];
          if (v15)
          {
            if (([a4 isEqual:v15] & 1) == 0)
            {
              *(void *)buf = 0;
              uint64_t v20 = 0;
              _NSGetFSIDAndFileID(a4, buf, &v20);
              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            }
          }
        }
        if ((v6 & 2) != 0)
        {
          uint64_t v16 = *(void *)(a1 + 32);
        }
        else
        {
          if ((v6 & 4) == 0) {
            return;
          }
          uint64_t v16 = *(void *)(a1 + 32);
          if (*(unsigned char *)(v16 + 121)) {
            return;
          }
        }
        if (![(id)v16 shouldSendObservationMessageWithPurposeID:*(void *)(v16 + 80)]) {
          return;
        }
        v19 = *(void **)(*(void *)(a1 + 32) + 40);
        long long v18 = 0;
        goto LABEL_28;
      }
      objc_super v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) itemProvider];
      if (v8)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_2;
        v21[3] = &unk_1E51FDAD8;
        v21[4] = *(void *)(a1 + 32);
        [v8 provideLogicalURLForURL:a2 completionHandler:v21];
        return;
      }
      if ([*(id *)(a1 + 32) shouldSendObservationMessageWithPurposeID:*(void *)(*(void *)(a1 + 32) + 80)])
      {
        long long v17 = *(void **)(*(void *)(a1 + 32) + 40);
        long long v18 = +[NSURLPromisePair pairWithLogicalURL:a2 physicalURL:0];
        v19 = v17;
LABEL_28:
        [v19 observeChangeWithSubitemURL:v18];
      }
    }
  }
}

- (void)startObservingApplicationStateWithQueue:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_inSubarbiter)
  {
    processManager = self->_processManager;
    if (processManager)
    {
      [(NSFileAccessProcessManager *)processManager invalidate];
    }
    char v6 = -[NSFileAccessProcessManager initWithClient:queue:]([NSFileAccessProcessManager alloc], "initWithClient:queue:", objc_msgSend(-[NSFileReactorProxy client](self, "client"), "_xpcConnection"), a3);
    self->_processManager = v6;
    if ((self->_filePresenterResponses & 0xFFFFFFFF8000020FLL) != 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __64__NSFilePresenterProxy_startObservingApplicationStateWithQueue___block_invoke;
      v9[3] = &unk_1E51FDB28;
      v9[4] = self;
      [(NSFileAccessProcessManager *)v6 setSuspensionHandler:v9];
    }
    id v7 = [(NSFileAccessNode *)self->super._itemLocation url];
    if (v7)
    {
      v10[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(NSFileAccessProcessManager *)self->_processManager setURLs:v8];
    [self->_remotePresenter setProcessManager:self->_processManager];
  }
}

- (void)setItemLocation:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  itemLocation = self->super._itemLocation;
  if (itemLocation == a3) {
    goto LABEL_11;
  }
  id v6 = [(NSFileAccessNode *)itemLocation itemProvider];
  id v7 = (void *)_nearestPresenterInterestedInSubitemPresenters(self->super._itemLocation);
  char HasPresentersExcludingPresenter = _nodeHasPresentersExcludingPresenter(self->super._itemLocation, (uint64_t)self);
  id v9 = [(NSFileAccessNode *)self->super._itemLocation url];
  [(NSFileAccessNode *)self->super._itemLocation removePresenter:self];
  self->super._itemLocation = (NSFileAccessNode *)a3;
  [a3 addPresenter:self];
  id v10 = [(NSFileAccessNode *)self->super._itemLocation itemProvider];
  id v11 = [(NSFileAccessNode *)self->super._itemLocation url];
  if (v6 != v10)
  {
    if (v6) {
      [v6 observePresentationChangeOfKind:@"removed" withPresenter:self url:v9 newURL:0];
    }
    if (v10) {
      [v10 observePresentationChangeOfKind:@"added" withPresenter:self url:v11 newURL:0];
    }
    [(NSFilePresenterProxy *)self observeNewProvider:v10];
    if (HasPresentersExcludingPresenter) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [v6 observePresentationChangeOfKind:@"itemMoved" withPresenter:self url:v9 newURL:v11];
  if ((HasPresentersExcludingPresenter & 1) == 0) {
LABEL_8:
  }
    [v7 observePresenterChange:0 atSubitemURL:v9];
LABEL_9:
  if ((_nodeHasPresentersExcludingPresenter(self->super._itemLocation, (uint64_t)self) & 1) == 0) {
    [(id)_nearestPresenterInterestedInSubitemPresenters(self->super._itemLocation) observePresenterChange:1 atSubitemURL:v11];
  }
LABEL_11:
  watcher = self->_watcher;
  if (watcher)
  {
    v13 = self->super._itemLocation;
    if (v13)
    {
      [(NSFileWatcher *)watcher setURL:[(NSFileAccessNode *)v13 url]];
    }
    else
    {
      [(NSFileWatcher *)self->_watcher stop];
      [(NSFileWatcher *)self->_watcher setObserver:0];
    }
  }
  if (self->_processManager)
  {
    id v14 = [(NSFileAccessNode *)self->super._itemLocation url];
    if (v14)
    {
      v16[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    else
    {
      uint64_t v15 = 0;
    }
    [(NSFileAccessProcessManager *)self->_processManager setURLs:v15];
  }
}

uint64_t __38__NSFilePresenterProxy_allowedForURL___block_invoke(uint64_t a1, void *a2, char *a3)
{
  uint64_t v8 = [a2 fileSystemRepresentation];
  char v6 = 1;
  uint64_t result = sandbox_check_by_audit_token();
  if (result)
  {
    uint64_t result = objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", 0, v8);
    char v6 = result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  *a3 = v6;
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  [(NSFileAccessProcessManager *)self->_processManager invalidate];

  v4.receiver = self;
  v4.super_class = (Class)NSFilePresenterProxy;
  [(NSFileReactorProxy *)&v4 dealloc];
}

- (id)_clientProxy
{
  return self->_remotePresenter;
}

- (BOOL)shouldSendObservationMessageWithPurposeID:(id)a3
{
  return ![a3 isEqual:self->super._reactorID] || self->_inSubarbiter;
}

- (void)forwardUsingProxy:(id)a3
{
  forwardedMessenger = self->_forwardedMessenger;
  if (!forwardedMessenger)
  {
    forwardedMessenger = [[NSFilePresenterXPCMessenger alloc] initWithFilePresenterProxy:self];
    self->_forwardedMessenger = forwardedMessenger;
  }
  objc_msgSend(a3, "addPresenter:withID:fileURL:lastPresentedItemEventIdentifier:ubiquityAttributes:options:responses:", forwardedMessenger, self->super._reactorID, -[NSFileAccessNode url](self->super._itemLocation, "url"), 0, self->_observedUbiquityAttributes, 2 * self->_usesMainThreadDuringRelinquishing, self->_filePresenterResponses);
}

- (void)invalidate
{
  [(NSFilePresenterXPCMessenger *)self->_forwardedMessenger invalidate];

  self->_forwardedMessenger = 0;

  [(NSFilePresenterProxy *)self setFilePresenterResponses:0];
}

- (void)_settleNonCoordinatedChanges
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_didObserveNonCoordinatedChanges)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id reactorID = self->super._reactorID;
      int v5 = 138543362;
      id v6 = reactorID;
      _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ settling non-coordinated events", (uint8_t *)&v5, 0xCu);
    }
    if (self->_didObserveMovingByWriter) {
      [(NSFileWatcher *)self->_watcher setURL:[(NSFileAccessNode *)self->super._itemLocation url]];
    }
    [(NSFileWatcher *)self->_watcher settle];
    self->_didObserveMovingByWriter = 0;
    self->_didObserveNonCoordinatedChanges = 0;
  }
}

uint64_t __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _settleNonCoordinatedChanges];
}

uint64_t __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t result = [*(id *)(result + 32) shouldSendObservationMessageWithPurposeID:*(void *)(*(void *)(result + 32) + 80)];
    if (result)
    {
      objc_super v4 = *(void **)(*(void *)(v3 + 32) + 40);
      return [v4 observeChangeWithSubitemURL:a2];
    }
  }
  return result;
}

uint64_t __64__NSFilePresenterProxy_startObservingApplicationStateWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) logSuspensionWarning];
}

- (void)stopObservingApplicationState
{
  [(NSFileAccessProcessManager *)self->_processManager invalidate];

  self->_processManager = 0;
  id remotePresenter = self->_remotePresenter;

  [remotePresenter setProcessManager:0];
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 resultHandler:(id)a6
{
}

+ (id)urlWithItemURL:(id)a3 subitemPath:(id)a4
{
  id result = (id)[a4 count];
  if (result)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "path"), "stringByAppendingPathComponent:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", a4));
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v8 fileURLWithPath:v7];
  }
  return result;
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemPath:(id)a6 resultHandler:(id)a7
{
  v12 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", +[NSFilePresenterProxy urlWithItemURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] subitemPath:a6], 0);

  [(NSFilePresenterProxy *)self forwardRelinquishmentForWritingClaim:1 withID:a3 purposeID:a5 subitemURL:v12 options:a4 completionHandler:a7];
}

- (void)saveChangesWithCompletionHandler:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id remotePresenter = self->_remotePresenter;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E51F7F08;
  v7[4] = a3;
  int v5 = (void *)[remotePresenter remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke_92;
  v6[3] = &unk_1E51F7F08;
  v6[4] = a3;
  [v5 saveChangesWithCompletionHandler:v6];
}

uint64_t __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"saveChanges";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)accommodateDeletionWithSubitemPath:(id)a3 completionHandler:(id)a4
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v6 = +[NSFilePresenterProxy urlWithItemURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] subitemPath:a3];
  id remotePresenter = self->_remotePresenter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke;
  v11[3] = &unk_1E51F7F08;
  v11[4] = a4;
  __int16 v8 = (void *)[remotePresenter remoteObjectProxyWithErrorHandler:v11];
  uint64_t v9 = +[NSURLPromisePair pairWithLogicalURL:v6 physicalURL:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke_96;
  v10[3] = &unk_1E51F7F08;
  v10[4] = a4;
  [v8 accommodateDeletionOfSubitemAtURL:v9 completionHandler:v10];
}

uint64_t __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"accommodateDeletion";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeMoveByWriterWithPurposeID:(id)a3 withPhysicalDestinationURL:(id)a4 withFSID:(fsid)a5 andFileID:(unint64_t)a6
{
  self->_didObserveMovingByWriter = 1;
  uint64_t v10 = +[NSURLPromisePair pairWithLogicalURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] physicalURL:a4];
  if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:a3])
  {
    id remotePresenter = self->_remotePresenter;
    [remotePresenter observeMoveToURL:v10 withSubitemURL:0 byWriterWithPurposeID:a3 withFSID:a5 andFileID:a6];
  }
}

- (void)observeMoveOfSubitemAtURL:(id)a3 toURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  if (!a3) {
    self->_didObserveMovingByWriter = 1;
  }
  if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:a5])
  {
    id remotePresenter = self->_remotePresenter;
    [remotePresenter observeMoveToURL:a4 withSubitemURL:a3 byWriterWithPurposeID:a5 withFSID:a6 andFileID:a7];
  }
}

- (void)observeDisconnectionByWriterWithPurposeID:(id)a3
{
  if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:a3])
  {
    [self->_remotePresenter observeDisconnection];
  }
  [(NSFileWatcher *)self->_watcher stop];

  [(NSFilePresenterProxy *)self disconnect];
}

- (void)observeReconnectionByWriterWithPurposeID:(id)a3
{
  if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:a3])
  {
    id remotePresenter = self->_remotePresenter;
    [remotePresenter observeReconnection];
  }
}

- (void)observeUbiquityChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4
{
  int v5 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", +[NSFilePresenterProxy urlWithItemURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] subitemPath:a3], a4);
  if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:self->_currentWriterPurposeID])
  {
    id remotePresenter = self->_remotePresenter;
    [remotePresenter observeUbiquityChangeWithSubitemURL:v5];
  }
}

- (void)observeSharingChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4
{
  int v5 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:](NSURLPromisePair, "pairWithLogicalURL:physicalURL:", +[NSFilePresenterProxy urlWithItemURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] subitemPath:a3], a4);
  if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:self->_currentWriterPurposeID])
  {
    id remotePresenter = self->_remotePresenter;
    [remotePresenter observeSharingChangeWithSubitemURL:v5];
  }
}

- (void)observeChangeOfUbiquityAttributes:(id)a3
{
  observedUbiquityAttributes = self->_observedUbiquityAttributes;
  if (!observedUbiquityAttributes
    || [(NSSet *)observedUbiquityAttributes count]
    && (int v6 = (void *)[a3 mutableCopy],
        [v6 intersectSet:self->_observedUbiquityAttributes],
        a3 = v6,
        [a3 count]))
  {
    if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:self->_currentWriterPurposeID])
    {
      id remotePresenter = self->_remotePresenter;
      [remotePresenter observeChangeOfUbiquityAttributes:a3];
    }
  }
}

- (void)observeDisappearanceAtSubitemPath:(id)a3
{
  if ([a3 count])
  {
    id v5 = +[NSFilePresenterProxy urlWithItemURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] subitemPath:a3];
    if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:self->_currentWriterPurposeID])
    {
      id remotePresenter = self->_remotePresenter;
      uint64_t v7 = +[NSURLPromisePair pairWithLogicalURL:v5 physicalURL:0];
      [remotePresenter observeChangeWithSubitemURL:v7];
    }
  }
}

- (void)observeChangeAtSubitemPath:(id)a3
{
  id v4 = +[NSFilePresenterProxy urlWithItemURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] subitemPath:a3];
  if ([(NSFilePresenterProxy *)self shouldSendObservationMessageWithPurposeID:self->_currentWriterPurposeID])
  {
    id remotePresenter = self->_remotePresenter;
    int v6 = +[NSURLPromisePair pairWithLogicalURL:v4 physicalURL:0];
    [remotePresenter observeChangeWithSubitemURL:v6];
  }
}

- (void)observeVersionChangeOfKind:(id)a3 withClientID:(id)a4 name:(id)a5 subitemPath:(id)a6
{
  self->_didObserveVersionChangingByWriter = 1;
  id v10 = +[NSFilePresenterProxy urlWithItemURL:[(NSFileAccessNode *)self->super._itemLocation standardizedURL] subitemPath:a6];
  id remotePresenter = self->_remotePresenter;
  v12 = +[NSURLPromisePair pairWithLogicalURL:v10 physicalURL:0];

  [remotePresenter observeVersionChangeOfKind:a3 toItemAtURL:v12 withClientID:a4 name:a5];
}

- (void)observePresenterChange:(BOOL)a3 atSubitemURL:(id)a4
{
  if (!self->_inSubarbiter)
  {
    BOOL v4 = a3;
    id remotePresenter = self->_remotePresenter;
    int v6 = +[NSURLPromisePair pairWithLogicalURL:a4 physicalURL:0];
    [remotePresenter observePresenterChange:v4 forSubitemAtURL:v6];
  }
}

- (void)observeNewProvider:(id)a3
{
  if (!self->_inSubarbiter)
  {
    id remotePresenter = self->_remotePresenter;
    uint64_t v4 = [a3 reactorID];
    [remotePresenter setProviderPurposeIdentifier:v4];
  }
}

- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 purposeID:(id)a5 subitemURL:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  id v10 = a6;
  BOOL v13 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3 && self->_watcher)
  {
    [(NSFilePresenterProxy *)self _settleNonCoordinatedChanges];
    id currentWriterPurposeID = self->_currentWriterPurposeID;
    self->_id currentWriterPurposeID = (id)[a5 copy];
    ++self->_writingRelinquishmentCount;
    if (currentWriterPurposeID)
    {
      previousWriterPurposeIDs = self->_previousWriterPurposeIDs;
      if (!previousWriterPurposeIDs)
      {
        previousWriterPurposeIDs = (NSMutableArray *)objc_opt_new();
        self->_previousWriterPurposeIDs = previousWriterPurposeIDs;
      }
      [(NSMutableArray *)previousWriterPurposeIDs addObject:currentWriterPurposeID];
    }
    long long v17 = v29;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2;
    v29[3] = &unk_1E51FC970;
    v29[4] = self;
    id v10 = a6;
  }
  else
  {
    long long v17 = &__block_literal_global_77;
  }
  if ([a5 isEqual:self->super._reactorID] && !self->_inSubarbiter)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_3;
    v23[3] = &unk_1E51FDBE8;
    v23[4] = v17;
    (*((void (**)(id, uint64_t, void, void *))a8 + 2))(a8, 1, 0, v23);
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_100;
    v27[3] = &unk_1E51FDBC0;
    v27[4] = self;
    v27[5] = a4;
    v27[6] = a8;
    v27[7] = v17;
    BOOL v28 = v13;
    id remotePresenter = self->_remotePresenter;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_109;
    v26[3] = &unk_1E51F7F08;
    v26[4] = v27;
    v19 = (void *)[remotePresenter remoteObjectProxyWithErrorHandler:v26];
    uint64_t v20 = _NSFCPresenterLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id reactorID = self->super._reactorID;
      *(_DWORD *)buf = 138543618;
      id v31 = reactorID;
      __int16 v32 = 2114;
      id v33 = a4;
      _os_log_impl(&dword_181795000, v20, OS_LOG_TYPE_DEFAULT, "Asking presenter %{public}@ to relinquish to claim %{public}@", buf, 0x16u);
    }
    if (v13)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_113;
      v25[3] = &unk_1E51F7F08;
      v25[4] = v27;
      [v19 relinquishToWritingClaimWithID:a4 options:a7 purposeID:a5 subitemURL:v10 completionHandler:v25];
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_114;
      v24[3] = &unk_1E51F7F08;
      v24[4] = v27;
      [v19 relinquishToReadingClaimWithID:a4 options:a7 purposeID:a5 completionHandler:v24];
    }
  }
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 72))
  {
    uint64_t v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "A file presenter is being asked to reacquire from a writer more times than it's been asked to relinquish", buf, 2u);
    }
  }
  --*(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 72))
  {

    *(void *)(*(void *)(a1 + 32) + 80) = [*(id *)(*(void *)(a1 + 32) + 88) lastObject];
    [*(id *)(*(void *)(a1 + 32) + 88) removeLastObject];
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }
  else
  {
    int v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v7;
      _os_log_impl(&dword_181795000, v6, OS_LOG_TYPE_INFO, "Deferring presenter %{public}@ reaquistion for .5 seconds", buf, 0xCu);
    }
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_99;
    v11[3] = &unk_1E51F9B10;
    v11[4] = v9;
    v11[5] = a2;
    dispatch_after(v8, v10, v11);
  }
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_99(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 64), "setURL:", objc_msgSend(*(id *)(v2 + 24), "url"));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 64) settle];

  *(void *)(*(void *)(a1 + 32) + 80) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = _NSFCPresenterLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    _os_log_impl(&dword_181795000, v6, OS_LOG_TYPE_DEFAULT, "Received relinquishment reply for presenter %{public}@ to claim %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_101;
  v15[3] = &unk_1E51FDB98;
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  char v18 = a2;
  long long v16 = *(_OWORD *)(a1 + 32);
  char v19 = *(unsigned char *)(a1 + 64);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, a2, a3, v15, v7, v8, v9, v10);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_101(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_102;
  v4[3] = &unk_1E51FDB70;
  __int16 v7 = *(_WORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = a2;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_102(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = _NSFCPresenterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v3;
      _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Telling presenter %{public}@ to reacquire after claim %{public}@", buf, 0x16u);
    }
    long long v5 = *(void **)(*(void *)(a1 + 32) + 40);
    if (*(unsigned char *)(a1 + 57))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_103;
      v13[3] = &unk_1E51F7F08;
      v13[4] = *(void *)(a1 + 48);
      uint64_t v6 = (void *)[v5 remoteObjectProxyWithErrorHandler:v13];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_107;
      v12[3] = &unk_1E51FC6A8;
      v12[4] = *(void *)(a1 + 32);
      return [v6 reacquireFromWritingClaimForID:*(void *)(a1 + 40) completionHandler:v12];
    }
    else
    {
      [v5 reacquireFromReadingClaimForID:*(void *)(a1 + 40)];
      uint64_t v9 = _NSFCPresenterLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v11;
        __int16 v16 = 2114;
        uint64_t v17 = v10;
        _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_INFO, "Not waiting for reacquisition reply for presenter %{public}@ after claim %{public}@", buf, 0x16u);
      }
      return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v8();
  }
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_103(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    __int16 v7 = @"reacquire";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_107(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(a1[4] + 16);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Received reacquisition reply for presenter %{public}@ after claim %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_109(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"relinquish";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_4;
  v8[3] = &unk_1E51F8650;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v8, a3, a4, a5, a6);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disconnect
{
  self->_disconnected = 1;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)promisedFileWasFulfilled
{
}

- (void)localFileWasEvicted
{
}

- (void)setInSubarbiter:(BOOL)a3
{
  self->_inSubarbiter = a3;
}

- (BOOL)usesMainThreadDuringReliquishing
{
  return self->_usesMainThreadDuringRelinquishing;
}

- (NSSet)observedUbiquityAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (unint64_t)filePresenterResponses
{
  return self->_filePresenterResponses;
}

@end