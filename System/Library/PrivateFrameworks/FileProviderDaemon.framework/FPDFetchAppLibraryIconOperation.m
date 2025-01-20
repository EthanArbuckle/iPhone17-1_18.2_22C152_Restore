@interface FPDFetchAppLibraryIconOperation
+ (NSOperationQueue)sharedOperationQueue;
- (BOOL)_checkIsNotPrefixedByTeamID:(id)a3;
- (BOOL)_checkTypeIsValid:(id)a3;
- (BOOL)allowAppStoreLookup;
- (BOOL)allowLocalLookup;
- (FPDFetchAppLibraryIconOperation)initWithAppBundleIDs:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5;
- (NSArray)appBundleIDs;
- (NSProgress)progress;
- (id)perAppBundleCompletion;
- (void)_perAppBundleCompletion:(id)a3 iconData:(id)a4 contentType:(id)a5 error:(id)a6;
- (void)_retrieveIconsFromAppStore;
- (void)_retrieveIconsFromLocalDevice;
- (void)_verifyAppBundleIDsFormat;
- (void)main;
- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)setAllowAppStoreLookup:(BOOL)a3;
- (void)setAllowLocalLookup:(BOOL)a3;
- (void)setPerAppBundleCompletion:(id)a3;
@end

@implementation FPDFetchAppLibraryIconOperation

- (FPDFetchAppLibraryIconOperation)initWithAppBundleIDs:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  if (![v11 count]
    || (width >= 1.0 ? (BOOL v12 = width == height) : (BOOL v12 = 0), v12 ? (v13 = a5 < 1.0) : (v13 = 1), v13))
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = objc_opt_class();
    v30.double width = width;
    v30.double height = height;
    v16 = NSStringFromSize(v30);
    [v14 handleFailureInMethod:a2, self, @"FPDFetchAppLibraryIconOperation.m", 68, @"invalid parameter to initialize %@ (appBundleIDs:%@, desiredSize:%@, screenScale:%f)", v15, v11, v16, *(void *)&a5 object file lineNumber description];

    v17 = 0;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)FPDFetchAppLibraryIconOperation;
    v18 = [(FPOperation *)&v29 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_appBundleIDs, a3);
      uint64_t v20 = [v11 mutableCopy];
      appBundleIDsNotFound = v19->_appBundleIDsNotFound;
      v19->_appBundleIDsNotFound = (NSMutableArray *)v20;

      v22 = (NSProgress *)objc_alloc_init(MEMORY[0x1E4F28F90]);
      progress = v19->_progress;
      v19->_progress = v22;

      [(NSProgress *)v19->_progress setTotalUnitCount:[(NSArray *)v19->_appBundleIDs count]];
      [(NSProgress *)v19->_progress setCancellable:1];
      id location = 0;
      objc_initWeak(&location, v19);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __80__FPDFetchAppLibraryIconOperation_initWithAppBundleIDs_desiredSize_screenScale___block_invoke;
      v26[3] = &unk_1E6A74010;
      objc_copyWeak(&v27, &location);
      [(NSProgress *)v19->_progress setCancellationHandler:v26];
      CGFloat v24 = fmin(width, 144.0);
      v19->_desiredSize.double width = v24;
      v19->_desiredSize.double height = v24;
      v19->_screenScale = a5;
      v19->_allowLocalLookup = 1;
      v19->_allowAppStoreLookup = 1;
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    self = v19;
    v17 = self;
  }

  return v17;
}

void __80__FPDFetchAppLibraryIconOperation_initWithAppBundleIDs_desiredSize_screenScale___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  v7 = (void (**)(void))a5;
  id v8 = a3;
  v9 = [v8 objectForKeyedSubscript:@"appBundleID"];
  v10 = [v8 objectForKeyedSubscript:@"mappedData"];
  id v11 = [v8 objectForKeyedSubscript:@"undecorated"];

  char v12 = [v11 BOOLValue];
  if (v9 && v10)
  {
    BOOL v13 = [(FPOperation *)self callbackQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__FPDFetchAppLibraryIconOperation_operationDidProgressWithInfo_error_completionHandler___block_invoke;
    v14[3] = &unk_1E6A740D8;
    v14[4] = self;
    id v15 = v9;
    id v16 = v10;
    char v17 = v12;
    dispatch_async(v13, v14);
  }
  v7[2](v7);
}

uint64_t __88__FPDFetchAppLibraryIconOperation_operationDidProgressWithInfo_error_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v1 = *MEMORY[0x1E4F25BD0];
  }
  else {
    uint64_t v1 = 0;
  }
  return [*(id *)(a1 + 32) _perAppBundleCompletion:*(void *)(a1 + 40) iconData:*(void *)(a1 + 48) contentType:v1 error:0];
}

- (void)main
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = (int)*(double *)(a1 + 304);
  int v4 = (int)*(double *)(a1 + 312);
  int v5 = (int)*(double *)(a1 + 320);
  v6 = [*(id *)(a1 + 344) componentsJoinedByString:@", "];
  v7[0] = 67109890;
  v7[1] = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  __int16 v12 = 2112;
  BOOL v13 = v6;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching thumbnail %dx%d@%dx for [%@] ", (uint8_t *)v7, 0x1Eu);
}

uint64_t __39__FPDFetchAppLibraryIconOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 328) copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        __int16 v8 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"can't retrieve icon for app bundleID '%@'", v7);
        [*(id *)(a1 + 32) _perAppBundleCompletion:v7 iconData:0 contentType:0 error:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) completedWithResult:0 error:0];
}

+ (NSOperationQueue)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1) {
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedOperationQueue_operationQueue;
  return (NSOperationQueue *)v2;
}

uint64_t __55__FPDFetchAppLibraryIconOperation_sharedOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v1 = (void *)sharedOperationQueue_operationQueue;
  sharedOperationQueue_operationQueue = (uint64_t)v0;

  [(id)sharedOperationQueue_operationQueue setMaxConcurrentOperationCount:1];
  v2 = (void *)sharedOperationQueue_operationQueue;
  return [v2 setName:@"com.apple.FileProvider.FetchAppIcon"];
}

- (void)_verifyAppBundleIDsFormat
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] verifying format of provided app bundle IDs", v1, 2u);
}

- (BOOL)_checkTypeIsValid:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_checkIsNotPrefixedByTeamID:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"com.apple."] & 1) != 0
    || (unint64_t)[v3 length] < 0xB
    || [v3 characterAtIndex:10] != 46)
  {
    BOOL v5 = 1;
  }
  else
  {
    if (_checkIsNotPrefixedByTeamID__onceToken != -1) {
      dispatch_once(&_checkIsNotPrefixedByTeamID__onceToken, &__block_literal_global_37);
    }
    uint64_t v4 = [v3 substringToIndex:10];
    BOOL v5 = [v4 rangeOfCharacterFromSet:_checkIsNotPrefixedByTeamID__teamIDCharacterSet] == 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

void __63__FPDFetchAppLibraryIconOperation__checkIsNotPrefixedByTeamID___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] capitalizedLetterCharacterSet];
  uint64_t v1 = (void *)_checkIsNotPrefixedByTeamID__teamIDCharacterSet;
  _checkIsNotPrefixedByTeamID__teamIDCharacterSet = v0;

  v2 = (void *)_checkIsNotPrefixedByTeamID__teamIDCharacterSet;
  id v3 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  [v2 formUnionWithCharacterSet:v3];
}

- (void)_retrieveIconsFromLocalDevice
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx retrieving app icons available locally", (uint8_t *)&v3, 0xCu);
}

void __64__FPDFetchAppLibraryIconOperation__retrieveIconsFromLocalDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

- (void)_retrieveIconsFromAppStore
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx retrieving app icons by asking the App Store", (uint8_t *)&v3, 0xCu);
}

uint64_t __61__FPDFetchAppLibraryIconOperation__retrieveIconsFromAppStore__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_perAppBundleCompletion:(id)a3 iconData:(id)a4 contentType:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v14);

  if (([(FPDFetchAppLibraryIconOperation *)self isCancelled] & 1) == 0)
  {
    uint64_t v15 = [(FPDFetchAppLibraryIconOperation *)self perAppBundleCompletion];

    if (v10)
    {
      if (v15)
      {
        if ([(NSMutableArray *)self->_appBundleIDsNotFound containsObject:v10])
        {
          [(NSMutableArray *)self->_appBundleIDsNotFound removeObject:v10];
          if ([v11 length]) {
            [NSString stringWithFormat:@"found (%lu bytes, ct:%@)", objc_msgSend(v11, "length"), v12];
          }
          else {
          id v16 = [NSString stringWithFormat:@"not found; %@", v13, v23];
          }
          char v17 = fp_current_or_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:]((uint64_t)v10, (uint64_t)v16, v17);
          }

          int64_t v18 = [(NSProgress *)self->_progress completedUnitCount];
          if (v18 >= [(NSProgress *)self->_progress totalUnitCount])
          {
            v21 = [NSString stringWithFormat:@"[ASSERT] ‼️ perAppBundleCompletion was invoked more than once per item"];
            v22 = fp_current_or_default_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
              -[FPDProcessMonitor _addPIDToObserve:]((uint64_t)v21, v22);
            }

            __assert_rtn("-[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/app-library/FPDFetchAppLibraryIconOperation.m", 304, (const char *)[v21 UTF8String]);
          }
          int64_t v19 = [(NSProgress *)self->_progress completedUnitCount];
          if (v19 < [(NSProgress *)self->_progress totalUnitCount]) {
            [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress completedUnitCount] + 1];
          }
          uint64_t v20 = [(FPDFetchAppLibraryIconOperation *)self perAppBundleCompletion];
          ((void (**)(void, id, id, id, id))v20)[2](v20, v10, v11, v12, v13);
        }
        else
        {
          id v16 = fp_current_or_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:]((uint64_t)v10, v16);
          }
        }
      }
    }
  }
}

- (NSArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)perAppBundleCompletion
{
  return self->_perAppBundleCompletion;
}

- (void)setPerAppBundleCompletion:(id)a3
{
}

- (BOOL)allowLocalLookup
{
  return self->_allowLocalLookup;
}

- (void)setAllowLocalLookup:(BOOL)a3
{
  self->_allowLocalLookup = a3;
}

- (BOOL)allowAppStoreLookup
{
  return self->_allowAppStoreLookup;
}

- (void)setAllowAppStoreLookup:(BOOL)a3
{
  self->_allowAppStoreLookup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perAppBundleCompletion, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_appBundleIDs, 0);
  objc_storeStrong((id *)&self->_appBundleIDsNotFound, 0);
}

- (void)_perAppBundleCompletion:(os_log_t)log iconData:contentType:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] icon for %@ %@", (uint8_t *)&v3, 0x16u);
}

- (void)_perAppBundleCompletion:(uint64_t)a1 iconData:(NSObject *)a2 contentType:error:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] perAppBundleCompletion already called for %@", (uint8_t *)&v2, 0xCu);
}

@end