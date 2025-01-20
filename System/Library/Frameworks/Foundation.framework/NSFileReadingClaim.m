@interface NSFileReadingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)shouldBeRevokedPriorToInvokingAccessor;
- (BOOL)shouldCancelInsteadOfWaiting;
- (NSFileReadingClaim)initWithCoder:(id)a3;
- (NSFileReadingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6;
- (id)allURLs;
- (void)dealloc;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)granted;
- (void)invokeClaimer;
- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4;
- (void)protectFilesAgainstEviction;
- (void)resolveURLThenMaybeContinueInvokingClaimer:(id)a3;
@end

@implementation NSFileReadingClaim

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = _NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = [(NSFileAccessClaim *)self claimID];
    _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ blocked pending grantAccessClaim", buf, 0xCu);
  }
  [(NSFileAccessClaim *)self block];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v10[3] = &unk_1E51FA638;
  v10[4] = self;
  v10[5] = a4;
  v8 = (void *)[a3 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke_362;
  v9[3] = &unk_1E51FC8A8;
  v9[4] = self;
  [v8 grantAccessClaim:self withReply:v9];
}

uint64_t __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke_362(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v11 = _NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [*(id *)(a1 + 32) claimID];
    int v17 = 138543362;
    uint64_t v18 = v13;
    _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v17, 0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }
  else if (a6)
  {
LABEL_3:
    id v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [*(id *)(a1 + 32) claimID];
      int v17 = 138543618;
      uint64_t v18 = v16;
      __int16 v19 = 2114;
      uint64_t v20 = a6;
      _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }
  v14 = (void *)[a2 firstObject];
  if (objc_opt_isKindOfClass())
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v14, "URL"), "copy");
    *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_location)
  {
    uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (unsigned __int8 v10 = atomic_load(_NSFCDisableLogSuppression), (v10 & 1) != 0)
      || (uint64_t v11 = atomic_load(&_NSFCSubarbitratedClaimCount), v11 <= 99))
    {
      v4 = _NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }
    location = self->_location;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&location count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __29__NSFileReadingClaim_granted__block_invoke;
    v15[3] = &unk_1E51F8F20;
    v15[4] = self;
    [(NSFileAccessClaim *)self makeProvidersProvideItemsForReadingLocations:v5 options:&self->_options andWritingLocationsIfNecessary:0 options:0 thenContinue:v15];
  }
  else if (self->super._client)
  {
    v6 = _NSFCClaimsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = [(NSFileAccessClaim *)self claimID];
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "Claim %{public}@ can't be granted in daemon", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
      || (uint64_t v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 99))
    {
      v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }
    if ((self->_options & 8) != 0)
    {
      url = self->_url;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __29__NSFileReadingClaim_granted__block_invoke_366;
      v14[3] = &unk_1E51F8188;
      v14[4] = self;
      [(NSFileAccessClaim *)self prepareItemForUploadingFromURL:url thenContinue:v14];
    }
  }
  [(NSFileAccessClaim *)self unblockClaimerForReason:@"Initial blockage"];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileReadingClaim;
  [(NSFileAccessClaim *)&v3 dealloc];
}

- (id)allURLs
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_url, 0);
}

- (NSFileReadingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6
{
  v9 = [(NSFileAccessClaim *)self initWithClient:0 claimID:0 purposeID:a3];
  if (v9)
  {
    v9->_url = (NSURL *)[a4 copy];
    v9->_options = (a5 << 14) & 0x20000 | a5;
    v9->super._claimerOrNil = (id)[a6 copy];
  }
  return v9;
}

- (void)devalueSelf
{
  v5[5] = *MEMORY[0x1E4F143B8];
  location = self->_location;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__NSFileReadingClaim_devalueSelf__block_invoke;
  v5[3] = &unk_1E51FC8D0;
  v5[4] = self;
  [(NSFileAccessNode *)location forEachRelevantAccessClaimPerformProcedure:v5];
  [(NSFileAccessNode *)self->_location removeAccessClaim:self];
  self->_location = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSFileReadingClaim;
  [(NSFileAccessClaim *)&v4 devalueSelf];
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_url];
  if (!v7) {
    return 1;
  }
  v8 = v7;
  uint64_t v13 = 0;
  if (v4 && ![(NSFileAccessNode *)v7 itemIsSubarbitrable])
  {
    BOOL v10 = 0;
  }
  else
  {
    v14[0] = v8;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1], 1, &v13))
    {
      self->_location = v8;
      [(NSFileAccessNode *)v8 addAccessClaim:self];
      if ((self->_options & 2) != 0) {
        self->_rootNode = (NSFileAccessNode *)a3;
      }
      location = self->_location;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__NSFileReadingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v12[3] = &unk_1E51FC8D0;
      v12[4] = self;
      [(NSFileAccessNode *)location forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v12];
    }
    else
    {
      [(NSFileAccessClaim *)self setClaimerError:v13];
    }
    BOOL v10 = 1;
  }
  [(NSFileAccessNode *)v8 removeSelfIfUseless];
  return v10;
}

uint64_t __69__NSFileReadingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __33__NSFileReadingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url), @"NSURLPairKey");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options), @"NSURLOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)NSFileReadingClaim;
  [(NSFileAccessClaim *)&v5 encodeWithCoder:a3];
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__NSFileReadingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E51FC948;
  v2[4] = self;
  [(NSFileReadingClaim *)self resolveURLThenMaybeContinueInvokingClaimer:v2];
}

- (void)resolveURLThenMaybeContinueInvokingClaimer:(id)a3
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  if ([(NSFileAccessClaim *)self didWait])
  {
    id v5 = [(NSFileAccessNode *)self->_location standardizedURL];
    if (v5)
    {
      uint64_t v6 = v5;

      self->_url = (NSURL *)[v6 copy];
      self->_urlDidChange = 1;
    }
  }
  if ([(NSFileAccessClaim *)self claimerError])
  {
    uint64_t v7 = (void (*)(id, void))*((void *)a3 + 2);
    v7(a3, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke;
    v9[3] = &unk_1E51FC970;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_3;
    v8[3] = &unk_1E51F9B10;
    v8[4] = self;
    v8[5] = a3;
    __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke((uint64_t)v9, (uint64_t)v8);
  }
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[29];
  uint64_t v4 = [v2 purposeID];
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 224);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_4;
  v8[3] = &unk_1E51FC998;
  long long v9 = v5;
  return [v2 makeProviderOfItemAtLocation:v3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v4 readingOptions:v6 thenContinue:v8];
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 224) & 2) != 0 && (uint64_t v4 = *(void *)(v3 + 208)) != 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_2;
    v7[3] = &unk_1E51FC948;
    v7[4] = v3;
    uint64_t result = [(id)v3 checkIfSymbolicLinkAtURL:v4 withResolutionCount:v3 + 248 andIfSoThenReevaluateSelf:v7];
    if ((result & 1) == 0) {
      return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    }
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t))(a2 + 16);
    return v6(a2);
  }
  return result;
}

id __35__NSFileReadingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[20])
  {
    uint64_t v5 = atomic_load(&_NSFCSubarbitrationCount);
    if (v5 < 1
      || (unsigned __int8 v14 = atomic_load(_NSFCDisableLogSuppression), (v14 & 1) != 0)
      || (uint64_t v15 = atomic_load(&_NSFCSubarbitratedClaimCount), v15 <= 99))
    {
      uint64_t v6 = _NSFCClaimsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v7;
        _os_log_impl(&dword_181795000, v6, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(void, void, uint64_t, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160) + 16))(*(void *)(*(void *)(a1 + 32) + 160), *(void *)(a1 + 32), a2, *(void *)(*(void *)(a1 + 32) + 176), [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160) = 0;
    uint64_t v4 = *(void **)(a1 + 32);
  }
  if (v4[21])
  {
    uint64_t v8 = atomic_load(&_NSFCSubarbitrationCount);
    if (v8 < 1
      || (unsigned __int8 v16 = atomic_load(_NSFCDisableLogSuppression), (v16 & 1) != 0)
      || (uint64_t v17 = atomic_load(&_NSFCSubarbitratedClaimCount), v17 <= 99))
    {
      long long v9 = _NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v10;
        _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 168);
    unsigned __int8 v12 = +[NSURLPromisePair pairWithURL:a2];
    if (!v12) {
      unsigned __int8 v12 = (NSURLPromisePair *)[MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v19 = v12;
    (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v11 + 16))(v11, [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1], 0, *(void *)(*(void *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168) = 0;
    uint64_t v4 = *(void **)(a1 + 32);
  }
  v18.receiver = v4;
  v18.super_class = (Class)NSFileReadingClaim;
  return objc_msgSendSuper2(&v18, sel_invokeClaimer);
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (void)protectFilesAgainstEviction
{
}

- (NSFileReadingClaim)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileReadingClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
    }
    v4->_url = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSURLPairKey"), "URL");
    v4->_options = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSURLOptionsKey"), "unsignedIntegerValue");
  }
  return v4;
}

uint64_t __29__NSFileReadingClaim_granted__block_invoke(uint64_t result, int a2)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v2 = *(void **)(result + 32);
    uint64_t v3 = v2[29];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __29__NSFileReadingClaim_granted__block_invoke_2;
    v4[3] = &unk_1E51FC920;
    v4[4] = v2;
    return [v2 makePresentersOfItemAtLocation:v3 orContainedItem:0 relinquishUsingProcedureGetter:v4];
  }
  return result;
}

uint64_t __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [*(id *)(a1 + 32) claimID];
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(256, *(void *)(*(void *)(a1 + 32) + 208)));
  }
  return [*(id *)(a1 + 32) unblock];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canReadingItemAtLocation:self->_location options:self->_options safelyOverlapNewWriting:0 ofItemAtLocation:a3 options:a4] ^ 1;
}

id __29__NSFileReadingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[6] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldReadingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2])return 0; {
  v6[0] = MEMORY[0x1E4F143A8];
  }
  v6[1] = 3221225472;
  v6[2] = __29__NSFileReadingClaim_granted__block_invoke_3;
  v6[3] = &unk_1E51FC8F8;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v4;
  return (id)[v6 copy];
}

uint64_t __29__NSFileReadingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) claimID];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = v6[28];
  uint64_t v8 = [v6 purposeID];

  return [v4 relinquishToReadingClaimWithID:v5 options:v7 purposeID:v8 resultHandler:a2];
}

void *__29__NSFileReadingClaim_granted__block_invoke_366(void *result, void *a2, uint64_t a3)
{
  uint64_t v3 = result;
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

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 208) = [a2 copy];
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[30];

  return [v4 evaluateSelfWithRootNode:v5 checkSubarbitrability:0];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_location == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_location = (NSFileAccessNode *)a4;
  }
}

- (BOOL)blocksClaim:(id)a3
{
  return [a3 isBlockedByReadingItemAtLocation:self->_location options:self->_options];
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return (BYTE2(self->_options) >> 3) & 1;
}

@end