@interface MADService
+ (BOOL)_isEntitledForVUIndexAccess;
+ (BOOL)isEntitled;
+ (NSSet)allowedClasses;
+ (NSSet)allowedMultiModalInputClasses;
+ (NSSet)allowedMultiModalRequestClasses;
+ (NSSet)allowedMultiModalResultClasses;
+ (NSSet)allowedVideoRequestClasses;
+ (NSSet)allowedVideoResultClasses;
+ (NSString)serviceName;
+ (Protocol)serverProtocol;
+ (id)allowedTextRequestClasses;
+ (id)allowedTextResultClasses;
+ (id)service;
+ (void)configureServerInterface:(id)a3;
- (BOOL)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 onAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 error:(id *)a7;
- (BOOL)performRequests:(id)a3 onAssetWithSyndicationIdentifier:(id)a4 error:(id *)a5;
- (BOOL)performRequests:(id)a3 onImageData:(id)a4 withUniformTypeIdentifier:(id)a5 andIdentifier:(id)a6 error:(id *)a7;
- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 withIdentifier:(id)a5 error:(id *)a6;
- (MADService)init;
- (id)connection;
- (id)initInternal;
- (id)queryPerformanceMeasurements;
- (id)requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL:(id)a3 error:(id *)a4;
- (id)requestVUIndexURLForPhotoLibraryURL:(id)a3 error:(id *)a4;
- (id)requestVUIndexURLForSystemPhotosLibraryWithError:(id *)a3;
- (id)sandboxExtensionForURL:(id)a3 error:(id *)a4;
- (id)userSafetyEnabled:(id *)a3;
- (int)_performRequests:(id)a3 onIOSurface:(id)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8;
- (int)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (int)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 completionHandler:(id)a8;
- (int)performRequests:(id)a3 multiModalInputs:(id)a4 completionHandler:(id)a5;
- (int)performRequests:(id)a3 onAssetWithCloudIdentifier:(id)a4 completionHandler:(id)a5;
- (int)performRequests:(id)a3 onAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 completionHandler:(id)a7;
- (int)performRequests:(id)a3 onAssetWithLocalIdentifier:(id)a4 fromPhotoLibraryWithURL:(id)a5 completionHandler:(id)a6;
- (int)performRequests:(id)a3 onCGImage:(CGImage *)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7;
- (int)performRequests:(id)a3 onCGImage:(CGImage *)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8;
- (int)performRequests:(id)a3 onCIImage:(id)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7;
- (int)performRequests:(id)a3 onImageData:(id)a4 withUniformTypeIdentifier:(id)a5 andIdentifier:(id)a6 completionHandler:(id)a7;
- (int)performRequests:(id)a3 onImageURL:(id)a4 completionHandler:(id)a5;
- (int)performRequests:(id)a3 onImageURL:(id)a4 withIdentifier:(id)a5 completionHandler:(id)a6;
- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7;
- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8;
- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 completionHandler:(id)a6;
- (int)performRequests:(id)a3 text:(id)a4 identifier:(id)a5 completionHandler:(id)a6;
- (int)performRequests:(id)a3 textInputs:(id)a4 completionHandler:(id)a5;
- (int)performRequests:(id)a3 videoURL:(id)a4 identifier:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (int)performRequestsWithCloudIdentifiers:(id)a3 completionHandler:(id)a4;
- (int)prewarmMultiModalRequests:(id)a3 completionHandler:(id)a4;
- (int)prewarmTextRequests:(id)a3 completionHandler:(id)a4;
- (int)queryImagePriority1MCEnableDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5;
- (int)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 completionHandler:(id)a5;
- (int)queryVUIndexLastFullModeClusterDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5;
- (int)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 completionHandler:(id)a4;
- (int64_t)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5;
- (unint64_t)currentOutstandingTasks;
- (void)addProgressHandler:(id)a3 forRequestID:(int)a4;
- (void)addResultHandler:(id)a3 forRequestID:(int)a4;
- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4;
- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 engagementSuggestionType:(id)a5;
- (void)cancelAllRequests;
- (void)cancelRequestID:(int)a3;
- (void)dealloc;
- (void)endEntryPoint;
- (void)handleResult:(id)a3 atRequestIdx:(unint64_t)a4 forRequestID:(int)a5;
- (void)init;
- (void)removeProgressHandlerForRequestID:(int)a3;
- (void)removeResultHandlerForRequestID:(int)a3;
- (void)reportProgress:(double)a3 forRequest:(int)a4;
- (void)resetPerformanceMeasurements;
- (void)startEntryPointWithQueryID:(unint64_t)a3;
- (void)startEntryPointWithQueryID:(unint64_t)a3 andEvent:(unint64_t)a4;
- (void)submitSearchableItem:(id)a3 completionHandler:(id)a4;
- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
@end

@implementation MADService

+ (BOOL)isEntitled
{
  if (+[MADService isEntitled]::onceToken != -1) {
    dispatch_once(&+[MADService isEntitled]::onceToken, &__block_literal_global);
  }
  return +[MADService isEntitled]::entitled;
}

+ (id)service
{
  BOOL v2 = +[MADService isEntitled];
  v3 = off_1E6CACE58;
  if (!v2) {
    v3 = off_1E6CACE68;
  }
  v4 = (void *)[objc_alloc(*v3) initInternal];
  return v4;
}

- (id)initInternal
{
  v14.receiver = self;
  v14.super_class = (Class)MADService;
  BOOL v2 = [(MADService *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MADService.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    atomic_store(1u, (unsigned int *)&v2->_requestID);
    dispatch_queue_t v5 = dispatch_queue_create("MADService.progressHandlerQueue", 0);
    progressHandlerQueue = v2->_progressHandlerQueue;
    v2->_progressHandlerQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    progressHandlers = v2->_progressHandlers;
    v2->_progressHandlers = (NSMutableDictionary *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("MADService.resultHandlerQueue", 0);
    resultHandlerQueue = v2->_resultHandlerQueue;
    v2->_resultHandlerQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    resultHandlers = v2->_resultHandlers;
    v2->_resultHandlers = (NSMutableDictionary *)v11;
  }
  return v2;
}

const void **__24__MADService_isEntitled__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  SecTaskRef v0 = SecTaskCreateFromSelf(0);
  SecTaskRef v6 = v0;
  if (v0)
  {
    CFTypeRef v1 = SecTaskCopyValueForEntitlement(v0, @"com.apple.mediaanalysisd.client", 0);
    *(void *)cf1 = v1;
    BOOL v3 = v1
      && (CFTypeID v2 = CFGetTypeID(v1), v2 == CFBooleanGetTypeID())
      && CFEqual(*(CFTypeRef *)cf1, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    +[MADService isEntitled]::entitled = v3;
    CF<CGColorSpace *>::~CF((const void **)cf1);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if (+[MADService isEntitled]::entitled) {
      v4 = "Entitled";
    }
    else {
      v4 = "Not entitled";
    }
    *(_DWORD *)cf1 = 136315138;
    *(void *)&cf1[4] = v4;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Process is %s", cf1, 0xCu);
  }
  return CF<CGColorSpace *>::~CF((const void **)&v6);
}

- (MADService)init
{
  BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v3) {
    [(MADService *)v3 init];
  }

  return 0;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MADService;
  [(MADService *)&v3 dealloc];
}

+ (void)configureServerInterface:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() allowedClasses];
  [v3 setClasses:v4 forSelector:sel_requestImageProcessing_forIOSurface_withOrientation_identifier_requestID_andReply_ argumentIndex:0 ofReply:0];

  uint64_t v5 = [(id)objc_opt_class() allowedClasses];
  [v3 setClasses:v5 forSelector:sel_requestImageProcessing_forIOSurface_withOrientation_identifier_requestID_andReply_ argumentIndex:0 ofReply:1];

  uint64_t v6 = [(id)objc_opt_class() allowedClasses];
  [v3 setClasses:v6 forSelector:sel_requestImageProcessing_forAssetURL_withSandboxToken_identifier_requestID_andReply_ argumentIndex:0 ofReply:0];

  uint64_t v7 = [(id)objc_opt_class() allowedClasses];
  [v3 setClasses:v7 forSelector:sel_requestImageProcessing_forAssetURL_withSandboxToken_identifier_requestID_andReply_ argumentIndex:0 ofReply:1];

  uint64_t v8 = [(id)objc_opt_class() allowedVideoRequestClasses];
  [v3 setClasses:v8 forSelector:sel_requestVideoProcessing_assetURL_sandboxToken_identifier_requestID_reply_ argumentIndex:0 ofReply:0];

  uint64_t v9 = [(id)objc_opt_class() allowedVideoResultClasses];
  [v3 setClasses:v9 forSelector:sel_requestVideoProcessing_assetURL_sandboxToken_identifier_requestID_reply_ argumentIndex:0 ofReply:1];

  uint64_t v10 = [(id)objc_opt_class() allowedTextRequestClasses];
  [v3 setClasses:v10 forSelector:sel_requestTextPrewarming_requestID_reply_ argumentIndex:0 ofReply:0];

  uint64_t v11 = [(id)objc_opt_class() allowedTextRequestClasses];
  [v3 setClasses:v11 forSelector:sel_requestTextProcessing_textInputs_requestID_reply_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  objc_super v14 = [v12 setWithArray:v13];
  [v3 setClasses:v14 forSelector:sel_requestTextProcessing_textInputs_requestID_reply_ argumentIndex:1 ofReply:0];

  v15 = [(id)objc_opt_class() allowedTextResultClasses];
  [v3 setClasses:v15 forSelector:sel_requestTextProcessing_textInputs_requestID_reply_ argumentIndex:0 ofReply:1];

  v16 = [(id)objc_opt_class() allowedMultiModalRequestClasses];
  [v3 setClasses:v16 forSelector:sel_requestMultiModalPrewarming_requestID_reply_ argumentIndex:0 ofReply:0];

  v17 = [(id)objc_opt_class() allowedMultiModalRequestClasses];
  [v3 setClasses:v17 forSelector:sel_requestProcessing_multiModalInputs_requestID_reply_ argumentIndex:0 ofReply:0];

  v18 = [(id)objc_opt_class() allowedMultiModalInputClasses];
  [v3 setClasses:v18 forSelector:sel_requestProcessing_multiModalInputs_requestID_reply_ argumentIndex:1 ofReply:0];

  v19 = [(id)objc_opt_class() allowedMultiModalResultClasses];
  [v3 setClasses:v19 forSelector:sel_requestProcessing_multiModalInputs_requestID_reply_ argumentIndex:0 ofReply:1];
}

- (id)connection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__MADService_connection__block_invoke;
  v5[3] = &unk_1E6CAD260;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__MADService_connection__block_invoke(uint64_t a1)
{
  CFTypeID v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = [(id)objc_opt_class() serviceName];
    uint64_t v5 = [v3 initWithMachServiceName:v4 options:0];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v9 = [[MADServiceProxy alloc] initWithService:*(void *)(a1 + 32)];
    [v8 setExportedObject:v9];

    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 16);
    id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F382DB30];
    [v10 setExportedInterface:v11];

    v12 = (void *)MEMORY[0x1E4F29280];
    v13 = [(id)objc_opt_class() serverProtocol];
    objc_super v14 = [v12 interfaceWithProtocol:v13];

    [(id)objc_opt_class() configureServerInterface:v14];
    [*(id *)(*(void *)(a1 + 32) + 16) setRemoteObjectInterface:v14];
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:&__block_literal_global_59];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __24__MADService_connection__block_invoke_60;
    v19 = &unk_1E6CAD238;
    objc_copyWeak(&v20, &location);
    [v15 setInvalidationHandler:&v16];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    CFTypeID v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __24__MADService_connection__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __24__MADService_connection__block_invoke_2_cold_1();
  }
}

void __24__MADService_connection__block_invoke_60(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    __24__MADService_connection__block_invoke_60_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__MADService_connection__block_invoke_61;
    block[3] = &unk_1E6CAD210;
    block[4] = v11;
    dispatch_async(v12, block);
  }
}

void __24__MADService_connection__block_invoke_61(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void)addProgressHandler:(id)a3 forRequestID:(int)a4
{
  id v6 = a3;
  uint64_t v7 = &__block_literal_global_64;
  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MADService_addProgressHandler_forRequestID___block_invoke_2;
  block[3] = &unk_1E6CAD2A8;
  int v12 = a4;
  if (v6) {
    uint64_t v7 = v6;
  }
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(progressHandlerQueue, block);
}

void __46__MADService_addProgressHandler_forRequestID___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = objc_msgSend(v2, "objectForKeyedSubscript:");

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __46__MADService_addProgressHandler_forRequestID___block_invoke_2_cold_1();
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E01AAEE0](*(void *)(a1 + 40));
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
    [v4 setObject:v7 forKeyedSubscript:v5];
  }
}

- (void)removeProgressHandlerForRequestID:(int)a3
{
  progressHandlerQueue = self->_progressHandlerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MADService_removeProgressHandlerForRequestID___block_invoke;
  v4[3] = &unk_1E6CAD2D0;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(progressHandlerQueue, v4);
}

void __48__MADService_removeProgressHandlerForRequestID___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = objc_msgSend(v2, "objectForKeyedSubscript:");

  if (v3)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
    id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 40)];
    objc_msgSend(v4, "removeObjectForKey:");
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __48__MADService_removeProgressHandlerForRequestID___block_invoke_cold_1();
  }
}

- (void)reportProgress:(double)a3 forRequest:(int)a4
{
  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MADService_reportProgress_forRequest___block_invoke;
  block[3] = &unk_1E6CAD2F8;
  block[4] = self;
  int v6 = a4;
  *(double *)&void block[5] = a3;
  dispatch_sync(progressHandlerQueue, block);
}

void __40__MADService_reportProgress_forRequest___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    v4[2](v4, *(unsigned int *)(a1 + 48), *(double *)(a1 + 40));
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __40__MADService_reportProgress_forRequest___block_invoke_cold_1();
  }
}

- (void)addResultHandler:(id)a3 forRequestID:(int)a4
{
  id v6 = a3;
  id v7 = &__block_literal_global_68;
  resultHandlerQueue = self->_resultHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MADService_addResultHandler_forRequestID___block_invoke_2;
  block[3] = &unk_1E6CAD2A8;
  int v12 = a4;
  if (v6) {
    id v7 = v6;
  }
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(resultHandlerQueue, block);
}

void __44__MADService_addResultHandler_forRequestID___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = objc_msgSend(v2, "objectForKeyedSubscript:");

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __44__MADService_addResultHandler_forRequestID___block_invoke_2_cold_1();
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E01AAEE0](*(void *)(a1 + 40));
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
    id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
    [v4 setObject:v7 forKeyedSubscript:v5];
  }
}

- (void)removeResultHandlerForRequestID:(int)a3
{
  resultHandlerQueue = self->_resultHandlerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MADService_removeResultHandlerForRequestID___block_invoke;
  v4[3] = &unk_1E6CAD2D0;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(resultHandlerQueue, v4);
}

void __46__MADService_removeResultHandlerForRequestID___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = objc_msgSend(v2, "objectForKeyedSubscript:");

  if (v3)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
    id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 40)];
    objc_msgSend(v4, "removeObjectForKey:");
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __46__MADService_removeResultHandlerForRequestID___block_invoke_cold_1();
  }
}

- (void)handleResult:(id)a3 atRequestIdx:(unint64_t)a4 forRequestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__69;
  v24 = __Block_byref_object_dispose__70;
  id v25 = 0;
  resultHandlerQueue = self->_resultHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MADService_handleResult_atRequestIdx_forRequestID___block_invoke;
  block[3] = &unk_1E6CAD340;
  block[4] = self;
  void block[5] = &v20;
  int v19 = v5;
  dispatch_sync(resultHandlerQueue, block);
  uint64_t v10 = v21[5];
  if (v10)
  {
    (*(void (**)(uint64_t, id, unint64_t))(v10 + 16))(v10, v8, a4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[MADService handleResult:atRequestIdx:forRequestID:](v5, v11, v12, v13, v14, v15, v16, v17);
  }
  _Block_object_dispose(&v20, 8);
}

void __53__MADService_handleResult_atRequestIdx_forRequestID___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = objc_msgSend(v2, "objectForKeyedSubscript:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  v43[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = CVPixelBufferGetIOSurface(a4);
  if (v15)
  {
    add = (void *)atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    id v28 = v14;
    uint64_t v17 = MADSignpostLog();
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    int v19 = MADSignpostLog();
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67109378;
      int v39 = (int)add;
      __int16 v40 = 2112;
      id v41 = v13;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MADService_performRequestsOnPixelBuffer", "Request: %d Identifier: %@", buf, 0x12u);
    }

    v21 = [(MADService *)self connection];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke;
    v35[3] = &unk_1E6CAD368;
    id v22 = v14;
    id v36 = v22;
    int v37 = (int)add;
    v23 = [v21 remoteObjectProxyWithErrorHandler:v35];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_78;
    v29[3] = &unk_1E6CAD390;
    os_signpost_id_t v33 = v18;
    int v34 = (int)add;
    id v30 = v13;
    id v31 = v12;
    id v32 = v22;
    [v23 requestImageProcessing:v31 forIOSurface:v15 withOrientation:v9 identifier:v30 requestID:add andReply:v29];

    id v14 = v28;
    v24 = v36;
  }
  else
  {
    add = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    v24 = [NSString stringWithFormat:@"CVPixelBuffer must be IOSurface-backed"];
    v43[0] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v26 = [add errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v25];
    (*((void (**)(id, uint64_t, void *))v14 + 2))(v14, 0xFFFFFFFFLL, v26);

    LODWORD(add) = -1;
  }

  return (int)add;
}

void __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnPixelBuffer", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v14 = [v5 objectAtIndexedSubscript:i];
    uint64_t v15 = [v14 results];
    [v13 setResults:v15];

    uint64_t v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    uint64_t v17 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v18 = [v17 error];
    [v16 setError:v18];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int)performRequests:(id)a3 onCGImage:(CGImage *)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v37 = a6;
  id v38 = a7;
  id v36 = CGImageGetProperty();
  if (v36)
  {
    uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    id v13 = MADSignpostLog();
    os_signpost_id_t v14 = os_signpost_id_generate(v13);

    uint64_t v15 = MADSignpostLog();
    uint64_t v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = add;
      __int16 v57 = 2112;
      id v58 = v37;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MADService_performRequestsOnCGImage", "Request: %d Identifier: %@", buf, 0x12u);
    }

    uint64_t v17 = [(MADService *)self connection];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke;
    v50[3] = &unk_1E6CAD368;
    id v18 = v38;
    id v51 = v18;
    int v52 = add;
    int v19 = [v17 remoteObjectProxyWithErrorHandler:v50];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke_80;
    v44[3] = &unk_1E6CAD390;
    os_signpost_id_t v48 = v14;
    int v49 = add;
    id v45 = v37;
    id v46 = v39;
    id v47 = v18;
    [v19 requestImageProcessing:v46 forIOSurface:v36 withOrientation:v9 identifier:v45 requestID:add andReply:v44];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADService] Requested CGImage is not IOSurface backed, creating CVPixelBuffer on-demand (scaling if needed)", buf, 2u);
    }
    size_t Width = CGImageGetWidth(a4);
    size_t Height = CGImageGetHeight(a4);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v39;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v55 count:16];
    uint64_t v24 = v9;
    unint64_t v25 = 0;
    if (v23)
    {
      uint64_t v26 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v22);
          }
          unint64_t v28 = [(id)objc_opt_class() targetResolution];
          if (v25 <= v28) {
            unint64_t v25 = v28;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v55 count:16];
      }
      while (v23);
    }

    double v31 = 1.0;
    if (Height * Width > 11 * v25 / 0xA) {
      double v31 = sqrt((double)v25 / (double)(Height * Width));
    }
    *(void *)buf = 0;
    if (CGImage_CreateCVPixelBufferWithTransform(a4, (__CVBuffer **)buf, v29, v30, v31))
    {
      id v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      os_signpost_id_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"Error creating CVPixelBuffer from non-IOSurface-backed CGImage with downscaling factor %f", *(void *)&v31);
      v54 = v33;
      int v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t add = [v32 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v34];
      (*((void (**)(id, uint64_t, uint64_t))v38 + 2))(v38, 0xFFFFFFFFLL, add);

      LODWORD(add) = -1;
    }
    else
    {
      LODWORD(add) = [(MADService *)self performRequests:v22 onPixelBuffer:*(void *)buf withOrientation:v24 andIdentifier:v37 completionHandler:v38];
    }
    CF<CGColorSpace *>::~CF((const void **)buf);
  }

  return add;
}

void __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__MADService_performRequests_onCGImage_withOrientation_andIdentifier_completionHandler___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnCGImage", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    os_signpost_id_t v14 = [v5 objectAtIndexedSubscript:i];
    uint64_t v15 = [v14 results];
    [v13 setResults:v15];

    uint64_t v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    uint64_t v17 = [v5 objectAtIndexedSubscript:i];
    id v18 = [v17 error];
    [v16 setError:v18];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int)performRequests:(id)a3 onCIImage:(id)a4 withOrientation:(unsigned int)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, uint64_t, void *))a7;
  if ([v13 pixelBuffer] && CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v13, "pixelBuffer")))
  {
    int v16 = -[MADService performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:](self, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v12, [v13 pixelBuffer], v9, v14, v15);
  }
  else
  {
    CFTypeRef cf = 0;
    uint64_t v33 = *MEMORY[0x1E4F24D20];
    v34[0] = MEMORY[0x1E4F1CC08];
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1, 0);
    CFDictionaryRef v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    [v13 extent];
    double v19 = v18;
    [v13 extent];
    double v21 = v20;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    CVPixelBufferCreate(0, (unint64_t)v19, (unint64_t)v21, 0x42475241u, v17, (CVPixelBufferRef *)&cf);
    uint64_t v22 = (__CVBuffer *)cf;
    if (cf)
    {
      uint64_t v23 = (const void *)[v13 colorSpace];
      CVBufferSetAttachment(v22, (CFStringRef)*MEMORY[0x1E4F24A00], v23, kCVAttachmentMode_ShouldPropagate);
      uint64_t v24 = [MEMORY[0x1E4F1E018] context];
      [v24 render:v13 toCVPixelBuffer:cf];

      int v16 = [(MADService *)self performRequests:v12 onPixelBuffer:cf withOrientation:v9 andIdentifier:v14 completionHandler:v15];
    }
    else
    {
      unint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v26 = [NSString stringWithFormat:@"Error allocating CVPixelBuffer"];
      id v32 = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      unint64_t v28 = [v25 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v27];
      v15[2](v15, 0xFFFFFFFFLL, v28);

      int v16 = -1;
    }

    CF<CGColorSpace *>::~CF(&cf);
  }

  return v16;
}

- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 completionHandler:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__MADService_performRequests_onPixelBuffer_withOrientation_completionHandler___block_invoke;
  v13[3] = &unk_1E6CAD3B8;
  id v14 = v10;
  id v11 = v10;
  LODWORD(v6) = [(MADService *)self performRequests:a3 onPixelBuffer:a4 withOrientation:v6 andIdentifier:0 completionHandler:v13];

  return v6;
}

uint64_t __78__MADService_performRequests_onPixelBuffer_withOrientation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sandboxExtensionForURL:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 path];
  [v6 UTF8String];
  uint64_t v7 = (void *)sandbox_extension_issue_file();

  if (v7)
  {
    a4 = [NSString stringWithUTF8String:v7];
    free(v7);
  }
  else if (a4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    uint64_t v9 = NSString;
    id v10 = [v5 path];
    id v11 = [v9 stringWithFormat:@"Failed to create sandbox extension for %@", v10];
    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = [v8 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v12];

    a4 = 0;
  }

  return a4;
}

- (int)performRequests:(id)a3 onImageURL:(id)a4 withIdentifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v36 = 0;
  id v13 = [(MADService *)self sandboxExtensionForURL:v10 error:&v36];
  id v14 = v36;
  uint64_t v15 = v14;
  if (v13)
  {
    id v25 = v14;
    uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    CFDictionaryRef v17 = MADSignpostLog();
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    double v19 = MADSignpostLog();
    double v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67109378;
      int v38 = add;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MADService_performRequestsOnImageURL", "Request: %d Identifier: %@", buf, 0x12u);
    }

    double v21 = [(MADService *)self connection];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke;
    v33[3] = &unk_1E6CAD368;
    id v22 = v12;
    id v34 = v22;
    int v35 = add;
    uint64_t v23 = [v21 remoteObjectProxyWithErrorHandler:v33];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke_92;
    v27[3] = &unk_1E6CAD390;
    os_signpost_id_t v31 = v18;
    int v32 = add;
    id v28 = v11;
    id v29 = v26;
    id v30 = v22;
    [v23 requestImageProcessing:v29 forAssetURL:v10 withSandboxToken:v13 identifier:v28 requestID:add andReply:v27];

    uint64_t v15 = v25;
  }
  else
  {
    LODWORD(add) = -1;
    (*((void (**)(id, uint64_t, id))v12 + 2))(v12, 0xFFFFFFFFLL, v14);
  }

  return add;
}

void __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__MADService_performRequests_onImageURL_withIdentifier_completionHandler___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageURL", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v14 = [v5 objectAtIndexedSubscript:i];
    uint64_t v15 = [v14 results];
    [v13 setResults:v15];

    int v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    CFDictionaryRef v17 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v18 = [v17 error];
    [v16 setError:v18];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int)performRequests:(id)a3 onImageURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__MADService_performRequests_onImageURL_completionHandler___block_invoke;
  v11[3] = &unk_1E6CAD3B8;
  id v12 = v8;
  id v9 = v8;
  LODWORD(a4) = [(MADService *)self performRequests:a3 onImageURL:a4 withIdentifier:0 completionHandler:v11];

  return (int)a4;
}

uint64_t __59__MADService_performRequests_onImageURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 withIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v23 = a5;
  uint64_t v37 = 0;
  int v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy_;
  uint64_t v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  id obj = 0;
  id v12 = [(MADService *)self sandboxExtensionForURL:v11 error:&obj];
  objc_storeStrong(&v42, obj);
  if (v12)
  {
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 1;
    uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    id v14 = MADSignpostLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);

    int v16 = MADSignpostLog();
    CFDictionaryRef v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 67109378;
      int v44 = add;
      __int16 v45 = 2112;
      id v46 = v23;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MADService_performRequestsOnImageURLSync", "Request: %d Identifier: %@", buf, 0x12u);
    }

    os_signpost_id_t v18 = [(MADService *)self connection];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke;
    v31[3] = &unk_1E6CAD3E0;
    v31[4] = &v37;
    v31[5] = &v32;
    double v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v31];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_93;
    v24[3] = &unk_1E6CAD408;
    os_signpost_id_t v29 = v15;
    int v30 = add;
    id v25 = v23;
    id v26 = v10;
    v27 = &v32;
    id v28 = &v37;
    [v19 requestImageProcessing:v26 forAssetURL:v11 withSandboxToken:v12 identifier:v25 requestID:add andReply:v24];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v44 = add;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADService] Analysis returns for RequestID %d (synchronous)", buf, 8u);
    }
    if (a6)
    {
      __int16 v20 = (void *)v38[5];
      if (v20) {
        *a6 = v20;
      }
    }
    BOOL v21 = *((unsigned char *)v33 + 24) != 0;

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    BOOL v21 = 0;
    if (a6) {
      *a6 = (id)[(id)v38[5] copy];
    }
  }

  _Block_object_dispose(&v37, 8);
  return v21;
}

void __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = [v3 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 32);
    v22[0] = 67109378;
    v22[1] = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageURLSync", "Request: %d Identifier: %@", (uint8_t *)v22, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    uint64_t v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v14 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v15 = [v14 results];
    [v13 setResults:v15];

    int v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    CFDictionaryRef v17 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v18 = [v17 error];
    [v16 setError:v18];
  }
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_93_cold_1();
    }
    uint64_t v19 = [v6 copy];
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

- (int)performRequests:(id)a3 onImageData:(id)a4 withUniformTypeIdentifier:(id)a5 andIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v28 = a7;
  uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  CFDictionaryRef v17 = MADSignpostLog();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  uint64_t v19 = MADSignpostLog();
  uint64_t v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 67109378;
    int v39 = add;
    __int16 v40 = 2112;
    id v41 = v15;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MADService_performRequestsOnImageData", "Request: %d Identifier: %@", buf, 0x12u);
  }

  BOOL v21 = [(MADService *)self connection];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke;
  v35[3] = &unk_1E6CAD368;
  id v22 = v28;
  id v36 = v22;
  int v37 = add;
  __int16 v23 = [v21 remoteObjectProxyWithErrorHandler:v35];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke_94;
  v29[3] = &unk_1E6CAD390;
  os_signpost_id_t v33 = v18;
  int v34 = add;
  id v24 = v15;
  id v30 = v24;
  id v25 = v12;
  id v31 = v25;
  id v26 = v22;
  id v32 = v26;
  [v23 requestImageProcessing:v25 forImageData:v13 withUniformTypeIdentifier:v14 identifier:v24 requestID:add andReply:v29];

  return add;
}

void __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_completionHandler___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageData", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v14 = [v5 objectAtIndexedSubscript:i];
    id v15 = [v14 results];
    [v13 setResults:v15];

    int v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    CFDictionaryRef v17 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v18 = [v17 error];
    [v16 setError:v18];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)performRequests:(id)a3 onImageData:(id)a4 withUniformTypeIdentifier:(id)a5 andIdentifier:(id)a6 error:(id *)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v27 = a5;
  id v26 = a6;
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  uint64_t v36 = 0;
  int v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = __Block_byref_object_copy_;
  __int16 v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  id v15 = MADSignpostLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  CFDictionaryRef v17 = MADSignpostLog();
  os_signpost_id_t v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67109378;
    int v47 = add;
    __int16 v48 = 2112;
    id v49 = v26;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "MADService_performRequestsOnImageDataSync", "Request: %d Identifier: %@", buf, 0x12u);
  }

  uint64_t v19 = [(MADService *)self connection];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke;
  v35[3] = &unk_1E6CAD3E0;
  void v35[4] = &v36;
  v35[5] = &v42;
  __int16 v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v35];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_95;
  v28[3] = &unk_1E6CAD408;
  os_signpost_id_t v33 = v16;
  int v34 = add;
  id v21 = v26;
  id v29 = v21;
  id v22 = v12;
  id v30 = v22;
  id v31 = &v42;
  id v32 = &v36;
  [v20 requestImageProcessing:v22 forImageData:v13 withUniformTypeIdentifier:v27 identifier:v21 requestID:add andReply:v28];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v47 = add;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADService] Analysis returns for RequestID %d (synchronous)", buf, 8u);
  }
  if (a7)
  {
    __int16 v23 = (void *)v37[5];
    if (v23) {
      *a7 = v23;
    }
  }
  BOOL v24 = *((unsigned char *)v43 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v24;
}

void __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = [v3 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 32);
    v22[0] = 67109378;
    v22[1] = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnImageDataSync", "Request: %d Identifier: %@", (uint8_t *)v22, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    uint64_t v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v14 = [v5 objectAtIndexedSubscript:i];
    id v15 = [v14 results];
    [v13 setResults:v15];

    os_signpost_id_t v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    CFDictionaryRef v17 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v18 = [v17 error];
    [v16 setError:v18];
  }
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_93_cold_1();
    }
    uint64_t v19 = [v6 copy];
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

- (int)performRequests:(id)a3 videoURL:(id)a4 identifier:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v12 = a4;
  id v28 = a5;
  id v13 = a6;
  id v14 = a7;
  id v39 = 0;
  id v15 = [(MADService *)self sandboxExtensionForURL:v12 error:&v39];
  id v16 = v39;
  id v26 = v16;
  if (v15)
  {
    uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    os_signpost_id_t v18 = MADSignpostLog();
    os_signpost_id_t v19 = os_signpost_id_generate(v18);

    uint64_t v20 = MADSignpostLog();
    id v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 67109378;
      int v41 = add;
      __int16 v42 = 2112;
      id v43 = v28;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MADService_performRequestsOnVideoURL", "Request: %d Identifier: %@", buf, 0x12u);
    }

    [(MADService *)self addProgressHandler:v13 forRequestID:add];
    id v22 = [(MADService *)self connection];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke;
    v36[3] = &unk_1E6CAD430;
    v36[4] = self;
    int v38 = add;
    id v23 = v14;
    id v37 = v23;
    uint64_t v24 = [v22 remoteObjectProxyWithErrorHandler:v36];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke_96;
    v29[3] = &unk_1E6CAD458;
    os_signpost_id_t v34 = v19;
    int v35 = add;
    id v30 = v28;
    id v31 = self;
    id v32 = v27;
    id v33 = v23;
    [v24 requestVideoProcessing:v32 assetURL:v12 sandboxToken:v15 identifier:v30 requestID:add reply:v29];
  }
  else
  {
    LODWORD(add) = -1;
    (*((void (**)(id, uint64_t, id))v14 + 2))(v14, 0xFFFFFFFFLL, v16);
  }

  return add;
}

void __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [*(id *)(a1 + 32) removeProgressHandlerForRequestID:*(unsigned int *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__MADService_performRequests_videoURL_identifier_progressHandler_completionHandler___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 32);
    v18[0] = 67109378;
    v18[1] = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnVideoURL", "Request: %d Identifier: %@", (uint8_t *)v18, 0x12u);
  }

  [*(id *)(a1 + 40) removeProgressHandlerForRequestID:*(unsigned int *)(a1 + 72)];
  for (unint64_t i = 0; i < [v5 count]; ++i)
  {
    id v13 = [v5 objectAtIndexedSubscript:i];
    id v14 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
    id v15 = [v13 results];
    [v14 setResults:v15];

    id v16 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
    CFDictionaryRef v17 = [v13 error];
    [v16 setError:v17];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)cancelRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(MADService *)self connection];
  BOOL v4 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_98];
  [v4 cancelRequest:v3];
}

void __30__MADService_cancelRequestID___block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)cancelAllRequests
{
  id v3 = [(MADService *)self connection];
  uint64_t v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_100];
  [v2 cancelAllRequests];
}

void __31__MADService_cancelAllRequests__block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (unint64_t)currentOutstandingTasks
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = [(MADService *)self connection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_102];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MADService_currentOutstandingTasks__block_invoke_103;
  v6[3] = &unk_1E6CAD4A0;
  v6[4] = &v7;
  [v3 currentOutstandingTasksWithReply:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __37__MADService_currentOutstandingTasks__block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

uint64_t __37__MADService_currentOutstandingTasks__block_invoke_103(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlers, 0);
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_progressHandlerQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (int)performRequests:(id)a3 onAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 completionHandler:(id)a7
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v12 = a4;
  id v29 = a6;
  id v13 = a7;
  if ([(id)objc_opt_class() isEntitled])
  {
    uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    id v15 = [NSString stringWithFormat:@"Request: %d Identifier: (%lu)%@", add, a5, v12];
    id v16 = MADSignpostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    os_signpost_id_t v18 = MADSignpostLog();
    __int16 v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v40 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MADService_performRequestsOnAsset", "%@", buf, 0xCu);
    }

    uint64_t v20 = [(MADService *)self connection];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke;
    v36[3] = &unk_1E6CAD368;
    id v21 = v13;
    id v37 = v21;
    int v38 = add;
    id v22 = [v20 remoteObjectProxyWithErrorHandler:v36];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke_167;
    v30[3] = &unk_1E6CAD390;
    os_signpost_id_t v34 = v17;
    id v23 = v15;
    id v31 = v23;
    id v32 = v28;
    id v33 = v21;
    int v35 = add;
    [v22 requestImageProcessing:v32 forAssetWithIdentifier:v12 identifierType:a5 fromPhotoLibraryWithURL:v29 requestID:add andReply:v30];

    uint64_t v24 = v37;
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    id v23 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v42[0] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    id v26 = [v25 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v24];
    (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, 0xFFFFFFFFLL, v26);

    LODWORD(add) = -1;
  }

  return add;
}

void __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __117__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_completionHandler___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v18 = 138412290;
    uint64_t v19 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "%@", (uint8_t *)&v18, 0xCu);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v13 = [v5 objectAtIndexedSubscript:i];
    id v14 = [v13 results];
    [v12 setResults:v14];

    id v15 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v16 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v17 = [v16 error];
    [v15 setError:v17];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int)performRequests:(id)a3 onAssetWithLocalIdentifier:(id)a4 fromPhotoLibraryWithURL:(id)a5 completionHandler:(id)a6
{
  return [(MADService *)self performRequests:a3 onAssetWithIdentifier:a4 identifierType:0 fromPhotoLibraryWithURL:a5 completionHandler:a6];
}

- (BOOL)performRequests:(id)a3 onAssetWithIdentifier:(id)a4 identifierType:(unint64_t)a5 fromPhotoLibraryWithURL:(id)a6 error:(id *)a7
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v27 = a6;
  if ([(id)objc_opt_class() isEntitled])
  {
    uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    id v26 = [NSString stringWithFormat:@"Request: %d Identifier: (%lu)%@", add, a5, v13];
    id v15 = MADSignpostLog();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    os_signpost_id_t v17 = MADSignpostLog();
    int v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v26;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "MADService_performRequestsOnAssetSync", "%@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v36 = 0;
    id v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x3032000000;
    uint64_t v44 = __Block_byref_object_copy_;
    char v45 = __Block_byref_object_dispose_;
    id v46 = 0;
    uint64_t v19 = [(MADService *)self connection];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke;
    v35[3] = &unk_1E6CAD3E0;
    void v35[4] = &buf;
    v35[5] = &v36;
    uint64_t v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v35];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke_168;
    v28[3] = &unk_1E6CAD408;
    os_signpost_id_t v33 = v16;
    id v21 = v26;
    id v29 = v21;
    id v30 = v12;
    id v31 = &v36;
    int v34 = add;
    p_long long buf = &buf;
    [v20 requestImageProcessing:v30 forAssetWithIdentifier:v13 identifierType:a5 fromPhotoLibraryWithURL:v27 requestID:add andReply:v28];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v40 = 67109120;
      int v41 = add;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADService] Analysis returns for RequestID %d (synchronous)", v40, 8u);
    }
    if (a7)
    {
      id v22 = *(void **)(*((void *)&buf + 1) + 40);
      if (v22) {
        *a7 = v22;
      }
    }
    LOBYTE(a7) = *((unsigned char *)v37 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v36, 8);
    goto LABEL_13;
  }
  if (a7)
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    id v21 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v48[0] = v21;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    *a7 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v24];

    LOBYTE(a7) = 0;
LABEL_13:
  }
  return (char)a7;
}

void __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = [v3 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __105__MADService_Photos__performRequests_onAssetWithIdentifier_identifierType_fromPhotoLibraryWithURL_error___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v21 = 138412290;
    uint64_t v22 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAssetSync", "%@", (uint8_t *)&v21, 0xCu);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    uint64_t v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    uint64_t v13 = [v5 objectAtIndexedSubscript:i];
    id v14 = [v13 results];
    [v12 setResults:v14];

    id v15 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    os_signpost_id_t v16 = [v5 objectAtIndexedSubscript:i];
    os_signpost_id_t v17 = [v16 error];
    [v15 setError:v17];
  }
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_93_cold_1();
    }
    uint64_t v18 = [v6 copy];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- (BOOL)performRequests:(id)a3 onAssetWithSyndicationIdentifier:(id)a4 error:(id *)a5
{
  return [(MADService *)self performRequests:a3 onAssetWithIdentifier:a4 identifierType:2 fromPhotoLibraryWithURL:0 error:a5];
}

- (BOOL)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 error:(id *)a6
{
  return [(MADService *)self performRequests:a3 onAssetWithIdentifier:a4 identifierType:0 fromPhotoLibraryWithURL:a5 error:a6];
}

- (int)_performRequests:(id)a3 onIOSurface:(id)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v32 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  id v31 = v16;
  uint64_t v19 = MADSignpostLog();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  int v21 = MADSignpostLog();
  uint64_t v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)long long buf = 67109378;
    int v43 = add;
    __int16 v44 = 2112;
    id v45 = v15;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADService_performRequestsOnAsset", "Request: %d Identifier: %@", buf, 0x12u);
  }

  uint64_t v23 = [(MADService *)self connection];
  uint64_t v24 = v14;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke;
  v39[3] = &unk_1E6CAD368;
  id v25 = v17;
  id v40 = v25;
  int v41 = add;
  id v26 = [v23 remoteObjectProxyWithErrorHandler:v39];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke_169;
  v33[3] = &unk_1E6CAD390;
  os_signpost_id_t v37 = v20;
  int v38 = add;
  id v27 = v15;
  id v34 = v27;
  id v28 = v24;
  id v35 = v28;
  id v29 = v25;
  id v36 = v29;
  [v26 requestImageProcessing:v28 forIOSurface:v32 withOrientation:v11 assetLocalIdentifier:v27 photoLibraryURL:v31 requestID:add andReply:v33];

  return add;
}

void __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __122__MADService_Photos___performRequests_onIOSurface_withOrientation_assetLocalIdentifier_photoLibraryURL_completionHandler___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "Request: %d Identifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    uint64_t v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v14 = [v5 objectAtIndexedSubscript:i];
    id v15 = [v14 results];
    [v13 setResults:v15];

    id v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v17 = [v5 objectAtIndexedSubscript:i];
    uint64_t v18 = [v17 error];
    [v16 setError:v18];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int)performRequests:(id)a3 onPixelBuffer:(__CVBuffer *)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void (**)(id, uint64_t, void *))a8;
  if (([(id)objc_opt_class() isEntitled] & 1) == 0)
  {
    __int16 v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v18 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v29[0] = v18;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v22 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v21];
    v17[2](v17, 0xFFFFFFFFLL, v22);
LABEL_6:

    int v19 = -1;
    goto LABEL_7;
  }
  uint64_t v18 = CVPixelBufferGetIOSurface(a4);
  if (!v18)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    uint64_t v21 = [NSString stringWithFormat:@"CVPixelBuffer must be IOSurface-backed"];
    id v27 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v24 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v22];
    v17[2](v17, 0xFFFFFFFFLL, v24);

    goto LABEL_6;
  }
  int v19 = [(MADService *)self _performRequests:v14 onIOSurface:v18 withOrientation:v11 assetLocalIdentifier:v15 photoLibraryURL:v16 completionHandler:v17];
LABEL_7:

  return v19;
}

- (int)performRequests:(id)a3 onCGImage:(CGImage *)a4 withOrientation:(unsigned int)a5 assetLocalIdentifier:(id)a6 photoLibraryURL:(id)a7 completionHandler:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void (**)(id, uint64_t, void *))a8;
  if (([(id)objc_opt_class() isEntitled] & 1) == 0)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    __int16 v20 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v34[0] = v20;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v23];
    v17[2](v17, 0xFFFFFFFFLL, v24);

    goto LABEL_5;
  }
  __int16 v20 = CGImageGetProperty();
  if (!v20)
  {
    CVPixelBufferRef pixelBuffer = 0;
    if (!CGImage_CreateCVPixelBufferWithTransform(a4, &pixelBuffer, v18, v19, 1.0))
    {
      __int16 v20 = CVPixelBufferGetIOSurface(pixelBuffer);
      CF<CGColorSpace *>::~CF((const void **)&pixelBuffer);
      goto LABEL_3;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    id v27 = [NSString stringWithFormat:@"Failed to transfer CGImage to IOSurface"];
    id v32 = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v29 = [v26 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v28];
    v17[2](v17, 0xFFFFFFFFLL, v29);

    CF<CGColorSpace *>::~CF((const void **)&pixelBuffer);
    __int16 v20 = 0;
LABEL_5:
    int v21 = -1;
    goto LABEL_6;
  }
LABEL_3:
  int v21 = [(MADService *)self _performRequests:v14 onIOSurface:v20 withOrientation:v11 assetLocalIdentifier:v15 photoLibraryURL:v16 completionHandler:v17];
LABEL_6:

  return v21;
}

- (int)performRequests:(id)a3 onAssetWithCloudIdentifier:(id)a4 completionHandler:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() isEntitled])
  {
    uint64_t add = (void *)atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    uint64_t v12 = MADSignpostLog();
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    id v14 = MADSignpostLog();
    id v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)long long buf = 67109378;
      int v33 = (int)add;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MADService_performRequestsOnAsset", "Request: %d cloudIdentifier: %@", buf, 0x12u);
    }

    id v16 = [(MADService *)self connection];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke;
    v29[3] = &unk_1E6CAD368;
    id v17 = v10;
    id v30 = v17;
    int v31 = (int)add;
    unsigned int v18 = [v16 remoteObjectProxyWithErrorHandler:v29];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke_173;
    v23[3] = &unk_1E6CAD390;
    os_signpost_id_t v27 = v13;
    int v28 = (int)add;
    id v24 = v9;
    id v25 = v8;
    id v26 = v17;
    [v18 requestImageProcessing:v25 forAssetWithCloudIdentifier:v24 requestID:add andReply:v23];

    CGImagePropertyOrientation v19 = v30;
  }
  else
  {
    uint64_t add = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    CGImagePropertyOrientation v19 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v37[0] = v19;
    __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    int v21 = [add errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v20];
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 0xFFFFFFFFLL, v21);

    LODWORD(add) = -1;
  }

  return (int)add;
}

void __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__MADService_Photos__performRequests_onAssetWithCloudIdentifier_completionHandler___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = 67109378;
    v19[1] = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "Request: %d cloudIdentifier: %@", (uint8_t *)v19, 0x12u);
  }

  for (unint64_t i = 0; i < [*(id *)(a1 + 40) count]; ++i)
  {
    os_signpost_id_t v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v14 = [v5 objectAtIndexedSubscript:i];
    id v15 = [v14 results];
    [v13 setResults:v15];

    id v16 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
    id v17 = [v5 objectAtIndexedSubscript:i];
    unsigned int v18 = [v17 error];
    [v16 setError:v18];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int)performRequestsWithCloudIdentifiers:(id)a3 completionHandler:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() isEntitled])
  {
    uint64_t add = (void *)atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    os_signpost_id_t v9 = MADSignpostLog();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    uint64_t v11 = MADSignpostLog();
    uint64_t v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_DWORD *)long long buf = 67109376;
      int v29 = (int)add;
      __int16 v30 = 2048;
      uint64_t v31 = [v6 count];
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MADService_performRequestsOnAsset", "[MADService RequestID %d]: %lu cloudIdentifiers", buf, 0x12u);
    }

    os_signpost_id_t v13 = [(MADService *)self connection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke;
    v25[3] = &unk_1E6CAD368;
    id v14 = v7;
    id v26 = v14;
    int v27 = (int)add;
    id v15 = [v13 remoteObjectProxyWithErrorHandler:v25];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_174;
    void v20[3] = &unk_1E6CAD4F0;
    os_signpost_id_t v23 = v10;
    int v24 = (int)add;
    id v21 = v6;
    id v22 = v14;
    [v15 requestImageProcessingWithCloudIdentifierRequests:v21 requestID:add andReply:v20];

    id v16 = v26;
  }
  else
  {
    uint64_t add = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    id v16 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v33[0] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    unsigned int v18 = [add errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
    (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 0xFFFFFFFFLL, v18);

    LODWORD(add) = -1;
  }

  return (int)add;
}

void __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_174(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(_DWORD *)(a1 + 56);
    uint64_t v11 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 67109376;
    int v17 = v10;
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnAsset", "[MADService RequestID %d]: %lu cloudIdentifiers", buf, 0x12u);
  }

  uint64_t v12 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_175;
  v14[3] = &unk_1E6CAD4C8;
  id v13 = v5;
  id v15 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v14];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__MADService_Photos__performRequestsWithCloudIdentifiers_completionHandler___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  for (unint64_t i = 0; i < [v5 count]; ++i)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:i];
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
    os_signpost_id_t v9 = [v8 objectAtIndexedSubscript:i];
    int v10 = [v9 results];
    [v7 setResults:v10];

    uint64_t v11 = [v5 objectAtIndexedSubscript:i];
    uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
    id v13 = [v12 objectAtIndexedSubscript:i];
    id v14 = [v13 error];
    [v11 setError:v14];
  }
}

- (int)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v29 = a4;
  id v12 = a5;
  id v28 = a6;
  id v13 = a7;
  if ([(id)objc_opt_class() isEntitled])
  {
    uint64_t add = (void *)atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    id v15 = [NSString stringWithFormat:@"Request: %d Identifier: %@ (%lu)", add, v29, 0];
    id v16 = MADSignpostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    __int16 v18 = MADSignpostLog();
    uint64_t v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)long long buf = 138412290;
      int v41 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MADService_performRequestsOnVideoAsset", "%@", buf, 0xCu);
    }

    [(MADService *)self addProgressHandler:v28 forRequestID:add];
    uint64_t v20 = [(MADService *)self connection];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke;
    v37[3] = &unk_1E6CAD430;
    v37[4] = self;
    int v39 = (int)add;
    id v21 = v13;
    id v38 = v21;
    id v22 = [v20 remoteObjectProxyWithErrorHandler:v37];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke_181;
    v30[3] = &unk_1E6CAD458;
    os_signpost_id_t v35 = v17;
    id v23 = v15;
    id v31 = v23;
    uint64_t v32 = self;
    int v36 = (int)add;
    id v33 = v27;
    id v34 = v21;
    [v22 requestVideoProcessing:v33 assetIdentifier:v29 identifierType:0 photoLibraryURL:v12 requestID:add isIncremental:0 reply:v30];
  }
  else
  {
    uint64_t add = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    id v23 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v43[0] = v23;
    int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    id v25 = [add errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v24];
    (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, 0xFFFFFFFFLL, v25);

    LODWORD(add) = -1;
  }

  return (int)add;
}

void __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [*(id *)(a1 + 32) removeProgressHandlerForRequestID:*(unsigned int *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_completionHandler___block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v17 = 138412290;
    uint64_t v18 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_performRequestsOnVideoAsset", "%@", (uint8_t *)&v17, 0xCu);
  }

  [*(id *)(a1 + 40) removeProgressHandlerForRequestID:*(unsigned int *)(a1 + 72)];
  for (unint64_t i = 0; i < [v5 count]; ++i)
  {
    id v12 = [v5 objectAtIndexedSubscript:i];
    id v13 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
    id v14 = [v12 results];
    [v13 setResults:v14];

    id v15 = [*(id *)(a1 + 48) objectAtIndexedSubscript:i];
    id v16 = [v12 error];
    [v15 setError:v16];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (int)performRequests:(id)a3 assetLocalIdentifier:(id)a4 photoLibraryURL:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 completionHandler:(id)a8
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v14 = a4;
  id v15 = a5;
  id v35 = a6;
  id v36 = a7;
  id v16 = a8;
  if ([(id)objc_opt_class() isEntitled])
  {
    uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    id v33 = [NSString stringWithFormat:@"Request: %d Identifier: %@ (%lu)", add, v14, 0];
    id v32 = v15;
    uint64_t v18 = MADSignpostLog();
    os_signpost_id_t v19 = os_signpost_id_generate(v18);

    uint64_t v20 = MADSignpostLog();
    id v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)long long buf = 138412290;
      id v51 = v33;
      _os_signpost_emit_with_name_impl(&dword_1DCC91000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MADService_performRequestsOnVideoAsset", "%@", buf, 0xCu);
    }

    [(MADService *)self addProgressHandler:v35 forRequestID:add];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke;
    v46[3] = &unk_1E6CAD518;
    id v22 = v34;
    id v47 = v22;
    int v49 = add;
    id v48 = v36;
    id v23 = (void *)MEMORY[0x1E01AAEE0](v46);
    [(MADService *)self addResultHandler:v23 forRequestID:add];
    int v24 = [(MADService *)self connection];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_182;
    void v43[3] = &unk_1E6CAD430;
    v43[4] = self;
    int v45 = add;
    id v25 = v16;
    id v44 = v25;
    id v26 = [v24 remoteObjectProxyWithErrorHandler:v43];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_183;
    v37[3] = &unk_1E6CAD390;
    os_signpost_id_t v41 = v19;
    id v27 = v33;
    id v38 = v27;
    int v39 = self;
    int v42 = add;
    id v40 = v25;
    id v15 = v32;
    [v26 requestVideoProcessing:v22 assetIdentifier:v14 identifierType:0 photoLibraryURL:v32 requestID:add isIncremental:1 reply:v37];

    id v28 = v47;
  }
  else
  {
    id v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    id v27 = [NSString stringWithFormat:@"Photos asset processing not available"];
    v53[0] = v27;
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    __int16 v30 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v28];
    (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, 0xFFFFFFFFLL, v30);

    LODWORD(add) = -1;
  }

  return add;
}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count] >= a3)
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    uint64_t v7 = [v5 results];
    [v6 setResults:v7];

    uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    os_signpost_id_t v9 = [v5 error];
    [v8 setError:v9];

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = *(unsigned int *)(a1 + 48);
      id v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
      (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v11, v12);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_cold_1(a3, a1);
  }
}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_182(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v4) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [*(id *)(a1 + 32) removeProgressHandlerForRequestID:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) removeResultHandlerForRequestID:*(unsigned int *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_183(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MADSignpostLog();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v6, OS_SIGNPOST_INTERVAL_END, v7, "MADService_performRequestsOnVideoAsset", "%@", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 40) removeProgressHandlerForRequestID:*(unsigned int *)(a1 + 64)];
  [*(id *)(a1 + 40) removeResultHandlerForRequestID:*(unsigned int *)(a1 + 64)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (BOOL)_isEntitledForVUIndexAccess
{
  if (+[MADService(Photos) _isEntitledForVUIndexAccess]::onceToken != -1) {
    dispatch_once(&+[MADService(Photos) _isEntitledForVUIndexAccess]::onceToken, &__block_literal_global_185);
  }
  return +[MADService(Photos) _isEntitledForVUIndexAccess]::entitled;
}

const void **__49__MADService_Photos___isEntitledForVUIndexAccess__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  SecTaskRef v0 = SecTaskCreateFromSelf(0);
  SecTaskRef v6 = v0;
  if (v0)
  {
    CFTypeRef v1 = SecTaskCopyValueForEntitlement(v0, @"com.apple.private.mediaanalysisd.datamanagement.vuindex", 0);
    *(void *)cf1 = v1;
    BOOL v3 = v1
      && (CFTypeID v2 = CFGetTypeID(v1), v2 == CFBooleanGetTypeID())
      && CFEqual(*(CFTypeRef *)cf1, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    +[MADService(Photos) _isEntitledForVUIndexAccess]::entitled = v3;
    CF<CGColorSpace *>::~CF((const void **)cf1);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if (+[MADService(Photos) _isEntitledForVUIndexAccess]::entitled) {
      id v4 = "Entitled";
    }
    else {
      id v4 = "Not entitled";
    }
    *(_DWORD *)cf1 = 136315138;
    *(void *)&cf1[4] = v4;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Process is %s for VU Index access", cf1, 0xCu);
  }
  return CF<CGColorSpace *>::~CF((const void **)&v6);
}

- (id)requestVUIndexURLForSystemPhotosLibraryWithError:(id *)a3
{
  BOOL v3 = [(MADService *)self requestVUIndexURLForPhotoLibraryURL:0 error:a3];
  return v3;
}

- (id)requestVUIndexURLForPhotoLibraryURL:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(id)objc_opt_class() _isEntitledForVUIndexAccess])
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy_;
    id v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x3032000000;
    os_signpost_id_t v19 = __Block_byref_object_copy_;
    uint64_t v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    os_signpost_id_t v7 = [(MADService *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke;
    v15[3] = &unk_1E6CAD540;
    v15[4] = &v16;
    uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_192;
    v14[3] = &unk_1E6CAD568;
    void v14[4] = &v22;
    v14[5] = &v16;
    [v8 requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:v6 reply:v14];

    if (a4)
    {
      int v9 = (void *)v17[5];
      if (v9) {
        *a4 = (id)[v9 copy];
      }
    }
    a4 = (id *)(id)v23[5];
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else if (a4)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithFormat:@"Process is not entitled! exiting ..."];
    v29[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a4 = [v10 errorWithDomain:*MEMORY[0x1E4F28760] code:-19 userInfo:v12];

    a4 = 0;
  }

  return a4;
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  }
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_192(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v38 = v7;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADService] Packaging VU Index directory secure URL %@", buf, 0xCu);
    }
    MEMORY[0x1E01AABB0](v7, v8);
    int v10 = [v7 startAccessingSecurityScopedResource];
    uint64_t v11 = [v7 URLByAppendingPathComponent:@"VUIndex.sqlite"];
    id v12 = [v11 path];

    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v14 = [v13 fileExistsAtPath:v12];

    if (v10) {
      [v7 stopAccessingSecurityScopedResource];
    }
    if (v14)
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      id v16 = v7;
      int v17 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v16;
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"VUIndex file does not exist", *MEMORY[0x1E4F28568]);
      id v36 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v23 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v22];
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v26) {
        __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_192_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
      }
      uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 8);
      int v17 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_192_cold_2();
    }
    uint64_t v18 = [v9 copy];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- (int64_t)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ([(id)objc_opt_class() _isEntitledForVUIndexAccess])
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy_;
    uint64_t v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    id v9 = [(MADService *)self connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke;
    v17[3] = &unk_1E6CAD540;
    v17[4] = &v18;
    int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v17];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_204;
    v16[3] = &unk_1E6CAD590;
    v16[4] = &v18;
    v16[5] = &v24;
    [v10 queryVUIndexAssetCountForType:a3 photoLibraryURL:v8 reply:v16];

    if (a5)
    {
      uint64_t v11 = (void *)v19[5];
      if (v11) {
        *a5 = (id)[v11 copy];
      }
    }
    a5 = (id *)v25[3];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
  else if (a5)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithFormat:@"Process is not entitled to query VU index asset count! exiting ..."];
    v29[0] = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a5 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-19 userInfo:v14];

    a5 = 0;
  }

  return (int64_t)a5;
}

void __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  }
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_204(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_204_cold_1();
    }
    uint64_t v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (int)queryVUIndexAssetCountForType:(int64_t)a3 photoLibraryURL:(id)a4 completionHandler:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([(id)objc_opt_class() _isEntitledForVUIndexAccess])
  {
    int add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
    uint64_t v11 = [(MADService *)self connection];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    _DWORD v22[2] = __86__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_completionHandler___block_invoke;
    v22[3] = &unk_1E6CAD368;
    id v12 = v9;
    id v23 = v12;
    int v24 = add;
    id v13 = [v11 remoteObjectProxyWithErrorHandler:v22];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    _DWORD v19[2] = __86__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_completionHandler___block_invoke_206;
    v19[3] = &unk_1E6CAD5B8;
    id v20 = v12;
    int v21 = add;
    [v13 queryVUIndexAssetCountForType:a3 photoLibraryURL:v8 reply:v19];

    int v14 = v23;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    int v14 = [NSString stringWithFormat:@"Process is not entitled to query VU index asset count! exiting ..."];
    v26[0] = v14;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    int v17 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-19 userInfo:v16];
    (*((void (**)(id, uint64_t, void, void *))v9 + 2))(v9, 0xFFFFFFFFLL, 0, v17);

    int add = -1;
  }

  return add;
}

void __86__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_completionHandler___block_invoke_206(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3);
}

- (int)queryVUIndexLastFullModeClusterDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (a3) {
    *a3 = 0;
  }
  id v9 = [(MADService *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke;
  v16[3] = &unk_1E6CAD540;
  v16[4] = &v17;
  int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_207;
  v15[3] = &unk_1E6CAD5E0;
  v15[4] = &v17;
  void v15[5] = &v23;
  [v10 queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:v8 reply:v15];

  if (a3)
  {
    uint64_t v11 = (void *)v24[5];
    if (v11) {
      *a3 = v11;
    }
  }
  int v12 = 0;
  if (a5)
  {
    id v13 = (void *)v18[5];
    if (v13)
    {
      int v12 = [v13 code];
      *a5 = (id)[(id)v18[5] copy];
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

void __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  }
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_207(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_207_cold_1();
    }
    uint64_t v8 = [v7 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (int)queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  uint64_t v9 = [(MADService *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__MADService_Photos__queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL_completionHandler___block_invoke;
  v17[3] = &unk_1E6CAD368;
  id v10 = v7;
  id v18 = v10;
  int v19 = add;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__MADService_Photos__queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL_completionHandler___block_invoke_209;
  v14[3] = &unk_1E6CAD608;
  id v12 = v10;
  id v15 = v12;
  int v16 = add;
  [v11 queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:v6 reply:v14];

  return add;
}

void __95__MADService_Photos__queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__MADService_Photos__queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL_completionHandler___block_invoke_209(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3);
}

- (int)queryImagePriority1MCEnableDate:(id *)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (a3) {
    *a3 = 0;
  }
  uint64_t v9 = [(MADService *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__MADService_Photos__queryImagePriority1MCEnableDate_photoLibraryURL_error___block_invoke;
  v16[3] = &unk_1E6CAD540;
  v16[4] = &v17;
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __76__MADService_Photos__queryImagePriority1MCEnableDate_photoLibraryURL_error___block_invoke_210;
  v15[3] = &unk_1E6CAD5E0;
  v15[4] = &v17;
  void v15[5] = &v23;
  [v10 queryImagePriority1MCEnableDateWithPhotoLibraryURL:v8 reply:v15];

  if (a3)
  {
    uint64_t v11 = (void *)v24[5];
    if (v11) {
      *a3 = v11;
    }
  }
  int v12 = 0;
  if (a5)
  {
    id v13 = (void *)v18[5];
    if (v13)
    {
      int v12 = [v13 code];
      *a5 = (id)[(id)v18[5] copy];
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

void __76__MADService_Photos__queryImagePriority1MCEnableDate_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  }
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __76__MADService_Photos__queryImagePriority1MCEnableDate_photoLibraryURL_error___block_invoke_210(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __76__MADService_Photos__queryImagePriority1MCEnableDate_photoLibraryURL_error___block_invoke_210_cold_1();
    }
    uint64_t v8 = [v7 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  int v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v7 = [(MADService *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke;
  v13[3] = &unk_1E6CAD540;
  void v13[4] = &v14;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke_211;
  v12[3] = &unk_1E6CAD568;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 requestVisionCacheStorageDirectoryURLForPhotoLibraryURL:v6 reply:v12];

  if (a4)
  {
    uint64_t v9 = (void *)v15[5];
    if (v9) {
      *a4 = (id)[v9 copy];
    }
  }
  id v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1();
  }
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __100__MADService_Photos__requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL_error___block_invoke_211(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADService] Packaging directory secure URL %@", (uint8_t *)&v15, 0xCu);
    }
    MEMORY[0x1E01AABB0](v7, v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = v7;
    int v12 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_192_cold_2();
    }
    uint64_t v13 = [v9 copy];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)queryPerformanceMeasurements
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  CFTypeID v2 = [(MADService *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_247];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MADService_Performance__queryPerformanceMeasurements__block_invoke_248;
  v6[3] = &unk_1E6CAD630;
  v6[4] = &v7;
  [v3 queryPerformanceMeasurementsWithReply:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__MADService_Performance__queryPerformanceMeasurements__block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __55__MADService_Performance__queryPerformanceMeasurements__block_invoke_248(uint64_t a1, void *a2)
{
}

- (void)resetPerformanceMeasurements
{
  id v3 = [(MADService *)self connection];
  uint64_t v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_251];
  [v2 resetPerformanceMeasurements];
}

void __55__MADService_Performance__resetPerformanceMeasurements__block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __30__MADService_cancelRequestID___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

+ (NSString)serviceName
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (Protocol)serverProtocol
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (NSSet)allowedClasses
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (NSSet)allowedVideoRequestClasses
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (NSSet)allowedVideoResultClasses
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (id)allowedTextRequestClasses
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (id)allowedTextResultClasses
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (NSSet)allowedMultiModalRequestClasses
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    +[MADService(ProtocolDefaults) serviceName];
  }
  return 0;
}

+ (NSSet)allowedMultiModalInputClasses
{
  v6[2] = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)allowedMultiModalResultClasses
{
  v6[2] = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)userSafetyEnabled:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  uint64_t v4 = [(MADService *)self connection];
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_283];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MADService_UserSafety__userSafetyEnabled___block_invoke_284;
  v9[3] = &unk_1E6CAD658;
  v9[4] = &v16;
  v9[5] = &v10;
  [v5 queryUserSafetyEnablement:v9];

  if (a3)
  {
    uint64_t v6 = (void *)v11[5];
    if (v6) {
      *a3 = (id)[v6 copy];
    }
  }
  uint64_t v7 = (void *)[(id)v17[5] copy];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __44__MADService_UserSafety__userSafetyEnabled___block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __44__MADService_UserSafety__userSafetyEnabled___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)startEntryPointWithQueryID:(unint64_t)a3
{
  id v5 = [(MADService *)self connection];
  uint64_t v4 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_289];
  [v4 startEntryPointWithQueryID:a3];
}

void __54__MADService_VIAnalytics__startEntryPointWithQueryID___block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)startEntryPointWithQueryID:(unint64_t)a3 andEvent:(unint64_t)a4
{
  id v7 = [(MADService *)self connection];
  uint64_t v6 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_291];
  [v6 startEntryPointWithQueryID:a3 andEvent:a4];
}

void __63__MADService_VIAnalytics__startEntryPointWithQueryID_andEvent___block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4
{
  id v7 = [(MADService *)self connection];
  uint64_t v6 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_293];
  [v6 cacheHitWithQueryID:a3 cachedResultQueryID:a4];
}

void __67__MADService_VIAnalytics__cacheHitWithQueryID_cachedResultQueryID___block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 engagementSuggestionType:(id)a5
{
  id v10 = a5;
  uint64_t v8 = [(MADService *)self connection];
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_295];
  [v9 cacheHitWithQueryID:a3 cachedResultQueryID:a4 engagementSuggestionType:v10];
}

void __92__MADService_VIAnalytics__cacheHitWithQueryID_cachedResultQueryID_engagementSuggestionType___block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)endEntryPoint
{
  id v3 = [(MADService *)self connection];
  uint64_t v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_297];
  [v2 endEntryPoint];
}

void __40__MADService_VIAnalytics__endEntryPoint__block_invoke()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v0) {
    __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (int)prewarmTextRequests:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Request: %d", add);
  id v10 = MADSignpostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = MADSignpostLog();
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MADService_PrewarmTextRequest", "%@", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke;
  v23[3] = &unk_1E6CAD680;
  os_signpost_id_t v26 = v11;
  id v14 = v9;
  id v24 = v14;
  id v15 = v7;
  id v25 = v15;
  uint64_t v16 = (void *)MEMORY[0x1E01AAEE0](v23);
  uint64_t v17 = [(MADService *)self connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_310;
  v21[3] = &unk_1E6CAD6A8;
  id v18 = v16;
  id v22 = v18;
  id v19 = [v17 remoteObjectProxyWithErrorHandler:v21];
  [v19 requestTextPrewarming:v6 requestID:add reply:v18];

  return add;
}

void __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MADSignpostLog();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = a1[4];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MADService_PrewarmTextRequest", "%@", (uint8_t *)&v8, 0xCu);
  }

  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    [v3 description];
    objc_claimAutoreleasedReturnValue();
    __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_310(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  os_signpost_id_t v6 = NSString;
  uint64_t v7 = [v3 description];
  int v8 = [v6 stringWithFormat:@"Error connecting to analysis service (%@)", v7];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);
}

- (int)performRequests:(id)a3 textInputs:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v8 = a4;
  id v24 = a5;
  uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Request: %d", add);
  uint64_t v11 = MADSignpostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = MADSignpostLog();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v34 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MADService_ProcessTextRequest", "%@", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke;
  v27[3] = &unk_1E6CAD390;
  os_signpost_id_t v31 = v12;
  id v15 = v10;
  id v28 = v15;
  id v16 = v23;
  id v29 = v16;
  id v17 = v24;
  id v30 = v17;
  int v32 = add;
  id v18 = (void *)MEMORY[0x1E01AAEE0](v27);
  id v19 = [(MADService *)self connection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke_314;
  v25[3] = &unk_1E6CAD6A8;
  id v20 = v18;
  id v26 = v20;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v25];
  [v21 requestTextProcessing:v16 textInputs:v8 requestID:add reply:v20];

  return add;
}

void __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v18 = 138412290;
    uint64_t v19 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_ProcessTextRequest", "%@", (uint8_t *)&v18, 0xCu);
  }

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      [v6 description];
      objc_claimAutoreleasedReturnValue();
      __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    for (unint64_t i = 0; i < [v5 count]; ++i)
    {
      os_signpost_id_t v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      uint64_t v13 = [v5 objectAtIndexedSubscript:i];
      id v14 = [v13 results];
      [v12 setResults:v14];

      id v15 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      id v16 = [v5 objectAtIndexedSubscript:i];
      id v17 = [v16 error];
      [v15 setError:v17];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __70__MADService_Spotlight__performRequests_textInputs_completionHandler___block_invoke_314(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  id v6 = NSString;
  uint64_t v7 = [v3 description];
  id v8 = [v6 stringWithFormat:@"Error connecting to analysis service (%@)", v7];
  v12[0] = v8;
  os_signpost_id_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v10);
}

- (int)performRequests:(id)a3 text:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  os_signpost_id_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = [[MADTextInput alloc] initWithText:*(void *)(*((void *)&v20 + 1) + 8 * v16)];
        [v12 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  int v18 = [(MADService *)self performRequests:v9 textInputs:v12 completionHandler:v11];
  return v18;
}

- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  id v35 = a5;
  id v11 = a6;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke;
  v41[3] = &unk_1E6CAD6A8;
  id v12 = v11;
  id v42 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x1E01AAEE0](v41);
  id v40 = 0;
  uint64_t v14 = *MEMORY[0x1E4F1C538];
  id v39 = 0;
  LOBYTE(a6) = [v10 getResourceValue:&v40 forKey:v14 error:&v39];
  id v15 = v40;
  id v16 = v39;
  id v17 = v16;
  if (a6)
  {
    id v38 = v16;
    int v18 = [(MADService *)self sandboxExtensionForURL:v10 error:&v38];
    id v19 = v38;

    if (v18)
    {
      long long v20 = [(MADService *)self connection];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke_322;
      v36[3] = &unk_1E6CAD6A8;
      id v21 = v13;
      id v37 = v21;
      long long v22 = [v20 remoteObjectProxyWithErrorHandler:v36];
      long long v23 = [v15 identifier];
      [v22 submitSpotlightAssetURL:v10 uniqueIdentifier:v34 bundleIdentifier:v35 typeIdentifier:v23 sandboxToken:v18 reply:v21];

      id v24 = v37;
    }
    else
    {
      id v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      id v30 = NSString;
      id v24 = [v19 description];
      os_signpost_id_t v31 = [v30 stringWithFormat:@"Failed to create sandbox extension for asset (%@)", v24];
      id v44 = v31;
      int v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v33 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v32];
      ((void (**)(void, void *))v13)[2](v13, v33);
    }
    id v17 = v19;
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    id v26 = NSString;
    int v18 = [v16 description];
    id v24 = [v26 stringWithFormat:@"Failed to obtain UTType for asset (%@)", v18];
    v46[0] = v24;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    id v28 = [v25 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v27];
    ((void (**)(void, void *))v13)[2](v13, v28);
  }
}

void __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    [v3 description];
    objc_claimAutoreleasedReturnValue();
    __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__MADService_Spotlight__submitSpotlightAssetURL_uniqueIdentifier_bundleIdentifier_completionHandler___block_invoke_322(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  id v6 = NSString;
  uint64_t v7 = [v3 description];
  id v8 = [v6 stringWithFormat:@"Error connecting to analysis service (%@)", v7];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);
}

- (void)submitSearchableItem:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [v11 attributeSet];
  id v8 = [v7 contentURL];
  id v9 = [v11 uniqueIdentifier];
  id v10 = [v11 bundleID];
  [(MADService *)self submitSpotlightAssetURL:v8 uniqueIdentifier:v9 bundleIdentifier:v10 completionHandler:v6];
}

- (int)prewarmMultiModalRequests:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Request: %d", add);
  id v10 = MADSignpostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = MADSignpostLog();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)long long buf = 138412290;
    id v29 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MADService_PrewarmMultiModalRequest", "%@", buf, 0xCu);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke;
  v23[3] = &unk_1E6CAD6D0;
  os_signpost_id_t v26 = v11;
  id v14 = v9;
  id v24 = v14;
  id v15 = v7;
  id v25 = v15;
  int v27 = add;
  id v16 = (void *)MEMORY[0x1E01AAEE0](v23);
  id v17 = [(MADService *)self connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke_331;
  v21[3] = &unk_1E6CAD6A8;
  id v18 = v16;
  id v22 = v18;
  id v19 = [v17 remoteObjectProxyWithErrorHandler:v21];
  [v19 requestMultiModalPrewarming:v6 requestID:add reply:v18];

  return add;
}

void __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MADSignpostLog();
  id v5 = v4;
  os_signpost_id_t v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = a1[4];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MADService_PrewarmMultiModalRequest", "%@", (uint8_t *)&v8, 0xCu);
  }

  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    [v3 description];
    objc_claimAutoreleasedReturnValue();
    __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void __70__MADService_MultiModal__prewarmMultiModalRequests_completionHandler___block_invoke_331(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  os_signpost_id_t v6 = NSString;
  uint64_t v7 = [v3 description];
  int v8 = [v6 stringWithFormat:@"Error connecting to analysis service (%@)", v7];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);
}

- (int)performRequests:(id)a3 multiModalInputs:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v8 = a4;
  id v24 = a5;
  uint64_t add = atomic_fetch_add(&self->_requestID.__a_.__a_value, 1u);
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Request: %d", add);
  uint64_t v11 = MADSignpostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = MADSignpostLog();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v34 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MADService_ProcessMultiModalRequest", "%@", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke;
  v27[3] = &unk_1E6CAD390;
  os_signpost_id_t v31 = v12;
  id v15 = v10;
  id v28 = v15;
  id v16 = v23;
  id v29 = v16;
  id v17 = v24;
  id v30 = v17;
  int v32 = add;
  id v18 = (void *)MEMORY[0x1E01AAEE0](v27);
  id v19 = [(MADService *)self connection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke_332;
  v25[3] = &unk_1E6CAD6A8;
  id v20 = v18;
  id v26 = v20;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v25];
  [v21 requestProcessing:v16 multiModalInputs:v8 requestID:add reply:v20];

  return add;
}

void __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MADSignpostLog();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v18 = 138412290;
    uint64_t v19 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DCC91000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MADService_ProcessMultiModalRequest", "%@", (uint8_t *)&v18, 0xCu);
  }

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      [v6 description];
      objc_claimAutoreleasedReturnValue();
      __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    for (unint64_t i = 0; i < [v5 count]; ++i)
    {
      os_signpost_id_t v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      id v13 = [v5 objectAtIndexedSubscript:i];
      id v14 = [v13 results];
      [v12 setResults:v14];

      id v15 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      id v16 = [v5 objectAtIndexedSubscript:i];
      id v17 = [v16 error];
      [v15 setError:v17];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __77__MADService_MultiModal__performRequests_multiModalInputs_completionHandler___block_invoke_332(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  id v6 = NSString;
  uint64_t v7 = [v3 description];
  id v8 = [v6 stringWithFormat:@"Error connecting to analysis service (%@)", v7];
  v12[0] = v8;
  os_signpost_id_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v10);
}

- (void)init
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void __24__MADService_connection__block_invoke_2_cold_1()
{
  *(_WORD *)BOOL v0 = 0;
  _os_log_debug_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[MADService] Client XPC connection interrupted", v0, 2u);
}

void __24__MADService_connection__block_invoke_60_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__MADService_addProgressHandler_forRequestID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Multiple progress handlers for request %d; cannot add",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void __48__MADService_removeProgressHandlerForRequestID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] No progress handler for request %d; cannot remove",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void __40__MADService_reportProgress_forRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] No progress handler for request %d; cannot report",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void __44__MADService_addResultHandler_forRequestID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Multiple result handlers for request %d; cannot add",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void __46__MADService_removeResultHandlerForRequestID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] No result handler for request %d; cannot remove",
    v1,
    v2,
    v3,
    v4,
    v5);
}

- (void)handleResult:(uint64_t)a3 atRequestIdx:(uint64_t)a4 forRequestID:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void __92__MADService_performRequests_onPixelBuffer_withOrientation_andIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__MADService_performRequests_onImageURL_withIdentifier_error___block_invoke_93_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Error during analysis service for RequestID %d (synchronous)", v1, v2, v3, v4, v5);
}

void __88__MADService_performRequests_onImageData_withUniformTypeIdentifier_andIdentifier_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __30__MADService_cancelRequestID___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __123__MADService_Photos__performRequests_assetLocalIdentifier_photoLibraryURL_progressHandler_resultHandler_completionHandler___block_invoke_cold_1(int a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a2 + 48);
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = v2;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[MADService] Failed to report incremental result for request at index %d in MADRequest %d", (uint8_t *)v3, 0xEu);
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Error connecting to background analysis service - %@", v1, v2, v3, v4, v5);
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_192_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__MADService_Photos__requestVUIndexURLForPhotoLibraryURL_error___block_invoke_192_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Failed to connect to service (%@)", v1, v2, v3, v4, v5);
}

void __74__MADService_Photos__queryVUIndexAssetCountForType_photoLibraryURL_error___block_invoke_204_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Failed to query VU index asset count - %@", v1, v2, v3, v4, v5);
}

void __80__MADService_Photos__queryVUIndexLastFullModeClusterDate_photoLibraryURL_error___block_invoke_207_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Failed to query VU index full-mode cluster status - %@", v1, v2, v3, v4, v5);
}

void __76__MADService_Photos__queryImagePriority1MCEnableDate_photoLibraryURL_error___block_invoke_210_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADService] Failed to query date when MC was considered ready to be enabled based on image processing - %@", v1, v2, v3, v4, v5);
}

void __63__MADService_Spotlight__prewarmTextRequests_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_1DCC91000, MEMORY[0x1E4F14500], v3, "%@", v4);
}

@end