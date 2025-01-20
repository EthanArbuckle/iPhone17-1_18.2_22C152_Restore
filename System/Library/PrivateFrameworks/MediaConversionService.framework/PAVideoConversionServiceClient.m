@interface PAVideoConversionServiceClient
- (BOOL)canMarkPendingRequestAsOptionalForProgress:(id)a3;
- (NSMutableDictionary)pendingRequestIdentifierToProgressMap;
- (NSXPCConnection)serviceConnection;
- (OS_dispatch_queue)isolationQueue;
- (PAVideoConversionServiceClient)init;
- (id)convertVideoAtSourceURL:(id)a3 toDestinationURL:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (id)convertVideoAtSourceURLCollection:(id)a3 toDestinationURLCollection:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (unint64_t)state;
- (void)extractStillImageFromVideoAtSourceURL:(id)a3 toDestinationURL:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)handleRequestCompletionForIdentifier:(id)a3;
- (void)invalidateAfterPendingRequestCompletion;
- (void)markPendingRequestAsOptionalForProgress:(id)a3;
- (void)modifyRequestWithIdentifier:(id)a3 modifications:(id)a4;
- (void)requestStatusWithCompletionHandler:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setPendingRequestIdentifierToProgressMap:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setupServiceConnection;
- (void)transitionToInvalidatedState;
- (void)updateProgress:(id)a3;
- (void)ut_invalidateServiceConnection;
@end

@implementation PAVideoConversionServiceClient

- (void)setupServiceConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.photos.VideoConversionService" options:0];
  [(PAVideoConversionServiceClient *)self setServiceConnection:v3];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3953960];
  v5 = [(PAVideoConversionServiceClient *)self serviceConnection];
  [v5 setRemoteObjectInterface:v4];

  v6 = [(PAVideoConversionServiceClient *)self serviceConnection];
  [v6 setExportedObject:self];

  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F394D670];
  v8 = [(PAVideoConversionServiceClient *)self serviceConnection];
  [v8 setExportedInterface:v7];

  id v9 = [(PAVideoConversionServiceClient *)self serviceConnection];
  [v9 resume];
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (PAVideoConversionServiceClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)PAVideoConversionServiceClient;
  v2 = [(PAVideoConversionServiceClient *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PAVideoConversionServiceClient *)v2 setPendingRequestIdentifierToProgressMap:v3];

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photos.mediaconversion.client.isolation", v4);
    [(PAVideoConversionServiceClient *)v2 setIsolationQueue:v5];

    [(PAVideoConversionServiceClient *)v2 setupServiceConnection];
    [(PAVideoConversionServiceClient *)v2 setState:1];
  }
  return v2;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequestIdentifierToProgressMap, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingRequestIdentifierToProgressMap:(id)a3
{
}

- (NSMutableDictionary)pendingRequestIdentifierToProgressMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceConnection:(id)a3
{
}

- (void)requestStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(PAVideoConversionServiceClient *)self serviceConnection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __69__PAVideoConversionServiceClient_requestStatusWithCompletionHandler___block_invoke;
  v11 = &unk_1E6CFE840;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  objc_super v7 = [v5 remoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v7, "requestStatusWithReply:", v6, v8, v9, v10, v11, v12);
}

void __69__PAVideoConversionServiceClient_requestStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v3;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video conversion status request error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidateAfterPendingRequestCompletion
{
  id v3 = [(PAVideoConversionServiceClient *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PAVideoConversionServiceClient_invalidateAfterPendingRequestCompletion__block_invoke;
  block[3] = &unk_1E6CFEE00;
  block[4] = self;
  dispatch_async(v3, block);
}

void __73__PAVideoConversionServiceClient_invalidateAfterPendingRequestCompletion__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 1)
  {
    v2 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
    uint64_t v3 = [v2 count];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v4 = *(void **)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2048;
      uint64_t v10 = v3;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Invalidating client %{public}@ with pending request count %tu", (uint8_t *)&v7, 0x16u);
    }
    id v5 = *(void **)(a1 + 32);
    if (v3) {
      [v5 setState:2];
    }
    else {
      [v5 transitionToInvalidatedState];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = [v6 state];
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring invalidation request for client %{public}@ in non-running state %tu", (uint8_t *)&v7, 0x16u);
  }
}

- (void)updateProgress:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"PAMediaConversionServiceProgressKey"];

  if (v6 && v5)
  {
    [v6 doubleValue];
    uint64_t v8 = v7;
    __int16 v9 = [(PAVideoConversionServiceClient *)self isolationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PAVideoConversionServiceClient_updateProgress___block_invoke;
    block[3] = &unk_1E6CFEAC8;
    block[4] = self;
    id v11 = v5;
    uint64_t v12 = v8;
    dispatch_async(v9, block);
  }
}

void __49__PAVideoConversionServiceClient_updateProgress___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 willChangeValueForKey:@"fractionCompleted"];
    [v3 setCompletedUnitCount:(uint64_t)(*(double *)(a1 + 48) * 100.0)];
    [v3 didChangeValueForKey:@"fractionCompleted"];
  }
}

- (void)transitionToInvalidatedState
{
  id v3 = [(PAVideoConversionServiceClient *)self isolationQueue];
  dispatch_assert_queue_V2(v3);

  [(PAVideoConversionServiceClient *)self setState:3];
  id v4 = [(PAVideoConversionServiceClient *)self serviceConnection];
  [v4 invalidate];
}

- (void)handleRequestCompletionForIdentifier:(id)a3
{
  id v8 = a3;
  id v5 = [(PAVideoConversionServiceClient *)self isolationQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(PAVideoConversionServiceClient *)self state];
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PAVideoConversionServiceClient.m", 339, @"Unexpected client state %tu", v6);

    [(NSMutableDictionary *)self->_pendingRequestIdentifierToProgressMap removeObjectForKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)self->_pendingRequestIdentifierToProgressMap removeObjectForKey:v8];
    if (v6 == 2 && ![(NSMutableDictionary *)self->_pendingRequestIdentifierToProgressMap count]) {
      [(PAVideoConversionServiceClient *)self transitionToInvalidatedState];
    }
  }
}

- (void)extractStillImageFromVideoAtSourceURL:(id)a3 toDestinationURL:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v49 = a4;
  id v11 = a5;
  id v12 = a6;
  v51 = v10;
  if (!v10)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PAVideoConversionServiceClient.m", 251, @"Invalid parameter not satisfying: %@", @"sourceURL" object file lineNumber description];
  }
  v50 = v11;
  if (v11)
  {
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PAVideoConversionServiceClient.m", 252, @"Invalid parameter not satisfying: %@", @"inputOptions" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
  }
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"PAVideoConversionServiceClient.m", 253, @"Invalid parameter not satisfying: %@", @"originalCompletionHandler" object file lineNumber description];

LABEL_5:
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v47 = _os_activity_create(&dword_1DD979000, "mediaconversion-video-still", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v47, &state);
  id v13 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v16 = [MEMORY[0x1E4F29128] UUID];
    id v15 = [v16 UUIDString];
  }
  v17 = buf;
  v18 = MEMORY[0x1E4F14500];
  id v19 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = [v51 path];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video still extraction request %{public}@ for %@", buf, 0x16u);
  }
  v21 = (void *)MEMORY[0x1E4F14500];
  os_signpost_id_t v22 = os_signpost_id_make_with_pointer(MEMORY[0x1E4F14500], v15);
  id v23 = v21;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v22, "com.apple.photos.mediaconversion.client.video-still", "Video still extraction request %{public}@", buf, 0xCu);
  }

  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke;
  v64[3] = &unk_1E6CFE798;
  os_signpost_id_t v66 = v22;
  id v46 = v12;
  id v65 = v46;
  v24 = (void (**)(void, void, void, void))MEMORY[0x1E01C2040](v64);
  v25 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v51];
  id v63 = 0;
  v26 = [v25 bookmarkDataDictionaryRepresentationWithError:&v63];
  id v27 = v63;
  if (v26)
  {
    if (v49)
    {
      v28 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:");
      id v62 = 0;
      char v29 = [v28 ensureFilesExistWithError:&v62];
      id v30 = v62;
      if (v29)
      {
        id v61 = v27;
        uint64_t v45 = [v28 bookmarkDataDictionaryRepresentationWithError:&v61];
        id v31 = v61;

        id v27 = v31;
        if (v45)
        {

LABEL_22:
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          char v69 = 0;
          v32 = [(PAVideoConversionServiceClient *)self isolationQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_102;
          block[3] = &unk_1E6CFE4A0;
          block[4] = self;
          id v33 = v15;
          id v59 = v33;
          v60 = buf;
          dispatch_sync(v32, block);

          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            v34 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v50];
            v35 = [v50 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
            v36 = v35;
            if (!v35)
            {
              v17 = [MEMORY[0x1E4F29128] UUID];
              v36 = [v17 UUIDString];
            }
            [v34 setObject:v36 forKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
            if (!v35)
            {
            }
            v37 = [(id)*MEMORY[0x1E4F44410] identifier];
            [v34 setObject:v37 forKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"];

            v38 = [(PAVideoConversionServiceClient *)self serviceConnection];
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_103;
            v55[3] = &unk_1E6CFE400;
            v55[4] = self;
            id v39 = v33;
            id v56 = v39;
            v40 = v24;
            id v57 = v40;
            v41 = [v38 remoteObjectProxyWithErrorHandler:v55];
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_104;
            v52[3] = &unk_1E6CFECC0;
            v52[4] = self;
            id v53 = v39;
            v54 = v40;
            [v41 extractStillImageFromVideoAtSourceBookmarkDictionary:v26 toDestinationBookmarkDictionary:v45 options:v34 replyHandler:v52];
          }
          else
          {
            v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:10 userInfo:0];
            ((void (**)(void, uint64_t, void, void *))v24)[2](v24, 2, 0, v34);
          }

          _Block_object_dispose(buf, 8);
          v28 = (void *)v45;
          goto LABEL_35;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v31;
          _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ unable to generate destination bookmark data: %{public}@", buf, 0x16u);
        }
        ((void (**)(void, uint64_t, void, id))v24)[2](v24, 2, 0, v31);
      }
      else
      {
        ((void (**)(void, uint64_t, void, id))v24)[2](v24, 2, 0, v30);
      }

LABEL_35:
      goto LABEL_36;
    }
    uint64_t v45 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v27;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ unable to generate source bookmark data: %{public}@", buf, 0x16u);
  }
  ((void (**)(void, uint64_t, void, id))v24)[2](v24, 2, 0, v27);
LABEL_36:

  os_activity_scope_leave(&state);
}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MEMORY[0x1E4F14500];
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_EVENT, v9, "com.apple.photos.mediaconversion.client.video-still.pre-completion", (const char *)&unk_1DD99F925, buf, 2u);
  }
  id v10 = (void *)MEMORY[0x1E4F14500];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v12, "com.apple.photos.mediaconversion.client.video-still", (const char *)&unk_1DD99F925, v13, 2u);
  }
}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_102(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 1)
  {
    v2 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    id v3 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
    [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
      int v9 = 138543618;
      uint64_t v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = [v5 count];
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ added to request map (pending request count now %ld)", (uint8_t *)&v9, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = a1 + 32;
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(v8 + 8);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = (uint64_t)v6;
    __int16 v13 = 2048;
    uint64_t v14 = [v6 state];
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Rejecting video conversion request %{public}@ on client %{public}@ in non-running state %tu", (uint8_t *)&v9, 0x20u);
  }
}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) isolationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6CFEA78;
  id v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  dispatch_async(v4, v8);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ XPC error: %{public}@", buf, 0x16u);
  }
  (*(void (**)(void, uint64_t, void, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 2, 0, v3, v6);
}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_104(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void *)a1[4];
  id v9 = a3;
  uint64_t v10 = [v8 isolationQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2_105;
  v17[3] = &unk_1E6CFEA78;
  uint64_t v11 = (void *)a1[5];
  v17[4] = a1[4];
  id v18 = v11;
  dispatch_async(v10, v17);

  if (a2 == 1)
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
    id v14 = v9;
    if (v12)
    {
      uint64_t v15 = a1[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v15;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video still extraction request %{public}@ successful completion", buf, 0xCu);
      id v14 = v9;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = a1[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = a2;
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ unsuccessful completion, status = %ld, error = %{public}@", buf, 0x20u);
    }
    id v14 = 0;
  }
  (*(void (**)(void, uint64_t, id, id, uint64_t))(a1[6] + 16))(a1[6], a2, v14, v7, v13);
}

uint64_t __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2_105(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRequestCompletionForIdentifier:*(void *)(a1 + 40)];
}

uint64_t __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRequestCompletionForIdentifier:*(void *)(a1 + 40)];
}

- (void)modifyRequestWithIdentifier:(id)a3 modifications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PAVideoConversionServiceClient *)self isolationQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(PAVideoConversionServiceClient *)self serviceConnection];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __76__PAVideoConversionServiceClient_modifyRequestWithIdentifier_modifications___block_invoke;
  uint64_t v15 = &unk_1E6CFE478;
  id v16 = v6;
  v17 = self;
  id v10 = v6;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:&v12];

  objc_msgSend(v11, "modifyJobWithIdentifier:modifications:", v10, v7, v12, v13, v14, v15);
}

void __76__PAVideoConversionServiceClient_modifyRequestWithIdentifier_modifications___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    uint64_t v7 = v3;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "XPC error during modification of request %{public}@ on client %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)markPendingRequestAsOptionalForProgress:(id)a3
{
  id v5 = a3;
  __int16 v6 = [v5 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];

  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PAVideoConversionServiceClient.m" lineNumber:214 description:@"Unexpected nil request identifier"];
  }
  uint64_t v8 = [(PAVideoConversionServiceClient *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PAVideoConversionServiceClient_markPendingRequestAsOptionalForProgress___block_invoke;
  block[3] = &unk_1E6CFE450;
  block[4] = self;
  id v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __74__PAVideoConversionServiceClient_markPendingRequestAsOptionalForProgress___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 1)
  {
    uint64_t v2 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
    uint64_t v3 = [v2 allValues];
    char v4 = [v3 containsObject:*(void *)(a1 + 48)];

    if (v4)
    {
      uint64_t v11 = @"PAMediaConversionServiceOptionJobPriorityKey";
      uint64_t v12 = &unk_1F394BE08;
      id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      [*(id *)(a1 + 32) modifyRequestWithIdentifier:*(void *)(a1 + 40) modifications:v5];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v10;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Ignoring modification for request %{public}@ on client %{public}@ that is not or no longer in pending request map", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = a1 + 32;
    __int16 v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(v8 + 8);
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = [v6 state];
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Rejecting modification for request %{public}@ on client %{public}@ in non-running state %tu", buf, 0x20u);
  }
}

- (BOOL)canMarkPendingRequestAsOptionalForProgress:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  char v4 = [v3 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];

  return v4 != 0;
}

- (id)convertVideoAtSourceURLCollection:(id)a3 toDestinationURLCollection:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v57 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"PAVideoConversionServiceClient.m", 82, @"Invalid parameter not satisfying: %@", @"inputOptions" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v50 = [MEMORY[0x1E4F28B00] currentHandler];
  [v50 handleFailureInMethod:a2, self, @"PAVideoConversionServiceClient.m", 83, @"Invalid parameter not satisfying: %@", @"originalCompletionHandler" object file lineNumber description];

LABEL_3:
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v55 = _os_activity_create(&dword_1DD979000, "mediaconversion-video", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v55, &state);
  __int16 v15 = [v12 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
    id v17 = [v18 UUIDString];
  }
  uint64_t v19 = MEMORY[0x1E4F14500];
  id v20 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = [v11 logMessageSummary];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ for %@", buf, 0x16u);
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F14500];
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(MEMORY[0x1E4F14500], v17);
  id v24 = v22;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v17;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v23, "com.apple.photos.mediaconversion.client.video", "Video conversion request %{public}@", buf, 0xCu);
  }

  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke;
  v79[3] = &unk_1E6CFE798;
  os_signpost_id_t v81 = v23;
  id v54 = v14;
  id v80 = v54;
  uint64_t v25 = (void (**)(void, void, void, void))MEMORY[0x1E01C2040](v79);
  id v59 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
  id v78 = 0;
  uint64_t v26 = [v11 bookmarkDataDictionaryRepresentationWithError:&v78];
  id v58 = v78;
  id v56 = (void *)v26;
  if (v26)
  {
    if (v57)
    {
      id v77 = 0;
      char v27 = [v57 ensureFilesExistWithError:&v77];
      id v28 = v77;
      if ((v27 & 1) == 0)
      {
        ((void (**)(void, uint64_t, void, id))v25)[2](v25, 2, 0, v28);
        id v30 = 0;
LABEL_38:

        id v31 = v56;
        goto LABEL_39;
      }
      id v76 = v58;
      uint64_t v53 = [v57 bookmarkDataDictionaryRepresentationWithError:&v76];
      id v29 = v76;

      id v58 = v29;
      if (!v53)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v29;
          _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ unable to generate destination bookmark data: %{public}@", buf, 0x16u);
        }
        ((void (**)(void, uint64_t, void, id))v25)[2](v25, 2, 0, v29);
        id v30 = 0;
        goto LABEL_38;
      }
    }
    else
    {
      [v59 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"];
      uint64_t v53 = 0;
    }
    v32 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    [v32 setUserInfoObject:v17 forKey:@"PAMediaConversionServiceJobIdentifierKey"];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_86;
    v72[3] = &unk_1E6CFEAA0;
    id v33 = v17;
    id v73 = v33;
    v74 = self;
    id v34 = v25;
    id v75 = v34;
    [v32 setCancellationHandler:v72];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v86 = 0;
    v35 = [(PAVideoConversionServiceClient *)self isolationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_90;
    block[3] = &unk_1E6CFE3D8;
    block[4] = self;
    id v36 = v33;
    id v69 = v36;
    id v52 = v32;
    id v70 = v52;
    v71 = buf;
    dispatch_sync(v35, block);

    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      [v59 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PAMediaConversionServiceOptionWantsProgressKey"];
      [v59 setObject:v36 forKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
      v37 = [(PAVideoConversionServiceClient *)self serviceConnection];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_92;
      v64[3] = &unk_1E6CFE400;
      id v38 = v36;
      id v65 = v38;
      os_signpost_id_t v66 = self;
      id v39 = v34;
      id v67 = v39;
      v51 = [v37 remoteObjectProxyWithErrorHandler:v64];

      v40 = [MEMORY[0x1E4F1C9C8] date];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_95;
      v60[3] = &unk_1E6CFE428;
      v60[4] = self;
      id v41 = v38;
      id v61 = v41;
      id v42 = v40;
      id v62 = v42;
      id v63 = v39;
      v43 = (void *)MEMORY[0x1E01C2040](v60);
      v44 = [v59 objectForKeyedSubscript:@"PAMediaConversionServiceOptionTargetFileSizeKey"];

      uint64_t v45 = [v59 objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsGIFExportConversionKey"];
      int v46 = [v45 BOOLValue];

      if (v44)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v83 = 138543362;
          id v84 = v41;
          _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ sending single pass export request", v83, 0xCu);
        }
        [v51 singlePassConvertVideoAtSourceBookmarkDictionary:v56 toDestinationBookmarkDictionary:v53 options:v59 replyHandler:v43];
      }
      else if (v46)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v83 = 138543362;
          id v84 = v41;
          _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ sending GIF export request", v83, 0xCu);
        }
        [v51 generateGIFForVideoAtSourceBookmarkDictionary:v56 toDestinationBookmarkDictionary:v53 options:v59 replyHandler:v43];
      }
      else
      {
        [v51 convertVideoAtSourceBookmarkDictionary:v56 toDestinationBookmarkDictionary:v53 options:v59 replyHandler:v43];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v83 = 138543362;
          id v84 = v41;
          _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ sending export request", v83, 0xCu);
        }
      }
      id v30 = v52;

      v47 = v65;
    }
    else
    {
      v47 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:10 userInfo:0];
      (*((void (**)(id, uint64_t, void, void *))v34 + 2))(v34, 2, 0, v47);
      id v30 = 0;
    }

    _Block_object_dispose(buf, 8);
    id v28 = (id)v53;
    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v58;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ unable to generate source bookmark data: %{public}@", buf, 0x16u);
  }
  ((void (**)(void, uint64_t, void, id))v25)[2](v25, 2, 0, v58);
  id v30 = 0;
  id v31 = 0;
LABEL_39:

  os_activity_scope_leave(&state);
  return v30;
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MEMORY[0x1E4F14500];
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_EVENT, v9, "com.apple.photos.mediaconversion.client.video.pre-completion", (const char *)&unk_1DD99F925, buf, 2u);
  }
  id v10 = (void *)MEMORY[0x1E4F14500];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v12, "com.apple.photos.mediaconversion.client.video", (const char *)&unk_1DD99F925, v13, 2u);
  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_86(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = a1[4];
    *(_DWORD *)buf = 138543362;
    id v12 = v2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Video conversion request %{public}@ requesting cancellation", buf, 0xCu);
  }
  uint64_t v3 = [a1[5] serviceConnection];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_87;
  id v8 = &unk_1E6CFE840;
  id v9 = a1[4];
  id v10 = a1[6];
  char v4 = [v3 remoteObjectProxyWithErrorHandler:&v5];
  objc_msgSend(v4, "cancelJobWithIdentifier:", a1[4], v5, v6, v7, v8);
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_90(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 1)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
    [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
      int v9 = 138543618;
      uint64_t v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = [v5 count];
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ added to request map (pending request count now %ld)", (uint8_t *)&v9, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = a1 + 32;
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(v8 + 8);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = (uint64_t)v6;
    __int16 v13 = 2048;
    uint64_t v14 = [v6 state];
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Rejecting video conversion request %{public}@ on client %{public}@ in non-running state %tu", (uint8_t *)&v9, 0x20u);
  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ XPC error: %{public}@", buf, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 40) isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_93;
  block[3] = &unk_1E6CFEA78;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  dispatch_async(v4, block);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_95(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  int8x16_t v9 = [*(id *)(a1 + 32) isolationQueue];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_2;
  id v20 = &unk_1E6CFEB18;
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = v10;
  uint64_t v24 = a2;
  id v11 = v8;
  id v23 = v11;
  dispatch_async(v9, &v17);

  if (v7)
  {
    __int16 v12 = objc_msgSend(v7, "mutableCopy", v17, v18, v19, v20, v21, v22);
    id v13 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 48)];
    uint64_t v15 = objc_msgSend(v13, "numberWithDouble:");
    [v12 setObject:v15 forKeyedSubscript:@"PAMediaConversionServiceConversionTotalDurationTimeIntervalClientSideKey"];
  }
  else
  {
    __int16 v12 = 0;
  }
  if (a2 == 1) {
    id v16 = v12;
  }
  else {
    id v16 = 0;
  }
  (*(void (**)(void, uint64_t, void *, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a2, v16, v11);
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) handleRequestCompletionForIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
  uint64_t v3 = [v2 count];

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v3;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ removed from request map after successful completion (pending request count now %tu)", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 138544130;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ removed from request map after unsuccessful completion (pending request count now %tu) - status = %zd, error = %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_93(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) handleRequestCompletionForIdentifier:*(void *)(a1 + 40)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 32) pendingRequestIdentifierToProgressMap];
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2048;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ removed from request map after error (pending request count now %tu)", (uint8_t *)&v4, 0x16u);
  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543618;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ Unable to send cancellation request: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)convertVideoAtSourceURL:(id)a3 toDestinationURL:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PAVideoConversionServiceClient.m", 66, @"Invalid parameter not satisfying: %@", @"sourceURL" object file lineNumber description];
  }
  uint64_t v15 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v11];
  if (v12)
  {
    uint64_t v16 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v12];
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [(PAVideoConversionServiceClient *)self convertVideoAtSourceURLCollection:v15 toDestinationURLCollection:v16 options:v13 completionHandler:v14];

  return v17;
}

- (void)ut_invalidateServiceConnection
{
  id v2 = [(PAVideoConversionServiceClient *)self serviceConnection];
  [v2 invalidate];
}

@end