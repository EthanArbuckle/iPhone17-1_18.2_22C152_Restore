@interface NSFileMultipleAccessClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)shouldBeRevokedPriorToInvokingAccessor;
- (BOOL)shouldCancelInsteadOfWaiting;
- (NSFileMultipleAccessClaim)initWithCoder:(id)a3;
- (NSFileMultipleAccessClaim)initWithPurposeID:(id)a3 intents:(id)a4 claimer:(id)a5;
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

@implementation NSFileMultipleAccessClaim

- (NSFileMultipleAccessClaim)initWithPurposeID:(id)a3 intents:(id)a4 claimer:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v7 = [(NSFileAccessClaim *)self initWithClient:0 claimID:0 purposeID:a3];
  if (v7)
  {
    v7->super._claimerOrNil = (id)[a5 copy];
    v7->_readingURLs = (NSMutableArray *)objc_opt_new();
    v7->_writingURLs = (NSMutableArray *)objc_opt_new();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__NSFileMultipleAccessClaim_initWithPurposeID_intents_claimer___block_invoke;
    v17[3] = &unk_1E51FCAD8;
    v17[4] = v7;
    [a4 enumerateObjectsUsingBlock:v17];
    v7->_readingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, [(NSMutableArray *)v7->_readingURLs count], 0x86B1FB7CuLL);
    v7->_writingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, [(NSMutableArray *)v7->_writingURLs count], 0x9CC3D517uLL);
    v7->_readingOptions = (unint64_t *)malloc_type_calloc(8uLL, [(NSMutableArray *)v7->_readingURLs count], 0xE52A541FuLL);
    v7->_writingOptions = (unint64_t *)malloc_type_calloc(8uLL, [(NSMutableArray *)v7->_writingURLs count], 0xFB8761E0uLL);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [a4 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(a4);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v14 isRead])
          {
            uint64_t v15 = [v14 readingOptions];
            v7->_readingOptions[v10++] = (v15 << 14) & 0x20000 | (unint64_t)v15;
          }
          else
          {
            v7->_writingOptions[v11++] = [v14 writingOptions];
          }
        }
        uint64_t v9 = [a4 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v7;
}

uint64_t __63__NSFileMultipleAccessClaim_initWithPurposeID_intents_claimer___block_invoke(uint64_t a1, void *a2)
{
  int v4 = [a2 isRead];
  uint64_t v5 = 29;
  if (v4) {
    uint64_t v5 = 28;
  }
  v6 = *(void **)(*(void *)(a1 + 32) + OBJC_IVAR___NSFileReadingClaim__url[v5]);
  uint64_t v7 = [a2 URL];

  return [v6 addObject:v7];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  free(self->_readingOptions);
  free(self->_writingOptions);
  free(self->_readingURLsDidChange);
  free(self->_writingURLsDidChange);

  v3.receiver = self;
  v3.super_class = (Class)NSFileMultipleAccessClaim;
  [(NSFileAccessClaim *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeObject:pairsForURLs(self->_readingURLs) forKey:@"NSReadingURLPairsKey"];
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_readingOptions, 8 * -[NSMutableArray count](self->_readingURLs, "count"), @"NSReadingOptionsKey");
  [a3 encodeObject:pairsForURLs(self->_writingURLs) forKey:@"NSWritingURLPairsKey"];
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_writingOptions, 8 * -[NSMutableArray count](self->_writingURLs, "count"), @"NSWritingOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)NSFileMultipleAccessClaim;
  [(NSFileAccessClaim *)&v5 encodeWithCoder:a3];
}

- (NSFileMultipleAccessClaim)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)NSFileMultipleAccessClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v27, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v17 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v18 = *MEMORY[0x1E4F1C3B8];
      long long v19 = @"NSFileAccessClaims should only ever be decoded by XPC";
      goto LABEL_16;
    }
    objc_super v5 = (void *)[a3 allowedClasses];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    uint64_t v7 = objc_msgSend(v5, "setByAddingObjectsFromSet:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 2)));
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    long long v22 = __43__NSFileMultipleAccessClaim_initWithCoder___block_invoke;
    uint64_t v23 = &unk_1E51FCB00;
    id v24 = a3;
    uint64_t v25 = v7;
    v26 = v4;
    v4->_readingURLs = (NSMutableArray *)objc_msgSend(__43__NSFileMultipleAccessClaim_initWithCoder___block_invoke((uint64_t)v21, @"NSReadingURLPairsKey"), "mutableCopy");
    v4->_writingURLs = (NSMutableArray *)objc_msgSend(v22((uint64_t)v21, @"NSWritingURLPairsKey"), "mutableCopy");
    size_t v8 = 8 * [(NSMutableArray *)v4->_readingURLs count];
    if (v8)
    {
      uint64_t v20 = 0;
      uint64_t v9 = [a3 decodeBytesForKey:@"NSReadingOptionsKey" returnedLength:&v20];
      if (v20 != v8)
      {

        v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3B8];
        long long v19 = @"NSFileMultipleAccessClaim failed to properly decode NSReadingOptionsKey";
        goto LABEL_16;
      }
      uint64_t v10 = (const void *)v9;
      uint64_t v11 = (unint64_t *)malloc_type_malloc(v8, 0x37DD5F06uLL);
      v4->_readingOptions = v11;
      if (v11) {
        memcpy(v11, v10, v8);
      }
    }
    size_t v12 = 8 * [(NSMutableArray *)v4->_writingURLs count];
    if (!v12)
    {
LABEL_11:
      v4->_readingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, [(NSMutableArray *)v4->_readingURLs count], 0x1340D35CuLL);
      v4->_writingURLsDidChange = (BOOL *)malloc_type_calloc(1uLL, [(NSMutableArray *)v4->_writingURLs count], 0x7DBBAF49uLL);
      return v4;
    }
    uint64_t v20 = 0;
    uint64_t v13 = [a3 decodeBytesForKey:@"NSWritingOptionsKey" returnedLength:&v20];
    if (v20 == v12)
    {
      v14 = (const void *)v13;
      uint64_t v15 = (unint64_t *)malloc_type_malloc(v12, 0xFDBD5F55uLL);
      v4->_writingOptions = v15;
      if (v15) {
        memcpy(v15, v14, v12);
      }
      goto LABEL_11;
    }

    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    long long v19 = @"NSFileMultipleAccessClaim failed to properly decode NSWritingOptionsKey";
LABEL_16:
    objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v19 userInfo:0]);
  }
  return v4;
}

void *__43__NSFileMultipleAccessClaim_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:a2];
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  if (v4)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      size_t v12 = +[NSString stringWithFormat:@"NSFileMultipleAccessClaim decoded the wrong class for key %@", a2];
LABEL_13:
      uint64_t v13 = v12;

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v13 userInfo:0]);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            size_t v12 = +[NSString stringWithFormat:@"NSFileMultipleAccessClaim decoded the wrong class for contents of %@", a2];
            goto LABEL_13;
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(v10, "URL"));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
  }
  return v5;
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
  v10[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke;
  v10[3] = &unk_1E51FA638;
  v10[4] = self;
  v10[5] = a4;
  uint64_t v8 = (void *)[a3 remoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_477;
  v9[3] = &unk_1E51FC8A8;
  v9[4] = self;
  [v8 grantAccessClaim:self withReply:v9];
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [*(id *)(a1 + 32) claimID];
    int v10 = 138543618;
    uint64_t v11 = (__CFString *)v9;
    __int16 v12 = 2114;
    uint64_t v13 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim message failed: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  objc_super v5 = _NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138543618;
    uint64_t v11 = @"grantAccessClaim";
    __int16 v12 = 2114;
    uint64_t v13 = a2;
    _os_log_error_impl(&dword_181795000, v5, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v6 = 208;
    if ([*(id *)(*(void *)(a1 + 32) + 208) count])
    {
      uint64_t v7 = 256;
    }
    else
    {
      uint64_t v6 = 232;
      uint64_t v7 = 512;
    }
    objc_msgSend(*(id *)(a1 + 32), "setClaimerError:", _NSErrorWithFilePath(v7, objc_msgSend(*(id *)(*(void *)(a1 + 32) + v6), "objectAtIndex:", 0)));
  }
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_477(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  __int16 v12 = _NSFCClaimsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [*(id *)(a1 + 32) claimID];
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v14;
    _os_log_debug_impl(&dword_181795000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ received grantAccessClaim reply", buf, 0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }
  else if (a6)
  {
LABEL_3:
    uint64_t v13 = _NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [*(id *)(a1 + 32) claimID];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = a6;
      _os_log_error_impl(&dword_181795000, v13, OS_LOG_TYPE_ERROR, "%{public}@ grantAccessClaim reply is an error: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_478;
  v18[3] = &unk_1E51FCB28;
  v18[4] = *(void *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_2;
  v17[3] = &unk_1E51FCB28;
  v17[4] = *(void *)(a1 + 32);
  [a3 enumerateObjectsUsingBlock:v17];
  if (a4)
  {

    *(void *)(*(void *)(a1 + 32) + 176) = [a4 copy];
  }
  [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:a5];
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_478(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "URL"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 224) + a3) = 1;
  }
  return result;
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "URL"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 248) + a3) = 1;
  }
  return result;
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  long long v49 = *(_OWORD *)&byte_1ECA5C1C0[16];
  long long v50 = *(_OWORD *)byte_1ECA5C1C0;
  CFArrayCallBacks callBacks = *(CFArrayCallBacks *)byte_1ECA5C1C0;
  uint64_t v7 = *(Boolean (__cdecl **)(const void *, const void *))&byte_1ECA5C1C0[32];
  uint64_t v8 = CFArrayCreateMutable(0, 0, &callBacks);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  readingURLs = self->_readingURLs;
  uint64_t v10 = [(NSMutableArray *)readingURLs countByEnumeratingWithState:&v80 objects:v79 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v81;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v81 != v12) {
          objc_enumerationMutation(readingURLs);
        }
        uint64_t v14 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v80 + 1) + 8 * i)];
        if (v14)
        {
          long long v15 = v14;
          if (v4 && ![v14 itemIsSubarbitrable])
          {
            v35 = v15;
LABEL_46:
            [v35 removeSelfIfUseless];
            return 0;
          }
          [(__CFArray *)v8 addObject:v15];
        }
      }
      uint64_t v11 = [(NSMutableArray *)readingURLs countByEnumeratingWithState:&v80 objects:v79 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  *(_OWORD *)&callBacks.versiouint64_t n = v50;
  *(_OWORD *)&callBacks.release = v49;
  callBacks.equal = v7;
  uint64_t v16 = CFArrayCreateMutable(0, 0, &callBacks);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  writingURLs = self->_writingURLs;
  uint64_t v18 = [(NSMutableArray *)writingURLs countByEnumeratingWithState:&v75 objects:v74 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v76;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v76 != v20) {
          objc_enumerationMutation(writingURLs);
        }
        uint64_t v22 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v75 + 1) + 8 * j)];
        if (v22)
        {
          uint64_t v23 = v22;
          if (v4 && ![v22 itemIsSubarbitrable])
          {
            v35 = v23;
            goto LABEL_46;
          }
          [(__CFArray *)v16 addObject:v23];
        }
      }
      uint64_t v19 = [(NSMutableArray *)writingURLs countByEnumeratingWithState:&v75 objects:v74 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  callBacks.versiouint64_t n = 0;
  if (![(NSFileAccessClaim *)self canAccessLocations:v8 forReading:1 error:&callBacks]|| ![(NSFileAccessClaim *)self canAccessLocations:v16 forReading:0 error:&callBacks])
  {
    [(NSFileAccessClaim *)self setClaimerError:callBacks.version];
    return 1;
  }
  self->_readingLocations = (NSMutableArray *)v8;
  self->_writingLocations = (NSMutableArray *)v16;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  readingLocations = self->_readingLocations;
  uint64_t v25 = [(NSMutableArray *)readingLocations countByEnumeratingWithState:&v70 objects:v69 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v71 != v27) {
          objc_enumerationMutation(readingLocations);
        }
        [*(id *)(*((void *)&v70 + 1) + 8 * k) addAccessClaim:self];
      }
      uint64_t v26 = [(NSMutableArray *)readingLocations countByEnumeratingWithState:&v70 objects:v69 count:16];
    }
    while (v26);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  writingLocations = self->_writingLocations;
  uint64_t v30 = [(NSMutableArray *)writingLocations countByEnumeratingWithState:&v65 objects:v64 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v66;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v66 != v32) {
          objc_enumerationMutation(writingLocations);
        }
        [*(id *)(*((void *)&v65 + 1) + 8 * m) addAccessClaim:self];
      }
      uint64_t v31 = [(NSMutableArray *)writingLocations countByEnumeratingWithState:&v65 objects:v64 count:16];
    }
    while (v31);
  }
  if ([(NSMutableArray *)self->_readingURLs count])
  {
    uint64_t v34 = 0;
    while ((self->_readingOptions[v34] & 2) == 0)
    {
      if (++v34 >= (unint64_t)[(NSMutableArray *)self->_readingURLs count]) {
        goto LABEL_50;
      }
    }
    self->_rootNode = (NSFileAccessNode *)a3;
  }
LABEL_50:
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v37 = self->_readingLocations;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v60 objects:v59 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v61;
    do
    {
      for (uint64_t n = 0; n != v39; ++n)
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v60 + 1) + 8 * n);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
        v52[3] = &unk_1E51FC8D0;
        v52[4] = self;
        [v42 forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v52];
      }
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v60 objects:v59 count:16];
    }
    while (v39);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v43 = self->_writingLocations;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v55 objects:v54 count:16];
  if (!v44) {
    return 1;
  }
  uint64_t v45 = v44;
  uint64_t v46 = *(void *)v56;
  do
  {
    for (iuint64_t i = 0; ii != v45; ++ii)
    {
      if (*(void *)v56 != v46) {
        objc_enumerationMutation(v43);
      }
      v48 = *(void **)(*((void *)&v55 + 1) + 8 * ii);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v51[3] = &unk_1E51FC8D0;
      v51[4] = self;
      [v48 forEachRelevantAccessClaimForEvaluatingAgainstClaim:self performProcedure:v51];
    }
    uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v55 objects:v54 count:16];
    BOOL result = 1;
  }
  while (v45);
  return result;
}

uint64_t __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  writingLocations = self->_writingLocations;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NSFileMultipleAccessClaim_isBlockedByReadingItemAtLocation_options___block_invoke;
  v7[3] = &unk_1E51FCB50;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v8;
  v7[7] = a4;
  [(NSMutableArray *)writingLocations enumerateObjectsUsingBlock:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByReadingItemAtLocation_options___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [(id)objc_opt_class() canReadingItemAtLocation:a1[5] options:a1[7] safelyOverlapNewWriting:1 ofItemAtLocation:a2 options:*(void *)(*(void *)(a1[4] + 240) + 8 * a3)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_class();
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  readingLocations = self->_readingLocations;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke;
  v13[3] = &unk_1E51FCB78;
  v13[4] = v7;
  v13[5] = self;
  v13[7] = &v14;
  v13[8] = a4;
  v13[6] = a3;
  [(NSMutableArray *)readingLocations enumerateObjectsUsingBlock:v13];
  if (*((unsigned char *)v15 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    writingLocations = self->_writingLocations;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke_2;
    v12[3] = &unk_1E51FCB78;
    v12[4] = v7;
    v12[5] = self;
    v12[6] = a3;
    v12[7] = &v14;
    v12[8] = a4;
    [(NSMutableArray *)writingLocations enumerateObjectsUsingBlock:v12];
    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canReadingItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 216) + 8 * a3) safelyOverlapNewWriting:0 ofItemAtLocation:*(void *)(a1 + 48) options:*(void *)(a1 + 64)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canNewWriteOfItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 240) + 8 * a3) safelyOverlapExistingWriteOfItemAtLocation:*(void *)(a1 + 48) options:*(void *)(a1 + 64)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)granted
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_readingLocations || self->_writingLocations)
  {
    uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (unsigned __int8 v13 = atomic_load(_NSFCDisableLogSuppression), (v13 & 1) != 0)
      || (uint64_t v14 = atomic_load(&_NSFCSubarbitratedClaimCount), v14 <= 99))
    {
      BOOL v4 = _NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }
    readingLocations = self->_readingLocations;
    readingOptions = self->_readingOptions;
    writingLocations = self->_writingLocations;
    writingOptions = self->_writingOptions;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke;
    v17[3] = &unk_1E51F8F20;
    v17[4] = self;
    [(NSFileAccessClaim *)self makeProvidersProvideItemsForReadingLocations:readingLocations options:readingOptions andWritingLocationsIfNecessary:writingLocations options:writingOptions thenContinue:v17];
    if (self->_writingLocations)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_8;
      v16[3] = &unk_1E51F71D0;
      v16[4] = self;
      [(NSFileAccessClaim *)self whenRevokedPerformProcedure:v16];
    }
  }
  else
  {
    client = self->super._client;
    uint64_t v10 = _NSFCClaimsLog();
    char v11 = v10;
    if (client)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = [(NSFileAccessClaim *)self claimID];
        _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, "Claim %{public}@ can't be granted in daemon", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = [(NSFileAccessClaim *)self claimID];
        _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
      uint64_t v12 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_readingURLs];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_480;
      v15[3] = &unk_1E51FCAD8;
      v15[4] = self;
      [v12 enumerateObjectsUsingBlock:v15];
    }
  }
  [(NSFileAccessClaim *)self unblockClaimerForReason:@"Initial blockage"];
}

void __36__NSFileMultipleAccessClaim_granted__block_invoke(uint64_t a1, int a2)
{
  v9[6] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v4 + 264);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_2;
    v9[3] = &unk_1E51FCBF0;
    v9[4] = v4;
    void v9[5] = v3;
    [v5 enumerateObjectsUsingBlock:v9];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 256);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_5;
    v8[3] = &unk_1E51FCBF0;
    v8[4] = v6;
    v8[5] = v3;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v4[30] + 8 * a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_3;
  v7[3] = &unk_1E51FCBC8;
  long long v8 = v3;
  uint64_t v9 = a2;
  uint64_t v10 = v5;
  return [v4 makePresentersOfItemAtLocation:a2 orContainedItem:(v5 & 0x13000B) != 0 relinquishUsingProcedureGetter:v7];
}

id __36__NSFileMultipleAccessClaim_granted__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v9[9] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(a1 + 56) causePresenterToRelinquish:a2])return 0; {
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_4;
  v9[3] = &unk_1E51FCBA0;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v9[4] = *(void *)(a1 + 32);
  void v9[5] = v6;
  void v9[7] = a3;
  v9[8] = v7;
  v9[6] = a2;
  return (id)[v9 copy];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) purposeIDOfClaimOnItemAtLocation:*(void *)(a1 + 40) forMessagingPresenter:*(void *)(a1 + 48)];
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 32) claimID];
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);

  return [v5 relinquishToWritingClaimWithID:v6 options:v7 purposeID:v4 subitemPath:v8 resultHandler:a2];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v4[27] + 8 * a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_6;
  v7[3] = &unk_1E51FCC40;
  uint64_t v9 = v5;
  long long v8 = v3;
  return [v4 makePresentersOfItemAtLocation:a2 orContainedItem:0 relinquishUsingProcedureGetter:v7];
}

id __36__NSFileMultipleAccessClaim_granted__block_invoke_6(uint64_t a1, void *a2)
{
  v6[7] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) shouldReadingWithOptions:*(void *)(a1 + 48) causePresenterToRelinquish:a2]|| (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "reactorID")) & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_7;
  v6[3] = &unk_1E51FCC18;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  v6[6] = *(void *)(a1 + 48);
  return (id)[v6 copy];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) claimID];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) purposeID];

  return [v4 relinquishToReadingClaimWithID:v5 options:v6 purposeID:v7 resultHandler:a2];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_8(uint64_t a1)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 264);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_9;
  v4[3] = &unk_1E51FCC68;
  v4[4] = v1;
  return [v2 enumerateObjectsUsingBlock:v4];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) shouldInformProvidersAboutEndOfWriteWithOptions:*(void *)(*(void *)(*(void *)(a1 + 32) + 240) + 8 * a3)];
  if (result)
  {
    uint64_t v6 = (void *)[a2 itemProvider];
    uint64_t v7 = *(void *)(a1 + 32);
    return [v6 observeEndOfWriteAtLocation:a2 forAccessClaim:v7];
  }
  return result;
}

void *__36__NSFileMultipleAccessClaim_granted__block_invoke_480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v4[6] = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void **)(a1 + 32);
  if ((*(void *)(result[27] + 8 * a3) & 8) != 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_2_481;
    v4[3] = &unk_1E51FACB0;
    v4[4] = result;
    v4[5] = a3;
    return (void *)[result prepareItemForUploadingFromURL:a2 thenContinue:v4];
  }
  return result;
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_2_481(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 224) + *(void *)(a1 + 40)) = 1;
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 208);
    return objc_msgSend(v4, "replaceObjectAtIndex:withObject:");
  }
  else
  {
    uint64_t v7 = _NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 32) claimID];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      uint64_t v12 = a3;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Claim %{public}@ failed during preparing for uploading due to error: %@", (uint8_t *)&v9, 0x16u);
    }
    return [*(id *)(a1 + 32) setClaimerError:a3];
  }
}

- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3
{
  v10[5] = *MEMORY[0x1E4F143B8];
  if ([(NSFileAccessClaim *)self didWait])
  {
    readingLocations = self->_readingLocations;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke;
    v10[3] = &unk_1E51FCAD8;
    v10[4] = self;
    [(NSMutableArray *)readingLocations enumerateObjectsUsingBlock:v10];
    writingLocations = self->_writingLocations;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2;
    v9[3] = &unk_1E51FCAD8;
    v9[4] = self;
    [(NSMutableArray *)writingLocations enumerateObjectsUsingBlock:v9];
  }
  if ([(NSFileAccessClaim *)self claimerError])
  {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3;
    v8[3] = &unk_1E51FC970;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_6;
    v7[3] = &unk_1E51F9B10;
    void v7[4] = self;
    v7[5] = a3;
    __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3((uint64_t)v8, (uint64_t)v7);
  }
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 standardizedURL];
  if (result) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 208) replaceObjectAtIndex:a3 withObject:result];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 224) + a3) = 1;
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 standardizedURL];
  if (result) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 232) replaceObjectAtIndex:a3 withObject:result];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 248) + a3) = 1;
  return result;
}

void __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 272)) {
    goto LABEL_3;
  }
  id v5 = (id)[*(id *)(v3 + 208) copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4;
  v6[3] = &unk_1E51FCCB8;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = &v7;
  [v5 enumerateObjectsUsingBlock:v6];
  if (!*((unsigned char *)v8 + 24)) {
LABEL_3:
  }
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  _Block_object_dispose(&v7, 8);
}

void *__73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  void v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void **)(a1 + 32);
  if (result[35] == a3)
  {
    if ((*(void *)(result[27] + 8 * a3) & 2) != 0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5;
      v7[3] = &unk_1E51FCC90;
      void v7[4] = result;
      v7[5] = a3;
      uint64_t result = (void *)[result checkIfSymbolicLinkAtURL:a2 withResolutionCount:result + 36 andIfSoThenReevaluateSelf:v7];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        *a4 = 1;
      }
      else
      {
        ++*(void *)(*(void *)(a1 + 32) + 280);
        *(void *)(*(void *)(a1 + 32) + 288) = 0;
      }
    }
    else
    {
      result[35] = a3 + 1;
    }
  }
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 208) replaceObjectAtIndex:*(void *)(a1 + 40) withObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 224) + *(void *)(a1 + 40)) = 1;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[34];

  return [v3 evaluateSelfWithRootNode:v4 checkSubarbitrability:0];
}

void __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_6(uint64_t a1)
{
  v24[6] = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "count"));
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*v2 + 232), "count"));
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 208);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_7;
  v24[3] = &unk_1E51FCBF0;
  v24[4] = v5;
  v24[5] = v3;
  [v6 enumerateObjectsUsingBlock:v24];
  uint64_t v7 = *v2;
  uint64_t v8 = *(void **)(*v2 + 232);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_8;
  v23[3] = &unk_1E51FCBF0;
  v23[4] = v7;
  v23[5] = v4;
  [v8 enumerateObjectsUsingBlock:v23];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v9 = [*(id *)(*v2 + 256) count];
  uint64_t v22 = [*(id *)(*v2 + 264) count] + v9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_9;
  v18[3] = &unk_1E51FCCE0;
  uint64_t v10 = *(void *)(a1 + 40);
  v18[6] = v10;
  v18[7] = &v19;
  v18[4] = v3;
  void v18[5] = v4;
  if (v20[3])
  {
    uint64_t v11 = [*(id *)(a1 + 32) purposeID];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 256);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_10;
    v17[3] = &unk_1E51FCD30;
    v17[4] = v12;
    void v17[5] = v11;
    v17[6] = v3;
    v17[7] = v18;
    [v13 enumerateObjectsUsingBlock:v17];
    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = *(void **)(v14 + 264);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_12;
    v16[3] = &unk_1E51FCD30;
    v16[4] = v14;
    void v16[5] = v11;
    v16[6] = v4;
    v16[7] = v18;
    [v15 enumerateObjectsUsingBlock:v16];
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v3, v4);
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 40);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 224) + a3)) {
    a2 = [MEMORY[0x1E4F1CA98] null];
  }

  return [v3 addObject:a2];
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 40);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 248) + a3)) {
    a2 = [MEMORY[0x1E4F1CA98] null];
  }

  return [v3 addObject:a2];
}

void *__73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_9(void *result)
{
  uint64_t v1 = *(void *)(result[7] + 8);
  uint64_t v2 = *(void *)(v1 + 24) - 1;
  *(void *)(v1 + 24) = v2;
  if (!v2) {
    return (void *)(*(uint64_t (**)(void, void, void))(result[6] + 16))(result[6], result[4], result[5]);
  }
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4[27] + 8 * a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_11;
  v7[3] = &unk_1E51FCD08;
  uint64_t v9 = a3;
  long long v8 = *(_OWORD *)(a1 + 48);
  return [v4 makeProviderOfItemAtLocation:a2 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v3 readingOptions:v5 thenContinue:v7];
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_11(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 48) withObject:a2];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4[30] + 8 * a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_13;
  v7[3] = &unk_1E51FCD08;
  uint64_t v9 = a3;
  long long v8 = *(_OWORD *)(a1 + 48);
  return [v4 makeProviderOfItemAtLocation:a2 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v3 writingOptions:v5 thenContinue:v7];
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_13(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 48) withObject:a2];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__NSFileMultipleAccessClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_1E51FCD58;
  v2[4] = self;
  [(NSFileMultipleAccessClaim *)self resolveURLsThenMaybeContinueInvokingClaimer:v2];
}

id __42__NSFileMultipleAccessClaim_invokeClaimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6[20])
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v17 = atomic_load(_NSFCDisableLogSuppression), (v17 & 1) != 0)
      || (uint64_t v18 = atomic_load(&_NSFCSubarbitratedClaimCount), v18 <= 99))
    {
      long long v8 = _NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v9;
        _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }
    (*(void (**)(void, void, void *, void *, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160)
                                                                            + 16))(*(void *)(*(void *)(a1 + 32) + 160), *(void *)(a1 + 32), a2, a3, *(void *)(*(void *)(a1 + 32) + 176), [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160) = 0;
    uint64_t v6 = *(void **)(a1 + 32);
  }
  if (v6[21])
  {
    uint64_t v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (unsigned __int8 v19 = atomic_load(_NSFCDisableLogSuppression), (v19 & 1) != 0)
      || (uint64_t v20 = atomic_load(&_NSFCSubarbitratedClaimCount), v20 <= 99))
    {
      uint64_t v11 = _NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v12;
        _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 168);
    uint64_t v14 = pairsForURLs(a2);
    long long v15 = pairsForURLs(a3);
    (*(void (**)(uint64_t, void *, void *, void, uint64_t, uint64_t))(v13 + 16))(v13, v14, v15, *(void *)(*(void *)(a1 + 32) + 176), [*(id *)(a1 + 32) shouldEnableMaterializationDuringAccessorBlock], objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168) = 0;
    uint64_t v6 = *(void **)(a1 + 32);
  }
  v21.receiver = v6;
  v21.super_class = (Class)NSFileMultipleAccessClaim;
  return objc_msgSendSuper2(&v21, sel_invokeClaimer);
}

- (void)devalueSelf
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  readingLocations = self->_readingLocations;
  uint64_t v4 = [(NSMutableArray *)readingLocations countByEnumeratingWithState:&v44 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(readingLocations);
        }
        long long v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke;
        v27[3] = &unk_1E51FC8D0;
        v27[4] = self;
        [v8 forEachRelevantAccessClaimPerformProcedure:v27];
      }
      uint64_t v5 = [(NSMutableArray *)readingLocations countByEnumeratingWithState:&v44 objects:v43 count:16];
    }
    while (v5);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  writingLocations = self->_writingLocations;
  uint64_t v10 = [(NSMutableArray *)writingLocations countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(writingLocations);
        }
        uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke_2;
        v26[3] = &unk_1E51FC8D0;
        v26[4] = self;
        [v14 forEachRelevantAccessClaimPerformProcedure:v26];
      }
      uint64_t v11 = [(NSMutableArray *)writingLocations countByEnumeratingWithState:&v39 objects:v38 count:16];
    }
    while (v11);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v15 = self->_readingLocations;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * k) removeAccessClaim:self];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v17);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v20 = self->_writingLocations;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * m) removeAccessClaim:self];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v22);
  }

  self->_readingLocations = 0;
  self->_writingLocations = 0;
  v25.receiver = self;
  v25.super_class = (Class)NSFileMultipleAccessClaim;
  [(NSFileAccessClaim *)&v25 devalueSelf];
}

uint64_t __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

uint64_t __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  v14[5] = *MEMORY[0x1E4F143B8];
  writingLocations = self->_writingLocations;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke;
  v14[3] = &unk_1E51FCD80;
  v14[4] = a3;
  long long v8 = (void *)[(NSMutableArray *)writingLocations indexesOfObjectsPassingTest:v14];
  readingLocations = self->_readingLocations;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_2;
  v13[3] = &unk_1E51FCD80;
  v13[4] = a3;
  uint64_t v10 = (void *)[(NSMutableArray *)readingLocations indexesOfObjectsPassingTest:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_3;
  v12[3] = &unk_1E51FCDA8;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  [v8 enumerateIndexesUsingBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_4;
  v11[3] = &unk_1E51FCDA8;
  v11[4] = a4;
  v11[5] = self;
  v11[6] = a3;
  [v10 enumerateIndexesUsingBlock:v11];
}

BOOL __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

BOOL __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

uint64_t __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addAccessClaim:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) removeAccessClaim:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 264);

  return [v5 replaceObjectAtIndex:a2 withObject:v4];
}

uint64_t __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addAccessClaim:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) removeAccessClaim:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 256);

  return [v5 replaceObjectAtIndex:a2 withObject:v4];
}

- (BOOL)blocksClaim:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  readingLocations = self->_readingLocations;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke;
  v10[3] = &unk_1E51FCDD0;
  v10[4] = a3;
  v10[5] = self;
  void v10[6] = &v11;
  [(NSMutableArray *)readingLocations enumerateObjectsUsingBlock:v10];
  if (*((unsigned char *)v12 + 24))
  {
    BOOL v6 = 1;
  }
  else
  {
    writingLocations = self->_writingLocations;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke_2;
    v9[3] = &unk_1E51FCDD0;
    v9[4] = a3;
    void v9[5] = self;
    v9[6] = &v11;
    [(NSMutableArray *)writingLocations enumerateObjectsUsingBlock:v9];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isBlockedByReadingItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 216) + 8 * a3)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isBlockedByWritingItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 240) + 8 * a3)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  uint64_t v3 = [(NSMutableArray *)self->_readingURLs count];
  if ([(NSMutableArray *)self->_writingURLs count])
  {
    LOBYTE(v4) = 0;
  }
  else if (v3)
  {
    readingOptions = self->_readingOptions;
    uint64_t v6 = v3 - 1;
    do
    {
      unint64_t v8 = *readingOptions++;
      char v7 = v8;
      BOOL v4 = (v8 >> 3) & 1;
      BOOL v10 = v6-- != 0;
    }
    while ((v7 & 8) != 0 && v10);
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)allURLs
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v4 = v3;
  if (self->_readingURLs) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  if (self->_writingURLs) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  return v4;
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  unint64_t v3 = [(NSMutableArray *)self->_readingURLs count];
  if (v3)
  {
    readingOptions = self->_readingOptions;
    if ((*((unsigned char *)readingOptions + 2) & 8) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      uint64_t v5 = 1;
      do
      {
        unint64_t v6 = v5;
        if (v3 == v5) {
          break;
        }
        unint64_t v7 = readingOptions[v5++];
      }
      while ((v7 & 0x80000) == 0);
      LOBYTE(v3) = v6 < v3;
    }
  }
  return v3;
}

- (void)protectFilesAgainstEviction
{
  v6[5] = *MEMORY[0x1E4F143B8];
  readingURLs = self->_readingURLs;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke;
  v6[3] = &unk_1E51FCDF8;
  v6[4] = self;
  [(NSMutableArray *)readingURLs enumerateObjectsUsingBlock:v6];
  writingURLs = self->_writingURLs;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke_2;
  v5[3] = &unk_1E51FCDF8;
  v5[4] = self;
  [(NSMutableArray *)writingURLs enumerateObjectsUsingBlock:v5];
}

uint64_t __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _protectIfNecessaryFileAtURL:a2 withOptions:*(void *)(*(void *)(*(void *)(a1 + 32) + 216) + 8 * a3) forReading:1];
}

uint64_t __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _protectIfNecessaryFileAtURL:a2 withOptions:*(void *)(*(void *)(*(void *)(a1 + 32) + 240) + 8 * a3) forReading:0];
}

@end