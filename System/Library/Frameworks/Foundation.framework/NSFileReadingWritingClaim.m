@interface NSFileReadingWritingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)shouldCancelInsteadOfWaiting;
- (NSFileReadingWritingClaim)initWithCoder:(id)a3;
- (NSFileReadingWritingClaim)initWithPurposeID:(id)a3 readingURL:(id)a4 options:(unint64_t)a5 writingURL:(id)a6 options:(unint64_t)a7 claimer:(id)a8;
- (id)allURLs;
- (void)dealloc;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)granted;
- (void)invokeClaimer;
- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4;
- (void)protectFilesAgainstEviction;
- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3;
@end

@implementation NSFileReadingWritingClaim

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_readingURL), @"NSReadingURLPairKey");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_readingOptions), @"NSReadingOptionsKey");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_writingURL), @"NSWritingURLPairKey");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_writingOptions), @"NSWritingOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)NSFileReadingWritingClaim;
  [(NSFileAccessClaim *)&v5 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_409(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v12 = _NSFCClaimsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [*(id *)(a1 + 32) claimID];
    int v19 = 138543362;
    uint64_t v20 = v14;
    _os_log_debug_impl(&dword_181795000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v19, 0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }
  else if (a6)
  {
LABEL_3:
    v13 = _NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [*(id *)(a1 + 32) claimID];
      int v19 = 138543618;
      uint64_t v20 = v18;
      __int16 v21 = 2114;
      uint64_t v22 = a6;
      _os_log_error_impl(&dword_181795000, v13, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }
  v15 = (void *)[a2 firstObject];
  if (objc_opt_isKindOfClass())
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v15, "URL"), "copy");
    *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
  }
  v16 = (void *)[a3 firstObject];
  if (objc_opt_isKindOfClass())
  {

    *(void *)(*(void *)(a1 + 32) + 232) = objc_msgSend((id)objc_msgSend(v16, "URL"), "copy");
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
  }
  if (a4)
  {

    *(void *)(*(void *)(a1 + 32) + 176) = [a4 copy];
  }
  [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:a5];
  return [*(id *)(a1 + 32) unblock];
}

- (void)granted
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_readingLocation || self->_writingLocation)
  {
    uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (unsigned __int8 v11 = atomic_load(_NSFCDisableLogSuppression), (v11 & 1) != 0)
      || (uint64_t v12 = atomic_load(&_NSFCSubarbitratedClaimCount), v12 <= 99))
    {
      v4 = _NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }
    if (self->_readingLocation)
    {
      readingLocation = self->_readingLocation;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&readingLocation count:1];
    }
    else
    {
      uint64_t v5 = 0;
    }
    if (self->_writingLocation)
    {
      writingLocation = self->_writingLocation;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&writingLocation count:1];
    }
    else
    {
      uint64_t v6 = 0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __36__NSFileReadingWritingClaim_granted__block_invoke;
    v17[3] = &unk_1E51F8F20;
    v17[4] = self;
    [(NSFileAccessClaim *)self makeProvidersProvideItemsForReadingLocations:v5 options:&self->_readingOptions andWritingLocationsIfNecessary:v6 options:&self->_writingOptions thenContinue:v17];
    if (self->_writingLocation
      && [(NSFileAccessClaim *)self shouldInformProvidersAboutEndOfWriteWithOptions:self->_writingOptions])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_6;
      v16[3] = &unk_1E51F71D0;
      v16[4] = self;
      [(NSFileAccessClaim *)self whenRevokedPerformProcedure:v16];
    }
  }
  else if (self->super._client)
  {
    v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = [(NSFileAccessClaim *)self claimID];
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Claim %{public}@ can't be granted in daemon", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = atomic_load(&_NSFCSubarbitrationCount);
    if (v8 < 1
      || (unsigned __int8 v13 = atomic_load(_NSFCDisableLogSuppression), (v13 & 1) != 0)
      || (uint64_t v14 = atomic_load(&_NSFCSubarbitratedClaimCount), v14 <= 99))
    {
      v9 = _NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }
    if ((self->_readingOptions & 8) != 0)
    {
      readingURL = self->_readingURL;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_410;
      v15[3] = &unk_1E51F8188;
      v15[4] = self;
      [(NSFileAccessClaim *)self prepareItemForUploadingFromURL:readingURL thenContinue:v15];
    }
  }
  [(NSFileAccessClaim *)self unblockClaimerForReason:@"Initial blockage"];
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__NSFileReadingWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E51FCA60;
  v2[4] = self;
  [(NSFileReadingWritingClaim *)self resolveURLsThenMaybeContinueInvokingClaimer:v2];
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_6(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 264) itemProvider];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 264);

  return objc_msgSend(v2, "observeEndOfWriteAtLocation:forAccessClaim:", v3);
}

- (void)devalueSelf
{
  v7[5] = *MEMORY[0x1E4F143B8];
  readingLocation = self->_readingLocation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NSFileReadingWritingClaim_devalueSelf__block_invoke;
  v7[3] = &unk_1E51FC8D0;
  v7[4] = self;
  [(NSFileAccessNode *)readingLocation forEachRelevantAccessClaimPerformProcedure:v7];
  writingLocation = self->_writingLocation;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__NSFileReadingWritingClaim_devalueSelf__block_invoke_2;
  v6[3] = &unk_1E51FC8D0;
  v6[4] = self;
  [(NSFileAccessNode *)writingLocation forEachRelevantAccessClaimPerformProcedure:v6];
  [(NSFileAccessNode *)self->_readingLocation removeAccessClaim:self];
  self->_readingLocation = 0;
  [(NSFileAccessNode *)self->_writingLocation removeAccessClaim:self];
  self->_writingLocation = 0;
  v5.receiver = self;
  v5.super_class = (Class)NSFileReadingWritingClaim;
  [(NSFileAccessClaim *)&v5 devalueSelf];
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  v7 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_readingURL];
  uint64_t v8 = [a3 descendantForFileURL:self->_writingURL];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return 1;
  }
  unsigned __int8 v11 = (NSFileAccessNode *)v8;
  uint64_t v17 = 0;
  if (!v4
    || [(NSFileAccessNode *)v7 itemIsSubarbitrable]
    && [(NSFileAccessNode *)v11 itemIsSubarbitrable])
  {
    v19[0] = v7;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1], 1, &v17)&& (uint64_t v18 = v11, -[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v18, 1), 0, &v17)))
    {
      self->_readingLocation = v7;
      [(NSFileAccessNode *)v7 addAccessClaim:self];
      self->_writingLocation = v11;
      [(NSFileAccessNode *)v11 addAccessClaim:self];
      if ((self->_readingOptions & 2) != 0) {
        self->_rootNode = (NSFileAccessNode *)a3;
      }
      readingLocation = self->_readingLocation;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v16[3] = &unk_1E51FC8D0;
      v16[4] = self;
      [(NSFileAccessNode *)readingLocation forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v16];
      writingLocation = self->_writingLocation;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v15[3] = &unk_1E51FC8D0;
      v15[4] = self;
      [(NSFileAccessNode *)writingLocation forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v15];
    }
    else
    {
      [(NSFileAccessClaim *)self setClaimerError:v17];
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }
  [(NSFileAccessNode *)v11 removeSelfIfUseless];
  [(NSFileAccessNode *)v7 removeSelfIfUseless];
  return v10;
}

uint64_t __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __40__NSFileReadingWritingClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

uint64_t __40__NSFileReadingWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3
{
  v11[5] = *MEMORY[0x1E4F143B8];
  if ([(NSFileAccessClaim *)self didWait])
  {
    id v5 = [(NSFileAccessNode *)self->_readingLocation standardizedURL];
    if (v5)
    {
      uint64_t v6 = v5;

      self->_readingURL = (NSURL *)[v6 copy];
      self->_readingURLDidChange = 1;
    }
    id v7 = [(NSFileAccessNode *)self->_writingLocation standardizedURL];
    if (v7)
    {
      uint64_t v8 = v7;

      self->_writingURL = (NSURL *)[v8 copy];
      self->_writingURLDidChange = 1;
    }
  }
  if ([(NSFileAccessClaim *)self claimerError])
  {
    BOOL v9 = (void (*)(id, void, void))*((void *)a3 + 2);
    v9(a3, 0, 0);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke;
    v11[3] = &unk_1E51FC970;
    v11[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3;
    v10[3] = &unk_1E51F9B10;
    v10[4] = self;
    v10[5] = a3;
    __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke((uint64_t)v11, (uint64_t)v10);
  }
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke(uint64_t a1, uint64_t a2)
{
  void v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 224) & 2) == 0) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  uint64_t v4 = *(void *)(v3 + 208);
  if (!v4) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2;
  v6[3] = &unk_1E51FC948;
  v6[4] = v3;
  uint64_t result = [(id)v3 checkIfSymbolicLinkAtURL:v4 withResolutionCount:v3 + 280 andIfSoThenReevaluateSelf:v6];
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[32];
  uint64_t v4 = [v2 purposeID];
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 224);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4;
  v8[3] = &unk_1E51FC998;
  long long v9 = v5;
  return [v2 makeProviderOfItemAtLocation:v3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v4 readingOptions:v6 thenContinue:v8];
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[33];
  uint64_t v6 = [v4 purposeID];
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 248);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5;
  v10[3] = &unk_1E51FCA38;
  v10[4] = a2;
  long long v11 = v7;
  return [v4 makeProviderOfItemAtLocation:v5 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v6 writingOptions:v8 thenContinue:v10];
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __42__NSFileReadingWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6[20])
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v20 = atomic_load(_NSFCDisableLogSuppression), (v20 & 1) != 0)
      || (uint64_t v21 = atomic_load(&_NSFCSubarbitratedClaimCount), v21 <= 99))
    {
      uint64_t v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v9;
        _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(void, void, uint64_t, uint64_t, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160)
                                                                              + 16))(*(void *)(*(void *)(a1 + 32) + 160), *(void *)(a1 + 32), a2, a3, *(void *)(*(void *)(a1 + 32) + 176), [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160) = 0;
    uint64_t v6 = *(void **)(a1 + 32);
  }
  if (v6[21])
  {
    uint64_t v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (unsigned __int8 v22 = atomic_load(_NSFCDisableLogSuppression), (v22 & 1) != 0)
      || (uint64_t v23 = atomic_load(&_NSFCSubarbitratedClaimCount), v23 <= 99))
    {
      long long v11 = _NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v12;
        _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    if (a2) {
      unsigned __int8 v13 = +[NSURLPromisePair pairWithURL:a2];
    }
    else {
      unsigned __int8 v13 = (NSURLPromisePair *)[MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v14 = v13;
    if (a3) {
      v15 = +[NSURLPromisePair pairWithURL:a3];
    }
    else {
      v15 = (NSURLPromisePair *)[MEMORY[0x1E4F1CA98] null];
    }
    v16 = v15;
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 168);
    v26 = v14;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v25 = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v17 + 16))(v17, v18, [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1], *(void *)(*(void *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168) = 0;
    uint64_t v6 = *(void **)(a1 + 32);
  }
  v24.receiver = v6;
  v24.super_class = (Class)NSFileReadingWritingClaim;
  return objc_msgSendSuper2(&v24, sel_invokeClaimer);
}

- (id)allURLs
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = v3;
  if (self->_readingURL) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_writingURL) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (void)protectFilesAgainstEviction
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileReadingWritingClaim;
  [(NSFileAccessClaim *)&v3 dealloc];
}

- (NSFileReadingWritingClaim)initWithPurposeID:(id)a3 readingURL:(id)a4 options:(unint64_t)a5 writingURL:(id)a6 options:(unint64_t)a7 claimer:(id)a8
{
  unsigned __int8 v13 = [(NSFileAccessClaim *)self initWithClient:0 claimID:0 purposeID:a3];
  if (v13)
  {
    v13->_readingURL = (NSURL *)[a4 copy];
    v13->_readingOptions = (a5 << 14) & 0x20000 | a5;
    v13->_writingURL = (NSURL *)[a6 copy];
    v13->_writingOptions = a7;
    v13->super._claimerOrNil = (id)[a8 copy];
  }
  return v13;
}

- (NSFileReadingWritingClaim)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileReadingWritingClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
    }
    v4->_readingURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSReadingURLPairKey"), "URL");
    v4->_readingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSReadingOptionsKey"), "unsignedIntegerValue");
    v4->_writingURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSWritingURLPairKey"), "URL");
    v4->_writingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSWritingOptionsKey"), "unsignedIntegerValue");
  }
  return v4;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = [(NSFileAccessClaim *)self claimID];
    _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ blocked pending grantAccessClaim", buf, 0xCu);
  }
  [(NSFileAccessClaim *)self block];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v10[3] = &unk_1E51FA638;
  v10[4] = self;
  void v10[5] = a4;
  uint64_t v8 = (void *)[a3 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_409;
  v9[3] = &unk_1E51FC8A8;
  v9[4] = self;
  [v8 grantAccessClaim:self withReply:v9];
}

void __36__NSFileReadingWritingClaim_granted__block_invoke(uint64_t a1, int a2)
{
  v6[12] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4[33])
    {
      void v6[6] = MEMORY[0x1E4F143A8];
      v6[7] = 3221225472;
      v6[8] = __36__NSFileReadingWritingClaim_granted__block_invoke_2;
      v6[9] = &unk_1E51FCA10;
      v6[10] = v4;
      v6[11] = v3;
      objc_msgSend(v4, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
      uint64_t v4 = *(void **)(a1 + 32);
    }
    uint64_t v5 = v4[32];
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_4;
      v6[3] = &unk_1E51FCA10;
      v6[4] = v4;
      void v6[5] = v3;
      [v4 makePresentersOfItemAtLocation:v5 orContainedItem:0 relinquishUsingProcedureGetter:v6];
    }
  }
}

uint64_t __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [*(id *)(a1 + 32) claimID];
    int v8 = 138543618;
    uint64_t v9 = (__CFString *)v7;
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    uint64_t v9 = @"grantAccessClaim";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(256, *(void *)(*(void *)(a1 + 32) + 208)));
  }
  return [*(id *)(a1 + 32) unblock];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canReadingItemAtLocation:a3 options:a4 safelyOverlapNewWriting:1 ofItemAtLocation:self->_writingLocation options:self->_writingOptions] ^ 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = objc_opt_class();
  if ([v7 canReadingItemAtLocation:self->_readingLocation options:self->_readingOptions safelyOverlapNewWriting:0 ofItemAtLocation:a3 options:a4])return objc_msgSend(v7, "canNewWriteOfItemAtLocation:options:safelyOverlapExistingWriteOfItemAtLocation:options:", self->_writingLocation, self->_writingOptions, a3, a4) ^ 1; {
  else
  }
    return 1;
}

id __36__NSFileReadingWritingClaim_granted__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 248) causePresenterToRelinquish:a2])return 0; {
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_1E51FC9C0;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  void v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) purposeIDOfClaimOnItemAtLocation:*(void *)(*(void *)(a1 + 32) + 264) forMessagingPresenter:*(void *)(a1 + 40)];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) claimID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 248);
  uint64_t v8 = *(void *)(a1 + 48);

  return [v5 relinquishToWritingClaimWithID:v6 options:v7 purposeID:v4 subitemPath:v8 resultHandler:a2];
}

id __36__NSFileReadingWritingClaim_granted__block_invoke_4(uint64_t a1, void *a2)
{
  void v6[6] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldReadingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2]|| (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "reactorID")) & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_5;
  v6[3] = &unk_1E51FC8F8;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  return (id)[v6 copy];
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) claimID];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = v6[28];
  uint64_t v8 = [v6 purposeID];

  return [v4 relinquishToReadingClaimWithID:v5 options:v7 purposeID:v8 resultHandler:a2];
}

void *__36__NSFileReadingWritingClaim_granted__block_invoke_410(void *result, void *a2, uint64_t a3)
{
  id v3 = result;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    *(unsigned char *)(result[4] + 216) = 1;
    uint64_t v5 = *(void **)(result[4] + 208);
    if (v5 != a2)
    {

      uint64_t result = a2;
      *(void *)(v3[4] + 208) = result;
    }
  }
  else
  {
    uint64_t v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(id)v3[4] claimID];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      uint64_t v12 = a3;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Claim %{public}@ failed during preparing for uploading due to error: %@", (uint8_t *)&v9, 0x16u);
    }
    return (void *)[(id)v3[4] setClaimerError:a3];
  }
  return result;
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 208) = [a2 copy];
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[34];

  return [v4 evaluateSelfWithRootNode:v5 checkSubarbitrability:0];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_writingLocation == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_writingLocation = (NSFileAccessNode *)a4;
  }
  if (self->_readingLocation == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_readingLocation = (NSFileAccessNode *)a4;
  }
}

- (BOOL)blocksClaim:(id)a3
{
  if ([a3 isBlockedByReadingItemAtLocation:self->_readingLocation options:self->_readingOptions]) {
    return 1;
  }
  writingLocation = self->_writingLocation;
  unint64_t writingOptions = self->_writingOptions;

  return [a3 isBlockedByWritingItemAtLocation:writingLocation options:writingOptions];
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return (BYTE2(self->_readingOptions) >> 3) & 1;
}

@end