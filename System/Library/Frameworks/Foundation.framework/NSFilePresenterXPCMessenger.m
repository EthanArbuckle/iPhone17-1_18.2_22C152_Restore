@interface NSFilePresenterXPCMessenger
- (NSFilePresenterXPCMessenger)initWithFilePresenter:(id)a3 queue:(id)a4;
- (NSFilePresenterXPCMessenger)initWithFilePresenterProxy:(id)a3;
- (id)_readRelinquishment;
- (id)_writeRelinquishment;
- (void)_makePresenter:(id)a3 accommodateDeletionWithSubitemURL:(id)a4 completionHandler:(id)a5;
- (void)_makePresenter:(id)a3 accommodateDisconnectionWithCompletionHandler:(id)a4;
- (void)_makePresenter:(id)a3 accommodateEvictionWithSubitemURL:(id)a4 completionHandler:(id)a5;
- (void)_makePresenter:(id)a3 observeChangeOfUbiquityAttributes:(id)a4;
- (void)_makePresenter:(id)a3 observeChangeWithSubitemURL:(id)a4;
- (void)_makePresenter:(id)a3 observeMoveToURL:(id)a4 withSubitemURL:(id)a5;
- (void)_makePresenter:(id)a3 observeSharingChangeWithSubitemURL:(id)a4;
- (void)_makePresenter:(id)a3 observeUbiquityChangeWithSubitemURL:(id)a4;
- (void)_makePresenter:(id)a3 observeVersionChangeOfKind:(id)a4 withClientID:(id)a5 name:(id)a6 subitemURL:(id)a7;
- (void)_makePresenter:(id)a3 relinquishToAccessClaimWithID:(id)a4 purposeID:(id)a5 ifNecessaryUsingSelector:(SEL)a6 recordingRelinquishment:(id)a7 continuer:(id)a8;
- (void)_makePresenter:(id)a3 relinquishToReadingClaimWithID:(id)a4 purposeID:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)_makePresenter:(id)a3 relinquishToWritingClaimWithID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 completionHandler:(id)a8;
- (void)_makePresenter:(id)a3 reportUnsavedChangesWithCompletionHandler:(id)a4;
- (void)_makePresenter:(id)a3 saveChangesWithCompletionHandler:(id)a4;
- (void)_makePresenter:(id)a3 setLastPresentedItemEventIdentifier:(unint64_t)a4;
- (void)_makePresenter:(id)a3 setProviderPurposeIdentifier:(id)a4;
- (void)_makePresenter:(id)a3 validateRelinquishmentToSubitemAtURL:(id)a4 completionHandler:(id)a5;
- (void)_makePresenter:(id)a3 validateRemoteDeletionRecordingRelinquishment:(id)a4 completionHandler:(id)a5;
- (void)_makePresenterObserveDisconnection:(id)a3;
- (void)_makePresenterObserveReconnection:(id)a3;
- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4;
- (void)collectDebuggingInformationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)logSuspensionWarning;
- (void)observeChangeOfUbiquityAttributes:(id)a3;
- (void)observeChangeWithSubitemURL:(id)a3;
- (void)observeDisconnection;
- (void)observeMoveToURL:(id)a3 withSubitemURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7;
- (void)observePresenterChange:(BOOL)a3 forSubitemAtURL:(id)a4;
- (void)observeReconnection;
- (void)observeSharingChangeWithSubitemURL:(id)a3;
- (void)observeUbiquityChangeWithSubitemURL:(id)a3;
- (void)observeVersionChangeOfKind:(id)a3 toItemAtURL:(id)a4 withClientID:(id)a5 name:(id)a6;
- (void)reacquireFromReadingClaimForID:(id)a3;
- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4;
- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6;
- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7;
- (void)saveChangesWithCompletionHandler:(id)a3;
- (void)setProviderPurposeIdentifier:(id)a3;
- (void)updateLastEventID:(unint64_t)a3;
@end

@implementation NSFilePresenterXPCMessenger

- (NSFilePresenterXPCMessenger)initWithFilePresenter:(id)a3 queue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFilePresenterXPCMessenger;
  v6 = [(NSFilePresenterXPCMessenger *)&v8 init];
  if (v6)
  {
    v6->_filePresenter = (NSFilePresenter *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

- (NSFilePresenterXPCMessenger)initWithFilePresenterProxy:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFilePresenterXPCMessenger;
  v4 = [(NSFilePresenterXPCMessenger *)&v6 init];
  if (v4) {
    v4->_filePresenterProxy = (NSFilePresenterProxy *)a3;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSFilePresenterXPCMessenger;
  [(NSFilePresenterXPCMessenger *)&v4 dealloc];
}

- (void)invalidate
{
  self->_filePresenter = 0;
  self->_filePresenterProxy = 0;
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6
{
  v15[5] = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke;
    v15[3] = &unk_1E51F7F08;
    v15[4] = a6;
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter relinquishToReadingClaimWithID:a3 purposeID:a5 options:a4 completionHandler:v15];
  }
  else if (self->_filePresenterProxy)
  {
    id v13 = [+[NSXPCConnection currentConnection] userInfo];
    if (object_getClass(v13) != (Class)NSFileSubarbitrationClaim) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSFileAccessArbiter.m", 3328, @"Wrong class in connection userInfo: %@", objc_opt_class() object file lineNumber description];
    }
    if ([v13 isRevoked]) {
      NSLog((NSString *)@"NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked");
    }
    [v13 forwardRelinquishmentForWritingClaim:0 withID:a3 options:a4 purposeID:a5 subitemURL:0 toPresenter:self->_filePresenterProxy usingReplySender:a6];
  }
  else
  {
    v14 = (void (*)(id, void))*((void *)a6 + 2);
    v14(a6, 0);
  }
}

uint64_t __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke_2;
  v4[3] = &unk_1E51F7EE0;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:v4];
}

uint64_t __98__NSFilePresenterXPCMessenger_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7
{
  v18[10] = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v14 = [a6 URL];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
    v18[3] = &unk_1E51FD630;
    v18[4] = self;
    v18[5] = a3;
    v18[6] = a5;
    v18[7] = a6;
    v18[8] = a7;
    v18[9] = a4;
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter validateRelinquishmentToSubitemAtURL:v14 completionHandler:v18];
  }
  else if (self->_filePresenterProxy)
  {
    id v16 = [+[NSXPCConnection currentConnection] userInfo];
    if (object_getClass(v16) != (Class)NSFileSubarbitrationClaim) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSFileAccessArbiter.m", 3364, @"Wrong class in connection userInfo: %@", objc_opt_class() object file lineNumber description];
    }
    if ([v16 isRevoked]) {
      NSLog((NSString *)@"NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked");
    }
    [v16 forwardRelinquishmentForWritingClaim:1 withID:a3 options:a4 purposeID:a5 subitemURL:a6 toPresenter:self->_filePresenterProxy usingReplySender:a7];
  }
  else
  {
    v17 = (void (*)(id, void))*((void *)a7 + 2);
    v17(a7, 0);
  }
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke(void *a1, int a2)
{
  v10[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = (void *)a1[4];
    uint64_t v2 = a1[5];
    uint64_t v4 = v3[1];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2;
    v10[3] = &unk_1E51F7F08;
    uint64_t v7 = a1[9];
    v10[4] = a1[8];
    return [v3 _makePresenter:v4 relinquishToWritingClaimWithID:v2 options:v7 purposeID:v5 subitemURL:v6 completionHandler:v10];
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(void))(a1[8] + 16);
    return v9();
  }
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3;
  v4[3] = &unk_1E51F7EE0;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:v4];
}

uint64_t __109__NSFilePresenterXPCMessenger_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reacquireFromReadingClaimForID:(id)a3
{
  if (self->_filePresenter)
  {
    id v5 = [(NSFilePresenterXPCMessenger *)self _readRelinquishment];
    [v5 removeBlockingAccessClaimID:a3];
  }
  else if (self->_filePresenterProxy)
  {
    id v7 = [+[NSXPCConnection currentConnection] userInfo];
    if (object_getClass(v7) != (Class)NSFileSubarbitrationClaim) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSFileAccessArbiter.m", 3391, @"Wrong class in connection userInfo: %@", objc_opt_class() object file lineNumber description];
    }
    if ([v7 isRevoked]) {
      NSLog((NSString *)@"NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked");
    }
    id v8 = [(NSFileReactorProxy *)self->_filePresenterProxy reactorID];
    [v7 forwardReacquisitionForWritingClaim:0 withID:a3 toPresenterForID:v8 usingReplySender:0];
  }
}

- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4
{
  if (self->_filePresenter)
  {
    id v7 = [(NSFilePresenterXPCMessenger *)self _writeRelinquishment];
    [v7 removeBlockingAccessClaimID:a3 thenContinue:a4];
  }
  else if (self->_filePresenterProxy)
  {
    id v9 = [+[NSXPCConnection currentConnection] userInfo];
    if (object_getClass(v9) != (Class)NSFileSubarbitrationClaim) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSFileAccessArbiter.m", 3414, @"Wrong class in connection userInfo: %@", objc_opt_class() object file lineNumber description];
    }
    if ([v9 isRevoked]) {
      NSLog((NSString *)@"NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked");
    }
    id v10 = [(NSFileReactorProxy *)self->_filePresenterProxy reactorID];
    [v9 forwardReacquisitionForWritingClaim:1 withID:a3 toPresenterForID:v10 usingReplySender:a4];
  }
  else
  {
    v11 = (void (*)(id))*((void *)a4 + 2);
    v11(a4);
  }
}

- (void)saveChangesWithCompletionHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E51F7F08;
    v6[4] = a3;
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter saveChangesWithCompletionHandler:v6];
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v4 = _NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v4, OS_LOG_TYPE_FAULT, "A server unexpectedly received a saveChangesWithCompletionHandler: message", buf, 2u);
    }
  }
  else
  {
    id v5 = (void (*)(id, void))*((void *)a3 + 2);
    v5(a3, 0);
  }
}

uint64_t __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E51F7EE0;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:v4];
}

uint64_t __64__NSFilePresenterXPCMessenger_saveChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v7 = [a3 URL];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke;
    v10[3] = &unk_1E51F7F08;
    v10[4] = a4;
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter accommodateDeletionWithSubitemURL:v7 completionHandler:v10];
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v8 = _NSFCPresenterLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v8, OS_LOG_TYPE_FAULT, "A server unexpectedly received a accommodateDeletionOfSubitemAtURL: message", buf, 2u);
    }
  }
  else
  {
    id v9 = (void (*)(id, void))*((void *)a4 + 2);
    v9(a4, 0);
  }
}

uint64_t __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke_2;
  v4[3] = &unk_1E51F7EE0;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = a2;
  v4[5] = v2;
  return +[NSFileCoordinator _performBarrierAsync:v4];
}

uint64_t __83__NSFilePresenterXPCMessenger_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)observeChangeWithSubitemURL:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v5 = [a3 URL];
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter observeChangeWithSubitemURL:v5];
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_181795000, v6, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeChangeWithSubitemURL: message", v7, 2u);
    }
  }
}

- (void)observeMoveToURL:(id)a3 withSubitemURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  if (self->_filePresenter)
  {
    objc_msgSend(a3, "logicalURL", a3, a4, a5);
    _CFURLNoteSecurityScopedResourceMoved();
    filePresenter = self->_filePresenter;
    uint64_t v13 = [a3 URL];
    uint64_t v14 = [a4 URL];
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter observeMoveToURL:v13 withSubitemURL:v14];
  }
  else if (self->_filePresenterProxy)
  {
    id v17 = [+[NSXPCConnection currentConnection] userInfo];
    if (object_getClass(v17) != (Class)NSFileSubarbitrationClaim) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSFileAccessArbiter.m", 3510, @"Wrong class in connection userInfo: %@", objc_opt_class() object file lineNumber description];
    }
    if ([v17 isRevoked]) {
      NSLog((NSString *)@"NSFileCoordinator: A surprising subarbiter message was received after the subarbitration claim was revoked");
    }
    filePresenterProxy = self->_filePresenterProxy;
    [(NSFilePresenterProxy *)filePresenterProxy observeMoveOfSubitemAtURL:a4 toURL:a3 byWriterWithPurposeID:a5 withFSID:a6 andFileID:a7];
  }
}

- (void)observeDisconnection
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenterObserveDisconnection:](self, "_makePresenterObserveDisconnection:");
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v2 = _NSFCPresenterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl(&dword_181795000, v2, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeDisconnection message", v3, 2u);
    }
  }
}

- (void)observeReconnection
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenterObserveReconnection:](self, "_makePresenterObserveReconnection:");
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v2 = _NSFCPresenterLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_fault_impl(&dword_181795000, v2, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeReconnection message", v3, 2u);
    }
  }
}

- (void)observeUbiquityChangeWithSubitemURL:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v5 = [a3 URL];
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter observeUbiquityChangeWithSubitemURL:v5];
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_181795000, v6, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeUbiquityChangeWithSubitemURL: message", v7, 2u);
    }
  }
}

- (void)observeSharingChangeWithSubitemURL:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v5 = [a3 URL];
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter observeSharingChangeWithSubitemURL:v5];
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_181795000, v6, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeSharingChangeWithSubitemURL: message", v7, 2u);
    }
  }
}

- (void)observeChangeOfUbiquityAttributes:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:observeChangeOfUbiquityAttributes:](self, "_makePresenter:observeChangeOfUbiquityAttributes:");
  }
  else if (self->_filePresenterProxy)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_181795000, v3, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeChangeOfUbiquityAttributes: message", v4, 2u);
    }
  }
}

- (void)observeVersionChangeOfKind:(id)a3 toItemAtURL:(id)a4 withClientID:(id)a5 name:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  filePresenter = self->_filePresenter;
  if (filePresenter)
  {
    uint64_t v11 = [a4 URL];
    [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter observeVersionChangeOfKind:a3 withClientID:a5 name:a6 subitemURL:v11];
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v12 = _NSFCPresenterLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_fault_impl(&dword_181795000, v12, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observeVersionChangeOfKind: message", v13, 2u);
    }
  }
}

- (void)observePresenterChange:(BOOL)a3 forSubitemAtURL:(id)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:self->_filePresenter];
    uint64_t v8 = _NSFCPresenterLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543875;
      id v15 = v7;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      __int16 v18 = 2113;
      id v19 = a4;
      _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe presenter change: %d at %{private}@", buf, 0x1Cu);
    }
    id v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:self->_filePresenter withDescription:@"Observe Presenter Change"];
    id v10 = (void *)[(NSFilePresenter *)self->_filePresenter presentedItemOperationQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__NSFilePresenterXPCMessenger_observePresenterChange_forSubitemAtURL___block_invoke;
    v12[3] = &unk_1E51FD658;
    v12[4] = v9;
    v12[5] = self;
    BOOL v13 = v5;
    v12[6] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v12);
  }
  else if (self->_filePresenterProxy)
  {
    uint64_t v11 = _NSFCPresenterLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v11, OS_LOG_TYPE_FAULT, "A server unexpectedly received a observePresenterChange: message", buf, 2u);
    }
  }
}

uint64_t __70__NSFilePresenterXPCMessenger_observePresenterChange_forSubitemAtURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "presentedSubitemHasPresenters:atURL:", *(unsigned __int8 *)(a1 + 56), objc_msgSend(*(id *)(a1 + 48), "URL"));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)updateLastEventID:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:setLastPresentedItemEventIdentifier:](self, "_makePresenter:setLastPresentedItemEventIdentifier:");
  }
  else if (self->_filePresenterProxy)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_181795000, v3, OS_LOG_TYPE_FAULT, "A server unexpectedly received a updateLastEventID: message", v4, 2u);
    }
  }
}

- (void)setProviderPurposeIdentifier:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_filePresenter)
  {
    -[NSFilePresenterXPCMessenger _makePresenter:setProviderPurposeIdentifier:](self, "_makePresenter:setProviderPurposeIdentifier:");
  }
  else if (self->_filePresenterProxy)
  {
    v3 = _NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_181795000, v3, OS_LOG_TYPE_FAULT, "A server unexpectedly received a setProviderPurposeIdentifier: message", v4, 2u);
    }
  }
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
  id v4 = +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation];
  uint64_t v5 = (void (*)(id, id))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)logSuspensionWarning
{
  filePresenter = self->_filePresenter;
  if (filePresenter) {
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"File presenter %@ with presentedItemURL %@", filePresenter, objc_msgSend((id)-[NSFilePresenter presentedItemURL](self->_filePresenter, "presentedItemURL"), "path"));
  }
  else {
    v3 = (NSString *)@"An unknown file presenter";
  }
  NSLog((NSString *)@"%@ was still registered at the time this application was suspended, and implements one or more NSFilePresenter messages requiring a response. For NSFilePresenters for file system locations that are accessible to other processes (e.g. iCloud or group containers), you should either call removeFilePresenter: when the process is backgrounded, or remove any implementations of NSFilePresenter methods requiring a response. Otherwise, the system will kill your process instead of risking deadlock.", v3);
}

- (void)_makePresenter:(id)a3 saveChangesWithCompletionHandler:(id)a4
{
  v9[8] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_opt_respondsToSelector())
  {
    id v7 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Save Changes"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E51FD6A8;
    v9[4] = a3;
    v9[5] = v7;
    v9[6] = self;
    v9[7] = a4;
    objc_msgSend((id)objc_msgSend(a3, "presentedItemOperationQueue"), "addOperation:", +[NSFilePresenterAsynchronousOperation operationWithBlock:](NSFilePresenterAsynchronousOperation, "operationWithBlock:", v9));
  }
  else
  {
    uint64_t v8 = (void (*)(id, void))*((void *)a4 + 2);
    v8(a4, 0);
  }
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 32)];
  uint64_t v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ savePresentedItemChanges", buf, 0xCu);
  }
  [*(id *)(a1 + 40) didBegin];
  uint64_t v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_476;
  v9[3] = &unk_1E51FD900;
  v9[4] = v4;
  long long v10 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v11 = a2;
  uint64_t v12 = v7;
  return [v6 savePresentedItemChangesWithCompletionHandler:v9];
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_476(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished savePresentedItemChanges", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_477;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  block[5] = a2;
  block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
  return [*(id *)(a1 + 56) finish];
}

uint64_t __79__NSFilePresenterXPCMessenger__makePresenter_saveChangesWithCompletionHandler___block_invoke_477(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_makePresenter:(id)a3 reportUnsavedChangesWithCompletionHandler:(id)a4
{
  v11[9] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_opt_respondsToSelector())
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:a3];
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Report Unsaved Changes"];
    id v9 = (void *)[a3 presentedItemOperationQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E51FA018;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = a3;
    v11[7] = self;
    v11[8] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v7, v11);
  }
  else
  {
    long long v10 = (void (*)(id, void))*((void *)a4 + 2);
    v10(a4, 0);
  }
}

uint64_t __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ reportUnsavedChanges", buf, 0xCu);
  }
  [*(id *)(a1 + 40) didBegin];
  id v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_484;
  v7[3] = &unk_1E51FD1D0;
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v9 = v5;
  return [v4 presentedItemHasUnsavedChangesWithCompletionHandler:v7];
}

void __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_484(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = "NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      long long v5 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    id v14 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reportUnsavedChanges with reply: %s", buf, 0x16u);
  }
  [*(id *)(a1 + 40) willEnd];
  id v7 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_487;
  block[3] = &unk_1E51FD6D0;
  uint64_t v8 = *(void *)(a1 + 56);
  block[4] = *(void *)(a1 + 40);
  block[5] = v8;
  char v10 = a2;
  dispatch_async(v7, block);
}

uint64_t __88__NSFilePresenterXPCMessenger__makePresenter_reportUnsavedChangesWithCompletionHandler___block_invoke_487(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  id v4 = *(uint64_t (**)(uint64_t, NSNumber *))(v2 + 16);

  return v4(v2, v3);
}

- (void)_makePresenter:(id)a3 validateRemoteDeletionRecordingRelinquishment:(id)a4 completionHandler:(id)a5
{
  void v10[6] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke;
    v10[3] = &unk_1E51FD6F8;
    v10[4] = a3;
    void v10[5] = self;
    [a4 performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock:v10 withReply:a5];
  }
  else
  {
    long long v9 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v9(a5, 1);
  }
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 32)];
  id v5 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:*(void *)(a1 + 32) withDescription:@"Validate Deletion"];
  uint64_t v6 = (void *)[*(id *)(a1 + 32) presentedItemOperationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_2;
  v8[3] = &unk_1E51FA018;
  v8[4] = v4;
  v8[5] = v5;
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t v10 = a2;
  return objc_msgSend(v6, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ validatePresentedItemDeletion", buf, 0xCu);
  }
  [*(id *)(a1 + 40) didBegin];
  id v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_493;
  v7[3] = &unk_1E51FD1D0;
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v9 = v5;
  return [v4 validatePresentedItemRemoteDeletionWithCompletionHandler:v7];
}

void __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_493(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = "NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      long long v5 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    id v14 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished validatePresentedItemDeletion with reply: %s", buf, 0x16u);
  }
  [*(id *)(a1 + 40) willEnd];
  id v7 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_494;
  block[3] = &unk_1E51FD6D0;
  uint64_t v8 = *(void *)(a1 + 56);
  block[4] = *(void *)(a1 + 40);
  block[5] = v8;
  char v10 = a2;
  dispatch_async(v7, block);
}

uint64_t __110__NSFilePresenterXPCMessenger__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler___block_invoke_494(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_makePresenter:(id)a3 accommodateDeletionWithSubitemURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  if (a4)
  {
    if (objc_opt_respondsToSelector())
    {
      id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Accommodate Subitem Deletion"];
      uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke;
      v27 = &unk_1E51FC810;
      id v28 = v9;
      id v29 = a4;
      id v30 = v10;
      id v31 = a3;
      v32 = self;
      id v33 = a5;
      uint64_t v12 = &v24;
LABEL_6:
      objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v9, v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
        v30,
        v31,
        v32,
        v33);
      return;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Accommodate Deletion"];
    uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    BOOL v17 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_2;
    __int16 v18 = &unk_1E51FA018;
    id v19 = v9;
    id v20 = v13;
    id v21 = a3;
    v22 = self;
    id v23 = a5;
    uint64_t v12 = &v15;
    goto LABEL_6;
  }
  id v14 = (void (*)(id, void))*((void *)a5 + 2);

  v14(a5, 0);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    uint64_t v12 = v3;
    __int16 v13 = 2113;
    uint64_t v14 = v4;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateSubitemDeletion for %{private}@", buf, 0x16u);
  }
  [*(id *)(a1 + 48) didBegin];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_501;
  v9[3] = &unk_1E51FD720;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = v7;
  long long v10 = *(_OWORD *)(a1 + 64);
  return [v6 accommodatePresentedSubitemDeletionAtURL:v5 completionHandler:v9];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_501(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateSubitemDeletion", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_502;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_502(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateDeletion", buf, 0xCu);
  }
  [*(id *)(a1 + 40) didBegin];
  uint64_t v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_508;
  v7[3] = &unk_1E51FD720;
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v9 = v5;
  return [v4 accommodatePresentedItemDeletionWithCompletionHandler:v7];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_508(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateDeletion", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_509;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateDeletionWithSubitemURL_completionHandler___block_invoke_509(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_makePresenter:(id)a3 accommodateEvictionWithSubitemURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  if (a4)
  {
    if (objc_opt_respondsToSelector())
    {
      id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Accommodate Subitem Eviction"];
      uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke;
      v27 = &unk_1E51FC810;
      id v28 = v9;
      id v29 = a4;
      id v30 = v10;
      id v31 = a3;
      v32 = self;
      id v33 = a5;
      uint64_t v12 = &v24;
LABEL_6:
      objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v9, v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
        v30,
        v31,
        v32,
        v33);
      return;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Accommodate Eviction"];
    uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    BOOL v17 = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_2;
    __int16 v18 = &unk_1E51FA018;
    id v19 = v9;
    id v20 = v13;
    id v21 = a3;
    v22 = self;
    id v23 = a5;
    uint64_t v12 = &v15;
    goto LABEL_6;
  }
  uint64_t v14 = (void (*)(id, void))*((void *)a5 + 2);

  v14(a5, 0);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    uint64_t v12 = v3;
    __int16 v13 = 2113;
    uint64_t v14 = v4;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateSubitemEviction for %{private}@", buf, 0x16u);
  }
  [*(id *)(a1 + 48) didBegin];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_515;
  v9[3] = &unk_1E51FD720;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = v7;
  long long v10 = *(_OWORD *)(a1 + 64);
  return [v6 accommodatePresentedSubitemEvictionAtURL:v5 completionHandler:v9];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_515(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateSubitemEviction", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_516;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_516(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ accommodateEviction", buf, 0xCu);
  }
  [*(id *)(a1 + 40) didBegin];
  uint64_t v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_522;
  v7[3] = &unk_1E51FD720;
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v9 = v5;
  return [v4 accommodatePresentedItemEvictionWithCompletionHandler:v7];
}

void __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_522(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished accommodateEviction", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_523;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
}

uint64_t __98__NSFilePresenterXPCMessenger__makePresenter_accommodateEvictionWithSubitemURL_completionHandler___block_invoke_523(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_makePresenter:(id)a3 accommodateDisconnectionWithCompletionHandler:(id)a4
{
  v11[9] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_opt_respondsToSelector())
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:a3];
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Accommodate Disconnection"];
    long long v9 = (void *)[a3 presentedItemOperationQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E51FA018;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = a3;
    v11[7] = self;
    v11[8] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v7, v11);
  }
  else
  {
    long long v10 = (void (*)(id, void))*((void *)a4 + 2);
    v10(a4, 0);
  }
}

uint64_t __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_INFO, "Making presenter %{public}@ accommodateDisconnection", buf, 0xCu);
  }
  [*(id *)(a1 + 40) didBegin];
  uint64_t v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_529;
  v7[3] = &unk_1E51FD720;
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v9 = v5;
  return [v4 accommodatePresentedItemDisconnectionWithCompletionHandler:v7];
}

void __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_529(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_INFO, "%{public}@ finished accommodateDisconnection", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_530;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  void block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
}

uint64_t __92__NSFilePresenterXPCMessenger__makePresenter_accommodateDisconnectionWithCompletionHandler___block_invoke_530(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_makePresenter:(id)a3 observeChangeWithSubitemURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  uint64_t v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ observe change", buf, 0xCu);
  }
  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Subitem Did Change"];
    long long v9 = (void *)[a3 presentedItemOperationQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_1E51FAD68;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    long long v10 = v13;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Did Change"];
    long long v9 = (void *)[a3 presentedItemOperationQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_1E51F6678;
    v12[4] = v11;
    v12[5] = a3;
    long long v10 = v12;
  }
  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willEnd];
  [*(id *)(a1 + 40) presentedSubitemDidChangeAtURL:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

uint64_t __74__NSFilePresenterXPCMessenger__makePresenter_observeChangeWithSubitemURL___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willEnd];
  [*(id *)(a1 + 40) presentedItemDidChange];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)_makePresenter:(id)a3 observeMoveToURL:(id)a4 withSubitemURL:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  long long v9 = _NSFCPresenterLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    id v19 = v8;
    __int16 v20 = 2113;
    id v21 = a4;
    _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ observe move to URL: %{private}@", buf, 0x16u);
  }
  if (a5)
  {
    if (objc_opt_respondsToSelector())
    {
      id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Subitem Did Move"];
      id v11 = (void *)[a3 presentedItemOperationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke;
      v17[3] = &unk_1E51FD568;
      v17[4] = v10;
      v17[5] = a3;
      v17[6] = a5;
      v17[7] = a4;
      uint64_t v12 = v17;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      id v14 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Did Change"];
      id v11 = (void *)[a3 presentedItemOperationQueue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_2;
      v16[3] = &unk_1E51F6678;
      v16[4] = v14;
      v16[5] = a3;
      uint64_t v12 = v16;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Did Move"];
    id v11 = (void *)[a3 presentedItemOperationQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_3;
    v15[3] = &unk_1E51FAD68;
    v15[4] = v13;
    v15[5] = a3;
    void v15[6] = a4;
    uint64_t v12 = v15;
  }
  objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v8, v12);
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedSubitemAtURL:*(void *)(a1 + 48) didMoveToURL:*(void *)(a1 + 56)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedItemDidChange];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

uint64_t __78__NSFilePresenterXPCMessenger__makePresenter_observeMoveToURL_withSubitemURL___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedItemDidMoveToURL:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)_makePresenterObserveDisconnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  uint64_t v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe disconnection", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Observe Disconnection"];
    uint64_t v7 = (void *)[a3 presentedItemOperationQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__NSFilePresenterXPCMessenger__makePresenterObserveDisconnection___block_invoke;
    v8[3] = &unk_1E51F6678;
    v8[4] = v6;
    v8[5] = a3;
    objc_msgSend(v7, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
  }
}

uint64_t __66__NSFilePresenterXPCMessenger__makePresenterObserveDisconnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedItemDidDisconnect];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)_makePresenterObserveReconnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  uint64_t v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe reconnection", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Observe Reconnection"];
    uint64_t v7 = (void *)[a3 presentedItemOperationQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__NSFilePresenterXPCMessenger__makePresenterObserveReconnection___block_invoke;
    v8[3] = &unk_1E51F6678;
    v8[4] = v6;
    v8[5] = a3;
    objc_msgSend(v7, "_fc_addUncancellableOperationForReactorID:block:", v4, v8);
  }
}

uint64_t __65__NSFilePresenterXPCMessenger__makePresenterObserveReconnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedItemDidReconnect];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)_makePresenter:(id)a3 observeUbiquityChangeWithSubitemURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  uint64_t v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe ubiquity change", buf, 0xCu);
  }
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Observe Subitem Ubiquity Change"];
    long long v9 = (void *)[a3 presentedItemOperationQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_1E51FAD68;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    id v10 = v13;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Observe Ubiquity Change"];
    long long v9 = (void *)[a3 presentedItemOperationQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_1E51F6678;
    v12[4] = v11;
    v12[5] = a3;
    id v10 = v12;
  }
  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedSubitemUbiquityDidChangeAtURL:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_observeUbiquityChangeWithSubitemURL___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedItemUbiquityDidChange];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)_makePresenter:(id)a3 observeSharingChangeWithSubitemURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  uint64_t v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe sharing change", buf, 0xCu);
  }
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Observe Subitem Sharing Change"];
    long long v9 = (void *)[a3 presentedItemOperationQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke;
    v13[3] = &unk_1E51FAD68;
    v13[4] = v8;
    v13[5] = a3;
    v13[6] = a4;
    id v10 = v13;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Observe Sharing Change"];
    long long v9 = (void *)[a3 presentedItemOperationQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke_2;
    v12[3] = &unk_1E51F6678;
    v12[4] = v11;
    v12[5] = a3;
    id v10 = v12;
  }
  objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v6, v10);
}

uint64_t __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedSubitemSharingDidChangeAtURL:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

uint64_t __81__NSFilePresenterXPCMessenger__makePresenter_observeSharingChangeWithSubitemURL___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  [*(id *)(a1 + 40) presentedItemSharingDidChange];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)_makePresenter:(id)a3 observeChangeOfUbiquityAttributes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  id v8 = _NSFCPresenterLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = a4;
    _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe ubiquity attributes change: %{public}@", buf, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Observe Ubiquity Attributes Change"];
    id v10 = (void *)[a3 presentedItemOperationQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__NSFilePresenterXPCMessenger__makePresenter_observeChangeOfUbiquityAttributes___block_invoke;
    v11[3] = &unk_1E51FAD68;
    v11[4] = v9;
    v11[5] = a3;
    v11[6] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v11);
  }
  else if (objc_opt_respondsToSelector())
  {
    [(NSFilePresenterXPCMessenger *)self _makePresenter:a3 observeUbiquityChangeWithSubitemURL:0];
  }
}

uint64_t __80__NSFilePresenterXPCMessenger__makePresenter_observeChangeOfUbiquityAttributes___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "presentedItemURL"), "removeAllCachedResourceValues");
  [*(id *)(a1 + 40) presentedItemDidChangeUbiquityAttributes:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)_makePresenter:(id)a3 observeVersionChangeOfKind:(id)a4 withClientID:(id)a5 name:(id)a6 subitemURL:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke;
  v22[3] = &unk_1E51FD748;
  v22[4] = a7;
  v22[5] = a3;
  v22[6] = a5;
  v22[7] = a6;
  id v12 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  id v13 = _NSFCPresenterLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v12;
    _os_log_impl(&dword_181795000, v13, OS_LOG_TYPE_INFO, "Making presenter %{public}@ observe version change", buf, 0xCu);
  }
  if ([a4 isEqualToString:@"added"])
  {
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      __int16 v14 = (void *)[a3 presentedItemOperationQueue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_592;
      v21[3] = &unk_1E51F7DF0;
      v21[5] = a7;
      v21[6] = v22;
      v21[4] = a3;
      id v15 = v21;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      __int16 v14 = (void *)[a3 presentedItemOperationQueue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_2;
      v20[3] = &unk_1E51F7EE0;
      v20[4] = a3;
      v20[5] = v22;
      id v15 = v20;
    }
  }
  else if ([a4 isEqualToString:@"removed"])
  {
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      __int16 v14 = (void *)[a3 presentedItemOperationQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_3;
      v19[3] = &unk_1E51F7DF0;
      v19[5] = a7;
      v19[6] = v22;
      v19[4] = a3;
      id v15 = v19;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      __int16 v14 = (void *)[a3 presentedItemOperationQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_4;
      v18[3] = &unk_1E51F7EE0;
      v18[4] = a3;
      v18[5] = v22;
      id v15 = v18;
    }
  }
  else
  {
    if (![a4 isEqualToString:@"resolved"]) {
      return;
    }
    if (a7)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      __int16 v14 = (void *)[a3 presentedItemOperationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_5;
      v17[3] = &unk_1E51F7DF0;
      v17[5] = a7;
      v17[6] = v22;
      v17[4] = a3;
      id v15 = v17;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return;
      }
      __int16 v14 = (void *)[a3 presentedItemOperationQueue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_6;
      v16[3] = &unk_1E51F7EE0;
      v16[4] = a3;
      v16[5] = v22;
      id v15 = v16;
    }
  }
  objc_msgSend(v14, "_fc_addUncancellableOperationForReactorID:block:", v12, v15);
}

id __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2 || (result = (id)[*(id *)(a1 + 40) presentedItemURL], (id v2 = result) != 0))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [*(id *)(a1 + 40) _presentedItemTemporaryVersionStorageIdentifier];
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    return +[NSFileVersion _versionOfItemAtURL:v2 forClientID:v5 name:v6 temporaryStorageIdentifier:v4 evenIfDeleted:1];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_592(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    return [v4 presentedSubitemAtURL:v5 didGainVersion:v3];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 presentedItemDidGainVersion:v3];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_3(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    return [v4 presentedSubitemAtURL:v5 didLoseVersion:v3];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_4(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 presentedItemDidLoseVersion:v3];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_5(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    return [v4 presentedSubitemAtURL:v5 didResolveConflictVersion:v3];
  }
  return result;
}

uint64_t __102__NSFilePresenterXPCMessenger__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL___block_invoke_6(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 presentedItemDidResolveConflictVersion:v3];
  }
  return result;
}

- (void)_makePresenter:(id)a3 setLastPresentedItemEventIdentifier:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:a3];
  id v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ setLastPresentedItemIdentifier: %llu", buf, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)[a3 presentedItemOperationQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__NSFilePresenterXPCMessenger__makePresenter_setLastPresentedItemEventIdentifier___block_invoke;
    v9[3] = &unk_1E51F8B80;
    v9[4] = a3;
    void v9[5] = a4;
    objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v6, v9);
  }
}

uint64_t __82__NSFilePresenterXPCMessenger__makePresenter_setLastPresentedItemEventIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLastPresentedItemEventIdentifier:*(void *)(a1 + 40)];
}

- (void)_makePresenter:(id)a3 setProviderPurposeIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
  id v7 = _NSFCPresenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = a4;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Making presenter %{public}@ setProviderPurposeIdentifier: %{public}@", buf, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)[a3 presentedItemOperationQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__NSFilePresenterXPCMessenger__makePresenter_setProviderPurposeIdentifier___block_invoke;
    v9[3] = &unk_1E51F6678;
    v9[4] = a3;
    void v9[5] = a4;
    objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v6, v9);
  }
}

uint64_t __75__NSFilePresenterXPCMessenger__makePresenter_setProviderPurposeIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProviderPurposeIdentifier:*(void *)(a1 + 40)];
}

- (id)_readRelinquishment
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  AssociatedObject = (NSFilePresenterRelinquishment *)objc_getAssociatedObject(self->_filePresenter, "NSFilePresenterReadRelinquishment");
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(NSFilePresenterRelinquishment);
    objc_setAssociatedObject(self->_filePresenter, "NSFilePresenterReadRelinquishment", AssociatedObject, (void *)0x301);
  }
  uint64_t v4 = AssociatedObject;

  return v4;
}

- (id)_writeRelinquishment
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  AssociatedObject = (NSFilePresenterRelinquishment *)objc_getAssociatedObject(self->_filePresenter, "NSFilePresenterWriteRelinquishment");
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(NSFilePresenterRelinquishment);
    objc_setAssociatedObject(self->_filePresenter, "NSFilePresenterWriteRelinquishment", AssociatedObject, (void *)0x301);
  }
  uint64_t v4 = AssociatedObject;

  return v4;
}

- (void)_makePresenter:(id)a3 relinquishToAccessClaimWithID:(id)a4 purposeID:(id)a5 ifNecessaryUsingSelector:(SEL)a6 recordingRelinquishment:(id)a7 continuer:(id)a8
{
  v16[10] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_opt_respondsToSelector())
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke;
    v16[3] = &unk_1E51FD810;
    v16[4] = self;
    v16[5] = a3;
    void v16[6] = a4;
    v16[7] = a5;
    v16[8] = a7;
    v16[9] = a6;
    [a7 performRelinquishmentToAccessClaimIfNecessary:a4 usingBlock:v16 withReply:a8];
  }
  else
  {
    id v15 = (void (*)(id))*((void *)a8 + 2);
    v15(a8);
  }
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  id v4 = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 40)];
  uint64_t v5 = _NSFCPresenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    Name = sel_getName(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 138543874;
    id v17 = v4;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2082;
    id v21 = Name;
    _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_DEFAULT, "Asking presenter %{public}@ to relinquish to claim %{public}@ via %{public}s", buf, 0x20u);
  }
  id v8 = (void *)[*(id *)(a1 + 40) presentedItemOperationQueue];
  id v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:*(void *)(a1 + 40) withDescription:@"Relinquish"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_614;
  v15[3] = &unk_1E51FD7E8;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v15[4] = v9;
  v15[5] = v10;
  uint64_t v12 = *(void *)(a1 + 72);
  v15[11] = a2;
  v15[12] = v12;
  uint64_t v13 = *(void *)(a1 + 32);
  void v15[6] = *(void *)(a1 + 40);
  void v15[7] = v4;
  v15[8] = v13;
  v15[9] = v11;
  v15[10] = v8;
  return objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:", v4, v15);
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_614(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didBegin];
  +[NSFileCoordinator _setCurrentClaimPurposeIdentifier:*(void *)(a1 + 40)];
  id v2 = *(const char **)(a1 + 96);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  v7[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2;
  v7[3] = &unk_1E51FD7C0;
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  void v7[4] = *(void *)(a1 + 56);
  v7[5] = v5;
  id v9 = v4;
  long long v10 = v3;
  objc_msgSend(v4, v2, v7);
  return +[NSFileCoordinator _setCurrentClaimPurposeIdentifier:0];
}

void __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ relinquished", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v6 = *(_OWORD *)(a1 + 64);
  id v7 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  v9[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_615;
  v9[3] = &unk_1E51FD798;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  long long v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = a2;
  uint64_t v15 = *(void *)(a1 + 80);
  dispatch_async(v7, v9);
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_615(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 80);
  if (v2)
  {
    long long v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_616;
    v6[3] = &unk_1E51FC130;
    long long v4 = *(_OWORD *)(a1 + 56);
    long long v7 = *(_OWORD *)(a1 + 40);
    long long v8 = v4;
    uint64_t v9 = v2;
    [v3 setReacquirer:v6];
  }
  [*(id *)(a1 + 72) didEnd];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_616(void *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  long long v4 = _NSFCPresenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Telling presenter %{public}@ to reacquire", buf, 0xCu);
  }
  id v6 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a1[6] withDescription:@"Reacquire"];
  uint64_t v7 = a1[5];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_620;
  uint64_t v13 = &unk_1E51FD770;
  id v14 = v6;
  uint64_t v15 = v7;
  uint64_t v16 = a1[4];
  uint64_t v17 = a2;
  long long v8 = (void *)a1[7];
  uint64_t v18 = a1[8];
  return objc_msgSend(v8, "_fc_addUncancellableOperationForReactorID:block:");
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_620(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didBegin];
  uint64_t TSD = NSFileCoordinatorGetTSD();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_622;
  v5[3] = &unk_1E51FC6A8;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  *(void *)(TSD + 16) = +[NSFileCoordinatorReacquisitionBlockCompletion completionWithBlock:v5 queue:*(void *)(v3 + 16)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 32) willEnd];
  uint64_t result = [*(id *)(TSD + 16) decrement];
  *(void *)(TSD + 16) = 0;
  return result;
}

uint64_t __145__NSFilePresenterXPCMessenger__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer___block_invoke_2_622(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ reacquired", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_makePresenter:(id)a3 relinquishToReadingClaimWithID:(id)a4 purposeID:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  int v8 = a6;
  v18[5] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v13 = v18;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke;
  v18[3] = &unk_1E51F8650;
  v18[4] = a7;
  if ((v8 & 1) == 0)
  {
    if ((v8 & 0x10000) != 0)
    {
      uint64_t v13 = v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      id v14 = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_2;
    }
    else
    {
      uint64_t v13 = &v15;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v14 = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_4;
    }
    v13[2] = (uint64_t)v14;
    v13[3] = (uint64_t)&unk_1E51FC6A8;
    v13[4] = (uint64_t)self;
    v13[5] = (uint64_t)a3;
    v13[6] = (uint64_t)a7;
  }
  [(NSFilePresenterXPCMessenger *)self _makePresenter:a3 relinquishToAccessClaimWithID:a4 purposeID:a5 ifNecessaryUsingSelector:sel_relinquishPresentedItemToReader_ recordingRelinquishment:[(NSFilePresenterXPCMessenger *)self _readRelinquishment] continuer:v13];
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_2(uint64_t a1)
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_3;
  v3[3] = &unk_1E51FD838;
  v3[4] = v1;
  return [v1 _makePresenter:*(void *)(a1 + 40) reportUnsavedChangesWithCompletionHandler:v3];
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_3(void *a1, void *a2)
{
  if (a2)
  {
    int v3 = [a2 BOOLValue];
    uint64_t v4 = a1[6];
    if (v3)
    {
      int v5 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3072 userInfo:0];
      uint64_t v6 = *(uint64_t (**)(uint64_t, NSError *))(v4 + 16);
      uint64_t v7 = v4;
    }
    else
    {
      uint64_t v6 = *(uint64_t (**)(uint64_t, NSError *))(v4 + 16);
      uint64_t v7 = v4;
      int v5 = 0;
    }
    return v6(v7, v5);
  }
  else
  {
    int v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    return [v8 _makePresenter:v9 saveChangesWithCompletionHandler:v10];
  }
}

uint64_t __113__NSFilePresenterXPCMessenger__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) saveChangesWithCompletionHandler:*(void *)(a1 + 48)];
}

- (void)_makePresenter:(id)a3 relinquishToWritingClaimWithID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 completionHandler:(id)a8
{
  v34[5] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v15 = v34;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
  v34[3] = &unk_1E51F8650;
  v34[4] = a8;
  if ((a5 & 4) != 0)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2;
    v33[3] = &unk_1E51FC6A8;
    v33[4] = self;
    v33[5] = a3;
    v33[6] = a8;
    uint64_t v15 = (id)[v33 copy];
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 1;
  if ((a5 & 9) != 0)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3;
    v30[3] = &unk_1E51FD860;
    v30[7] = a8;
    v30[8] = v31;
    v30[4] = self;
    v30[5] = a3;
    v30[6] = a7;
    uint64_t v15 = (id)[v30 copy];
  }
  if ((a5 & 0x100000) != 0)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_4;
    v29[3] = &unk_1E51FA2A8;
    v29[4] = self;
    v29[5] = a3;
    v29[6] = a7;
    v29[7] = a8;
    uint64_t v15 = (id)[v29 copy];
  }
  if ((a5 & 0x10000) != 0)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_5;
    v28[3] = &unk_1E51FD8B0;
    v28[4] = self;
    v28[5] = a3;
    v28[6] = a8;
    v28[7] = a5;
    uint64_t v15 = (id)[v28 copy];
  }
  id v16 = [(NSFilePresenterXPCMessenger *)self _writeRelinquishment];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  uint64_t v20 = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7;
  uint64_t v21 = &unk_1E51FC810;
  uint64_t v22 = self;
  id v23 = a3;
  id v24 = a4;
  id v25 = a6;
  id v26 = v16;
  v27 = v15;
  if (a5)
  {
    if (([a6 isEqualToString:@"com.apple.icloud.drive"] & 1) != 0
      || ([a6 isEqualToString:@"com.apple.bird"] & 1) != 0)
    {
      filePresenter = self->_filePresenter;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_8;
      v18[3] = &unk_1E51FD8D8;
      void v18[6] = v31;
      v18[4] = self;
      v18[5] = v19;
      [(NSFilePresenterXPCMessenger *)self _makePresenter:filePresenter validateRemoteDeletionRecordingRelinquishment:v16 completionHandler:v18];
    }
    else
    {
      v20(v19);
    }
  }
  else
  {
    __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7(v19);
  }
  _Block_object_dispose(v31, 8);
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) saveChangesWithCompletionHandler:*(void *)(a1 + 48)];
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 48) URL];
    uint64_t v5 = *(void *)(a1 + 56);
    return [v2 _makePresenter:v3 accommodateDeletionWithSubitemURL:v4 completionHandler:v5];
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v7();
  }
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) URL];
  uint64_t v5 = *(void *)(a1 + 56);

  return [v2 _makePresenter:v3 accommodateEvictionWithSubitemURL:v4 completionHandler:v5];
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if ((*(unsigned char *)(a1 + 56) & 4) != 0) {
    return objc_msgSend(v2, "_makePresenter:saveChangesWithCompletionHandler:", MEMORY[0x1E4F143A8], 3221225472, __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6, &unk_1E51FD888, v2, v3, *(void *)(a1 + 48));
  }
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _makePresenter:v3 accommodateDisconnectionWithCompletionHandler:v4];
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _makePresenter:*(void *)(a1 + 40) accommodateDisconnectionWithCompletionHandler:*(void *)(a1 + 48)];
  }
}

uint64_t __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_7(void *a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 16));
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];

  return [v2 _makePresenter:v3 relinquishToAccessClaimWithID:v4 purposeID:v5 ifNecessaryUsingSelector:sel_relinquishPresentedItemToWriter_ recordingRelinquishment:v6 continuer:v7];
}

void __124__NSFilePresenterXPCMessenger__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke_8(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), *(dispatch_block_t *)(a1 + 40));
}

- (void)_makePresenter:(id)a3 validateRelinquishmentToSubitemAtURL:(id)a4 completionHandler:(id)a5
{
  v13[10] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = +[NSFileAccessArbiterProxy _idForReactor:a3];
    id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Validate Subitem Relinquishment"];
    uint64_t v11 = (void *)[a3 presentedItemOperationQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke;
    v13[3] = &unk_1E51FC810;
    v13[4] = v9;
    v13[5] = a4;
    v13[6] = v10;
    void v13[7] = a3;
    uint8_t v13[8] = self;
    v13[9] = a5;
    objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v9, v13);
  }
  else
  {
    long long v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, 1);
  }
}

void __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138543619;
    uint64_t v14 = v3;
    __int16 v15 = 2113;
    id v16 = v4;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ validate subitem relinquishment for URL: %{private}@", buf, 0x16u);
  }
  [*(id *)(a1 + 48) didBegin];
  int v5 = [*(id *)(a1 + 56) shouldRelinquishToWriterOfSubitemAtURL:*(void *)(a1 + 40)];
  uint64_t v6 = _NSFCPresenterLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "NO";
    uint64_t v8 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v7 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    id v16 = v7;
    _os_log_impl(&dword_181795000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ finished validate subitem relinquishment with reply: %s", buf, 0x16u);
  }
  [*(id *)(a1 + 48) willEnd];
  id v9 = *(NSObject **)(*(void *)(a1 + 64) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke_640;
  block[3] = &unk_1E51FD6D0;
  uint64_t v10 = *(void *)(a1 + 72);
  block[4] = *(void *)(a1 + 48);
  block[5] = v10;
  char v12 = v5;
  dispatch_async(v9, block);
}

uint64_t __101__NSFilePresenterXPCMessenger__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler___block_invoke_640(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

@end