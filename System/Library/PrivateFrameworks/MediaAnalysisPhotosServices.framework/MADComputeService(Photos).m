@interface MADComputeService(Photos)
- (id)performRequests:()Photos assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:;
- (id)scheduleRequests:()Photos assets:photoLibrary:options:error:;
@end

@implementation MADComputeService(Photos)

- (id)performRequests:()Photos assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v59 = a3;
  id v14 = a4;
  id v54 = a5;
  id v57 = a7;
  id v56 = a8;
  v58 = a9;
  v15 = NSString;
  v16 = NSNumber;
  v17 = [MEMORY[0x263EFF910] now];
  v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
  v19 = [v18 stringValue];
  uint64_t v20 = [v15 stringWithFormat:@"OnDemand-%@", v19];

  v61 = (void *)v20;
  uint64_t v21 = [NSString stringWithFormat:@"Request: %@ %@ with assets %@", v20, v59, v14];
  v60 = a1;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v88 = @"[MADComputeService+Photos]";
    __int16 v89 = 2112;
    uint64_t v90 = v21;
    _os_log_impl(&dword_255950000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }
  v55 = (void *)v21;
  v22 = [MEMORY[0x263EFF9A0] dictionary];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v23 = v14;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v77;
    v26 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v77 != v25) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v29 = [v28 localIdentifier];
        BOOL v30 = v29 == 0;

        if (v30)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v88 = @"[MADComputeService+Photos]";
            __int16 v89 = 2112;
            uint64_t v90 = (uint64_t)v28;
            _os_log_error_impl(&dword_255950000, v26, OS_LOG_TYPE_ERROR, "%@ Asset (%@) without localIdentifier; skip",
              buf,
              0x16u);
          }
        }
        else
        {
          v31 = [v28 localIdentifier];
          [v22 setObject:v28 forKeyedSubscript:v31];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v24);
  }

  id v74 = 0;
  id v75 = 0;
  v32 = [a1 extensionDataForResultDirectoryURL:&v75 error:&v74];
  id v33 = v75;
  id v34 = v74;
  if (!v33)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:]();
    }
    v36 = (void *)[v34 copy];
    v58[2](v58, v61, v36);
    goto LABEL_26;
  }
  uint64_t v35 = [a1 registerProgressHandler:v57 requestID:v61];
  if (v35)
  {
    v36 = [NSString stringWithFormat:@"%@ Failed to register progressHandler (%d)", @"[MADComputeService+Photos]", v35];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:]();
    }
    [a1 deregisterProgressHandlerForRequestID:v61];
    [a1 deregisterResultsHandlerForRequestID:v61];
    uint64_t v84 = *MEMORY[0x263F08320];
    v85 = v36;
    v37 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    v38 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)v35 userInfo:v37];
    v58[2](v58, 0, v38);

LABEL_26:
    id v42 = 0;
    goto LABEL_27;
  }
  uint64_t v39 = [a1 registerResultsHandler:v56 requestID:v61];
  if (v39)
  {
    v36 = [NSString stringWithFormat:@"%@ Failed to register resultsHandler (%d)", @"[MADComputeService+Photos]", v39];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:]();
    }
    [a1 deregisterProgressHandlerForRequestID:v61];
    [a1 deregisterResultsHandlerForRequestID:v61];
    uint64_t v82 = *MEMORY[0x263F08320];
    v83 = v36;
    v40 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v41 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:(int)v39 userInfo:v40];
    v58[2](v58, 0, v41);

    goto LABEL_26;
  }
  v44 = [a1 connection];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke;
  v69[3] = &unk_2653E87F0;
  v70 = @"[MADComputeService+Photos]";
  v71 = a1;
  id v42 = v61;
  id v72 = v42;
  v45 = v58;
  v73 = v45;
  v62 = [v44 remoteObjectProxyWithErrorHandler:v69];

  if (v62)
  {
    v53 = [v22 allKeys];
    v46 = [v54 photoLibraryURL];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_211;
    v63[3] = &unk_2653E8818;
    v64 = @"[MADComputeService+Photos]";
    id v65 = v55;
    v66 = a1;
    id v47 = v42;
    id v67 = v47;
    v68 = v45;
    [v62 requestProcessing:v59 localIdentifiers:v53 photoLibraryURL:v46 resultDirectoryURL:v33 resultExtensionData:v32 requestID:v47 reply:v63];

    id v48 = v47;
  }
  else
  {
    v49 = [NSString stringWithFormat:@"%@ Failed to connect to compute service", @"[MADComputeService+Photos]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:]();
    }
    uint64_t v80 = *MEMORY[0x263F08320];
    v81 = v49;
    v50 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    [v60 deregisterProgressHandlerForRequestID:v42];
    [v60 deregisterResultsHandlerForRequestID:v42];
    v51 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:v50];
    v45[2](v45, v42, v51);

    id v52 = v42;
  }

  v36 = v70;
LABEL_27:

  return v42;
}

- (id)scheduleRequests:()Photos assets:photoLibrary:options:error:
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v41 = a4;
  id v38 = a5;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  v9 = NSString;
  v10 = NSNumber;
  v11 = [MEMORY[0x263EFF910] now];
  v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
  v13 = [v12 stringValue];
  id v64 = [v9 stringWithFormat:@"Offline-%@", v13];

  uint64_t v14 = [NSString stringWithFormat:@"Schedule: %@ %@ on assets %@", v60[5], v43, v41];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v69 = @"[MADComputeService+Photos]";
    __int16 v70 = 2112;
    uint64_t v71 = v14;
    _os_log_impl(&dword_255950000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@[Start] %@", buf, 0x16u);
  }
  uint64_t v39 = (void *)v14;
  v15 = [MEMORY[0x263EFF9A0] dictionary];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v16 = v41;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v56;
    v19 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v56 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v22 = [v21 localIdentifier];
        BOOL v23 = v22 == 0;

        if (v23)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v69 = @"[MADComputeService+Photos]";
            __int16 v70 = 2112;
            uint64_t v71 = (uint64_t)v21;
            _os_log_error_impl(&dword_255950000, v19, OS_LOG_TYPE_ERROR, "%@ Asset (%@) without localIdentifier; skip",
              buf,
              0x16u);
          }
        }
        else
        {
          uint64_t v24 = [v21 localIdentifier];
          [v15 setObject:v21 forKeyedSubscript:v24];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v17);
  }

  id v53 = 0;
  id v54 = 0;
  uint64_t v25 = [a1 extensionDataForResultDirectoryURL:&v54 error:&v53];
  id v26 = v54;
  id v27 = v53;
  if (v26)
  {
    v28 = [a1 connection];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke;
    v49[3] = &unk_2653E8840;
    v50 = @"[MADComputeService+Photos]";
    v51 = &v59;
    id v52 = a7;
    v29 = [v28 synchronousRemoteObjectProxyWithErrorHandler:v49];

    if (v29)
    {
      BOOL v30 = [v15 allKeys];
      v31 = [v38 photoLibraryURL];
      uint64_t v32 = v60[5];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke_221;
      v44[3] = &unk_2653E8868;
      v45 = @"[MADComputeService+Photos]";
      id v46 = v39;
      id v47 = &v59;
      id v48 = a7;
      [v29 scheduleProcessing:v43 localIdentifiers:v30 photoLibraryURL:v31 resultDirectoryURL:v26 resultExtensionData:v25 requestID:v32 reply:v44];

      id v33 = v45;
    }
    else
    {
      id v33 = [NSString stringWithFormat:@"%@ Failed to connect to compute service", @"[MADComputeService+Photos]"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:]();
      }
      if (a7)
      {
        uint64_t v65 = *MEMORY[0x263F08320];
        v66 = v33;
        uint64_t v35 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        *a7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:v35];
      }
      v36 = (void *)v60[5];
      v60[5] = 0;
    }
    id v34 = (id)v60[5];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:]();
    }
    id v34 = 0;
    if (a7) {
      *a7 = (id)[v27 copy];
    }
  }

  _Block_object_dispose(&v59, 8);

  return v34;
}

- (void)performRequests:()Photos assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_255950000, &_os_log_internal, v0, "%@ Failed to get security-scoped resultDirectoryURL - %@", v1, v2, v3, v4, 2u);
}

- (void)performRequests:()Photos assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_255950000, &_os_log_internal, v0, "%@", v1, v2, v3, v4, v5);
}

@end