@interface ATDeviceSyncSessionSyncTask
- (ATDeviceSyncSessionSyncTask)initWithDataClass:(id)a3 onMessageLink:(id)a4;
- (BOOL)startAssetTaskWhenFinished;
- (id)sessionGroupingKey;
- (void)_applyChangesForSyncResponse:(id)a3 toCurrentRevision:(unint64_t)a4 versionToken:(id)a5 onMessageLink:(id)a6;
- (void)_drainInputStream:(id)a3 withCompletion:(id)a4;
- (void)_finishSyncWithError:(id)a3;
- (void)_finishTaskWithError:(id)a3;
- (void)_processSyncRequest:(id)a3 onMessageLink:(id)a4;
- (void)_processSyncResponse:(id)a3 onMessageLink:(id)a4;
- (void)_resetSyncDataForLibrary:(id)a3 withCompletionHandler:(id)a4;
- (void)_sendSyncRequestOnMessageLink:(id)a3;
- (void)_sendSyncRequestWithChangesAfterRevision:(unint64_t)a3 toRevision:(unint64_t)a4 withNewRevision:(unint64_t)a5 withSyncType:(unsigned int)a6 onMessageLink:(id)a7;
- (void)_sendSyncRequestWithParams:(id)a3 withSyncType:(unsigned int)a4 syncState:(id)a5 newRevision:(unint64_t)a6 versionToken:(id)a7 inputStream:(id)a8 onMessageLink:(id)a9;
- (void)_sendSyncResponseToRequest:(id)a3 withChangesAfterRevision:(unint64_t)a4 toRevision:(unint64_t)a5 withNewRevision:(unint64_t)a6 withSyncType:(unsigned int)a7 onMessageLink:(id)a8;
- (void)_sendSyncResponseToRequest:(id)a3 withParams:(id)a4 withNewRevision:(unint64_t)a5 withSyncType:(unsigned int)a6 inputStream:(id)a7 onMessageLink:(id)a8;
- (void)_updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)clientTotalItemCount forEndpointType:(int)a5;
- (void)cancel;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)setStartAssetTaskWhenFinished:(BOOL)a3;
- (void)start;
@end

@implementation ATDeviceSyncSessionSyncTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamReaders, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_destroyWeak((id *)&self->_pluginClient);
}

- (void)setStartAssetTaskWhenFinished:(BOOL)a3
{
  self->_startAssetTaskWhenFinished = a3;
}

- (BOOL)startAssetTaskWhenFinished
{
  return self->_startAssetTaskWhenFinished;
}

- (void)_updateProgressWithCount:(unint64_t)a3 totalItemCount:(unint64_t)clientTotalItemCount forEndpointType:(int)a5
{
  if (self->_syncIterationCount == 1)
  {
    if (a5 == 1)
    {
      self->_serverCurrentItemCount = a3;
      self->_serverTotalItemCount = clientTotalItemCount;
      if (self->_clientTotalItemCount) {
        clientTotalItemCount = self->_clientTotalItemCount;
      }
      self->_clientTotalItemCount = clientTotalItemCount;
    }
    else
    {
      self->_clientCurrentItemCount = a3;
      self->_clientTotalItemCount = clientTotalItemCount;
    }
    unint64_t v5 = self->_clientCurrentItemCount + self->_serverCurrentItemCount;
    unint64_t v6 = clientTotalItemCount + self->_serverTotalItemCount;
    v7.receiver = self;
    v7.super_class = (Class)ATDeviceSyncSessionSyncTask;
    [(ATDeviceSyncSessionTask *)&v7 updateProgressWithCount:v5 totalItemCount:v6];
  }
}

- (void)_drainInputStream:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F77A08]);
    v10 = [(ATDeviceSyncSessionTask *)self queue];
    v11 = (void *)[v9 initWithInputStream:v6 queue:v10];

    [(NSMutableArray *)self->_streamReaders addObject:v11];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke;
    v19[3] = &unk_1E6B885C8;
    objc_copyWeak(&v21, &from);
    objc_copyWeak(&v22, &location);
    id v20 = v8;
    v12 = (void *)MEMORY[0x1E016B9C0](v19);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_165;
    v17[3] = &unk_1E6B885F0;
    id v13 = v12;
    id v18 = v13;
    [v11 setDidFinishReadingBlock:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_2;
    v15[3] = &unk_1E6B88618;
    id v14 = v13;
    id v16 = v14;
    [v11 setDidEncounterErrorBlock:v15];
    [v11 setDidReadDataBlock:&__block_literal_global_3533];
    [v11 start];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = v3;
  if (v3 && !*((unsigned char *)v3 + 201))
  {
    id v7 = [v3 queue];
    dispatch_assert_queue_V2(v7);

    [v4[24] removeObject:WeakRetained];
    unint64_t v5 = _ATLogCategoryDeviceSync();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v9 = 138543618;
    v10 = v4;
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    id v6 = "%{public}@: Removing reader=%p";
  }
  else
  {
    unint64_t v5 = _ATLogCategoryDeviceSync();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v9 = 138543618;
    v10 = v4;
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    id v6 = "%{public}@: Not removing reader=%p";
  }
  _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x16u);
LABEL_8:

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
}

uint64_t __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_165(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__ATDeviceSyncSessionSyncTask__drainInputStream_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resetSyncDataForLibrary:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__ATDeviceSyncSessionSyncTask__resetSyncDataForLibrary_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E6B885A0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [WeakRetained resetSyncDataWithCompletion:v11];
}

void __78__ATDeviceSyncSessionSyncTask__resetSyncDataForLibrary_withCompletionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      int v11 = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to reset sync data store. err=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = (void *)v6[23];
    id v9 = [v6 dataClass];
    [v8 setSyncState:0 forLibrary:v7 dataClass:v9];
  }
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

- (void)_sendSyncResponseToRequest:(id)a3 withParams:(id)a4 withNewRevision:(unint64_t)a5 withSyncType:(unsigned int)a6 inputStream:(id)a7 onMessageLink:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  v39[3] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a8;
  settings = self->_settings;
  id v30 = a7;
  id v16 = a3;
  v17 = [v14 identifier];
  id v18 = [(ATSessionTask *)self dataClass];
  v19 = [(ATDeviceSettings *)settings syncStateForLibrary:v17 dataClass:v18];

  v32 = v13;
  if (v13) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v13];
  }
  else {
  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v21 = objc_msgSend(v14, "identifier", v30);
  [v20 setObject:v21 forKey:@"LibraryID"];

  id v22 = [NSNumber numberWithUnsignedInt:v10];
  [v20 setObject:v22 forKey:@"SyncType"];

  v38[0] = @"LastServerRevision";
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "lastServerRevision"));
  v39[0] = v23;
  v38[1] = @"LastClientRevision";
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "lastClientRevision"));
  v39[1] = v24;
  v38[2] = @"NewRevisionKey";
  v25 = [NSNumber numberWithUnsignedLongLong:a5];
  v39[2] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
  [v20 setObject:v26 forKey:@"SyncState"];

  v27 = [v16 responseWithError:0 parameters:v20];

  [v27 setDataStream:v31];
  [v27 setOptions:3];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __124__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withParams_withNewRevision_withSyncType_inputStream_onMessageLink___block_invoke;
  v34[3] = &unk_1E6B88438;
  v34[4] = self;
  id v35 = v19;
  id v36 = v14;
  unint64_t v37 = a5;
  id v28 = v14;
  id v29 = v19;
  [v28 sendResponse:v27 withCompletion:v34];
}

void __124__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withParams_withNewRevision_withSyncType_inputStream_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      id v20 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send sync response data. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    [*(id *)(a1 + 32) _finishSyncWithError:v3];
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    if (v6)
    {
      uint64_t v7 = [v6 mutableCopy];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v8 = (void *)v7;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
    uint64_t v10 = [WeakRetained revisionVersionToken];
    [v8 setVersionToken:v10];

    [v8 setLastServerRevision:*(void *)(a1 + 56)];
    int v11 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = [*(id *)(a1 + 48) identifier];
      int v17 = 138543874;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", (uint8_t *)&v17, 0x20u);
    }
    id v14 = *(void **)(*(void *)(a1 + 32) + 184);
    uint64_t v15 = [*(id *)(a1 + 48) identifier];
    id v16 = [*(id *)(a1 + 32) dataClass];
    [v14 setSyncState:v8 forLibrary:v15 dataClass:v16];
  }
}

- (void)_sendSyncResponseToRequest:(id)a3 withChangesAfterRevision:(unint64_t)a4 toRevision:(unint64_t)a5 withNewRevision:(unint64_t)a6 withSyncType:(unsigned int)a7 onMessageLink:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  int v17 = [(ATDeviceSyncSessionTask *)self queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke;
  v20[3] = &unk_1E6B88578;
  unsigned int v27 = a7;
  v20[4] = self;
  id v21 = v16;
  id v22 = v15;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  SEL v26 = a2;
  id v18 = v15;
  id v19 = v16;
  dispatch_async(v17, v20);
}

void __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke(uint64_t a1)
{
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  char v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3551;
  v45 = __Block_byref_object_dispose__3552;
  id v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__3551;
  void v39[4] = __Block_byref_object_dispose__3552;
  id v40 = 0;
  id v37 = 0;
  id obj = 0;
  [MEMORY[0x1E4F1CAE0] getBoundStreamsWithBufferSize:0x2000 inputStream:&obj outputStream:&v37];
  objc_storeStrong(&v40, obj);
  objc_storeStrong(&v46, v37);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  [*(id *)(a1 + 32) setCurrentItemDescriptions:&unk_1F33DCDA0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
  unsigned int v18 = *(_DWORD *)(a1 + 88);
  uint64_t v3 = [*(id *)(a1 + 40) endpointType];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v6 = [*(id *)(a1 + 48) parameters];
  uint64_t v7 = v42[5];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2;
  v28[3] = &unk_1E6B88500;
  uint64_t v8 = *(void *)(a1 + 32);
  v31 = v49;
  v28[4] = v8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 72);
  int v35 = *(_DWORD *)(a1 + 88);
  id v29 = v9;
  v32 = v39;
  uint64_t v33 = v10;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 80);
  id v30 = v11;
  uint64_t v34 = v12;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_3;
  v25[3] = &unk_1E6B88528;
  id v13 = *(void **)(a1 + 40);
  v25[4] = *(void *)(a1 + 32);
  id v26 = v13;
  unsigned int v27 = v36;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_157;
  v19[3] = &unk_1E6B88550;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(a1 + 40);
  id v21 = v47;
  id v22 = v36;
  void v19[4] = v14;
  unint64_t v23 = &v41;
  id v16 = v15;
  uint64_t v17 = *(void *)(a1 + 80);
  id v20 = v16;
  uint64_t v24 = v17;
  [WeakRetained getChangesForSyncType:v18 endpointType:v3 afterRevision:v5 upToRevision:v4 withSyncParams:v6 intoOutputStream:v7 withStartHandler:v28 withProgressHandler:v25 withCompletionHandler:v19];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
}

void __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = *(void *)(a1 + 80);
    uint64_t v5 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 176));
    uint64_t v7 = [WeakRetained description];
    [v14 handleFailureInMethod:v4, v5, @"ATDeviceSyncSessionSyncTask.m", 564, @"start handler already invoked for client %@", v7 object file lineNumber description];
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(unsigned int *)(a1 + 88);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    [v8 _sendSyncResponseToRequest:v9 withParams:a2 withNewRevision:v11 withSyncType:v10 inputStream:v12 onMessageLink:v13];
  }
}

uint64_t __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 >> 4 >= 0x271 && *(unsigned char *)(*(void *)(a1 + 32) + 200) == 0)
  {
    uint64_t v7 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = a3;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "adding transport upgrade exception for %lld changes total", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = [*(id *)(a1 + 40) socket];
    [v8 addTransportUpgradeException];

    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  return [*(id *)(a1 + 32) _updateProgressWithCount:a2 totalItemCount:a3 forEndpointType:1];
}

void __137__ATDeviceSyncSessionSyncTask__sendSyncResponseToRequest_withChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 176));
    uint64_t v9 = [WeakRetained description];
    [v5 handleFailureInMethod:v6, v7, @"ATDeviceSyncSessionSyncTask.m", 606, @"end handler already invoked for client %@", v9 object file lineNumber description];
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    *(void *)(*(void *)(a1 + 32) + 224) += *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    [*(id *)(a1 + 32) _updateProgressWithCount:v10 totalItemCount:v10 forEndpointType:1];
    if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) streamStatus])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) open];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) close];
    }
    unint64_t v11 = _ATLogCategoryDeviceSync();
    uint64_t v12 = v11;
    if (v3)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v13;
        __int16 v21 = 2114;
        id v22 = v3;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: failed to read sync response data. err=%{public}@", buf, 0x16u);
      }

      [*(id *)(a1 + 32) _finishSyncWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v14;
        __int16 v21 = 2114;
        id v22 = v15;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: finished reading sync response data for library=%{public}@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) setCurrentItemDescriptions:&unk_1F33DCDB8];
    }
    id v16 = *(unsigned char **)(a1 + 32);
    if (v16[200])
    {
      uint64_t v17 = [v16 messageLink];
      unsigned int v18 = [v17 socket];
      [v18 removeTransportUpgradeException];

      *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
    }
  }
}

- (void)_processSyncRequest:(id)a3 onMessageLink:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  ++self->_syncIterationCount;
  uint64_t v8 = [v6 parameters];
  uint64_t v9 = [v8 objectForKey:@"SyncState"];

  settings = self->_settings;
  unint64_t v11 = [v7 identifier];
  uint64_t v12 = [(ATSessionTask *)self dataClass];
  uint64_t v13 = [(ATDeviceSettings *)settings syncStateForLibrary:v11 dataClass:v12];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  uint64_t v15 = [WeakRetained currentRevision];
  id v16 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v6 parameters];
    *(_DWORD *)buf = 138543618;
    v72 = self;
    __int16 v73 = 2114;
    v74 = v17;
    _os_log_impl(&dword_1D9A2D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: received sync request. params=%{public}@", buf, 0x16u);
  }
  unsigned int v18 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v72 = self;
    __int16 v73 = 2114;
    v74 = v13;
    __int16 v75 = 2114;
    v76 = v9;
    __int16 v77 = 2048;
    uint64_t v78 = v15;
    _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: syncState=%{public}@, requestSyncState=%{public}@, currentRevision=%llu", buf, 0x2Au);
  }
  unint64_t v44 = v15;

  id v19 = [WeakRetained revisionVersionToken];
  uint64_t v20 = [v13 versionToken];
  v45 = v9;
  if (v20
    && (__int16 v21 = (void *)v20,
        [v13 versionToken],
        id v22 = objc_claimAutoreleasedReturnValue(),
        char v23 = [v22 isEqualToString:v19],
        v22,
        uint64_t v9 = v45,
        v21,
        (v23 & 1) == 0))
  {
    int v35 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = [v13 versionToken];
      *(_DWORD *)buf = 138543874;
      v72 = self;
      __int16 v73 = 2114;
      v74 = v36;
      __int16 v75 = 2114;
      v76 = v19;
      _os_log_impl(&dword_1D9A2D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: library version token has changed from %{public}@ to %{public}@ - forcing reset", buf, 0x20u);
    }
    unsigned int v27 = [v6 dataStream];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke;
    v68[3] = &unk_1E6B88438;
    v68[4] = self;
    id v28 = &v69;
    id v69 = v6;
    v70[1] = v44;
    id v29 = (id *)v70;
    v70[0] = v7;
    id v30 = v68;
  }
  else
  {
    unint64_t v24 = [v9 lastServerRevision];
    if (v24 <= [v13 lastServerRevision])
    {
      v31 = [v6 parameters];
      v32 = [v31 objectForKey:@"SyncType"];
      int v33 = [v32 integerValue];

      if (v33 == 2)
      {
        uint64_t v43 = 0;
        uint64_t v34 = v45;
      }
      else
      {
        uint64_t v34 = v45;
        uint64_t v43 = [v45 lastServerRevision];
      }
      uint64_t v37 = [v34 newRevision];
      if (v37 == [v13 lastClientRevision])
      {
        v38 = _ATLogCategoryDeviceSync();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v72 = self;
          _os_log_impl(&dword_1D9A2D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring request data we've already applied", buf, 0xCu);
        }

        unsigned int v27 = [v6 dataStream];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_144;
        v61[3] = &unk_1E6B88460;
        v61[4] = self;
        id v28 = &v62;
        id v62 = v6;
        v63[1] = v43;
        v63[2] = v44;
        int v64 = v33;
        id v29 = (id *)v63;
        v63[0] = v7;
        id v30 = v61;
      }
      else
      {
        unint64_t v39 = [v34 lastClientRevision];
        if (v39 <= [v13 lastClientRevision])
        {
          if ([v34 lastServerRevision] <= v44)
          {
            v42 = [(ATDeviceSyncSessionTask *)self queue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_2;
            block[3] = &unk_1E6B884D8;
            block[4] = self;
            int v53 = v33;
            id v28 = &v47;
            id v47 = v7;
            id v29 = &v48;
            id v48 = v6;
            id v49 = v13;
            id v50 = v45;
            id v51 = v19;
            uint64_t v52 = v43;
            dispatch_async(v42, block);

            unsigned int v27 = v49;
            goto LABEL_30;
          }
          uint64_t v41 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v72 = self;
            _os_log_impl(&dword_1D9A2D000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: client has a newer revision than the server - forcing reset sync", buf, 0xCu);
          }

          unsigned int v27 = [v6 dataStream];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_146;
          v54[3] = &unk_1E6B88438;
          v54[4] = self;
          id v28 = &v55;
          id v55 = v6;
          v56[1] = v44;
          id v29 = (id *)v56;
          v56[0] = v7;
          id v30 = v54;
        }
        else
        {
          id v40 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v72 = self;
            _os_log_impl(&dword_1D9A2D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring request data because we are out of sync - draining request stream and respond with our current state", buf, 0xCu);
          }

          unsigned int v27 = [v6 dataStream];
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_145;
          v57[3] = &unk_1E6B88460;
          v57[4] = self;
          id v28 = &v58;
          id v58 = v6;
          v59[1] = v43;
          v59[2] = v44;
          int v60 = v33;
          id v29 = (id *)v59;
          v59[0] = v7;
          id v30 = v57;
        }
      }
    }
    else
    {
      unint64_t v25 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v7 identifier];
        *(_DWORD *)buf = 138543618;
        v72 = self;
        __int16 v73 = 2114;
        v74 = v26;
        _os_log_impl(&dword_1D9A2D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: server revision for %{public}@ has been reset - forcing reset", buf, 0x16u);
      }
      unsigned int v27 = [v6 dataStream];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_143;
      v65[3] = &unk_1E6B88438;
      v65[4] = self;
      id v28 = &v66;
      id v66 = v6;
      v67[1] = v44;
      id v29 = (id *)v67;
      v67[0] = v7;
      id v30 = v65;
    }
  }
  [(ATDeviceSyncSessionSyncTask *)self _drainInputStream:v27 withCompletion:v30];
LABEL_30:
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncResponseToRequest:*(void *)(a1 + 40) withChangesAfterRevision:0 toRevision:*(void *)(a1 + 56) withNewRevision:*(void *)(a1 + 56) withSyncType:2 onMessageLink:*(void *)(a1 + 48)];
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_143(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncResponseToRequest:*(void *)(a1 + 40) withChangesAfterRevision:0 toRevision:*(void *)(a1 + 56) withNewRevision:*(void *)(a1 + 56) withSyncType:2 onMessageLink:*(void *)(a1 + 48)];
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_144(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncResponseToRequest:*(void *)(a1 + 40) withChangesAfterRevision:*(void *)(a1 + 56) toRevision:*(void *)(a1 + 64) withNewRevision:*(void *)(a1 + 64) withSyncType:*(unsigned int *)(a1 + 72) onMessageLink:*(void *)(a1 + 48)];
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_145(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncResponseToRequest:*(void *)(a1 + 40) withChangesAfterRevision:*(void *)(a1 + 56) toRevision:*(void *)(a1 + 64) withNewRevision:*(void *)(a1 + 64) withSyncType:*(unsigned int *)(a1 + 72) onMessageLink:*(void *)(a1 + 48)];
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_146(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncResponseToRequest:*(void *)(a1 + 40) withChangesAfterRevision:0 toRevision:*(void *)(a1 + 56) withNewRevision:*(void *)(a1 + 56) withSyncType:2 onMessageLink:*(void *)(a1 + 48)];
}

void __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentItemDescriptions:&unk_1F33DCD88];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
  uint64_t v3 = *(unsigned int *)(a1 + 88);
  uint64_t v4 = [*(id *)(a1 + 40) endpointType];
  uint64_t v5 = [*(id *)(a1 + 48) dataStream];
  id v6 = [*(id *)(a1 + 48) parameters];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_3;
  v18[3] = &unk_1E6B88488;
  v18[4] = v19;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_4;
  v9[3] = &unk_1E6B884B0;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v15 = v19;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 80);
  id v14 = v7;
  uint64_t v16 = v8;
  int v17 = *(_DWORD *)(a1 + 88);
  [WeakRetained applyChangesForSyncType:v3 endpointType:v4 fromStream:v5 withSyncParams:v6 withProgressHandler:v18 withCompletionHandler:v9];

  _Block_object_dispose(v19, 8);
}

uint64_t __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

void __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  *(void *)(*(void *)(a1 + 32) + 224) += *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v8 = [*(id *)(a1 + 40) dataStream];
  uint64_t v9 = [v8 streamStatus];

  if (!v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) dataStream];
    [v10 _drainInputStream:v11 withCompletion:0];
  }
  id v12 = _ATLogCategoryDeviceSync();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v14;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to process sync request changes. err=%{public}@", buf, 0x16u);
    }

    uint64_t v15 = [*(id *)(a1 + 40) responseWithError:v7 parameters:0];
    uint64_t v16 = *(void **)(a1 + 72);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_150;
    v27[3] = &unk_1E6B88AF0;
    v27[4] = *(void *)(a1 + 32);
    [v16 sendResponse:v15 withCompletion:v27];
    [*(id *)(a1 + 32) _finishSyncWithError:v7];
  }
  else
  {
    if (v13)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v17;
      __int16 v30 = 2048;
      id v31 = a3;
      __int16 v32 = 2048;
      int v33 = a4;
      __int16 v34 = 2114;
      uint64_t v35 = v18;
      _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: sync request processed successfully. beforeRevision=%llu, afterRevision=%llu, oldSyncState=%{public}@", buf, 0x2Au);
    }

    id v19 = *(void **)(a1 + 48);
    if (v19)
    {
      uint64_t v20 = (void *)[v19 mutableCopy];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v15 = v20;
    objc_msgSend(v20, "setLastServerRevision:", objc_msgSend(*(id *)(a1 + 56), "lastServerRevision"));
    objc_msgSend(v15, "setLastClientRevision:", objc_msgSend(*(id *)(a1 + 56), "newRevision"));
    [v15 setVersionToken:*(void *)(a1 + 64)];
    __int16 v21 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      char v23 = [*(id *)(a1 + 72) identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      id v31 = v23;
      __int16 v32 = 2114;
      int v33 = v15;
      _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", buf, 0x20u);
    }
    unint64_t v24 = *(void **)(*(void *)(a1 + 32) + 184);
    unint64_t v25 = [*(id *)(a1 + 72) identifier];
    id v26 = [*(id *)(a1 + 32) dataClass];
    [v24 setSyncState:v15 forLibrary:v25 dataClass:v26];

    [*(id *)(a1 + 32) _sendSyncResponseToRequest:*(void *)(a1 + 40) withChangesAfterRevision:*(void *)(a1 + 88) toRevision:a3 withNewRevision:a4 withSyncType:*(unsigned int *)(a1 + 96) onMessageLink:*(void *)(a1 + 72)];
  }
}

void __65__ATDeviceSyncSessionSyncTask__processSyncRequest_onMessageLink___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send error response. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_applyChangesForSyncResponse:(id)a3 toCurrentRevision:(unint64_t)a4 versionToken:(id)a5 onMessageLink:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  settings = self->_settings;
  BOOL v13 = [v11 identifier];
  uint64_t v14 = [(ATSessionTask *)self dataClass];
  uint64_t v15 = [(ATDeviceSettings *)settings syncStateForLibrary:v13 dataClass:v14];

  uint64_t v16 = [v9 parameters];
  uint64_t v17 = [v16 objectForKey:@"SyncState"];

  uint64_t v18 = [v9 parameters];
  id v19 = [v18 objectForKey:@"SyncType"];
  int v20 = [v19 integerValue];

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  __int16 v21 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke;
  block[3] = &unk_1E6B88410;
  int v39 = v20;
  block[4] = self;
  id v30 = v11;
  uint64_t v35 = v42;
  uint64_t v36 = v40;
  id v31 = v9;
  id v32 = v15;
  id v33 = v17;
  id v34 = v10;
  unint64_t v37 = a4;
  SEL v38 = a2;
  id v22 = v10;
  id v23 = v17;
  id v24 = v15;
  id v25 = v9;
  id v26 = v11;
  dispatch_async(v21, block);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

void __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentItemDescriptions:&unk_1F33DCD70];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
  uint64_t v3 = *(unsigned int *)(a1 + 112);
  uint64_t v4 = [*(id *)(a1 + 40) endpointType];
  uint64_t v5 = [*(id *)(a1 + 48) dataStream];
  int v6 = [*(id *)(a1 + 48) parameters];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_2;
  v20[3] = &unk_1E6B883C0;
  uint64_t v21 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_3;
  v11[3] = &unk_1E6B883E8;
  v11[4] = v21;
  int8x16_t v7 = *(int8x16_t *)(a1 + 80);
  uint64_t v22 = *(void *)(a1 + 80);
  int8x16_t v17 = vextq_s8(v7, v7, 8uLL);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 96);
  uint64_t v10 = *(void *)(a1 + 104);
  id v16 = v8;
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  [WeakRetained applyChangesForSyncType:v3 endpointType:v4 fromStream:v5 withSyncParams:v6 withProgressHandler:v20 withCompletionHandler:v11];
}

void __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  [*(id *)(a1 + 32) _updateProgressWithCount:a2 totalItemCount:a3 forEndpointType:0];
  v12[0] = @"_CompletedItemCount";
  int v6 = [NSNumber numberWithUnsignedLongLong:a2];
  v12[1] = @"_TotalItemCount";
  v13[0] = v6;
  int8x16_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v9 = objc_alloc(MEMORY[0x1E4F4A2D0]);
  uint64_t v10 = [*(id *)(a1 + 32) dataClass];
  id v11 = (void *)[v9 initWithCommand:@"UpdateSyncSessionTask" dataClass:v10 parameters:v8];

  [*(id *)(a1 + 32) sendRequest:v11 withCompletion:0];
}

void __105__ATDeviceSyncSessionSyncTask__applyChangesForSyncResponse_toCurrentRevision_versionToken_onMessageLink___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 104);
    uint64_t v11 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(v11 + 176));
    id v13 = [WeakRetained description];
    [v9 handleFailureInMethod:v10, v11, @"ATDeviceSyncSessionSyncTask.m", 443, @"end handler already invoked by client %@", v13 object file lineNumber description];
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 1;
    *(void *)(*(void *)(a1 + 32) + 224) += *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    [*(id *)(a1 + 32) _updateProgressWithCount:v14 totalItemCount:v14 forEndpointType:0];
    id v15 = [*(id *)(a1 + 40) dataStream];
    uint64_t v16 = [v15 streamStatus];

    if (!v16)
    {
      int8x16_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = [*(id *)(a1 + 40) dataStream];
      [v17 _drainInputStream:v18 withCompletion:0];
    }
    uint64_t v19 = _ATLogCategoryDeviceSync();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v20)
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v21;
        __int16 v38 = 2114;
        id v39 = v7;
        _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to process incoming server changes. err=%{public}@", buf, 0x16u);
      }

      [*(id *)(a1 + 32) _finishSyncWithError:v7];
    }
    else
    {
      if (v20)
      {
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v22;
        __int16 v38 = 2048;
        id v39 = a4;
        _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: sync response applied successfully. afterRevision=%llu", buf, 0x16u);
      }

      id v23 = *(void **)(a1 + 48);
      if (v23)
      {
        id v24 = (void *)[v23 mutableCopy];
      }
      else
      {
        id v24 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      id v25 = v24;
      objc_msgSend(v24, "setLastServerRevision:", objc_msgSend(*(id *)(a1 + 56), "newRevision"));
      objc_msgSend(v25, "setLastClientRevision:", objc_msgSend(*(id *)(a1 + 56), "lastClientRevision"));
      [v25 setVersionToken:*(void *)(a1 + 64)];
      id v26 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *(void *)(a1 + 32);
        id v28 = [*(id *)(a1 + 72) identifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v37 = v27;
        __int16 v38 = 2114;
        id v39 = v28;
        __int16 v40 = 2114;
        char v41 = v25;
        _os_log_impl(&dword_1D9A2D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", buf, 0x20u);
      }
      uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 184);
      id v30 = [*(id *)(a1 + 72) identifier];
      id v31 = [*(id *)(a1 + 32) dataClass];
      [v29 setSyncState:v25 forLibrary:v30 dataClass:v31];

      id v32 = _ATLogCategoryDeviceSync();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (a3 == a4)
      {
        if (v33)
        {
          uint64_t v34 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v37 = v34;
          _os_log_impl(&dword_1D9A2D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: no new revisions after response - we're in sync!", buf, 0xCu);
        }

        [*(id *)(a1 + 32) _finishSyncWithError:0];
      }
      else
      {
        if (v33)
        {
          uint64_t v35 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          uint64_t v37 = v35;
          __int16 v38 = 2048;
          id v39 = a3;
          __int16 v40 = 2048;
          char v41 = a4;
          _os_log_impl(&dword_1D9A2D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: revision changed from %lld to %lld - syncing again", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_sendSyncRequestWithChangesAfterRevision:toRevision:withNewRevision:withSyncType:onMessageLink:", objc_msgSend(*(id *)(a1 + 56), "lastClientRevision"), *(void *)(a1 + 96), a4, 1, *(void *)(a1 + 72));
      }
    }
  }
}

- (void)_processSyncResponse:(id)a3 onMessageLink:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isPartial] & 1) == 0)
  {
    settings = self->_settings;
    id v9 = [v7 identifier];
    uint64_t v10 = [(ATSessionTask *)self dataClass];
    uint64_t v11 = [(ATDeviceSettings *)settings syncStateForLibrary:v9 dataClass:v10];

    id v12 = [v6 parameters];
    uint64_t v43 = [v12 objectForKey:@"SyncState"];

    id v13 = [v6 parameters];
    uint64_t v14 = [v13 objectForKey:@"SyncType"];
    int v15 = [v14 integerValue];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
    uint64_t v44 = [WeakRetained revisionVersionToken];
    uint64_t v17 = [WeakRetained currentRevision];
    uint64_t v18 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v7 identifier];
      *(_DWORD *)buf = 138544130;
      id v49 = self;
      __int16 v50 = 2114;
      id v51 = v19;
      __int16 v52 = 2048;
      uint64_t v53 = v17;
      __int16 v54 = 2114;
      id v55 = v11;
      _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: processing sync response. library=%{public}@, currentRevision=%llu, syncState=%{public}@", buf, 0x2Au);
    }
    uint64_t v20 = [v11 versionToken];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      uint64_t v22 = [v11 versionToken];
      char v23 = [v22 isEqualToString:v44];

      if ((v23 & 1) == 0)
      {
        uint64_t v36 = _ATLogCategoryDeviceSync();
        uint64_t v35 = (void *)v44;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = [v11 versionToken];
          *(_DWORD *)buf = 138543874;
          id v49 = self;
          __int16 v50 = 2114;
          id v51 = v37;
          __int16 v52 = 2114;
          uint64_t v53 = v44;
          _os_log_impl(&dword_1D9A2D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring sync response because the revision token has changed (%{public}@ -> %{public}@)", buf, 0x20u);
        }
        __int16 v38 = self->_settings;
        id v39 = [v7 identifier];
        __int16 v40 = [(ATSessionTask *)self dataClass];
        [(ATDeviceSettings *)v38 setSyncState:0 forLibrary:v39 dataClass:v40];

        char v41 = [v6 dataStream];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke;
        v46[3] = &unk_1E6B88BE0;
        v46[4] = self;
        id v47 = v7;
        [(ATDeviceSyncSessionSyncTask *)self _drainInputStream:v41 withCompletion:v46];

        id v24 = v43;
        goto LABEL_21;
      }
    }
    if (v15 == 2)
    {
      uint64_t v42 = _ATLogCategoryDeviceSync();
      id v24 = v43;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = self;
        _os_log_impl(&dword_1D9A2D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: the server is requesting a reset sync - prepare for a full update", buf, 0xCu);
      }
    }
    else
    {
      id v24 = v43;
      if (v15 == 1)
      {
        uint64_t v25 = [v43 newRevision];
        if (v25 == [v11 lastServerRevision])
        {
          id v26 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = [v7 identifier];
            *(_DWORD *)buf = 138543618;
            id v49 = self;
            __int16 v50 = 2114;
            id v51 = v27;
            _os_log_impl(&dword_1D9A2D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: sync complete for library %{public}@", buf, 0x16u);
          }
          id v28 = (void *)[v11 mutableCopy];
          objc_msgSend(v28, "setLastClientRevision:", objc_msgSend(v43, "lastClientRevision"));
          [v28 setVersionToken:v44];
          uint64_t v29 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = [v7 identifier];
            *(_DWORD *)buf = 138543874;
            id v49 = self;
            __int16 v50 = 2114;
            id v51 = v30;
            __int16 v52 = 2114;
            uint64_t v53 = (uint64_t)v28;
            _os_log_impl(&dword_1D9A2D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@, %{public}@", buf, 0x20u);
          }
          id v31 = self->_settings;
          id v32 = [v7 identifier];
          BOOL v33 = [(ATSessionTask *)self dataClass];
          [(ATDeviceSettings *)v31 setSyncState:v28 forLibrary:v32 dataClass:v33];

          uint64_t v34 = [v6 dataStream];
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke_135;
          v45[3] = &unk_1E6B88AF0;
          v45[4] = self;
          [(ATDeviceSyncSessionSyncTask *)self _drainInputStream:v34 withCompletion:v45];

          uint64_t v35 = (void *)v44;
          goto LABEL_21;
        }
      }
    }
    uint64_t v35 = (void *)v44;
    [(ATDeviceSyncSessionSyncTask *)self _applyChangesForSyncResponse:v6 toCurrentRevision:v17 versionToken:v44 onMessageLink:v7];
LABEL_21:
  }
}

uint64_t __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncRequestOnMessageLink:*(void *)(a1 + 40)];
}

uint64_t __66__ATDeviceSyncSessionSyncTask__processSyncResponse_onMessageLink___block_invoke_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishSyncWithError:0];
}

- (void)_sendSyncRequestWithParams:(id)a3 withSyncType:(unsigned int)a4 syncState:(id)a5 newRevision:(unint64_t)a6 versionToken:(id)a7 inputStream:(id)a8 onMessageLink:(id)a9
{
  uint64_t v12 = *(void *)&a4;
  v41[3] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v33 = a7;
  id v16 = a9;
  uint64_t v17 = (void *)MEMORY[0x1E4F1CA60];
  id v18 = a8;
  if (a3) {
    [v17 dictionaryWithDictionary:a3];
  }
  else {
  uint64_t v19 = [v17 dictionary];
  }
  uint64_t v20 = [v16 identifier];
  [v19 setObject:v20 forKey:@"LibraryID"];

  uint64_t v21 = [NSNumber numberWithUnsignedInt:v12];
  [v19 setObject:v21 forKey:@"SyncType"];

  v40[0] = @"LastServerRevision";
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "lastServerRevision"));
  v41[0] = v22;
  v40[1] = @"LastClientRevision";
  char v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "lastClientRevision"));
  v41[1] = v23;
  v40[2] = @"NewRevisionKey";
  [NSNumber numberWithUnsignedLongLong:a6];
  v25 = unint64_t v24 = a6;
  v41[2] = v25;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
  [v19 setObject:v26 forKey:@"SyncState"];

  id v27 = objc_alloc(MEMORY[0x1E4F4A2D0]);
  id v28 = [(ATSessionTask *)self dataClass];
  uint64_t v29 = (void *)[v27 initWithCommand:@"Sync" dataClass:v28 parameters:v19];

  [v29 setDataStream:v18];
  [v29 setOptions:3];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __132__ATDeviceSyncSessionSyncTask__sendSyncRequestWithParams_withSyncType_syncState_newRevision_versionToken_inputStream_onMessageLink___block_invoke;
  v34[3] = &unk_1E6B88398;
  id v38 = v16;
  unint64_t v39 = v24;
  id v35 = v15;
  id v36 = v33;
  uint64_t v37 = self;
  id v30 = v16;
  id v31 = v33;
  id v32 = v15;
  [(ATDeviceSyncSessionTask *)self sendRequest:v29 withCompletion:v34];
}

void __132__ATDeviceSyncSessionSyncTask__sendSyncRequestWithParams_withSyncType_syncState_newRevision_versionToken_inputStream_onMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    if (v11)
    {
      uint64_t v12 = [v11 mutableCopy];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v9 = v12;
    -[NSObject setLastServerRevision:](v12, "setLastServerRevision:", [*(id *)(a1 + 32) lastServerRevision]);
    [v9 setLastClientRevision:*(void *)(a1 + 64)];
    [v9 setVersionToken:*(void *)(a1 + 40)];
    uint64_t v14 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = [*(id *)(a1 + 56) identifier];
      uint64_t v17 = [*(id *)(a1 + 48) dataClass];
      int v21 = 138544130;
      uint64_t v22 = v15;
      __int16 v23 = 2114;
      id v24 = v16;
      __int16 v25 = 2114;
      id v26 = v17;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: saving new sync state for %{public}@:%{public}@, %{public}@", (uint8_t *)&v21, 0x2Au);
    }
    id v18 = *(void **)(*(void *)(a1 + 48) + 184);
    uint64_t v19 = [*(id *)(a1 + 56) identifier];
    uint64_t v20 = [*(id *)(a1 + 48) dataClass];
    [v18 setSyncState:v9 forLibrary:v19 dataClass:v20];

    [*(id *)(a1 + 48) _processSyncResponse:v5 onMessageLink:*(void *)(a1 + 56)];
    goto LABEL_14;
  }
  char v7 = [*(id *)(a1 + 48) isRunning];
  uint64_t v8 = _ATLogCategoryDeviceSync();
  id v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      int v21 = 138543618;
      uint64_t v22 = v13;
      __int16 v23 = 1024;
      LODWORD(v24) = [v5 messageID];
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring sync response with id %u because that sync was canceled", (uint8_t *)&v21, 0x12u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    int v21 = 138543618;
    uint64_t v22 = v10;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: failed to send sync changes. err=%{public}@", (uint8_t *)&v21, 0x16u);
  }

  [*(id *)(a1 + 48) _finishSyncWithError:v6];
LABEL_15:
}

- (void)_sendSyncRequestWithChangesAfterRevision:(unint64_t)a3 toRevision:(unint64_t)a4 withNewRevision:(unint64_t)a5 withSyncType:(unsigned int)a6 onMessageLink:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  settings = self->_settings;
  uint64_t v13 = [v11 identifier];
  uint64_t v14 = [(ATSessionTask *)self dataClass];
  uint64_t v15 = [(ATDeviceSettings *)settings syncStateForLibrary:v13 dataClass:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  uint64_t v17 = [WeakRetained revisionVersionToken];

  if (!a3) {
    goto LABEL_9;
  }
  id v18 = [v15 versionToken];
  uint64_t v19 = v18;
  if (v18) {
    BOOL v20 = v17 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
  }
  else
  {
    int v21 = [v15 versionToken];
    char v22 = [v17 isEqualToString:v21];

    if (v22)
    {
LABEL_9:
      __int16 v23 = _ATLogCategoryDeviceSync();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v11 identifier];
        __int16 v25 = [(ATSessionTask *)self dataClass];
        *(_DWORD *)buf = 138544642;
        id v47 = self;
        __int16 v48 = 2114;
        id v49 = v24;
        __int16 v50 = 2114;
        id v51 = v25;
        __int16 v52 = 2048;
        unint64_t v53 = a3;
        __int16 v54 = 2048;
        unint64_t v55 = a4;
        __int16 v56 = 2114;
        v57 = v15;
        _os_log_impl(&dword_1D9A2D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: building sync request. library=%{public}@, dataclass=%{public}@, fromRevision=%lld, toRevision=%lld. current sync state=%{public}@", buf, 0x3Eu);
      }
      ++self->_syncIterationCount;
      id v26 = [(ATDeviceSyncSessionTask *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_104;
      block[3] = &unk_1E6B88358;
      unsigned int v43 = a6;
      __int16 v27 = &v36;
      block[4] = self;
      id v36 = v11;
      unint64_t v39 = a3;
      unint64_t v40 = a4;
      id v37 = v15;
      unint64_t v41 = a5;
      id v38 = v17;
      SEL v42 = a2;
      id v28 = v11;
      dispatch_async(v26, block);

      uint64_t v29 = v37;
      goto LABEL_15;
    }
  }
  id v30 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = [v15 versionToken];
    *(_DWORD *)buf = 138543874;
    id v47 = self;
    __int16 v48 = 2114;
    id v49 = v31;
    __int16 v50 = 2114;
    id v51 = v17;
    _os_log_impl(&dword_1D9A2D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: library version token has changed from %{public}@ to %{public}@ - forcing reset", buf, 0x20u);
  }
  uint64_t v29 = [v11 identifier];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke;
  v44[3] = &unk_1E6B88BE0;
  __int16 v27 = &v45;
  v44[4] = self;
  id v45 = v11;
  id v32 = v11;
  [(ATDeviceSyncSessionSyncTask *)self _resetSyncDataForLibrary:v29 withCompletionHandler:v44];
LABEL_15:
}

uint64_t __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(result + 32) + 176));
    uint64_t v5 = [WeakRetained currentRevision];

    id v6 = *(void **)(v3 + 32);
    uint64_t v7 = *(void *)(v3 + 40);
    return [v6 _sendSyncRequestWithChangesAfterRevision:0 toRevision:v5 withNewRevision:v5 withSyncType:2 onMessageLink:v7];
  }
  return result;
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_104(uint64_t a1)
{
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  unsigned int v43 = __Block_byref_object_copy__3551;
  uint64_t v44 = __Block_byref_object_dispose__3552;
  id v45 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  void v38[3] = __Block_byref_object_copy__3551;
  v38[4] = __Block_byref_object_dispose__3552;
  id v39 = 0;
  id v36 = 0;
  id obj = 0;
  [MEMORY[0x1E4F1CAE0] getBoundStreamsWithBufferSize:0x2000 inputStream:&obj outputStream:&v36];
  objc_storeStrong(&v39, obj);
  objc_storeStrong(&v45, v36);
  [*(id *)(a1 + 32) setCurrentItemDescriptions:&unk_1F33DCD40];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
  unsigned int v17 = *(_DWORD *)(a1 + 96);
  uint64_t v3 = [*(id *)(a1 + 40) endpointType];
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = v41[5];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_109;
  v27[3] = &unk_1E6B88330;
  uint64_t v7 = *(void *)(a1 + 32);
  id v31 = v48;
  v27[4] = v7;
  int v35 = *(_DWORD *)(a1 + 96);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 80);
  id v28 = v8;
  uint64_t v33 = v9;
  id v29 = *(id *)(a1 + 56);
  id v32 = v38;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 88);
  id v30 = v10;
  uint64_t v34 = v11;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2;
  v24[3] = &unk_1E6B88528;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v26 = v50;
  v24[4] = v12;
  id v25 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_115;
  v18[3] = &unk_1E6B88550;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(a1 + 40);
  BOOL v20 = v46;
  v18[4] = v14;
  id v19 = v15;
  uint64_t v16 = *(void *)(a1 + 88);
  int v21 = v50;
  char v22 = &v40;
  uint64_t v23 = v16;
  [WeakRetained getChangesForSyncType:v17 endpointType:v3 afterRevision:v4 upToRevision:v5 withSyncParams:0 intoOutputStream:v6 withStartHandler:v27 withProgressHandler:v24 withCompletionHandler:v18];

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_109(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = *(void *)(a1 + 88);
    uint64_t v5 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 176));
    uint64_t v7 = [WeakRetained description];
    [v8 handleFailureInMethod:v4, v5, @"ATDeviceSyncSessionSyncTask.m", 271, @"start handler already invoked by client %@", v7 object file lineNumber description];
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
    [*(id *)(a1 + 32) _sendSyncRequestWithParams:a2 withSyncType:*(unsigned int *)(a1 + 96) syncState:*(void *)(a1 + 40) newRevision:*(void *)(a1 + 80) versionToken:*(void *)(a1 + 48) inputStream:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) onMessageLink:*(void *)(a1 + 56)];
  }
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  if (a3 >> 4 >= 0x271 && !*(unsigned char *)(*(void *)(a1 + 32) + 200))
  {
    uint64_t v5 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "adding transport upgrade exception for %lld changes total", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v6 = [*(id *)(a1 + 40) socket];
    [v6 addTransportUpgradeException];

    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
  }
}

void __126__ATDeviceSyncSessionSyncTask__sendSyncRequestWithChangesAfterRevision_toRevision_withNewRevision_withSyncType_onMessageLink___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 176));
    uint64_t v9 = [WeakRetained description];
    [v5 handleFailureInMethod:v6, v7, @"ATDeviceSyncSessionSyncTask.m", 303, @"end handler already invoked by client %@", v9 object file lineNumber description];

    goto LABEL_14;
  }
  *(unsigned char *)(v4 + 24) = 1;
  id v10 = _ATLogCategoryDeviceSync();
  uint64_t v11 = v10;
  if (v3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = [*(id *)(a1 + 40) identifier];
      uint64_t v14 = [*(id *)(a1 + 32) dataClass];
      uint64_t v15 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      char v22 = v13;
      __int16 v23 = 2114;
      id v24 = v14;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: finished writing sync request data for library=%{public}@, dataclass=%{public}@ error=%{public}@", buf, 0x2Au);

LABEL_8:
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    unsigned int v17 = [*(id *)(a1 + 40) identifier];
    uint64_t v14 = [*(id *)(a1 + 32) dataClass];
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v16;
    __int16 v21 = 2114;
    char v22 = v17;
    __int16 v23 = 2114;
    id v24 = v14;
    _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: finished writing sync request data for library=%{public}@, dataclass=%{public}@", buf, 0x20u);

    goto LABEL_8;
  }

  *(void *)(*(void *)(a1 + 32) + 224) += *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) streamStatus])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) open];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) close];
  }
  id v18 = *(void **)(a1 + 32);
  if (v3) {
    [v18 _finishSyncWithError:v3];
  }
  else {
    [v18 setCurrentItemDescriptions:&unk_1F33DCD58];
  }
LABEL_14:
}

- (void)_sendSyncRequestOnMessageLink:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  settings = self->_settings;
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [(ATSessionTask *)self dataClass];
  unint64_t v8 = [(ATDeviceSettings *)settings syncStateForLibrary:v6 dataClass:v7];

  uint64_t v9 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    unsigned int v17 = v8;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: sending sync request. syncState=%{public}@", (uint8_t *)&v14, 0x16u);
  }

  if (v8)
  {
    if ([v8 lastServerRevision]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    uint64_t v11 = [v8 lastClientRevision];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
    uint64_t v13 = [WeakRetained currentRevision];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 2;
  }
  [(ATDeviceSyncSessionSyncTask *)self _sendSyncRequestWithChangesAfterRevision:v11 toRevision:v13 withNewRevision:v13 withSyncType:v10 onMessageLink:v4];
}

- (void)_finishTaskWithError:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATDeviceSyncSessionTask *)self messageLink];
  uint64_t v6 = [(ATSessionTask *)self session];
  uint64_t v7 = v6;
  if (!v4 && self->_startAssetTaskWhenFinished)
  {
    if (([v6 isCancelled] & 1) == 0
      && ([v7 isFinished] & 1) == 0
      && [v5 isOpen])
    {
      unint64_t v8 = [ATDeviceSyncSessionAssetTask alloc];
      uint64_t v9 = [(ATSessionTask *)self dataClass];
      uint64_t v10 = [(ATDeviceSyncSessionAssetTask *)v8 initWithDataClass:v9 onMessageLink:v5];

      v38[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      [v7 addSessionTasks:v11];

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    uint64_t v10 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL startAssetTaskWhenFinished = self->_startAssetTaskWhenFinished;
      *(_DWORD *)buf = 138544386;
      uint64_t v27 = self;
      __int16 v28 = 1024;
      BOOL v29 = startAssetTaskWhenFinished;
      __int16 v30 = 1024;
      int v31 = [v7 isCancelled];
      __int16 v32 = 1024;
      int v33 = [v7 isFinished];
      __int16 v34 = 1024;
      int v35 = [v5 isOpen];
      _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: not starting asset task. syncAssets=%d, cancelled=%d, finished=%d, messageLinkOpen=%d", buf, 0x24u);
    }
    goto LABEL_12;
  }
  uint64_t v10 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = self->_startAssetTaskWhenFinished;
    int v13 = [v7 isCancelled];
    int v14 = [v7 isFinished];
    int v15 = [v5 isOpen];
    __int16 v16 = objc_msgSend(v4, "msv_description");
    *(_DWORD *)buf = 138544642;
    uint64_t v27 = self;
    __int16 v28 = 1024;
    BOOL v29 = v12;
    __int16 v30 = 1024;
    int v31 = v13;
    __int16 v32 = 1024;
    int v33 = v14;
    __int16 v34 = 1024;
    int v35 = v15;
    __int16 v36 = 2114;
    id v37 = v16;
    _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: not starting asset task. syncAssets=%d, cancelled=%d, finished=%d, messageLinkOpen=%d error=%{public}@", buf, 0x2Eu);
  }
LABEL_12:

  uint64_t v18 = [(ATDeviceSyncSessionTask *)self queue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke;
  v22[3] = &unk_1E6B88308;
  v22[4] = self;
  id v23 = v4;
  id v24 = v5;
  id v25 = v7;
  id v19 = v7;
  id v20 = v5;
  id v21 = v4;
  dispatch_async(v18, v22);
}

void __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 201) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 200))
  {
    id v3 = [(id)v2 messageLink];
    id v4 = [v3 socket];
    [v4 removeTransportUpgradeException];

    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 176));
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained syncCompletedWithError:*(void *)(a1 + 40)];
  }
  uint64_t v27 = v6;
  uint64_t v7 = dispatch_group_create();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 192);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_2;
        v30[3] = &unk_1E6B88BB8;
        int v14 = v7;
        uint64_t v15 = *(void *)(a1 + 32);
        int v31 = v14;
        uint64_t v32 = v15;
        int v33 = v13;
        [v13 stopWithCompletion:v30];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v10);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v17 = v16 - *(double *)(*(void *)(a1 + 32) + 208);
  uint64_t v18 = _ATLogCategoryDeviceSync();
  id v19 = v27;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = [v27 syncDataClass];
    *(_DWORD *)buf = 138543874;
    uint64_t v39 = v20;
    __int16 v40 = 2114;
    double v41 = *(double *)&v21;
    __int16 v42 = 2048;
    double v43 = v17;
    _os_log_impl(&dword_1D9A2D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync Task finished for %{public}@ in %.2f seconds", buf, 0x20u);
  }
  double v22 = (double)*(unint64_t *)(*(void *)(a1 + 32) + 224) / v17;
  id v23 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 224);
    *(_DWORD *)buf = 134218240;
    uint64_t v39 = v24;
    __int16 v40 = 2048;
    double v41 = v22;
    _os_log_impl(&dword_1D9A2D000, v23, OS_LOG_TYPE_DEFAULT, "==> synced %lld total items (%.2f items/s)", buf, 0x16u);
  }

  if (*(void *)(*(void *)(a1 + 32) + 224)
    && ![*(id *)(a1 + 48) endpointType]
    && !*(void *)(a1 + 40)
    && ([*(id *)(a1 + 56) isCancelled] & 1) == 0
    && ([*(id *)(a1 + 56) isFinished] & 1) == 0)
  {
    ATReportEventAddDoubleToScalarKey();
  }
  id v25 = objc_msgSend(*(id *)(a1 + 32), "queue", v27);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_103;
  block[3] = &unk_1E6B88B68;
  id v26 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v29 = v26;
  dispatch_group_notify(v7, v25, block);
}

uint64_t __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 40) + 192);

  return [v3 removeObject:v2];
}

uint64_t __52__ATDeviceSyncSessionSyncTask__finishTaskWithError___block_invoke_103(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: All readers stopped. wrapping up task ..", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) setFinished:1];
}

- (void)_finishSyncWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  settings = self->_settings;
  uint64_t v6 = [(ATDeviceSyncSessionTask *)self messageLink];
  uint64_t v7 = [v6 identifier];
  id v8 = [(ATSessionTask *)self dataClass];
  [(ATDeviceSettings *)settings updateLastSyncTimeForLibrary:v7 dataClass:v8];

  uint64_t v9 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: finishSyncWithError. err=%{public}@", buf, 0x16u);
  }

  uint64_t v10 = [(ATDeviceSyncSessionTask *)self messageLink];
  int v11 = [v10 endpointType];

  if (v11)
  {
    [(ATDeviceSyncSessionSyncTask *)self _finishTaskWithError:v4];
  }
  else
  {
    BOOL v12 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v4)
    {
      int v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
      [v12 setObject:v13 forKey:@"_SyncTaskFinishedResult"];
    }
    if (![(ATDeviceSyncSessionSyncTask *)self startAssetTaskWhenFinished]) {
      [v12 setObject:MEMORY[0x1E4F1CC28] forKey:@"_SyncTaskFinishedSyncAssets"];
    }
    id v14 = objc_alloc(MEMORY[0x1E4F4A2D0]);
    uint64_t v15 = [(ATSessionTask *)self dataClass];
    double v16 = (void *)[v14 initWithCommand:@"SyncTaskFinished" dataClass:v15 parameters:v12];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__ATDeviceSyncSessionSyncTask__finishSyncWithError___block_invoke;
    v17[3] = &unk_1E6B882E0;
    void v17[4] = self;
    id v18 = v4;
    [(ATDeviceSyncSessionTask *)self sendRequest:v16 withCompletion:v17];
  }
}

void __52__ATDeviceSyncSessionSyncTask__finishSyncWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unint64_t v6 = a3;
  uint64_t v7 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 parameters];
    int v23 = 138543618;
    uint64_t v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: received response. params=%{public}@", (uint8_t *)&v23, 0x16u);
  }
  if (v6 || ([v5 error], uint64_t v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    int v11 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = *(void **)(a1 + 32);
      id v13 = [v12 messageLink];
      id v14 = (void *)v6;
      if (!v6)
      {
        id v14 = [v5 error];
      }
      int v23 = 138543874;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      id v26 = v13;
      __int16 v27 = 2114;
      __int16 v28 = v14;
      _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: failed to send sync request on %{public}@. err=%{public}@", (uint8_t *)&v23, 0x20u);
      if (!v6) {
    }
      }
  }
  uint64_t v15 = [v5 parameters];
  double v16 = [v15 objectForKey:@"_SyncTaskFinishedSyncAssets"];

  if (v16)
  {
    double v17 = [v15 objectForKey:@"_SyncTaskFinishedSyncAssets"];
    objc_msgSend(*(id *)(a1 + 32), "setStartAssetTaskWhenFinished:", objc_msgSend(v17, "BOOLValue"));
  }
  uint64_t v20 = a1 + 32;
  id v19 = *(void **)(a1 + 32);
  unint64_t v18 = *(void *)(v20 + 8);
  if (v6 | v18)
  {
    if (v18) {
      unint64_t v21 = v18;
    }
    else {
      unint64_t v21 = v6;
    }
    [v19 _finishTaskWithError:v21];
  }
  else
  {
    id v22 = [v5 error];
    [v19 _finishTaskWithError:v22];
  }
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 command];
    uint64_t v10 = [v7 parameters];
    *(_DWORD *)buf = 138543874;
    long long v37 = self;
    __int16 v38 = 2114;
    uint64_t v39 = v9;
    __int16 v40 = 2114;
    double v41 = v10;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: received request %{public}@. params=%{public}@", buf, 0x20u);
  }
  int v11 = [v7 command];
  int v12 = [v11 isEqualToString:@"Sync"];

  if (v12)
  {
    [(ATDeviceSyncSessionSyncTask *)self _processSyncRequest:v7 onMessageLink:v6];
  }
  else
  {
    id v13 = [v7 command];
    int v14 = [v13 isEqualToString:@"UpdateSyncSessionTask"];

    if (v14)
    {
      uint64_t v15 = [v7 parameters];
      double v16 = [v15 valueForKey:@"_CompletedItemCount"];
      uint64_t v17 = [v16 unsignedLongLongValue];

      unint64_t v18 = [v7 parameters];
      id v19 = [v18 valueForKey:@"_TotalItemCount"];
      uint64_t v20 = [v19 unsignedLongLongValue];

      [(ATDeviceSyncSessionSyncTask *)self _updateProgressWithCount:v17 totalItemCount:v20 forEndpointType:0];
      unint64_t v21 = [v7 responseWithError:0 parameters:0];
      [v6 sendResponse:v21 withCompletion:0];
    }
    else
    {
      id v22 = [v7 command];
      int v23 = [v22 isEqualToString:@"SyncTaskFinished"];

      if (v23)
      {
        uint64_t v24 = [v7 parameters];
        __int16 v25 = [v24 objectForKey:@"_SyncTaskFinishedResult"];

        if (v25)
        {
          id v26 = (void *)MEMORY[0x1E4F28C58];
          __int16 v27 = [v24 objectForKey:@"_SyncTaskFinishedResult"];
          __int16 v25 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", @"ATError", objc_msgSend(v27, "integerValue"), 0);
        }
        __int16 v28 = [v24 objectForKey:@"_SyncTaskFinishedSyncAssets"];

        if (v28)
        {
          uint64_t v29 = [v24 objectForKey:@"_SyncTaskFinishedSyncAssets"];
          -[ATDeviceSyncSessionSyncTask setStartAssetTaskWhenFinished:](self, "setStartAssetTaskWhenFinished:", [v29 BOOLValue]);
        }
        __int16 v30 = [MEMORY[0x1E4F1CA60] dictionary];
        if (![(ATDeviceSyncSessionSyncTask *)self startAssetTaskWhenFinished]) {
          [v30 setObject:MEMORY[0x1E4F1CC28] forKey:@"_SyncTaskFinishedSyncAssets"];
        }
        int v31 = [v7 responseWithError:0 parameters:v30];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __61__ATDeviceSyncSessionSyncTask_messageLink_didReceiveRequest___block_invoke;
        v33[3] = &unk_1E6B882B8;
        v33[4] = self;
        id v34 = v6;
        id v35 = v25;
        id v32 = v25;
        [v34 sendResponse:v31 withCompletion:v33];
      }
    }
  }
}

void __61__ATDeviceSyncSessionSyncTask_messageLink_didReceiveRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _ATLogCategoryDeviceSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to send response on %{public}@. err=%{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
  if (*(void *)(a1 + 48)) {
    id v7 = *(id *)(a1 + 48);
  }
  else {
    id v7 = v3;
  }
  [*(id *)(a1 + 32) _finishSyncWithError:v7];
}

- (void)cancel
{
  id v3 = [(ATDeviceSyncSessionTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ATDeviceSyncSessionSyncTask_cancel__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(v3, block);
}

void __37__ATDeviceSyncSessionSyncTask_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCancelled:1];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:2 userInfo:0];
  [v2 _finishSyncWithError:v3];
}

- (void)start
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginClient);
  id v4 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [WeakRetained syncDataClass];
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync Task starting for %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_taskStartTime = v6;
  id v7 = [(ATDeviceSyncSessionTask *)self messageLink];
  int v8 = [v7 endpointType];

  if (!v8)
  {
    uint64_t v9 = [(ATDeviceSyncSessionTask *)self messageLink];
    [(ATDeviceSyncSessionSyncTask *)self _sendSyncRequestOnMessageLink:v9];
  }
}

- (id)sessionGroupingKey
{
  return @"ATDeviceSyncSessionSyncTaskGroupingKey";
}

- (ATDeviceSyncSessionSyncTask)initWithDataClass:(id)a3 onMessageLink:(id)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATDeviceSyncSessionSyncTask;
  int v8 = [(ATDeviceSyncSessionTask *)&v17 initWithDataClass:v7 onMessageLink:a4];
  if (v8)
  {
    uint64_t v9 = +[ATClientController sharedInstance];
    int v10 = [v9 clientForDataclass:v7];

    if (([v10 conformsToProtocol:&unk_1F33F0650] & 1) == 0)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v8, @"ATDeviceSyncSessionSyncTask.m", 49, @"client for data class '%@' is not an ATSyncClient", v7 object file lineNumber description];
    }
    objc_storeWeak((id *)&v8->_pluginClient, v10);
    uint64_t v11 = +[ATDeviceSettings sharedInstance];
    settings = v8->_settings;
    v8->_settings = (ATDeviceSettings *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    streamReaders = v8->_streamReaders;
    v8->_streamReaders = (NSMutableArray *)v13;

    v8->_BOOL startAssetTaskWhenFinished = 1;
    v8->_isFinishing = 0;
    v8->_addedTransportUpgradeException = 0;
    v8->_syncIterationCount = 0;
    v8->_totalItemsSyncedCount = 0;
  }
  return v8;
}

@end