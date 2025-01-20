@interface JXHTTPOperationQueue
+ (id)sharedQueue;
- (BOOL)performsBlocksOnMainQueue;
- (JXHTTPOperationQueue)init;
- (JXHTTPOperationQueueDelegate)delegate;
- (NSDate)finishDate;
- (NSDate)startDate;
- (NSMutableDictionary)bytesDownloadedPerOperation;
- (NSMutableDictionary)bytesUploadedPerOperation;
- (NSMutableDictionary)expectedDownloadBytesPerOperation;
- (NSMutableDictionary)expectedUploadBytesPerOperation;
- (NSMutableSet)observedOperationSet;
- (NSNumber)bytesDownloaded;
- (NSNumber)bytesUploaded;
- (NSNumber)downloadProgress;
- (NSNumber)expectedDownloadBytes;
- (NSNumber)expectedUploadBytes;
- (NSNumber)uploadProgress;
- (NSString)uniqueString;
- (OS_dispatch_queue)blockQueue;
- (OS_dispatch_queue)observationQueue;
- (OS_dispatch_queue)progressQueue;
- (double)elapsedSeconds;
- (id)blockForSelector:(SEL)a3;
- (id)didDownloadBlock;
- (id)didFinishBlock;
- (id)didMakeProgressBlock;
- (id)didStartBlock;
- (id)didUploadBlock;
- (id)willFinishBlock;
- (id)willStartBlock;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performDelegateMethod:(SEL)a3;
- (void)setBlockQueue:(id)a3;
- (void)setBytesDownloaded:(id)a3;
- (void)setBytesDownloadedPerOperation:(id)a3;
- (void)setBytesUploaded:(id)a3;
- (void)setBytesUploadedPerOperation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDownloadBlock:(id)a3;
- (void)setDidFinishBlock:(id)a3;
- (void)setDidMakeProgressBlock:(id)a3;
- (void)setDidStartBlock:(id)a3;
- (void)setDidUploadBlock:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setExpectedDownloadBytes:(id)a3;
- (void)setExpectedDownloadBytesPerOperation:(id)a3;
- (void)setExpectedUploadBytes:(id)a3;
- (void)setExpectedUploadBytesPerOperation:(id)a3;
- (void)setFinishDate:(id)a3;
- (void)setObservationQueue:(id)a3;
- (void)setObservedOperationSet:(id)a3;
- (void)setPerformsBlocksOnMainQueue:(BOOL)a3;
- (void)setProgressQueue:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setUniqueString:(id)a3;
- (void)setUploadProgress:(id)a3;
- (void)setWillFinishBlock:(id)a3;
- (void)setWillStartBlock:(id)a3;
@end

@implementation JXHTTPOperationQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockQueue, 0);
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
  objc_storeStrong((id *)&self->_observedOperationSet, 0);
  objc_storeStrong((id *)&self->_expectedUploadBytesPerOperation, 0);
  objc_storeStrong((id *)&self->_expectedDownloadBytesPerOperation, 0);
  objc_storeStrong((id *)&self->_bytesUploadedPerOperation, 0);
  objc_storeStrong((id *)&self->_bytesDownloadedPerOperation, 0);
  objc_storeStrong(&self->_didFinishBlock, 0);
  objc_storeStrong(&self->_didMakeProgressBlock, 0);
  objc_storeStrong(&self->_didDownloadBlock, 0);
  objc_storeStrong(&self->_didUploadBlock, 0);
  objc_storeStrong(&self->_didStartBlock, 0);
  objc_storeStrong(&self->_willFinishBlock, 0);
  objc_storeStrong(&self->_willStartBlock, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_expectedUploadBytes, 0);
  objc_storeStrong((id *)&self->_expectedDownloadBytes, 0);
  objc_storeStrong((id *)&self->_bytesUploaded, 0);
  objc_storeStrong((id *)&self->_bytesDownloaded, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_uniqueString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBlockQueue:(id)a3
{
}

- (OS_dispatch_queue)blockQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 712, 1);
}

- (void)setProgressQueue:(id)a3
{
}

- (OS_dispatch_queue)progressQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 704, 1);
}

- (void)setObservationQueue:(id)a3
{
}

- (OS_dispatch_queue)observationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 696, 1);
}

- (void)setObservedOperationSet:(id)a3
{
}

- (NSMutableSet)observedOperationSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 688, 1);
}

- (void)setExpectedUploadBytesPerOperation:(id)a3
{
}

- (NSMutableDictionary)expectedUploadBytesPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 680, 1);
}

- (void)setExpectedDownloadBytesPerOperation:(id)a3
{
}

- (NSMutableDictionary)expectedDownloadBytesPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 672, 1);
}

- (void)setBytesUploadedPerOperation:(id)a3
{
}

- (NSMutableDictionary)bytesUploadedPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 664, 1);
}

- (void)setBytesDownloadedPerOperation:(id)a3
{
}

- (NSMutableDictionary)bytesDownloadedPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 656, 1);
}

- (void)setDidFinishBlock:(id)a3
{
}

- (id)didFinishBlock
{
  return objc_getProperty(self, a2, 648, 1);
}

- (void)setDidMakeProgressBlock:(id)a3
{
}

- (id)didMakeProgressBlock
{
  return objc_getProperty(self, a2, 640, 1);
}

- (void)setDidDownloadBlock:(id)a3
{
}

- (id)didDownloadBlock
{
  return objc_getProperty(self, a2, 632, 1);
}

- (void)setDidUploadBlock:(id)a3
{
}

- (id)didUploadBlock
{
  return objc_getProperty(self, a2, 624, 1);
}

- (void)setDidStartBlock:(id)a3
{
}

- (id)didStartBlock
{
  return objc_getProperty(self, a2, 616, 1);
}

- (void)setWillFinishBlock:(id)a3
{
}

- (id)willFinishBlock
{
  return objc_getProperty(self, a2, 608, 1);
}

- (void)setWillStartBlock:(id)a3
{
}

- (id)willStartBlock
{
  return objc_getProperty(self, a2, 600, 1);
}

- (void)setPerformsBlocksOnMainQueue:(BOOL)a3
{
  self->_performsBlocksOnMainQueue = a3;
}

- (BOOL)performsBlocksOnMainQueue
{
  return self->_performsBlocksOnMainQueue;
}

- (void)setFinishDate:(id)a3
{
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 592, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 584, 1);
}

- (void)setExpectedUploadBytes:(id)a3
{
}

- (NSNumber)expectedUploadBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 576, 1);
}

- (void)setExpectedDownloadBytes:(id)a3
{
}

- (NSNumber)expectedDownloadBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 568, 1);
}

- (void)setBytesUploaded:(id)a3
{
}

- (NSNumber)bytesUploaded
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setBytesDownloaded:(id)a3
{
}

- (NSNumber)bytesDownloaded
{
  return (NSNumber *)objc_getProperty(self, a2, 552, 1);
}

- (void)setUploadProgress:(id)a3
{
}

- (NSNumber)uploadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setDownloadProgress:(id)a3
{
}

- (NSNumber)downloadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setUniqueString:(id)a3
{
}

- (NSString)uniqueString
{
  return (NSString *)objc_getProperty(self, a2, 528, 1);
}

- (void)setDelegate:(id)a3
{
}

- (JXHTTPOperationQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JXHTTPOperationQueueDelegate *)WeakRetained;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (JXHTTPOperationQueue *)a4;
  id v12 = a5;
  v70 = v12;
  v71 = v10;
  if ((void *)JXHTTPOperationQueueContext == a6)
  {
    if (v11 == self && [v10 isEqualToString:@"operations"])
    {
      v13 = [v70 objectForKey:*MEMORY[0x263F081B0]];
      int v14 = [v13 intValue];

      if (v14 == 1)
      {
        id v67 = objc_alloc_init(MEMORY[0x263EFF910]);
        v69 = [v70 objectForKey:*MEMORY[0x263F081B8]];
        v68 = [v70 objectForKey:*MEMORY[0x263F081C8]];
        v15 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v69];
        v16 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v68];
        [v15 removeObjectsInArray:v68];
        v66 = v16;
        [v16 removeObjectsInArray:v69];
        uint64_t v17 = [v69 count];
        uint64_t v18 = [v68 count];
        if (v17) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (v17) {
          BOOL v20 = 0;
        }
        else {
          BOOL v20 = v18 != 0;
        }
        unint64_t v65 = __PAIR64__(v19, v20);
        if (v19)
        {
          objc_initWeak(&location, v11);
          v21 = [(JXHTTPOperationQueue *)v11 progressQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_264E5A250;
          objc_copyWeak(&v109, &location);
          id v108 = v67;
          dispatch_barrier_async(v21, block);

          objc_destroyWeak(&v109);
          objc_destroyWeak(&location);
        }
        else if (v20)
        {
          objc_initWeak(&location, v11);
          v40 = [(JXHTTPOperationQueue *)v11 progressQueue];
          v105[0] = MEMORY[0x263EF8330];
          v105[1] = 3221225472;
          v105[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_39;
          v105[3] = &unk_264E5B950;
          objc_copyWeak(&v106, &location);
          dispatch_barrier_async(v40, v105);

          objc_destroyWeak(&v106);
          objc_destroyWeak(&location);
        }
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        obuint64_t j = v15;
        uint64_t v41 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v102;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v102 != v42) {
                objc_enumerationMutation(obj);
              }
              v44 = *(void **)(*((void *)&v101 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v45 = NSNumber;
                v46 = [v44 requestBody];
                v47 = objc_msgSend(v45, "numberWithLongLong:", objc_msgSend(v46, "httpContentLength"));

                v48 = [v44 uniqueString];
                v49 = (void *)[v48 copy];

                objc_initWeak(&location, v11);
                v50 = [(JXHTTPOperationQueue *)v11 progressQueue];
                v97[0] = MEMORY[0x263EF8330];
                v97[1] = 3221225472;
                v97[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
                v97[3] = &unk_264E5A278;
                objc_copyWeak(&v100, &location);
                id v51 = v47;
                id v98 = v51;
                id v52 = v49;
                id v99 = v52;
                dispatch_barrier_async(v50, v97);

                v53 = [(JXHTTPOperationQueue *)v11 observationQueue];
                v96[0] = MEMORY[0x263EF8330];
                v96[1] = 3221225472;
                v96[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
                v96[3] = &unk_264E5DED8;
                v96[4] = v11;
                v96[5] = v44;
                dispatch_sync(v53, v96);

                objc_destroyWeak(&v100);
                objc_destroyWeak(&location);
              }
            }
            uint64_t v41 = [obj countByEnumeratingWithState:&v101 objects:v113 count:16];
          }
          while (v41);
        }

        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v72 = v66;
        uint64_t v54 = [v72 countByEnumeratingWithState:&v92 objects:v112 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v54; ++j)
            {
              if (*(void *)v93 != v55) {
                objc_enumerationMutation(v72);
              }
              v57 = *(void **)(*((void *)&v92 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v57 isCancelled])
                {
                  v58 = [v57 uniqueString];
                  v59 = (void *)[v58 copy];

                  objc_initWeak(&location, v11);
                  v60 = [(JXHTTPOperationQueue *)v11 progressQueue];
                  v89[0] = MEMORY[0x263EF8330];
                  v89[1] = 3221225472;
                  v89[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
                  v89[3] = &unk_264E5A250;
                  objc_copyWeak(&v91, &location);
                  id v90 = v59;
                  id v61 = v59;
                  dispatch_barrier_async(v60, v89);

                  objc_destroyWeak(&v91);
                  objc_destroyWeak(&location);
                }
                v62 = [(JXHTTPOperationQueue *)v11 observationQueue];
                v88[0] = MEMORY[0x263EF8330];
                v88[1] = 3221225472;
                v88[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_5;
                v88[3] = &unk_264E5DED8;
                v88[4] = v11;
                v88[5] = v57;
                dispatch_sync(v62, v88);
              }
            }
            uint64_t v54 = [v72 countByEnumeratingWithState:&v92 objects:v112 count:16];
          }
          while (v54);
        }

        if (HIDWORD(v65))
        {
          objc_initWeak(&location, v11);
          v63 = [(JXHTTPOperationQueue *)v11 progressQueue];
          v86[0] = MEMORY[0x263EF8330];
          v86[1] = 3221225472;
          v86[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_6;
          v86[3] = &unk_264E5B950;
          objc_copyWeak(&v87, &location);
          dispatch_barrier_async(v63, v86);

          objc_destroyWeak(&v87);
          objc_destroyWeak(&location);
        }
        else if (v65)
        {
          objc_initWeak(&location, v11);
          v64 = [(JXHTTPOperationQueue *)v11 progressQueue];
          v83[0] = MEMORY[0x263EF8330];
          v83[1] = 3221225472;
          v83[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_7;
          v83[3] = &unk_264E5A250;
          objc_copyWeak(&v85, &location);
          id v84 = v67;
          dispatch_barrier_async(v64, v83);

          objc_destroyWeak(&v85);
          objc_destroyWeak(&location);
        }
      }
    }
    else if ([v10 isEqualToString:@"response"])
    {
      v22 = v11;
      v23 = [(JXHTTPOperationQueue *)v22 response];
      v24 = (char *)[v23 expectedContentLength];

      v25 = [(JXHTTPOperationQueue *)v22 uniqueString];
      v26 = (void *)[v25 copy];

      if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        objc_initWeak(&location, self);
        v27 = [(JXHTTPOperationQueue *)self progressQueue];
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_8;
        v80[3] = &unk_264E5A2A0;
        objc_copyWeak(v82, &location);
        v82[1] = v24;
        id v81 = v26;
        dispatch_barrier_async(v27, v80);

        objc_destroyWeak(v82);
        objc_destroyWeak(&location);
      }
    }
    else if ([v10 isEqualToString:@"bytesDownloaded"])
    {
      v28 = v11;
      v29 = [(JXHTTPOperationQueue *)v28 bytesDownloaded];
      v30 = [(JXHTTPOperationQueue *)v28 uniqueString];
      v31 = (void *)[v30 copy];

      objc_initWeak(&location, self);
      v32 = [(JXHTTPOperationQueue *)self progressQueue];
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_9;
      v77[3] = &unk_264E5A2A0;
      objc_copyWeak(v79, &location);
      v79[1] = v29;
      id v78 = v31;
      id v33 = v31;
      dispatch_barrier_async(v32, v77);

      objc_destroyWeak(v79);
      objc_destroyWeak(&location);
    }
    else if ([v10 isEqualToString:@"bytesUploaded"])
    {
      v34 = v11;
      v35 = [(JXHTTPOperationQueue *)v34 bytesUploaded];
      v36 = [(JXHTTPOperationQueue *)v34 uniqueString];
      v37 = (void *)[v36 copy];

      objc_initWeak(&location, self);
      v38 = [(JXHTTPOperationQueue *)self progressQueue];
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_10;
      v74[3] = &unk_264E5A2A0;
      objc_copyWeak(v76, &location);
      v76[1] = v35;
      id v75 = v37;
      id v39 = v37;
      dispatch_barrier_async(v38, v74);

      objc_destroyWeak(v76);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v111.receiver = self;
    v111.super_class = (Class)JXHTTPOperationQueue;
    [(JXHTTPOperationQueue *)&v111 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [WeakRetained setBytesDownloadedPerOperation:v2];

    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [WeakRetained setBytesUploadedPerOperation:v3];

    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [WeakRetained setExpectedDownloadBytesPerOperation:v4];

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [WeakRetained setExpectedUploadBytesPerOperation:v5];

    [WeakRetained setDownloadProgress:&unk_26F076A90];
    [WeakRetained setUploadProgress:&unk_26F076A90];
    [WeakRetained setBytesDownloaded:&unk_26F076068];
    [WeakRetained setBytesUploaded:&unk_26F076068];
    [WeakRetained setExpectedDownloadBytes:&unk_26F076068];
    [WeakRetained setExpectedUploadBytes:&unk_26F076068];
    [WeakRetained setFinishDate:0];
    [WeakRetained setStartDate:*(void *)(a1 + 32)];
    [WeakRetained performDelegateMethod:sel_httpOperationQueueWillStart_];
  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_39(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performDelegateMethod:sel_httpOperationQueueWillFinish_];
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained expectedUploadBytesPerOperation];
  [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observedOperationSet];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) forKeyPath:@"bytesDownloaded" options:0 context:JXHTTPOperationQueueContext];
    [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) forKeyPath:@"bytesUploaded" options:0 context:JXHTTPOperationQueueContext];
    [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) forKeyPath:@"response" options:0 context:JXHTTPOperationQueueContext];
    id v4 = [*(id *)(a1 + 32) observedOperationSet];
    [v4 addObject:*(void *)(a1 + 40)];
  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    char v3 = [WeakRetained bytesDownloadedPerOperation];
    [v3 removeObjectForKey:*(void *)(a1 + 32)];

    id v4 = [v5 bytesUploadedPerOperation];
    [v4 removeObjectForKey:*(void *)(a1 + 32)];

    id WeakRetained = v5;
  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observedOperationSet];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(a1 + 40) removeObserver:*(void *)(a1 + 32) forKeyPath:@"bytesDownloaded" context:JXHTTPOperationQueueContext];
    [*(id *)(a1 + 40) removeObserver:*(void *)(a1 + 32) forKeyPath:@"bytesUploaded" context:JXHTTPOperationQueueContext];
    [*(id *)(a1 + 40) removeObserver:*(void *)(a1 + 32) forKeyPath:@"response" context:JXHTTPOperationQueueContext];
    id v4 = [*(id *)(a1 + 32) observedOperationSet];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performDelegateMethod:sel_httpOperationQueueDidStart_];
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setFinishDate:*(void *)(a1 + 32)];
    [v3 performDelegateMethod:sel_httpOperationQueueDidFinish_];
    id WeakRetained = v3;
  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained expectedDownloadBytesPerOperation];
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  [v2 setObject:v3 forKey:*(void *)(a1 + 32)];
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_9(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained bytesDownloadedPerOperation];
    id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
    [v4 setObject:v5 forKey:*(void *)(a1 + 32)];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v6 = [v3 bytesDownloadedPerOperation];
    v7 = [v6 allKeys];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          int v14 = [v3 bytesDownloadedPerOperation];
          v15 = [v14 objectForKey:v13];
          v10 += [v15 longLongValue];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v16 = objc_msgSend(v3, "expectedDownloadBytesPerOperation", 0);
    uint64_t v17 = [v16 allKeys];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          v24 = [v3 expectedDownloadBytesPerOperation];
          v25 = [v24 objectForKey:v23];
          v20 += [v25 longLongValue];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v19);
    }
    else
    {
      uint64_t v20 = 0;
    }

    v26 = [NSNumber numberWithLongLong:v10];
    [v3 setBytesDownloaded:v26];

    v27 = [NSNumber numberWithLongLong:v20];
    [v3 setExpectedDownloadBytes:v27];

    if (v20)
    {
      *(float *)&double v28 = (float)v10 / (float)v20;
      v29 = [NSNumber numberWithFloat:v28];
      [v3 setDownloadProgress:v29];
    }
    else
    {
      [v3 setDownloadProgress:&unk_26F076A90];
    }
    [v3 performDelegateMethod:sel_httpOperationQueueDidUpload_];
    [v3 performDelegateMethod:sel_httpOperationQueueDidMakeProgress_];
  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_10(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained bytesUploadedPerOperation];
    id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
    [v4 setObject:v5 forKey:*(void *)(a1 + 32)];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v6 = [v3 bytesUploadedPerOperation];
    v7 = [v6 allKeys];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          int v14 = [v3 bytesUploadedPerOperation];
          v15 = [v14 objectForKey:v13];
          v10 += [v15 longLongValue];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v16 = objc_msgSend(v3, "expectedUploadBytesPerOperation", 0);
    uint64_t v17 = [v16 allKeys];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          v24 = [v3 expectedUploadBytesPerOperation];
          v25 = [v24 objectForKey:v23];
          v20 += [v25 longLongValue];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v19);
    }
    else
    {
      uint64_t v20 = 0;
    }

    v26 = [NSNumber numberWithLongLong:v10];
    [v3 setBytesUploaded:v26];

    v27 = [NSNumber numberWithLongLong:v20];
    [v3 setExpectedUploadBytes:v27];

    if (v20)
    {
      *(float *)&double v28 = (float)v10 / (float)v20;
      v29 = [NSNumber numberWithFloat:v28];
      [v3 setUploadProgress:v29];
    }
    else
    {
      [v3 setUploadProgress:&unk_26F076A90];
    }
    [v3 performDelegateMethod:sel_httpOperationQueueDidDownload_];
    [v3 performDelegateMethod:sel_httpOperationQueueDidMakeProgress_];
  }
}

- (id)blockForSelector:(SEL)a3
{
  if (sel_httpOperationQueueWillStart_ == a3)
  {
    id v3 = [(JXHTTPOperationQueue *)self willStartBlock];
  }
  else if (sel_httpOperationQueueWillFinish_ == a3)
  {
    id v3 = [(JXHTTPOperationQueue *)self willFinishBlock];
  }
  else if (sel_httpOperationQueueDidStart_ == a3)
  {
    id v3 = [(JXHTTPOperationQueue *)self didStartBlock];
  }
  else if (sel_httpOperationQueueDidUpload_ == a3)
  {
    id v3 = [(JXHTTPOperationQueue *)self didUploadBlock];
  }
  else if (sel_httpOperationQueueDidDownload_ == a3)
  {
    id v3 = [(JXHTTPOperationQueue *)self didDownloadBlock];
  }
  else if (sel_httpOperationQueueDidMakeProgress_ == a3)
  {
    id v3 = [(JXHTTPOperationQueue *)self didMakeProgressBlock];
  }
  else if (sel_httpOperationQueueDidFinish_ == a3)
  {
    id v3 = [(JXHTTPOperationQueue *)self didFinishBlock];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)performDelegateMethod:(SEL)a3
{
  id v5 = [(JXHTTPOperationQueue *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(JXHTTPOperationQueue *)self delegate];
    uint64_t v8 = [MEMORY[0x263F08B88] currentThread];
    [v7 performSelector:a3 onThread:v8 withObject:self waitUntilDone:1];
  }
  uint64_t v9 = [(JXHTTPOperationQueue *)self blockForSelector:a3];
  if (v9)
  {
    objc_initWeak(&location, self);
    BOOL v10 = [(JXHTTPOperationQueue *)self performsBlocksOnMainQueue];
    if (v10)
    {
      uint64_t v11 = MEMORY[0x263EF83A0];
      id v12 = MEMORY[0x263EF83A0];
    }
    else
    {
      uint64_t v11 = [(JXHTTPOperationQueue *)self blockQueue];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__JXHTTPOperationQueue_performDelegateMethod___block_invoke;
    block[3] = &unk_264E5A228;
    objc_copyWeak(&v16, &location);
    id v15 = v9;
    dispatch_async(v11, block);
    uint64_t v13 = MEMORY[0x263EF83A0];
    if (!v10) {
      uint64_t v13 = v11;
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __46__JXHTTPOperationQueue_performDelegateMethod___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (double)elapsedSeconds
{
  id v3 = [(JXHTTPOperationQueue *)self startDate];

  if (!v3) {
    return 0.0;
  }
  id v4 = [(JXHTTPOperationQueue *)self finishDate];
  if (v4)
  {
    id v5 = [(JXHTTPOperationQueue *)self finishDate];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
  }
  v7 = v5;

  uint64_t v8 = [(JXHTTPOperationQueue *)self startDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  return v10;
}

- (JXHTTPOperationQueue)init
{
  v19.receiver = self;
  v19.super_class = (Class)JXHTTPOperationQueue;
  id v2 = [(JXHTTPOperationQueue *)&v19 init];
  id v3 = v2;
  if (v2)
  {
    [(JXHTTPOperationQueue *)v2 setMaxConcurrentOperationCount:4];
    id v4 = [MEMORY[0x263F08AB0] processInfo];
    id v5 = [v4 globallyUniqueString];
    [(JXHTTPOperationQueue *)v3 setUniqueString:v5];

    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(JXHTTPOperationQueue *)v3 setObservedOperationSet:v6];

    [(JXHTTPOperationQueue *)v3 setPerformsBlocksOnMainQueue:0];
    [(JXHTTPOperationQueue *)v3 setDelegate:0];
    [(JXHTTPOperationQueue *)v3 setStartDate:0];
    [(JXHTTPOperationQueue *)v3 setFinishDate:0];
    [(JXHTTPOperationQueue *)v3 setWillStartBlock:0];
    [(JXHTTPOperationQueue *)v3 setWillFinishBlock:0];
    [(JXHTTPOperationQueue *)v3 setDidStartBlock:0];
    [(JXHTTPOperationQueue *)v3 setDidUploadBlock:0];
    [(JXHTTPOperationQueue *)v3 setDidDownloadBlock:0];
    [(JXHTTPOperationQueue *)v3 setDidMakeProgressBlock:0];
    [(JXHTTPOperationQueue *)v3 setDidFinishBlock:0];
    id v7 = [NSString alloc];
    uint64_t v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    double v10 = (void *)[v7 initWithFormat:@"%@.%p.", v9, v3];

    id v11 = [v10 stringByAppendingString:@"observation"];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    [(JXHTTPOperationQueue *)v3 setObservationQueue:v12];

    id v13 = [v10 stringByAppendingString:@"progress"];
    int v14 = (const char *)[v13 UTF8String];
    dispatch_queue_t v15 = dispatch_queue_create(v14, MEMORY[0x263EF83A8]);
    [(JXHTTPOperationQueue *)v3 setProgressQueue:v15];

    id v16 = [v10 stringByAppendingString:@"blocks"];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    [(JXHTTPOperationQueue *)v3 setBlockQueue:v17];

    [(JXHTTPOperationQueue *)v3 addObserver:v3 forKeyPath:@"operations" options:3 context:JXHTTPOperationQueueContext];
  }
  return v3;
}

- (void)dealloc
{
  [(JXHTTPOperationQueue *)self removeObserver:self forKeyPath:@"operations" context:JXHTTPOperationQueueContext];
  v3.receiver = self;
  v3.super_class = (Class)JXHTTPOperationQueue;
  [(JXHTTPOperationQueue *)&v3 dealloc];
}

+ (id)sharedQueue
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__JXHTTPOperationQueue_sharedQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedQueue_predicate != -1) {
    dispatch_once(&sharedQueue_predicate, block);
  }
  id v2 = (void *)sharedQueue_sharedQueue;
  return v2;
}

void __35__JXHTTPOperationQueue_sharedQueue__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sharedQueue_sharedQueue;
  sharedQueue_sharedQueue = (uint64_t)v1;
}

@end