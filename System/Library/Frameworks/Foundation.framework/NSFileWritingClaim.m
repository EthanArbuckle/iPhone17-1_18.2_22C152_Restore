@interface NSFileWritingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (NSFileWritingClaim)initWithCoder:(id)a3;
- (NSFileWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6;
- (id)allURLs;
- (void)dealloc;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)granted;
- (void)invokeClaimer;
- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4;
- (void)protectFilesAgainstEviction;
- (void)resolveURLsThenContinueInvokingClaimer:(id)a3;
@end

@implementation NSFileWritingClaim

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke_390(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v11 = _NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [*(id *)(a1 + 32) claimID];
    int v15 = 138543362;
    uint64_t v16 = v12;
    _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v15, 0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }
  else if (a6)
  {
LABEL_3:
    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }
  v13 = (void *)[a3 firstObject];
  if (objc_opt_isKindOfClass())
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v13, "URL"), "copy");
    *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
  }
  if (a4)
  {

    *(void *)(*(void *)(a1 + 32) + 176) = [a4 copy];
  }
  [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:a5];
  return [*(id *)(a1 + 32) unblock];
}

- (id)allURLs
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_url, 0);
}

uint64_t __29__NSFileWritingClaim_granted__block_invoke_4(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 232) itemProvider];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232);

  return objc_msgSend(v2, "observeEndOfWriteAtLocation:forAccessClaim:", v3);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileWritingClaim;
  [(NSFileAccessClaim *)&v3 dealloc];
}

- (NSFileWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6
{
  v9 = [(NSFileAccessClaim *)self initWithClient:0 claimID:0 purposeID:a3];
  if (v9)
  {
    v9->_url = (NSURL *)[a4 copy];
    v9->_options = a5;
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
  v5[2] = __33__NSFileWritingClaim_devalueSelf__block_invoke;
  v5[3] = &unk_1E51FC8D0;
  v5[4] = self;
  [(NSFileAccessNode *)location forEachRelevantAccessClaimPerformProcedure:v5];
  [(NSFileAccessNode *)self->_location removeAccessClaim:self];
  self->_location = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSFileWritingClaim;
  [(NSFileAccessClaim *)&v4 devalueSelf];
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  v6 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_url];
  if (!v6) {
    return 1;
  }
  v7 = v6;
  uint64_t v12 = 0;
  if (v4 && ![(NSFileAccessNode *)v6 itemIsSubarbitrable])
  {
    BOOL v9 = 0;
  }
  else
  {
    v13[0] = v7;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1], 0, &v12))
    {
      self->_location = v7;
      [(NSFileAccessNode *)v7 addAccessClaim:self];
      location = self->_location;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __69__NSFileWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v11[3] = &unk_1E51FC8D0;
      v11[4] = self;
      [(NSFileAccessNode *)location forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v11];
    }
    else
    {
      [(NSFileAccessClaim *)self setClaimerError:v12];
    }
    BOOL v9 = 1;
  }
  [(NSFileAccessNode *)v7 removeSelfIfUseless];
  return v9;
}

uint64_t __69__NSFileWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __33__NSFileWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
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
  v5.super_class = (Class)NSFileWritingClaim;
  [(NSFileAccessClaim *)&v5 encodeWithCoder:a3];
}

- (void)granted
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_location)
  {
    uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (unsigned __int8 v9 = atomic_load(_NSFCDisableLogSuppression), (v9 & 1) != 0)
      || (uint64_t v10 = atomic_load(&_NSFCSubarbitratedClaimCount), v10 <= 99))
    {
      BOOL v4 = _NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }
    location = self->_location;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&location count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __29__NSFileWritingClaim_granted__block_invoke;
    v14[3] = &unk_1E51F8F20;
    v14[4] = self;
    [(NSFileAccessClaim *)self makeProvidersProvideItemsForReadingLocations:0 options:0 andWritingLocationsIfNecessary:v5 options:&self->_options thenContinue:v14];
    if ([(NSFileAccessClaim *)self shouldInformProvidersAboutEndOfWriteWithOptions:self->_options])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __29__NSFileWritingClaim_granted__block_invoke_4;
      v13[3] = &unk_1E51F71D0;
      v13[4] = self;
      [(NSFileAccessClaim *)self whenRevokedPerformProcedure:v13];
    }
  }
  else if (self->super._client)
  {
    uint64_t v6 = _NSFCClaimsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = [(NSFileAccessClaim *)self claimID];
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "Claim %{public}@ can't be granted in daemon", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v11 = atomic_load(_NSFCDisableLogSuppression), (v11 & 1) != 0)
      || (uint64_t v12 = atomic_load(&_NSFCSubarbitratedClaimCount), v12 <= 99))
    {
      v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }
  }
  [(NSFileAccessClaim *)self unblockClaimerForReason:@"Initial blockage"];
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__NSFileWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E51FC948;
  v2[4] = self;
  [(NSFileWritingClaim *)self resolveURLsThenContinueInvokingClaimer:v2];
}

- (void)resolveURLsThenContinueInvokingClaimer:(id)a3
{
  v11[6] = *MEMORY[0x1E4F143B8];
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
    location = self->_location;
    id v9 = [(NSFileAccessClaim *)self purposeID];
    unint64_t options = self->_options;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__NSFileWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke;
    v11[3] = &unk_1E51FC9E8;
    v11[4] = self;
    void v11[5] = a3;
    [(NSFileAccessClaim *)self makeProviderOfItemAtLocation:location provideOrAttachPhysicalURLIfNecessaryForPurposeID:v9 writingOptions:options thenContinue:v11];
  }
}

uint64_t __61__NSFileWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 216)) {
      a2 = *(void *)(v4 + 208);
    }
    else {
      a2 = 0;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

id __35__NSFileWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2)
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
    (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160) + 16))(*(void *)(*(void *)(a1 + 32) + 160), *(void *)(a1 + 32), a2, [*(id *)(a1 + 32) claimerError]);

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
      id v9 = _NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v10;
        _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 168);
    uint64_t v12 = +[NSURLPromisePair pairWithURL:a2];
    if (!v12) {
      uint64_t v12 = (NSURLPromisePair *)[MEMORY[0x1E4F1CA98] null];
    }
    v19 = v12;
    (*(void (**)(uint64_t, void, uint64_t, void, uint64_t, uint64_t))(v11 + 16))(v11, 0, [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1], *(void *)(*(void *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168) = 0;
    uint64_t v4 = *(void **)(a1 + 32);
  }
  v18.receiver = v4;
  v18.super_class = (Class)NSFileWritingClaim;
  return objc_msgSendSuper2(&v18, sel_invokeClaimer);
}

- (void)protectFilesAgainstEviction
{
}

- (NSFileWritingClaim)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileWritingClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
    }
    v4->_url = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSURLPairKey"), "URL");
    v4->_unint64_t options = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSURLOptionsKey"), "unsignedIntegerValue");
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
  v10[2] = __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v10[3] = &unk_1E51FA638;
  v10[4] = self;
  v10[5] = a4;
  uint64_t v8 = (void *)[a3 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke_390;
  v9[3] = &unk_1E51FC8A8;
  v9[4] = self;
  [v8 grantAccessClaim:self withReply:v9];
}

uint64_t __29__NSFileWritingClaim_granted__block_invoke(uint64_t result, int a2)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v2 = *(void **)(result + 32);
    BOOL v3 = (v2[28] & 0x13000BLL) != 0;
    uint64_t v4 = v2[29];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __29__NSFileWritingClaim_granted__block_invoke_2;
    v5[3] = &unk_1E51FC920;
    v5[4] = v2;
    return [v2 makePresentersOfItemAtLocation:v4 orContainedItem:v3 relinquishUsingProcedureGetter:v5];
  }
  return result;
}

uint64_t __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [*(id *)(a1 + 32) claimID];
    int v8 = 138543618;
    id v9 = (__CFString *)v7;
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = @"grantAccessClaim";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(512, *(void *)(*(void *)(a1 + 32) + 208)));
  }
  return [*(id *)(a1 + 32) unblock];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canReadingItemAtLocation:a3 options:a4 safelyOverlapNewWriting:1 ofItemAtLocation:self->_location options:self->_options] ^ 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canNewWriteOfItemAtLocation:self->_location options:self->_options safelyOverlapExistingWriteOfItemAtLocation:a3 options:a4] ^ 1;
}

id __29__NSFileWritingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2])return 0; {
  v7[0] = MEMORY[0x1E4F143A8];
  }
  v7[1] = 3221225472;
  v7[2] = __29__NSFileWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_1E51FC9C0;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __29__NSFileWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) purposeIDOfClaimOnItemAtLocation:*(void *)(*(void *)(a1 + 32) + 232) forMessagingPresenter:*(void *)(a1 + 40)];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) claimID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 224);
  uint64_t v8 = *(void *)(a1 + 48);

  return [v5 relinquishToWritingClaimWithID:v6 options:v7 purposeID:v4 subitemPath:v8 resultHandler:a2];
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
  return [a3 isBlockedByWritingItemAtLocation:self->_location options:self->_options];
}

@end