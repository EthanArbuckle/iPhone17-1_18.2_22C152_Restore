@interface QLThumbnailGenerator
+ (QLThumbnailGenerator)sharedGenerator;
+ (id)debugDescriptionForErrorCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 request:(id)a4 additionalUserInfo:(id)a5;
+ (void)initialize;
- (BOOL)__finishRequestIfInvalid:(id)a3;
- (BOOL)__finishRequestIfNeeded:(id)a3;
- (BOOL)__requestWithUUIDIsStillRunning:(id)a3;
- (BOOL)_cancelRequestIfNeeded:(id)a3;
- (BOOL)_finishRequestIfInvalid:(id)a3;
- (BOOL)_finishRequestIfNeeded:(id)a3;
- (BOOL)_isBuildingBatch;
- (BOOL)_queueThumbnailGenerationForRequestIfNeeded:(id)a3;
- (BOOL)_requestRepresentationTypeIsMoreRepresentative:(id)a3 thanType:(int64_t)a4;
- (BOOL)canGenerateThumbnailsForContentType:(id)a3 atSize:(CGSize)a4;
- (NSMutableDictionary)iconsByType;
- (NSMutableDictionary)pendingCancelledRequests;
- (NSMutableDictionary)pendingGenerationRequests;
- (NSMutableDictionary)preparingGenerationRequests;
- (NSMutableDictionary)requests;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)requestPreparationQueue;
- (OS_dispatch_queue)serialResponseQueue;
- (QLThumbnailGenerator)init;
- (QLThumbnailServiceProxy)syncThumbnailServiceProxy;
- (QLThumbnailServiceProxy)thumbnailServiceProxy;
- (id)__requestWithUUID:(id)a3;
- (id)_requestWithUUID:(id)a3;
- (id)thumbnailIconForRequest:(id)a3;
- (os_unfair_lock_s)iconsLock;
- (unint64_t)batchingCount;
- (void)__callCompletionBlockOfRequest:(id)a3 withError:(id)a4;
- (void)__finishRequest:(id)a3 withError:(id)a4;
- (void)__finishRequestWithoutError:(id)a3;
- (void)__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:(id)a3 thumbnail:(id)a4 type:(int64_t)a5 error:(id)a6;
- (void)__removeRequestWithUUID:(id)a3;
- (void)_addRequest:(id)a3;
- (void)_callCompletionBlockOfRequest:(id)a3 withError:(id)a4;
- (void)_callUpdateBlockOfRequestIfRunning:(id)a3 andUpdateMostRepresentativeThumbnail:(id)a4 type:(int64_t)a5 error:(id)a6;
- (void)_createSyncThumbnailServiceProxy;
- (void)_createThumbnailServiceProxy;
- (void)_finishAllRequestsWithError:(id)a3;
- (void)_finishRequest:(id)a3 withError:(id)a4;
- (void)_finishRequestWithoutError:(id)a3;
- (void)_handleThumbnailGenerationCompletionWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 error:(id)a10;
- (void)_logRequestDuration:(id)a3;
- (void)_notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:(id)a3 thumbnail:(id)a4 type:(int64_t)a5 error:(id)a6;
- (void)_performInBatch:(id)a3;
- (void)_prepareSyncThumbnailRequest:(id)a3;
- (void)_prepareThumbnailRequestForQueueOrSending:(id)a3 synchronous:(BOOL)a4;
- (void)_queueIconGenerationForRequestIfNeeded:(id)a3;
- (void)_queueThumbnailRequest:(id)a3;
- (void)_removeRequest:(id)a3;
- (void)_sendPendingBatches;
- (void)_sendPendingCancelledRequests;
- (void)_sendPendingGenerationRequests;
- (void)_sendSyncGenerationRequest:(id)a3;
- (void)_setMostRepresentativeThumbnail:(id)a3 forRequest:(id)a4;
- (void)cancelRequest:(QLThumbnailGenerationRequest *)request;
- (void)didGenerateThumbnailForRequestWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9;
- (void)didUpdateStatus:(int64_t)a3 ofThumbnailGenerationWithUUID:(id)a4;
- (void)failedToGenerateThumbnailOfType:(int64_t)a3 forRequestWithUUID:(id)a4 error:(id)a5;
- (void)generateBestRepresentationForRequest:(QLThumbnailGenerationRequest *)request completionHandler:(void *)completionHandler;
- (void)generateRepresentationsForRequest:(QLThumbnailGenerationRequest *)request updateHandler:(void *)updateHandler;
- (void)generateThumbnailForRequest:(id)a3 updateHandler:(id)a4 statusHandler:(id)a5 completionHandler:(id)a6;
- (void)performInBatch:(id)a3;
- (void)saveBestRepresentationForRequest:(QLThumbnailGenerationRequest *)request toFileAtURL:(NSURL *)fileURL withContentType:(NSString *)contentType completionHandler:(void *)completionHandler;
- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 asContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7;
- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 asContentType:(id)a5 completionHandler:(id)a6;
- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 withContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7;
- (void)saveBestRepresentationForRequest:(id)a3 toFileHandle:(id)a4 asContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7;
- (void)saveBestRepresentationForRequest:(id)a3 toFileHandle:(id)a4 withContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7;
- (void)setBatchingCount:(unint64_t)a3;
- (void)setIconsByType:(id)a3;
- (void)setPendingCancelledRequests:(id)a3;
- (void)setPendingGenerationRequests:(id)a3;
- (void)setPreparingGenerationRequests:(id)a3;
- (void)setRequests:(id)a3;
- (void)setSyncThumbnailServiceProxy:(id)a3;
- (void)setThumbnailServiceProxy:(id)a3;
- (void)synchronousGenerateThumbnailForRequest:(id)a3 updateHandler:(id)a4 statusHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation QLThumbnailGenerator

uint64_t __47__QLThumbnailGenerator__finishRequestIfNeeded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__finishRequestIfNeeded:", *(void *)(a1 + 40));
}

uint64_t __41__QLThumbnailGenerator__requestWithUUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "__requestWithUUID:", *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (void)__finishRequest:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isFinished] & 1) == 0)
  {
    [v6 finish];
    serialResponseQueue = self->_serialResponseQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__QLThumbnailGenerator___finishRequest_withError___block_invoke;
    block[3] = &unk_1E6009AA0;
    id v12 = v7;
    v13 = self;
    id v9 = v6;
    id v14 = v9;
    dispatch_async(serialResponseQueue, block);
    v10 = [v9 uuid];
    [(QLThumbnailGenerator *)self __removeRequestWithUUID:v10];
  }
}

- (void)__removeRequestWithUUID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(QLThumbnailGenerator *)self requests];
  [v6 removeObjectForKey:v5];
}

- (id)__requestWithUUID:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(QLThumbnailGenerator *)self requests];
  id v7 = [v6 objectForKey:v5];

  return v7;
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (void)performInBatch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(QLThumbnailGenerator *)v5 _isBuildingBatch])
  {
    [(QLThumbnailGenerator *)v5 _performInBatch:v4];
  }
  else
  {
    queue = v5->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__QLThumbnailGenerator_performInBatch___block_invoke;
    v7[3] = &unk_1E6009A00;
    v7[4] = v5;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
  objc_sync_exit(v5);
}

- (void)generateThumbnailForRequest:(id)a3 updateHandler:(id)a4 statusHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  unint64_t v13 = (unint64_t)a6;
  if (!(v11 | v13)) {
    -[QLThumbnailGenerator generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:]();
  }
  id v14 = (void *)v13;
  [v10 setUpdateBlock:v11];
  [v10 setStatusBlock:v12];
  [v10 setCompletionBlock:v14];
  v15 = self;
  objc_sync_enter(v15);
  if ([(QLThumbnailGenerator *)v15 _isBuildingBatch])
  {
    [(QLThumbnailGenerator *)v15 _queueThumbnailRequest:v10];
  }
  else
  {
    queue = v15->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __98__QLThumbnailGenerator_generateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke;
    v17[3] = &unk_1E6009870;
    v17[4] = v15;
    id v18 = v10;
    dispatch_sync(queue, v17);
  }
  objc_sync_exit(v15);
}

- (BOOL)_isBuildingBatch
{
  return self->_batchingCount != 0;
}

- (void)_queueThumbnailRequest:(id)a3
{
  id v4 = a3;
  [(QLThumbnailGenerator *)self _prepareThumbnailRequestForQueueOrSending:v4 synchronous:0];
  [(QLThumbnailGenerator *)self _queueThumbnailGenerationForRequestIfNeeded:v4];
}

- (void)_prepareThumbnailRequestForQueueOrSending:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4) {
    [(QLThumbnailGenerator *)self _createSyncThumbnailServiceProxy];
  }
  else {
    [(QLThumbnailGenerator *)self _createThumbnailServiceProxy];
  }
  [v6 markDidBegin];
  if (![(QLThumbnailGenerator *)self __finishRequestIfInvalid:v6]) {
    [(QLThumbnailGenerator *)self _queueIconGenerationForRequestIfNeeded:v6];
  }
}

- (void)_queueIconGenerationForRequestIfNeeded:(id)a3
{
  id v4 = a3;
  if (![(QLThumbnailGenerator *)self __finishRequestIfNeeded:v4]
    && [v4 provideGenericIcon])
  {
    serialResponseQueue = self->_serialResponseQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__QLThumbnailGenerator__queueIconGenerationForRequestIfNeeded___block_invoke;
    v6[3] = &unk_1E6009870;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(serialResponseQueue, v6);
  }
}

- (BOOL)_finishRequestIfNeeded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __47__QLThumbnailGenerator__finishRequestIfNeeded___block_invoke;
  unint64_t v11 = &unk_1E6009870;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(queue, &v8);
  LOBYTE(queue) = objc_msgSend(v6, "isFinished", v8, v9, v10, v11, v12);

  return (char)queue;
}

- (BOOL)__finishRequestIfNeeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(QLThumbnailGenerator *)self __finishRequestIfInvalid:v4]
    && [v4 isCancelled])
  {
    id v5 = +[QLThumbnailGenerator errorWithCode:5 request:v4 additionalUserInfo:0];
    [(QLThumbnailGenerator *)self __finishRequest:v4 withError:v5];
  }
  char v6 = [v4 isFinished];

  return v6;
}

- (BOOL)__finishRequestIfInvalid:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 requestIsInvalidError];

  if (v5)
  {
    char v6 = _log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1B281E000, v6, OS_LOG_TYPE_INFO, "Finishing request %@ because it is invalid.", (uint8_t *)&v9, 0xCu);
    }

    id v7 = [v4 requestIsInvalidError];
    [(QLThumbnailGenerator *)self __finishRequest:v4 withError:v7];
  }
  return v5 != 0;
}

- (void)_createThumbnailServiceProxy
{
  objc_initWeak(&location, self);
  v3 = +[QLThumbnailServiceProxy sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke;
  v6[3] = &unk_1E6009AF0;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  thumbnailServiceProxy = self->_thumbnailServiceProxy;
  self->_thumbnailServiceProxy = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)__callCompletionBlockOfRequest:(id)a3 withError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 completionBlock];

  if (v7)
  {
    id v8 = v6;
    int v9 = [v5 mostRepresentativeThumbnail];

    if (v9)
    {

      id v8 = 0;
    }
    id v10 = (void *)qltLogHandles;
    if (!qltLogHandles)
    {
      QLTInitLogging();
      id v10 = (void *)qltLogHandles;
    }
    uint64_t v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v8)
      {
        id v12 = [NSString stringWithFormat:@"with error: %@", v8];
      }
      else
      {
        id v12 = @"without error.";
      }
      *(_DWORD *)buf = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_1B281E000, v11, OS_LOG_TYPE_INFO, "Calling request completionBlock for %@ %@", buf, 0x16u);
      if (v8) {
    }
      }
    id v13 = [v5 completionBlock];
    id v14 = [v5 mostRepresentativeThumbnail];
    ((void (**)(void, void *, id))v13)[2](v13, v14, v8);

    [v5 setUpdateBlock:0];
    [v5 setStatusBlock:0];
    [v5 setCompletionBlock:0];
  }
}

- (BOOL)_queueThumbnailGenerationForRequestIfNeeded:(id)a3
{
  id v4 = a3;
  if (![(QLThumbnailGenerator *)self __finishRequestIfNeeded:v4])
  {
    if ((unint64_t)[v4 representationTypes] > 1)
    {
      pendingGenerationRequests = self->_pendingGenerationRequests;
      id v7 = [v4 uuid];
      [(NSMutableDictionary *)pendingGenerationRequests setObject:v4 forKeyedSubscript:v7];

      BOOL v5 = 1;
      goto LABEL_6;
    }
    [(QLThumbnailGenerator *)self __finishRequestWithoutError:v4];
  }
  BOOL v5 = 0;
LABEL_6:

  return v5;
}

- (void)didGenerateThumbnailForRequestWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9
{
}

- (void)_handleThumbnailGenerationCompletionWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 error:(id)a10
{
  kern_return_t v34;
  mach_error_t v35;
  NSObject *v36;
  char *v37;
  int v38;
  int *v39;
  char *v40;
  dispatch_data_t v41;
  CGImageRef v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  QLThumbnailGenerator *v48;
  void *v49;
  NSObject *v50;
  int64_t v51;
  void *v52;
  QLThumbnailRepresentation *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  QLThumbnailRepresentation *v57;
  unsigned int v58;
  id v59;
  id v60;
  QLThumbnailGenerator *v61;
  int64_t v62;
  id v63;
  dispatch_block_t destructor;
  void *v65;
  id obj;
  void *v67;
  BOOL v68;
  id v69;
  id v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  uint64_t v75;
  void *v76;
  uint8_t buf[4];
  unsigned char v78[18];
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  CGImageRef v84;
  unsigned char v85[128];
  uint64_t v86;

  v68 = a9;
  v86 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a10;
  uint64_t v19 = _log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:]();
  }

  v65 = [(QLThumbnailGenerator *)self _requestWithUUID:v15];
  if (!v16 || v18)
  {
    [(QLThumbnailGenerator *)self _notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:v65 thumbnail:0 type:a8 error:v18];
LABEL_43:

    goto LABEL_44;
  }
  if (![(QLThumbnailGenerator *)self _finishRequestIfNeeded:v65])
  {
    v58 = a7;
    v61 = self;
    v62 = a8;
    v63 = v17;
    v60 = v15;
    v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v59 = v16;
    obj = v16;
    uint64_t v21 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
    v22 = v65;
    v67 = v20;
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v72;
      destructor = (dispatch_block_t)*MEMORY[0x1E4F143F8];
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v72 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          v27 = [v26 data];
          dispatch_data_t v28 = v27;
          if (v68)
          {
            uint64_t v29 = [v27 length];
            size_t v30 = (v29 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
            v31 = mmap(0, v30, 3, 4097, 1627389952, 0);
            if (v31)
            {
              v32 = v31;
              vm_map_t v33 = *MEMORY[0x1E4F14960];
              dispatch_data_t v28 = v28;
              v34 = vm_copy(v33, [v28 bytes], [v28 length], (vm_address_t)v32);
              if (v34)
              {
                v35 = v34;
                v36 = _log();
                v22 = v65;
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  v37 = mach_error_string(v35);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v78 = v35;
                  *(_WORD *)&v78[4] = 2080;
                  *(void *)&v78[6] = v37;
                  _os_log_error_impl(&dword_1B281E000, v36, OS_LOG_TYPE_ERROR, "Could not copy memory to make the thumbnail count against my jetsam limit: %d (%s)", buf, 0x12u);
                }
              }
              else
              {
                v41 = dispatch_data_create(v32, v30, 0, destructor);
                v36 = v28;
                dispatch_data_t v28 = v41;
                v22 = v65;
              }
              v20 = v67;
            }
            else
            {
              v36 = _log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v38 = *__error();
                v39 = __error();
                v40 = strerror(*v39);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v78 = v38;
                *(_WORD *)&v78[4] = 2080;
                *(void *)&v78[6] = v40;
                _os_log_error_impl(&dword_1B281E000, v36, OS_LOG_TYPE_ERROR, "Could not allocate memory to make the thumbnail count against my jetsam limit: %d (%s)", buf, 0x12u);
              }
            }
          }
          v42 = QLImageCreateForDefaultThumbnailGenerationFromData(v26);
          v43 = qltLogHandles;
          if (!qltLogHandles)
          {
            QLTInitLogging();
            v43 = qltLogHandles;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = v43;
            v45 = [v28 length];
            v46 = [v26 format];
            *(_DWORD *)buf = 138413314;
            *(void *)v78 = v22;
            *(_WORD *)&v78[8] = 2048;
            *(void *)&v78[10] = v45;
            v20 = v67;
            v79 = 2112;
            v80 = v46;
            v81 = 2112;
            v82 = 0;
            v83 = 2112;
            v84 = v42;
            _os_log_impl(&dword_1B281E000, v44, OS_LOG_TYPE_INFO, "Received thumbnail for %@: data of length %lu, bitmap format %@, error %@, image %@", buf, 0x34u);
          }
          [v20 addObject:v42];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v71 objects:v85 count:16];
      }
      while (v23);
    }

    if (v20)
    {
      if (v17)
      {
        v70 = 0;
        v47 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v70];
        v48 = v61;
        v69 = v70;
        if (v47)
        {
          id v16 = v59;
          id v15 = v60;
        }
        else
        {
          v56 = qltLogHandles;
          id v16 = v59;
          id v15 = v60;
          if (!qltLogHandles)
          {
            QLTInitLogging();
            v56 = qltLogHandles;
          }
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:]();
          }
          v47 = 0;
        }
      }
      else
      {
        v69 = 0;
        v47 = 0;
        id v16 = v59;
        id v15 = v60;
        v48 = v61;
      }
      v57 = [QLThumbnailRepresentation alloc];
      v54 = v65;
      [v65 scale];
      v55 = v67;
      v51 = v62;
      v53 = -[QLThumbnailRepresentation initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:](v57, "initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:", v62, v58, v67, v47);
      id v18 = 0;
      v52 = (void *)v47;
      v49 = v69;
    }
    else
    {
      v49 = [NSString stringWithFormat:@"Could not decode image for thumbnail request %@ from received thumbnail data", v22];
      v50 = _log();
      v51 = v62;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:]();
      }

      v75 = *MEMORY[0x1E4F28228];
      v76 = v49;
      v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      id v18 = +[QLThumbnailGenerator errorWithCode:0 request:v22 additionalUserInfo:v52];
      v53 = 0;
      v54 = v22;
      id v16 = v59;
      id v15 = v60;
      v48 = v61;
      v55 = v67;
    }

    [(QLThumbnailGenerator *)v48 _notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:v54 thumbnail:v53 type:v51 error:v18];
    id v17 = v63;
    goto LABEL_43;
  }
LABEL_44:
}

- (id)thumbnailIconForRequest:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 scale];
  double v6 = v5;
  id v7 = [v4 contentType];
  id v8 = v7;
  if (v7 && ([v7 conformsToType:*MEMORY[0x1E4F44320]] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_iconsLock);
    id v12 = [(NSMutableDictionary *)self->_iconsByType objectForKey:v8];
    if (!v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F6F248]);
      id v14 = [v8 identifier];
      id v12 = [v13 initWithType:v14];

      if (v12) {
        [(NSMutableDictionary *)self->_iconsByType setObject:v12 forKey:v8];
      }
    }
    os_unfair_lock_unlock(&self->_iconsLock);
    goto LABEL_9;
  }
  int v9 = [v4 fileURL];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F6F248]);
    uint64_t v11 = [v4 fileURL];
    id v12 = [v10 initWithURL:v11];

LABEL_9:
    id v15 = objc_alloc(MEMORY[0x1E4F6F258]);
    [v4 size];
    id v16 = objc_msgSend(v15, "initWithSize:scale:");
    if (![v4 iconVariant]) {
      [v16 setVariantOptions:1];
    }
    id v17 = [v12 imageForDescriptor:v16];
    if ([v17 placeholder])
    {
      uint64_t v18 = [v12 prepareImageForDescriptor:v16];

      id v17 = (void *)v18;
    }
    if (v17)
    {
      uint64_t v19 = (CGImage *)[v17 CGImage];
      v20 = [QLThumbnailRepresentation alloc];
      v25[0] = v19;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      double v22 = (double)CGImageGetWidth(v19) / v6;
      uint64_t v23 = -[QLThumbnailRepresentation initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:](v20, "initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:", 0, 0, v21, 0, v6, 0.0, 0.0, v22, (double)CGImageGetHeight(v19) / v6);
    }
    else
    {
      uint64_t v23 = 0;
    }

    goto LABEL_20;
  }
  id v12 = _log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[QLThumbnailGenerator thumbnailIconForRequest:]();
  }
  uint64_t v23 = 0;
LABEL_20:

  return v23;
}

- (id)_requestWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__QLThumbnailGenerator__requestWithUUID___block_invoke;
  block[3] = &unk_1E6009A28;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:(id)a3 thumbnail:(id)a4 type:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  serialResponseQueue = self->_serialResponseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__QLThumbnailGenerator__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded_thumbnail_type_error___block_invoke;
  block[3] = &unk_1E6009AC8;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(serialResponseQueue, block);
}

uint64_t __49__QLThumbnailGenerator__finishRequest_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__finishRequest:withError:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __107__QLThumbnailGenerator__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded_thumbnail_type_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 56));
}

- (void)__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:(id)a3 thumbnail:(id)a4 type:(int64_t)a5 error:(id)a6
{
  id v14 = a3;
  id v10 = a6;
  serialResponseQueue = self->_serialResponseQueue;
  id v12 = a4;
  dispatch_assert_queue_V2(serialResponseQueue);
  id v13 = [v14 updateBlock];

  if (v13) {
    [(QLThumbnailGenerator *)self _callUpdateBlockOfRequestIfRunning:v14 andUpdateMostRepresentativeThumbnail:v12 type:a5 error:v10];
  }
  else {
    [(QLThumbnailGenerator *)self _setMostRepresentativeThumbnail:v12 forRequest:v14];
  }

  if ([v14 thumbnailRepresentationTypeMatchesRequestedMostRepresentativeType:a5]) {
    [(QLThumbnailGenerator *)self _finishAndCallCompletionBlockOfRequest:v14 withError:v10];
  }
}

- (void)_setMostRepresentativeThumbnail:(id)a3 forRequest:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialResponseQueue);
  if (v7) {
    [v6 setMostRepresentativeThumbnail:v7];
  }
}

- (void)_finishRequest:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__QLThumbnailGenerator__finishRequest_withError___block_invoke;
  block[3] = &unk_1E6009AA0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __50__QLThumbnailGenerator___finishRequest_withError___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_callUpdateBlockOfRequestIfRunning:andUpdateMostRepresentativeThumbnail:type:error:", *(void *)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 48), "requestedMostRepresentativeType"), *(void *)(a1 + 32));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "__callCompletionBlockOfRequest:withError:", *(void *)(a1 + 48), v2);
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _logRequestDuration:v4];
}

- (void)_logRequestDuration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 beginDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  id v7 = qltLogHandles;
  if (!qltLogHandles)
  {
    QLTInitLogging();
    id v7 = qltLogHandles;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = [v3 mostRepresentativeThumbnail];
    int v10 = 134218498;
    double v11 = -v6;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1B281E000, v8, OS_LOG_TYPE_INFO, "Thumbnail generation duration of %.3f for %@. Most representative thumbnail generated: %@", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __39__QLThumbnailGenerator_performInBatch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performInBatch:*(void *)(a1 + 40)];
}

void __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 isCancelled])
  {
    [*(id *)(a1 + 32) _finishRequestIfNeeded:v5];
  }
  else if (([v5 prepareForSending] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v6];
    [*(id *)(a1 + 32) _finishRequestIfInvalid:v5];
  }
}

+ (void)initialize
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__QLThumbnailGenerator_initialize__block_invoke;
  v2[3] = &__block_descriptor_40_e30__24__0__NSError_8__NSString_16l;
  v2[4] = a1;
  [MEMORY[0x1E4F28C58] setUserInfoValueProviderForDomain:@"QLThumbnailErrorDomain" provider:v2];
}

- (void)_sendPendingBatches
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(QLThumbnailGenerator *)self _sendPendingGenerationRequests];

  [(QLThumbnailGenerator *)self _sendPendingCancelledRequests];
}

- (void)_sendPendingGenerationRequests
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableDictionary *)self->_preparingGenerationRequests addEntriesFromDictionary:self->_pendingGenerationRequests];
  id v3 = (void *)[(NSMutableDictionary *)self->_pendingGenerationRequests mutableCopy];
  [(NSMutableDictionary *)self->_pendingGenerationRequests removeAllObjects];
  requestPreparationQueue = self->_requestPreparationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke;
  v6[3] = &unk_1E6009870;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  dispatch_async(requestPreparationQueue, v6);
}

void __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_2;
  v11[3] = &unk_1E6009A78;
  id v3 = *(void **)(a1 + 32);
  v11[4] = *(void *)(a1 + 40);
  id v4 = v2;
  id v12 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];
  [*(id *)(a1 + 32) removeObjectsForKeys:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(NSObject **)(v5 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_3;
  block[3] = &unk_1E6009AA0;
  void block[4] = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

uint64_t __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = [*(id *)(a1 + 40) allKeys];
  [v2 removeObjectsForKeys:v3];

  [*(id *)(*(void *)(a1 + 32) + 56) removeObjectsForKeys:*(void *)(a1 + 48)];
  id v4 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v5 = [*(id *)(a1 + 40) allValues];
  [v4 generateSuccessiveThumbnailRepresentationsForRequests:v5 generationHandler:*(void *)(a1 + 32) completionHandler:&__block_literal_global_43];

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v7 addEntriesFromDictionary:v6];
}

- (void)_sendPendingCancelledRequests
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  thumbnailServiceProxy = self->_thumbnailServiceProxy;
  id v4 = [(NSMutableDictionary *)self->_pendingCancelledRequests allValues];
  [(QLThumbnailServiceProxy *)thumbnailServiceProxy cancelThumbnailRequests:v4];

  pendingCancelledRequests = self->_pendingCancelledRequests;

  [(NSMutableDictionary *)pendingCancelledRequests removeAllObjects];
}

+ (QLThumbnailGenerator)sharedGenerator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__QLThumbnailGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedGenerator_onceToken != -1) {
    dispatch_once(&sharedGenerator_onceToken, block);
  }
  uint64_t v2 = (void *)sharedGenerator_sharedInstance;

  return (QLThumbnailGenerator *)v2;
}

uint64_t __39__QLThumbnailGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  sharedGenerator_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (QLThumbnailGenerator)init
{
  v23.receiver = self;
  v23.super_class = (Class)QLThumbnailGenerator;
  uint64_t v2 = [(QLThumbnailGenerator *)&v23 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    pendingCancelledRequests = v2->_pendingCancelledRequests;
    v2->_pendingCancelledRequests = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    pendingGenerationRequests = v2->_pendingGenerationRequests;
    v2->_pendingGenerationRequests = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    preparingGenerationRequests = v2->_preparingGenerationRequests;
    v2->_preparingGenerationRequests = (NSMutableDictionary *)v9;

    double v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.quicklook.QLThumbnailGenerator", v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;

    __int16 v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.quicklook.QLThumbnailGenerator.preparation", v14);
    requestPreparationQueue = v2->_requestPreparationQueue;
    v2->_requestPreparationQueue = (OS_dispatch_queue *)v15;

    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.quicklook.QLThumbnailGenerator.response", v17);
    serialResponseQueue = v2->_serialResponseQueue;
    v2->_serialResponseQueue = (OS_dispatch_queue *)v18;

    v2->_iconsLock._os_unfair_lock_opaque = 0;
    uint64_t v20 = objc_opt_new();
    iconsByType = v2->_iconsByType;
    v2->_iconsByType = (NSMutableDictionary *)v20;
  }
  return v2;
}

- (void)_performInBatch:(id)a3
{
  queue = self->_queue;
  uint64_t v5 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  ++self->_batchingCount;
  v5[2](v5);

  unint64_t v6 = self->_batchingCount - 1;
  self->_batchingCount = v6;
  if (!v6)
  {
    [(QLThumbnailGenerator *)self _sendPendingBatches];
  }
}

+ (id)debugDescriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 0;
  }
  else {
    return off_1E6009B58[a3];
  }
}

id __34__QLThumbnailGenerator_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqualToString:*MEMORY[0x1E4F28228]])
  {
    unint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "debugDescriptionForErrorCode:", objc_msgSend(v5, "code"));
    if (v6)
    {
      uint64_t v7 = [v5 userInfo];
      id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F289B0]];

      uint64_t v9 = [v8 absoluteString];
      if (v9
        || ([v5 userInfo],
            id v10 = objc_claimAutoreleasedReturnValue(),
            [v10 objectForKeyedSubscript:@"QLErrorFailingFileNameKey"],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            v10,
            v9))
      {
        id v11 = [NSString stringWithFormat:@"%@ for %@", v6, v9];
      }
      else
      {
        id v11 = v6;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)generateBestRepresentationForRequest:(QLThumbnailGenerationRequest *)request completionHandler:(void *)completionHandler
{
  id v8 = request;
  unint64_t v6 = completionHandler;
  if (!v6) {
    -[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:]();
  }
  uint64_t v7 = v6;
  [(QLThumbnailGenerator *)self generateThumbnailForRequest:v8 updateHandler:0 statusHandler:0 completionHandler:v6];
}

- (void)generateRepresentationsForRequest:(QLThumbnailGenerationRequest *)request updateHandler:(void *)updateHandler
{
  id v8 = request;
  unint64_t v6 = updateHandler;
  if (!v6) {
    -[QLThumbnailGenerator generateRepresentationsForRequest:updateHandler:]();
  }
  uint64_t v7 = v6;
  [(QLThumbnailGenerator *)self generateThumbnailForRequest:v8 updateHandler:v6 statusHandler:0 completionHandler:0];
}

uint64_t __98__QLThumbnailGenerator_generateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _queueThumbnailRequest:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _sendPendingGenerationRequests];
}

- (void)synchronousGenerateThumbnailForRequest:(id)a3 updateHandler:(id)a4 statusHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  unint64_t v13 = (unint64_t)a6;
  if (!(v11 | v13)) {
    -[QLThumbnailGenerator synchronousGenerateThumbnailForRequest:updateHandler:statusHandler:completionHandler:]();
  }
  __int16 v14 = (void *)v13;
  uint64_t v27 = 0;
  dispatch_data_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  size_t v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
  [v10 setUpdateBlock:v11];
  [v10 setStatusBlock:v12];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke;
  v24[3] = &unk_1E60099B0;
  id v15 = v14;
  id v25 = v15;
  v26 = &v27;
  [v10 setCompletionBlock:v24];
  queue = self->_queue;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke_2;
  int64_t v21 = &unk_1E6009870;
  double v22 = self;
  id v17 = v10;
  id v23 = v17;
  dispatch_sync(queue, &v18);
  -[QLThumbnailGenerator _sendSyncGenerationRequest:](self, "_sendSyncGenerationRequest:", v17, v18, v19, v20, v21, v22);
  dispatch_semaphore_wait((dispatch_semaphore_t)v28[5], 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v27, 8);
}

intptr_t __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v3);
}

uint64_t __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareSyncThumbnailRequest:*(void *)(a1 + 40)];
}

- (void)saveBestRepresentationForRequest:(QLThumbnailGenerationRequest *)request toFileAtURL:(NSURL *)fileURL withContentType:(NSString *)contentType completionHandler:(void *)completionHandler
{
  id v10 = (void *)MEMORY[0x1E4F442D8];
  unint64_t v11 = completionHandler;
  id v12 = fileURL;
  unint64_t v13 = request;
  id v14 = [v10 typeWithIdentifier:contentType];
  [(QLThumbnailGenerator *)self saveBestRepresentationForRequest:v13 toFileAtURL:v12 asContentType:v14 allowingThumbnailDownloads:0 completionHandler:v11];
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 asContentType:(id)a5 completionHandler:(id)a6
{
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 asContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  [v14 setSaveURL:a4];
  [v14 setSaveURLContentType:v13];

  [v14 setDownloadingAllowed:v7];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __128__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileAtURL_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke;
  v16[3] = &unk_1E60099D8;
  id v17 = v12;
  id v15 = v12;
  [(QLThumbnailGenerator *)self generateBestRepresentationForRequest:v14 completionHandler:v16];
}

uint64_t __128__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileAtURL_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 withContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = (void *)MEMORY[0x1E4F442D8];
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 typeWithIdentifier:a5];
  [(QLThumbnailGenerator *)self saveBestRepresentationForRequest:v15 toFileAtURL:v14 asContentType:v16 allowingThumbnailDownloads:v7 completionHandler:v13];
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileHandle:(id)a4 asContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  [v14 setSaveFileHandle:a4];
  [v14 setSaveURLContentType:v13];

  [v14 setDownloadingAllowed:v7];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __129__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileHandle_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke;
  v16[3] = &unk_1E60099D8;
  id v17 = v12;
  id v15 = v12;
  [(QLThumbnailGenerator *)self generateBestRepresentationForRequest:v14 completionHandler:v16];
}

uint64_t __129__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileHandle_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileHandle:(id)a4 withContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = (void *)MEMORY[0x1E4F442D8];
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 typeWithIdentifier:a5];
  [(QLThumbnailGenerator *)self saveBestRepresentationForRequest:v15 toFileHandle:v14 asContentType:v16 allowingThumbnailDownloads:v7 completionHandler:v13];
}

- (void)cancelRequest:(QLThumbnailGenerationRequest *)request
{
  id v4 = request;
  id v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(QLThumbnailGenerator *)v5 _isBuildingBatch];
  queue = v5->_queue;
  if (v6)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)v5->_queue);
    [(QLThumbnailGenerator *)v5 _cancelRequestIfNeeded:v4];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__QLThumbnailGenerator_cancelRequest___block_invoke;
    v8[3] = &unk_1E6009870;
    v8[4] = v5;
    uint64_t v9 = v4;
    dispatch_sync(queue, v8);
  }
  objc_sync_exit(v5);
}

uint64_t __38__QLThumbnailGenerator_cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cancelRequestIfNeeded:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _sendPendingCancelledRequests];
  }
  return result;
}

- (BOOL)_cancelRequestIfNeeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  preparingGenerationRequests = self->_preparingGenerationRequests;
  BOOL v6 = [v4 uuid];
  BOOL v7 = [(NSMutableDictionary *)preparingGenerationRequests objectForKeyedSubscript:v6];

  if (v7)
  {
    [v4 cancel];
  }
  else
  {
    id v8 = [v4 uuid];
    BOOL v9 = [(QLThumbnailGenerator *)self __requestWithUUIDIsStillRunning:v8];

    if (!v9)
    {
      BOOL v12 = 0;
      goto LABEL_7;
    }
    [v4 cancel];
    pendingCancelledRequests = self->_pendingCancelledRequests;
    unint64_t v11 = [v4 uuid];
    [(NSMutableDictionary *)pendingCancelledRequests setObject:v4 forKey:v11];
  }
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

- (void)_addRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__QLThumbnailGenerator__addRequest___block_invoke;
  v7[3] = &unk_1E6009870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __36__QLThumbnailGenerator__addRequest___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) requests];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 uuid];
  [v4 setObject:v2 forKey:v3];
}

- (void)_removeRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__QLThumbnailGenerator__removeRequest___block_invoke;
  v7[3] = &unk_1E6009870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __39__QLThumbnailGenerator__removeRequest___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) requests];
  uint64_t v2 = [*(id *)(a1 + 40) uuid];
  [v3 removeObjectForKey:v2];
}

- (BOOL)__requestWithUUIDIsStillRunning:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(QLThumbnailGenerator *)self __requestWithUUID:v5];

  if (v6 && ([v6 isCancelled] & 1) == 0) {
    int v7 = [v6 isFinished] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_sendSyncGenerationRequest:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__QLThumbnailGenerator__sendSyncGenerationRequest___block_invoke;
  v8[3] = &unk_1E6009A50;
  v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(queue, v8);
  if ([v4 prepareForSending])
  {
    id v6 = (void *)v10[5];
    v15[0] = v4;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v6 generateSuccessiveThumbnailRepresentationsForRequests:v7 generationHandler:self completionHandler:&__block_literal_global_2];
  }
  else
  {
    [(QLThumbnailGenerator *)self _finishRequestIfInvalid:v4];
  }
  _Block_object_dispose(&v9, 8);
}

void __51__QLThumbnailGenerator__sendSyncGenerationRequest___block_invoke(uint64_t a1)
{
}

- (void)_prepareSyncThumbnailRequest:(id)a3
{
  id v6 = a3;
  [(QLThumbnailGenerator *)self _prepareThumbnailRequestForQueueOrSending:v6 synchronous:1];
  if (![(QLThumbnailGenerator *)self __finishRequestIfNeeded:v6])
  {
    if ((unint64_t)[v6 representationTypes] > 1)
    {
      requests = self->_requests;
      id v5 = [v6 uuid];
      [(NSMutableDictionary *)requests setObject:v6 forKeyedSubscript:v5];
    }
    else
    {
      [(QLThumbnailGenerator *)self __finishRequestWithoutError:v6];
    }
  }
}

void __63__QLThumbnailGenerator__queueIconGenerationForRequestIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) thumbnailIconForRequest:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:", *(void *)(a1 + 40), v2, 0, 0);
}

- (void)_callUpdateBlockOfRequestIfRunning:(id)a3 andUpdateMostRepresentativeThumbnail:(id)a4 type:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialResponseQueue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__QLThumbnailGenerator__callUpdateBlockOfRequestIfRunning_andUpdateMostRepresentativeThumbnail_type_error___block_invoke;
  block[3] = &unk_1E6009AC8;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(queue, block);
}

void __107__QLThumbnailGenerator__callUpdateBlockOfRequestIfRunning_andUpdateMostRepresentativeThumbnail_type_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _requestRepresentationTypeIsMoreRepresentative:*(void *)(a1 + 40) thanType:*(void *)(a1 + 64)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) mostRepresentativeTypeForWhichUpdateBlockHasBeenCalled];
    uint64_t v3 = *(void *)(a1 + 64);
    id v4 = [*(id *)(a1 + 40) updateBlock];

    if (v4) {
      BOOL v5 = v2 < v3;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      id v6 = qltLogHandles[0];
      if (!qltLogHandles[0])
      {
        QLTInitLogging();
        id v6 = qltLogHandles[0];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v9 = *(void *)(a1 + 64);
        id v10 = v6;
        id v11 = QLThumbnailRepresentationTypeToString(v9);
        uint64_t v12 = *(void *)(a1 + 56);
        int v14 = 138413058;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        uint64_t v17 = v8;
        __int16 v18 = 2112;
        id v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        _os_log_impl(&dword_1B281E000, v10, OS_LOG_TYPE_INFO, "Calling request updateBlock for %@ with thumbnail: %@, type: %@, error: %@", (uint8_t *)&v14, 0x2Au);
      }
      id v13 = [*(id *)(a1 + 40) updateBlock];
      v13[2](v13, *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 56));

      [*(id *)(a1 + 40) noteUpdateBlockHasBeenCalledForType:*(void *)(a1 + 64)];
    }
    if (*(void *)(a1 + 48)) {
      objc_msgSend(*(id *)(a1 + 40), "setMostRepresentativeThumbnail:");
    }
  }
}

- (void)_callCompletionBlockOfRequest:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialResponseQueue = self->_serialResponseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__QLThumbnailGenerator__callCompletionBlockOfRequest_withError___block_invoke;
  block[3] = &unk_1E6009AA0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialResponseQueue, block);
}

uint64_t __64__QLThumbnailGenerator__callCompletionBlockOfRequest_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__callCompletionBlockOfRequest:withError:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_finishRequestWithoutError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__QLThumbnailGenerator__finishRequestWithoutError___block_invoke;
  v7[3] = &unk_1E6009870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __51__QLThumbnailGenerator__finishRequestWithoutError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__finishRequestWithoutError:", *(void *)(a1 + 40));
}

- (void)__finishRequestWithoutError:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(QLThumbnailGenerator *)self __finishRequest:v5 withError:0];
}

- (BOOL)_finishRequestIfInvalid:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__QLThumbnailGenerator__finishRequestIfInvalid___block_invoke;
  block[3] = &unk_1E6009A28;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __48__QLThumbnailGenerator__finishRequestIfInvalid___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__finishRequestIfInvalid:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_finishAllRequestsWithError:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  v10[4] = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__QLThumbnailGenerator__finishAllRequestsWithError___block_invoke;
  block[3] = &unk_1E6009A28;
  id v8 = v4;
  id v9 = v10;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);

  _Block_object_dispose(v10, 8);
}

void __52__QLThumbnailGenerator__finishAllRequestsWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) requests];
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "requests", (void)v15);
        char v14 = [v13 objectForKeyedSubscript:v12];

        objc_msgSend(*(id *)(a1 + 32), "__finishRequest:withError:", v14, *(void *)(a1 + 40));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)didUpdateStatus:(int64_t)a3 ofThumbnailGenerationWithUUID:(id)a4
{
  id v7 = [(QLThumbnailGenerator *)self _requestWithUUID:a4];
  uint64_t v5 = [v7 statusBlock];

  if (v5)
  {
    id v6 = [v7 statusBlock];
    v6[2](v6, a3);
  }
}

- (void)failedToGenerateThumbnailOfType:(int64_t)a3 forRequestWithUUID:(id)a4 error:(id)a5
{
}

void __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishAllRequestsWithError:v3];
}

- (void)_createSyncThumbnailServiceProxy
{
  objc_initWeak(&location, self);
  id v3 = +[QLThumbnailServiceProxy sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__QLThumbnailGenerator__createSyncThumbnailServiceProxy__block_invoke;
  v6[3] = &unk_1E6009AF0;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v6];
  syncThumbnailServiceProxy = self->_syncThumbnailServiceProxy;
  self->_syncThumbnailServiceProxy = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __56__QLThumbnailGenerator__createSyncThumbnailServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishAllRequestsWithError:v3];
}

- (BOOL)_requestRepresentationTypeIsMoreRepresentative:(id)a3 thanType:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 mostRepresentativeThumbnail];

  if (v6)
  {
    id v7 = [v5 mostRepresentativeThumbnail];
    BOOL v8 = [v7 type] > a4;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 request:(id)a4 additionalUserInfo:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [v8 fileURL];
  uint64_t v10 = [v8 item];

  if (v9 || ([v10 fileURL], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v7)
    {
      uint64_t v11 = (void *)[v7 mutableCopy];
      [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F289B0]];
      uint64_t v12 = (void *)[v11 copy];
    }
    else
    {
      uint64_t v19 = *MEMORY[0x1E4F289B0];
      v20[0] = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
  }
  else
  {
    uint64_t v9 = [v10 filename];

    if (v9)
    {
      if (v7)
      {
        uint64_t v13 = (void *)[v7 mutableCopy];
        char v14 = [v10 filename];
        [v13 setObject:v14 forKeyedSubscript:@"QLErrorFailingFileNameKey"];

        uint64_t v12 = (void *)[v13 copy];
      }
      else
      {
        long long v17 = @"QLErrorFailingFileNameKey";
        uint64_t v13 = [v10 filename];
        long long v18 = v13;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      }

      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v12 = v7;
    }
  }
  long long v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:a3 userInfo:v12];

  return v15;
}

- (BOOL)canGenerateThumbnailsForContentType:(id)a3 atSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v7 = +[QLThumbnailServiceProxy sharedInstance];
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_63];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__QLThumbnailGenerator_canGenerateThumbnailsForContentType_atSize___block_invoke_64;
  v10[3] = &unk_1E6009B38;
  v10[4] = &v11;
  objc_msgSend(v8, "canGenerateThumbnailsForContentType:atSize:completionHandler:", v6, v10, width, height);

  LOBYTE(v7) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v7;
}

void __67__QLThumbnailGenerator_canGenerateThumbnailsForContentType_atSize___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1();
  }
}

uint64_t __67__QLThumbnailGenerator_canGenerateThumbnailsForContentType_atSize___block_invoke_64(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setRequests:(id)a3
{
}

- (NSMutableDictionary)iconsByType
{
  return self->_iconsByType;
}

- (void)setIconsByType:(id)a3
{
}

- (unint64_t)batchingCount
{
  return self->_batchingCount;
}

- (void)setBatchingCount:(unint64_t)a3
{
  self->_batchingCount = a3;
}

- (NSMutableDictionary)pendingCancelledRequests
{
  return self->_pendingCancelledRequests;
}

- (void)setPendingCancelledRequests:(id)a3
{
}

- (NSMutableDictionary)pendingGenerationRequests
{
  return self->_pendingGenerationRequests;
}

- (void)setPendingGenerationRequests:(id)a3
{
}

- (NSMutableDictionary)preparingGenerationRequests
{
  return self->_preparingGenerationRequests;
}

- (void)setPreparingGenerationRequests:(id)a3
{
}

- (QLThumbnailServiceProxy)thumbnailServiceProxy
{
  return self->_thumbnailServiceProxy;
}

- (void)setThumbnailServiceProxy:(id)a3
{
}

- (QLThumbnailServiceProxy)syncThumbnailServiceProxy
{
  return self->_syncThumbnailServiceProxy;
}

- (void)setSyncThumbnailServiceProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)requestPreparationQueue
{
  return self->_requestPreparationQueue;
}

- (OS_dispatch_queue)serialResponseQueue
{
  return self->_serialResponseQueue;
}

- (os_unfair_lock_s)iconsLock
{
  return self->_iconsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialResponseQueue, 0);
  objc_storeStrong((id *)&self->_requestPreparationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncThumbnailServiceProxy, 0);
  objc_storeStrong((id *)&self->_thumbnailServiceProxy, 0);
  objc_storeStrong((id *)&self->_preparingGenerationRequests, 0);
  objc_storeStrong((id *)&self->_pendingGenerationRequests, 0);
  objc_storeStrong((id *)&self->_pendingCancelledRequests, 0);
  objc_storeStrong((id *)&self->_iconsByType, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)generateBestRepresentationForRequest:completionHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:]", "QLThumbnailGenerator.m", 152, "completionHandler != nil");
}

- (void)generateRepresentationsForRequest:updateHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator generateRepresentationsForRequest:updateHandler:]", "QLThumbnailGenerator.m", 158, "updateHandler != nil");
}

- (void)generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:]", "QLThumbnailGenerator.m", 168, "completionHandler != nil || updateHandler != nil");
}

- (void)synchronousGenerateThumbnailForRequest:updateHandler:statusHandler:completionHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator synchronousGenerateThumbnailForRequest:updateHandler:statusHandler:completionHandler:]", "QLThumbnailGenerator.m", 192, "completionHandler != nil || updateHandler != nil");
}

- (void)_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not decode image for thumbnail request %@ from received thumbnail data", v2, v3, v4, v5, v6);
}

- (void)_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Failed to unarchive thumbnail's generated properties: %@", v2, v3, v4, v5, v6);
}

- (void)_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1B281E000, v0, OS_LOG_TYPE_DEBUG, "Processing thumbnail request completion for request uuid:%@", v1, 0xCu);
}

- (void)thumbnailIconForRequest:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "No fileURL or contentType for %@, not returning any icon", v2, v3, v4, v5, v6);
}

void __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "An error occurred with ThumbnailsAgent: %@", v2, v3, v4, v5, v6);
}

@end