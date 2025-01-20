@interface NSFileAccessArbiterProxy
+ (id)_fileReactorDebuggingInformation;
+ (id)_idForReactor:(id)a3;
+ (id)_willBeginOperationForReactor:(id)a3 withDescription:(id)a4;
+ (void)_accessPresenterOperationRecordsUsingBlock:(id)a3;
- (BOOL)itemHasPresentersAtURL:(id)a3;
- (NSFileAccessArbiterProxy)initWithServer:(id)a3 queue:(id)a4;
- (id)_onqueue_filePresenters;
- (id)_onqueue_fileProviders;
- (id)filePresenters;
- (id)fileProviders;
- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4;
- (id)idForFileReactor:(id)a3;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (void)addFilePresenter:(id)a3;
- (void)addFileProvider:(id)a3 completionHandler:(id)a4;
- (void)cancelAccessClaimForID:(id)a3;
- (void)dealloc;
- (void)getDebugInfoWithCompletionHandler:(id)a3;
- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4;
- (void)handleCanceledServer;
- (void)performBarrier;
- (void)performBarrierAsync:(id)a3;
- (void)removeFilePresenter:(id)a3;
- (void)removeFileProvider:(id)a3;
- (void)revokeAccessClaimForID:(id)a3;
- (void)revokeSubarbitrationClaimForID:(id)a3;
- (void)setAutomaticFileProviderReregistrationDisabled:(BOOL)a3;
- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5;
- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5;
- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7;
@end

@implementation NSFileAccessArbiterProxy

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  objc_opt_class();
  v6 = a5;
  if (objc_opt_isKindOfClass()) {
    v6 = _secureCodingScreenedError((NSError *)a5);
  }
  uint64_t v7 = objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || ([a5 isMemberOfClass:v7]) {
    return v6;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initWithString:", objc_msgSend(a5, "absoluteString"));

  return v9;
}

- (NSFileAccessArbiterProxy)initWithServer:(id)a3 queue:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSFileAccessArbiterProxy;
  v6 = [(NSFileAccessArbiterProxy *)&v10 init];
  if (v6)
  {
    uint64_t v7 = (NSXPCConnection *)a3;
    v6->_server = v7;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__NSFileAccessArbiterProxy_initWithServer_queue___block_invoke;
    v9[3] = &unk_1E51F71D0;
    v9[4] = v6;
    [(NSXPCConnection *)v7 setInterruptionHandler:v9];
    [(NSXPCConnection *)v6->_server setDelegate:v6];
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

uint64_t __45__NSFileAccessArbiterProxy_addFilePresenter___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 24)) {
    *(void *)(*(void *)(a1 + 32) + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 40) forKey:v2];
  uint64_t v3 = [*(id *)(a1 + 40) presentedItemURL];
  if (objc_opt_respondsToSelector()) {
    v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 40) lastPresentedItemEventIdentifier]);
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = (objc_opt_respondsToSelector() & 1) == 0
    || [*(id *)(a1 + 40) presentedItemNeedsWatching];
  objc_lookUpClass("NSDocument");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 40) usesMainThreadDuringPresentedItemRelinquishing] & 1) != 0
    || (v6 = (NSOperationQueue *)[*(id *)(a1 + 40) presentedItemOperationQueue],
        v6 == +[NSOperationQueue mainQueue]))
  {
    v5 |= 2uLL;
  }
  unint64_t v7 = +[NSFileCoordinator _responsesForPresenter:*(void *)(a1 + 40)];
  if ((v7 & 0xFFFFFFFF80010000) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_19;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [*(id *)(a1 + 40) observedPresentedItemUbiquityAttributes];
LABEL_19:
    uint64_t v9 = v8;
    goto LABEL_21;
  }
  uint64_t v9 = 0;
LABEL_21:
  objc_super v10 = [[NSFilePresenterXPCMessenger alloc] initWithFilePresenter:*(void *)(a1 + 40) queue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v11)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  [v11 setObject:v10 forKey:v2];

  v12 = _NSFCPresenterLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    id v15 = v2;
    __int16 v16 = 2113;
    uint64_t v17 = v3;
    _os_log_impl(&dword_181795000, v12, OS_LOG_TYPE_DEFAULT, "Adding presenter %{public}@ for URL: %{private}@", buf, 0x16u);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "remoteObjectProxy"), "addPresenter:withID:fileURL:lastPresentedItemEventIdentifier:ubiquityAttributes:options:responses:", v10, v2, v3, v4, v9, v5, v7);
}

id __45__NSFileAccessArbiterProxy_idForFileReactor___block_invoke(uint64_t a1)
{
  id result = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)_idForReactor:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    return (id)[a3 _fileReactorID];
  }
  else
  {
    AssociatedObject = objc_getAssociatedObject(a3, "NSFileReactorID");
    if (!AssociatedObject)
    {
      CFUUIDRef v6 = CFUUIDCreate(0);
      AssociatedObject = (void *)CFUUIDCreateString(0, v6);
      objc_setAssociatedObject(a3, "NSFileReactorID", AssociatedObject, (void *)0x301);

      CFRelease(v6);
    }
    id v7 = AssociatedObject;
    return v7;
  }
}

- (id)grantAccessClaim:(id)a3 synchronouslyIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  block[6] = *MEMORY[0x1E4F143B8];
  [a3 prepareClaimForGrantingWithArbiterQueue:self->_queue];
  if (v4) {
    id v7 = (void *)[a3 claimerWaiter];
  }
  else {
    id v7 = 0;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = a3;
  block[5] = self;
  dispatch_async(queue, block);
  return v7;
}

- (void)revokeAccessClaimForID:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NSFileAccessArbiterProxy_revokeAccessClaimForID___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __51__NSFileAccessArbiterProxy_revokeAccessClaimForID___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 revokeAccessClaimForID:v3];
}

- (id)idForFileReactor:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  objc_super v10 = __Block_byref_object_copy__27;
  uint64_t v11 = __Block_byref_object_dispose__27;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NSFileAccessArbiterProxy_idForFileReactor___block_invoke;
  block[3] = &unk_1E51FAD90;
  block[4] = a3;
  block[5] = &v7;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) forwardUsingConnection:*(void *)(*(void *)(a1 + 40) + 8) crashHandler:&__block_literal_global_344];
  id v2 = *(void **)(a1 + 32);

  return [v2 unblock];
}

- (void)addFilePresenter:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NSFileAccessArbiterProxy_addFilePresenter___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

void __49__NSFileAccessArbiterProxy_initWithServer_queue___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_filePresenters");
  if ([v2 count])
  {
    uint64_t v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v16 = 0;
      _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "Connection to filecoordinationd interrupted. Attempting to re-add presenters", v16, 2u);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(a1 + 32) addFilePresenter:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v5 = [v2 countByEnumeratingWithState:&v23 objects:v22 count:16];
      }
      while (v5);
    }
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_fileProviders");
  if ([v8 count])
  {
    int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
    objc_super v10 = _NSFCLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)__int16 v16 = 0;
        _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, "Connection to filecoordinationd interrupted. Client has providers, but not re-adding them because _setAutomaticFileProviderReregistrationDisabled:YES was called.", v16, 2u);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)__int16 v16 = 0;
        _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, "Connection to filecoordinationd interrupted. Attempting to re-add providers", v16, 2u);
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v12 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(a1 + 32) addFileProvider:*(void *)(*((void *)&v18 + 1) + 8 * j) completionHandler:&__block_literal_global_339];
          }
          uint64_t v13 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->_queue);
  [(NSXPCConnection *)self->_server setDelegate:0];
  [(NSXPCConnection *)self->_server invalidate];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessArbiterProxy;
  [(NSFileAccessArbiterProxy *)&v3 dealloc];
}

uint64_t __69__NSFileAccessArbiterProxy_grantAccessClaim_synchronouslyIfPossible___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_error_impl(&dword_181795000, v0, OS_LOG_TYPE_ERROR, "A process invoked one of the -[NSFileCoordinator coordinate...] methods but filecoordinationd crashed. Returning an error.", v2, 2u);
  }
  return 1;
}

- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) forwardUsingConnection:*(void *)(*(void *)(a1 + 40) + 8) withServer:*(void *)(a1 + 48) crashHandler:&__block_literal_global_346];
  id v2 = *(void **)(a1 + 32);

  return [v2 unblock];
}

uint64_t __64__NSFileAccessArbiterProxy_grantSubarbitrationClaim_withServer___block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_error_impl(&dword_181795000, v0, OS_LOG_TYPE_ERROR, "A process invoked -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:] but filecoordinationd crashed. Invoking the batchAccessor anyway.", v2, 2u);
  }
  return 0;
}

- (void)revokeSubarbitrationClaimForID:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NSFileAccessArbiterProxy_revokeSubarbitrationClaimForID___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __59__NSFileAccessArbiterProxy_revokeSubarbitrationClaimForID___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 revokeSubarbitrationClaimForID:v3];
}

- (void)cancelAccessClaimForID:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NSFileAccessArbiterProxy_cancelAccessClaimForID___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __51__NSFileAccessArbiterProxy_cancelAccessClaimForID___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 cancelAccessClaimForID:v3];
}

- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  uint64_t v10 = 0;
  _NSGetFSIDAndFileID((void *)[a5 logicalURL], v12, &v10);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NSFileAccessArbiterProxy_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke;
  block[3] = &unk_1E51FDA68;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  block[8] = v10;
  block[9] = v12[0];
  dispatch_async(queue, block);
}

uint64_t __71__NSFileAccessArbiterProxy_writerWithPurposeID_didMoveItemAtURL_toURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];

  return [v2 writerWithPurposeID:v3 didMoveItemAtURL:v4 toURL:v5 withFSID:v7 andFileID:v6];
}

- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__NSFileAccessArbiterProxy_writerWithPurposeID_didDisconnectItemAtURL___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __71__NSFileAccessArbiterProxy_writerWithPurposeID_didDisconnectItemAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 writerWithPurposeID:v3 didDisconnectItemAtURL:v4];
}

- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__NSFileAccessArbiterProxy_writerWithPurposeID_didReconnectItemAtURL___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __70__NSFileAccessArbiterProxy_writerWithPurposeID_didReconnectItemAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 writerWithPurposeID:v3 didReconnectItemAtURL:v4];
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __77__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 writerWithPurposeID:v3 didChangeUbiquityOfItemAtURL:v4];
}

- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __76__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 writerWithPurposeID:v3 didChangeSharingOfItemAtURL:v4];
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5
{
  block[8] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke;
  block[3] = &unk_1E51FD568;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  dispatch_async(queue, block);
}

uint64_t __88__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];

  return [v2 writerWithPurposeID:v3 didChangeUbiquityAttributes:v4 ofItemAtURL:v5];
}

- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__NSFileAccessArbiterProxy_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __74__NSFileAccessArbiterProxy_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 writerWithPurposeID:v3 didMakeItemDisappearAtURL:v4];
}

- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeItemAtURL___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __67__NSFileAccessArbiterProxy_writerWithPurposeID_didChangeItemAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 writerWithPurposeID:v3 didChangeItemAtURL:v4];
}

- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7
{
  void block[10] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__NSFileAccessArbiterProxy_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke;
  block[3] = &unk_1E51FD590;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  void block[9] = a7;
  dispatch_async(queue, block);
}

uint64_t __101__NSFileAccessArbiterProxy_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];

  return [v2 writerWithPurposeID:v3 didVersionChangeOfKind:v4 toItemAtURL:v5 withClientID:v6 name:v7];
}

- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__NSFileAccessArbiterProxy_tiePresenterForID_toItemAtURL___block_invoke;
  v5[3] = &unk_1E51FAD68;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __58__NSFileAccessArbiterProxy_tiePresenterForID_toItemAtURL___block_invoke(void *a1)
{
  id v2 = (void *)[*(id *)(a1[4] + 8) remoteObjectProxy];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 tiePresenterForID:v3 toItemAtURL:v4];
}

- (void)removeFilePresenter:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NSFileAccessArbiterProxy_removeFilePresenter___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

uint64_t __48__NSFileAccessArbiterProxy_removeFilePresenter___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v2];
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "objectForKey:", v2), "invalidate");
  [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v2];
  objc_msgSend(objc_getAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterReadRelinquishment"), "removeAllBlockingAccessClaimIDs");
  objc_msgSend(objc_getAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterWriteRelinquishment"), "removeAllBlockingAccessClaimIDs");
  objc_setAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterReadRelinquishment", 0, (void *)0x301);
  objc_setAssociatedObject(*(id *)(a1 + 32), "NSFilePresenterWriteRelinquishment", 0, (void *)0x301);
  uint64_t v3 = _NSFCPresenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "Removing presenter %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "remoteObjectProxy"), "removePresenterWithID:", v2);
}

- (id)_onqueue_filePresenters
{
  return (id)[(NSMutableDictionary *)self->_presentersByID allValues];
}

- (id)filePresenters
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3052000000;
  BOOL v11 = __Block_byref_object_copy__27;
  uint64_t v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NSFileAccessArbiterProxy_filePresenters__block_invoke;
  block[3] = &unk_1E51FAD90;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)[MEMORY[0x1E4F1C978] array];
  }
  int v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __42__NSFileAccessArbiterProxy_filePresenters__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_filePresenters");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)addFileProvider:(id)a3 completionHandler:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke;
  v5[3] = &unk_1E51FC6A8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(queue, v5);
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 40)) {
    *(void *)(*(void *)(a1 + 32) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  uint64_t v3 = [[NSFileProviderXPCMessenger alloc] initWithFileProvider:*(void *)(a1 + 40) queue:*(void *)(*(void *)(a1 + 32) + 16)];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v4)
  {
    *(void *)(*(void *)(a1 + 32) + 48) = +[NSMapTable strongToStrongObjectsMapTable];
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  [v4 setObject:v3 forKey:*(void *)(a1 + 40)];

  char v5 = objc_opt_respondsToSelector();
  uint64_t v6 = [*(id *)(a1 + 40) _providedItemsURL];
  uint64_t v7 = _NSFCProviderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    id v15 = v2;
    __int16 v16 = 2113;
    uint64_t v17 = v6;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, "Adding provider %{public}@ for URL: %{private}@", buf, 0x16u);
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_367;
  v13[3] = &unk_1E51F7F08;
  v13[4] = *(void *)(a1 + 48);
  int v9 = (void *)[v8 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v10 = _uniqueFileProviderID(*(void **)(a1 + 40));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_371;
  v12[3] = &unk_1E51FD1F8;
  v12[4] = *(void *)(a1 + 48);
  return [v9 addProvider:v3 withID:v2 uniqueID:v10 forProvidedItemsURL:v6 options:v5 & 1 withServer:0 reply:v12];
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_367(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"addProvider";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__NSFileAccessArbiterProxy_addFileProvider_completionHandler___block_invoke_371(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFileProvider:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NSFileAccessArbiterProxy_removeFileProvider___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = a3;
  block[5] = self;
  dispatch_async(queue, block);
}

uint64_t __47__NSFileAccessArbiterProxy_removeFileProvider___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[NSFileAccessArbiterProxy _idForReactor:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 40) removeObject:*(void *)(a1 + 32)];
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKey:", *(void *)(a1 + 32)), "invalidate");
  [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = _NSFCProviderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "Removing provider %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "remoteObjectProxy"), "removeProviderWithID:uniqueID:", v2, _uniqueFileProviderID(*(void **)(a1 + 32)));
}

- (id)_onqueue_fileProviders
{
  return (id)[(NSMutableSet *)self->_providers allObjects];
}

- (id)fileProviders
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  BOOL v11 = __Block_byref_object_copy__27;
  uint64_t v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NSFileAccessArbiterProxy_fileProviders__block_invoke;
  block[3] = &unk_1E51FAD90;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)[MEMORY[0x1E4F1C978] array];
  }
  int v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __41__NSFileAccessArbiterProxy_fileProviders__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_fileProviders");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)getDebugInfoWithCompletionHandler:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke;
  block[3] = &unk_1E51F9B10;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id v2 = +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E51F7F08;
  v7[4] = *(void *)(a1 + 40);
  id v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_375;
  v6[3] = &unk_1E51FD5B8;
  v6[4] = *(void *)(a1 + 40);
  return [v4 provideDebugInfoWithLocalInfo:v2 completionHandler:v6];
}

uint64_t __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"provideDebugInfo";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__NSFileAccessArbiterProxy_getDebugInfoWithCompletionHandler___block_invoke_375(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3)
  {
    id v4 = _NSOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "This process is unable to access File Coordination's debug information due to insufficient permissions.", v5, 2u);
    }
  }
}

- (BOOL)itemHasPresentersAtURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  int v5 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke;
  block[3] = &unk_1E51FD5E0;
  block[4] = self;
  block[5] = v5;
  void block[6] = a3;
  void block[7] = &v9;
  dispatch_async(queue, block);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)a3;
}

uint64_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke(void *a1)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1[4] + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_2;
  v8[3] = &unk_1E51F7FF8;
  v8[4] = a1[5];
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_379;
  v7[3] = &unk_1E51FC568;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  v7[4] = a1[5];
  v7[5] = v5;
  return [v3 getItemHasPresentersAtURL:v4 completionHandler:v7];
}

intptr_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"getItemHasPresenters";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __51__NSFileAccessArbiterProxy_itemHasPresentersAtURL___block_invoke_379(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setAutomaticFileProviderReregistrationDisabled:(BOOL)a3
{
  self->_disableFileProviderReregistration = a3;
}

+ (void)_accessPresenterOperationRecordsUsingBlock:(id)a3
{
  os_unfair_lock_lock(&stru_1EB1EC134);
  if (!qword_1EB1EC148) {
    qword_1EB1EC148 = objc_opt_new();
  }
  (*((void (**)(id))a3 + 2))(a3);

  os_unfair_lock_unlock(&stru_1EB1EC134);
}

+ (id)_willBeginOperationForReactor:(id)a3 withDescription:(id)a4
{
  void v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[NSFilePresenterOperationRecord operationRecordWithDescription:a4 reactor:a3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__NSFileAccessArbiterProxy__willBeginOperationForReactor_withDescription___block_invoke;
  v6[3] = &unk_1E51FD608;
  v6[4] = v4;
  +[NSFileAccessArbiterProxy _accessPresenterOperationRecordsUsingBlock:v6];
  return v4;
}

uint64_t __74__NSFileAccessArbiterProxy__willBeginOperationForReactor_withDescription___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

+ (id)_fileReactorDebuggingInformation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[NSString string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__NSFileAccessArbiterProxy__fileReactorDebuggingInformation__block_invoke;
  v13[3] = &unk_1E51FD608;
  v13[4] = v3;
  [a1 _accessPresenterOperationRecordsUsingBlock:v13];
  Class v4 = objc_lookUpClass("NSDocument");
  if (objc_opt_respondsToSelector()) {
    id v5 = [(objc_class *)v4 _debuggingInformationForFileCoordination];
  }
  else {
    id v5 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        -[NSString appendFormat:](v3, "appendFormat:", @"[%i]: Presenter ID: %@ -- %@\n", v8 + v10, objc_msgSend(a1, "_idForReactor:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "objectForKey:", @"document")), objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "objectForKey:", @"stateString"));
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v8 = (v8 + v10);
    }
    while (v7);
  }
  if (![(NSString *)v3 length]) {
    [(NSString *)v3 appendString:@"Nothing\n"];
  }
  return v3;
}

uint64_t __60__NSFileAccessArbiterProxy__fileReactorDebuggingInformation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) appendFormat:@"%@\n", *(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)performBarrier
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = dispatch_semaphore_create(0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__NSFileAccessArbiterProxy_performBarrier__block_invoke;
  v4[3] = &unk_1E51F71D0;
  v4[4] = v3;
  [(NSFileAccessArbiterProxy *)self performBarrierAsync:v4];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

intptr_t __42__NSFileAccessArbiterProxy_performBarrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performBarrierAsync:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke;
  block[3] = &unk_1E51F9B10;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke(uint64_t a1)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke_2;
  v4[3] = &unk_1E51F7F08;
  v4[4] = *(void *)(a1 + 40);
  return objc_msgSend((id)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4), "performBarrierWithCompletionHandler:", *(void *)(a1 + 40));
}

uint64_t __48__NSFileAccessArbiterProxy_performBarrierAsync___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  Class v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"barrier";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleCanceledServer
{
}

@end