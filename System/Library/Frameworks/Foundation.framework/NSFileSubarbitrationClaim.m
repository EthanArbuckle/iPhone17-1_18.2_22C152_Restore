@interface NSFileSubarbitrationClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)nullified;
- (NSFileSubarbitrationClaim)initWithCoder:(id)a3;
- (NSFileSubarbitrationClaim)initWithReadingURLs:(id)a3 options:(unint64_t)a4 writingURLs:(id)a5 options:(unint64_t)a6 claimer:(id)a7;
- (NSXPCConnection)subarbiterConnection;
- (id)descriptionWithIndenting:(id)a3;
- (id)relinquishmentForWrite:(BOOL)a3 toPresenterForID:(id)a4;
- (void)dealloc;
- (void)devalueOldClaim:(id)a3;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateNewClaim:(id)a3;
- (void)forwardReacquisitionForWritingClaim:(BOOL)a3 withID:(id)a4 toPresenterForID:(id)a5 usingReplySender:(id)a6;
- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 toPresenter:(id)a8 usingReplySender:(id)a9;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)forwardUsingConnection:(id)a3 withServer:(id)a4 crashHandler:(id)a5;
- (void)granted;
- (void)invokeClaimer;
- (void)revoked;
- (void)setSubarbiterConnection:(id)a3;
@end

@implementation NSFileSubarbitrationClaim

- (NSFileSubarbitrationClaim)initWithReadingURLs:(id)a3 options:(unint64_t)a4 writingURLs:(id)a5 options:(unint64_t)a6 claimer:(id)a7
{
  v12 = [(NSFileAccessClaim *)self initWithClient:0 claimID:0 purposeID:0];
  if (v12)
  {
    v12->_readingURLs = (NSArray *)[a3 copy];
    v12->_readingOptions = a4;
    v12->_writingURLs = (NSArray *)[a5 copy];
    v12->_writingOptions = a6;
    v12->super._claimerOrNil = (id)[a7 copy];
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileSubarbitrationClaim;
  [(NSFileAccessClaim *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeObject:self->_readingURLs forKey:@"NSReadingURLsKey"];
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_readingOptions), @"NSReadingOptionsKey");
  [a3 encodeObject:self->_writingURLs forKey:@"NSWritingURLsKey"];
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_writingOptions), @"NSWritingOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)NSFileSubarbitrationClaim;
  [(NSFileAccessClaim *)&v5 encodeWithCoder:a3];
}

- (NSFileSubarbitrationClaim)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NSFileSubarbitrationClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v15, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
    }
    objc_super v5 = (void *)[a3 allowedClasses];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    uint64_t v7 = objc_msgSend(v5, "setByAddingObjectsFromSet:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 2)));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v10 = __43__NSFileSubarbitrationClaim_initWithCoder___block_invoke;
    v11 = &unk_1E51FDFA0;
    id v12 = a3;
    uint64_t v13 = v7;
    v14 = v4;
    v4->_readingURLs = (NSArray *)objc_msgSend(__43__NSFileSubarbitrationClaim_initWithCoder___block_invoke((uint64_t)v9, @"NSReadingURLsKey"), "mutableCopy");
    v4->_writingURLs = (NSArray *)objc_msgSend(v10((uint64_t)v9, @"NSWritingURLsKey"), "mutableCopy");
    v4->_readingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSReadingOptionsKey"), "unsignedIntegerValue");
    v4->_writingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSWritingOptionsKey"), "unsignedIntegerValue");
    v4->_forwardedClaimIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_readRelinquishmentsByPresenterID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_writeRelinquishmentsByPresenterID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

void *__43__NSFileSubarbitrationClaim_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:a2];
  if (v4)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      v10 = +[NSString stringWithFormat:@"NSFileSubarbitrationClaim decoded the wrong class for key %@", a2];
LABEL_13:
      v11 = v10;

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v11 userInfo:0]);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = +[NSString stringWithFormat:@"NSFileSubarbitrationClaim decoded the wrong class for contents of %@", a2];
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionWithIndenting:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileSubarbitrationClaim;
  id result = -[NSFileAccessClaim descriptionWithIndenting:](&v6, sel_descriptionWithIndenting_);
  if (self->_nullified) {
    return (id)[result stringByAppendingFormat:@"\n%@    (nullified)", a3];
  }
  return result;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
}

- (void)forwardUsingConnection:(id)a3 withServer:(id)a4 crashHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9 = _NSFCClaimsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = [(NSFileAccessClaim *)self claimID];
    _os_log_debug_impl(&dword_181795000, v9, OS_LOG_TYPE_DEBUG, "Subarbitration claim %{public}@ blocked pending grantAccessClaim", buf, 0xCu);
  }
  [(NSFileAccessClaim *)self block];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke;
  v13[3] = &unk_1E51FA638;
  v13[4] = self;
  v13[5] = a5;
  v10 = (void *)[a3 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v11 = [a4 endpoint];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke_44;
  v12[3] = &unk_1E51F7FF8;
  v12[4] = self;
  [v10 grantSubarbitrationClaim:self withServer:v11 reply:v12];
}

uint64_t __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    v9 = @"grantSubarbitrationClaim";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 255, 0));
  }
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke_44(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [*(id *)(a1 + 32) claimID];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_debug_impl(&dword_181795000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", (uint8_t *)&v7, 0xCu);
    if (!a2) {
      return [*(id *)(a1 + 32) unblock];
    }
    goto LABEL_3;
  }
  if (a2) {
LABEL_3:
  }
    [*(id *)(a1 + 32) setClaimerError:a2];
  return [*(id *)(a1 + 32) unblock];
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    readingURLs = self->_readingURLs;
    uint64_t v8 = [(NSArray *)readingURLs countByEnumeratingWithState:&v91 objects:v90 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v92 != v9) {
            objc_enumerationMutation(readingURLs);
          }
          uint64_t v11 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v91 + 1) + 8 * i)];
          if (v11)
          {
            [v6 addObject:v11];
            [v11 addAccessClaim:self];
          }
        }
        uint64_t v8 = [(NSArray *)readingURLs countByEnumeratingWithState:&v91 objects:v90 count:16];
      }
      while (v8);
    }
    self->_readingLocations = (NSArray *)[v6 copy];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    writingURLs = self->_writingURLs;
    uint64_t v14 = [(NSArray *)writingURLs countByEnumeratingWithState:&v86 objects:v85 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v87 != v15) {
            objc_enumerationMutation(writingURLs);
          }
          uint64_t v17 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v86 + 1) + 8 * j)];
          if (v17)
          {
            [v12 addObject:v17];
            [v17 addAccessClaim:self];
          }
        }
        uint64_t v14 = [(NSArray *)writingURLs countByEnumeratingWithState:&v86 objects:v85 count:16];
      }
      while (v14);
    }
    self->_writingLocations = (NSArray *)[v12 copy];

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    BOOL v42 = v4;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    char v59 = 0;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
    v57[3] = &unk_1E51FDFF0;
    v57[4] = v18;
    v57[5] = self;
    v57[6] = v58;
    id v43 = v18;
    if ((self->_writingOptions & 9) != 0)
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      obuint64_t j = self->_writingLocations;
      uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v80 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v82;
        do
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v82 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v81 + 1) + 8 * k);
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_51;
            v56[3] = &unk_1E51FC798;
            v56[4] = v57;
            [v22 forEachPresenterOfItemOrContainedItemPerformProcedure:v56];
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_3;
            v55[3] = &unk_1E51FC770;
            v55[4] = v22;
            v55[5] = v57;
            [v22 forEachPresenterOfContainingFilePackagePerformProcedure:v55];
          }
          uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v81 objects:v80 count:16];
        }
        while (v19);
      }
    }
    if ((self->_readingOptions & 1) == 0)
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      obja = self->_readingLocations;
      uint64_t v23 = [(NSArray *)obja countByEnumeratingWithState:&v76 objects:v75 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v77;
        do
        {
          for (uint64_t m = 0; m != v23; ++m)
          {
            if (*(void *)v77 != v24) {
              objc_enumerationMutation(obja);
            }
            v26 = *(void **)(*((void *)&v76 + 1) + 8 * m);
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_5;
            v54[3] = &unk_1E51FC798;
            v54[4] = v57;
            [v26 forEachPresenterOfItemOrContainedItemPerformProcedure:v54];
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_7;
            v53[3] = &unk_1E51FE068;
            v53[4] = v57;
            [v26 forEachPresenterOfContainingFilePackagePerformProcedure:v53];
          }
          uint64_t v23 = [(NSArray *)obja countByEnumeratingWithState:&v76 objects:v75 count:16];
        }
        while (v23);
      }
    }
    if ((self->_writingOptions & 4) != 0)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      objb = self->_writingLocations;
      uint64_t v27 = [(NSArray *)objb countByEnumeratingWithState:&v71 objects:v70 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v72;
        do
        {
          for (uint64_t n = 0; n != v27; ++n)
          {
            if (*(void *)v72 != v28) {
              objc_enumerationMutation(objb);
            }
            v30 = *(void **)(*((void *)&v71 + 1) + 8 * n);
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_9;
            v52[3] = &unk_1E51FC798;
            v52[4] = v57;
            [v30 forEachPresenterOfItemOrContainedItemPerformProcedure:v52];
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_11;
            v51[3] = &unk_1E51FE068;
            v51[4] = v57;
            [v30 forEachPresenterOfContainingFilePackagePerformProcedure:v51];
          }
          uint64_t v27 = [(NSArray *)objb countByEnumeratingWithState:&v71 objects:v70 count:16];
        }
        while (v27);
      }
    }

    self->_rootNode = (NSFileAccessNode *)a3;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_13;
    v50[3] = &unk_1E51FE090;
    v50[4] = self;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    readingLocations = self->_readingLocations;
    uint64_t v32 = [(NSArray *)readingLocations countByEnumeratingWithState:&v66 objects:v65 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v67;
      do
      {
        for (iuint64_t i = 0; ii != v32; ++ii)
        {
          if (*(void *)v67 != v33) {
            objc_enumerationMutation(readingLocations);
          }
          v35 = *(void **)(*((void *)&v66 + 1) + 8 * ii);
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_65;
          v49[3] = &unk_1E51FDE80;
          v49[4] = self;
          v49[5] = v50;
          [v35 forEachRelevantAccessClaimPerformProcedure:v49];
        }
        uint64_t v32 = [(NSArray *)readingLocations countByEnumeratingWithState:&v66 objects:v65 count:16];
      }
      while (v32);
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    writingLocations = self->_writingLocations;
    uint64_t v37 = [(NSArray *)writingLocations countByEnumeratingWithState:&v61 objects:v60 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v62;
      do
      {
        for (juint64_t j = 0; jj != v37; ++jj)
        {
          if (*(void *)v62 != v38) {
            objc_enumerationMutation(writingLocations);
          }
          v40 = *(void **)(*((void *)&v61 + 1) + 8 * jj);
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2_67;
          v48[3] = &unk_1E51FDE80;
          v48[4] = self;
          v48[5] = v50;
          [v40 forEachRelevantAccessClaimPerformProcedure:v48];
        }
        uint64_t v37 = [(NSArray *)writingLocations countByEnumeratingWithState:&v61 objects:v60 count:16];
      }
      while (v37);
    }
    _Block_object_dispose(v58, 8);
    BOOL v4 = v42;
  }
  return !v4;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a2 reactorID];
  uint64_t result = [*(id *)(a1 + 32) containsObject:v7];
  if ((result & 1) == 0)
  {
    uint64_t v9 = _NSFCClaimsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 40) claimID];
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      uint64_t v18 = a3;
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Subarbitration claimer %{public}@ is waiting for %{public}@ response from presenter: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v11 = +[NSString stringWithFormat:@"Waiting for %@ response from presenter: %@", a3, v7];
    [*(id *)(a1 + 40) blockClaimerForReason:v11];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_49;
    v14[3] = &unk_1E51FDFC8;
    v14[4] = v7;
    v14[5] = a3;
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v14[7] = v11;
    v14[8] = v13;
    v14[6] = v12;
    return (*(uint64_t (**)(uint64_t, void *))(a4 + 16))(a4, v14);
  }
  return result;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_49(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) claimID];
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Presenter %{public}@ has sent a %@ response, unblocking subarbitration claimer: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  if (a2 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 48) setClaimerError:a2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  return [*(id *)(a1 + 48) unblockClaimerForReason:*(void *)(a1 + 56)];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
  v8[3] = &unk_1E51FE018;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, __CFString *, void *, uint64_t, uint64_t))(v6 + 16))(v6, a2, @"Accommodate Deletion", v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) accommodateDeletionWithSubitemPath:0 completionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:");
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_4;
  v7[3] = &unk_1E51FE040;
  v7[4] = a2;
  v7[5] = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t, __CFString *, void *))(v5 + 16))(v5, a2, @"Accommodate Deletion", v7);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) accommodateDeletionWithSubitemPath:*(void *)(a1 + 40) completionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_6;
  v8[3] = &unk_1E51FE018;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, __CFString *, void *, uint64_t, uint64_t))(v6 + 16))(v6, a2, @"Save Changes", v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_8;
  v8[3] = &unk_1E51FE018;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, __CFString *, void *, uint64_t, uint64_t))(v6 + 16))(v6, a2, @"Save Changes", v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_10;
  v8[3] = &unk_1E51FE018;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, __CFString *, void *, uint64_t, uint64_t))(v6 + 16))(v6, a2, @"Save Changes", v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_12;
  v8[3] = &unk_1E51FE018;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, __CFString *, void *, uint64_t, uint64_t))(v6 + 16))(v6, a2, @"Save Changes", v8, a5, a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_13(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2
    && [*(id *)(*(void *)(a1 + 32) + 248) count] == 1
    && (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a3, "purposeID"), "isEqualToString:", @"com.apple.desktopservices.copyengine"))
  {
    uint64_t v5 = _NSFCClaimsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) claimID];
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = [a3 claimID];
      uint64_t v7 = "Nullified subarbitration claim %{public}@ to work around a deadlock with claim: %{public}@";
LABEL_11:
      _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x16u);
      return 1;
    }
    return 1;
  }
  if (*(void **)(a1 + 32) != a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v5 = _NSFCClaimsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) claimID];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = [a3 claimID];
      uint64_t v7 = "Nullified subarbitration claim %{public}@ to because of a blocking subarbitration claim: %{public}@";
      goto LABEL_11;
    }
    return 1;
  }
  return 0;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(void *)(a1 + 32);
  if (result)
  {
    *(unsigned char *)(v5 + 296) = 1;
  }
  else
  {
    return [a2 evaluateNewClaim:v5];
  }
  return result;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2_67(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(void *)(a1 + 32);
  if (result)
  {
    *(unsigned char *)(v5 + 296) = 1;
  }
  else
  {
    return [a2 evaluateNewClaim:v5];
  }
  return result;
}

- (void)evaluateNewClaim:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 != self && ![(NSFileSubarbitrationClaim *)self nullified])
  {
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = _NSFCClaimsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = [a3 claimID];
        __int16 v13 = 2114;
        id v14 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v5, OS_LOG_TYPE_DEFAULT, "New subarbitration claim %{public}@ is blocked by subarbitration claim %{public}@", (uint8_t *)&v11, 0x16u);
      }
      uint64_t v6 = self;
      uint64_t v7 = a3;
LABEL_15:
      [v6 addPendingClaim:v7];
      return;
    }
    if (![(NSFileAccessClaim *)self isGranted])
    {
      int v10 = _NSFCClaimsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = [a3 claimID];
        __int16 v13 = 2114;
        id v14 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ is blocked by subarbitration claim %{public}@", (uint8_t *)&v11, 0x16u);
      }
      uint64_t v6 = a3;
      uint64_t v7 = self;
      goto LABEL_15;
    }
    uint64_t v8 = [a3 claimID];
    if (([(NSMutableSet *)self->_forwardedClaimIDs containsObject:v8] & 1) == 0)
    {
      [(NSMutableSet *)self->_forwardedClaimIDs addObject:v8];
      int v9 = _NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = [a3 claimID];
        __int16 v13 = 2114;
        id v14 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Forwarding claim %{public}@ to subarbiter for claim %{public}@ for evaluation there", (uint8_t *)&v11, 0x16u);
      }
      [a3 forwardUsingConnection:self->_subarbiterConnection crashHandler:&__block_literal_global_79];
    }
  }
}

uint64_t __46__NSFileSubarbitrationClaim_evaluateNewClaim___block_invoke()
{
  return 0;
}

- (void)devalueOldClaim:(id)a3
{
  if (a3 != self)
  {
    uint64_t v4 = [a3 claimID];
    if ([(NSMutableSet *)self->_forwardedClaimIDs containsObject:v4])
    {
      objc_msgSend(-[NSXPCConnection remoteObjectProxy](self->_subarbiterConnection, "remoteObjectProxy"), "revokeAccessClaimForID:", v4);
      forwardedClaimIDs = self->_forwardedClaimIDs;
      [(NSMutableSet *)forwardedClaimIDs removeObject:v4];
    }
  }
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 1;
}

- (void)granted
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  rootNode = self->_rootNode;
  uint64_t v4 = _NSFCClaimsLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (rootNode)
  {
    if (v5)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = [(NSFileAccessClaim *)self claimID];
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ granted in server", (uint8_t *)&buf, 0xCu);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke;
    v11[3] = &unk_1E51F71D0;
    v11[4] = self;
    if ((self->_readingOptions & 0x20000) != 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v18 = 0x2020000000;
      NSUInteger v19 = 0;
      NSUInteger v19 = [(NSArray *)self->_readingLocations count];
      if (*(void *)(*((void *)&buf + 1) + 24))
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_2;
        v10[3] = &unk_1E51FE0E0;
        v10[4] = v11;
        v10[5] = &buf;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        readingLocations = self->_readingLocations;
        uint64_t v7 = [(NSArray *)readingLocations countByEnumeratingWithState:&v13 objects:v12 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v14;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v14 != v8) {
                objc_enumerationMutation(readingLocations);
              }
              [(NSFileAccessClaim *)self makeProviderOfItemAtLocation:*(void *)(*((void *)&v13 + 1) + 8 * i) provideIfNecessaryWithOptions:self->_readingOptions thenContinue:v10];
            }
            uint64_t v7 = [(NSArray *)readingLocations countByEnumeratingWithState:&v13 objects:v12 count:16];
          }
          while (v7);
        }
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      __36__NSFileSubarbitrationClaim_granted__block_invoke((uint64_t)v11);
    }
  }
  else
  {
    if (v5)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = [(NSFileAccessClaim *)self claimID];
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ granted in client", (uint8_t *)&buf, 0xCu);
    }
    [(NSFileAccessClaim *)self unblockClaimerForReason:0x1ECA7C768];
  }
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 296))
  {
    objc_super v3 = _NSFCClaimsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) claimID];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v32 = v4;
      _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ was nullified", buf, 0xCu);
    }
    return [*(id *)(a1 + 32) unblockClaimerForReason:0x1ECA7C768];
  }
  else
  {
    uint64_t v6 = *(void **)(v2 + 264);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_69;
    v30[3] = &unk_1E51FE0B8;
    v30[4] = v2;
    [v6 forEachReactorToItemOrContainedItemPerformProcedure:v30];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 208))
    {
      objc_msgSend(v7, "addObjectsFromArray:");
      uint64_t v9 = *(void *)(a1 + 32);
    }
    if (*(void *)(v9 + 224))
    {
      objc_msgSend(v8, "addObjectsFromArray:");
      uint64_t v9 = *(void *)(a1 + 32);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(v9 + 240), "remoteObjectProxy"), "prepareToArbitrateForURLs:", v8);

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v11 = (void *)[*(id *)(a1 + 32) pendingClaims];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)v37;
      *(void *)&long long v13 = 138543618;
      long long v25 = v13;
      id v26 = v10;
      uint64_t v27 = v11;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v11);
          }
          __int16 v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (([v17 isRevoked] & 1) == 0)
            {
              uint64_t v18 = [v17 claimID];
              if (([*(id *)(*(void *)(a1 + 32) + 272) containsObject:v18] & 1) == 0)
              {
                NSUInteger v19 = _NSFCClaimsLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v20 = [v17 claimID];
                  uint64_t v21 = [*(id *)(a1 + 32) claimID];
                  *(_DWORD *)long long buf = v25;
                  uint64_t v32 = v20;
                  id v10 = v26;
                  __int16 v33 = 2114;
                  uint64_t v34 = v21;
                  _os_log_impl(&dword_181795000, v19, OS_LOG_TYPE_DEFAULT, "Forwarding pending claim %{public}@ to subarbiter for claim %{public}@ for evaluation there", buf, 0x16u);
                }
                objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "addObject:", v18, v25, v26);
                [v17 forwardUsingConnection:*(void *)(*(void *)(a1 + 32) + 240) crashHandler:&__block_literal_global_73];
                int v11 = v27;
              }
            }
            objc_msgSend(v10, "addObject:", v17, v25, v26);
          }
        }
        uint64_t v14 = [v11 countByEnumeratingWithState:&v36 objects:v35 count:16];
      }
      while (v14);
    }
    objc_msgSend(*(id *)(a1 + 32), "removePendingClaims:", v10, v25, v26);

    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void **)(v22 + 240);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_74;
    v29[3] = &unk_1E51F7FF8;
    v29[4] = v22;
    uint64_t v24 = (void *)[v23 remoteObjectProxyWithErrorHandler:v29];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_78;
    v28[3] = &unk_1E51F71D0;
    v28[4] = *(void *)(a1 + 32);
    return [v24 startArbitratingWithReply:v28];
  }
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 240) remoteObjectProxy];

  return [a2 forwardUsingProxy:v3];
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_71()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl(&dword_181795000, v0, OS_LOG_TYPE_ERROR, "A process invoked -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:] but stopped listening. Letting other process' file access claims proceed.", v2, 2u);
  }
  return 0;
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_74(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    id v7 = @"startArbitrating";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) unblockClaimerForReason:0x1ECA7C768];
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_78(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockClaimerForReason:0x1ECA7C768];
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v2 = *(void *)(v1 + 24) - 1;
  *(void *)(v1 + 24) = v2;
  if (!v2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)invokeClaimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->super._claimerOrNil)
  {
    uint64_t v3 = _NSFCClaimsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v8 = [(NSFileAccessClaim *)self claimID];
      _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ invoked in client", buf, 0xCu);
    }
    (*((void (**)(id, NSFileSubarbitrationClaim *, id))self->super._claimerOrNil + 2))(self->super._claimerOrNil, self, [(NSFileAccessClaim *)self claimerError]);

    self->super._claimerOrNil = 0;
  }
  if (self->super._serverClaimerOrNil)
  {
    uint64_t v4 = _NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(NSFileAccessClaim *)self claimID];
      *(_DWORD *)long long buf = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Subarbitration claim %{public}@ invoked in server", buf, 0xCu);
    }
    (*((void (**)(id, void, void, void, void, id))self->super._serverClaimerOrNil + 2))(self->super._serverClaimerOrNil, 0, 0, 0, 0, [(NSFileAccessClaim *)self claimerError]);

    self->super._serverClaimerOrNil = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NSFileSubarbitrationClaim;
  [(NSFileAccessClaim *)&v6 invokeClaimer];
}

- (void)revoked
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_readRelinquishmentsByPresenterID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_85];

  self->_readRelinquishmentsByPresenterID = 0;
  [(NSMutableDictionary *)self->_writeRelinquishmentsByPresenterID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_87_0];

  self->_writeRelinquishmentsByPresenterID = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFileSubarbitrationClaim;
  [(NSFileAccessClaim *)&v3 revoked];
}

uint64_t __36__NSFileSubarbitrationClaim_revoked__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeAllBlockingAccessClaimIDs];
}

uint64_t __36__NSFileSubarbitrationClaim_revoked__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeAllBlockingAccessClaimIDs];
}

- (void)devalueSelf
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  readingLocations = self->_readingLocations;
  uint64_t v4 = [(NSArray *)readingLocations countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(readingLocations);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) removeAccessClaim:self];
      }
      uint64_t v5 = [(NSArray *)readingLocations countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v5);
  }

  self->_readingLocations = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  writingLocations = self->_writingLocations;
  uint64_t v9 = [(NSArray *)writingLocations countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(writingLocations);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * j) removeAccessClaim:self];
      }
      uint64_t v10 = [(NSArray *)writingLocations countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v10);
  }

  self->_writingLocations = 0;
  v13.receiver = self;
  v13.super_class = (Class)NSFileSubarbitrationClaim;
  [(NSFileAccessClaim *)&v13 devalueSelf];
}

- (id)relinquishmentForWrite:(BOOL)a3 toPresenterForID:(id)a4
{
  if (a3) {
    uint64_t v5 = 288;
  }
  else {
    uint64_t v5 = 280;
  }
  uint64_t v6 = (id *)((char *)&self->super.super.isa + v5);
  id v7 = (NSFilePresenterRelinquishment *)[*(id *)((char *)&self->super.super.isa + v5) objectForKey:a4];
  if (!v7)
  {
    id v7 = objc_alloc_init(NSFilePresenterRelinquishment);
    [*v6 setObject:v7 forKey:a4];
    id v8 = v7;
  }
  return v7;
}

- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 toPresenter:(id)a8 usingReplySender:(id)a9
{
  v19[6] = *MEMORY[0x1E4F143B8];
  id v15 = -[NSFileSubarbitrationClaim relinquishmentForWrite:toPresenterForID:](self, "relinquishmentForWrite:toPresenterForID:", a3, [a8 reactorID]);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3052000000;
  v19[3] = __Block_byref_object_copy__29;
  v19[4] = __Block_byref_object_dispose__29;
  v19[5] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke;
  v17[3] = &unk_1E51FE150;
  BOOL v18 = a3;
  v17[4] = a8;
  v17[5] = a4;
  v17[6] = a6;
  v17[7] = a7;
  v17[9] = v19;
  v17[10] = a5;
  v17[8] = v15;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_3;
  void v16[3] = &unk_1E51FE178;
  v16[4] = a9;
  v16[5] = v19;
  [v15 performRelinquishmentToAccessClaimIfNecessary:a4 usingBlock:v17 withReply:v16];
  _Block_object_dispose(v19, 8);
}

uint64_t __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke(uint64_t a1, uint64_t a2)
{
  v11[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_2;
  v11[3] = &unk_1E51FE128;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  void v11[5] = a2;
  v11[6] = v9;
  v11[4] = v7;
  return [v4 forwardRelinquishmentForWritingClaim:v2 withID:v3 purposeID:v5 subitemURL:v6 options:v8 completionHandler:v11];
}

uint64_t __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setReacquirer:a4];
  if (a2) {
    id v7 = a3;
  }
  else {
    id v7 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v7;
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

void __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
}

- (void)forwardReacquisitionForWritingClaim:(BOOL)a3 withID:(id)a4 toPresenterForID:(id)a5 usingReplySender:(id)a6
{
  v10[5] = *MEMORY[0x1E4F143B8];
  id v8 = [(NSFileSubarbitrationClaim *)self relinquishmentForWrite:a3 toPresenterForID:a5];
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__NSFileSubarbitrationClaim_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender___block_invoke;
    v10[3] = &unk_1E51F8650;
    v10[4] = a6;
    [v8 removeBlockingAccessClaimID:a4 thenContinue:v10];
  }
  else if (a6)
  {
    uint64_t v9 = (void (*)(id))*((void *)a6 + 2);
    v9(a6);
  }
}

uint64_t __106__NSFileSubarbitrationClaim_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSXPCConnection)subarbiterConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSubarbiterConnection:(id)a3
{
}

- (BOOL)nullified
{
  return self->_nullified;
}

@end