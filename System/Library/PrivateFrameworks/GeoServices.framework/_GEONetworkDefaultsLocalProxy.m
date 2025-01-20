@interface _GEONetworkDefaultsLocalProxy
- (BOOL)_updateWithNewConfig:(id)a3 request:(id)a4 response:(id)a5 error:(id *)a6;
- (_GEONetworkDefaultsLocalProxy)init;
- (_GEONetworkDefaultsServerProxyDelegate)delegate;
- (id)_urlRequestForNetworkDefaults;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (unint64_t)_updateReason;
- (void)_callCompletionHandlersWithError:(id)a3;
- (void)_processNetworkDefaultsResponse:(id)a3 data:(id)a4 error:(id)a5 request:(id)a6;
- (void)_updateNetworkDefaults;
- (void)setDelegate:(id)a3;
- (void)updateNetworkDefaults:(id)a3;
- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation _GEONetworkDefaultsLocalProxy

- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  block[5] = MEMORY[0x1E4F143A8];
  block[6] = 3221225472;
  block[7] = __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke;
  block[8] = &unk_1E53E46C8;
  v22 = &v23;
  block[9] = self;
  id v7 = v6;
  id v21 = v7;
  geo_isolate_sync_data();
  if (*((unsigned char *)v24 + 24)) {
    goto LABEL_25;
  }
  v8 = +[GEOFilePaths urlFor:23];
  if (v8)
  {

LABEL_9:
    if (self->_lastAttempt == 2.22507386e-308) {
      goto LABEL_13;
    }
    double Double = 20.0;
    if (a3 <= 2) {
      double Double = GEOConfigGetDouble(GeoServicesConfig_NetworkDefaultUpdateMinimumInterval, (uint64_t)off_1E9114098);
    }
    GEOGetMonotonicTime();
    double v15 = v14 - self->_lastAttempt;
    if (v15 >= Double)
    {
LABEL_13:
      v16 = GEOGetNetworkDefaultsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        if (a3 > 5) {
          v17 = @"<invalid>";
        }
        else {
          v17 = off_1E53E4738[a3];
        }
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "Updating network defaults with reason %@", buf, 0xCu);
      }

      geo_dispatch_async_qos();
    }
    else
    {
      v18 = GEOGetNetworkDefaultsLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        if (a3 > 5) {
          v19 = @"<invalid>";
        }
        else {
          v19 = off_1E53E4738[a3];
        }
        *(_DWORD *)buf = 138412802;
        v28 = v19;
        __int16 v29 = 2048;
        double v30 = v15;
        __int16 v31 = 2048;
        double v32 = Double;
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "Not updating, reason is %@ and the last update was %f seconds ago which is less than the required %f", buf, 0x20u);
      }

      [(_GEONetworkDefaultsLocalProxy *)self _callCompletionHandlersWithError:0];
    }
    goto LABEL_25;
  }
  if (self->_missingContainerRetryCount > 4) {
    goto LABEL_9;
  }
  if ((atomic_exchange(&self->_isWaiting._Value, 1u) & 1) == 0)
  {
    ++self->_missingContainerRetryCount;
    v9 = GEOGetNetworkDefaultsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int missingContainerRetryCount = self->_missingContainerRetryCount;
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = missingContainerRetryCount;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEFAULT, "Can't get network defaults file path, will try again shortly (attempt %d)", buf, 8u);
    }

    dispatch_time_t v11 = dispatch_time(0, 2000000000);
    global_queue = geo_get_global_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_99;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_after(v11, global_queue, block);
  }
LABEL_25:

  _Block_object_dispose(&v23, 8);
}

- (void)_processNetworkDefaultsResponse:(id)a3 data:(id)a4 error:(id)a5 request:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  dispatch_time_t v11 = a4;
  v12 = a5;
  id v13 = a6;
  GEOGetMonotonicTime();
  self->_lastAttempt = v14;
  if (!v11)
  {
    id v21 = [v12 domain];
    int v22 = [v21 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (v22 && [v12 code] == -1009)
    {
      v16 = GEOGetNetworkDefaultsLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      uint64_t v23 = "Could not update networkDefaults because device is offline. Will try again later.";
      goto LABEL_16;
    }
    v16 = GEOGetNetworkDefaultsLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v12;
    uint64_t v23 = "Error updating network defaults: %{public}@";
    char v26 = v16;
    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    uint32_t v28 = 12;
LABEL_21:
    _os_log_impl(&dword_188D96000, v26, v27, v23, buf, v28);
    goto LABEL_28;
  }
  if ([v10 statusCode] != 200)
  {
    uint64_t v24 = [v10 statusCode];
    uint64_t v25 = GEOGetNetworkDefaultsLog();
    v16 = v25;
    if (v24 == 304)
    {
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      uint64_t v23 = "Network defaults not modified (304).";
LABEL_16:
      char v26 = v16;
      os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
      uint32_t v28 = 2;
      goto LABEL_21;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v33) = [v10 statusCode];
    uint64_t v23 = "Received unexpected HTTP status code %u";
    char v26 = v16;
    os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    uint32_t v28 = 8;
    goto LABEL_21;
  }
  id v31 = 0;
  double v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v31];
  v16 = v31;
  if (!v15)
  {
    double v15 = GEOGetNetworkDefaultsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v16;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Failed to decode new network defaults: %{public}@", buf, 0xCu);
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v29 = GEOGetNetworkDefaultsLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v11;
      _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "Invalid network defaults payload -- not of expected type: %{public}@", buf, 0xCu);
    }

LABEL_27:
    goto LABEL_28;
  }

  id v30 = 0;
  [(_GEONetworkDefaultsLocalProxy *)self _updateWithNewConfig:v15 request:v13 response:v10 error:&v30];
  v17 = v30;
  v18 = v17;
  if (v17) {
    v19 = v17;
  }
  else {
    v19 = v12;
  }
  v20 = v19;

  v16 = v15;
  v12 = v20;
LABEL_28:

  [(_GEONetworkDefaultsLocalProxy *)self _callCompletionHandlersWithError:v12];
}

- (void)_callCompletionHandlersWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = __Block_byref_object_copy__48;
  uint64_t v23 = __Block_byref_object_dispose__48;
  id v24 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __66___GEONetworkDefaultsLocalProxy__callCompletionHandlersWithError___block_invoke;
  v16 = &unk_1E53D89C0;
  v17 = self;
  v18 = &v19;
  geo_isolate_sync_data();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = (id)v20[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v25 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_updateNetworkDefaults
{
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  __int16 v29 = __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke;
  id v30 = &unk_1E53D7C00;
  id v31 = self;
  double v32 = &v33;
  geo_isolate_sync_data();
  if (!*((unsigned char *)v34 + 24))
  {
    v3 = [(_GEONetworkDefaultsLocalProxy *)self _urlRequestForNetworkDefaults];
    id v4 = (void *)MEMORY[0x1E4F290E0];
    id v5 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    uint64_t v6 = [v4 sessionWithConfiguration:v5];

    uint64_t v7 = +[GEORequestCounter sharedCounter];
    uint64_t v8 = +[GEOApplicationAuditToken currentProcessAuditToken];
    long long v9 = [v7 requestCounterTicketForType:6 auditToken:v8 traits:0];

    uint64_t v21 = 0;
    int v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__48;
    uint64_t v25 = __Block_byref_object_dispose__48;
    id v26 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke_2;
    v15[3] = &unk_1E53E46F0;
    v20 = &v21;
    id v10 = v9;
    id v16 = v10;
    v17 = self;
    id v11 = v3;
    id v18 = v11;
    id v12 = v6;
    id v19 = v12;
    uint64_t v13 = [v12 dataTaskWithRequest:v11 completionHandler:v15];
    uint64_t v14 = (void *)v22[5];
    v22[5] = v13;

    [v10 startingRequestWithTask:v22[5]];
    [(id)v22[5] resume];
    _Block_object_dispose(&v21, 8);
  }
  _Block_object_dispose(&v33, 8);
}

- (id)_urlRequestForNetworkDefaults
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = _networkDefaultsURL();
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v2 cachePolicy:1 timeoutInterval:60.0];
  id v4 = _getValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1E9113A08, 1, 0, 0, 0);
  id v5 = _getValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1E9113A18, 1, 0, 0, 0);
  uint64_t v6 = +[GEOFilePaths urlFor:23];
  if (v5)
  {
    uint64_t v7 = [v2 absoluteString];
    int v8 = [v4 isEqualToString:v7];

    if (v8)
    {
      [v6 removeAllCachedResourceValues];
      id v18 = 0;
      int v9 = [v6 getResourceValue:&v18 forKey:*MEMORY[0x1E4F1C668] error:0];
      id v10 = v18;
      id v11 = v10;
      if (v9 && [v10 BOOLValue])
      {
        [v3 setValue:v5 forHTTPHeaderField:@"If-None-Match"];
        id v12 = GEOGetNetworkDefaultsLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v20 = v5;
          uint64_t v13 = "Using ETag for request: %{private}@";
          uint64_t v14 = v12;
          os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
          uint32_t v16 = 12;
LABEL_9:
          _os_log_impl(&dword_188D96000, v14, v15, v13, buf, v16);
        }
      }
      else
      {
        id v12 = GEOGetNetworkDefaultsLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v13 = "Cached file is missing/unreadable on-disk. Ignoring stored ETag.";
          uint64_t v14 = v12;
          os_log_type_t v15 = OS_LOG_TYPE_ERROR;
          uint32_t v16 = 2;
          goto LABEL_9;
        }
      }
    }
  }

  [v3 setValue:0 forHTTPHeaderField:@"Accept-Language"];

  return v3;
}

- (BOOL)_updateWithNewConfig:(id)a3 request:(id)a4 response:(id)a5 error:(id *)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    uint64_t v13 = readNetworkDefaultsFromFile((uint64_t *)a6);
    if (v13 && ([v10 isEqualToDictionary:v13] & 1) != 0)
    {
      uint64_t v14 = GEOGetNetworkDefaultsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Updated network defaults are identical to old network defaults.", (uint8_t *)&buf, 2u);
      }

      os_log_type_t v15 = +[GEOFilePaths urlFor:23];
      uint32_t v16 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v17 = *MEMORY[0x1E4F1C530];
      v64[0] = 0;
      char v18 = [v15 setResourceValue:v16 forKey:v17 error:v64];
      id v19 = v64[0];

      if ((v18 & 1) == 0)
      {
        v20 = GEOGetNetworkDefaultsLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v19;
          _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Failed to update modification time of network defaults: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v21 = _getValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1E9113A08, 1, 0, 0, 0);
      int v22 = [v11 URL];
      uint64_t v23 = [v22 absoluteString];
      char v24 = [v21 isEqualToString:v23];

      if ((v24 & 1) == 0)
      {
        uint64_t v25 = [v11 URL];
        id v26 = [v25 absoluteString];
        _setValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1E9113A08, v26, 1, 0);
      }
      uint64_t v27 = [v12 allHeaderFields];
      uint64_t v28 = [v27 objectForKeyedSubscript:@"ETag"];

      if (v28 && !_GEOConfigHasValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1E9113A18)) {
        _setValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1E9113A18, v28, 1, 0);
      }

      BOOL v29 = 1;
      goto LABEL_39;
    }
    id v30 = GEOGetNetworkDefaultsLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_INFO, "Received new network defaults. Informing interested clients.", (uint8_t *)&buf, 2u);
    }

    id v31 = v10;
    double v32 = +[GEOFilePaths urlFor:23];
    if (!v32)
    {
      if (a6)
      {
        *a6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Could not get GEONetworkDefaultsFile"];
      }
      else
      {
        v55 = GEOGetNetworkDefaultsLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v66 = 0;
          _os_log_impl(&dword_188D96000, v55, OS_LOG_TYPE_ERROR, "Missing the error argument. Could not get GEONetworkDefaultsFile.", v66, 2u);
        }
      }
      BOOL v29 = 0;
      goto LABEL_39;
    }
    uint64_t v33 = v32;
    v62 = v12;
    v63 = v11;
    uint64_t v34 = [v32 URLByDeletingLastPathComponent];
    uint64_t v35 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v35 createDirectoryAtURL:v34 withIntermediateDirectories:1 attributes:0 error:a6] & 1) == 0)
    {
      v53 = GEOGetNetworkDefaultsLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        id v54 = *a6;
        *(_DWORD *)v66 = 138543362;
        id v67 = v54;
        _os_log_impl(&dword_188D96000, v53, OS_LOG_TYPE_ERROR, "Failed to create parent directory for network defaults: %{public}@", v66, 0xCu);
      }

      goto LABEL_38;
    }
    v61 = self;
    uint64_t v36 = *MEMORY[0x1E4F28378];
    v37 = (void *)*MEMORY[0x1E4F28330];
    v64[0] = *(id *)MEMORY[0x1E4F28370];
    v64[1] = v37;
    *(void *)&long long buf = v36;
    *((void *)&buf + 1) = &unk_1ED73DDC8;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v64 count:2];
    v39 = [v33 absoluteURL];
    v40 = [v39 path];
    [v35 createFileAtPath:v40 contents:0 attributes:v38];

    v41 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v31 format:200 options:0 error:a6];
    v42 = v41;
    if (v41)
    {
      if ([v41 writeToURL:v33 options:268435457 error:a6])
      {

        id v11 = v63;
        v43 = [v63 URL];
        v44 = [v43 absoluteString];
        BOOL v29 = 1;
        _setValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1E9113A08, v44, 1, 0);

        id v12 = v62;
        v45 = [v62 allHeaderFields];
        v46 = [v45 objectForKeyedSubscript:@"ETag"];
        _setValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1E9113A18, v46, 1, 0);

        id WeakRetained = objc_loadWeakRetained((id *)&v61->_delegate);
        [WeakRetained serverProxy:v61 networkDefaultsDidChange:v31];

        notify_post("com.apple.GeoServices.internal.networkDefaultsChanged");
        v48 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        v49 = [(id)GEODefaultsDomain() lastPathComponent];
        v50 = [v13 objectForKeyedSubscript:v49];
        [v48 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F284E0]];

        v51 = [v31 objectForKeyedSubscript:v49];
        [v48 setObject:v51 forKeyedSubscript:*MEMORY[0x1E4F284C8]];

        v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v52 postNotificationName:@"GEONetworkDefaultsDidChangeInternalNotification" object:v61 userInfo:v48];

LABEL_39:
        goto LABEL_40;
      }
      v56 = GEOGetNetworkDefaultsLog();
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        goto LABEL_37;
      }
      id v59 = *a6;
      *(_DWORD *)v66 = 138543362;
      id v67 = v59;
      v58 = "Failed to write new network defaults to disk: %{public}@";
    }
    else
    {
      v56 = GEOGetNetworkDefaultsLog();
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
LABEL_37:

LABEL_38:
        BOOL v29 = 0;
        id v12 = v62;
        id v11 = v63;
        goto LABEL_39;
      }
      id v57 = *a6;
      *(_DWORD *)v66 = 138543362;
      id v67 = v57;
      v58 = "Unable to serialize new network defaults data: %{public}@";
    }
    _os_log_impl(&dword_188D96000, v56, OS_LOG_TYPE_ERROR, v58, v66, 0xCu);
    goto LABEL_37;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(buf) = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: newConfig != ((void *)0)", (uint8_t *)&buf, 2u);
  }
  BOOL v29 = 0;
LABEL_40:

  return v29;
}

- (unint64_t)_updateReason
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = _networkDefaultsURL();
  v3 = [v2 absoluteString];

  id v4 = _getValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1E9113A08, 1, 0, 0, 0);
  if ([v3 isEqualToString:v4])
  {
    id v5 = +[GEOFilePaths urlFor:23];
    id v17 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1C530];
    id v16 = 0;
    char v7 = [v5 getResourceValue:&v17 forKey:v6 error:&v16];
    id v8 = v17;
    id v9 = v16;

    if (v7)
    {
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:v8];
      BOOL v12 = v11 > 79200.0;

      unint64_t v13 = 2 * v12;
    }
    else
    {
      uint64_t v14 = GEOGetNetworkDefaultsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v19 = v9;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Could get date of network defaults file: %@", buf, 0xCu);
      }

      unint64_t v13 = 5;
    }
  }
  else
  {
    unint64_t v13 = 3;
  }

  return v13;
}

- (_GEONetworkDefaultsLocalProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_GEONetworkDefaultsLocalProxy;
  v2 = [(_GEONetworkDefaultsLocalProxy *)&v8 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v2->_int missingContainerRetryCount = 0;
    v2->_lastAttempt = 2.22507386e-308;
    char v7 = v2;
    geo_dispatch_async_qos();
    id v5 = dispatch_get_global_queue(21, 0);
    GEORegisterPListStateCaptureLegacy();
  }
  return v2;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4 = GEOGetNetworkDefaultsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Updating network defaults due to config key change", v5, 2u);
  }

  [(_GEONetworkDefaultsLocalProxy *)self _updateNetworkDefaults];
}

- (void)updateNetworkDefaults:(id)a3
{
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v3 = v6;
  geo_isolate_sync();
  id v4 = (void *)[v3 copy];

  return v4;
}

- (_GEONetworkDefaultsServerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_GEONetworkDefaultsServerProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_isolation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end