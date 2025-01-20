@interface NSFileCoordinator
+ (BOOL)_itemHasPresentersAtURL:(id)a3;
+ (BOOL)_provideRecursively;
+ (BOOL)_skipCoordinationWork;
+ (NSArray)filePresenters;
+ (id)_canonicalURLForURL:(id)a3;
+ (id)_createConnectionToFileAccessArbiterForQueue:(id)a3;
+ (id)_createConnectionToProgressRegistrar;
+ (id)_createIdentifierForNewClaim;
+ (id)_currentClaimPurposeIdentifier;
+ (id)_currentFileCoordinator;
+ (id)_endpointForInProcessFileCoordinationServer;
+ (id)_fileAccessArbiterInterface;
+ (id)_filePresenterInterface;
+ (id)_fileProviderInterface;
+ (id)_fileProviders;
+ (id)_inProcessFileAccessArbiter;
+ (id)_kernelMaterializationInfo;
+ (id)_nextClaimIdentifier;
+ (id)_observedUbiquityAttributesForPresenterWithID:(id)a3;
+ (int)_processIdentifierForID:(id)a3;
+ (unint64_t)_providedItemGenerationCount;
+ (unint64_t)_readingOptions;
+ (unint64_t)_responsesForPresenter:(id)a3;
+ (unsigned)_kernelMaterializationOperation;
+ (void)__itemAtURL:(id)a3 didChangeUbiquityWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didChangeWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didDisappearWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didDisconnectWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didGainVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6;
+ (void)__itemAtURL:(id)a3 didLoseVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6;
+ (void)__itemAtURL:(id)a3 didMoveToURL:(id)a4 purposeID:(id)a5;
+ (void)__itemAtURL:(id)a3 didReconnectWithPurposeID:(id)a4;
+ (void)__itemAtURL:(id)a3 didResolveConflictVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6;
+ (void)_accessPresenterInfoUsingBlock:(id)a3;
+ (void)_addFileProvider:(id)a3;
+ (void)_addFileProvider:(id)a3 completionHandler:(id)a4;
+ (void)_addProcessIdentifier:(int)a3 observedUbiquityAttributes:(id)a4 forID:(id)a5;
+ (void)_adoptFCDEndpointForTest:(id)a3;
+ (void)_getDebugInfoWithCompletionHandler:(id)a3;
+ (void)_performBarrier;
+ (void)_performBarrierAsync:(id)a3;
+ (void)_removeFileProvider:(id)a3;
+ (void)_removeInfoForID:(id)a3;
+ (void)_setAutomaticFileProviderReregistrationDisabled:(BOOL)a3;
+ (void)_setCurrentClaimPurposeIdentifier:(id)a3;
+ (void)_setKernelMaterializationInfo:(id)a3;
+ (void)_setNextClaimIdentifier:(id)a3;
+ (void)_setProvidedItemRecursiveGenerationCount:(unint64_t)a3;
+ (void)_setReadingOptions:(unint64_t)a3;
+ (void)_startInProcessFileCoordinationAndProgressServers;
+ (void)_stopInProcessFileCoordinationAndProgressServers;
+ (void)addFilePresenter:(id)filePresenter;
+ (void)removeFilePresenter:(id)filePresenter;
- (BOOL)_isValidUbiquityAttribute:(id)a3;
- (BOOL)_purposeIdentifierLockedDown;
- (NSFileCoordinator)init;
- (NSFileCoordinator)initWithFilePresenter:(id)filePresenterOrNil;
- (NSString)purposeIdentifier;
- (id)_willStartWriteWithIntents:(id)a3 async:(BOOL)a4;
- (id)retainAccess;
- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6;
- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8;
- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6;
- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8;
- (void)__prepareForReadingItemsAtURLs:(id)a3 options:(unint64_t)a4 writingItemsAtURLs:(id)a5 options:(unint64_t)a6 byAccessor:(id)a7;
- (void)_cancelClaimWithIdentifier:(id)a3;
- (void)_coordinateAccessWithIntents:(id)a3 queue:(id)a4 byAccessor:(id)a5;
- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6;
- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8;
- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6;
- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8;
- (void)_didEndWrite:(id)a3;
- (void)_forgetAccessClaimForID:(id)a3;
- (void)_invokeAccessor:(id)a3 thenCompletionHandler:(id)a4;
- (void)_itemAtURL:(id)a3 didMoveToURL:(id)a4;
- (void)_itemDidChangeAtURL:(id)a3;
- (void)_itemDidDisappearAtURL:(id)a3;
- (void)_lockdownPurposeIdentifier;
- (void)_requestAccessClaim:(id)a3 withProcedure:(id)a4;
- (void)_setFileProvider:(id)a3;
- (void)_setPurposeIdentifier:(id)a3;
- (void)_ubiquityDidChangeForItemAtURL:(id)a3;
- (void)_withAccessArbiter:(id)a3 invokeAccessor:(id)a4 orDont:(BOOL)a5 andRelinquishAccessClaim:(id)a6;
- (void)cancel;
- (void)coordinateAccessWithIntents:(NSArray *)intents queue:(NSOperationQueue *)queue byAccessor:(void *)accessor;
- (void)coordinateReadingItemAtURL:(NSURL *)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL *)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)readerWriter;
- (void)coordinateReadingItemAtURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options error:(NSError *)outError byAccessor:(void *)reader;
- (void)coordinateWritingItemAtURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options error:(NSError *)outError byAccessor:(void *)writer;
- (void)coordinateWritingItemAtURL:(NSURL *)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL *)url2 options:(NSFileCoordinatorWritingOptions)options2 error:(NSError *)outError byAccessor:(void *)writer;
- (void)dealloc;
- (void)itemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL;
- (void)itemAtURL:(NSURL *)oldURL willMoveToURL:(NSURL *)newURL;
- (void)itemAtURL:(NSURL *)url didChangeUbiquityAttributes:(NSSet *)attributes;
- (void)prepareForReadingItemsAtURLs:(NSArray *)readingURLs options:(NSFileCoordinatorReadingOptions)readingOptions writingItemsAtURLs:(NSArray *)writingURLs options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)batchAccessor;
- (void)releaseAccess:(id)a3;
- (void)setPurposeIdentifier:(NSString *)purposeIdentifier;
- (void)sharingDidChangeForItemAtURL:(id)a3;
@end

@implementation NSFileCoordinator

NSXPCInterface *__55__NSFileCoordinator_NSInternal___fileProviderInterface__block_invoke()
{
  result = +[NSXPCInterface interfaceWithProtocol:&unk_1ECAEB9A8];
  qword_1EB1EDD88 = (uint64_t)result;
  return result;
}

+ (id)_filePresenterInterface
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = +[NSXPCInterface interfaceWithProtocol:&unk_1ECAEB0F8];
  [(NSXPCInterface *)v5 setClasses:v4 forSelector:sel_observeChangeOfUbiquityAttributes_ argumentIndex:0 ofReply:0];
  return v5;
}

+ (id)_createConnectionToFileAccessArbiterForQueue:(id)a3
{
  uint64_t v4 = qword_1EB1EDDA0;
  v5 = [NSXPCConnection alloc];
  if (v4) {
    v6 = -[NSXPCConnection initWithListenerEndpoint:](v5, "initWithListenerEndpoint:", [(id)qword_1EB1EDDA0 endpoint]);
  }
  else {
    v6 = [(NSXPCConnection *)v5 initWithMachServiceName:@"com.apple.FileCoordination" options:0];
  }
  v7 = v6;
  [(NSXPCConnection *)v6 setRemoteObjectInterface:+[NSFileCoordinator _fileAccessArbiterInterface]];
  [(NSXPCConnection *)v7 setOptions:4096];
  [(NSXPCConnection *)v7 _setQueue:a3];
  return v7;
}

+ (id)_fileAccessArbiterInterface
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__NSFileCoordinator_NSInternal___fileAccessArbiterInterface__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1EDD90 != -1) {
    dispatch_once(&qword_1EB1EDD90, v3);
  }
  return (id)qword_1EB1EDD98;
}

+ (unint64_t)_responsesForPresenter:(id)a3
{
  char v3 = objc_opt_respondsToSelector();
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = v3 & 1 | 2;
  }
  else {
    uint64_t v4 = v3 & 1;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 4uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 8uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x10uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x20uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x40uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x80uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x100uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x200uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x400uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x800uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x1000uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x2000uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x4000uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v4 |= 0x8000uLL;
  }
  if (objc_opt_respondsToSelector()) {
    unint64_t v5 = v4 | 0x10000;
  }
  else {
    unint64_t v5 = v4;
  }
  char v16 = objc_opt_respondsToSelector();
  char v15 = objc_opt_respondsToSelector();
  char v6 = objc_opt_respondsToSelector();
  char v7 = objc_opt_respondsToSelector();
  char v8 = objc_opt_respondsToSelector();
  char v9 = objc_opt_respondsToSelector();
  char v10 = objc_opt_respondsToSelector();
  char v11 = objc_opt_respondsToSelector();
  char v12 = objc_opt_respondsToSelector();
  char v13 = objc_opt_respondsToSelector();
  if (((objc_opt_respondsToSelector() | v13 | v12 | v11 | v10 | v9 | v8) | (v7 | v6 | v15 | v16))) {
    return v5 | 0xFFFFFFFF80000000;
  }
  else {
    return v5;
  }
}

- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    char v11 = (void (*)(id, id, void *))*((void *)a6 + 2);
    v11(a6, a3, &__block_literal_global_201);
  }
  else
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3052000000;
    v32 = __Block_byref_object_copy__24;
    v33 = __Block_byref_object_dispose__24;
    uint64_t v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__24;
    v27 = __Block_byref_object_dispose__24;
    uint64_t v28 = 0;
    char v12 = [NSFileWritingClaim alloc];
    id purposeID = self->_purposeID;
    id v14 = +[NSFileCoordinator _canonicalURLForURL:a3];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2;
    v22[3] = &unk_1E51FBDC8;
    v22[4] = &v29;
    v22[5] = &v23;
    char v15 = [(NSFileWritingClaim *)v12 initWithPurposeID:purposeID url:v14 options:a4 claimer:v22];
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      char v16 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = self->_purposeID;
        uint64_t v18 = [(NSFileAccessClaim *)v15 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v36 = a4;
        __int16 v37 = 2113;
        id v38 = a3;
        __int16 v39 = 2114;
        id v40 = v17;
        __int16 v41 = 2114;
        uint64_t v42 = v18;
        _os_log_impl(&dword_181795000, v16, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    id v19 = self->_accessArbiter;
    [(NSFileCoordinator *)self _blockOnAccessClaim:v15 withAccessArbiter:v19];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_204;
    v21[3] = &unk_1E51FBE18;
    v21[4] = a3;
    v21[5] = self;
    v21[8] = &v29;
    v21[9] = a4;
    v21[6] = v19;
    v21[7] = a6;
    [(NSFileCoordinator *)self _withAccessArbiter:v19 invokeAccessor:v21 orDont:v24[5] != 0 andRelinquishAccessClaim:v15];
    v20 = (void *)v24[5];
    if (a5 && v20)
    {
      *a5 = v20;
      v20 = (void *)v24[5];
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
}

- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    char v11 = (void (*)(id, id, void *))*((void *)a6 + 2);
    v11(a6, a3, &__block_literal_global_193);
  }
  else
  {
    if (+[NSThread isMainThread]) {
      unint64_t v12 = a4 | 0x80000000;
    }
    else {
      unint64_t v12 = a4;
    }
    uint64_t v36 = 0;
    __int16 v37 = &v36;
    uint64_t v38 = 0x3052000000;
    __int16 v39 = __Block_byref_object_copy__24;
    id v40 = __Block_byref_object_dispose__24;
    uint64_t v41 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3052000000;
    v33 = __Block_byref_object_copy__24;
    uint64_t v34 = __Block_byref_object_dispose__24;
    uint64_t v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3052000000;
    v27 = __Block_byref_object_copy__24;
    uint64_t v28 = __Block_byref_object_dispose__24;
    uint64_t v29 = 0;
    char v13 = [NSFileReadingClaim alloc];
    id purposeID = self->_purposeID;
    id v15 = +[NSFileCoordinator _canonicalURLForURL:a3];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2;
    v23[3] = &unk_1E51FBD78;
    v23[4] = &v36;
    v23[5] = &v30;
    v23[6] = &v24;
    char v16 = [(NSFileReadingClaim *)v13 initWithPurposeID:purposeID url:v15 options:v12 claimer:v23];
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      id v17 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = self->_purposeID;
        uint64_t v19 = [(NSFileAccessClaim *)v16 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v43 = v12;
        __int16 v44 = 2113;
        id v45 = a3;
        __int16 v46 = 2114;
        id v47 = v18;
        __int16 v48 = 2114;
        uint64_t v49 = v19;
        _os_log_impl(&dword_181795000, v17, OS_LOG_TYPE_DEFAULT, "Read options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    id v20 = self->_accessArbiter;
    [(NSFileCoordinator *)self _blockOnAccessClaim:v16 withAccessArbiter:v20];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_197;
    v22[3] = &unk_1E51FBDA0;
    void v22[6] = a6;
    v22[7] = &v36;
    v22[4] = a3;
    v22[5] = v20;
    [(NSFileCoordinator *)self _withAccessArbiter:v20 invokeAccessor:v22 orDont:v25[5] != 0 andRelinquishAccessClaim:v16];
    v21 = (void *)v25[5];
    if (a5 && v21)
    {
      *a5 = v21;
      v21 = (void *)v25[5];
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
}

+ (id)_canonicalURLForURL:(id)a3
{
  return a3;
}

+ (BOOL)_skipCoordinationWork
{
  if (qword_1EB1EDD70 != -1) {
    dispatch_once(&qword_1EB1EDD70, &__block_literal_global_74);
  }
  return _MergedGlobals_147;
}

void __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2_198(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
}

- (void)_requestAccessClaim:(id)a3 withProcedure:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&stru_1EB1EDD24);
  if (self->_isCancelled)
  {
    os_unfair_lock_unlock(&stru_1EB1EDD24);
    if (qword_1EB1EDDD0 != -1) {
      dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
    }
    char v7 = qword_1EB1EDD38;
    if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = [a3 claimID];
      __int16 v12 = 2048;
      char v13 = self;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "%{public}@ was probably made on an already-cancelled NSFileCoordinator instance (%p). It will be immediately cancelled before being sent to the server.", buf, 0x16u);
    }
    objc_msgSend(a3, "setClaimerError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 3072, 0));
    [a3 unblockClaimerForReason:0x1ECA7C768];
  }
  else
  {
    if (self->_accessClaimIDOrIDs)
    {
      int v8 = _NSIsNSSet();
      id accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
      if (v8)
      {
        objc_msgSend(accessClaimIDOrIDs, "addObject:", objc_msgSend(a3, "claimID"));
      }
      else
      {
        self->_id accessClaimIDOrIDs = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", accessClaimIDOrIDs, objc_msgSend(a3, "claimID"), 0);
      }
    }
    else
    {
      self->_id accessClaimIDOrIDs = (id)[a3 claimID];
    }
    (*((void (**)(id))a4 + 2))(a4);
    os_unfair_lock_unlock(&stru_1EB1EDD24);
  }
}

uint64_t __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(NSAutoreleasePool);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:1];
  char v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3) {
    dispatch_retain(v3);
  }

  return [(NSAutoreleasePool *)v2 drain];
}

- (void)_forgetAccessClaimForID:(id)a3
{
  os_unfair_lock_lock(&stru_1EB1EDD24);
  int v5 = _NSIsNSSet();
  id accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
  if (v5)
  {
    [accessClaimIDOrIDs removeObject:a3];
  }
  else if (accessClaimIDOrIDs && [accessClaimIDOrIDs isEqual:a3])
  {

    self->_id accessClaimIDOrIDs = 0;
  }

  os_unfair_lock_unlock(&stru_1EB1EDD24);
}

uint64_t __98__NSFileCoordinator_NSPrivate___withAccessArbiter_invokeAccessor_orDont_andRelinquishAccessClaim___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(NSAutoreleasePool);
  if (*(unsigned char *)(a1 + 72))
  {
    char v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) presentedItemURL];
    if (v3 != *(void **)(a1 + 40))
    {
      uint64_t v4 = v3;
      if ((objc_msgSend(v3, "isEqual:") & 1) == 0) {
        objc_msgSend(*(id *)(a1 + 48), "tiePresenterForID:toItemAtURL:", objc_msgSend(*(id *)(a1 + 48), "idForFileReactor:", *(void *)(*(void *)(a1 + 32) + 16)), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", v4));
      }
    }
  }
  if (!*(unsigned char *)(a1 + 73)) {
    [*(id *)(a1 + 48) revokeAccessClaimForID:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 64) finished];

  return [(NSAutoreleasePool *)v2 drain];
}

uint64_t __60__NSFileCoordinator_NSInternal___fileAccessArbiterInterface__block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v2 = +[NSXPCInterface interfaceWithProtocol:&unk_1ECAEA328];
  qword_1EB1EDD98 = (uint64_t)v2;
  char v3 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = self;
  v17[1] = self;
  v17[2] = self;
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 3)), sel_grantAccessClaim_withReply_, 0, 1);
  uint64_t v4 = (void *)qword_1EB1EDD98;
  int v5 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = self;
  v16[1] = self;
  v16[2] = self;
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 3)), sel_grantAccessClaim_withReply_, 1, 1);
  char v6 = (void *)qword_1EB1EDD98;
  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = self;
  v15[1] = self;
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 2)), sel_grantAccessClaim_withReply_, 2, 1);
  int v8 = (void *)qword_1EB1EDD98;
  char v9 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = self;
  v14[1] = self;
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 2)), sel_prepareToArbitrateForURLs_, 0, 0);
  objc_msgSend((id)qword_1EB1EDD98, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_filePresenterInterface"), sel_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_, 0, 0);
  objc_msgSend((id)qword_1EB1EDD98, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_fileProviderInterface"), sel_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply_, 0, 0);
  char v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [(id)qword_1EB1EDD98 setClasses:v12 forSelector:sel_writerWithPurposeID_didChangeUbiquityAttributes_ofItemAtURL_ argumentIndex:1 ofReply:0];
  return [(id)qword_1EB1EDD98 setClasses:v12 forSelector:sel_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_ argumentIndex:4 ofReply:0];
}

+ (id)_fileProviderInterface
{
  if (qword_1EB1EDD80 != -1) {
    dispatch_once(&qword_1EB1EDD80, &__block_literal_global_363);
  }
  return (id)qword_1EB1EDD88;
}

- (NSFileCoordinator)init
{
  return [(NSFileCoordinator *)self initWithFilePresenter:0];
}

+ (void)addFilePresenter:(id)filePresenter
{
  uint64_t v4 = NSFileCoordinatorSharedAccessArbiter();

  [(NSFileAccessArbiterProxy *)v4 addFilePresenter:filePresenter];
}

- (void)_withAccessArbiter:(id)a3 invokeAccessor:(id)a4 orDont:(BOOL)a5 andRelinquishAccessClaim:(id)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [a6 claimID];
  if (v7)
  {
    [a3 revokeAccessClaimForID:v11];
    [a6 finished];
  }
  else
  {
    int v12 = [a6 shouldBeRevokedPriorToInvokingAccessor];
    char v13 = v12;
    if (v12)
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      uint64_t v14 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v11;
        _os_log_impl(&dword_181795000, v14, OS_LOG_TYPE_INFO, "Revoking claim %{public}@ prior to invoking accessor", buf, 0xCu);
      }
      [a3 revokeAccessClaimForID:v11];
    }
    *(_DWORD *)buf = -1;
    int v23 = 1;
    int v15 = _NSSetThreadSpecificMaterializationState(1, (int *)buf);
    [a6 protectFilesAgainstEviction];
    if (v15)
    {
      if ([a6 shouldEnableMaterializationDuringAccessorBlock]) {
        int v16 = 2;
      }
      else {
        int v16 = *(_DWORD *)buf;
      }
      if (_NSSetThreadSpecificMaterializationState(v16, &v23) && v23 != 1) {
        __assert_rtn("-[NSFileCoordinator(NSPrivate) _withAccessArbiter:invokeAccessor:orDont:andRelinquishAccessClaim:]", "NSFileCoordinator.m", 962, "materializationOffState == IOPOL_MATERIALIZE_DATALESS_FILES_OFF");
      }
      int v15 = [a6 shouldEnableMaterializationDuringAccessorBlock];
    }
    int v17 = [self->_fileReactor conformsToProtocol:&unk_1ECAF9DC8];
    char v18 = v17;
    if (v17) {
      uint64_t v19 = [self->_fileReactor presentedItemURL];
    }
    else {
      uint64_t v19 = 0;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__NSFileCoordinator_NSPrivate___withAccessArbiter_invokeAccessor_orDont_andRelinquishAccessClaim___block_invoke;
    v20[3] = &unk_1E51FBD50;
    char v21 = v18;
    v20[4] = self;
    v20[5] = v19;
    char v22 = v13;
    v20[6] = a3;
    v20[7] = v11;
    v20[8] = a6;
    (*((void (**)(id, void *))a4 + 2))(a4, v20);
    if (v15) {
      _NSSetThreadSpecificMaterializationState(*(int *)buf, &v24);
    }
  }
}

- (NSFileCoordinator)initWithFilePresenter:(id)filePresenterOrNil
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFileCoordinator;
  uint64_t v4 = [(NSFileCoordinator *)&v8 init];
  if (v4)
  {
    v4->_accessArbiter = NSFileCoordinatorSharedAccessArbiter();
    id v5 = filePresenterOrNil;
    v4->_fileReactor = v5;
    if (!v4->_purposeID)
    {
      if (v5)
      {
        v4->_id purposeID = (id)objc_msgSend((id)objc_msgSend(v4->_accessArbiter, "idForFileReactor:", v5), "copy");
        [(NSFileCoordinator *)v4 _lockdownPurposeIdentifier];
      }
      else
      {
        CFUUIDRef v6 = CFUUIDCreate(0);
        v4->_id purposeID = (id)CFUUIDCreateString(0, v6);
        CFRelease(v6);
      }
    }
    v4->_recentFilePresenterURL = (NSURL *)objc_msgSend((id)objc_msgSend(filePresenterOrNil, "presentedItemURL"), "copy");
  }
  return v4;
}

id __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  *(void *)(*(void *)(a1[4] + 8) + 40) = a3;
  *(void *)(*(void *)(a1[5] + 8) + 40) = a4;
  id result = a5;
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_197(void *a1, uint64_t a2)
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (!v2) {
    uint64_t v2 = a1[4];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2_198;
  v5[3] = &unk_1E51F7EE0;
  uint64_t v3 = a1[6];
  v5[4] = a1[5];
  v5[5] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v5);
}

- (void)_lockdownPurposeIdentifier
{
}

id __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a3;
  id result = a4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_204(void *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(a1[8] + 8) + 40);
  if (!v4) {
    uint64_t v4 = a1[4];
  }
  id v5 = (void *)a1[5];
  v11[0] = +[NSFileAccessIntent writingIntentWithURL:v4 options:a1[9]];
  uint64_t v6 = objc_msgSend(v5, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 1), 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2_207;
  v10[3] = &unk_1E51FBDF0;
  uint64_t v8 = a1[6];
  uint64_t v7 = a1[7];
  v10[4] = a1[5];
  v10[5] = v6;
  v10[6] = v8;
  v10[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v4, v10);
}

- (id)_willStartWriteWithIntents:(id)a3 async:(BOOL)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NSFileCoordinator_NSPrivate___willStartWriteWithIntents_async___block_invoke;
  v8[3] = &unk_1E51FBD28;
  BOOL v9 = a4;
  v8[4] = a3;
  v8[5] = v6;
  [a3 enumerateObjectsUsingBlock:v8];
  return v6;
}

id __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  *(void *)(*(void *)(a1[4] + 8) + 40) = a3;
  *(void *)(*(void *)(a1[5] + 8) + 40) = a4;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a5;
  id result = a6;
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  return result;
}

uint64_t __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_212(void *a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(a1[9] + 8) + 40);
  if (!v4) {
    uint64_t v4 = a1[4];
  }
  uint64_t v5 = *(void *)(*(void *)(a1[10] + 8) + 40);
  if (!v5) {
    uint64_t v5 = a1[5];
  }
  uint64_t v6 = (void *)a1[6];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:v5 options:a1[11]];
  uint64_t v7 = objc_msgSend(v6, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1), 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_213;
  v11[3] = &unk_1E51FBDF0;
  uint64_t v9 = a1[7];
  uint64_t v8 = a1[8];
  v11[4] = a1[6];
  v11[5] = v7;
  v11[6] = v9;
  v11[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, v4, v5, v11);
}

uint64_t __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E51F7DF0;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[5] = a3;
  v6[6] = v4;
  v6[4] = a2;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6);
}

- (void)coordinateReadingItemAtURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options error:(NSError *)outError byAccessor:(void *)reader
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke;
  v6[3] = &unk_1E51FBC68;
  v6[4] = self;
  v6[5] = reader;
  [(NSFileCoordinator *)self _coordinateReadingItemAtURL:url options:options error:outError byAccessor:v6];
}

- (void)coordinateReadingItemAtURL:(NSURL *)readingURL options:(NSFileCoordinatorReadingOptions)readingOptions writingItemAtURL:(NSURL *)writingURL options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)readerWriter
{
  void v8[6] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke;
  v8[3] = &unk_1E51FBC90;
  v8[4] = self;
  v8[5] = readerWriter;
  [(NSFileCoordinator *)self _coordinateReadingItemAtURL:readingURL options:readingOptions writingItemAtURL:writingURL options:writingOptions error:outError byAccessor:v8];
}

- (void)_coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    int v15 = (void (*)(id, id, id, void *))*((void *)a8 + 2);
    v15(a8, a3, a5, &__block_literal_global_209);
  }
  else
  {
    uint64_t v31 = a7;
    if (+[NSThread isMainThread]) {
      unint64_t v16 = a4 | 0x80000000;
    }
    else {
      unint64_t v16 = a4;
    }
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3052000000;
    v55 = __Block_byref_object_copy__24;
    v56 = __Block_byref_object_dispose__24;
    uint64_t v57 = 0;
    uint64_t v46 = 0;
    id v47 = &v46;
    uint64_t v48 = 0x3052000000;
    uint64_t v49 = __Block_byref_object_copy__24;
    uint64_t v50 = __Block_byref_object_dispose__24;
    uint64_t v51 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3052000000;
    unint64_t v43 = __Block_byref_object_copy__24;
    __int16 v44 = __Block_byref_object_dispose__24;
    uint64_t v45 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3052000000;
    __int16 v37 = __Block_byref_object_copy__24;
    uint64_t v38 = __Block_byref_object_dispose__24;
    uint64_t v39 = 0;
    int v17 = [NSFileReadingWritingClaim alloc];
    id purposeID = self->_purposeID;
    id v19 = +[NSFileCoordinator _canonicalURLForURL:a3];
    id v20 = +[NSFileCoordinator _canonicalURLForURL:a5];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
    v33[3] = &unk_1E51FBE40;
    v33[4] = &v52;
    v33[5] = &v46;
    v33[6] = &v40;
    v33[7] = &v34;
    char v21 = [(NSFileReadingWritingClaim *)v17 initWithPurposeID:purposeID readingURL:v19 options:v16 writingURL:v20 options:a6 claimer:v33];
    char v22 = v31;
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      int v23 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = self->_purposeID;
        uint64_t v25 = [(NSFileAccessClaim *)v21 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v59 = v16;
        __int16 v60 = 2113;
        id v61 = a3;
        __int16 v62 = 2114;
        id v63 = v24;
        __int16 v64 = 2114;
        uint64_t v65 = v25;
        _os_log_impl(&dword_181795000, v23, OS_LOG_TYPE_DEFAULT, "Read options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        char v22 = v31;
        if (qword_1EB1EDDD0 != -1) {
          dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
        }
      }
      uint64_t v26 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = self->_purposeID;
        uint64_t v28 = [(NSFileAccessClaim *)v21 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v59 = a6;
        __int16 v60 = 2113;
        id v61 = a5;
        __int16 v62 = 2114;
        id v63 = v27;
        __int16 v64 = 2114;
        uint64_t v65 = v28;
        _os_log_impl(&dword_181795000, v26, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    id v29 = self->_accessArbiter;
    [(NSFileCoordinator *)self _blockOnAccessClaim:v21 withAccessArbiter:v29];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_212;
    v32[3] = &unk_1E51FBE68;
    v32[4] = a3;
    v32[5] = a5;
    v32[10] = &v46;
    v32[11] = a6;
    v32[8] = a8;
    v32[9] = &v52;
    v32[6] = self;
    v32[7] = v29;
    [(NSFileCoordinator *)self _withAccessArbiter:v29 invokeAccessor:v32 orDont:v35[5] != 0 andRelinquishAccessClaim:v21];
    uint64_t v30 = v35;
    if (v35[5])
    {

      uint64_t v30 = v35;
      if (v22)
      {
        *char v22 = (id)v35[5];
        uint64_t v30 = v35;
      }
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v52, 8);
  }
}

void __65__NSFileCoordinator_NSPrivate___willStartWriteWithIntents_async___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = [a2 URL];
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if ([a2 isRead]) {
    return;
  }
  char v8 = [a2 writingOptions];
  char v9 = v8;
  if (!*(unsigned char *)(a1 + 48))
  {
    if (v8)
    {
      id v10 = +[NSMetadataQuery willBeginPossibleDeletionOfItemAtURL:v7];
      goto LABEL_9;
    }
    if ((v8 & 2) == 0)
    {
      id v10 = +[NSMetadataQuery willBeginPossibleCreationOfItemAtURL:v7];
      goto LABEL_9;
    }
    unint64_t v16 = a3 + 1;
    if (v16 < [*(id *)(a1 + 32) count])
    {
      int v17 = (void *)[*(id *)(a1 + 32) objectAtIndex:v16];
      if (([v17 isRead] & 1) == 0)
      {
        if ([v17 URL])
        {
          id v10 = +[NSMetadataQuery willBeginPossibleMoveOfItemAtURL:toURL:](NSMetadataQuery, "willBeginPossibleMoveOfItemAtURL:toURL:", v7, [v17 URL]);
LABEL_9:
          if (v10) {
            [*(id *)(a1 + 40) addObject:v10];
          }
        }
      }
    }
  }
  if (_CFURLIsItemPromiseAtURL())
  {
    if ((v9 & 3) != 0)
    {
      uint64_t v11 = _CFURLCopyLogicalURLOfPromiseAtURL();
      if (v11)
      {
        int v12 = (const void *)v11;
        char v13 = objc_opt_new();
        [v13 setPromiseURL:v7];
        [v13 setLogicalURL:v12];
        id v14 = v13;
        CFRelease(v12);
        if (v14)
        {
          int v15 = *(void **)(a1 + 40);
          [v15 addObject:v14];
        }
      }
    }
  }
}

uint64_t __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E51F7EE0;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return [v3 _invokeAccessor:v6 thenCompletionHandler:a3];
}

uint64_t __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E51F7EE0;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return [v3 _invokeAccessor:v6 thenCompletionHandler:a3];
}

- (void)_invokeAccessor:(id)a3 thenCompletionHandler:(id)a4
{
  TSD = (uint64_t *)NSFileCoordinatorGetTSD();
  uint64_t v8 = *TSD;
  uint64_t *TSD = (uint64_t)self;
  char v9 = +[NSFileCoordinatorAccessorBlockCompletion completionWithBlock:a4];
  TSD[1] = (uint64_t)v9;
  (*((void (**)(id))a3 + 2))(a3);
  uint64_t *TSD = v8;
  [(NSFileCoordinatorAccessorBlockCompletion *)v9 decrement];
  TSD[1] = 0;
}

+ (id)_createIdentifierForNewClaim
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  uint64_t v3 = *(void **)(TSD + 32);
  if (v3)
  {
    *(void *)(TSD + 32) = 0;
    return v3;
  }
  else
  {
    return (id)__CFCreateUUIDString();
  }
}

uint64_t __73__NSFileCoordinator_coordinateReadingItemAtURL_options_error_byAccessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __85__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2_207(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);
}

- (void)_didEndWrite:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        char v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (object_getClass(v9) == (Class)NSFilePromiseWriteToken)
        {
          if ((objc_msgSend((id)objc_msgSend(v9, "promiseURL"), "checkResourceIsReachableAndReturnError:", 0) & 1) == 0) {
            -[NSFileCoordinator _itemDidDisappearAtURL:](self, "_itemDidDisappearAtURL:", [v9 logicalURL]);
          }
        }
        else
        {
          +[NSMetadataQuery didEndPossibleFileOperation:v9];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

uint64_t __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __98__NSFileCoordinator_coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __110__NSFileCoordinator_NSPrivate___coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_213(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileCoordinator;
  [(NSFileCoordinator *)&v3 dealloc];
}

- (void)coordinateWritingItemAtURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options error:(NSError *)outError byAccessor:(void *)writer
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileCoordinator_coordinateWritingItemAtURL_options_error_byAccessor___block_invoke;
  v6[3] = &unk_1E51FBC68;
  v6[4] = self;
  v6[5] = writer;
  [(NSFileCoordinator *)self _coordinateWritingItemAtURL:url options:options error:outError byAccessor:v6];
}

void __53__NSFileCoordinator_NSPrivate___skipCoordinationWork__block_invoke()
{
  v0 = (void *)MEMORY[0x185308110]();
  BOOL v1 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSFileCoordinatorDoesNothing") & 1) != 0|| getenv("NSDisableFileCoordination") != 0;
  _MergedGlobals_147 = v1;
  if (_MergedGlobals_147) {
    NSLog((NSString *)@"NSFileCoordinator is doing nothing.");
  }
}

+ (void)removeFilePresenter:(id)filePresenter
{
  uint64_t v4 = NSFileCoordinatorSharedAccessArbiter();

  [(NSFileAccessArbiterProxy *)v4 removeFilePresenter:filePresenter];
}

+ (NSArray)filePresenters
{
  uint64_t v2 = NSFileCoordinatorSharedAccessArbiter();

  return (NSArray *)[(NSFileAccessArbiterProxy *)v2 filePresenters];
}

- (void)setPurposeIdentifier:(NSString *)purposeIdentifier
{
  if ([(NSFileCoordinator *)self _purposeIdentifierLockedDown])
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@: A purpose identifier can't be set more than once.", _NSMethodExceptionProem((objc_class *)self, a2)];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C3A8];
    goto LABEL_8;
  }
  if (![(NSString *)purposeIdentifier length])
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@: A nil or zero-length purpose identifier is not allowed.", _NSMethodExceptionProem((objc_class *)self, a2)];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C3C8];
LABEL_8:
    objc_exception_throw((id)[v7 exceptionWithName:*v8 reason:v6 userInfo:0]);
  }

  [(NSFileCoordinator *)self _setPurposeIdentifier:purposeIdentifier];
}

- (NSString)purposeIdentifier
{
  id v2 = self->_purposeID;

  return (NSString *)v2;
}

- (void)coordinateWritingItemAtURL:(NSURL *)url1 options:(NSFileCoordinatorWritingOptions)options1 writingItemAtURL:(NSURL *)url2 options:(NSFileCoordinatorWritingOptions)options2 error:(NSError *)outError byAccessor:(void *)writer
{
  void v8[6] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke;
  v8[3] = &unk_1E51FBC90;
  v8[4] = self;
  v8[5] = writer;
  [(NSFileCoordinator *)self _coordinateWritingItemAtURL:url1 options:options1 writingItemAtURL:url2 options:options2 error:outError byAccessor:v8];
}

uint64_t __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v6[7] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
  v6[3] = &unk_1E51F7DF0;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[5] = a3;
  v6[6] = v4;
  v6[4] = a2;
  return objc_msgSend(v3, "_invokeAccessor:thenCompletionHandler:", v6);
}

uint64_t __98__NSFileCoordinator_coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)coordinateAccessWithIntents:(NSArray *)intents queue:(NSOperationQueue *)queue byAccessor:(void *)accessor
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke;
  v5[3] = &unk_1E51FBCB8;
  v5[4] = self;
  v5[5] = accessor;
  [(NSFileCoordinator *)self _coordinateAccessWithIntents:intents queue:queue byAccessor:v5];
}

uint64_t __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke_2;
  v6[3] = &unk_1E51F7EE0;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return [v3 _invokeAccessor:v6 thenCompletionHandler:a3];
}

uint64_t __66__NSFileCoordinator_coordinateAccessWithIntents_queue_byAccessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)prepareForReadingItemsAtURLs:(NSArray *)readingURLs options:(NSFileCoordinatorReadingOptions)readingOptions writingItemsAtURLs:(NSArray *)writingURLs options:(NSFileCoordinatorWritingOptions)writingOptions error:(NSError *)outError byAccessor:(void *)batchAccessor
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3052000000;
  uint64_t v34 = __Block_byref_object_copy__24;
  uint64_t v35 = __Block_byref_object_dispose__24;
  uint64_t v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  uint64_t v28 = __Block_byref_object_copy__24;
  id v29 = __Block_byref_object_dispose__24;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3052000000;
  char v22 = __Block_byref_object_copy__12;
  int v23 = __Block_byref_object_dispose__13;
  uint64_t v24 = 0;
  long long v14 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke;
  v18[3] = &unk_1E51FBCE0;
  v18[6] = &v25;
  v18[7] = &v19;
  v18[4] = v14;
  v18[5] = &v31;
  [(NSFileCoordinator *)self __prepareForReadingItemsAtURLs:readingURLs options:readingOptions writingItemsAtURLs:writingURLs options:writingOptions byAccessor:v18];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v14);
  if (v26[5])
  {
    (*(void (**)(void))(v20[5] + 16))();

    if (outError) {
      *outError = (NSError *)(id)v26[5];
    }
  }
  else
  {
    id accessArbiter = self->_accessArbiter;
    self->_id accessArbiter = (id)v32[5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke_2;
    v17[3] = &unk_1E51FC108;
    void v17[4] = self;
    v17[5] = accessArbiter;
    v17[6] = &v19;
    (*((void (**)(void *, void *))batchAccessor + 2))(batchAccessor, v17);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

intptr_t __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  *(void *)(*(void *)(a1[7] + 8) + 40) = [a4 copy];
  uint64_t v7 = a1[4];

  return dispatch_semaphore_signal(v7);
}

void __102__NSFileCoordinator_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor___block_invoke_2(void *a1)
{
  *(void *)(a1[4] + 8) = a1[5];
  (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
  id v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
}

- (void)itemAtURL:(NSURL *)oldURL willMoveToURL:(NSURL *)newURL
{
  if (*(NSFileCoordinator **)NSFileCoordinatorGetTSD() != self) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-[NSFileCoordinator itemAtURL:willMoveToURL:] may only be invoked from within a block passed to a -coordinate... method." userInfo:0]);
  }

  [(NSFileCoordinator *)self _itemAtURL:oldURL willMoveToURL:newURL];
}

- (void)itemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL
{
  if (*(NSFileCoordinator **)NSFileCoordinatorGetTSD() != self) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-[NSFileCoordinator itemAtURL:didMoveToURL:] may only be invoked from within a block passed to a -coordinate... method." userInfo:0]);
  }

  [(NSFileCoordinator *)self _itemAtURL:oldURL didMoveToURL:newURL];
}

- (BOOL)_isValidUbiquityAttribute:(id)a3
{
  if (qword_1EB1EDD68 != -1) {
    dispatch_once(&qword_1EB1EDD68, &__block_literal_global_73);
  }
  return [(id)qword_1EB1EDD60 member:a3] != 0;
}

uint64_t __47__NSFileCoordinator__isValidUbiquityAttribute___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F1C690], *MEMORY[0x1E4F1C768], *MEMORY[0x1E4F1C778], *MEMORY[0x1E4F1C790], *MEMORY[0x1E4F1C798], *MEMORY[0x1E4F1C758], *MEMORY[0x1E4F1C740], *MEMORY[0x1E4F1C7A0], *MEMORY[0x1E4F1C738], *MEMORY[0x1E4F1C730], *MEMORY[0x1E4F1C788], *MEMORY[0x1E4F1C7B0], *MEMORY[0x1E4F1C7A8], *MEMORY[0x1E4F1C7C0], *MEMORY[0x1E4F1C7B8], 0);
  qword_1EB1EDD60 = result;
  return result;
}

- (void)itemAtURL:(NSURL *)url didChangeUbiquityAttributes:(NSSet *)attributes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!attributes)
  {
    long long v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    long long v13 = (NSString *)@"nil attributes";
LABEL_15:
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v13 userInfo:0]);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(NSSet *)attributes countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(attributes);
      }
      uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
      if (![(NSFileCoordinator *)self _isValidUbiquityAttribute:v11])
      {
        long long v13 = +[NSString stringWithFormat:@"invalid attribute: %@", v11];
        long long v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        goto LABEL_15;
      }
    }
    uint64_t v8 = [(NSSet *)attributes countByEnumeratingWithState:&v17 objects:v16 count:16];
  }
  while (v8);
LABEL_10:
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    if ([(NSSet *)attributes count])
    {
      long long v12 = (void *)MEMORY[0x185308110]();
      objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeUbiquityAttributes:ofItemAtURL:", self->_purposeID, attributes, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", url)));
    }
  }
}

- (void)cancel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&stru_1EB1EDD24);
  if (qword_1EB1EDDD0 != -1) {
    dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
  }
  objc_super v3 = qword_1EB1EDD30;
  if (os_log_type_enabled((os_log_t)qword_1EB1EDD30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = self;
    _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "NSFileCoordinator instance %p was cancelled. All future claims made on this instance will immediately fail with cancellation", buf, 0xCu);
  }
  if (_NSIsNSSet())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id accessClaimIDOrIDs = self->_accessClaimIDOrIDs;
    uint64_t v5 = [accessClaimIDOrIDs countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v17;
      *(void *)&long long v6 = 138543362;
      long long v14 = v6;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(accessClaimIDOrIDs);
          }
          id v10 = *(NSFileCoordinator **)(*((void *)&v16 + 1) + 8 * v9);
          if (qword_1EB1EDDD0 != -1) {
            dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
          }
          uint64_t v11 = qword_1EB1EDD38;
          if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            uint64_t v21 = v10;
            _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "In-flight claim %{public}@ was cancelled", buf, 0xCu);
          }
          objc_msgSend(self->_accessArbiter, "cancelAccessClaimForID:", v10, v14);
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [accessClaimIDOrIDs countByEnumeratingWithState:&v16 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else if (self->_accessClaimIDOrIDs)
  {
    if (qword_1EB1EDDD0 != -1) {
      dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
    }
    long long v12 = qword_1EB1EDD38;
    if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = (NSFileCoordinator *)self->_accessClaimIDOrIDs;
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v13;
      _os_log_impl(&dword_181795000, v12, OS_LOG_TYPE_DEFAULT, "In-flight claim %{public}@ was cancelled", buf, 0xCu);
    }
    [self->_accessArbiter cancelAccessClaimForID:self->_accessClaimIDOrIDs];
  }
  self->_isCancelled = 1;
  os_unfair_lock_unlock(&stru_1EB1EDD24);
}

+ (id)_nextClaimIdentifier
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  id result = *(id *)(TSD + 32);
  if (!result)
  {
    id result = (id)__CFCreateUUIDString();
    *(void *)(TSD + 32) = result;
  }
  return result;
}

+ (void)_setNextClaimIdentifier:(id)a3
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  if (*(void *)(TSD + 32)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't set next claim identifier when current identifier has not been consumed" userInfo:0]);
  }
  *(void *)(TSD + 32) = [a3 copy];
}

- (void)_cancelClaimWithIdentifier:(id)a3
{
}

void __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)_coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 error:(id *)a7 byAccessor:(id)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v15 = (void (*)(id, id, id, void *))*((void *)a8 + 2);
    v15(a8, a3, a5, &__block_literal_global_215);
  }
  else
  {
    uint64_t v30 = a7;
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3052000000;
    uint64_t v48 = __Block_byref_object_copy__24;
    uint64_t v49 = __Block_byref_object_dispose__24;
    uint64_t v50 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3052000000;
    uint64_t v42 = __Block_byref_object_copy__24;
    unint64_t v43 = __Block_byref_object_dispose__24;
    uint64_t v44 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3052000000;
    uint64_t v36 = __Block_byref_object_copy__24;
    uint64_t v37 = __Block_byref_object_dispose__24;
    uint64_t v38 = 0;
    long long v16 = [NSFileWritingWritingClaim alloc];
    id purposeID = self->_purposeID;
    id v18 = +[NSFileCoordinator _canonicalURLForURL:a3];
    id v19 = +[NSFileCoordinator _canonicalURLForURL:a5];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2;
    v32[3] = &unk_1E51FBE90;
    v32[4] = &v45;
    v32[5] = &v39;
    v32[6] = &v33;
    long long v20 = [(NSFileWritingWritingClaim *)v16 initWithPurposeID:purposeID url:v18 options:a4 url:v19 options:a6 claimer:v32];
    uint64_t v21 = v30;
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      uint64_t v22 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = self->_purposeID;
        uint64_t v24 = [(NSFileAccessClaim *)v20 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v52 = a4;
        __int16 v53 = 2113;
        id v54 = a3;
        __int16 v55 = 2114;
        id v56 = v23;
        __int16 v57 = 2114;
        uint64_t v58 = v24;
        _os_log_impl(&dword_181795000, v22, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        uint64_t v21 = v30;
        if (qword_1EB1EDDD0 != -1) {
          dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
        }
      }
      uint64_t v25 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = self->_purposeID;
        uint64_t v27 = [(NSFileAccessClaim *)v20 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v52 = a6;
        __int16 v53 = 2113;
        id v54 = a5;
        __int16 v55 = 2114;
        id v56 = v26;
        __int16 v57 = 2114;
        uint64_t v58 = v27;
        _os_log_impl(&dword_181795000, v25, OS_LOG_TYPE_DEFAULT, "Write options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    id v28 = self->_accessArbiter;
    [(NSFileCoordinator *)self _blockOnAccessClaim:v20 withAccessArbiter:v28];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_218;
    v31[3] = &unk_1E51FBEB8;
    v31[4] = a3;
    v31[5] = a5;
    v31[10] = &v39;
    v31[11] = a4;
    v31[12] = a6;
    v31[8] = a8;
    v31[9] = &v45;
    v31[6] = self;
    v31[7] = v28;
    [(NSFileCoordinator *)self _withAccessArbiter:v28 invokeAccessor:v31 orDont:v34[5] != 0 andRelinquishAccessClaim:v20];
    id v29 = v34;
    if (v34[5])
    {

      id v29 = v34;
      if (v21)
      {
        id *v21 = (id)v34[5];
        id v29 = v34;
      }
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }
}

id __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  *(void *)(*(void *)(a1[4] + 8) + 40) = a3;
  *(void *)(*(void *)(a1[5] + 8) + 40) = a4;
  id result = a5;
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_218(void *a1, uint64_t a2)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(a1[9] + 8) + 40);
  if (!v4) {
    uint64_t v4 = a1[4];
  }
  uint64_t v5 = *(void *)(*(void *)(a1[10] + 8) + 40);
  if (!v5) {
    uint64_t v5 = a1[5];
  }
  long long v6 = (void *)a1[6];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:v4 options:a1[11]];
  v12[1] = +[NSFileAccessIntent writingIntentWithURL:v5 options:a1[12]];
  uint64_t v7 = objc_msgSend(v6, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 2), 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_219;
  v11[3] = &unk_1E51FBDF0;
  uint64_t v9 = a1[7];
  uint64_t v8 = a1[8];
  v11[4] = a1[6];
  v11[5] = v7;
  v11[6] = v9;
  v11[7] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, v4, v5, v11);
}

void __110__NSFileCoordinator_NSPrivate___coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor___block_invoke_2_219(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) _didEndWrite:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);
}

- (void)_coordinateAccessWithIntents:(id)a3 queue:(id)a4 byAccessor:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke;
    v36[3] = &unk_1E51F8650;
    v36[4] = a5;
    objc_msgSend(a4, "_fc_addUncancellableOperationWithBlock:", v36);
  }
  else
  {
    id accessArbiter = self->_accessArbiter;
    uint64_t v30 = objc_alloc_init(NSAutoreleasePool);
    id v10 = [NSFileMultipleAccessClaim alloc];
    id purposeID = self->_purposeID;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_3;
    v35[3] = &unk_1E51FBF08;
    v35[4] = self;
    v35[5] = a3;
    id v29 = accessArbiter;
    v35[6] = accessArbiter;
    v35[7] = a4;
    v35[8] = a5;
    uint64_t v32 = [(NSFileMultipleAccessClaim *)v10 initWithPurposeID:purposeID intents:a3 claimer:v35];
    if (__NSFCShouldLog(1))
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v48 objects:v47 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v49;
        uint64_t v15 = &qword_1EB1ED000;
        long long v16 = &qword_1EB1ED000;
        id v31 = a3;
        do
        {
          uint64_t v17 = 0;
          uint64_t v33 = v13;
          do
          {
            if (*(void *)v49 != v14) {
              objc_enumerationMutation(a3);
            }
            id v18 = *(void **)(*((void *)&v48 + 1) + 8 * v17);
            if (v15[442] != -1) {
              dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
            }
            id v19 = v16[423];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = v14;
              uint64_t v21 = v16;
              uint64_t v22 = v15;
              if ([v18 isRead]) {
                id v23 = "Read";
              }
              else {
                id v23 = "Write";
              }
              if ([v18 isRead]) {
                uint64_t v24 = [v18 readingOptions];
              }
              else {
                uint64_t v24 = [v18 writingOptions];
              }
              uint64_t v25 = v24;
              uint64_t v26 = [v18 URL];
              id v27 = self->_purposeID;
              uint64_t v28 = [(NSFileAccessClaim *)v32 claimID];
              *(_DWORD *)buf = 136316163;
              uint64_t v38 = v23;
              __int16 v39 = 2048;
              uint64_t v40 = v25;
              __int16 v41 = 2113;
              uint64_t v42 = v26;
              __int16 v43 = 2114;
              id v44 = v27;
              __int16 v45 = 2114;
              uint64_t v46 = v28;
              _os_log_impl(&dword_181795000, v19, OS_LOG_TYPE_DEFAULT, "%s options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x34u);
              a3 = v31;
              uint64_t v15 = v22;
              long long v16 = v21;
              uint64_t v14 = v20;
              uint64_t v13 = v33;
            }
            ++v17;
          }
          while (v13 != v17);
          uint64_t v13 = [a3 countByEnumeratingWithState:&v48 objects:v47 count:16];
        }
        while (v13);
      }
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_227;
    v34[3] = &unk_1E51F6678;
    v34[4] = v29;
    v34[5] = v32;
    [(NSFileCoordinator *)self _requestAccessClaim:v32 withProcedure:v34];

    [(NSAutoreleasePool *)v30 drain];
  }
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = a1;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v14 isRead]) {
          uint64_t v15 = [a3 objectAtIndex:v10++];
        }
        else {
          uint64_t v15 = [a4 objectAtIndex:v11++];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v14 setURL:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v27 count:16];
    }
    while (v9);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_4;
  v24[3] = &unk_1E51FC130;
  uint64_t v16 = *(void *)(v19 + 48);
  uint64_t v17 = *(void *)(v19 + 64);
  v24[4] = *(void *)(v19 + 56);
  v24[5] = a6;
  long long v25 = *(_OWORD *)(v19 + 32);
  uint64_t v26 = v17;
  return [(id)v25 _withAccessArbiter:v16 invokeAccessor:v24 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_5;
  v5[3] = &unk_1E51FBEE0;
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  uint64_t v8 = a2;
  return objc_msgSend(v2, "_fc_addUncancellableOperationWithBlock:", v5);
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_5(uint64_t a1)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) _willStartWriteWithIntents:*(void *)(a1 + 48) async:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_6;
  v7[3] = &unk_1E51F7DF0;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v7[5] = v3;
  v7[6] = v5;
  v7[4] = *(void *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v2, v7);
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_6(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 _didEndWrite:v3];
}

uint64_t __78__NSFileCoordinator_NSPrivate___coordinateAccessWithIntents_queue_byAccessor___block_invoke_227(uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)_itemAtURL:(id)a3 didMoveToURL:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    long long v7 = (void *)MEMORY[0x185308110]();
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didMoveItemAtURL:toURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a4)));
  }
}

- (void)_ubiquityDidChangeForItemAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v5 = objc_alloc_init(NSAutoreleasePool);
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeUbiquityOfItemAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    [(NSAutoreleasePool *)v5 drain];
  }
}

- (void)sharingDidChangeForItemAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v5 = (void *)MEMORY[0x185308110]();
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeSharingOfItemAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
  }
}

- (void)_itemDidDisappearAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v5 = objc_alloc_init(NSAutoreleasePool);
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didMakeItemDisappearAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    [(NSAutoreleasePool *)v5 drain];
  }
}

- (void)_itemDidChangeAtURL:(id)a3
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v5 = objc_alloc_init(NSAutoreleasePool);
    objc_msgSend(self->_accessArbiter, "writerWithPurposeID:didChangeItemAtURL:", self->_purposeID, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", +[NSFileCoordinator _canonicalURLForURL:](NSFileCoordinator, "_canonicalURLForURL:", a3)));
    [(NSAutoreleasePool *)v5 drain];
  }
}

- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v11 = (void (*)(id, id, void, void *))*((void *)a6 + 2);
    v11(a6, a3, 0, &__block_literal_global_229);
  }
  else
  {
    id accessArbiter = self->_accessArbiter;
    uint64_t v13 = objc_alloc_init(NSAutoreleasePool);
    uint64_t v14 = [NSFileReadingClaim alloc];
    id v15 = +[NSFileCoordinator _canonicalURLForURL:a3];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v21[3] = &unk_1E51FBF58;
    v21[4] = self;
    v21[5] = a3;
    v21[7] = a6;
    v21[8] = a4;
    v21[6] = accessArbiter;
    uint64_t v16 = [(NSFileReadingClaim *)v14 initWithPurposeID:a5 url:v15 options:a4 claimer:v21];
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      uint64_t v17 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id purposeID = self->_purposeID;
        uint64_t v19 = [(NSFileAccessClaim *)v16 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v23 = a4;
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2114;
        id v27 = purposeID;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        _os_log_impl(&dword_181795000, v17, OS_LOG_TYPE_DEFAULT, "Read (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_230;
    v20[3] = &unk_1E51F6678;
    v20[4] = accessArbiter;
    v20[5] = v16;
    [(NSFileCoordinator *)self _requestAccessClaim:v16 withProcedure:v20];

    [(NSAutoreleasePool *)v13 drain];
  }
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[9] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3) {
    a3 = *(void *)(a1 + 40);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v13[3] = &unk_1E51FBF30;
  v13[4] = v9;
  v13[5] = a3;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 48);
  v13[7] = *(void *)(a1 + 56);
  v13[8] = v10;
  v13[6] = a5;
  return [v9 _withAccessArbiter:v11 invokeAccessor:v13 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_3(void *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)a1[4];
  v11[0] = +[NSFileAccessIntent readingIntentWithURL:a1[5] options:a1[8]];
  uint64_t v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 1), 1);
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v10[3] = &unk_1E51F7DF0;
  v10[5] = v5;
  v10[6] = a2;
  uint64_t v8 = a1[5];
  v10[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v6, v10);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_4(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 _didEndWrite:v3];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_purposeID_byAccessor___block_invoke_230(uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 byAccessor:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v11 = (void (*)(id, id, void, void *))*((void *)a6 + 2);
    v11(a6, a3, 0, &__block_literal_global_232);
  }
  else
  {
    id accessArbiter = self->_accessArbiter;
    uint64_t v13 = objc_alloc_init(NSAutoreleasePool);
    uint64_t v14 = [NSFileWritingClaim alloc];
    id v15 = +[NSFileCoordinator _canonicalURLForURL:a3];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v21[3] = &unk_1E51FBF80;
    v21[4] = self;
    v21[5] = a3;
    v21[7] = a6;
    v21[8] = a4;
    v21[6] = accessArbiter;
    uint64_t v16 = [(NSFileWritingClaim *)v14 initWithPurposeID:a5 url:v15 options:a4 claimer:v21];
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      uint64_t v17 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id purposeID = self->_purposeID;
        uint64_t v19 = [(NSFileAccessClaim *)v16 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v23 = a4;
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2114;
        id v27 = purposeID;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        _os_log_impl(&dword_181795000, v17, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_233;
    v20[3] = &unk_1E51F6678;
    v20[4] = accessArbiter;
    v20[5] = v16;
    [(NSFileCoordinator *)self _requestAccessClaim:v16 withProcedure:v20];

    [(NSAutoreleasePool *)v13 drain];
  }
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v12[9] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3) {
    a3 = *(void *)(a1 + 40);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  void v12[3] = &unk_1E51FBF30;
  v12[4] = v8;
  v12[5] = a3;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 48);
  v12[7] = *(void *)(a1 + 56);
  v12[8] = v9;
  v12[6] = a4;
  return [v8 _withAccessArbiter:v10 invokeAccessor:v12 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_3(void *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)a1[4];
  v11[0] = +[NSFileAccessIntent writingIntentWithURL:a1[5] options:a1[8]];
  uint64_t v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 1), 1);
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v10[3] = &unk_1E51F7DF0;
  v10[5] = v5;
  v10[6] = a2;
  uint64_t v8 = a1[5];
  v10[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v6, v10);
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_4(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 _didEndWrite:v3];
}

uint64_t __90__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_purposeID_byAccessor___block_invoke_233(uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    id v15 = (void (*)(id, id, id, void, void *))*((void *)a8 + 2);
    v15(a8, a3, a5, 0, &__block_literal_global_235);
  }
  else
  {
    id v36 = a7;
    id v16 = a5;
    unint64_t v17 = a4;
    unint64_t v18 = a6;
    id accessArbiter = self->_accessArbiter;
    uint64_t v37 = objc_alloc_init(NSAutoreleasePool);
    uint64_t v20 = [NSFileReadingWritingClaim alloc];
    id v21 = +[NSFileCoordinator _canonicalURLForURL:a3];
    id v22 = accessArbiter;
    unint64_t v23 = v18;
    unint64_t v24 = v17;
    id v25 = v16;
    id v26 = +[NSFileCoordinator _canonicalURLForURL:v16];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v39[3] = &unk_1E51FBFD0;
    v39[4] = self;
    v39[5] = a3;
    v39[6] = v16;
    v39[7] = v22;
    v39[8] = a8;
    v39[9] = v23;
    id v27 = [(NSFileReadingWritingClaim *)v20 initWithPurposeID:v36 readingURL:v21 options:v24 writingURL:v26 options:v23 claimer:v39];
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      __int16 v28 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v22;
        id purposeID = self->_purposeID;
        uint64_t v31 = [(NSFileAccessClaim *)v27 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v41 = v24;
        __int16 v42 = 2113;
        id v43 = a3;
        __int16 v44 = 2114;
        id v45 = purposeID;
        id v22 = v29;
        __int16 v46 = 2114;
        uint64_t v47 = v31;
        _os_log_impl(&dword_181795000, v28, OS_LOG_TYPE_DEFAULT, "Read (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        if (qword_1EB1EDDD0 != -1) {
          dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
        }
      }
      uint64_t v32 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = v22;
        id v34 = self->_purposeID;
        uint64_t v35 = [(NSFileAccessClaim *)v27 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v41 = v23;
        __int16 v42 = 2113;
        id v43 = v25;
        __int16 v44 = 2114;
        id v45 = v34;
        id v22 = v33;
        __int16 v46 = 2114;
        uint64_t v47 = v35;
        _os_log_impl(&dword_181795000, v32, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_236;
    v38[3] = &unk_1E51F6678;
    v38[4] = v22;
    v38[5] = v27;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", v27, v38, v36);

    [(NSAutoreleasePool *)v37 drain];
  }
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v15[10] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
  {
    a3 = *(void *)(a1 + 40);
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    a4 = *(void *)(a1 + 48);
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v15[3] = &unk_1E51FBFA8;
  v15[4] = v11;
  v15[5] = a4;
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 56);
  v15[8] = *(void *)(a1 + 64);
  v15[9] = v12;
  v15[6] = a3;
  v15[7] = a6;
  return [v11 _withAccessArbiter:v13 invokeAccessor:v15 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3(void *a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)a1[4];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:a1[5] options:a1[9]];
  uint64_t v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1), 1);
  uint64_t v7 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v8 = a1[7];
  uint64_t v9 = a1[8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v11[3] = &unk_1E51F7DF0;
  v11[5] = v5;
  v11[6] = a2;
  v11[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v9 + 16))(v9, v6, v7, v8, v11);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 _didEndWrite:v3];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateReadingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_236(uint64_t a1)
{
  return [*(id *)(a1 + 32) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 writingItemAtURL:(id)a5 options:(unint64_t)a6 purposeID:(id)a7 byAccessor:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    id v15 = (void (*)(id, id, id, void, void *))*((void *)a8 + 2);
    v15(a8, a3, a5, 0, &__block_literal_global_238);
  }
  else
  {
    unint64_t v27 = a6;
    id accessArbiter = self->_accessArbiter;
    __int16 v28 = objc_alloc_init(NSAutoreleasePool);
    unint64_t v17 = [NSFileWritingWritingClaim alloc];
    id v18 = +[NSFileCoordinator _canonicalURLForURL:a3];
    id v19 = +[NSFileCoordinator _canonicalURLForURL:a5];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2;
    v30[3] = &unk_1E51FC020;
    v30[4] = self;
    v30[5] = a3;
    v30[6] = a5;
    v30[7] = accessArbiter;
    v30[9] = a4;
    v30[10] = v27;
    v30[8] = a8;
    uint64_t v20 = [(NSFileWritingWritingClaim *)v17 initWithPurposeID:a7 url:v18 options:a4 url:v19 options:v27 claimer:v30];
    if (__NSFCShouldLog(1))
    {
      if (qword_1EB1EDDD0 != -1) {
        dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
      }
      id v21 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id purposeID = self->_purposeID;
        uint64_t v23 = [(NSFileAccessClaim *)v20 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v32 = a4;
        __int16 v33 = 2113;
        id v34 = a3;
        __int16 v35 = 2114;
        id v36 = purposeID;
        __int16 v37 = 2114;
        uint64_t v38 = v23;
        _os_log_impl(&dword_181795000, v21, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
        if (qword_1EB1EDDD0 != -1) {
          dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
        }
      }
      unint64_t v24 = qword_1EB1EDD38;
      if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = self->_purposeID;
        uint64_t v26 = [(NSFileAccessClaim *)v20 claimID];
        *(_DWORD *)buf = 134218755;
        unint64_t v32 = v27;
        __int16 v33 = 2113;
        id v34 = a5;
        __int16 v35 = 2114;
        id v36 = v25;
        __int16 v37 = 2114;
        uint64_t v38 = v26;
        _os_log_impl(&dword_181795000, v24, OS_LOG_TYPE_DEFAULT, "Write (Async) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
      }
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_239;
    v29[3] = &unk_1E51F6678;
    v29[4] = self;
    v29[5] = v20;
    [(NSFileCoordinator *)self _requestAccessClaim:v20 withProcedure:v29];

    [(NSAutoreleasePool *)v28 drain];
  }
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_forgetAccessClaimForID:", objc_msgSend(a2, "claimID"));
  if (!a3)
  {
    a3 = *(void *)(a1 + 40);
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    a4 = *(void *)(a1 + 48);
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3;
  v14[3] = &unk_1E51FBFF8;
  v14[4] = v10;
  v14[5] = a3;
  long long v15 = *(_OWORD *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  v14[7] = a5;
  v14[8] = v12;
  v14[6] = a4;
  return [v10 _withAccessArbiter:v11 invokeAccessor:v14 orDont:0 andRelinquishAccessClaim:a2];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_3(void *a1, uint64_t a2)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)a1[4];
  v12[0] = +[NSFileAccessIntent writingIntentWithURL:a1[5] options:a1[9]];
  v12[1] = +[NSFileAccessIntent writingIntentWithURL:a1[6] options:a1[10]];
  uint64_t v5 = objc_msgSend(v4, "_willStartWriteWithIntents:async:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 2), 1);
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  uint64_t v9 = a1[8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4;
  v11[3] = &unk_1E51F7DF0;
  v11[5] = v5;
  v11[6] = a2;
  v11[4] = a1[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v9 + 16))(v9, v6, v7, v8, v11);
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_4(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 _didEndWrite:v3];
}

uint64_t __115__NSFileCoordinator_NSPrivate____coordinateWritingItemAtURL_options_writingItemAtURL_options_purposeID_byAccessor___block_invoke_239(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) grantAccessClaim:*(void *)(a1 + 40) synchronouslyIfPossible:0];
}

- (void)__prepareForReadingItemsAtURLs:(id)a3 options:(unint64_t)a4 writingItemsAtURLs:(id)a5 options:(unint64_t)a6 byAccessor:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (+[NSFileCoordinator _skipCoordinationWork])
  {
    id accessArbiter = self->_accessArbiter;
    uint64_t v14 = (void (*)(id, id, void, void *))*((void *)a7 + 2);
    v14(a7, accessArbiter, 0, &__block_literal_global_241_0);
  }
  else
  {
    qos_class_t v15 = qos_class_main();
    uint64_t v16 = dispatch_queue_attr_make_with_qos_class(0, v15, 0);
    unint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(v16, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.FileCoordination.subarbitration", v17);
    id v19 = +[NSXPCListener anonymousListener];
    uint64_t v20 = [[NSFileAccessSubarbiter alloc] initWithQueue:v18 listener:v19];
    [(NSXPCListener *)v19 setDelegate:v20];
    [(NSXPCListener *)v19 _setQueue:v18];
    [(NSXPCListener *)v19 resume];
    __int16 v44 = objc_alloc_init(NSAutoreleasePool);
    id v21 = [NSFileSubarbitrationClaim alloc];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_2;
    v52[3] = &unk_1E51FC070;
    v52[7] = v18;
    v52[8] = a7;
    long long v50 = self;
    v52[4] = self;
    v52[5] = v20;
    __int16 v46 = v19;
    v52[6] = v19;
    obuint64_t j = a5;
    long long v49 = [(NSFileSubarbitrationClaim *)v21 initWithReadingURLs:a3 options:a4 writingURLs:a5 options:a6 claimer:v52];
    if (__NSFCShouldLog(1))
    {
      id v22 = a3;
      unint64_t v47 = a4;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v23 = [a3 countByEnumeratingWithState:&v67 objects:v66 count:16];
      unint64_t v24 = &qword_1EB1ED000;
      id v25 = &qword_1EB1ED000;
      if (v23)
      {
        uint64_t v26 = v23;
        uint64_t v27 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v68 != v27) {
              objc_enumerationMutation(v22);
            }
            uint64_t v29 = *(void *)(*((void *)&v67 + 1) + 8 * i);
            if (v24[442] != -1) {
              dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
            }
            uint64_t v30 = v25[423];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v31 = v25;
              unint64_t v32 = v24;
              id v33 = v22;
              id purposeID = v50->_purposeID;
              uint64_t v35 = [(NSFileAccessClaim *)v49 claimID];
              *(_DWORD *)buf = 134218755;
              unint64_t v59 = v47;
              __int16 v60 = 2113;
              uint64_t v61 = v29;
              __int16 v62 = 2114;
              id v63 = purposeID;
              id v22 = v33;
              unint64_t v24 = v32;
              id v25 = v31;
              __int16 v64 = 2114;
              uint64_t v65 = v35;
              _os_log_impl(&dword_181795000, v30, OS_LOG_TYPE_DEFAULT, "Read (Subarbitration) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
            }
          }
          uint64_t v26 = [v22 countByEnumeratingWithState:&v67 objects:v66 count:16];
        }
        while (v26);
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v53, 16, v44);
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v55 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v40 = *(void *)(*((void *)&v54 + 1) + 8 * j);
            if (v24[442] != -1) {
              dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
            }
            unint64_t v41 = v25[423];
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              id v42 = v50->_purposeID;
              uint64_t v43 = [(NSFileAccessClaim *)v49 claimID];
              *(_DWORD *)buf = 134218755;
              unint64_t v59 = a6;
              __int16 v60 = 2113;
              uint64_t v61 = v40;
              __int16 v62 = 2114;
              id v63 = v42;
              __int16 v64 = 2114;
              uint64_t v65 = v43;
              _os_log_impl(&dword_181795000, v41, OS_LOG_TYPE_DEFAULT, "Write (Subarbitration) options: %lx -- URL: %{private}@ -- purposeID: %{public}@ -- claimID: %{public}@", buf, 0x2Au);
            }
          }
          uint64_t v37 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
        }
        while (v37);
      }
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_247;
    v51[3] = &unk_1E51FAD68;
    v51[4] = v50;
    v51[5] = v49;
    v51[6] = v46;
    -[NSFileCoordinator _requestAccessClaim:withProcedure:](v50, "_requestAccessClaim:withProcedure:", v49, v51, v44);

    [v45 drain];
  }
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 claimID];
  [*(id *)(a1 + 32) _forgetAccessClaimForID:v5];
  if (!atomic_fetch_add((atomic_ullong *volatile)&_NSFCSubarbitrationCount, 1uLL)) {
    atomic_store(objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSFileCoordinationDisableLogSuppression"), _NSFCDisableLogSuppression);
  }
  uint64_t v10 = *(void *)(a1 + 64);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_3;
  v13[3] = &unk_1E51FC048;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = v11;
  uint64_t v16 = v5;
  long long v17 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v14, a3, v13, v6, v7, v8, v9);
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (atomic_fetch_add((atomic_ullong *volatile)&_NSFCSubarbitrationCount, 0xFFFFFFFFFFFFFFFFLL) == 1
    && (uint64_t)atomic_exchange((atomic_ullong *volatile)&_NSFCSubarbitratedClaimCount, 0) >= 101)
  {
    if (qword_1EB1EDDD0 != -1) {
      dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
    }
    uint64_t v2 = qword_1EB1EDD38;
    if (os_log_type_enabled((os_log_t)qword_1EB1EDD38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Resuming normal logging", v5, 2u);
    }
  }
  uint64_t v3 = objc_alloc_init(NSAutoreleasePool);
  [*(id *)(a1 + 32) stopArbitrating];
  [*(id *)(*(void *)(a1 + 40) + 8) revokeSubarbitrationClaimForID:*(void *)(a1 + 48)];

  dispatch_release(*(dispatch_object_t *)(a1 + 64));
  return [(NSAutoreleasePool *)v3 drain];
}

uint64_t __109__NSFileCoordinator_NSPrivate____prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor___block_invoke_247(void *a1)
{
  return [*(id *)(a1[4] + 8) grantSubarbitrationClaim:a1[5] withServer:a1[6]];
}

+ (void)__itemAtURL:(id)a3 didMoveToURL:(id)a4 purposeID:(id)a5
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v9 = (void *)MEMORY[0x185308110]();
    -[NSFileAccessArbiterProxy writerWithPurposeID:didMoveItemAtURL:toURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didMoveItemAtURL:toURL:", a5, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]), +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", objc_msgSend(a1, "_canonicalURLForURL:", a4)));
  }
}

+ (void)__itemAtURL:(id)a3 didDisconnectWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didDisconnectItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didDisconnectItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]));
    [(NSAutoreleasePool *)v7 drain];
  }
}

+ (void)__itemAtURL:(id)a3 didReconnectWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didReconnectItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didReconnectItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]));
    [(NSAutoreleasePool *)v7 drain];
  }
}

+ (void)__itemAtURL:(id)a3 didChangeUbiquityWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didChangeUbiquityOfItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didChangeUbiquityOfItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]));
    [(NSAutoreleasePool *)v7 drain];
  }
}

+ (void)__itemAtURL:(id)a3 didDisappearWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didMakeItemDisappearAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didMakeItemDisappearAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]));
    [(NSAutoreleasePool *)v7 drain];
  }
}

+ (void)__itemAtURL:(id)a3 didChangeWithPurposeID:(id)a4
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v7 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didChangeItemAtURL:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didChangeItemAtURL:", a4, +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]));
    [(NSAutoreleasePool *)v7 drain];
  }
}

+ (void)__itemAtURL:(id)a3 didGainVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v11 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a6, @"added", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]), a4, a5);
    [(NSAutoreleasePool *)v11 drain];
  }
}

+ (void)__itemAtURL:(id)a3 didLoseVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v11 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a6, @"removed", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]), a4, a5);
    [(NSAutoreleasePool *)v11 drain];
  }
}

+ (void)__itemAtURL:(id)a3 didResolveConflictVersionWithClientID:(id)a4 name:(id)a5 purposeID:(id)a6
{
  if (!+[NSFileCoordinator _skipCoordinationWork])
  {
    uint64_t v11 = objc_alloc_init(NSAutoreleasePool);
    -[NSFileAccessArbiterProxy writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:](NSFileCoordinatorSharedAccessArbiter(), "writerWithPurposeID:didVersionChangeOfKind:toItemAtURL:withClientID:name:", a6, @"resolved", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", [a1 _canonicalURLForURL:a3]), a4, a5);
    [(NSAutoreleasePool *)v11 drain];
  }
}

+ (void)_addFileProvider:(id)a3
{
}

+ (void)_addFileProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = NSFileCoordinatorSharedAccessArbiter();

  [(NSFileAccessArbiterProxy *)v6 addFileProvider:a3 completionHandler:a4];
}

+ (void)_removeFileProvider:(id)a3
{
  uint64_t v4 = NSFileCoordinatorSharedAccessArbiter();

  [(NSFileAccessArbiterProxy *)v4 removeFileProvider:a3];
}

+ (id)_fileProviders
{
  uint64_t v2 = NSFileCoordinatorSharedAccessArbiter();

  return [(NSFileAccessArbiterProxy *)v2 fileProviders];
}

+ (void)_setAutomaticFileProviderReregistrationDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = NSFileCoordinatorSharedAccessArbiter();

  [(NSFileAccessArbiterProxy *)v4 setAutomaticFileProviderReregistrationDisabled:v3];
}

- (void)_setFileProvider:(id)a3
{
  id fileReactor = self->_fileReactor;
  if (fileReactor != a3)
  {

    id v6 = a3;
    self->_id fileReactor = v6;
    uint64_t v7 = [self->_accessArbiter idForFileReactor:v6];
    if (v7)
    {
      [(NSFileCoordinator *)self setPurposeIdentifier:v7];
    }
  }
}

+ (BOOL)_itemHasPresentersAtURL:(id)a3
{
  uint64_t v4 = NSFileCoordinatorSharedAccessArbiter();

  return [(NSFileAccessArbiterProxy *)v4 itemHasPresentersAtURL:a3];
}

- (BOOL)_purposeIdentifierLockedDown
{
  return objc_getAssociatedObject(self, sel__purposeIdentifierLockedDown) == (id)1;
}

- (void)_setPurposeIdentifier:(id)a3
{
  id purposeID = self->_purposeID;
  if (purposeID != a3)
  {

    self->_id purposeID = (id)[a3 copy];
    [(NSFileCoordinator *)self _lockdownPurposeIdentifier];
  }
}

- (id)retainAccess
{
  uint64_t v2 = *(void **)(NSFileCoordinatorGetTSD() + 8);
  uint64_t TSD = NSFileCoordinatorGetTSD();
  uint64_t v4 = *(void *)(TSD + 16);
  if (v2)
  {
    if (v4) {
      __assert_rtn("-[NSFileCoordinator(NSPrivate) retainAccess]", "NSFileCoordinator.m", 1893, "NSFileCoordinatorGetTSD()->reacquisitionBlockCompletion == NULL");
    }
    goto LABEL_5;
  }
  uint64_t v2 = *(void **)(TSD + 16);
  if (v4) {
LABEL_5:
  }
    [v2 increment];
  return v2;
}

- (void)releaseAccess:(id)a3
{
}

+ (id)_currentFileCoordinator
{
  return *(id *)NSFileCoordinatorGetTSD();
}

+ (id)_currentClaimPurposeIdentifier
{
  return *(id *)(NSFileCoordinatorGetTSD() + 40);
}

+ (void)_getDebugInfoWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)qword_1EB1EDD78;
  if (qword_1EB1EDD78)
  {
    id v5 = +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation];
    uint64_t v6 = getpid();
    [v4 getDebugInformationIncludingEverything:1 withString:v5 fromPid:v6 thenContinue:a3];
  }
  else
  {
    uint64_t v7 = NSFileCoordinatorSharedAccessArbiter();
    [(NSFileAccessArbiterProxy *)v7 getDebugInfoWithCompletionHandler:a3];
  }
}

+ (void)_startInProcessFileCoordinationAndProgressServers
{
  if (!+[NSThread isMainThread]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"NSFileCoordinator.m", 2010, @"%@ must be invoked on main thread.", NSStringFromSelector(a2) object file lineNumber description];
  }
  _NSFCIP = 1;
  qos_class_t v4 = qos_class_main();
  id v5 = dispatch_queue_attr_make_with_qos_class(0, v4, 0);
  uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v7 = dispatch_queue_create("com.apple.FileCoordination.inProcessServerQueue", v6);
  if (!qword_1EB1EDD78)
  {
    qword_1EB1EDDA0 = +[NSXPCListener anonymousListener];
    uint64_t v8 = [NSFileAccessArbiter alloc];
    qword_1EB1EDD78 = [(NSFileAccessArbiter *)v8 initWithQueue:v7 isSubarbiter:0 listener:qword_1EB1EDDA0];
    [(id)qword_1EB1EDDA0 setDelegate:qword_1EB1EDD78];
    [(id)qword_1EB1EDDA0 resume];
  }
  if (!qword_1EB1EDDA8)
  {
    qword_1EB1EDDB0 = +[NSXPCListener anonymousListener];
    uint64_t v9 = [NSProgressRegistrar alloc];
    qword_1EB1EDDA8 = -[NSProgressRegistrar initWithQueue:rootFileAccessNode:](v9, "initWithQueue:rootFileAccessNode:", v7, [(id)qword_1EB1EDD78 rootNode]);
    [(id)qword_1EB1EDDB0 setDelegate:qword_1EB1EDDA8];
    [(id)qword_1EB1EDDB0 resume];
  }
  dispatch_release(v7);

  NSFileCoordinatorSharedAccessArbiter();
}

+ (id)_inProcessFileAccessArbiter
{
  return (id)qword_1EB1EDD78;
}

+ (void)_stopInProcessFileCoordinationAndProgressServers
{
  if (!+[NSThread isMainThread]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"NSFileCoordinator.m", 2047, @"%@ must be invoked on main thread.", NSStringFromSelector(a2) object file lineNumber description];
  }
  _NSFCIP = 0;

  qword_1EB1EDDB8 = 0;
  [(id)qword_1EB1EDD78 stopArbitrating];

  qword_1EB1EDD78 = 0;
  [(id)qword_1EB1EDDA0 invalidate];

  qword_1EB1EDDA0 = 0;
  qword_1EB1EDDA8 = 0;
  [(id)qword_1EB1EDDB0 invalidate];

  qword_1EB1EDDB0 = 0;
}

+ (id)_createConnectionToProgressRegistrar
{
  uint64_t v2 = qword_1EB1EDDB0;
  BOOL v3 = [NSXPCConnection alloc];
  qos_class_t v4 = v3;
  if (v2)
  {
    uint64_t v6 = [(id)qword_1EB1EDDB0 endpoint];
    return [(NSXPCConnection *)v4 initWithListenerEndpoint:v6];
  }
  else
  {
    return [(NSXPCConnection *)v3 initWithMachServiceName:@"com.apple.ProgressReporting" options:0];
  }
}

+ (void)_adoptFCDEndpointForTest:(id)a3
{
  qos_class_t v5 = qos_class_main();
  uint64_t v6 = dispatch_queue_attr_make_with_qos_class(0, v5, 0);
  uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v8 = dispatch_queue_create("com.apple.FileCoordination.test-connectionToInProcessServerQueue", v7);
  uint64_t v9 = [[NSXPCConnection alloc] initWithListenerEndpoint:a3];
  -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", [a1 _fileAccessArbiterInterface]);
  [(NSXPCConnection *)v9 _setQueue:v8];
  qword_1EB1EDDB8 = [[NSFileAccessArbiterProxy alloc] initWithServer:v9 queue:v8];
  [(NSXPCConnection *)v9 resume];

  dispatch_release(v8);
}

+ (id)_endpointForInProcessFileCoordinationServer
{
  if (!+[NSThread isMainThread]) {
    __assert_rtn("+[NSFileCoordinator(NSInternal) _endpointForInProcessFileCoordinationServer]", "NSFileCoordinator.m", 2108, "[NSThread isMainThread]");
  }
  uint64_t v2 = (void *)qword_1EB1EDDA0;
  if (!qword_1EB1EDDA0) {
    __assert_rtn("+[NSFileCoordinator(NSInternal) _endpointForInProcessFileCoordinationServer]", "NSFileCoordinator.m", 2109, "inProcessFileAccessArbiterListener");
  }

  return (id)[v2 endpoint];
}

+ (void)_performBarrier
{
  uint64_t v2 = NSFileCoordinatorSharedAccessArbiter();

  [(NSFileAccessArbiterProxy *)v2 performBarrier];
}

+ (void)_performBarrierAsync:(id)a3
{
  qos_class_t v4 = NSFileCoordinatorSharedAccessArbiter();

  [(NSFileAccessArbiterProxy *)v4 performBarrierAsync:a3];
}

+ (void)_accessPresenterInfoUsingBlock:(id)a3
{
  if (qword_1EB1EDDC8 != -1) {
    dispatch_once(&qword_1EB1EDDC8, &__block_literal_global_470);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB1EDD28);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, qword_1EB1EDDC0);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1EDD28);
}

uint64_t __85__NSFileCoordinator_NSFileProviderInternalAdditions___accessPresenterInfoUsingBlock___block_invoke()
{
  uint64_t result = objc_opt_new();
  qword_1EB1EDDC0 = result;
  return result;
}

+ (void)_addProcessIdentifier:(int)a3 observedUbiquityAttributes:(id)a4 forID:(id)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __109__NSFileCoordinator_NSFileProviderInternalAdditions___addProcessIdentifier_observedUbiquityAttributes_forID___block_invoke;
    v5[3] = &unk_1E51FC098;
    int v6 = a3;
    void v5[4] = a5;
    v5[5] = a4;
    [a1 _accessPresenterInfoUsingBlock:v5];
  }
}

uint64_t __109__NSFileCoordinator_NSFileProviderInternalAdditions___addProcessIdentifier_observedUbiquityAttributes_forID___block_invoke(uint64_t a1, void *a2)
{
  qos_class_t v4 = (void *)[a2 objectForKey:*(void *)(a1 + 32)];
  if (!v4)
  {
    qos_class_t v4 = objc_opt_new();
    [a2 setObject:v4 forKey:*(void *)(a1 + 32)];
  }
  uint64_t result = objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)), @"pid");
  if (*(void *)(a1 + 40))
  {
    return objc_msgSend(v4, "setObject:forKey:");
  }
  return result;
}

+ (void)_removeInfoForID:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__NSFileCoordinator_NSFileProviderInternalAdditions___removeInfoForID___block_invoke;
  v3[3] = &unk_1E51FC0C0;
  v3[4] = a3;
  [a1 _accessPresenterInfoUsingBlock:v3];
}

uint64_t __71__NSFileCoordinator_NSFileProviderInternalAdditions___removeInfoForID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

+ (void)_setReadingOptions:(unint64_t)a3
{
  *(void *)(NSFileCoordinatorGetTSD() + 24) = a3 & 0x7FFFFFFF;
}

+ (void)_setKernelMaterializationInfo:(id)a3
{
  if (*(id *)(NSFileCoordinatorGetTSD() + 48) != a3)
  {

    id v4 = a3;
    *(void *)(NSFileCoordinatorGetTSD() + 48) = v4;
  }
}

+ (void)_setCurrentClaimPurposeIdentifier:(id)a3
{
  uint64_t TSD = NSFileCoordinatorGetTSD();
  id v5 = *(id *)(TSD + 40);
  if (v5 != a3)
  {
    uint64_t v6 = TSD;

    *(void *)(v6 + 40) = [a3 copy];
  }
}

+ (unint64_t)_providedItemGenerationCount
{
  return *(void *)(NSFileCoordinatorGetTSD() + 56);
}

+ (int)_processIdentifierForID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NSFileCoordinator_NSFileProviderPrivateAdditions___processIdentifierForID___block_invoke;
  v5[3] = &unk_1E51FA868;
  void v5[4] = a3;
  v5[5] = &v6;
  [a1 _accessPresenterInfoUsingBlock:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__77__NSFileCoordinator_NSFileProviderPrivateAdditions___processIdentifierForID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(void *)(a1 + 32)), "objectForKey:", @"pid");
  if (result)
  {
    uint64_t result = (void *)[result intValue];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

+ (id)_observedUbiquityAttributesForPresenterWithID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__24;
  uint64_t v10 = __Block_byref_object_dispose__24;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__NSFileCoordinator_NSFileProviderPrivateAdditions___observedUbiquityAttributesForPresenterWithID___block_invoke;
  v5[3] = &unk_1E51FA8D8;
  void v5[4] = a3;
  v5[5] = &v6;
  [a1 _accessPresenterInfoUsingBlock:v5];
  int v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __99__NSFileCoordinator_NSFileProviderPrivateAdditions___observedUbiquityAttributesForPresenterWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(void *)(a1 + 32)), "objectForKey:", @"ubiquityAttributes");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (BOOL)_provideRecursively
{
  return (*(unsigned __int8 *)(NSFileCoordinatorGetTSD() + 26) >> 1) & 1;
}

+ (unint64_t)_readingOptions
{
  return *(void *)(NSFileCoordinatorGetTSD() + 24);
}

+ (unsigned)_kernelMaterializationOperation
{
  if (!*(void *)(NSFileCoordinatorGetTSD() + 48)) {
    return 0;
  }
  uint64_t v2 = *(void **)(NSFileCoordinatorGetTSD() + 48);

  return [v2 operation];
}

+ (void)_setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  *(void *)(NSFileCoordinatorGetTSD() + 56) = a3;
}

+ (id)_kernelMaterializationInfo
{
  return *(id *)(NSFileCoordinatorGetTSD() + 48);
}

@end