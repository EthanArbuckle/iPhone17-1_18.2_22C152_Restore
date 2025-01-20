@interface DDOperation
+ (BOOL)_needsFullScannerForDetectionTypes:(unint64_t)a3;
+ (id)shouldUrlifyBlockForTypes:(unint64_t)a3;
+ (id)urlificationBlockForTypes:(unint64_t)a3;
- (BOOL)_containerReadyForDetection;
- (BOOL)_rangeValidForContainer;
- (BOOL)containerIsReady;
- (BOOL)doURLificationOnDocument;
- (BOOL)ignoreSignatures;
- (BOOL)isDiscarded;
- (BOOL)needContinuation;
- (BOOL)needsFullScanner;
- (BOOL)needsToStartOver;
- (DDOperation)initWithContainer:(id)a3;
- (NSArray)results;
- (NSArray)scannerResults;
- (NSDictionary)context;
- (__DDScanQuery)_createScanQueryForBackend;
- (__DDScanQuery)scanQuery;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationForStartingOver;
- (int)_createScanQuery;
- (int)generationNumber;
- (int)tryCount;
- (unint64_t)detectionTypes;
- (void)_createScanQuery;
- (void)_setScanQuery:(__DDScanQuery *)a3;
- (void)cancel;
- (void)cleanup;
- (void)dealloc;
- (void)dispatchContainerModificationBlock:(id)a3;
- (void)dispatchScanQueryCreationWithCompletionBlock:(id)a3;
- (void)main;
- (void)newOperationForStartingOver;
- (void)setContainer:(id)a3;
- (void)setContext:(id)a3;
- (void)setDetectionTypes:(unint64_t)a3;
- (void)setGenerationNumber:(int)a3;
- (void)setIgnoreSignatures:(BOOL)a3;
- (void)setIsDiscarded:(BOOL)a3;
- (void)setNeedContinuation:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)setScannerResults:(id)a3;
- (void)setTryCount:(int)a3;
@end

@implementation DDOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerResults, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_container, 0);
}

- (void)cleanup
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDOperation _createScanQuery].cold.8();
  }
  [(DDOperation *)self _setScanQuery:0];
  [(DDOperation *)self setContext:0];
  [(DDOperation *)self setContainer:0];
}

- (void)setContext:(id)a3
{
}

- (void)_setScanQuery:(__DDScanQuery *)a3
{
  query = self->_query;
  if (query != a3)
  {
    if (query)
    {
      CFRelease(query);
      self->_query = 0;
    }
    if (a3) {
      self->_query = (__DDScanQuery *)CFRetain(a3);
    }
  }
}

- (void)setContainer:(id)a3
{
}

id __41__DDOperation_urlificationBlockForTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[DDOperation shouldUrlifyBlockForTypes:*(void *)(a1 + 32)];
  if (((unsigned int (**)(void, uint64_t, id, id))v12)[2](v12, a2, v10, v11))
  {
    v13 = DDURLStringForResult();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __41__DDOperation_shouldUrlifyBlockForTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  int Category = DDResultGetCategory();
  CFStringRef Type = (const __CFString *)DDResultGetType();
  if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F0A0], Type)) {
    goto LABEL_5;
  }
  if (!DDResultHasProperties()) {
    goto LABEL_56;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if ((v11 & 4) != 0 && Category == 3) {
    goto LABEL_5;
  }
  if ((v11 & 0x10) != 0)
  {
    if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F0E8], Type)) {
      goto LABEL_5;
    }
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if ((v11 & 0x20) != 0)
  {
    if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F000], Type)) {
      goto LABEL_5;
    }
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if ((v11 & 0x40) != 0)
  {
    if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F080], Type)) {
      goto LABEL_5;
    }
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if ((v11 & 0x20000) != 0)
  {
    if (CFEqual((CFStringRef)*MEMORY[0x1E4F5F018], Type)) {
      goto LABEL_5;
    }
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if ((v11 & 1) != 0 && Category == 2) {
    goto LABEL_5;
  }
  if ((v11 & 2) == 0)
  {
LABEL_25:
    if ((v11 & 8) != 0 && Category == 4)
    {
      if (!DDResultIsPastDate()) {
        goto LABEL_5;
      }
      uint64_t v11 = *(void *)(a1 + 32);
    }
    if (v11 == -1)
    {
      if (DDResultHasType())
      {
        v15 = [MEMORY[0x1E4F28B50] mainBundle];
        v16 = [v15 bundleIdentifier];
        char v17 = [v16 isEqualToString:@"com.apple.MobileSMS"];

        if (v17) {
          goto LABEL_5;
        }
      }
    }
    if ((~*(_DWORD *)(a1 + 32) & 0x1FFLL) == 0)
    {
      if (DDResultHasType())
      {
        v18 = [MEMORY[0x1E4F28B50] mainBundle];
        v19 = [v18 bundleIdentifier];
        char v20 = [v19 isEqualToString:@"com.apple.MobileSMS"];

        if (v20) {
          goto LABEL_5;
        }
      }
    }
    uint64_t v21 = *(void *)(a1 + 32);
    if ((v21 & 0x40000) == 0) {
      goto LABEL_38;
    }
    if ((DDResultHasType() & 1) == 0)
    {
      uint64_t v21 = *(void *)(a1 + 32);
LABEL_38:
      if ((~(_WORD)v21 & 0x1FF) == 0)
      {
        if (DDResultHasType())
        {
          v22 = DDUPIAction;
LABEL_47:
          uint64_t v23 = [(__objc2_class *)v22 actionAvailableForResult:a2 url:0 context:0];
LABEL_55:
          uint64_t v12 = v23;
          goto LABEL_57;
        }
        uint64_t v21 = *(void *)(a1 + 32);
      }
      if ((~(_WORD)v21 & 0x1FF) == 0)
      {
        if (DDResultHasType())
        {
          v22 = DDEventsAction;
          goto LABEL_47;
        }
        uint64_t v21 = *(void *)(a1 + 32);
      }
      if ((v21 & 0x80) != 0)
      {
        if (DDResultHasType())
        {
LABEL_54:
          uint64_t v23 = +[DDConversionAction actionAvailableForResult:a2];
          goto LABEL_55;
        }
        uint64_t v21 = *(void *)(a1 + 32);
      }
      if ((v21 & 0x100) != 0 && DDResultHasType()) {
        goto LABEL_54;
      }
LABEL_56:
      uint64_t v12 = 0;
      goto LABEL_57;
    }
LABEL_5:
    uint64_t v12 = 1;
    goto LABEL_57;
  }
  if ((_DDResultIsURL(a2) & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    goto LABEL_25;
  }
  v13 = _DDURLFromResult(a2);
  v14 = v13;
  if (v13) {
    uint64_t v12 = dd_urlLooksSuspicious(v13) ^ 1;
  }
  else {
    uint64_t v12 = 0;
  }

LABEL_57:
  return v12;
}

- (NSArray)results
{
  return self->_results;
}

- (NSDictionary)context
{
  return self->_context;
}

+ (id)shouldUrlifyBlockForTypes:(unint64_t)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__DDOperation_shouldUrlifyBlockForTypes___block_invoke;
  v6[3] = &__block_descriptor_40_e47_B32__0____DDResult__8__NSDate_16__NSTimeZone_24l;
  v6[4] = a3;
  v3 = (void *)MEMORY[0x1A6236DA0](v6, a2);
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSArray)scannerResults
{
  return self->_scannerResults;
}

- (void)setDetectionTypes:(unint64_t)a3
{
  self->_types = a3;
}

- (void)setIgnoreSignatures:(BOOL)a3
{
  self->_ignoreSignatures = a3;
}

- (DDOperation)initWithContainer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DDOperation;
  v6 = [(DDOperation *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_container, a3);
    v7->_query = 0;
    results = v7->_results;
    v7->_results = 0;

    v7->_tryCount = 0;
    v7->_containerNotReadyTryCount = 0;
    v7->_isDiscarded = 0;
  }

  return v7;
}

void __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  int v3 = [*(id *)(a1 + 32) _createScanQuery];
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v3 == 35)
  {
    if (v4) {
      __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
    }
    uint64_t v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x1A6236DA0](*(void *)(a1 + 40));
    [v12 performSelector:sel_dispatchScanQueryCreationWithCompletionBlock_ withObject:v13 afterDelay:0.0];
  }
  else
  {
    if (v4) {
      __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_2(v2, v5, v6, v7, v8, v9, v10, v11);
    }
    (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 == 0);
  }
}

- (BOOL)needsFullScanner
{
  int v3 = objc_opt_class();
  unint64_t types = self->_types;
  return [v3 _needsFullScannerForDetectionTypes:types];
}

- (id)container
{
  return self->_container;
}

- (BOOL)needContinuation
{
  return self->_needContinuation;
}

- (void)main
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Got an exception during scanning: %@", v0, 0xCu);
}

- (unint64_t)detectionTypes
{
  return self->_types;
}

- (void)setResults:(id)a3
{
}

+ (BOOL)_needsFullScannerForDetectionTypes:(unint64_t)a3
{
  return (a3 & 0x601FC) != 0;
}

- (BOOL)ignoreSignatures
{
  return self->_ignoreSignatures;
}

- (BOOL)containerIsReady
{
  return 1;
}

- (int)_createScanQuery
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDOperation _createScanQuery].cold.8();
  }
  if ([(DDOperation *)self isDiscarded])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[DDOperation _createScanQuery]();
    }
    return 22;
  }
  [(DDOperation *)self _applyContainerRestrictionsToTypes];
  if (!self->_types) {
    return 22;
  }
  if ([(DDOperation *)self tryCount] != -1
    && ![(DDOperation *)self _containerReadyForDetection])
  {
    int containerNotReadyTryCount = self->_containerNotReadyTryCount;
    self->_int containerNotReadyTryCount = containerNotReadyTryCount + 1;
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (containerNotReadyTryCount <= 1)
    {
      if (v4) {
        -[DDOperation _createScanQuery].cold.6(self);
      }
      return 35;
    }
    if (v4) {
      -[DDOperation _createScanQuery].cold.7(self);
    }
  }
  [(DDOperation *)self _updateGenerationNumber];
  if (![(DDOperation *)self _rangeValidForContainer]
    || ![(DDOperation *)self generationNumber])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[DDOperation _createScanQuery](self);
    }
    return 22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDOperation _createScanQuery].cold.5();
  }
  uint64_t v6 = [(DDOperation *)self _createScanQueryForBackend];
  [(DDOperation *)self _setScanQuery:v6];
  if (v6) {
    CFRelease(v6);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDOperation _createScanQuery](self);
  }
  if ([(DDOperation *)self scanQuery]) {
    return 0;
  }
  else {
    return 22;
  }
}

- (BOOL)isDiscarded
{
  return self->_isDiscarded;
}

- (int)tryCount
{
  return self->_tryCount;
}

- (int)generationNumber
{
  return self->_generationNumber;
}

- (void)setGenerationNumber:(int)a3
{
  self->_generationNumber = a3;
}

- (__DDScanQuery)scanQuery
{
  return self->_query;
}

- (BOOL)_containerReadyForDetection
{
  return 1;
}

- (void)dispatchScanQueryCreationWithCompletionBlock:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke;
  uint64_t v10 = &unk_1E5A857E8;
  uint64_t v11 = self;
  id v12 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1A6236DA0](&v7);
  -[DDOperation dispatchContainerModificationBlock:](self, "dispatchContainerModificationBlock:", v6, v7, v8, v9, v10, v11);
}

- (void)dealloc
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDOperation _createScanQuery].cold.8();
  }
  if (self->_container)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"DDOperation.m" lineNumber:278 description:@"Container should already be nil"];
  }
  if (self->_query)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"DDOperation.m" lineNumber:279 description:@"Scan query should already be nil"];
  }
  v6.receiver = self;
  v6.super_class = (Class)DDOperation;
  [(DDOperation *)&v6 dealloc];
}

+ (id)urlificationBlockForTypes:(unint64_t)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__DDOperation_urlificationBlockForTypes___block_invoke;
  v6[3] = &__block_descriptor_40_e70___NSString_40__0____DDResult__8__NSString_16__NSDate_24__NSTimeZone_32l;
  v6[4] = a3;
  int v3 = (void *)MEMORY[0x1A6236DA0](v6, a2);
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)_rangeValidForContainer
{
  return 1;
}

- (__DDScanQuery)_createScanQueryForBackend
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"DDOperation.m" lineNumber:84 description:@"_createScanQueryForBackend has to be overridden by subclasses"];

  return 0;
}

- (BOOL)doURLificationOnDocument
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"DDOperation.m" lineNumber:250 description:@"_doURLificationOnDocument must be overridden by DDOperation subclasses"];

  return 0;
}

- (void)dispatchContainerModificationBlock:(id)a3
{
  BOOL v4 = dispatch_get_global_queue(0, 0);
  dispatch_async(v4, a3);
}

- (void)cancel
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDOperation _createScanQuery].cold.8();
  }
  [(DDOperation *)self setIsDiscarded:1];
  int v3 = self;
  objc_sync_enter(v3);
  [MEMORY[0x1E4F5F158] cancelJob:v3->_jobIdentifier];
  objc_sync_exit(v3);

  v4.receiver = v3;
  v4.super_class = (Class)DDOperation;
  [(DDOperation *)&v4 cancel];
}

- (BOOL)needsToStartOver
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(DDOperation *)self container];
  objc_super v6 = (void *)[v4 initWithContainer:v5];

  objc_msgSend(v6, "setDetectionTypes:", -[DDOperation detectionTypes](self, "detectionTypes"));
  uint64_t v7 = [(DDOperation *)self context];
  [v6 setContext:v7];

  objc_msgSend(v6, "setTryCount:", -[DDOperation tryCount](self, "tryCount"));
  return v6;
}

- (id)newOperationForStartingOver
{
  int v3 = (void *)[(DDOperation *)self copy];
  objc_msgSend(v3, "setTryCount:", -[DDOperation tryCount](self, "tryCount") + 1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDOperation newOperationForStartingOver](v3);
  }
  return v3;
}

- (void)setNeedContinuation:(BOOL)a3
{
  self->_needContinuation = a3;
}

- (void)setTryCount:(int)a3
{
  self->_tryCount = a3;
}

- (void)setIsDiscarded:(BOOL)a3
{
  self->_isDiscarded = a3;
}

- (void)setScannerResults:(id)a3
{
}

- (void)_createScanQuery
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "operation %p", v1, v2, v3, v4, v5);
}

- (void)newOperationForStartingOver
{
  objc_super v6 = [a1 container];
  OUTLINED_FUNCTION_2_2(&dword_1A1709000, MEMORY[0x1E4F14500], v1, "Created operation %@ to start over for container %@", v2, v3, v4, v5, 2u);
}

void __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__DDOperation_dispatchScanQueryCreationWithCompletionBlock___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end