@interface NSFileAccessClaim
+ (BOOL)canNewWriteOfItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapExistingWriteOfItemAtLocation:(id)a5 options:(unint64_t)a6;
+ (BOOL)canReadingItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapNewWriting:(BOOL)a5 ofItemAtLocation:(id)a6 options:(unint64_t)a7;
+ (BOOL)supportsSecureCoding;
- (BOOL)_writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)cameFromSuperarbiter;
- (BOOL)canAccessLocations:(id)a3 forReading:(BOOL)a4 error:(id *)a5;
- (BOOL)checkIfSymbolicLinkAtURL:(id)a3 withResolutionCount:(int64_t *)a4 andIfSoThenReevaluateSelf:(id)a5;
- (BOOL)claimerInvokingIsBlockedByReactorWithID:(id)a3;
- (BOOL)didWait;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByClaimWithPurposeID:(id)a3;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isGranted;
- (BOOL)isRevoked;
- (BOOL)shouldBeRevokedPriorToInvokingAccessor;
- (BOOL)shouldCancelInsteadOfWaiting;
- (BOOL)shouldEnableMaterializationDuringAccessorBlock;
- (BOOL)shouldInformProvidersAboutEndOfWriteWithOptions:(unint64_t)a3;
- (BOOL)shouldMakeProviderProvideItemAtLocation:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)shouldReadingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4;
- (BOOL)shouldWritingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4;
- (NSArray)allURLs;
- (NSFileAccessClaim)initWithClient:(id)a3 claimID:(id)a4 purposeID:(id)a5;
- (NSFileAccessClaim)initWithCoder:(id)a3;
- (OS_dispatch_semaphore)claimerWaiter;
- (id)claimID;
- (id)claimerError;
- (id)client;
- (id)description;
- (id)descriptionWithIndenting:(id)a3;
- (id)pendingClaims;
- (id)purposeID;
- (id)purposeIDOfClaimOnItemAtLocation:(id)a3 forMessagingPresenter:(id)a4;
- (int)clientProcessIdentifier;
- (uint64_t)_recursive_claimerInvokingIsBlockedByReactorWithID:(void *)a3 checkedClaims:;
- (void)_checkIfMovingRequiresProvidingAmongWritingLocations:(id)a3 options:(unint64_t *)a4 thenContinue:(id)a5;
- (void)_protectIfNecessaryFileAtURL:(id)a3 withOptions:(unint64_t)a4 forReading:(BOOL)a5;
- (void)_setupWithClaimID:(id)a3 purposeID:(id)a4 originatingReactorQueueID:(id)a5;
- (void)acceptClaimFromClient:(id)a3 arbiterQueue:(id)a4 grantHandler:(id)a5;
- (void)addBlockingReactorID:(id)a3;
- (void)addPendingClaim:(id)a3;
- (void)block;
- (void)blockClaimerForReason:(id)a3;
- (void)cancelled;
- (void)dealloc;
- (void)devalueSelf;
- (void)disavowed;
- (void)encodeWithCoder:(id)a3;
- (void)ensureProvidersOfItemsAtReadingLocations:(id)a3 writingLocations:(id)a4 thenContinue:(id)a5;
- (void)evaluateNewClaim:(id)a3;
- (void)finished;
- (void)givePriorityToClaim:(id)a3;
- (void)invokeClaimer;
- (void)makePresentersOfItemAtLocation:(id)a3 orContainedItem:(BOOL)a4 relinquishUsingProcedureGetter:(id)a5;
- (void)makeProviderOfItemAtLocation:(id)a3 provideIfNecessaryWithOptions:(unint64_t)a4 thenContinue:(id)a5;
- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 readingOptions:(unint64_t)a5 thenContinue:(id)a6;
- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 writingOptions:(unint64_t)a5 thenContinue:(id)a6;
- (void)makeProviderOfItemAtLocation:(id)a3 providePhysicalURLThenContinue:(id)a4;
- (void)makeProvidersProvideItemsForReadingLocations:(id)a3 options:(unint64_t *)a4 andWritingLocationsIfNecessary:(id)a5 options:(unint64_t *)a6 thenContinue:(id)a7;
- (void)prepareClaimForGrantingWithArbiterQueue:(id)a3;
- (void)prepareItemForUploadingFromURL:(id)a3 thenContinue:(id)a4;
- (void)removeBlockingReactorID:(id)a3;
- (void)removePendingClaims:(id)a3;
- (void)revoked;
- (void)scheduleBlockedClaim:(id)a3;
- (void)setCameFromSuperarbiter;
- (void)setClaimerError:(id)a3;
- (void)setShouldEnableMaterializationDuringAccessorBlock:(BOOL)a3;
- (void)startObservingClientState;
- (void)unblock;
- (void)unblockClaimerForReason:(id)a3;
- (void)whenDevaluedPerformProcedure:(id)a3;
- (void)whenFinishedPerformProcedure:(id)a3;
- (void)whenRevokedPerformProcedure:(id)a3;
@end

@implementation NSFileAccessClaim

- (void)block
{
  unint64_t blockageCount = self->_blockageCount;
  if (!blockageCount)
  {
    NSLog((NSString *)@"NSFileCoordinator: an access claim that was unblocked has somehow become blocked again.", a2);
    unint64_t blockageCount = self->_blockageCount;
  }
  self->_unint64_t blockageCount = blockageCount + 1;
}

- (void)revoked
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (unsigned __int8 v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
    || (uint64_t v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 199))
  {
    v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = claimID;
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ was revoked", (uint8_t *)&buf, 0xCu);
    }
  }
  self->_isRevoked = 1;
  [(NSFileAccessClaim *)self cancelled];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  revocationProcedures = self->_revocationProcedures;
  uint64_t v7 = [(NSMutableArray *)revocationProcedures countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(revocationProcedures);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * i) + 16))();
      }
      uint64_t v7 = [(NSMutableArray *)revocationProcedures countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v7);
  }

  self->_revocationProcedures = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000;
  int v17 = 1;
  reacquisitionProceduresByPresenterID = self->_reacquisitionProceduresByPresenterID;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __28__NSFileAccessClaim_revoked__block_invoke;
  v14[3] = &unk_1E51FC838;
  v14[4] = self;
  v14[5] = &buf;
  [(NSMutableDictionary *)reacquisitionProceduresByPresenterID enumerateKeysAndObjectsUsingBlock:v14];

  self->_reacquisitionProceduresByPresenterID = 0;
  int v11 = *(_DWORD *)(*((void *)&buf + 1) + 24) - 1;
  *(_DWORD *)(*((void *)&buf + 1) + 24) = v11;
  if (!v11) {
    [(NSFileAccessClaim *)self devalueSelf];
  }
  _Block_object_dispose(&buf, 8);
}

- (void)cancelled
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  providerCancellationProcedures = self->_providerCancellationProcedures;
  if (providerCancellationProcedures)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(NSMutableArray *)providerCancellationProcedures countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(providerCancellationProcedures);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)providerCancellationProcedures countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v5);
    }
  }

  self->_providerCancellationProcedures = 0;
  if ([(NSMutableArray *)self->_claimerBlockageReasons count])
  {
    uint64_t v8 = _NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      int v10 = 138543362;
      int v11 = claimID;
      _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ was cancelled before claimer was invoked", (uint8_t *)&v10, 0xCu);
    }
    if (!self->_claimerError) {
      self->_claimerError = [[NSError alloc] initWithDomain:@"NSCocoaErrorDomain" code:3072 userInfo:0];
    }
    [(NSFileAccessClaim *)self invokeClaimer];
  }
}

- (void)unblock
{
  unint64_t blockageCount = self->_blockageCount;
  if (!blockageCount)
  {
    NSLog((NSString *)@"NSFileCoordinator: an access claim that was unblocked is somehow becoming even more unblocked.", a2);
    unint64_t blockageCount = self->_blockageCount;
  }
  unint64_t v4 = blockageCount - 1;
  self->_unint64_t blockageCount = v4;
  if (!v4 && !self->_isRevoked)
  {
    processManager = self->_processManager;
    if (processManager) {
      [(NSFileAccessProcessManager *)processManager preventSuspensionWithActivityName:+[NSString stringWithFormat:@"File Coordination Claim %@", [(NSFileAccessClaim *)self claimID]]];
    }
    [(NSFileAccessClaim *)self granted];
  }
}

- (id)claimID
{
  v2 = self->_claimID;

  return v2;
}

- (void)unblockClaimerForReason:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_claimerBlockageReasons indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_claimerBlockageReasons removeObjectAtIndex:v4];
  }
  if (![(NSMutableArray *)self->_claimerBlockageReasons count])
  {
    [(NSFileAccessClaim *)self invokeClaimer];
  }
}

- (void)startObservingClientState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  client = self->_client;
  if (client && self->_arbiterQueue && !self->_cameFromSuperarbiter)
  {
    pid_t v4 = [(NSXPCConnection *)client processIdentifier];
    uint64_t v5 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      claimID = self->_claimID;
      *(_DWORD *)long long buf = 67109378;
      pid_t v10 = v4;
      __int16 v11 = 2114;
      unsigned __int8 v12 = claimID;
      _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_INFO, "Starting to observe state of client with pid %d on behalf of claim %{public}@", buf, 0x12u);
    }
    self->_processManager = [[NSFileAccessProcessManager alloc] initWithClient:[(NSXPCConnection *)self->_client _xpcConnection] queue:self->_arbiterQueue];
    [(NSFileAccessProcessManager *)self->_processManager setURLs:[(NSFileAccessClaim *)self allURLs]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__NSFileAccessClaim_startObservingClientState__block_invoke;
    v7[3] = &unk_1E51FC4A0;
    v7[4] = self;
    pid_t v8 = v4;
    [(NSFileAccessProcessManager *)self->_processManager setSuspensionHandler:v7];
  }
}

- (void)setShouldEnableMaterializationDuringAccessorBlock:(BOOL)a3
{
  self->_shouldEnableMaterializationDuringAccessorBlock = a3;
}

- (void)devalueSelf
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(NSFileAccessProcessManager *)self->_processManager invalidate];

  self->_processManager = 0;
  uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (unsigned __int8 v17 = atomic_load(_NSFCDisableLogSuppression), (v17 & 1) != 0)
    || (uint64_t v18 = atomic_load(&_NSFCSubarbitratedClaimCount), v18 <= 199))
  {
    pid_t v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      claimID = self->_claimID;
      *(_DWORD *)long long buf = 138543362;
      v30 = claimID;
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_INFO, "Claim %{public}@ was devalued", buf, 0xCu);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  pendingClaims = self->_pendingClaims;
  uint64_t v7 = [(NSMutableOrderedSet *)pendingClaims countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(pendingClaims);
        }
        __int16 v11 = *(id **)(*((void *)&v25 + 1) + 8 * i);
        [v11[10] removeObject:self];
        [v11 unblock];
      }
      uint64_t v8 = [(NSMutableOrderedSet *)pendingClaims countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v8);
  }

  self->_pendingClaims = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  devaluationProcedures = self->_devaluationProcedures;
  uint64_t v13 = [(NSMutableArray *)devaluationProcedures countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(devaluationProcedures);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * j) + 16))();
      }
      uint64_t v14 = [(NSMutableArray *)devaluationProcedures countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v14);
  }

  self->_devaluationProcedures = 0;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];

  claimerWaiter = self->_claimerWaiter;
  if (claimerWaiter) {
    dispatch_release(claimerWaiter);
  }

  id serverClaimerOrNil = self->_serverClaimerOrNil;
  if (serverClaimerOrNil) {

  }
  [(NSFileAccessProcessManager *)self->_processManager invalidate];
  arbiterQueue = self->_arbiterQueue;
  if (arbiterQueue) {
    dispatch_release(arbiterQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)NSFileAccessClaim;
  [(NSFileAccessClaim *)&v6 dealloc];
}

- (void)acceptClaimFromClient:(id)a3 arbiterQueue:(id)a4 grantHandler:(id)a5
{
  if (self->_client) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFileAccessClaim.m" lineNumber:309 description:@"This claim has already been accepted"];
  }
  self->_client = (NSXPCConnection *)a3;
  self->_arbiterQueue = (OS_dispatch_queue *)a4;
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  self->_id serverClaimerOrNil = (id)[a5 copy];
}

- (void)prepareClaimForGrantingWithArbiterQueue:(id)a3
{
  if (self->_arbiterQueue) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSFileAccessClaim.m" lineNumber:295 description:@"This claim has already been prepared for granting"];
  }
  self->_arbiterQueue = (OS_dispatch_queue *)a3;
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  self->_originatingReactorQueueID = (id)[(NSMutableDictionary *)[+[NSThread currentThread] threadDictionary] objectForKeyedSubscript:@"_NSCurrentReactorID"];
}

- (OS_dispatch_semaphore)claimerWaiter
{
  return self->_claimerWaiter;
}

- (void)finished
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  finishingProcedures = self->_finishingProcedures;
  uint64_t v4 = [(NSMutableArray *)finishingProcedures countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(finishingProcedures);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))();
      }
      uint64_t v5 = [(NSMutableArray *)finishingProcedures countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }

  self->_finishingProcedures = 0;
  [(NSMutableDictionary *)self->_fileHandlesForEvictionProtection enumerateKeysAndObjectsUsingBlock:&__block_literal_global_186];

  self->_fileHandlesForEvictionProtection = 0;
}

void __29__NSFileAccessClaim_finished__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  if (([a3 closeAndReturnError:&v6] & 1) == 0)
  {
    uint64_t v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [a2 path];
      *(_DWORD *)long long buf = 138478083;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Failed to close file at %{private}@ because of error: %@", buf, 0x16u);
    }
  }
}

- (void)evaluateNewClaim:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 != self)
  {
    uint64_t v5 = [a3 purposeID];
    if (v5 && [(NSString *)self->_purposeIDOrNil isEqual:v5] && !self->_isRevoked)
    {
      uint64_t v6 = _NSFCClaimsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [a3 claimID];
        claimID = self->_claimID;
        purposeIDOrNil = self->_purposeIDOrNil;
        int v10 = 138543874;
        uint64_t v11 = v7;
        __int16 v12 = 2114;
        uint64_t v13 = claimID;
        __int16 v14 = 2114;
        uint64_t v15 = purposeIDOrNil;
        _os_log_impl(&dword_181795000, v6, OS_LOG_TYPE_INFO, "Claim %{public}@ is not blocked by %{public}@ because it has the same purposeID: %{public}@", (uint8_t *)&v10, 0x20u);
      }
    }
    else if ([(NSFileAccessClaim *)self blocksClaim:a3])
    {
      [(NSFileAccessClaim *)self scheduleBlockedClaim:a3];
    }
  }
}

- (BOOL)shouldInformProvidersAboutEndOfWriteWithOptions:(unint64_t)a3
{
  int v3 = a3;
  BOOL v4 = ![(NSFileAccessClaim *)self cameFromSuperarbiter];
  return (*(void *)&v3 & 0x30000) == 0 && v4;
}

- (BOOL)cameFromSuperarbiter
{
  return self->_cameFromSuperarbiter;
}

- (void)makePresentersOfItemAtLocation:(id)a3 orContainedItem:(BOOL)a4 relinquishUsingProcedureGetter:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!self->_cameFromSuperarbiter)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke;
    v24[3] = &unk_1E51FC748;
    v24[4] = self;
    v24[5] = a3;
    v24[6] = a5;
    v24[7] = v25;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_5;
    v23[3] = &unk_1E51FC770;
    v23[4] = a3;
    v23[5] = v24;
    [a3 forEachPresenterOfContainingFilePackagePerformProcedure:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_6;
    v22[3] = &unk_1E51FC798;
    v22[4] = v24;
    [a3 forEachPresenterOfItemPerformProcedure:v22];
    if (a4 || [a3 itemIsFilePackage])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_7;
      v21[3] = &unk_1E51FC798;
      v21[4] = v24;
      [a3 forEachPresenterOfContainedItemPerformProcedure:v21];
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", -[NSFileAccessClaim pendingClaims](self, "pendingClaims"));
    if ([v8 count])
    {
      __int16 v9 = _NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        claimID = self->_claimID;
        *(_DWORD *)long long buf = 138543362;
        uint64_t v28 = (uint64_t)claimID;
        _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_INFO, "Re-evaluating claims pending %{public}@", buf, 0xCu);
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v11 = [v8 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v11)
    {
      uint64_t v13 = *(void *)v35;
      *(void *)&long long v12 = 138543874;
      long long v20 = v12;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
          uint64_t v16 = v15[24];
          if (v16
            && [(NSFileAccessClaim *)self claimerInvokingIsBlockedByReactorWithID:v15[24]])
          {
            unsigned __int8 v17 = _NSFCClaimsLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = [v15 claimID];
              long long v19 = self->_claimID;
              *(_DWORD *)long long buf = v20;
              uint64_t v28 = v18;
              __int16 v29 = 2114;
              v30 = v19;
              __int16 v31 = 2114;
              uint64_t v32 = v16;
              _os_log_impl(&dword_181795000, v17, OS_LOG_TYPE_DEFAULT, "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by a reactor with the former's purposeID: %{public}@", buf, 0x20u);
            }
            -[NSFileAccessClaim givePriorityToClaim:](self, "givePriorityToClaim:", v15, v20);
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v11);
    }
    _Block_object_dispose(v25, 8);
  }
}

- (id)pendingClaims
{
  pendingClaims = self->_pendingClaims;
  if (!pendingClaims) {
    pendingClaims = (NSMutableOrderedSet *)MEMORY[0x1E4F1C978];
  }
  return (id)[(NSMutableOrderedSet *)pendingClaims array];
}

- (BOOL)canAccessLocations:(id)a3 forReading:(BOOL)a4 error:(id *)a5
{
  BOOL v18 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __57__NSFileAccessClaim_canAccessLocations_forReading_error___block_invoke;
        v19[3] = &unk_1E51FC7C0;
        v19[4] = self;
        v19[5] = &v20;
        [v11 forEachPresenterOfItemPerformProcedure:v19];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v8);
  }
  if (!*((unsigned char *)v21 + 24))
  {
    long long v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      claimID = self->_claimID;
      purposeIDOrNil = self->_purposeIDOrNil;
      *(_DWORD *)long long buf = 138543618;
      long long v25 = claimID;
      __int16 v26 = 2114;
      long long v27 = purposeIDOrNil;
      _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "Denying access for claim %{public}@ because the presenter (reactor ID: %{public}@) performing it has been disconnected", buf, 0x16u);
      if (!a5) {
        goto LABEL_15;
      }
    }
    else if (!a5)
    {
      goto LABEL_15;
    }
    if (v18) {
      uint64_t v13 = 257;
    }
    else {
      uint64_t v13 = 513;
    }
    *a5 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:v13 userInfo:0];
  }
LABEL_15:
  char v14 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeObject:self->_claimID forKey:@"NSClaimIDKey"];
  [a3 encodeObject:self->_purposeIDOrNil forKey:@"NSPurposeIDKey"];
  id originatingReactorQueueID = self->_originatingReactorQueueID;

  [a3 encodeObject:originatingReactorQueueID forKey:@"NSOriginatingReactorQueueID"];
}

- (void)makeProvidersProvideItemsForReadingLocations:(id)a3 options:(unint64_t *)a4 andWritingLocationsIfNecessary:(id)a5 options:(unint64_t *)a6 thenContinue:(id)a7
{
  v13[10] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_arbiterQueue);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke;
  v13[3] = &unk_1E51FC608;
  v13[4] = self;
  v13[5] = a5;
  v13[6] = a3;
  v13[7] = a7;
  v13[8] = a6;
  v13[9] = a4;
  [(NSFileAccessClaim *)self ensureProvidersOfItemsAtReadingLocations:a3 writingLocations:a5 thenContinue:v13];
}

- (void)ensureProvidersOfItemsAtReadingLocations:(id)a3 writingLocations:(id)a4 thenContinue:(id)a5
{
  if ([a3 count] || objc_msgSend(a4, "count"))
  {
    id v10 = (id)objc_opt_new();
    if (a3) {
      [v10 addObjectsFromArray:a3];
    }
    if (a4) {
      [v10 addObjectsFromArray:a4];
    }
    +[NSFileAccessArbiter ensureProvidersIfNecessaryForClaim:self user:[(NSXPCConnection *)self->_client effectiveUserIdentifier] atLocations:v10 queue:self->_arbiterQueue thenContinue:a5];
  }
  else
  {
    uint64_t v9 = (void (*)(id))*((void *)a5 + 2);
    v9(a5);
  }
}

- (void)blockClaimerForReason:(id)a3
{
  if (![(NSMutableArray *)self->_claimerBlockageReasons count]) {
    NSLog((NSString *)@"NSFileCoordinator: -[NSFileAccessClaim blockClaimerForReason:] is being invoked with %@ when the claimer has already been invoked.", a3);
  }
  claimerBlockageReasons = self->_claimerBlockageReasons;

  [(NSMutableArray *)claimerBlockageReasons addObject:a3];
}

- (BOOL)shouldMakeProviderProvideItemAtLocation:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v6 = (void *)[a3 itemProvider];
  if (v6)
  {
    if (-[NSString isEqual:](self->_purposeIDOrNil, "isEqual:", [v6 reactorID])) {
      LOBYTE(v6) = 0;
    }
    else {
      LOBYTE(v6) = !self->_cameFromSuperarbiter && (v4 & 4) == 0;
    }
  }
  return (char)v6;
}

- (id)claimerError
{
  v2 = self->_claimerError;

  return v2;
}

- (BOOL)didWait
{
  return self->_didWait;
}

- (id)purposeID
{
  v2 = self->_purposeIDOrNil;

  return v2;
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 readingOptions:(unint64_t)a5 thenContinue:(id)a6
{
  char v7 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)[a3 itemProvider];
  if (v11
    && (char v12 = objc_msgSend((id)objc_msgSend(v11, "reactorID"), "isEqualToString:", a4), (v7 & 4) != 0)
    && (v12 & 1) == 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue___block_invoke;
    v14[3] = &unk_1E51FC658;
    char v15 = 1;
    v14[4] = a3;
    v14[5] = a6;
    [(NSFileAccessClaim *)self makeProviderOfItemAtLocation:a3 providePhysicalURLThenContinue:v14];
  }
  else
  {
    uint64_t v13 = (void (*)(id, void))*((void *)a6 + 2);
    v13(a6, 0);
  }
}

- (void)invokeClaimer
{
  if (!self->_hasInvokedClaimer)
  {
    claimerWaiter = self->_claimerWaiter;
    if (claimerWaiter) {
      dispatch_semaphore_signal(claimerWaiter);
    }
    self->_hasInvokedClaimer = 1;
  }
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 writingOptions:(unint64_t)a5 thenContinue:(id)a6
{
  char v7 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)[a3 itemProvider];
  if (v11
    && (char v12 = objc_msgSend((id)objc_msgSend(v11, "reactorID"), "isEqualToString:", a4), (v7 & 0x13) != 0)
    && (v12 & 1) == 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue___block_invoke;
    v14[3] = &unk_1E51FC658;
    BOOL v15 = (v7 & 0x11) == 0;
    v14[4] = a3;
    v14[5] = a6;
    [(NSFileAccessClaim *)self makeProviderOfItemAtLocation:a3 providePhysicalURLThenContinue:v14];
  }
  else
  {
    uint64_t v13 = (void (*)(id, void))*((void *)a6 + 2);
    v13(a6, 0);
  }
}

- (BOOL)shouldEnableMaterializationDuringAccessorBlock
{
  return self->_shouldEnableMaterializationDuringAccessorBlock;
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  return 0;
}

- (void)whenRevokedPerformProcedure:(id)a3
{
  if (!self->_revocationProcedures) {
    self->_revocationProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v5 = (id)[a3 copy];
  [(NSMutableArray *)self->_revocationProcedures addObject:v5];
}

- (void)_protectIfNecessaryFileAtURL:(id)a3 withOptions:(unint64_t)a4 forReading:(BOOL)a5
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v7 = (a4 >> 2) & 1;
  if (!a4) {
    LODWORD(v7) = 1;
  }
  if (a5) {
    BOOL v8 = (a4 & 0xC) == 0;
  }
  else {
    BOOL v8 = v7;
  }
  if (!-[NSMutableDictionary objectForKey:](self->_fileHandlesForEvictionProtection, "objectForKey:"))
  {
    v11[0] = 0;
    if ([a3 getResourceValue:v11 forKey:*MEMORY[0x1E4F1C858] error:0])
    {
      if ((v8 & [v11[0] BOOLValue] & 1) == 0) {
        return;
      }
    }
    else if (!v8)
    {
      return;
    }
    if (!self->_fileHandlesForEvictionProtection) {
      self->_fileHandlesForEvictionProtection = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if ([a3 fileSystemRepresentation])
    {
      uint64_t v9 = open((const char *)[a3 fileSystemRepresentation], 0x8000);
      if (v9 == -1)
      {
        [(NSMutableDictionary *)self->_fileHandlesForEvictionProtection setObject:+[NSFileHandle fileHandleWithNullDevice] forKey:a3];
      }
      else
      {
        id v10 = [[NSFileHandle alloc] initWithFileDescriptor:v9 closeOnDealloc:1];
        [(NSMutableDictionary *)self->_fileHandlesForEvictionProtection setObject:v10 forKey:a3];
      }
    }
  }
}

- (NSFileAccessClaim)initWithClient:(id)a3 claimID:(id)a4 purposeID:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSFileAccessClaim;
  BOOL v8 = [(NSFileAccessClaim *)&v10 init];
  if (v8)
  {
    v8->_client = (NSXPCConnection *)a3;
    v8->_claimerWaiter = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    [(NSFileAccessClaim *)v8 _setupWithClaimID:a4 purposeID:a5 originatingReactorQueueID:0];
  }
  return v8;
}

- (NSFileAccessClaim)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSClaimIDKey"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPurposeIDKey"];
  -[NSFileAccessClaim _setupWithClaimID:purposeID:originatingReactorQueueID:](self, "_setupWithClaimID:purposeID:originatingReactorQueueID:", v5, v6, [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSOriginatingReactorQueueID"]);
  return self;
}

- (void)_setupWithClaimID:(id)a3 purposeID:(id)a4 originatingReactorQueueID:(id)a5
{
  if (a3) {
    BOOL v8 = (NSString *)a3;
  }
  else {
    BOOL v8 = +[NSFileCoordinator _createIdentifierForNewClaim];
  }
  self->_claimID = v8;
  self->_purposeIDOrNil = (NSString *)a4;
  self->_unint64_t blockageCount = 1;
  self->_claimerBlockageReasons = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"Initial blockage", 0);
  self->_id originatingReactorQueueID = a5;
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isRevoked])
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v2();
  }
  else
  {
    char v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_2;
    v7[3] = &unk_1E51FC5E0;
    v7[4] = v4;
    int8x16_t v5 = *(int8x16_t *)(a1 + 40);
    int8x16_t v8 = vextq_s8(v5, v5, 8uLL);
    int8x16_t v6 = *(int8x16_t *)(a1 + 64);
    int8x16_t v10 = vextq_s8(v6, v6, 8uLL);
    uint64_t v9 = *(void *)(a1 + 56);
    return [v4 _checkIfMovingRequiresProvidingAmongWritingLocations:v5.i64[0] options:v6.i64[0] thenContinue:v7];
  }
}

void __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if ([a2 count]) {
    [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:1];
  }
  char v4 = objc_opt_new();
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 1;
  dispatch_group_t v5 = dispatch_group_create();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  long long v32 = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_3;
  uint64_t v33 = &unk_1E51FC590;
  long long v34 = v4;
  dispatch_group_t v35 = v5;
  uint64_t v36 = *(void *)(a1 + 32);
  long long v37 = v38;
  int8x16_t v6 = (void *)[a2 mutableCopy];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_5;
  v29[3] = &unk_1E51FC5B8;
  unint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v29[4] = *(void *)(a1 + 32);
  v29[5] = v8;
  long long v30 = *(_OWORD *)(a1 + 64);
  v29[6] = a2;
  v29[7] = v6;
  v29[8] = v31;
  v29[9] = &v40;
  v29[10] = &v44;
  [v7 enumerateObjectsUsingBlock:v29];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v59 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v60 != v10) {
          objc_enumerationMutation(v6);
        }
        v32((uint64_t)v31, *(void *)(*((void *)&v59 + 1) + 8 * i), 0x20000, v41 + 3);
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v59 objects:v58 count:16];
    }
    while (v9);
  }

  __int16 v26 = v5;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        uint64_t v16 = [v15 parent];
        uint64_t v17 = a1;
        if ([*(id *)(a1 + 32) shouldMakeProviderProvideItemAtLocation:v16 withOptions:0]&& (objc_msgSend(v4, "containsObject:", v16) & 1) == 0&& (objc_msgSend(v4, "containsObject:", v15) & 1) == 0)
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v18 = [v4 countByEnumeratingWithState:&v49 objects:v48 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v50;
LABEL_20:
            uint64_t v20 = 0;
            while (1)
            {
              if (*(void *)v50 != v19) {
                objc_enumerationMutation(v4);
              }
              if ([*(id *)(*((void *)&v49 + 1) + 8 * v20) itemIsInItemAtLocation:v16]) {
                break;
              }
              if (v18 == ++v20)
              {
                uint64_t v18 = [v4 countByEnumeratingWithState:&v49 objects:v48 count:16];
                if (v18) {
                  goto LABEL_20;
                }
                goto LABEL_26;
              }
            }
          }
          else
          {
LABEL_26:
            uint64_t v21 = [v15 parent];
            v32((uint64_t)v31, v21, 0x20000000, v41 + 3);
          }
        }
        a1 = v17;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
    }
    while (v12);
  }

  uint64_t v22 = v41[3];
  if (v45[3] | v22)
  {
    char v23 = +[NSString stringWithFormat:@"Providing for %ld readers and %ld writers", v45[3], v22];
    [*(id *)(a1 + 32) blockClaimerForReason:v23];
    uint64_t v24 = *(void *)(a1 + 32);
    long long v25 = *(NSObject **)(v24 + 184);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_6;
    block[3] = &unk_1E51FCCE0;
    block[6] = *(void *)(a1 + 56);
    block[7] = v38;
    block[4] = v24;
    block[5] = v23;
    dispatch_group_notify(v26, v25, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  dispatch_release(v26);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

- (void)whenDevaluedPerformProcedure:(id)a3
{
  if (!self->_devaluationProcedures) {
    self->_devaluationProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v5 = (id)[a3 copy];
  [(NSMutableArray *)self->_devaluationProcedures addObject:v5];
}

- (BOOL)isRevoked
{
  return self->_isRevoked;
}

- (void)_checkIfMovingRequiresProvidingAmongWritingLocations:(id)a3 options:(unint64_t *)a4 thenContinue:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[a3 count] < 2)
  {
    long long v37 = (void (*)(id, void))*((void *)a5 + 2);
    v37(a5, 0);
  }
  else
  {
    char v39 = (void (**)(id, void *))a5;
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = objc_opt_new();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke;
    v48[3] = &unk_1E51FC4F0;
    v48[4] = v10;
    v48[5] = v11;
    v48[6] = v9;
    v48[7] = a4;
    [a3 enumerateObjectsUsingBlock:v48];

    uint64_t v42 = (void *)[MEMORY[0x1E4F1CA80] set];
    obuint64_t j = (id)objc_opt_new();
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v59 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v61 != v13) {
            objc_enumerationMutation(v11);
          }
          BOOL v15 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v16 = (void *)[v15 objectAtIndexedSubscript:0];
          uint64_t v17 = (void *)[v15 objectAtIndexedSubscript:1];
          BOOL v18 = [(NSFileAccessClaim *)self shouldMakeProviderProvideItemAtLocation:v16 withOptions:0];
          if (v16 != v17 && v18)
          {
            uint64_t v20 = (void *)[v16 itemProvider];
            uint64_t v21 = (void *)[v17 itemProvider];
            if (v20 == v21
              || objc_msgSend((id)objc_msgSend(v20, "reactorID"), "isEqualToString:", objc_msgSend(v21, "reactorID")))
            {
              [obj addObject:v15];
            }
            else
            {
              [v42 addObject:v16];
            }
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v59 count:16];
      }
      while (v12);
    }

    if ([obj count])
    {
      uint64_t v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Checking with provider about %ld moving items", [obj count]);
      [(NSFileAccessClaim *)self blockClaimerForReason:v22];
      uint64_t v38 = v22;
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x2810000000;
      v46[3] = &unk_18246906D;
      int v47 = 0;
      char v23 = dispatch_group_create();
      id v43 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v24 = [obj countByEnumeratingWithState:&v55 objects:v54 count:16];
      if (v24)
      {
        uint64_t v40 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v56 != v40) {
              objc_enumerationMutation(obj);
            }
            __int16 v26 = *(void **)(*((void *)&v55 + 1) + 8 * j);
            long long v27 = (void *)[v26 objectAtIndexedSubscript:0];
            uint64_t v28 = (void *)[v26 objectAtIndexedSubscript:1];
            dispatch_group_enter(v23);
            long long v29 = (void *)[v27 itemProvider];
            objc_msgSend(v43, "addObject:", objc_msgSend(v29, "reactorID"));
            uint64_t v30 = [v27 standardizedURL];
            uint64_t v31 = objc_msgSend((id)objc_msgSend(v28, "parent"), "standardizedURL");
            uint64_t v32 = [v28 name];
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_2;
            v45[3] = &unk_1E51FC518;
            v45[7] = v23;
            v45[8] = v46;
            v45[4] = v42;
            v45[5] = v27;
            v45[6] = self;
            [v29 movingItemAtURL:v30 requiresProvidingWithDestinationDirectoryURL:v31 newFileName:v32 completionHandler:v45];
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v55 objects:v54 count:16];
        }
        while (v24);
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v33 = [v43 countByEnumeratingWithState:&v50 objects:v49 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v51 != v34) {
              objc_enumerationMutation(v43);
            }
            [(NSFileAccessClaim *)self addBlockingReactorID:*(void *)(*((void *)&v50 + 1) + 8 * k)];
          }
          uint64_t v33 = [v43 countByEnumeratingWithState:&v50 objects:v49 count:16];
        }
        while (v33);
      }
      arbiterQueue = self->_arbiterQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_3;
      block[3] = &unk_1E51FC540;
      block[4] = v42;
      block[5] = self;
      block[6] = v38;
      block[7] = v43;
      void block[8] = v39;
      dispatch_group_notify(v23, arbiterQueue, block);
      dispatch_release(v23);
      _Block_object_dispose(v46, 8);
    }
    else
    {
      v39[2](v39, v42);
    }
  }
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8 * a3);
  uint64_t result = [*(id *)(a1 + 32) shouldMakeProviderProvideItemAtLocation:a2 withOptions:v5];
  int v7 = result;
  if (result) {
    BOOL v8 = (v5 & 0x20000) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
LABEL_8:
    if (!v7) {
      return result;
    }
    goto LABEL_9;
  }
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t result = [v9 indexOfObjectIdenticalTo:a2];
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(void *)(*(void *)(a1 + 96) + 8 * result) != 2) {
        return result;
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
  if ([*(id *)(a1 + 48) containsObject:a2])
  {
    [*(id *)(a1 + 56) removeObject:a2];
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v10();
}

+ (BOOL)canReadingItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapNewWriting:(BOOL)a5 ofItemAtLocation:(id)a6 options:(unint64_t)a7
{
  int v7 = a7;
  return a7 >> 31 && a5
      || (objc_msgSend(a3, "itemIsItemAtLocation:", a6, a4, a5) & 1) == 0
      && ((*(void *)&v7 & 0x13000BLL) == 0 || ([a3 itemIsInItemAtLocation:a6] & 1) == 0);
}

+ (BOOL)canNewWriteOfItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapExistingWriteOfItemAtLocation:(id)a5 options:(unint64_t)a6
{
  if (a4 >> 31) {
    return 1;
  }
  int v6 = a6;
  int v8 = a4;
  return ([a3 itemIsItemAtLocation:a5] & 1) == 0
      && ((*(void *)&v8 & 0x13000BLL) == 0 || ([a5 itemIsInItemAtLocation:a3] & 1) == 0)
      && ((*(void *)&v6 & 0x13000BLL) == 0 || ([a3 itemIsInItemAtLocation:a5] & 1) == 0);
}

- (BOOL)shouldReadingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4
{
  if ((a3 & 0x40000000) != 0) {
    return 0;
  }
  if ((a3 & 0x80000001) != 0x80000000) {
    return 1;
  }
  if (![a4 usesMainThreadDuringReliquishing]) {
    return 1;
  }
  int v6 = objc_msgSend((id)objc_msgSend(a4, "client"), "processIdentifier");
  return v6 != [(NSXPCConnection *)self->_client processIdentifier];
}

- (BOOL)shouldWritingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4
{
  return a3 >> 31 == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)client
{
  v2 = self->_client;

  return v2;
}

- (int)clientProcessIdentifier
{
  client = self->_client;
  if (client) {
    return [(NSXPCConnection *)client processIdentifier];
  }
  else {
    return getpid();
  }
}

- (void)setCameFromSuperarbiter
{
  self->_cameFromSuperarbiter = 1;
}

uint64_t __46__NSFileAccessClaim_startObservingClientState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v4 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
    int v6 = *(_DWORD *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ observed suspension of client with %d", (uint8_t *)&v9, 0x12u);
  }
  int v7 = *(void **)(a1 + 32);
  if (v7[5]) {
    return [v7 cancelled];
  }
  else {
    return [a2 killProcessWithMessage:@"A coordinated read or write was still active when process was suspended."];
  }
}

- (void)setClaimerError:(id)a3
{
  claimerError = self->_claimerError;
  if (claimerError != a3)
  {

    self->_claimerError = (NSError *)[a3 copy];
  }
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  return 1;
}

- (void)whenFinishedPerformProcedure:(id)a3
{
  if (!self->_finishingProcedures) {
    self->_finishingProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v5 = (id)[a3 copy];
  [(NSMutableArray *)self->_finishingProcedures addObject:v5];
}

- (void)addBlockingReactorID:(id)a3
{
  blockingReactorIDs = self->_blockingReactorIDs;
  if (!blockingReactorIDs)
  {
    blockingReactorIDs = objc_alloc_init(NSCountedSet);
    self->_blockingReactorIDs = blockingReactorIDs;
  }

  [(NSCountedSet *)blockingReactorIDs addObject:a3];
}

- (void)removeBlockingReactorID:(id)a3
{
}

- (BOOL)claimerInvokingIsBlockedByReactorWithID:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  LOBYTE(a3) = -[NSFileAccessClaim _recursive_claimerInvokingIsBlockedByReactorWithID:checkedClaims:]((uint64_t)self, (uint64_t)a3, v5);

  return (char)a3;
}

- (uint64_t)_recursive_claimerInvokingIsBlockedByReactorWithID:(void *)a3 checkedClaims:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    if ([a3 containsObject:result]) {
      return 0;
    }
    if ([*(id *)(v5 + 88) containsObject:a2]) {
      return 1;
    }
    [a3 addObject:v5];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v6 = *(void **)(v5 + 80);
    uint64_t result = [v6 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v12;
LABEL_9:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (-[NSFileAccessClaim _recursive_claimerInvokingIsBlockedByReactorWithID:checkedClaims:](*(void *)(*((void *)&v11 + 1) + 8 * v9), a2, a3))return 1; {
        if (v7 == ++v9)
        }
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v10 count:16];
          uint64_t result = 0;
          if (v7) {
            goto LABEL_9;
          }
          return result;
        }
      }
    }
  }
  return result;
}

- (BOOL)isBlockedByClaimWithPurposeID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  blockingClaims = self->_blockingClaims;
  uint64_t v5 = [(NSMutableSet *)blockingClaims countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(blockingClaims);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "purposeID"), "isEqual:", a3))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSMutableSet *)blockingClaims countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (void)givePriorityToClaim:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 claimID];
  uint64_t v6 = +[NSString stringWithFormat:@"Avoiding deadlock with claim: %@", v5];
  [(NSFileAccessClaim *)self blockClaimerForReason:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__NSFileAccessClaim_givePriorityToClaim___block_invoke;
  v7[3] = &unk_1E51FAD68;
  v7[4] = self;
  void v7[5] = v5;
  v7[6] = v6;
  [a3 whenDevaluedPerformProcedure:v7];
  v8[0] = a3;
  -[NSFileAccessClaim removePendingClaims:](self, "removePendingClaims:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
}

uint64_t __41__NSFileAccessClaim_givePriorityToClaim___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Unblocking claimer for claim %{public}@ because the claim it was avoiding a deadlock with finished: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  return [*(id *)(a1 + 32) unblockClaimerForReason:*(void *)(a1 + 48)];
}

- (void)scheduleBlockedClaim:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 purposeID];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([(NSFileAccessClaim *)self claimerInvokingIsBlockedByReactorWithID:v5])
    {
      uint64_t v7 = _NSFCClaimsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [a3 claimID];
        claimID = self->_claimID;
        *(_DWORD *)uint64_t v20 = 138543874;
        *(void *)&v20[4] = v8;
        *(_WORD *)&v20[12] = 2114;
        *(void *)&v20[14] = claimID;
        *(_WORD *)&v20[22] = 2114;
        uint64_t v21 = v6;
        uint64_t v10 = "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by a reactor wi"
              "th the former's purposeID: %{public}@";
LABEL_8:
        _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, v10, v20, 0x20u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if ([(NSFileAccessClaim *)self isBlockedByClaimWithPurposeID:v6])
    {
      uint64_t v7 = _NSFCClaimsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [a3 claimID];
        long long v12 = self->_claimID;
        *(_DWORD *)uint64_t v20 = 138543874;
        *(void *)&v20[4] = v11;
        *(_WORD *)&v20[12] = 2114;
        *(void *)&v20[14] = v12;
        *(_WORD *)&v20[22] = 2114;
        uint64_t v21 = v6;
        uint64_t v10 = "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by another clai"
              "m with the former's purposeID: %{public}@";
        goto LABEL_8;
      }
LABEL_9:
      -[NSFileAccessClaim givePriorityToClaim:](self, "givePriorityToClaim:", a3, *(_OWORD *)v20, *(void *)&v20[16], v21);
      return;
    }
  }
  int v13 = [a3 shouldCancelInsteadOfWaiting];
  long long v14 = _NSFCClaimsLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = [a3 claimID];
      uint64_t v17 = self->_claimID;
      *(_DWORD *)uint64_t v20 = 138543618;
      *(void *)&v20[4] = v16;
      *(_WORD *)&v20[12] = 2114;
      *(void *)&v20[14] = v17;
      _os_log_impl(&dword_181795000, v14, OS_LOG_TYPE_DEFAULT, "As requested, cancelling claim %{public}@ because it is blocked by claim %{public}@.", v20, 0x16u);
    }
    objc_msgSend(a3, "setClaimerError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 3072, 0));
  }
  else
  {
    if (v15)
    {
      uint64_t v18 = [a3 claimID];
      uint64_t v19 = self->_claimID;
      *(_DWORD *)uint64_t v20 = 138543618;
      *(void *)&v20[4] = v18;
      *(_WORD *)&v20[12] = 2114;
      *(void *)&v20[14] = v19;
      _os_log_impl(&dword_181795000, v14, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ is blocked waiting for claim %{public}@ to finish.", v20, 0x16u);
    }
    [(NSFileAccessClaim *)self addPendingClaim:a3];
  }
}

- (void)addPendingClaim:(id)a3
{
  pendingClaims = self->_pendingClaims;
  if (!pendingClaims)
  {
    pendingClaims = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    self->_pendingClaims = pendingClaims;
  }
  if (([(NSMutableOrderedSet *)pendingClaims containsObject:a3] & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_pendingClaims addObject:a3];
    [a3 block];
    id v6 = (id)*((void *)a3 + 10);
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      *((void *)a3 + 10) = v6;
    }
    [v6 addObject:self];
    *((unsigned char *)a3 + 48) = 1;
  }
}

- (void)removePendingClaims:(id)a3
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
        uint64_t v9 = *(id **)(*((void *)&v11 + 1) + 8 * i);
        if ([(NSMutableOrderedSet *)self->_pendingClaims containsObject:v9])
        {
          [v9[10] removeObject:self];
          [v9 unblock];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  [(NSMutableOrderedSet *)self->_pendingClaims removeObjectsInArray:a3];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideIfNecessaryWithOptions:(unint64_t)a4 thenContinue:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_arbiterQueue);
  if ([(NSFileAccessClaim *)self shouldMakeProviderProvideItemAtLocation:a3 withOptions:a4])
  {
    uint64_t v9 = (void *)[a3 itemProvider];
    uint64_t v10 = [v9 reactorID];
    long long v11 = _NSFCClaimsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = claimID;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Claimer for %{public}@ is waiting for provider %{public}@ to provide", buf, 0x16u);
    }
    long long v13 = +[NSString stringWithFormat:@"Waiting for provider %@ to provide", v10];
    [(NSFileAccessClaim *)self blockClaimerForReason:v13];
    [(NSFileAccessClaim *)self addBlockingReactorID:v10];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    uint64_t v20 = __Block_byref_object_copy__26;
    uint64_t v21 = __Block_byref_object_dispose__26;
    uint64_t v22 = 0;
    uint64_t v14 = [a3 url];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__NSFileAccessClaim_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue___block_invoke;
    v18[3] = &unk_1E51FC4C8;
    v18[4] = v10;
    v18[5] = self;
    v18[7] = a5;
    v18[8] = buf;
    v18[6] = v13;
    uint64_t v15 = (void *)[v9 provideItemAtURL:v14 withOptions:a4 forAccessClaim:self completionHandler:v18];
    *(void *)(*(void *)&buf[8] + 40) = v15;
    if (v15)
    {
      if (!self->_providerCancellationProcedures)
      {
        self->_providerCancellationProcedures = (NSMutableArray *)objc_opt_new();
        uint64_t v15 = *(void **)(*(void *)&buf[8] + 40);
      }
      uint64_t v16 = (void *)[v15 copy];
      [(NSMutableArray *)self->_providerCancellationProcedures addObject:v16];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v17 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v17(a5, 1);
  }
}

uint64_t __93__NSFileAccessClaim_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16);
    int v16 = 138543618;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished, unblocking claimer for %{public}@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v7 = [a2 sandboxToken];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 176);
    if (!v9)
    {
      *(void *)(*(void *)(a1 + 40) + 176) = objc_opt_new();
      uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 176);
    }
    [v9 addObject:v8];
  }
  [*(id *)(a1 + 40) removeBlockingReactorID:*(void *)(a1 + 32)];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "removeObject:");
  }
  uint64_t v10 = [a2 error];
  if (v10)
  {
    uint64_t v11 = v10;
    long long v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [*(id *)(a1 + 40) claimID];
      int v16 = 138543874;
      uint64_t v17 = v14;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "Provider %{public}@, while providing for claim %{public}@, returned an error: %@", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 40) setClaimerError:v11];
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), [*(id *)(a1 + 40) claimerError] == 0);
  return [*(id *)(a1 + 40) unblockClaimerForReason:*(void *)(a1 + 48)];
}

uint64_t __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v11[2] = *MEMORY[0x1E4F143B8];
  if ((*(void *)(*(void *)(a1 + 56) + 8 * a3) & 2) != 0)
  {
    if ([*(id *)(a1 + 32) count])
    {
      v11[0] = a2;
      uint64_t v7 = *(void **)(a1 + 40);
      v11[1] = [*(id *)(a1 + 32) firstObject];
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 2));
      uint64_t v6 = *(void **)(a1 + 32);
      return [v6 removeObjectAtIndex:0];
    }
    uint64_t v9 = *(void **)(a1 + 48);
  }
  else
  {
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v5 = *(void **)(a1 + 40);
      v10[0] = [*(id *)(a1 + 48) firstObject];
      v10[1] = a2;
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 2));
      uint64_t v6 = *(void **)(a1 + 48);
      return [v6 removeObjectAtIndex:0];
    }
    uint64_t v9 = *(void **)(a1 + 32);
  }

  return [v9 addObject:a2];
}

void __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_lock_with_options();
  if ([a2 requiresProviding]) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  if ([a2 requiresAccessorBlockMaterializationPolicy]) {
    [*(id *)(a1 + 48) setShouldEnableMaterializationDuringAccessorBlock:1];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  uint64_t v4 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v4);
}

void __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 40) unblockClaimerForReason:*(void *)(a1 + 48)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = *(void **)(a1 + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) removeBlockingReactorID:*(void *)(*((void *)&v8 + 1) + 8 * i)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v10[6] = *MEMORY[0x1E4F143B8];
  ++*a4;
  [*(id *)(a1 + 32) addObject:a2];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_4;
  v10[3] = &unk_1E51FC568;
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v10[4] = *(void *)(a1 + 40);
  v10[5] = v8;
  return [v7 makeProviderOfItemAtLocation:a2 provideIfNecessaryWithOptions:a3 thenContinue:v10];
}

void __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_6(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];

  return [v2 unblockClaimerForReason:v3];
}

- (void)makeProviderOfItemAtLocation:(id)a3 providePhysicalURLThenContinue:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 itemProvider];
  uint64_t v8 = [v7 reactorID];
  if (!v7
    || (uint64_t v9 = v8, [(NSString *)self->_purposeIDOrNil isEqual:v8])
    || self->_cameFromSuperarbiter
    || [(NSFileAccessClaim *)self claimerError])
  {
    long long v10 = (void (*)(id, void))*((void *)a4 + 2);
    v10(a4, 0);
  }
  else
  {
    long long v11 = _NSFCClaimsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      *(_DWORD *)long long buf = 138543618;
      uint64_t v17 = claimID;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Claimer for %{public}@ is waiting for provider %{public}@ to provide a physical URL", buf, 0x16u);
    }
    long long v13 = +[NSString stringWithFormat:@"Waiting for provider %@ to provide a physical URL", v9];
    [(NSMutableArray *)self->_claimerBlockageReasons addObject:v13];
    [(NSFileAccessClaim *)self addBlockingReactorID:v9];
    uint64_t v14 = [a3 standardizedURL];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__NSFileAccessClaim_makeProviderOfItemAtLocation_providePhysicalURLThenContinue___block_invoke;
    v15[3] = &unk_1E51FC630;
    v15[4] = v9;
    v15[5] = self;
    v15[6] = v13;
    v15[7] = a4;
    [v7 providePhysicalURLForURL:v14 completionHandler:v15];
  }
}

uint64_t __81__NSFileAccessClaim_makeProviderOfItemAtLocation_providePhysicalURLThenContinue___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ has finished providing a physical URL, unblocking claimer for %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 40) removeBlockingReactorID:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 56) removeObject:*(void *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && *(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) standardizedURL];
    _CFURLPromiseSetPhysicalURL();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && *(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) standardizedURL];
    _CFURLPromiseSetPhysicalURL();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v7 = [*(id *)(a1 + 32) purposeID];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_2;
  v16[3] = &unk_1E51FC680;
  __int16 v8 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  v16[5] = v7;
  v16[6] = &v17;
  [v8 forEachAccessClaimOnItemOrContainedItemPerformProcedure:v16];
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v9 = [a2 reactorID];
    uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    if (v10)
    {
      long long v11 = _NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
        *(_DWORD *)long long buf = 138543874;
        uint64_t v22 = v12;
        __int16 v23 = 2114;
        uint64_t v24 = v9;
        __int16 v25 = 2082;
        uint64_t v26 = a4;
        _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Claimer for %{public}@ is waiting for presenter %{public}@ on %{public}s to relinquish", buf, 0x20u);
      }
      long long v13 = +[NSString stringWithFormat:@"Waiting for presenter %@ to relinquish", v9];
      [*(id *)(a1 + 32) blockClaimerForReason:v13];
      [*(id *)(a1 + 32) addBlockingReactorID:v9];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_85;
      v15[3] = &unk_1E51FC720;
      uint64_t v14 = *(void *)(a1 + 32);
      v15[4] = v9;
      v15[5] = v14;
      v15[6] = v13;
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v15);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  _Block_object_dispose(&v17, 8);
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_2(uint64_t result, void *a2)
{
  if (*(void **)(result + 32) != a2)
  {
    uint64_t v2 = result;
    uint64_t result = [a2 claimerInvokingIsBlockedByReactorWithID:*(void *)(result + 40)];
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 0;
    }
  }
  return result;
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_85(void *a1, int a2, void *a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  __int16 v8 = _NSFCClaimsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = *(void *)(a1[5] + 16);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    uint64_t v29 = v10;
    _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ has finished relinquishing, unblocking claimer for %{public}@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  uint64_t v21 = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_86;
  uint64_t v22 = &unk_1E51FC6D0;
  long long v11 = (void *)a1[5];
  uint64_t v23 = a1[4];
  uint64_t v24 = v11;
  uint64_t v25 = a4;
  objc_msgSend(v11, "removeBlockingReactorID:");
  uint64_t v12 = a1[5];
  if (*(unsigned char *)(v12 + 49))
  {
    v21((uint64_t)v20, (uint64_t)&__block_literal_global_75);
  }
  else
  {
    long long v13 = *(void **)(v12 + 104);
    if (!v13)
    {
      *(void *)(a1[5] + 104) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v13 = *(void **)(a1[5] + 104);
    }
    uint64_t v14 = [v13 objectForKey:a1[4]];
    uint64_t v15 = v20;
    if (v14)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_3;
      v19[3] = &unk_1E51FC6F8;
      v19[4] = v20;
      v19[5] = v14;
      uint64_t v15 = v19;
    }
    int v16 = (void *)[v15 copy];
    [*(id *)(a1[5] + 104) setObject:v16 forKey:a1[4]];
  }
  uint64_t v17 = (void *)a1[5];
  if (a2 && !v17[8])
  {
    *(void *)(a1[5] + 64) = [a3 copy];
    uint64_t v17 = (void *)a1[5];
  }
  return [v17 unblockClaimerForReason:a1[6]];
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_86(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Making presenter %{public}@ reacquire after claim %{public}@", buf, 0x16u);
  }
  [*(id *)(a1 + 40) addBlockingReactorID:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_87;
  uint64_t v12 = &unk_1E51FC6A8;
  int8x16_t v13 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v14 = a2;
  return (*(uint64_t (**)(void))(v7 + 16))();
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_87(uint64_t a1)
{
  [*(id *)(a1 + 32) removeBlockingReactorID:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_4;
  v4[3] = &unk_1E51FC220;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  v4[5] = a2;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x185308110]();
  [*(id *)(a1 + 32) pathFromAncestor:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x185308110]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x185308110]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__NSFileAccessClaim_canAccessLocations_forReading_error___block_invoke(uint64_t result, void *a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v3 = result;
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "reactorID"), "isEqual:", *(void *)(*(void *)(result + 32) + 24));
    if (result)
    {
      uint64_t result = [a2 disconnected];
      *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = result ^ 1;
    }
  }
  return result;
}

- (BOOL)_writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  __int16 v8 = (void *)[a3 path];
  uint64_t v9 = (char *)[a3 fileSystemRepresentation];
  uint64_t v10 = [a4 fileSystemRepresentation];
  if (!v8 || !v9 || !v10)
  {
    if (!a5) {
      return 0;
    }
    v53[0] = @"NSSourceFilePathErrorKey";
    v53[1] = @"NSDestinationFilePath";
    v54[0] = a3;
    v54[1] = a4;
    __int16 v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 256, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2]);
    BOOL result = 0;
    *a5 = v17;
    return result;
  }
  long long v11 = (void *)archive_write_new();
  archive_write_set_format_zip();
  if (archive_write_open_filename())
  {
    if (a5)
    {
      uint64_t v12 = __error();
      *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v12, (uint64_t)a4, 0, 0, 0);
    }
    free(v11);
    uint64_t disk_new = 0;
    long long v11 = 0;
    uint64_t v14 = 0;
    BOOL v15 = 0;
    long long v55 = v9;
    uint64_t v56 = 0;
    goto LABEL_8;
  }
  uint64_t disk_new = archive_read_disk_new();
  archive_read_disk_set_standard_lookup();
  long long v55 = v9;
  uint64_t v56 = 0;
  uint64_t v19 = fts_open(&v55, 84, 0);
  if (v19)
  {
    uint64_t v14 = v19;
    char v16 = 0;
    BOOL v15 = 1;
  }
  else
  {
    if (!a5)
    {
      uint64_t v14 = 0;
      BOOL v15 = 0;
LABEL_8:
      char v16 = 1;
      goto LABEL_16;
    }
    char v20 = __error();
    char v16 = 1;
    uint64_t v14 = 0;
    BOOL v15 = 0;
    *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v20, (uint64_t)a3, 1, 0, 0);
  }
LABEL_16:
  uint64_t v21 = (const char *)objc_msgSend((id)objc_msgSend(v8, "stringByDeletingLastPathComponent"), "fileSystemRepresentation");
  if (v16)
  {
LABEL_61:
    if (v14)
    {
      if (*__error())
      {
        if (a5)
        {
          v45 = __error();
          BOOL v44 = 0;
          BOOL v15 = 0;
          *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v45, (uint64_t)a3, 1, 0, 0);
          if (v11) {
            goto LABEL_75;
          }
        }
        else
        {
          BOOL v44 = 0;
          BOOL v15 = 0;
          if (v11) {
            goto LABEL_75;
          }
        }
      }
      else
      {
        BOOL v44 = 0;
        if (v11) {
          goto LABEL_75;
        }
      }
    }
    else
    {
      BOOL v44 = 1;
      if (v11) {
        goto LABEL_75;
      }
    }
LABEL_78:
    if (!disk_new) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  id v51 = a4;
  uint64_t v52 = disk_new;
  uint64_t v50 = (int)(strlen(v21) + 1);
  while (1)
  {
    while (1)
    {
      uint64_t v22 = fts_read(v14);
      if (!v22)
      {
        a4 = v51;
        uint64_t disk_new = v52;
        goto LABEL_61;
      }
      uint64_t v23 = v22;
      unsigned int fts_info = v22->fts_info;
      if (fts_info > 0xE) {
        goto LABEL_24;
      }
      int v25 = 1 << fts_info;
      if ((v25 & 0x4266) == 0) {
        break;
      }
      if (!v15) {
        goto LABEL_58;
      }
    }
    if ((v25 & 0x490) != 0) {
      break;
    }
LABEL_24:
    fts_accpath = v22->fts_accpath;
    int v27 = _NSOpenFileDescriptor(fts_accpath, 0, 0);
    if (v27)
    {
      if (v15)
      {
        uint64_t v28 = archive_entry_new();
        archive_entry_set_pathname();
        if (archive_read_disk_entry_from_file())
        {
          if (a5)
          {
            uint64_t v29 = (int)archive_errno();
            BOOL v15 = 0;
            *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v29, [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:fts_accpath isDirectory:0 relativeToURL:0], 1, 0, 0);
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          v48[2] = v28;
          if (archive_write_header())
          {
            if (a5)
            {
              int v31 = archive_errno();
              BOOL v15 = 0;
              *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v31, (uint64_t)v51, 0, 0, 0);
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            uint64_t v32 = _NSPreferredChunkSizeForFileDescriptor(v27);
            if (v32 < v23->fts_statp->st_size) {
              uint64_t v32 = _NSPreferredChunkSizeForFileDescriptor(v27);
            }
            v48[1] = v48;
            MEMORY[0x1F4188790](v32);
            dispatch_group_t v35 = (char *)v48 - v34;
            unint64_t v49 = v36;
            if (v36 > 0x100) {
              dispatch_group_t v35 = (char *)malloc_type_malloc(v33, 0x100004077774924uLL);
            }
            else {
              bzero((char *)v48 - v34, v33);
            }
            unint64_t v37 = v49;
            while (1)
            {
              uint64_t v38 = _NSReadFromFileDescriptorWithProgress(v27, v35, v37, 0, 0);
              if (v38 < 1) {
                break;
              }
              uint64_t v39 = archive_write_data();
              unint64_t v37 = v49;
              if (v39 == -1)
              {
                if (a5)
                {
                  uint64_t v40 = (int)archive_errno();
                  uint64_t v41 = (uint64_t)v51;
                  int v42 = 0;
LABEL_52:
                  BOOL v15 = 0;
                  *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v40, v41, v42, 0, 0);
                  goto LABEL_54;
                }
                BOOL v15 = 0;
                goto LABEL_54;
              }
            }
            if (v38) {
              BOOL v15 = 0;
            }
            if (a5 && v38)
            {
              uint64_t v43 = *__error();
              uint64_t v41 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:fts_accpath isDirectory:0 relativeToURL:0];
              uint64_t v40 = v43;
              int v42 = 1;
              goto LABEL_52;
            }
LABEL_54:
            if (v49 >= 0x101) {
              free(v35);
            }
          }
        }
        archive_entry_free();
      }
    }
    else if (a5)
    {
      uint64_t v30 = *__error();
      BOOL v15 = 0;
      *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v30, [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:fts_accpath isDirectory:0 relativeToURL:0], 1, 0, 0);
    }
    else
    {
      BOOL v15 = 0;
    }
    close(v27);
    if (!v15)
    {
LABEL_58:
      BOOL v44 = v14 == 0;
      a4 = v51;
      uint64_t disk_new = v52;
      if (v11) {
        goto LABEL_75;
      }
      goto LABEL_78;
    }
  }
  a4 = v51;
  uint64_t disk_new = v52;
  if (a5)
  {
    uint64_t v46 = *__error();
    *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v46, [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v23->fts_path isDirectory:0 relativeToURL:0], 1, 0, 0);
  }
  BOOL v15 = 0;
  BOOL v44 = v14 == 0;
  if (!v11) {
    goto LABEL_78;
  }
LABEL_75:
  if (!archive_write_free()) {
    goto LABEL_78;
  }
  if (a5)
  {
    int v47 = archive_errno();
    BOOL v15 = 0;
    *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v47, (uint64_t)a4, 0, 0, 0);
    goto LABEL_78;
  }
  BOOL v15 = 0;
  if (disk_new) {
LABEL_79:
  }
    archive_read_free();
LABEL_80:
  if (!v44) {
    fts_close(v14);
  }
  return v15;
}

- (void)prepareItemForUploadingFromURL:(id)a3 thenContinue:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(NSFileAccessClaim *)self blockClaimerForReason:@"Zipping"];
  id v7 = [(NSFileAccessClaim *)self claimID];
  __int16 v8 = _NSFCClaimsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543619;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v27 = 2113;
    uint64_t v28 = [a3 path];
    _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_INFO, "Claim %{public}@ is waiting for file %{private}@ to be prepared for uploading", buf, 0x16u);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  char v20 = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke;
  uint64_t v21 = &unk_1E51FC7E8;
  uint64_t v23 = self;
  id v24 = a4;
  id v22 = v7;
  *(void *)long long buf = 0;
  uint64_t v9 = [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"CoordinatedZipFileXXXXXX"] fileSystemRepresentation];
  uint64_t v10 = strdup(v9);
  if (![+[NSFileManager defaultManager] createDirectoryAtPath:NSTemporaryDirectory() withIntermediateDirectories:1 attributes:0 error:buf])
  {
    uint64_t v14 = *(NSError **)buf;
LABEL_9:
    v20((uint64_t)v19, 0, (uint64_t)v14);
    goto LABEL_10;
  }
  if (!v10 || !mkdtemp(v10))
  {
    uint64_t v14 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:256 userInfo:0];
    goto LABEL_9;
  }
  long long v11 = [+[NSFileManager defaultManager] stringWithFileSystemRepresentation:v10 length:strlen(v10)];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_108;
  v18[3] = &unk_1E51F71D0;
  v18[4] = v11;
  [(NSFileAccessClaim *)self whenFinishedPerformProcedure:v18];
  uint64_t v17 = 0;
  uint64_t v12 = *MEMORY[0x1E4F1C728];
  v25[0] = *MEMORY[0x1E4F1C628];
  v25[1] = v12;
  uint64_t v13 = objc_msgSend(a3, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 2), &v17);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_109;
  v16[3] = &unk_1E51FC130;
  v16[4] = v13;
  v16[5] = a3;
  v16[6] = self;
  void v16[7] = v11;
  v16[8] = v19;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_136;
  v15[3] = &unk_1E51FC810;
  v15[4] = v13;
  v15[5] = v11;
  v15[6] = a3;
  void v15[7] = self;
  void v15[8] = v17;
  v15[9] = v19;
  __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_109((uint64_t)v16, (uint64_t)v15);
LABEL_10:
  free(v10);
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _NSFCClaimsLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138543619;
      uint64_t v12 = v8;
      __int16 v13 = 2113;
      uint64_t v14 = a2;
      _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_INFO, "Upload preparation for claim %{public}@ completed with resulting URL: %{private}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543619;
    uint64_t v12 = v10;
    __int16 v13 = 2113;
    uint64_t v14 = a3;
    _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Upload preparation for claim %{public}@ completed with error: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  return [*(id *)(a1 + 40) unblockClaimerForReason:@"Zipping"];
}

void __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_108(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = 0;
  if (([(id)objc_opt_new() removeItemAtPath:*(void *)(a1 + 32) error:&v2] & 1) == 0
    && [v2 code] != 4)
  {
    v1 = _NSFCClaimsLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v4 = v2;
      _os_log_error_impl(&dword_181795000, v1, OS_LOG_TYPE_ERROR, "Failed to remove file created for uploading: %{public}@", buf, 0xCu);
    }
  }
}

void __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_109(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E4F1C728]), "hasPrefix:", @"com.apple.iwork");
  int v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "lastPathComponent"), "hasPrefix:", @"__NSFileCoordinationPrepareForUploadTestFile");
  if ((v4 & 1) != 0 || v5)
  {
    if (v4)
    {
      if (NSFileAccessClaimInitialBlockageReason_block_invoke_onceToken != -1) {
        dispatch_once(&NSFileAccessClaimInitialBlockageReason_block_invoke_onceToken, &__block_literal_global_117);
      }
      id v7 = @"com.apple.iWorkFileFormat";
    }
    else if (v5)
    {
      id v7 = @"com.apple.foundationtests.NSFileCoordinationPrepareForUploadTestService";
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v8 = [[NSXPCConnection alloc] initWithServiceName:v7];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:&unk_1ECAF9E28]];
    [(NSXPCConnection *)v8 _setQueue:*(void *)(*(void *)(a1 + 48) + 184)];
    [(NSXPCConnection *)v8 resume];
    uint64_t v9 = _NSFCClaimsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = [*(id *)(a1 + 40) path];
      *(_DWORD *)long long buf = 138543619;
      id v24 = v7;
      __int16 v25 = 2113;
      uint64_t v26 = v20;
      _os_log_debug_impl(&dword_181795000, v9, OS_LOG_TYPE_DEBUG, "Asking service named %{public}@ to prepare file %{private}@ for uploading", buf, 0x16u);
    }
    [*(id *)(a1 + 40) fileSystemRepresentation];
    uint64_t v10 = (const char *)sandbox_extension_issue_file();
    [*(id *)(a1 + 56) fileSystemRepresentation];
    int v11 = (const char *)sandbox_extension_issue_file();
    if (v10) {
      uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v10 length:strlen(v10) + 1 freeWhenDone:1];
    }
    else {
      uint64_t v12 = [MEMORY[0x1E4F1C9B8] data];
    }
    uint64_t v13 = v12;
    if (v11) {
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:strlen(v11) + 1 freeWhenDone:1];
    }
    else {
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] data];
    }
    uint64_t v15 = v14;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_133;
    v22[3] = &unk_1E51FA638;
    v22[4] = v7;
    void v22[5] = a2;
    id v16 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v22];
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 56)];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_135;
    v21[3] = &unk_1E51FC428;
    uint64_t v19 = *(void *)(a1 + 40);
    v21[4] = v7;
    void v21[5] = v19;
    v21[6] = *(void *)(a1 + 64);
    v21[7] = a2;
    [v16 prepareFileForUploadingAtURL:v17 originalURLExtension:v13 inDirectory:v18 destinationSandboxExtension:v15 completionHandler:v21];
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t))(a2 + 16);
    v6(a2);
  }
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_2()
{
  xpc_add_bundle();

  return xpc_add_bundle();
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_133(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Error communicating with service named: %{public}@. %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_135(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2 | a3;
  uint64_t v6 = _NSFCClaimsLog();
  int v7 = v6;
  if (v5)
  {
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [*(id *)(a1 + 40) path];
        int v15 = 138543875;
        uint64_t v16 = v8;
        __int16 v17 = 2113;
        uint64_t v18 = v9;
        __int16 v19 = 2113;
        uint64_t v20 = [(id)a2 path];
        _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "Service %{public}@ succeeded in preparing file %{private}@ for uploading. Resulting path: %{private}@", (uint8_t *)&v15, 0x20u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [*(id *)(a1 + 40) path];
      int v15 = 138543875;
      uint64_t v16 = v13;
      __int16 v17 = 2113;
      uint64_t v18 = v14;
      __int16 v19 = 2113;
      uint64_t v20 = [0 path];
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Service %{public}@ failed to prepare file %{private}@ for uploading. Error: %{private}@", (uint8_t *)&v15, 0x20u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) path];
      int v15 = 138543619;
      uint64_t v16 = v11;
      __int16 v17 = 2113;
      uint64_t v18 = v12;
      _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "Service %{public}@ has requested we fall back to the standard procedure to prepare file %{private}@ for uploading.", (uint8_t *)&v15, 0x16u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_136(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  __int16 v25 = 0;
  id v2 = (void *)[*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F1C628]];
  if (v2)
  {
    int v3 = [v2 BOOLValue];
    int v4 = objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", objc_msgSend(*(id *)(a1 + 48), "lastPathComponent"));
    unint64_t v5 = v4;
    if (v3)
    {
      uint64_t v6 = (void *)[v4 lastPathComponent];
      int v7 = (const char *)[v6 fileSystemRepresentation];
      if (v7)
      {
        size_t v8 = strlen(v7);
        if (v8 - 252 <= 0xFFFFFFFFFFFFFEFFLL)
        {
          size_t v9 = v8;
          uint64_t v10 = (void *)[v6 stringByDeletingPathExtension];
          size_t v11 = [v10 length] - v9;
          uint64_t v12 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, v11 + 251);
          BOOL v14 = v11 != -251 && v13 > v11 + 251;
          if (v14)
          {
            unint64_t v20 = v11 + 250;
            do
            {
              uint64_t v15 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, v20);
              unint64_t v16 = v21;
              if (!v20) {
                break;
              }
              BOOL v14 = v21 > v20--;
            }
            while (v14);
          }
          else
          {
            uint64_t v15 = v12;
            unint64_t v16 = v13;
          }
          unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(v6, "substringWithRange:", v15, v16)), "stringByAppendingPathExtension:", objc_msgSend(v6, "pathExtension"));
        }
        unint64_t v5 = (void *)[v5 stringByAppendingPathExtension:@"zip"];
      }
      uint64_t v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
      uint64_t v23 = _NSFCClaimsLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_181795000, v23, OS_LOG_TYPE_INFO, "(ReadingForUploading) Creating zip archive of coordinated directory", buf, 2u);
      }
      [*(id *)(a1 + 56) _writeArchiveOfDirectoryAtURL:*(void *)(a1 + 48) toURL:v22 error:&v25];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
      __int16 v19 = _NSFCClaimsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_181795000, v19, OS_LOG_TYPE_INFO, "(ReadingForUploading) Copying cordinated flat file", buf, 2u);
      }
      [(id)objc_opt_new() copyItemAtURL:*(void *)(a1 + 48) toURL:v18 error:&v25];
    }
  }
  else
  {
    __int16 v17 = *(NSError **)(a1 + 64);
    if (!v17) {
      __int16 v17 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:256 userInfo:0];
    }
    __int16 v25 = v17;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __28__NSFileAccessClaim_revoked__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__NSFileAccessClaim_revoked__block_invoke_2;
  v4[3] = &unk_1E51FAD90;
  long long v5 = *(_OWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, void *))(a3 + 16))(a3, v4);
}

uint64_t __28__NSFileAccessClaim_revoked__block_invoke_2(uint64_t result)
{
  if (!--*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return [*(id *)(result + 32) devalueSelf];
  }
  return result;
}

- (BOOL)isGranted
{
  return !self->_blockageCount && !self->_isRevoked;
}

- (id)descriptionWithIndenting:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  client = self->_client;
  if (client)
  {
    uint64_t v6 = [(NSXPCConnection *)client processIdentifier];
    int v7 = proc_name(v6, buffer, 0x100u);
    if (v7 < 1) {
      size_t v8 = 0;
    }
    else {
      size_t v8 = [[NSString alloc] initWithBytes:buffer length:v7 encoding:4];
    }
    size_t v9 = +[NSString stringWithFormat:@"%@ (%i)", v8, v6];
  }
  else
  {
    size_t v9 = (NSString *)@"<this process>";
  }
  uint64_t v10 = +[NSString string];
  size_t v11 = (void *)[a3 stringByAppendingString:@"    "];
  [(NSString *)v10 appendFormat:@"%@<%@ %p> client: %@, claim ID: %@", a3, objc_opt_class(), self, v9, self->_claimID];
  if (self->_cameFromSuperarbiter) {
    [(NSString *)v10 appendString:@" - came from superabiter"];
  }
  purposeIDOrNil = self->_purposeIDOrNil;
  if (!purposeIDOrNil) {
    purposeIDOrNil = (NSString *)@"<nil>";
  }
  [(NSString *)v10 appendFormat:@"\n%@purposeID: %@", v11, purposeIDOrNil];
  unint64_t blockageCount = self->_blockageCount;
  if (blockageCount) {
    [(NSString *)v10 appendFormat:@"\n%@blockage count: %i", v11, blockageCount];
  }
  if (self->_pendingClaims)
  {
    [(NSString *)v10 appendFormat:@"\n%@pending claims:", v11];
    uint64_t v14 = [v11 stringByAppendingString:@"    "];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    pendingClaims = self->_pendingClaims;
    uint64_t v16 = [(NSMutableOrderedSet *)pendingClaims countByEnumeratingWithState:&v33 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(pendingClaims);
          }
          -[NSString appendFormat:](v10, "appendFormat:", @"\n%@", [*(id *)(*((void *)&v33 + 1) + 8 * i) descriptionWithIndenting:v14]);
        }
        uint64_t v17 = [(NSMutableOrderedSet *)pendingClaims countByEnumeratingWithState:&v33 objects:v32 count:16];
      }
      while (v17);
    }
  }
  if ([(NSMutableArray *)self->_claimerBlockageReasons count])
  {
    [(NSString *)v10 appendFormat:@"\n%@claimer blockage reasons:", v11];
    uint64_t v20 = [v11 stringByAppendingString:@"    "];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    claimerBlockageReasons = self->_claimerBlockageReasons;
    uint64_t v22 = [(NSMutableArray *)claimerBlockageReasons countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(claimerBlockageReasons);
          }
          [(NSString *)v10 appendFormat:@"\n%@%@", v20, *(void *)(*((void *)&v28 + 1) + 8 * j)];
        }
        uint64_t v23 = [(NSMutableArray *)claimerBlockageReasons countByEnumeratingWithState:&v28 objects:v27 count:16];
      }
      while (v23);
    }
  }
  return v10;
}

- (id)description
{
  return [(NSFileAccessClaim *)self descriptionWithIndenting:&stru_1ECA5C228];
}

- (BOOL)checkIfSymbolicLinkAtURL:(id)a3 withResolutionCount:(int64_t *)a4 andIfSoThenReevaluateSelf:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_claimerError) {
    return 0;
  }
  id v24 = 0;
  if (![a3 getResourceValue:&v24 forKey:*MEMORY[0x1E4F1C680] error:0]
    || ![v24 BOOLValue])
  {
    return 0;
  }
  uint64_t v9 = (*a4)++;
  if (v9 > 31)
  {
    uint64_t v20 = _NSFCClaimsLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [(NSFileAccessClaim *)self claimID];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = v22;
      _os_log_error_impl(&dword_181795000, v20, OS_LOG_TYPE_ERROR, "Claim %{public}@ failed symbolic link resolution due to an apparent link cycle", buf, 0xCu);
    }
    [(NSFileAccessClaim *)self setClaimerError:_NSErrorWithFilePathErrnoVariantAndExtraUserInfo(62, (uint64_t)a3, 1, 0, 0)];
    return 0;
  }
  uint64_t v10 = [a3 path];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  uint64_t v12 = objc_alloc_init(NSFileManager);
  uint64_t v13 = [(NSFileManager *)v12 destinationOfSymbolicLinkAtPath:v11 error:0];
  if (v13 && (uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 relativeToURL:a3]) != 0)
  {
    uint64_t v15 = v14;
    if (self->_blockageCount || [(NSMutableArray *)self->_claimerBlockageReasons count])
    {
      uint64_t v16 = _NSFCClaimsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        claimID = self->_claimID;
        *(_DWORD *)long long buf = 138543362;
        uint64_t v26 = claimID;
        _os_log_error_impl(&dword_181795000, v16, OS_LOG_TYPE_ERROR, "claim %{public}@ is trying to resolve a symbolic link too early", buf, 0xCu);
      }
    }
    ++self->_blockageCount;
    [(NSMutableArray *)self->_claimerBlockageReasons addObject:@"Initial blockage"];
    uint64_t v17 = _NSFCClaimsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = self->_claimID;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = v18;
      _os_log_impl(&dword_181795000, v17, OS_LOG_TYPE_DEFAULT, "claim %{public}@ is re-evaluating after resolving a symlink", buf, 0xCu);
    }
    [(NSFileAccessClaim *)self devalueSelf];
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v15);
    [(NSFileAccessClaim *)self unblock];
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)purposeIDOfClaimOnItemAtLocation:(id)a3 forMessagingPresenter:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__181;
  uint64_t v14 = __Block_byref_object_dispose__182;
  id v15 = 0;
  id v15 = [(NSFileAccessClaim *)self purposeID];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__NSFileAccessClaim_purposeIDOfClaimOnItemAtLocation_forMessagingPresenter___block_invoke;
  v9[3] = &unk_1E51FC860;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = &v10;
  [a3 forEachRelevantAccessClaimPerformProcedure:v9];
  int v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __76__NSFileAccessClaim_purposeIDOfClaimOnItemAtLocation_forMessagingPresenter___block_invoke(uint64_t result, id *a2)
{
  if (*(id **)(result + 32) != a2)
  {
    uint64_t v3 = result;
    int v4 = (void *)[a2 purposeID];
    BOOL result = objc_msgSend(v4, "isEqual:", objc_msgSend(*(id *)(v3 + 40), "reactorID"));
    if (result)
    {
      BOOL result = [a2[11] containsObject:*(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 40)];
      if (result) {
        *(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 40) = v4;
      }
    }
  }
  return result;
}

- (void)disavowed
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _NSFCClaimsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    claimID = self->_claimID;
    int v6 = 138543362;
    int v7 = claimID;
    _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_INFO, "Disavowing claim %{public}@ that was never granted", (uint8_t *)&v6, 0xCu);
  }
  if ([(NSMutableArray *)self->_revocationProcedures count])
  {

    self->_revocationProcedures = 0;
  }
  if ([(NSMutableOrderedSet *)self->_pendingClaims count])
  {

    self->_pendingClaims = 0;
  }
  if ([(NSMutableSet *)self->_blockingClaims count])
  {

    self->_blockingClaims = 0;
  }
  id serverClaimerOrNil = self->_serverClaimerOrNil;
  if (serverClaimerOrNil)
  {

    self->_id serverClaimerOrNil = 0;
  }
}

- (NSArray)allURLs
{
  return 0;
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return 0;
}

@end