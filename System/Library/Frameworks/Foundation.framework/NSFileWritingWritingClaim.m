@interface NSFileWritingWritingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (NSFileWritingWritingClaim)initWithCoder:(id)a3;
- (NSFileWritingWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 url:(id)a6 options:(unint64_t)a7 claimer:(id)a8;
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

@implementation NSFileWritingWritingClaim

- (NSFileWritingWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 url:(id)a6 options:(unint64_t)a7 claimer:(id)a8
{
  v13 = [(NSFileAccessClaim *)self initWithClient:0 claimID:0 purposeID:a3];
  if (v13)
  {
    v13->_url1 = (NSURL *)[a4 copy];
    v13->_options1 = a5;
    v13->_url2 = (NSURL *)[a6 copy];
    v13->_options2 = a7;
    v13->super._claimerOrNil = (id)[a8 copy];
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileWritingWritingClaim;
  [(NSFileAccessClaim *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url1), @"NSURLPair1Key");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options1), @"NSOptions1Key");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url2), @"NSURLPair2Key");
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options2), @"NSOptions2Key");
  v5.receiver = self;
  v5.super_class = (Class)NSFileWritingWritingClaim;
  [(NSFileAccessClaim *)&v5 encodeWithCoder:a3];
}

- (NSFileWritingWritingClaim)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileWritingWritingClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
    }
    v4->_url1 = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSURLPair1Key"), "URL");
    v4->_options1 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSOptions1Key"), "unsignedIntegerValue");
    v4->_url2 = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSURLPair2Key"), "URL");
    v4->_options2 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSOptions2Key"), "unsignedIntegerValue");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  v10[2] = __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v10[3] = &unk_1E51FA638;
  v10[4] = self;
  v10[5] = a4;
  v8 = (void *)[a3 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_441;
  v9[3] = &unk_1E51FC8A8;
  v9[4] = self;
  [v8 grantAccessClaim:self withReply:v9];
}

uint64_t __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [*(id *)(a1 + 32) claimID];
    int v8 = 138543618;
    v9 = (__CFString *)v7;
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_super v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    v9 = @"grantAccessClaim";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(512, *(void *)(*(void *)(a1 + 32) + 208)));
  }
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_441(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = _NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [*(id *)(a1 + 32) claimID];
    int v18 = 138543362;
    uint64_t v19 = v13;
    _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v18, 0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }
  else if (a6)
  {
LABEL_3:
    uint64_t v12 = _NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [*(id *)(a1 + 32) claimID];
      int v18 = 138543618;
      uint64_t v19 = v17;
      __int16 v20 = 2114;
      uint64_t v21 = a6;
      _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }
  v14 = (void *)[a3 firstObject];
  if (objc_opt_isKindOfClass())
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v14, "URL"), "copy");
    *(unsigned char *)(*(void *)(a1 + 32) + 216) = 1;
  }
  if ((unint64_t)[a3 count] < 2) {
    v15 = 0;
  }
  else {
    v15 = (void *)[a3 objectAtIndex:1];
  }
  if (objc_opt_isKindOfClass())
  {

    *(void *)(*(void *)(a1 + 32) + 232) = objc_msgSend((id)objc_msgSend(v15, "URL"), "copy");
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
  }
  if (a4)
  {

    *(void *)(*(void *)(a1 + 32) + 176) = [a4 copy];
  }
  [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:a5];
  return [*(id *)(a1 + 32) unblock];
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_url1];
  uint64_t v8 = [a3 descendantForFileURL:self->_url2];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return 1;
  }
  uint64_t v11 = (NSFileAccessNode *)v8;
  uint64_t v17 = 0;
  if (!v4
    || [(NSFileAccessNode *)v7 itemIsSubarbitrable]
    && [(NSFileAccessNode *)v11 itemIsSubarbitrable])
  {
    v18[0] = v7;
    v18[1] = v11;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:](self, "canAccessLocations:forReading:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2], 0, &v17))
    {
      self->_location1 = v7;
      [(NSFileAccessNode *)v7 addAccessClaim:self];
      self->_location2 = v11;
      [(NSFileAccessNode *)v11 addAccessClaim:self];
      location1 = self->_location1;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v16[3] = &unk_1E51FC8D0;
      v16[4] = self;
      [(NSFileAccessNode *)location1 forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v16];
      location2 = self->_location2;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v15[3] = &unk_1E51FC8D0;
      v15[4] = self;
      [(NSFileAccessNode *)location2 forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v15];
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
  [(NSFileAccessNode *)v7 removeSelfIfUseless];
  [(NSFileAccessNode *)v11 removeSelfIfUseless];
  return v10;
}

uint64_t __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = objc_opt_class();
  LOBYTE(v8) = 1;
  if ([v7 canReadingItemAtLocation:a3 options:a4 safelyOverlapNewWriting:1 ofItemAtLocation:self->_location1 options:self->_options1])return objc_msgSend(v7, "canReadingItemAtLocation:options:safelyOverlapNewWriting:ofItemAtLocation:options:", a3, a4, 1, self->_location2, self->_options2) ^ 1; {
  return v8;
  }
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = objc_opt_class();
  if ([v7 canNewWriteOfItemAtLocation:self->_location1 options:self->_options1 safelyOverlapExistingWriteOfItemAtLocation:a3 options:a4])return objc_msgSend(v7, "canNewWriteOfItemAtLocation:options:safelyOverlapExistingWriteOfItemAtLocation:options:", self->_location2, self->_options2, a3, a4) ^ 1; {
  else
  }
    return 1;
}

- (void)granted
{
  buf[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (unsigned __int8 v11 = atomic_load(_NSFCDisableLogSuppression), (v11 & 1) != 0)
    || (uint64_t v12 = atomic_load(&_NSFCSubarbitratedClaimCount), v12 <= 99))
  {
    if (self->_location1 || self->_location2)
    {
      BOOL v4 = _NSFCClaimsLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = [(NSFileAccessClaim *)self claimID];
      objc_super v5 = "Claim %{public}@ granted in server";
    }
    else
    {
      BOOL v4 = _NSFCClaimsLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = [(NSFileAccessClaim *)self claimID];
      objc_super v5 = "Claim %{public}@ granted in client";
    }
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)buf, 0xCu);
  }
LABEL_7:
  if (self->_location1 || self->_location2)
  {
    objc_super v6 = malloc_type_malloc(0x10uLL, 0x100004000313F17uLL);
    uint64_t v7 = v6;
    location1 = self->_location1;
    if (location1)
    {
      buf[0] = self->_location1;
      *objc_super v6 = self->_options1;
      LODWORD(location1) = 1;
    }
    location2 = self->_location2;
    if (location2)
    {
      buf[location1] = location2;
      v6[location1] = self->_options2;
      LODWORD(location1) = location1 + 1;
    }
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:location1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__NSFileWritingWritingClaim_granted__block_invoke;
    v14[3] = &unk_1E51FCA88;
    v14[4] = self;
    v14[5] = v7;
    [(NSFileAccessClaim *)self makeProvidersProvideItemsForReadingLocations:0 options:0 andWritingLocationsIfNecessary:v10 options:v7 thenContinue:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_6;
    v13[3] = &unk_1E51F71D0;
    v13[4] = self;
    [(NSFileAccessClaim *)self whenRevokedPerformProcedure:v13];
  }
  [(NSFileAccessClaim *)self unblockClaimerForReason:@"Initial blockage"];
}

void __36__NSFileWritingWritingClaim_granted__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3[32])
    {
      objc_msgSend(v3, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
      uint64_t v3 = *(void **)(a1 + 32);
    }
    if (v3[33]) {
      objc_msgSend(v3, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
    }
  }
  free(*(void **)(a1 + 40));
}

id __36__NSFileWritingWritingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2])return 0; {
  v7[0] = MEMORY[0x1E4F143A8];
  }
  v7[1] = 3221225472;
  v7[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_1E51FC9C0;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) purposeIDOfClaimOnItemAtLocation:*(void *)(*(void *)(a1 + 32) + 256) forMessagingPresenter:*(void *)(a1 + 40)];
  objc_super v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) claimID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 224);
  uint64_t v8 = *(void *)(a1 + 48);

  return [v5 relinquishToWritingClaimWithID:v6 options:v7 purposeID:v4 subitemPath:v8 resultHandler:a2];
}

id __36__NSFileWritingWritingClaim_granted__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 248) causePresenterToRelinquish:a2])return 0; {
  v7[0] = MEMORY[0x1E4F143A8];
  }
  v7[1] = 3221225472;
  v7[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_5;
  v7[3] = &unk_1E51FC9C0;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) purposeIDOfClaimOnItemAtLocation:*(void *)(*(void *)(a1 + 32) + 264) forMessagingPresenter:*(void *)(a1 + 40)];
  objc_super v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) claimID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 248);
  uint64_t v8 = *(void *)(a1 + 48);

  return [v5 relinquishToWritingClaimWithID:v6 options:v7 purposeID:v4 subitemPath:v8 resultHandler:a2];
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 256))
  {
    int v3 = [(id)result shouldInformProvidersAboutEndOfWriteWithOptions:*(void *)(result + 224)];
    uint64_t result = *(void *)(a1 + 32);
    if (v3)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(result + 256), "itemProvider"), "observeEndOfWriteAtLocation:forAccessClaim:", *(void *)(*(void *)(a1 + 32) + 256));
      uint64_t result = *(void *)(a1 + 32);
    }
  }
  if (*(void *)(result + 264))
  {
    uint64_t result = [(id)result shouldInformProvidersAboutEndOfWriteWithOptions:*(void *)(result + 248)];
    if (result)
    {
      uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 264) itemProvider];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 264);
      return objc_msgSend(v4, "observeEndOfWriteAtLocation:forAccessClaim:", v5);
    }
  }
  return result;
}

- (void)resolveURLsThenContinueInvokingClaimer:(id)a3
{
  v13[7] = *MEMORY[0x1E4F143B8];
  if ([(NSFileAccessClaim *)self didWait])
  {
    id v5 = [(NSFileAccessNode *)self->_location1 standardizedURL];
    if (v5)
    {
      uint64_t v6 = v5;

      self->_url1 = (NSURL *)[v6 copy];
      self->_url1DidChange = 1;
    }
    id v7 = [(NSFileAccessNode *)self->_location2 standardizedURL];
    if (v7)
    {
      uint64_t v8 = v7;

      self->_url2 = (NSURL *)[v8 copy];
      self->_url2DidChange = 1;
    }
  }
  if ([(NSFileAccessClaim *)self claimerError])
  {
    BOOL v9 = (void (*)(id, void, void))*((void *)a3 + 2);
    v9(a3, 0, 0);
  }
  else
  {
    id v10 = [(NSFileAccessClaim *)self purposeID];
    location1 = self->_location1;
    unint64_t options1 = self->_options1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke;
    v13[3] = &unk_1E51FCA38;
    v13[4] = self;
    void v13[5] = v10;
    v13[6] = a3;
    [(NSFileAccessClaim *)self makeProviderOfItemAtLocation:location1 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v10 writingOptions:options1 thenContinue:v13];
  }
}

uint64_t __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke(void *a1, uint64_t a2)
{
  v8[7] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = v3[33];
  uint64_t v5 = v3[31];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke_2;
  v8[3] = &unk_1E51FCAB0;
  uint64_t v6 = a1[6];
  v8[5] = v3;
  v8[6] = v6;
  v8[4] = a2;
  return [v3 makeProviderOfItemAtLocation:v4 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v2 writingOptions:v5 thenContinue:v8];
}

uint64_t __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[4];
  if (v5)
  {
LABEL_4:
    if (a2) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
    }
    goto LABEL_5;
  }
  uint64_t v6 = a1[5];
  if (*(unsigned char *)(v6 + 216))
  {
    uint64_t v5 = *(void *)(v6 + 208);
    goto LABEL_4;
  }
  uint64_t v5 = 0;
  if (a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
  }
LABEL_5:
  uint64_t v7 = a1[5];
  if (*(unsigned char *)(v7 + 240)) {
    a2 = *(void *)(v7 + 232);
  }
  else {
    a2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__NSFileWritingWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E51FCA60;
  v2[4] = self;
  [(NSFileWritingWritingClaim *)self resolveURLsThenContinueInvokingClaimer:v2];
}

id __42__NSFileWritingWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6[20])
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v18 = atomic_load(_NSFCDisableLogSuppression), (v18 & 1) != 0)
      || (uint64_t v19 = atomic_load(&_NSFCSubarbitratedClaimCount), v19 <= 99))
    {
      uint64_t v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v9;
        _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160) + 16))(*(void *)(*(void *)(a1 + 32) + 160), *(void *)(a1 + 32), a2, a3, [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160) = 0;
    uint64_t v6 = *(void **)(a1 + 32);
  }
  if (v6[21])
  {
    uint64_t v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (unsigned __int8 v20 = atomic_load(_NSFCDisableLogSuppression), (v20 & 1) != 0)
      || (uint64_t v21 = atomic_load(&_NSFCSubarbitratedClaimCount), v21 <= 99))
    {
      unsigned __int8 v11 = _NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v12;
        _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    if (a2) {
      uint64_t v13 = +[NSURLPromisePair pairWithURL:a2];
    }
    else {
      uint64_t v13 = (NSURLPromisePair *)[MEMORY[0x1E4F1CA98] null];
    }
    v14 = v13;
    if (a3) {
      v15 = +[NSURLPromisePair pairWithURL:a3];
    }
    else {
      v15 = (NSURLPromisePair *)[MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 168);
    v23[0] = v14;
    v23[1] = v15;
    (*(void (**)(uint64_t, void, uint64_t, void, uint64_t, uint64_t))(v16 + 16))(v16, 0, [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2], *(void *)(*(void *)(a1 + 32) + 176), objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"), objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168) = 0;
    uint64_t v6 = *(void **)(a1 + 32);
  }
  v22.receiver = v6;
  v22.super_class = (Class)NSFileWritingWritingClaim;
  return objc_msgSendSuper2(&v22, sel_invokeClaimer);
}

- (void)devalueSelf
{
  v7[5] = *MEMORY[0x1E4F143B8];
  location1 = self->_location1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NSFileWritingWritingClaim_devalueSelf__block_invoke;
  v7[3] = &unk_1E51FC8D0;
  v7[4] = self;
  [(NSFileAccessNode *)location1 forEachRelevantAccessClaimPerformProcedure:v7];
  location2 = self->_location2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__NSFileWritingWritingClaim_devalueSelf__block_invoke_2;
  v6[3] = &unk_1E51FC8D0;
  v6[4] = self;
  [(NSFileAccessNode *)location2 forEachRelevantAccessClaimPerformProcedure:v6];
  [(NSFileAccessNode *)self->_location1 removeAccessClaim:self];
  self->_location1 = 0;
  [(NSFileAccessNode *)self->_location2 removeAccessClaim:self];
  self->_location2 = 0;
  v5.receiver = self;
  v5.super_class = (Class)NSFileWritingWritingClaim;
  [(NSFileAccessClaim *)&v5 devalueSelf];
}

uint64_t __40__NSFileWritingWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

uint64_t __40__NSFileWritingWritingClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_location1 == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_location1 = (NSFileAccessNode *)a4;
  }
  if (self->_location2 == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_location2 = (NSFileAccessNode *)a4;
  }
}

- (BOOL)blocksClaim:(id)a3
{
  if ([a3 isBlockedByWritingItemAtLocation:self->_location1 options:self->_options1]) {
    return 1;
  }
  location2 = self->_location2;
  unint64_t options2 = self->_options2;

  return [a3 isBlockedByWritingItemAtLocation:location2 options:options2];
}

- (id)allURLs
{
  int v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = v3;
  if (self->_url1) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_url2) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (void)protectFilesAgainstEviction
{
  [(NSFileAccessClaim *)self _protectIfNecessaryFileAtURL:self->_url1 withOptions:self->_options1 forReading:0];
  url2 = self->_url2;
  unint64_t options2 = self->_options2;

  [(NSFileAccessClaim *)self _protectIfNecessaryFileAtURL:url2 withOptions:options2 forReading:0];
}

@end