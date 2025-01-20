@interface NSFileAccessArbiter
+ (id)entitlementForConnection:(id)a3 key:(id)a4;
+ (void)_wakeUpFileProviderWithUID:(unsigned int)a3 urls:(id)a4 queue:(id)a5 thenContinue:(id)a6;
+ (void)ensureProvidersIfNecessaryForClaim:(id)a3 user:(unsigned int)a4 atLocations:(id)a5 queue:(id)a6 thenContinue:(id)a7;
- (BOOL)_addPresenter:(id)a3 ofItemAtURL:(id)a4 watchingFile:(BOOL)a5 withLastEventID:(id)a6;
- (BOOL)_addProvider:(id)a3 ofItemsAtURL:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSFileAccessArbiter)initWithQueue:(id)a3 isSubarbiter:(BOOL)a4 listener:(id)a5;
- (NSXPCConnection)superarbitrationConnection;
- (id)rootNode;
- (void)_enumerateSubarbitersUsingBlock:(id)a3;
- (void)_grantAccessClaim:(id)a3;
- (void)_grantSubarbitrationClaim:(id)a3 withServer:(id)a4;
- (void)_handleCanceledClient:(id)a3;
- (void)_registerForDebugInfoRequests;
- (void)_removeReactorForID:(id)a3;
- (void)_revokeAccessClaimForID:(id)a3 fromLocal:(BOOL)a4;
- (void)_startArbitratingItemsAtURLs:(id)a3 withSuperarbitrationServer:(id)a4;
- (void)_willRemoveReactor:(id)a3;
- (void)_writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7;
- (void)addPresenter:(id)a3 withID:(id)a4 fileURL:(id)a5 lastPresentedItemEventIdentifier:(id)a6 ubiquityAttributes:(id)a7 options:(unint64_t)a8 responses:(unint64_t)a9;
- (void)addProvider:(id)a3 withID:(id)a4 uniqueID:(id)a5 forProvidedItemsURL:(id)a6 options:(unint64_t)a7 withServer:(id)a8 reply:(id)a9;
- (void)cancelAccessClaimForID:(id)a3;
- (void)cancelMaterializationWithRequestID:(id)a3;
- (void)dealloc;
- (void)getDebugInformationIncludingEverything:(BOOL)a3 withString:(id)a4 fromPid:(int)a5 thenContinue:(id)a6;
- (void)getItemHasPresentersAtURL:(id)a3 completionHandler:(id)a4;
- (void)grantAccessClaim:(id)a3 withReply:(id)a4;
- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4 reply:(id)a5;
- (void)makeProviderMaterializeFileAtURL:(id)a3 kernelInfo:(id)a4 withRequestID:(id)a5 fromProcess:(id *)a6 completionHandler:(id)a7;
- (void)performBarrierWithCompletionHandler:(id)a3;
- (void)performMateralizationOfURL:(id)a3 withProvider:(id)a4 fakeClaim:(id)a5 kernelInfo:(id)a6 requestID:(id)a7 fromProcess:(id *)a8 completionHandler:(id)a9;
- (void)prepareToArbitrateForURLs:(id)a3;
- (void)provideDebugInfoWithLocalInfo:(id)a3 completionHandler:(id)a4;
- (void)provideSubarbiterDebugInfoIncludingEverything:(BOOL)a3 completionHandler:(id)a4;
- (void)removePresenterWithID:(id)a3;
- (void)removeProviderWithID:(id)a3 uniqueID:(id)a4;
- (void)resolveReparentRequestOfFileAtURL:(id)a3 toDestinationDirectory:(id)a4 withRequestID:(id)a5 operation:(unsigned int)a6 fromProcess:(id *)a7 completionHandler:(id)a8;
- (void)revokeAccessClaimForID:(id)a3;
- (void)revokeSubarbitrationClaimForID:(id)a3;
- (void)startArbitratingWithReply:(id)a3;
- (void)stopArbitrating;
- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5;
- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7;
- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4;
- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7;
@end

@implementation NSFileAccessArbiter

- (void)_revokeAccessClaimForID:(id)a3 fromLocal:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_accessClaimsByID, "objectForKey:");
  if (v7)
  {
    v8 = v7;
    if (!v4 || ([v7 cameFromSuperarbiter] & 1) == 0)
    {
      [v8 revoked];
      [(NSMutableDictionary *)self->_accessClaimsByID removeObjectForKey:a3];
      [(NSMutableDictionary *)self->_subarbitrationClaimsByID removeObjectForKey:a3];
      accessClaimTransactionsByID = self->_accessClaimTransactionsByID;
      [(NSMutableDictionary *)accessClaimTransactionsByID removeObjectForKey:a3];
      return;
    }
  }
  else if (!v4)
  {
    return;
  }
  superarbitrationServer = self->_superarbitrationServer;
  if (superarbitrationServer)
  {
    id v11 = [(NSXPCConnection *)superarbitrationServer remoteObjectProxy];
    [v11 revokeAccessClaimForID:a3];
  }
  else
  {
    v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_181795000, v12, OS_LOG_TYPE_FAULT, "A subarbiter is trying to forward a claim revocation to its superarbiter, but the connection is already gone, which is a surprise.", v13, 2u);
    }
  }
}

- (void)_grantAccessClaim:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[a3 claimID];
  uint64_t v6 = atomic_load(&_NSFCSubarbitrationCount);
  if (v6 < 1
    || (unsigned __int8 v11 = atomic_load(_NSFCDisableLogSuppression), (v11 & 1) != 0)
    || (uint64_t v12 = atomic_load(&_NSFCSubarbitratedClaimCount), v12 <= 99))
  {
    v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v5;
      _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, "Received claim %{public}@", buf, 0xCu);
    }
  }
  if (self->_superarbitrationServer) {
    uint64_t v8 = [a3 cameFromSuperarbiter] ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([a3 evaluateSelfWithRootNode:self->_rootNode checkSubarbitrability:v8])
  {
    [(NSMutableDictionary *)self->_accessClaimsByID setObject:a3 forKey:v5];
    [a3 startObservingClientState];
    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Claim: %@ (%d)", [v5 description], -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier")), "UTF8String");
    v9 = (void *)os_transaction_create();
    [(NSMutableDictionary *)self->_accessClaimTransactionsByID setObject:v9 forKey:v5];
  }
  else
  {
    v10 = _NSFCClaimsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v5;
      _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_INFO, "Claim %{public}@ forwarded to superarbiter", buf, 0xCu);
    }
    [a3 forwardUsingConnection:self->_superarbitrationServer crashHandler:&__block_literal_global_33];
  }
  [a3 unblock];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7[6] = *MEMORY[0x1E4F143B8];
  [a4 setExportedObject:self];
  objc_msgSend(a4, "setExportedInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NSFileAccessArbiter_listener_shouldAcceptNewConnection___block_invoke;
  v7[3] = &unk_1E51F6678;
  v7[4] = self;
  v7[5] = a4;
  [a4 setInvalidationHandler:v7];
  [a4 _setQueue:self->_queue];
  [a4 resume];
  return 1;
}

- (void)grantAccessClaim:(id)a3 withReply:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = +[NSXPCConnection currentConnection];
    [a3 acceptClaimFromClient:v7 arbiterQueue:self->_queue grantHandler:a4];
    superarbitrationServer = self->_superarbitrationServer;
    if (superarbitrationServer)
    {
      if (v7 == superarbitrationServer)
      {
        [a3 setCameFromSuperarbiter];
      }
      else
      {
        v9 = _NSFCClaimsLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          int v11 = 138543362;
          uint64_t v12 = [a3 claimID];
          _os_log_fault_impl(&dword_181795000, v9, OS_LOG_TYPE_FAULT, "A subarbiter is being asked to grant a claim (%{public}@) by something other than its superarbiter, which is a surprise.", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    [(NSFileAccessArbiter *)self _grantAccessClaim:a3];
  }
  else
  {
    v10 = _NSFCClaimsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "Received a request to grant an access claim, but received no access claim instance.", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)revokeAccessClaimForID:(id)a3
{
}

- (void)addPresenter:(id)a3 withID:(id)a4 fileURL:(id)a5 lastPresentedItemEventIdentifier:(id)a6 ubiquityAttributes:(id)a7 options:(unint64_t)a8 responses:(unint64_t)a9
{
  v15[5] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = [[NSFilePresenterProxy alloc] initWithClient:+[NSXPCConnection currentConnection] remotePresenter:a3 reactorID:a4];
  [(NSFilePresenterProxy *)v14 setUsesMainThreadDuringReliquishing:(a8 >> 1) & 1];
  [(NSFilePresenterProxy *)v14 setFilePresenterResponses:a9];
  [(NSFilePresenterProxy *)v14 setObservedUbiquityAttributes:a7];
  [(NSFileReactorProxy *)v14 setEffectiveUserIdentifier:[+[NSXPCConnection currentConnection] effectiveUserIdentifier]];
  if (!a5 || self->_isSubarbiter || [(NSFilePresenterProxy *)v14 allowedForURL:a5])
  {
    if ([(NSFileAccessArbiter *)self _addPresenter:v14 ofItemAtURL:a5 watchingFile:a8 & 1 withLastEventID:a6])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __121__NSFileAccessArbiter_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses___block_invoke;
      v15[3] = &unk_1E51FD1A8;
      v15[4] = v14;
      [(NSFileAccessArbiter *)self _enumerateSubarbitersUsingBlock:v15];
    }
  }
}

- (void)_enumerateSubarbitersUsingBlock:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  subarbitrationClaimsByID = self->_subarbitrationClaimsByID;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__NSFileAccessArbiter__enumerateSubarbitersUsingBlock___block_invoke;
  v4[3] = &unk_1E51FD040;
  v4[4] = a3;
  [(NSMutableDictionary *)subarbitrationClaimsByID enumerateKeysAndObjectsUsingBlock:v4];
}

- (BOOL)_addPresenter:(id)a3 ofItemAtURL:(id)a4 watchingFile:(BOOL)a5 withLastEventID:(id)a6
{
  BOOL v7 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v11 = (void *)[a3 reactorID];
  uint64_t v12 = [(NSMutableDictionary *)self->_reactorsByID objectForKey:v11];
  if (v12)
  {
    if (!self->_isSubarbiter)
    {
      uint64_t v13 = _NSFCPresenterLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_181795000, v13, OS_LOG_TYPE_DEFAULT, "Ignored new presenter %{public}@, because one with the same ID already exists", buf, 0xCu);
      }
    }
  }
  else
  {
    if (!self->_isSubarbiter)
    {
      uint64_t v14 = _NSFCPresenterLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_181795000, v14, OS_LOG_TYPE_DEFAULT, "Added presenter %{public}@", buf, 0xCu);
      }
    }
    [(NSMutableDictionary *)self->_reactorsByID setObject:a3 forKey:v11];
    if (self->_isSubarbiter) {
      [a3 setInSubarbiter:1];
    }
    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Presenter: %@ (%d)", [v11 description], -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier")), "UTF8String");
    uint64_t v15 = (void *)os_transaction_create();
    [(NSMutableDictionary *)self->_reactorTransactionsByID setObject:v15 forKey:v11];

    if (a4)
    {
      id v16 = [(NSFileAccessNode *)self->_rootNode descendantForFileURL:a4];
      if (v16) {
        [a3 setItemLocation:v16];
      }
    }
    if (v7 && ([a3 inSubarbiter] & 1) == 0)
    {
      queue = self->_queue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke;
      v19[3] = &unk_1E51FCFF0;
      v19[4] = self;
      [a3 startWatchingWithQueue:queue lastEventID:a6 unannouncedMoveHandler:v19];
    }
    if (!self->_isSubarbiter) {
      [a3 startObservingApplicationStateWithQueue:self->_queue];
    }
  }
  return v12 == 0;
}

uint64_t __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_305(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

void __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _NSFCProviderLog();
  BOOL v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109378;
      int v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = a2;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Error occurred while asking fileproviderd (%d) to prepare providers: %{public}@", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    int v15 = v9;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "fileproviderd (%d) finished preparing providers", buf, 8u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_305;
  block[3] = &unk_1E51FD4F0;
  v10 = *(NSObject **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  BOOL v13 = a2 == 0;
  block[4] = v11;
  block[5] = a3;
  dispatch_async(v10, block);
}

+ (void)ensureProvidersIfNecessaryForClaim:(id)a3 user:(unsigned int)a4 atLocations:(id)a5 queue:(id)a6 thenContinue:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)a6);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [a5 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(a5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v16) itemProvider]) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [a5 countByEnumeratingWithState:&v20 objects:v19 count:16];
        if (v14) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    if (_MergedGlobals_17) {
      goto LABEL_11;
    }
    (*((void (**)(id))a7 + 2))(a7);
  }
  else
  {
LABEL_11:
    [a3 blockClaimerForReason:@"Preparing file providers"];
    uint64_t v17 = [a3 allURLs];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __108__NSFileAccessArbiter_FileProvider__ensureProvidersIfNecessaryForClaim_user_atLocations_queue_thenContinue___block_invoke;
    v18[3] = &unk_1E51FD540;
    v18[4] = a6;
    v18[5] = a3;
    v18[6] = @"Preparing file providers";
    v18[7] = a7;
    [a1 _wakeUpFileProviderWithUID:v10 urls:v17 queue:a6 thenContinue:v18];
  }
}

+ (void)_wakeUpFileProviderWithUID:(unsigned int)a3 urls:(id)a4 queue:(id)a5 thenContinue:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)a5);
  if (_NSFCIPPB)
  {
    block[5] = MEMORY[0x1E4F143A8];
    void block[6] = 3221225472;
    block[7] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke;
    block[8] = &unk_1E51FD4C8;
    block[9] = a5;
    block[10] = a6;
    (*(void (**)(void))(_NSFCIPPB + 16))();
  }
  else if (_NSFCIP)
  {
    uint64_t v10 = (void (*)(id, uint64_t, void))*((void *)a6 + 2);
    v10(a6, 1, 0);
  }
  else
  {
    if (qword_1EB1EC140 != -1) {
      dispatch_once(&qword_1EB1EC140, &__block_literal_global_300);
    }
    BOOL v11 = [+[NSFileManager defaultManager] _processCanAccessUbiquityIdentityToken];
    if (v9 != -2 && v9 && v11 && off_1EB1EC138)
    {
      uint64_t v12 = _NSFCProviderLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = v9;
        _os_log_impl(&dword_181795000, v12, OS_LOG_TYPE_INFO, "Waking up fileproviderd (%d) to prepare providers", buf, 8u);
      }
      ++_MergedGlobals_17;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_304;
      v13[3] = &unk_1E51FD518;
      int v14 = v9;
      v13[4] = a5;
      v13[5] = a6;
      off_1EB1EC138(v9, a4, v13);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_4;
      block[3] = &unk_1E51F8650;
      block[4] = a6;
      dispatch_async((dispatch_queue_t)a5, block);
    }
  }
}

uint64_t __108__NSFileAccessArbiter_FileProvider__ensureProvidersIfNecessaryForClaim_user_atLocations_queue_thenContinue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (a3) {
    [*(id *)(a1 + 40) whenDevaluedPerformProcedure:a3];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 unblockClaimerForReason:v6];
}

- (NSFileAccessArbiter)initWithQueue:(id)a3 isSubarbiter:(BOOL)a4 listener:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NSFileAccessArbiter;
  int v8 = [(NSFileAccessArbiter *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v9->_listenerConnection = (NSXPCListener *)a5;
    v9->_isSubarbiter = a4;
    v9->_accessClaimsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_accessClaimTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_subarbitrationClaimsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_reactorsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_reactorTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_kernelMaterializationClaimCancellers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_kernelMaterializationClaimTransactions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9->_rootNode = [[NSFileAccessNode alloc] initWithParent:0 name:@"/" normalizedName:@"/"];
    uint64_t v10 = (void *)MEMORY[0x185308110]();
    id v11 = -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/etc" isDirectory:1]);
    objc_msgSend(v11, "setSymbolicLinkDestination:", -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", @"/private/etc", 1)));
    id v12 = -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp" isDirectory:1]);
    objc_msgSend(v12, "setSymbolicLinkDestination:", -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", @"/private/tmp", 1)));
    id v13 = -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var" isDirectory:1]);
    objc_msgSend(v13, "setSymbolicLinkDestination:", -[NSFileAccessNode descendantForFileURL:](v9->_rootNode, "descendantForFileURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", @"/private/var", 1)));
    if (!v9->_isSubarbiter) {
      [(NSFileAccessArbiter *)v9 _registerForDebugInfoRequests];
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];

  [(NSMutableDictionary *)self->_accessClaimsByID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_76];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  kernelMaterializationClaimCancellers = self->_kernelMaterializationClaimCancellers;
  uint64_t v4 = [(NSMutableDictionary *)kernelMaterializationClaimCancellers countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(kernelMaterializationClaimCancellers);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * i) + 16))();
      }
      uint64_t v5 = [(NSMutableDictionary *)kernelMaterializationClaimCancellers countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v5);
  }

  dispatch_release((dispatch_object_t)self->_queue);
  debugSignalSource = self->_debugSignalSource;
  if (debugSignalSource)
  {
    dispatch_source_cancel(debugSignalSource);
    dispatch_release((dispatch_object_t)self->_debugSignalSource);
  }
  v9.receiver = self;
  v9.super_class = (Class)NSFileAccessArbiter;
  [(NSFileAccessArbiter *)&v9 dealloc];
}

uint64_t __30__NSFileAccessArbiter_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 disavowed];
}

uint64_t __58__NSFileAccessArbiter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCanceledClient:*(void *)(a1 + 40)];
}

uint64_t __41__NSFileAccessArbiter__grantAccessClaim___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_181795000, v0, OS_LOG_TYPE_ERROR, "A process invoked one of the -[NSFileCoordinator coordinate...] methods but filecoordinationd crashed. Returning an error.", v2, 2u);
  }
  return 1;
}

- (void)_grantSubarbitrationClaim:(id)a3 withServer:(id)a4
{
  v8[7] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  objc_msgSend(a4, "setRemoteObjectInterface:", +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  [a3 setSubarbiterConnection:a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NSFileAccessArbiter__grantSubarbitrationClaim_withServer___block_invoke;
  v8[3] = &unk_1E51FAD68;
  v8[4] = a3;
  v8[5] = a4;
  v8[6] = self;
  [a4 setInterruptionHandler:v8];
  [a4 setUserInfo:a3];
  [a4 _setQueue:self->_queue];
  [a4 resume];
  -[NSMutableDictionary setObject:forKey:](self->_subarbitrationClaimsByID, "setObject:forKey:", a3, [a3 claimID]);
  [(NSFileAccessArbiter *)self _grantAccessClaim:a3];
}

void __60__NSFileAccessArbiter__grantSubarbitrationClaim_withServer___block_invoke(id *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [a1[4] claimID];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "cancelling a connection for subarbitration claim %{public}@", (uint8_t *)&v4, 0xCu);
  }
  [a1[5] setUserInfo:0];
  [a1[5] invalidate];
  [a1[6] _handleCanceledClient:a1[5]];
}

- (void)_writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  v128[9] = *MEMORY[0x1E4F143B8];
  uint64_t v111 = 0;
  uint64_t v110 = 0;
  p_rootNode = &self->_rootNode;
  id v14 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](self->_rootNode, "pathToDescendantForFileURL:componentRange:", [a4 logicalURL], &v110);
  uint64_t v109 = 0;
  uint64_t v108 = 0;
  uint64_t v15 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](*p_rootNode, "pathToDescendantForFileURL:componentRange:", [a5 logicalURL], &v108);
  if (v14)
  {
    uint64_t v16 = (void *)v15;
    if (v15)
    {
      id v17 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v14, v110, v111, 0);
      id v18 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v16, v108, v109, 0);
      if (v18 == v17)
      {
        uint64_t v20 = [a4 physicalURL];
        uint64_t v21 = [a5 physicalURL];
        uint64_t v22 = v21;
        if (v20)
        {
          int v23 = _CFURLIsItemPromiseAtURL();
          BOOL v24 = v23 != 0;
          if (v22)
          {
            int v25 = v23 != 0;
            int v26 = _CFURLIsItemPromiseAtURL() != 0;
            if (v25 == v26) {
              return;
            }
          }
          else
          {
            if (!v23) {
              return;
            }
            LOBYTE(v26) = 0;
            BOOL v24 = 1;
          }
        }
        else
        {
          if (!v21 || !_CFURLIsItemPromiseAtURL()) {
            return;
          }
          BOOL v24 = 0;
          LOBYTE(v26) = 1;
        }
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_52;
        v55[3] = &__block_descriptor_34_e30_v16__0__NSFilePresenterProxy_8l;
        BOOL v56 = v24;
        char v57 = v26;
        [v17 forEachPresenterOfItemPerformProcedure:v55];
        return;
      }
      if (v17)
      {
        if (self->_isSubarbiter) {
          goto LABEL_6;
        }
        v128[0] = MEMORY[0x1E4F143A8];
        v128[1] = 3221225472;
        v128[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke;
        v128[3] = &unk_1E51FCE68;
        v128[4] = a4;
        v128[5] = a5;
        v128[7] = a7;
        v128[8] = a6;
        v128[6] = a3;
        [v17 forEachPresenterOfContainingItemPerformProcedure:v128];
        v27 = (void *)[v17 itemProvider];
        unint64_t v53 = (unint64_t)v27;
        if (!v27)
        {
LABEL_6:
          unint64_t v53 = 0;
          id v19 = -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](self->_rootNode, "descendantAtPath:componentRange:forAddingLeafNode:create:", v16, v108, v109 - 1, v17, 1, 0);
        }
        else
        {
          uint64_t v49 = objc_msgSend(v17, "pathFromAncestor:", objc_msgSend(v27, "itemLocation"));
          id v19 = -[NSFileAccessNode descendantAtPath:componentRange:forAddingLeafNode:create:](self->_rootNode, "descendantAtPath:componentRange:forAddingLeafNode:create:", v16, v108, v109 - 1, v17, 1, v49);
        }
        id v54 = v19;
        uint64_t v102 = 0;
        v103 = &v102;
        uint64_t v104 = 0x3052000000;
        v105 = __Block_byref_object_copy__27;
        v106 = __Block_byref_object_dispose__27;
        uint64_t v107 = 0;
        if ((id)[v17 parent] != v19)
        {
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_35;
          v101[3] = &unk_1E51FCE90;
          v101[4] = &v102;
          [v17 forEachProgressPublisherOfItemPerformProcedure:v101];
        }
        id v50 = a3;
        fsid v51 = a6;
        unint64_t v52 = a7;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        v28 = (void *)v103[5];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v124 objects:v123 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v125;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v125 != v30) {
                objc_enumerationMutation(v28);
              }
              [*(id *)(*((void *)&v124 + 1) + 8 * i) setItemLocation:0];
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v124 objects:v123 count:16];
          }
          while (v29);
        }

        id v32 = v18;
        objc_msgSend(v17, "setParent:name:", v54, objc_msgSend(v16, "objectAtIndex:", v108 + v109 - 1));
        uint64_t v95 = 0;
        v96 = &v95;
        uint64_t v97 = 0x3052000000;
        v98 = __Block_byref_object_copy__27;
        v99 = __Block_byref_object_dispose__27;
        uint64_t v100 = 0;
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2;
        v94[3] = &unk_1E51FCEB8;
        v94[4] = &v95;
        [v17 forEachPresenterOfItemOrContainedItemPerformProcedure:v94];
        long long v122 = 0u;
        long long v121 = 0u;
        long long v120 = 0u;
        long long v119 = 0u;
        v33 = (void *)v96[5];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v119 objects:v118 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v120;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v120 != v35) {
                objc_enumerationMutation(v33);
              }
              v37 = *(void **)(*((void *)&v119 + 1) + 8 * j);
              v38 = objc_msgSend((id)objc_msgSend(v37, "itemLocation"), "pathFromAncestor:", v17);
              objc_msgSend(v37, "setItemLocation:", objc_msgSend(v17, "descendantAtPath:componentRange:create:", v38, 0, objc_msgSend(v38, "count"), 1));
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v119 objects:v118 count:16];
          }
          while (v34);
        }

        if (!self->_isSubarbiter)
        {
          v117[0] = MEMORY[0x1E4F143A8];
          v117[1] = 3221225472;
          v117[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_3;
          v117[3] = &unk_1E51FCEE0;
          v117[4] = v50;
          v117[5] = a5;
          v117[7] = v51;
          v117[6] = v52;
          [v17 forEachPresenterOfItemOrContainedItemPerformProcedure:v117];
          uint64_t v39 = [v17 itemProvider];
          if (v53 | v39)
          {
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_4;
            v93[3] = &unk_1E51FCF08;
            v93[4] = v53;
            v93[5] = v48;
            v93[6] = v17;
            v93[7] = v39;
            [v17 forEachPresenterOfItemOrContainedItemPerformProcedure:v93];
          }
        }
        if (v18)
        {
          uint64_t v87 = 0;
          v88 = &v87;
          uint64_t v89 = 0x3052000000;
          v90 = __Block_byref_object_copy__27;
          v91 = __Block_byref_object_dispose__27;
          uint64_t v92 = 0;
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_5;
          v86[3] = &unk_1E51FCEB8;
          v86[4] = &v87;
          [v18 forEachPresenterOfItemOrContainedItemPerformProcedure:v86];
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          v40 = (void *)v88[5];
          uint64_t v41 = [v40 countByEnumeratingWithState:&v113 objects:v112 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v114;
            do
            {
              for (uint64_t k = 0; k != v41; ++k)
              {
                if (*(void *)v114 != v42) {
                  objc_enumerationMutation(v40);
                }
                v44 = *(void **)(*((void *)&v113 + 1) + 8 * k);
                v45 = objc_msgSend((id)objc_msgSend(v44, "itemLocation"), "pathFromAncestor:", v18);
                objc_msgSend(v44, "setItemLocation:", objc_msgSend(v17, "descendantAtPath:componentRange:create:", v45, 0, objc_msgSend(v45, "count"), 1));
              }
              uint64_t v41 = [v40 countByEnumeratingWithState:&v113 objects:v112 count:16];
            }
            while (v41);
          }

          uint64_t v80 = 0;
          v81 = &v80;
          uint64_t v82 = 0x3052000000;
          v83 = __Block_byref_object_copy__27;
          v84 = __Block_byref_object_dispose__27;
          uint64_t v85 = 0;
          uint64_t v74 = 0;
          v75 = &v74;
          uint64_t v76 = 0x3052000000;
          v77 = __Block_byref_object_copy__27;
          v78 = __Block_byref_object_dispose__27;
          uint64_t v79 = 0;
          v73[0] = MEMORY[0x1E4F143A8];
          v73[1] = 3221225472;
          v73[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_6;
          v73[3] = &unk_1E51FCF30;
          v73[4] = &v80;
          v73[5] = &v74;
          [v18 forEachAccessClaimOnItemOrContainedItemPerformProcedure:v73];
          v46 = (void *)v81[5];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_7;
          v72[3] = &unk_1E51FCF58;
          v72[5] = v17;
          v72[6] = &v74;
          v72[4] = v18;
          [v46 enumerateObjectsUsingBlock:v72];

          uint64_t v66 = 0;
          v67 = &v66;
          uint64_t v68 = 0x3052000000;
          v69 = __Block_byref_object_copy__27;
          v70 = __Block_byref_object_dispose__27;
          uint64_t v71 = 0;
          uint64_t v60 = 0;
          v61 = &v60;
          uint64_t v62 = 0x3052000000;
          v63 = __Block_byref_object_copy__27;
          v64 = __Block_byref_object_dispose__27;
          uint64_t v65 = 0;
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_49;
          v59[3] = &unk_1E51FCF80;
          v59[4] = &v66;
          v59[5] = &v60;
          [v18 forEachProgressThingOfItemOrContainedItemPerformProcedure:v59];
          v47 = (void *)v67[5];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2_51;
          v58[3] = &unk_1E51FCF58;
          v58[5] = v17;
          v58[6] = &v60;
          v58[4] = v18;
          [v47 enumerateObjectsUsingBlock:v58];

          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(&v66, 8);
          _Block_object_dispose(&v74, 8);
          _Block_object_dispose(&v80, 8);
          _Block_object_dispose(&v87, 8);
        }

        _Block_object_dispose(&v95, 8);
        _Block_object_dispose(&v102, 8);
      }
    }
  }
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke(void *a1, void *a2)
{
  return [a2 observeMoveOfSubitemAtURL:a1[4] toURL:a1[5] byWriterWithPurposeID:a1[6] withFSID:a1[8] andFileID:a1[7]];
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_35(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }

  return [v4 addObject:a2];
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }

  return [v4 addObject:a2];
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) physicalURL];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);

  return [a2 observeMoveByWriterWithPurposeID:v4 withPhysicalDestinationURL:v5 withFSID:v6 andFileID:v7];
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)[a2 itemLocation];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "itemLocation"), "urlOfSubitemAtPath:plusPath:", *(void *)(a1 + 40), objc_msgSend(v4, "pathFromAncestor:", *(void *)(a1 + 48)));
  if (*(void *)(a1 + 56))
  {
    uint64_t v6 = [v4 url];
    uint64_t v7 = *(void **)(a1 + 56);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  if (v7 == *(void **)(a1 + 32))
  {
    int v8 = @"itemMoved";
    objc_super v9 = a2;
    uint64_t v10 = v5;
    uint64_t v11 = v6;
  }
  else
  {
    [*(id *)(a1 + 32) observePresentationChangeOfKind:@"removed" withPresenter:a2 url:v5 newURL:0];
    int v8 = @"added";
    uint64_t v7 = *(void **)(a1 + 56);
    objc_super v9 = a2;
    uint64_t v10 = v6;
    uint64_t v11 = 0;
  }

  return [v7 observePresentationChangeOfKind:v8 withPresenter:v9 url:v10 newURL:v11];
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }

  return [v4 addObject:a2];
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v6 addObject:a2];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }

  return [v7 addObject:a3];
}

void __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectAtIndex:");
  uint64_t v5 = (void *)[v4 pathFromAncestor:*(void *)(a1 + 32)];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "descendantAtPath:componentRange:create:", v5, 0, objc_msgSend(v5, "count"), 1);
  if ((void *)v6 == v4)
  {
    uint64_t v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_fault_impl(&dword_181795000, v7, OS_LOG_TYPE_FAULT, "An arbiter is confusing itself after a file was moved while telling claims about node replacement", v8, 2u);
    }
  }
  else
  {
    [a2 itemAtLocation:v4 wasReplacedByItemAtLocation:v6];
  }
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_49(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v6 addObject:a2];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }

  return [v7 addObject:a3];
}

void __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_2_51(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectAtIndex:");
  uint64_t v5 = (void *)[v4 pathFromAncestor:*(void *)(a1 + 32)];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "descendantAtPath:componentRange:create:", v5, 0, objc_msgSend(v5, "count"), 1);
  if ((void *)v6 == v4)
  {
    uint64_t v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_fault_impl(&dword_181795000, v7, OS_LOG_TYPE_FAULT, "An arbiter is confusing itself after a file was moved while telling progress things about node replacement", v8, 2u);
    }
  }
  else
  {
    [a2 setItemLocation:v6];
  }
}

uint64_t __86__NSFileAccessArbiter__writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke_52(uint64_t result, void *a2)
{
  if (*(unsigned char *)(result + 32))
  {
    if (!*(unsigned char *)(result + 33)) {
      return [a2 promisedFileWasFulfilled];
    }
  }
  else if (*(unsigned char *)(result + 33))
  {
    return [a2 localFileWasEvicted];
  }
  return result;
}

uint64_t __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v12 = _NSFCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = a2;
    _os_log_impl(&dword_181795000, v12, OS_LOG_TYPE_INFO, "Detected file move on behalf of writing claim %{public}@", buf, 0xCu);
  }
  long long v13 = +[NSURLPromisePair pairWithLogicalURL:a3 physicalURL:0];
  id v14 = +[NSURLPromisePair pairWithLogicalURL:a4 physicalURL:0];
  [*(id *)(a1 + 32) _writerWithPurposeID:a2 didMoveItemAtURL:v13 toURL:v14 withFSID:a5 andFileID:a6];
  uint64_t v15 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke_57;
  v17[3] = &unk_1E51FCFC8;
  v17[4] = a2;
  v17[5] = v13;
  v17[7] = a6;
  v17[8] = a5;
  v17[6] = v14;
  return [v15 _enumerateSubarbitersUsingBlock:v17];
}

uint64_t __78__NSFileAccessArbiter__addPresenter_ofItemAtURL_watchingFile_withLastEventID___block_invoke_57(void *a1, void *a2)
{
  return [a2 writerWithPurposeID:a1[4] didMoveItemAtURL:a1[5] toURL:a1[6] withFSID:a1[8] andFileID:a1[7]];
}

- (BOOL)_addProvider:(id)a3 ofItemsAtURL:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 reactorID];
  uint64_t v8 = [a3 uniqueID];
  if (!self->_isSubarbiter)
  {
    uint64_t v9 = _NSFCProviderLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v7;
      _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Added provider %{public}@", buf, 0xCu);
    }
  }
  id v10 = [(NSFileAccessNode *)self->_rootNode descendantForFileURL:a4];
  if (!v10)
  {
    long long v12 = _NSFCProviderLog();
    BOOL v16 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v16) {
      return result;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v7;
    uint64_t v15 = "Added provider %{public}@ failed because no node was found";
    goto LABEL_10;
  }
  id v11 = v10;
  [a3 setItemLocation:v10];
  if ((id)[a3 itemLocation] != v11)
  {
    long long v12 = _NSFCProviderLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v7;
    uint64_t v15 = "Added provider %{public}@ failed because -setItemLocation: failed";
LABEL_10:
    _os_log_impl(&dword_181795000, v12, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    return 0;
  }
  [(NSMutableDictionary *)self->_reactorsByID setObject:a3 forKey:v8];
  -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Provider: %@ (%d)", [v7 description], -[NSXPCConnection processIdentifier](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "processIdentifier")), "UTF8String");
  id v17 = (void *)os_transaction_create();
  [(NSMutableDictionary *)self->_reactorTransactionsByID setObject:v17 forKey:v8];

  return 1;
}

- (void)_willRemoveReactor:(id)a3
{
  if (object_getClass(a3) == (Class)NSFilePresenterProxy)
  {
    [a3 stopObservingApplicationState];
    uint64_t v5 = [a3 reactorID];
  }
  else
  {
    if (object_getClass(a3) != (Class)NSFileProviderProxy)
    {
      qword_1E8EDF350 = (uint64_t)"Unexpected type as argument to _willRemoveReactor";
      __break(1u);
      return;
    }
    uint64_t v5 = [a3 uniqueID];
  }
  uint64_t v6 = v5;
  [a3 setItemLocation:0];
  [a3 invalidate];
  reactorTransactionsByID = self->_reactorTransactionsByID;

  [(NSMutableDictionary *)reactorTransactionsByID removeObjectForKey:v6];
}

- (void)_removeReactorForID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_reactorsByID, "objectForKey:");
  if (v5)
  {
    uint64_t v6 = v5;
    if (object_getClass(v5) == (Class)NSFileProviderProxy)
    {
      uint64_t v7 = _NSFCProviderLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v9 = 138543362;
        *(void *)&v9[4] = [v6 reactorID];
        uint64_t v8 = "Removed provider %{public}@";
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v7 = _NSFCPresenterLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v9 = 138543362;
        *(void *)&v9[4] = [v6 reactorID];
        uint64_t v8 = "Removed presenter %{public}@";
LABEL_7:
        _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 0xCu);
      }
    }
    -[NSFileAccessArbiter _willRemoveReactor:](self, "_willRemoveReactor:", v6, *(_OWORD *)v9);
    [(NSMutableDictionary *)self->_reactorsByID removeObjectForKey:a3];
  }
}

- (void)_startArbitratingItemsAtURLs:(id)a3 withSuperarbitrationServer:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [a3 count];
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Starting subarbitration for %lu URLs", buf, 0xCu);
  }
  if (!self->_isSubarbiter)
  {
    uint64_t v8 = _NSFCClaimsLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "NSFileCoordinator: A superarbiter was told to start arbitrating, which is a surprise.";
    goto LABEL_19;
  }
  if (self->_superarbitrationServer)
  {
    uint64_t v8 = _NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "NSFileCoordinator: A subarbiter was told by a superarbiter to start subarbitrating twice, which is a surprise.";
LABEL_19:
      _os_log_fault_impl(&dword_181795000, v8, OS_LOG_TYPE_FAULT, v9, buf, 2u);
    }
  }
LABEL_8:
  self->_superarbitrationServer = (NSXPCConnection *)a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(a3);
        }
        id v14 = [(NSFileAccessNode *)self->_rootNode descendantForFileURL:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v14) {
          [v14 setArbitrationBoundary];
        }
      }
      uint64_t v11 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v11);
  }
}

- (void)stopArbitrating
{
  v3[5] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__NSFileAccessArbiter_stopArbitrating__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = self;
  dispatch_sync(queue, v3);
}

uint64_t __38__NSFileAccessArbiter_stopArbitrating__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_INFO, "Stopping subarbitration", buf, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];

  *(void *)(*(void *)(a1 + 32) + 96) = 0;
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 104));
    *(void *)(*(void *)(a1 + 32) + 104) = 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 88);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__NSFileAccessArbiter_stopArbitrating__block_invoke_64;
  v11[3] = &unk_1E51FD018;
  v11[4] = v4;
  v11[5] = v5;
  [v6 forEachAccessClaimOnItemOrContainedItemPerformProcedure:v11];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v10++) revoked];
      }
      while (v8 != v10);
      uint64_t result = [v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
      uint64_t v8 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __38__NSFileAccessArbiter_stopArbitrating__block_invoke_64(uint64_t a1, void *a2)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if ([a2 cameFromSuperarbiter])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 addObject:a2];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__NSFileAccessArbiter_stopArbitrating__block_invoke_2;
    v6[3] = &unk_1E51F71D0;
    v6[4] = *(void *)(a1 + 40);
    return [a2 whenDevaluedPerformProcedure:v6];
  }
}

uint64_t __38__NSFileAccessArbiter_stopArbitrating__block_invoke_2()
{
  return self;
}

- (id)rootNode
{
  v2 = self->_rootNode;

  return v2;
}

- (NSXPCConnection)superarbitrationConnection
{
  v2 = self->_superarbitrationServer;

  return v2;
}

uint64_t __55__NSFileAccessArbiter__enumerateSubarbitersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isGranted];
  if (result)
  {
    uint64_t result = [a3 nullified];
    if ((result & 1) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "subarbiterConnection"), "remoteObjectProxy");
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
      return v8(v6, v7);
    }
  }
  return result;
}

- (void)grantSubarbitrationClaim:(id)a3 withServer:(id)a4 reply:(id)a5
{
  v12[5] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = +[NSXPCConnection currentConnection];
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__NSFileAccessArbiter_grantSubarbitrationClaim_withServer_reply___block_invoke;
  v12[3] = &unk_1E51FD068;
  v12[4] = a5;
  [a3 acceptClaimFromClient:v9 arbiterQueue:queue grantHandler:v12];
  uint64_t v11 = [[NSXPCConnection alloc] initWithListenerEndpoint:a4];
  [(NSXPCConnection *)v11 setExportedObject:self];
  [(NSXPCConnection *)v11 setExportedInterface:+[NSFileCoordinator _fileAccessArbiterInterface]];
  [(NSFileAccessArbiter *)self _grantSubarbitrationClaim:a3 withServer:v11];
}

uint64_t __65__NSFileAccessArbiter_grantSubarbitrationClaim_withServer_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performMateralizationOfURL:(id)a3 withProvider:(id)a4 fakeClaim:(id)a5 kernelInfo:(id)a6 requestID:(id)a7 fromProcess:(id *)a8 completionHandler:(id)a9
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Nspace Materialization: %@ (%d)", [a5 claimID], a8->var0[5]), "UTF8String");
  long long v16 = (void *)os_transaction_create();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __124__NSFileAccessArbiter_performMateralizationOfURL_withProvider_fakeClaim_kernelInfo_requestID_fromProcess_completionHandler___block_invoke;
  v19[3] = &unk_1E51FD090;
  v19[4] = a5;
  void v19[5] = a7;
  v19[6] = self;
  v19[7] = a9;
  long long v17 = *(_OWORD *)&a8->var0[4];
  v20[0] = *(_OWORD *)a8->var0;
  v20[1] = v17;
  uint64_t v18 = [a4 provideItemForKernelRequestWithInfo:a6 atURL:a3 forProcess:v20 withOptions:0x40000000 completionHandler:v19];
  if (a7)
  {
    [(NSMutableDictionary *)self->_kernelMaterializationClaimCancellers setObject:v18 forKey:a7];
    [(NSMutableDictionary *)self->_kernelMaterializationClaimTransactions setObject:v16 forKey:a7];
  }
}

uint64_t __124__NSFileAccessArbiter_performMateralizationOfURL_withProvider_fakeClaim_kernelInfo_requestID_fromProcess_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) revoked];
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 72), "removeObjectForKey:");
    [*(id *)(*(void *)(a1 + 48) + 80) removeObjectForKey:*(void *)(a1 + 40)];
  }
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = [a2 providedItemRecursiveGenerationCount];
  uint64_t v6 = [a2 error];
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v7(v4, v5, v6);
}

- (void)makeProviderMaterializeFileAtURL:(id)a3 kernelInfo:(id)a4 withRequestID:(id)a5 fromProcess:(id *)a6 completionHandler:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v17 = 0;
  uid_t v16 = 0;
  if (_NSFCGetFileProviderUIDFOrURL(a3, &v16, &v17))
  {
    uint64_t v13 = os_transaction_create();
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    long long v15 = *(_OWORD *)&a6->var0[4];
    long long v20 = *(_OWORD *)a6->var0;
    block[2] = __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke;
    block[3] = &unk_1E51FD0E0;
    block[4] = self;
    block[5] = a3;
    uid_t v19 = v16;
    void block[6] = a4;
    block[7] = a5;
    long long v21 = v15;
    block[8] = v13;
    block[9] = a7;
    dispatch_async(queue, block);
  }
  else
  {
    (*((void (**)(id, void, uint64_t))a7 + 2))(a7, 0, v17);
  }
}

void __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "rootNode"), "descendantForFileURL:", *(void *)(a1 + 40));
  uint64_t v3 = [[NSFileReadingClaim alloc] initWithPurposeID:@"kernel-provider-materialization" url:*(void *)(a1 + 40) options:0 claimer:0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(unsigned int *)(a1 + 80);
  v19[0] = v2;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 48);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v12[1] = 3221225472;
  v12[2] = __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke_2;
  v12[3] = &unk_1E51FD0B8;
  v12[4] = v2;
  long long v13 = v7;
  long long v14 = v3;
  long long v10 = *(_OWORD *)(a1 + 100);
  long long v17 = *(_OWORD *)(a1 + 84);
  long long v18 = v10;
  long long v11 = *(_OWORD *)(a1 + 64);
  long long v15 = v8;
  long long v16 = v11;
  [v4 ensureProvidersIfNecessaryForClaim:v3 user:v5 atLocations:v6 queue:v9 thenContinue:v12];
}

void __111__NSFileAccessArbiter_makeProviderMaterializeFileAtURL_kernelInfo_withRequestID_fromProcess_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemProvider];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 88);
    long long v10 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 96);
    *(_OWORD *)&uint8_t buf[16] = v10;
    [v4 performMateralizationOfURL:v5 withProvider:v3 fakeClaim:v6 kernelInfo:v7 requestID:v8 fromProcess:buf completionHandler:v9];
  }
  else
  {
    long long v11 = _NSFCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = [*(id *)(a1 + 72) intValue];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_INFO, "No provider found for materialization - req: %d", buf, 8u);
    }
    uid_t v19 = 0;
    id v20 = 0;
    if ([*(id *)(a1 + 48) getResourceValue:&v20 forKey:*MEMORY[0x1E4F1C628] error:&v19])
    {
      if ([v20 BOOLValue])
      {
        long long v13 = _NSFCLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v14 = [*(id *)(a1 + 72) intValue];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_181795000, v13, OS_LOG_TYPE_INFO, "Not materializing provider-less directory - req: %d", buf, 8u);
        }
      }
      else
      {
        uid_t v19 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:256 userInfo:0];
      }
    }
    else
    {
      long long v15 = _NSFCLog();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      long long v17 = v19;
      if (v16)
      {
        int v18 = [*(id *)(a1 + 72) intValue];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v18;
        _os_log_error_impl(&dword_181795000, v15, OS_LOG_TYPE_ERROR, "Unable to determine if provider-less fault is a directory: %@ - req: %d", buf, 0x12u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

- (void)resolveReparentRequestOfFileAtURL:(id)a3 toDestinationDirectory:(id)a4 withRequestID:(id)a5 operation:(unsigned int)a6 fromProcess:(id *)a7 completionHandler:(id)a8
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v19 = 0;
  uid_t v18 = 0;
  if (_NSFCGetFileProviderUIDFOrURL(a3, &v18, &v19))
  {
    uint64_t v15 = os_transaction_create();
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    long long v17 = *(_OWORD *)&a7->var0[4];
    long long v23 = *(_OWORD *)a7->var0;
    block[2] = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke;
    block[3] = &unk_1E51FD180;
    block[4] = self;
    block[5] = a3;
    uid_t v21 = v18;
    unsigned int v22 = a6;
    void block[6] = a4;
    block[7] = a5;
    long long v24 = v17;
    block[8] = v15;
    block[9] = a8;
    dispatch_async(queue, block);
  }
  else
  {
    (*((void (**)(id, void, void, uint64_t))a8 + 2))(a8, 0, 0, v19);
  }
}

void __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke(uint64_t a1)
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "rootNode"), "descendantForFileURL:", *(void *)(a1 + 40));
  v19[0] = +[NSFileAccessIntent readingIntentWithURL:*(void *)(a1 + 40) options:0];
  v19[1] = +[NSFileAccessIntent readingIntentWithURL:*(void *)(a1 + 48) options:0];
  uint64_t v3 = -[NSFileMultipleAccessClaim initWithPurposeID:intents:claimer:]([NSFileMultipleAccessClaim alloc], "initWithPurposeID:intents:claimer:", @"kernel-provider-reparent", [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2], 0);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(unsigned int *)(a1 + 80);
  uint64_t v18 = v2;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_2;
  v9[3] = &unk_1E51FD158;
  v9[4] = v2;
  long long v10 = *(_OWORD *)(a1 + 40);
  int v15 = *(_DWORD *)(a1 + 84);
  uint64_t v11 = v7;
  int v12 = v3;
  long long v17 = *(_OWORD *)(a1 + 104);
  long long v16 = *(_OWORD *)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 56);
  [v4 ensureProvidersIfNecessaryForClaim:v3 user:v5 atLocations:v6 queue:v8 thenContinue:v9];
}

void __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) itemProvider];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_3;
    long long v10 = &unk_1E51FD130;
    int v16 = *(_DWORD *)(a1 + 96);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = v3;
    long long v13 = v2;
    long long v14 = *(_OWORD *)(a1 + 64);
    long long v17 = *(_OWORD *)(a1 + 100);
    long long v18 = *(_OWORD *)(a1 + 116);
    uint64_t v15 = *(void *)(a1 + 88);
    objc_msgSend(v2, "movingItemAtURL:requiresProvidingWithDestinationDirectoryURL:newFileName:completionHandler:");
  }
  else
  {
    uint64_t v4 = _NSFCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = [*(id *)(a1 + 72) intValue];
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "No provider found for reparent request - req: %d", (uint8_t *)v6, 8u);
    }
    (*(void (**)(void, void, void, NSError *))(*(void *)(a1 + 88) + 16))(*(void *)(a1 + 88), 0, 0, +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:256 userInfo:0]);
  }
}

uint64_t __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([a2 requiresProviding] & 1) != 0
    || objc_msgSend((id)objc_msgSend(a2, "syncRootID"), "unsignedLongLongValue") == -1)
  {
    uint64_t v8 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:*(unsigned int *)(a1 + 80)];
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_4;
    v15[3] = &unk_1E51FD108;
    uint64_t v13 = *(void *)(a1 + 64);
    v15[4] = *(void *)(a1 + 72);
    long long v14 = *(_OWORD *)(a1 + 100);
    v16[0] = *(_OWORD *)(a1 + 84);
    v16[1] = v14;
    return [v9 performMateralizationOfURL:v10 withProvider:v11 fakeClaim:v12 kernelInfo:v8 requestID:v13 fromProcess:v16 completionHandler:v15];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "syncRootID"), "unsignedLongLongValue");
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(v4 + 16);
    return v6(v4, v5, 0, 0);
  }
}

uint64_t __134__NSFileAccessArbiter_resolveReparentRequestOfFileAtURL_toDestinationDirectory_withRequestID_operation_fromProcess_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelMaterializationWithRequestID:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NSFileAccessArbiter_cancelMaterializationWithRequestID___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __58__NSFileAccessArbiter_cancelMaterializationWithRequestID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 80);
    return [v4 removeObjectForKey:v3];
  }
  return result;
}

uint64_t __121__NSFileAccessArbiter_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) forwardUsingProxy:a2];
}

- (void)removePresenterWithID:(id)a3
{
  v5[5] = *MEMORY[0x1E4F143B8];
  -[NSFileAccessArbiter _removeReactorForID:](self, "_removeReactorForID:");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NSFileAccessArbiter_removePresenterWithID___block_invoke;
  v5[3] = &unk_1E51FD1A8;
  v5[4] = a3;
  [(NSFileAccessArbiter *)self _enumerateSubarbitersUsingBlock:v5];
}

uint64_t __45__NSFileAccessArbiter_removePresenterWithID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removePresenterWithID:*(void *)(a1 + 32)];
}

+ (id)entitlementForConnection:(id)a3 key:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(objc_getAssociatedObject(a3, &NSFCXPCEntitlements), "objectForKey:", a4);
  if (v6 == (void *)[MEMORY[0x1E4F1CA98] null]) {
    return 0;
  }
  if (!v6)
  {
    uint64_t v7 = _NSFCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543618;
      id v10 = a4;
      __int16 v11 = 2114;
      id v12 = a3;
      _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Add key: %{public}@ to entitlement cache for connection: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    return (id)[a3 valueForEntitlement:a4];
  }
  return v6;
}

- (void)addProvider:(id)a3 withID:(id)a4 uniqueID:(id)a5 forProvidedItemsURL:(id)a6 options:(unint64_t)a7 withServer:(id)a8 reply:(id)a9
{
  char v10 = a7;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = +[NSXPCConnection currentConnection];
  v34[0] = @"com.apple.private.foundation.fileprovideridentifier";
  v34[1] = @"application-identifier";
  int v16 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  if (!objc_getAssociatedObject(v15, &NSFCXPCEntitlements))
  {
    id v27 = a5;
    char v28 = v10;
    id v29 = a6;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v23 = [(NSXPCConnection *)v15 valueForEntitlement:v22];
          if (!v23) {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
          }
          [v17 setValue:v23 forKey:v22];
        }
        uint64_t v19 = [v16 countByEnumeratingWithState:&v36 objects:v35 count:16];
      }
      while (v19);
    }
    objc_setAssociatedObject(v15, &NSFCXPCEntitlements, v17, (void *)0x303);
    a6 = v29;
    a5 = v27;
    char v10 = v28;
  }
  if (v15) {
    -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)v15->_importInfo);
  }
  if (self->_isSubarbiter)
  {
    id v24 = 0;
  }
  else
  {
    id v24 = +[NSFileAccessArbiter entitlementForConnection:v15 key:@"com.apple.private.foundation.fileprovideridentifier"];
    if (!_NSIsNSString()) {
      id v24 = 0;
    }
  }
  uint64_t v25 = [[NSFileProviderProxy alloc] initWithClient:v15 remoteProvider:a3 reactorID:a4 secureID:v24 uniqueID:a5];
  [(NSFileProviderProxy *)v25 setWantsWriteNotifications:v10 & 1];
  [(NSFileReactorProxy *)v25 setEffectiveUserIdentifier:[(NSXPCConnection *)v15 effectiveUserIdentifier]];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke;
  v33[3] = &unk_1E51FD1D0;
  v33[4] = self;
  v33[5] = v25;
  v33[6] = a6;
  v33[7] = a9;
  if (a8)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_3;
    v32[3] = &unk_1E51F7F08;
    v32[4] = v33;
    int v26 = (void *)[a3 remoteObjectProxyWithErrorHandler:v32];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_102;
    v31[3] = &unk_1E51FD1F8;
    v31[4] = v33;
    [v26 checkInProviderWithReply:v31];
  }
  else
  {
    __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke((uint64_t)v33, 1);
  }
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke(uint64_t a1, int a2)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(unsigned char **)(a1 + 32);
    if (!v3[25])
    {
      if (![*(id *)(a1 + 40) allowedForURL:*(void *)(a1 + 48)]) {
        goto LABEL_7;
      }
      uint64_t v3 = *(unsigned char **)(a1 + 32);
    }
    if ([v3 _addProvider:*(void *)(a1 + 40) ofItemsAtURL:*(void *)(a1 + 48)])
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_2;
      v6[3] = &unk_1E51FD1A8;
      uint64_t v4 = *(void **)(a1 + 32);
      _DWORD v6[4] = *(void *)(a1 + 40);
      [v4 _enumerateSubarbitersUsingBlock:v6];
    }
  }
LABEL_7:

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) forwardUsingProxy:a2];
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"checkIn";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__NSFileAccessArbiter_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeProviderWithID:(id)a3 uniqueID:(id)a4
{
  v7[6] = *MEMORY[0x1E4F143B8];
  [(NSFileAccessArbiter *)self _removeReactorForID:a4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NSFileAccessArbiter_removeProviderWithID_uniqueID___block_invoke;
  v7[3] = &unk_1E51FD220;
  v7[4] = a3;
  v7[5] = a4;
  [(NSFileAccessArbiter *)self _enumerateSubarbitersUsingBlock:v7];
}

uint64_t __53__NSFileAccessArbiter_removeProviderWithID_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeProviderWithID:*(void *)(a1 + 32) uniqueID:*(void *)(a1 + 40)];
}

- (void)prepareToArbitrateForURLs:(id)a3
{
  uint64_t v5 = +[NSXPCConnection currentConnection];
  [(NSXPCConnection *)v5 setRemoteObjectInterface:+[NSFileCoordinator _fileAccessArbiterInterface]];

  [(NSFileAccessArbiter *)self _startArbitratingItemsAtURLs:a3 withSuperarbitrationServer:v5];
}

- (void)startArbitratingWithReply:(id)a3
{
}

- (void)provideDebugInfoWithLocalInfo:(id)a3 completionHandler:(id)a4
{
  void v12[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[NSXPCConnection currentConnection];
  uint64_t v8 = [(NSXPCConnection *)v7 processIdentifier];
  if (_NSFCIP
    || (id v9 = -[NSXPCConnection valueForEntitlement:](v7, "valueForEntitlement:", @"com.apple.private.foundation.filecoordination-debug"), _NSIsNSNumber())&& ([v9 BOOLValue] & 1) != 0|| !-[NSXPCConnection effectiveUserIdentifier](v7, "effectiveUserIdentifier"))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__NSFileAccessArbiter_provideDebugInfoWithLocalInfo_completionHandler___block_invoke;
    v12[3] = &unk_1E51FD248;
    v12[4] = a4;
    [(NSFileAccessArbiter *)self getDebugInformationIncludingEverything:0 withString:a3 fromPid:v8 thenContinue:v12];
  }
  else
  {
    uint64_t v10 = +[NSError errorWithDomain:@"NSPOSIXErrorDomain" code:1 userInfo:0];
    __int16 v11 = (void (*)(id, void, NSError *))*((void *)a4 + 2);
    v11(a4, 0, v10);
  }
}

uint64_t __71__NSFileAccessArbiter_provideDebugInfoWithLocalInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provideSubarbiterDebugInfoIncludingEverything:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v5 = a3;
  v13[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[NSXPCConnection currentConnection];
  if (_NSFCIP || (id v9 = v7, ![(NSXPCConnection *)v7 effectiveUserIdentifier]))
  {
    int v8 = 1;
LABEL_3:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__NSFileAccessArbiter_provideSubarbiterDebugInfoIncludingEverything_completionHandler___block_invoke;
    v13[3] = &unk_1E51FD248;
    v13[4] = a4;
    [(NSFileAccessArbiter *)self getDebugInformationIncludingEverything:v8 & v5 withString:0 fromPid:0 thenContinue:v13];
    return;
  }
  id v10 = [(NSXPCConnection *)v9 valueForEntitlement:@"com.apple.private.foundation.filecoordination-debug"];
  if (_NSIsNSNumber() && [v10 BOOLValue])
  {
    int v8 = 0;
    goto LABEL_3;
  }
  __int16 v11 = +[NSError errorWithDomain:@"NSPOSIXErrorDomain" code:1 userInfo:0];
  id v12 = (void (*)(id, void, NSError *))*((void *)a4 + 2);

  v12(a4, 0, v11);
}

uint64_t __87__NSFileAccessArbiter_provideSubarbiterDebugInfoIncludingEverything_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performBarrierWithCompletionHandler:(id)a3
{
}

- (void)_handleCanceledClient:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _NSFCClaimsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_INFO, "A file coordination client died", buf, 2u);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  accessClaimsByID = self->_accessClaimsByID;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _OWORD v16[2] = __45__NSFileAccessArbiter__handleCanceledClient___block_invoke;
  v16[3] = &unk_1E51FD270;
  v16[4] = a3;
  v16[5] = v7;
  v16[6] = self;
  v16[7] = v6;
  [(NSMutableDictionary *)accessClaimsByID enumerateKeysAndObjectsUsingBlock:v16];
  [(NSMutableDictionary *)self->_accessClaimsByID removeObjectsForKeys:v7];
  [(NSMutableDictionary *)self->_subarbitrationClaimsByID removeObjectsForKeys:v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v12++) unblock];
      }
      while (v10 != v12);
      uint64_t v10 = [v6 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v10);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  reactorsByID = self->_reactorsByID;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__NSFileAccessArbiter__handleCanceledClient___block_invoke_107;
  v15[3] = &unk_1E51FD298;
  v15[4] = a3;
  void v15[5] = v13;
  void v15[6] = self;
  [(NSMutableDictionary *)reactorsByID enumerateKeysAndObjectsUsingBlock:v15];
  [(NSMutableDictionary *)self->_reactorsByID removeObjectsForKeys:v13];
}

uint64_t __45__NSFileAccessArbiter__handleCanceledClient___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a3 client];
  if (result == *(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) addObject:a2];
    [*(id *)(*(void *)(a1 + 48) + 40) removeObjectForKey:a2];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = (void *)[a3 pendingClaims];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [*(id *)(a1 + 56) addObject:v12];
          [v12 block];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
      }
      while (v9);
    }
    id v13 = _NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      uint64_t v15 = a2;
      _os_log_impl(&dword_181795000, v13, OS_LOG_TYPE_DEFAULT, "Revoking claim %{public}@ because client died", (uint8_t *)&v14, 0xCu);
    }
    return [a3 revoked];
  }
  return result;
}

uint64_t __45__NSFileAccessArbiter__handleCanceledClient___block_invoke_107(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a3 client];
  if (result == *(void *)(a1 + 32))
  {
    if (object_getClass(a3) == (Class)NSFileProviderProxy)
    {
      id v7 = _NSFCProviderLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v9 = 138543362;
        *(void *)&v9[4] = [a3 reactorID];
        uint64_t v8 = "Removed provider %{public}@";
        goto LABEL_7;
      }
    }
    else
    {
      id v7 = _NSFCPresenterLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v9 = 138543362;
        *(void *)&v9[4] = [a3 reactorID];
        uint64_t v8 = "Removed presenter %{public}@";
LABEL_7:
        _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 0xCu);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2, *(_OWORD *)v9);
    return [*(id *)(a1 + 48) _willRemoveReactor:a3];
  }
  return result;
}

- (void)getItemHasPresentersAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = +[NSXPCConnection currentConnection];
  if (v7)
  {
    [(NSXPCConnection *)v7 auditToken];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  long long v16 = v18;
  long long v17 = v19;
  if (!sandbox_check_by_audit_token()
    || (uint64_t v8 = [a3 fileSystemRepresentation]) != 0
    && (long long v16 = v18, v17 = v19, v10 = v8, !sandbox_check_by_audit_token()))
  {
    id v9 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", a3, v10);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__NSFileAccessArbiter_getItemHasPresentersAtURL_completionHandler___block_invoke;
    v11[3] = &unk_1E51FCEB8;
    v11[4] = &v12;
    [v9 forEachPresenterOfItemPerformProcedure:v11];
  }
  (*((void (**)(id, void))a4 + 2))(a4, *((unsigned __int8 *)v13 + 24));
  _Block_object_dispose(&v12, 8);
}

uint64_t __67__NSFileAccessArbiter_getItemHasPresentersAtURL_completionHandler___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)getDebugInformationIncludingEverything:(BOOL)a3 withString:(id)a4 fromPid:(int)a5 thenContinue:(id)a6
{
  BOOL v7 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_isSubarbiter)
  {
    id v9 = [(NSFileAccessArbiter *)self rootNode];
    if (v7) {
      uint64_t v10 = [v9 subarbiterDescription];
    }
    else {
      uint64_t v10 = [v9 sensitiveSubarbiterDescription];
    }
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v10);
  }
  else
  {
    uint64_t v11 = *(void *)&a5;
    id v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (a4) {
      objc_msgSend(v13, "setObject:forKey:", a4, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
    }
    id v14 = (id)[(NSMutableDictionary *)self->_subarbitrationClaimsByID copy];
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    char v25 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke;
    block[3] = &unk_1E51FD2E8;
    BOOL v23 = v7;
    block[4] = self;
    block[5] = v15;
    void block[6] = v14;
    void block[7] = v13;
    block[8] = a6;
    block[9] = v24;
    dispatch_time_t v16 = dispatch_time(0, 2000000000);
    dispatch_after(v16, MEMORY[0x1E4F14428], block);
    long long v17 = dispatch_group_create();
    rootNode = self->_rootNode;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_4;
    v21[3] = &unk_1E51FD360;
    v21[4] = v13;
    v21[5] = v17;
    v21[6] = self;
    [(NSFileAccessNode *)rootNode forEachReactorToItemOrContainedItemPerformProcedure:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_7;
    void v19[3] = &unk_1E51FD3D8;
    v19[4] = v17;
    void v19[5] = v15;
    BOOL v20 = v7;
    [v14 enumerateKeysAndObjectsUsingBlock:v19];
    dispatch_group_notify(v17, (dispatch_queue_t)self->_queue, block);
    dispatch_release(v17);
    _Block_object_dispose(v24, 8);
  }
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke(uint64_t result)
{
  v9[6] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(result + 72) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    uint64_t v3 = +[NSString string];
    [(NSString *)v3 appendString:@"Server Information:\n\n"];
    uint64_t v4 = (void *)[*(id *)(v2 + 32) rootNode];
    if (*(unsigned char *)(v2 + 80)) {
      uint64_t v5 = [v4 description];
    }
    else {
      uint64_t v5 = [v4 sensitiveDescription];
    }
    [(NSString *)v3 appendString:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_2;
    v9[3] = &unk_1E51FD2C0;
    id v6 = *(void **)(v2 + 40);
    v9[4] = *(void *)(v2 + 48);
    void v9[5] = v3;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    [(NSString *)v3 appendString:@"\n\nApplication Information:\n\n"];
    BOOL v7 = *(void **)(v2 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_3;
    v8[3] = &unk_1E51F7840;
    v8[4] = v3;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
    return (*(uint64_t (**)(void))(*(void *)(v2 + 64) + 16))();
  }
  return result;
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[*(id *)(a1 + 32) objectForKey:a2];
  int v6 = proc_name(objc_msgSend((id)objc_msgSend(v5, "subarbiterConnection"), "processIdentifier"), buffer, 0x100u);
  if (v6 < 1) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [[NSString alloc] initWithBytes:buffer length:v6 encoding:4];
  }
  return [*(id *)(a1 + 40) appendFormat:@"\n\nSubarbiter Information — %@ (%i):\n\n%@", v7, objc_msgSend((id)objc_msgSend(v5, "subarbiterConnection"), "processIdentifier"), a3];
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = proc_name([a2 intValue], buffer, 0x100u);
  if (v6 < 1) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [[NSString alloc] initWithBytes:buffer length:v6 encoding:4];
  }
  return [*(id *)(a1 + 32) appendFormat:@"%@ (%i):\n%@\n", v7, objc_msgSend(a2, "intValue"), a3];
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "client"), "processIdentifier");
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", @"Unknown\n", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_5;
    v6[3] = &unk_1E51FD338;
    _DWORD v6[4] = *(void *)(a1 + 48);
    int v8 = v4;
    long long v7 = *(_OWORD *)(a1 + 32);
    return [a2 collectDebuggingInformationWithCompletionHandler:v6];
  }
  return result;
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_6;
  block[3] = &unk_1E51FD310;
  uint64_t v3 = *(void *)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  block[5] = a2;
  int v5 = *(_DWORD *)(a1 + 56);
  void block[6] = v3;
  dispatch_async(v2, block);
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_6(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = *(__CFString **)(a1 + 40);
  }
  else {
    uint64_t v2 = &stru_1ECA5C228;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v2, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  uint64_t v3 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v3);
}

uint64_t __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  v12[7] = *MEMORY[0x1E4F143B8];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  int v5 = (void *)[a3 subarbiterConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_8;
  v12[3] = &unk_1E51FD388;
  uint64_t v6 = *(void *)(a1 + 32);
  v12[4] = *(void *)(a1 + 40);
  void v12[5] = a3;
  void v12[6] = v6;
  long long v7 = (void *)[v5 remoteObjectProxyWithErrorHandler:v12];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_9;
  v11[3] = &unk_1E51FD3B0;
  uint64_t v9 = *(void *)(a1 + 32);
  v11[4] = *(void *)(a1 + 40);
  void v11[5] = a3;
  void v11[6] = v9;
  return [v7 provideSubarbiterDebugInfoIncludingEverything:v8 completionHandler:v11];
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", @"Error\n", objc_msgSend(*(id *)(a1 + 40), "claimID"));
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __94__NSFileAccessArbiter_getDebugInformationIncludingEverything_withString_fromPid_thenContinue___block_invoke_9(uint64_t a1, __CFString *a2, uint64_t a3)
{
  uint64_t v4 = &stru_1ECA5C228;
  if (a2) {
    uint64_t v4 = a2;
  }
  if (a3) {
    int v5 = @"Error\n";
  }
  else {
    int v5 = v4;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, objc_msgSend(*(id *)(a1 + 40), "claimID"));
  uint64_t v6 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v6);
}

- (void)_registerForDebugInfoRequests
{
  v4[5] = *MEMORY[0x1E4F143B8];
  signal(30, (void (__cdecl *)(int))1);
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 0x1EuLL, 0, (dispatch_queue_t)self->_queue);
  self->_debugSignalSource = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke;
  v4[3] = &unk_1E51F71D0;
  v4[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, v4);
  dispatch_resume((dispatch_object_t)self->_debugSignalSource);
}

void __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke(uint64_t a1)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x185308110]();
  uint64_t v3 = os_transaction_create();
  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke_2;
  v5[3] = &unk_1E51FD400;
  v5[4] = v3;
  [v4 getDebugInformationIncludingEverything:1 withString:0 fromPid:0 thenContinue:v5];
}

void __52__NSFileAccessArbiter__registerForDebugInfoRequests__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = NSTemporaryDirectory();
    int v5 = [(NSString *)v4 stringByAppendingPathComponent:+[NSString stringWithFormat:@"filecoordination_%d_dump.txt", getpid()]];
    uint64_t v6 = open([(NSString *)v5 UTF8String], 1793, 448);
    uint64_t v7 = v6;
    if ((int)v6 < 1)
    {
      uint64_t v9 = _NSOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v13 = __error();
        id v14 = strerror(*v13);
        *(_DWORD *)buf = 138412546;
        dispatch_time_t v16 = v5;
        __int16 v17 = 2080;
        long long v18 = v14;
        _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "Failed to open %@ for filecoordinationd dump file: %s", buf, 0x16u);
      }
    }
    else
    {
      if (fchown(v6, 0, 0) || fchmod(v7, 0x180u))
      {
        uint64_t v8 = _NSOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          dispatch_time_t v16 = v5;
          _os_log_error_impl(&dword_181795000, v8, OS_LOG_TYPE_ERROR, "Failed to set correct permissions for filecoordinationd dump file at %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v10 = [[NSFileHandle alloc] initWithFileDescriptor:v7];
        uint64_t v11 = [a2 dataUsingEncoding:4];
        if (v11)
        {
          [(NSFileHandle *)v10 writeData:v11];
          uint64_t v12 = _NSOSLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            dispatch_time_t v16 = v5;
            _os_log_impl(&dword_181795000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }
      }
      close(v7);
    }
  }
}

- (void)revokeSubarbitrationClaimForID:(id)a3
{
}

- (void)cancelAccessClaimForID:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  int v5 = (void *)-[NSMutableDictionary objectForKey:](self->_accessClaimsByID, "objectForKey:");
  if (v5)
  {
    uint64_t v6 = v5;
    if ([v5 isGranted])
    {
      [v6 cancelled];
    }
    else if (([v6 isRevoked] & 1) == 0)
    {
      [v6 revoked];
      [(NSMutableDictionary *)self->_accessClaimsByID removeObjectForKey:a3];
      [(NSMutableDictionary *)self->_subarbitrationClaimsByID removeObjectForKey:a3];
      [(NSMutableDictionary *)self->_accessClaimTransactionsByID removeObjectForKey:a3];
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NSFileAccessArbiter_cancelAccessClaimForID___block_invoke;
  v7[3] = &unk_1E51FD1A8;
  v7[4] = a3;
  [(NSFileAccessArbiter *)self _enumerateSubarbitersUsingBlock:v7];
}

uint64_t __46__NSFileAccessArbiter_cancelAccessClaimForID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelAccessClaimForID:*(void *)(a1 + 32)];
}

- (void)writerWithPurposeID:(id)a3 didMoveItemAtURL:(id)a4 toURL:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v13 = _NSFCClaimsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544131;
    id v16 = a3;
    __int16 v17 = 2113;
    uint64_t v18 = [a4 logicalURL];
    __int16 v19 = 2113;
    uint64_t v20 = [a5 logicalURL];
    __int16 v21 = 2048;
    unint64_t v22 = a7;
    _os_log_impl(&dword_181795000, v13, OS_LOG_TYPE_INFO, "Received item move hint with purpose %{public}@ -- %{private}@ -> %{private}@ (fileID: %llu)", buf, 0x2Au);
  }
  [(NSFileAccessArbiter *)self _writerWithPurposeID:a3 didMoveItemAtURL:a4 toURL:a5 withFSID:a6 andFileID:a7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__NSFileAccessArbiter_writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke;
  v14[3] = &unk_1E51FCFC8;
  v14[4] = a3;
  v14[5] = a4;
  v14[7] = a7;
  v14[8] = a6;
  v14[6] = a5;
  [(NSFileAccessArbiter *)self _enumerateSubarbitersUsingBlock:v14];
}

uint64_t __85__NSFileAccessArbiter_writerWithPurposeID_didMoveItemAtURL_toURL_withFSID_andFileID___block_invoke(void *a1, void *a2)
{
  return [a2 writerWithPurposeID:a1[4] didMoveItemAtURL:a1[5] toURL:a1[6] withFSID:a1[8] andFileID:a1[7]];
}

- (void)writerWithPurposeID:(id)a3 didDisconnectItemAtURL:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = [a4 logicalURL];
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Received item disconnection hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  id v8 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](self->_rootNode, "pathToDescendantForFileURL:componentRange:", [a4 logicalURL], buf);
  if (v8)
  {
    id v9 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v8, *(void *)buf, *(void *)&buf[8], 0);
    if (v9)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __66__NSFileAccessArbiter_writerWithPurposeID_didDisconnectItemAtURL___block_invoke;
      v11[3] = &unk_1E51FD428;
      v11[4] = a3;
      [v9 forEachPresenterOfItemOrContainedItemPerformProcedure:v11];
    }
  }
  if (self->_isSubarbiter)
  {
    uint64_t v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file disconnection, which is a surprise.", v12, 2u);
    }
  }
}

uint64_t __66__NSFileAccessArbiter_writerWithPurposeID_didDisconnectItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 observeDisconnectionByWriterWithPurposeID:*(void *)(a1 + 32)];
}

- (void)writerWithPurposeID:(id)a3 didReconnectItemAtURL:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = [a4 logicalURL];
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Received item reconnection hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  id v8 = -[NSFileAccessNode pathToDescendantForFileURL:componentRange:](self->_rootNode, "pathToDescendantForFileURL:componentRange:", [a4 logicalURL], buf);
  if (v8)
  {
    id v9 = -[NSFileAccessNode descendantAtPath:componentRange:create:](self->_rootNode, "descendantAtPath:componentRange:create:", v8, *(void *)buf, *(void *)&buf[8], 0);
    if (v9)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __65__NSFileAccessArbiter_writerWithPurposeID_didReconnectItemAtURL___block_invoke;
      v11[3] = &unk_1E51FD428;
      v11[4] = a3;
      [v9 forEachPresenterOfItemOrContainedItemPerformProcedure:v11];
    }
  }
  if (self->_isSubarbiter)
  {
    uint64_t v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file reconnection, which is a surprise.", v12, 2u);
    }
  }
}

uint64_t __65__NSFileAccessArbiter_writerWithPurposeID_didReconnectItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 observeReconnectionByWriterWithPurposeID:*(void *)(a1 + 32)];
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityOfItemAtURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    id v13 = a3;
    __int16 v14 = 2113;
    uint64_t v15 = [a4 logicalURL];
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Received item ubiquity change hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  id v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", [a4 logicalURL]);
  if (v8)
  {
    id v9 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke;
    v11[3] = &unk_1E51FD450;
    v11[4] = v8;
    void v11[5] = a4;
    [v8 forEachPresenterOfItemOrContainingItemPerformProcedure:v11];
    [v9 removeSelfIfUseless];
  }
  if (self->_isSubarbiter)
  {
    uint64_t v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file ubiquity change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __72__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityOfItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:");
  uint64_t v5 = [*(id *)(a1 + 40) physicalURL];

  return [a2 observeUbiquityChangeAtSubitemPath:v4 withPhysicalURL:v5];
}

- (void)writerWithPurposeID:(id)a3 didChangeSharingOfItemAtURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    id v13 = a3;
    __int16 v14 = 2113;
    uint64_t v15 = [a4 logicalURL];
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Received item sharing change hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  id v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", [a4 logicalURL]);
  if (v8)
  {
    id v9 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__NSFileAccessArbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke;
    v11[3] = &unk_1E51FD450;
    v11[4] = v8;
    void v11[5] = a4;
    [v8 forEachPresenterOfItemOrContainingItemPerformProcedure:v11];
    [v9 removeSelfIfUseless];
  }
  if (self->_isSubarbiter)
  {
    uint64_t v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a sharing change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __71__NSFileAccessArbiter_writerWithPurposeID_didChangeSharingOfItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:");
  uint64_t v5 = [*(id *)(a1 + 40) physicalURL];

  return [a2 observeSharingChangeAtSubitemPath:v4 withPhysicalURL:v5];
}

- (void)writerWithPurposeID:(id)a3 didChangeUbiquityAttributes:(id)a4 ofItemAtURL:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = _NSFCClaimsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543875;
    id v15 = a3;
    __int16 v16 = 2113;
    uint64_t v17 = [a5 logicalURL];
    __int16 v18 = 2114;
    id v19 = a4;
    _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_INFO, "Received item ubiquity attributes change hint with purpose %{public}@ -- %{private}@. Attributes: %{public}@", buf, 0x20u);
  }
  id v10 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", [a5 logicalURL]);
  if (v10)
  {
    uint64_t v11 = v10;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke;
    v13[3] = &unk_1E51FD428;
    v13[4] = a4;
    [v10 forEachPresenterOfItemPerformProcedure:v13];
    [v11 removeSelfIfUseless];
  }
  if (self->_isSubarbiter)
  {
    uint64_t v12 = _NSFCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v12, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a ubiquity attributes change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __83__NSFileAccessArbiter_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 observeChangeOfUbiquityAttributes:*(void *)(a1 + 32)];
}

- (void)writerWithPurposeID:(id)a3 didMakeItemDisappearAtURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    id v13 = a3;
    __int16 v14 = 2113;
    uint64_t v15 = [a4 logicalURL];
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Received item disappearance hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  id v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", [a4 logicalURL]);
  if (v8)
  {
    id v9 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__NSFileAccessArbiter_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke;
    v11[3] = &unk_1E51FD450;
    v11[4] = a3;
    void v11[5] = v8;
    [v8 forEachPresenterOfItemOrContainingItemPerformProcedure:v11];
    [v9 removeSelfIfUseless];
  }
  if (self->_isSubarbiter)
  {
    id v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file disappearance, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __69__NSFileAccessArbiter_writerWithPurposeID_didMakeItemDisappearAtURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "reactorID"));
  if ((result & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 40) pathFromAncestor:a3];
    return [a2 observeDisappearanceAtSubitemPath:v7];
  }
  return result;
}

- (void)writerWithPurposeID:(id)a3 didChangeItemAtURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    id v13 = a3;
    __int16 v14 = 2113;
    uint64_t v15 = [a4 logicalURL];
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Received item change hint with purpose %{public}@ -- %{private}@", buf, 0x16u);
  }
  id v8 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", [a4 logicalURL]);
  if (v8)
  {
    id v9 = v8;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__NSFileAccessArbiter_writerWithPurposeID_didChangeItemAtURL___block_invoke;
    v11[3] = &unk_1E51FD450;
    v11[4] = a3;
    void v11[5] = v8;
    [v8 forEachPresenterOfItemOrContainingItemPerformProcedure:v11];
    [v9 removeSelfIfUseless];
  }
  if (self->_isSubarbiter)
  {
    id v10 = _NSFCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v10, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __62__NSFileAccessArbiter_writerWithPurposeID_didChangeItemAtURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "reactorID"));
  if ((result & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 40) pathFromAncestor:a3];
    return [a2 observeChangeAtSubitemPath:v7];
  }
  return result;
}

- (void)writerWithPurposeID:(id)a3 didVersionChangeOfKind:(id)a4 toItemAtURL:(id)a5 withClientID:(id)a6 name:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v13 = _NSFCClaimsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543875;
    id v19 = a4;
    __int16 v20 = 2114;
    id v21 = a3;
    __int16 v22 = 2113;
    uint64_t v23 = [a5 logicalURL];
    _os_log_impl(&dword_181795000, v13, OS_LOG_TYPE_INFO, "Received item version change hint of kind %{public}@ with purpose %{public}@ -- %{private}@", buf, 0x20u);
  }
  id v14 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", [a5 logicalURL]);
  if (v14)
  {
    uint64_t v15 = v14;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __96__NSFileAccessArbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke;
    v17[3] = &unk_1E51FD478;
    v17[4] = v14;
    v17[5] = a4;
    v17[6] = a6;
    v17[7] = a7;
    [v14 forEachPresenterOfItemOrContainingItemPerformProcedure:v17];
    [v15 removeSelfIfUseless];
  }
  if (self->_isSubarbiter)
  {
    uint64_t v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_181795000, v16, OS_LOG_TYPE_FAULT, "A subarbiter was told by a superarbiter about a file version change, which is a surprise.", buf, 2u);
    }
  }
}

uint64_t __96__NSFileAccessArbiter_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:");
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);

  return [a2 observeVersionChangeOfKind:v5 withClientID:v6 name:v7 subitemPath:v4];
}

- (void)tiePresenterForID:(id)a3 toItemAtURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKey:](self->_reactorsByID, "objectForKey:");
  if (self->_isSubarbiter || objc_msgSend(v7, "allowedForURL:", objc_msgSend(a4, "logicalURL")))
  {
    if (![v7 itemLocation])
    {
      id v8 = _NSFCPresenterLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v13 = a3;
        __int16 v14 = 2113;
        uint64_t v15 = [a4 logicalURL];
        _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ has been tied to a URL for the first time -- %{private}@", buf, 0x16u);
      }
    }
    id v9 = -[NSFileAccessNode descendantForFileURL:](self->_rootNode, "descendantForFileURL:", [a4 logicalURL]);
    if (v9) {
      [v7 setItemLocation:v9];
    }
  }
  else if (v7)
  {
    id v10 = _NSFCPresenterLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v13 = a3;
      __int16 v14 = 2113;
      uint64_t v15 = [a4 logicalURL];
      _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ not allowed to tie to URL -- %{private}@", buf, 0x16u);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__NSFileAccessArbiter_tiePresenterForID_toItemAtURL___block_invoke;
  v11[3] = &unk_1E51FD220;
  v11[4] = a3;
  void v11[5] = a4;
  [(NSFileAccessArbiter *)self _enumerateSubarbitersUsingBlock:v11];
}

uint64_t __53__NSFileAccessArbiter_tiePresenterForID_toItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tiePresenterForID:*(void *)(a1 + 32) toItemAtURL:*(void *)(a1 + 40)];
}

void __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke(uint64_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_2;
  block[3] = &unk_1E51FD4A0;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  block[4] = *(void *)(a1 + 40);
  char v4 = a2;
  dispatch_async(v2, block);
}

uint64_t __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void *__88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_3()
{
  uint64_t result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 256);
  if (result)
  {
    uint64_t result = dlsym(result, "FPRegisterFileProvidersForUserAtURLs");
    off_1EB1EC138 = (uint64_t (*)(void, void, void))result;
  }
  return result;
}

uint64_t __88__NSFileAccessArbiter_FileProvider___wakeUpFileProviderWithUID_urls_queue_thenContinue___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end