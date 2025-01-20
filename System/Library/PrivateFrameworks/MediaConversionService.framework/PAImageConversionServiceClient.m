@interface PAImageConversionServiceClient
- (NSXPCConnection)serviceConnection;
- (PAImageConversionServiceClient)init;
- (void)convertImageAtSourceURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)convertImageAtSourceURLCollection:(id)a3 toDestinationURLCollection:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)requestStatusWithCompletionHandler:(id)a3;
- (void)sendRequestWithOptions:(id)a3 sourceURLCollection:(id)a4 destinationURLCollection:(id)a5 jobIdentifier:(id)a6 attemptCount:(int64_t)a7 completionHandler:(id)a8;
- (void)setServiceConnection:(id)a3;
- (void)setupServiceConnection;
@end

@implementation PAImageConversionServiceClient

- (PAImageConversionServiceClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)PAImageConversionServiceClient;
  v2 = [(PAImageConversionServiceClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PAImageConversionServiceClient *)v2 setupServiceConnection];
  }
  return v3;
}

- (void)setupServiceConnection
{
  if (self->_serviceConnection)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PAImageConversionServiceClient.m" lineNumber:42 description:@"Unexpected non-nil service connection during connection setup"];
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.photos.ImageConversionService" options:0];
  [(PAImageConversionServiceClient *)self setServiceConnection:v3];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F39539C0];
  objc_super v5 = [(PAImageConversionServiceClient *)self serviceConnection];
  [v5 setRemoteObjectInterface:v4];

  id v8 = [(PAImageConversionServiceClient *)self serviceConnection];
  [v8 resume];
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)requestStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PAImageConversionServiceClient *)self serviceConnection];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __69__PAImageConversionServiceClient_requestStatusWithCompletionHandler___block_invoke;
  v11 = &unk_1E6CFE840;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:&v8];
  objc_msgSend(v7, "requestStatusWithReply:", v6, v8, v9, v10, v11, v12);
}

void __69__PAImageConversionServiceClient_requestStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v3;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image conversion status request error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendRequestWithOptions:(id)a3 sourceURLCollection:(id)a4 destinationURLCollection:(id)a5 jobIdentifier:(id)a6 attemptCount:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (void (**)(id, uint64_t, void, id))a8;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v19 = [v15 logMessageSummary];
    *(_DWORD *)buf = 138544130;
    id v59 = v17;
    __int16 v60 = 2112;
    id v61 = v19;
    __int16 v62 = 2048;
    int64_t v63 = a7;
    __int16 v64 = 1024;
    int v65 = 2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Sending image conversion request %{public}@ for %@ (attempt %ld of %d)", buf, 0x26u);
  }
  if (!v16)
  {
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"];
    goto LABEL_8;
  }
  id v57 = 0;
  char v20 = [v16 ensureFilesExistWithError:&v57];
  id v21 = v57;
  if ((v20 & 1) == 0)
  {
    v18[2](v18, 2, 0, v21);
    goto LABEL_13;
  }
  id v56 = 0;
  v22 = [v16 bookmarkDataDictionaryRepresentationWithError:&v56];
  id v23 = v56;
  if (v22)
  {
    [v14 setObject:v22 forKeyedSubscript:@"PAMediaConversionServiceDestinationBookmarkCollectionKey"];

LABEL_8:
    v24 = v14;
    id v39 = v14;
    v37 = [MEMORY[0x1E4F1C9C8] date];
    v36 = [(PAImageConversionServiceClient *)self serviceConnection];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke;
    v48[3] = &unk_1E6CFE7E0;
    id v25 = v17;
    id v49 = v25;
    int64_t v55 = a7;
    id v26 = v24;
    id v50 = v26;
    v51 = self;
    id v52 = v15;
    id v38 = v17;
    id v27 = v16;
    id v53 = v27;
    v28 = v18;
    id v29 = v16;
    v30 = v18;
    id v31 = v15;
    id v32 = v28;
    id v54 = v28;
    v33 = [v36 remoteObjectProxyWithErrorHandler:v48];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke_96;
    v40[3] = &unk_1E6CFE818;
    id v41 = v26;
    id v42 = v37;
    id v43 = v25;
    int64_t v47 = a7;
    id v34 = v32;
    id v15 = v31;
    v18 = v30;
    id v16 = v29;
    id v46 = v34;
    id v35 = v27;
    id v17 = v38;
    id v44 = v35;
    v45 = self;
    id v21 = v37;
    [v33 convertImageWithOptions:v41 reply:v40];

    id v14 = v39;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v59 = v17;
    __int16 v60 = 2114;
    id v61 = v23;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ unable to generate destination bookmark data: %{public}@", buf, 0x16u);
  }
  v18[2](v18, 2, 0, v23);

LABEL_13:
}

void __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 80);
    int v12 = 138544130;
    uint64_t v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = 2;
    __int16 v18 = 2114;
    id v19 = v3;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ (attempt %ld of %d) XPC error: %{public}@", (uint8_t *)&v12, 0x26u);
  }
  if (*(uint64_t *)(a1 + 80) > 1) {
    goto LABEL_8;
  }
  int v4 = [v3 domain];
  if (([v4 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

    goto LABEL_8;
  }
  if ([v3 code] != 4097)
  {
    BOOL v5 = [v3 code] == 4099;

    if (v5) {
      goto LABEL_11;
    }
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_9;
  }

LABEL_11:
  uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey"];

  if (v6) {
    [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:@"PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey"];
  }
  id v7 = *(id *)(a1 + 48);
  objc_sync_enter(v7);
  [*(id *)(*(void *)(a1 + 48) + 8) invalidate];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;

  [*(id *)(a1 + 48) setupServiceConnection];
  objc_sync_exit(v7);

  [*(id *)(a1 + 48) sendRequestWithOptions:*(void *)(a1 + 40) sourceURLCollection:*(void *)(a1 + 56) destinationURLCollection:*(void *)(a1 + 64) jobIdentifier:*(void *)(a1 + 32) attemptCount:*(void *)(a1 + 80) + 1 completionHandler:*(void *)(a1 + 72)];
LABEL_9:
}

void __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke_96(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"];
  int v11 = [v10 BOOLValue];

  int v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PAMediaConversionServiceOptionIsPhotosAdjustmentsCalculationKey"];
  int v13 = [v12 BOOLValue];

  if (!v8)
  {
    __int16 v14 = 0;
    goto LABEL_8;
  }
  __int16 v14 = (void *)[v8 mutableCopy];
  uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
  __int16 v16 = [MEMORY[0x1E4F1C9C8] date];
  [v16 timeIntervalSinceDate:*(void *)(a1 + 40)];
  int v17 = objc_msgSend(v15, "numberWithDouble:");
  [v14 setObject:v17 forKeyedSubscript:@"PAMediaConversionServiceConversionTotalDurationTimeIntervalClientSideKey"];

  if ((v11 ^ 1 | v13))
  {
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(a1 + 80);
        uint64_t v19 = *(void *)(a1 + 48);
        uint64_t v20 = [*(id *)(a1 + 56) fileSizeSummary];
        int v27 = 138544130;
        uint64_t v28 = v19;
        __int16 v29 = 2048;
        uint64_t v30 = v18;
        __int16 v31 = 1024;
        int v32 = 2;
        __int16 v33 = 2112;
        uint64_t v34 = (uint64_t)v20;
        _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Image conversion request %{public}@ (attempt %ld of %d) (url output) successful completion, output image sizes: %@", (uint8_t *)&v27, 0x26u);
      }
      id v21 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_11:
      v21();
      goto LABEL_12;
    }
LABEL_8:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void *)(a1 + 80);
      int v27 = 138544130;
      uint64_t v28 = v25;
      __int16 v29 = 2048;
      uint64_t v30 = v26;
      __int16 v31 = 1024;
      int v32 = 2;
      __int16 v33 = 2114;
      uint64_t v34 = (uint64_t)v9;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ (url output) (attempt %ld of %d) unsuccessful completion: %{public}@", (uint8_t *)&v27, 0x26u);
    }
    id v21 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_11;
  }
  if (!v7 || !v14) {
    goto LABEL_8;
  }
  v22 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v14];
  [v22 setObject:v7 forKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 80);
    int v27 = 138544130;
    uint64_t v28 = v23;
    __int16 v29 = 2048;
    uint64_t v30 = v24;
    __int16 v31 = 1024;
    int v32 = 2;
    __int16 v33 = 2048;
    uint64_t v34 = [v7 length];
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Image conversion request %{public}@ (attempt %ld of %d) (data output) successful completion, output image size: %lu", (uint8_t *)&v27, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

LABEL_12:
}

- (void)convertImageAtSourceURLCollection:(id)a3 toDestinationURLCollection:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v42 = a4;
  id v11 = a5;
  id v12 = a6;
  id v44 = v10;
  if ([v10 urlCount])
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_32:
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PAImageConversionServiceClient.m", 68, @"Invalid parameter not satisfying: %@", @"imageConversionOptions" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
LABEL_33:
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PAImageConversionServiceClient.m", 69, @"Invalid parameter not satisfying: %@", @"originalCompletionHandler" object file lineNumber description];

    goto LABEL_4;
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"PAImageConversionServiceClient.m", 67, @"Invalid parameter not satisfying: %@", @"sourceURLCollection.urlCount > 0" object file lineNumber description];

  if (!v11) {
    goto LABEL_32;
  }
LABEL_3:
  if (!v12) {
    goto LABEL_33;
  }
LABEL_4:
  int v13 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionApplyOrientationTransformKey"];
  if (v13)
  {
    __int16 v14 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOrientationKey"];

    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"PAImageConversionServiceClient.m", 70, @"Invalid parameter not satisfying: %@", @"!(imageConversionOptions[PAMediaConversionServiceOptionApplyOrientationTransformKey] && imageConversionOptions[PAMediaConversionServiceOptionOrientationKey])" object file lineNumber description];
    }
  }
  __int16 v16 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"];
  if (v16)
  {
    int v17 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionScaleFactorKey"];
    if (!v17)
    {
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v18 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumLongSideLengthKey"];

    if (v18)
    {
      __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PAImageConversionServiceClient.m", 71, @"Invalid parameter not satisfying: %@", @"!(imageConversionOptions[PAMediaConversionServiceOptionMaximumPixelCountKey] && imageConversionOptions[PAMediaConversionServiceOptionScaleFactorKey] && imageConversionOptions[PAMediaConversionServiceOptionMaximumLongSideLengthKey])" object file lineNumber description];
      goto LABEL_11;
    }
  }
LABEL_12:
  id v43 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"];
  if (v43)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2, self, @"PAImageConversionServiceClient.m", 75, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:NSString.class]" object file lineNumber description];
    }
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v40 = _os_activity_create(&dword_1DD979000, "mediaconversion-image", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v40, &state);
  uint64_t v19 = [v11 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
  uint64_t v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    v22 = [MEMORY[0x1E4F29128] UUID];
    id v21 = [v22 UUIDString];
  }
  uint64_t v23 = (void *)MEMORY[0x1E4F14500];
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(MEMORY[0x1E4F14500], v21);
  id v25 = v23;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_DWORD *)buf = 138543362;
    id v51 = v21;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v24, "com.apple.photos.mediaconversion.client.image", "Image conversion request %{public}@", buf, 0xCu);
  }

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __121__PAImageConversionServiceClient_convertImageAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke;
  v46[3] = &unk_1E6CFE798;
  os_signpost_id_t v48 = v24;
  id v26 = v12;
  id v47 = v26;
  int v27 = (void (**)(void, void, void, void))MEMORY[0x1E01C2040](v46);
  uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
  [v28 setObject:v21 forKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
  id v45 = 0;
  __int16 v29 = [v44 bookmarkDataDictionaryRepresentationWithError:&v45];
  id v30 = v45;
  if (v29)
  {
    [v28 setObject:v29 forKeyedSubscript:@"PAMediaConversionServiceSourceBookmarkCollectionKey"];
    __int16 v31 = [v28 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"];
    BOOL v32 = v31 == 0;

    if (v32)
    {
      __int16 v33 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
      uint64_t v34 = [v33 valueForKey:@"stringValue"];
      uint64_t v35 = [v34 componentsJoinedByString:@" "];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v35;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Caller did not provide a request reason string, using stack addresses: %@", buf, 0xCu);
      }
      [v28 setObject:v35 forKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"];
    }
    [(PAImageConversionServiceClient *)self sendRequestWithOptions:v28 sourceURLCollection:v44 destinationURLCollection:v42 jobIdentifier:v21 attemptCount:1 completionHandler:v27];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v51 = v21;
      __int16 v52 = 2114;
      id v53 = v30;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ unable to generate source bookmark data: %{public}@", buf, 0x16u);
    }
    ((void (**)(void, uint64_t, void, id))v27)[2](v27, 2, 0, v30);
  }

  os_activity_scope_leave(&state);
}

void __121__PAImageConversionServiceClient_convertImageAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MEMORY[0x1E4F14500];
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_EVENT, v9, "com.apple.photos.mediaconversion.client.image.pre-completion", (const char *)&unk_1DD99F925, buf, 2u);
  }
  id v10 = (void *)MEMORY[0x1E4F14500];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)int v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v12, "com.apple.photos.mediaconversion.client.image", (const char *)&unk_1DD99F925, v13, 2u);
  }
}

- (void)convertImageAtSourceURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v15;
  id v12 = v10;
  if (!v15)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PAImageConversionServiceClient.m", 56, @"Invalid parameter not satisfying: %@", @"sourceURL" object file lineNumber description];

    id v11 = 0;
  }
  int v13 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v11];
  [(PAImageConversionServiceClient *)self convertImageAtSourceURLCollection:v13 toDestinationURLCollection:0 options:v9 completionHandler:v12];
}

- (void)dealloc
{
  id v3 = [(PAImageConversionServiceClient *)self serviceConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)PAImageConversionServiceClient;
  [(PAImageConversionServiceClient *)&v4 dealloc];
}

@end