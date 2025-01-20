@interface VSAMSRequestOperation
- (NSOperationQueue)privateQueue;
- (VSAMSRequest)request;
- (VSAMSRequestOperation)init;
- (VSAMSRequestOperation)initWithRequest:(id)a3;
- (VSOptional)result;
- (void)cancel;
- (void)executionDidBegin;
- (void)setPrivateQueue:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResult:(id)a3;
- (void)urlForRequestType:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation VSAMSRequestOperation

- (VSAMSRequestOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v6 = [(VSAMSRequestOperation *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (VSAMSRequestOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)VSAMSRequestOperation;
  v2 = [(VSAMSRequestOperation *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

    id v5 = (void *)MEMORY[0x1E4F28F08];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 queueWithName:v7];
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (NSOperationQueue *)v8;
  }
  return v2;
}

- (void)executionDidBegin
{
  v3 = [(VSAMSRequestOperation *)self request];
  uint64_t v4 = [v3 requestType];

  id v5 = [(VSAMSRequestOperation *)self request];
  v6 = [v5 methodName];

  v7 = [(VSAMSRequestOperation *)self request];
  uint64_t v8 = [v7 parameters];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__VSAMSRequestOperation_executionDidBegin__block_invoke;
  v11[3] = &unk_1E6BD2830;
  id v9 = v6;
  id v12 = v9;
  id v10 = v8;
  id v13 = v10;
  objc_copyWeak(&v14, &location);
  [(VSAMSRequestOperation *)self urlForRequestType:v4 completionHandler:v11];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v21 = v6;
    id v22 = v5;
    id v20 = v5;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28E88], "requestWithURL:");
    [v8 setHTTPMethod:*(void *)(a1 + 32)];
    id v9 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vs_defaultBag");
    id v10 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F4DE88]) initWithConfiguration:v10];
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F4DD48]) initWithClientIdentifier:@"VideoSubscriberAccount" bag:v9];
    [v12 setSession:v11];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F4DD28]) initWithTokenService:v12];
    [v11 setProtocolHandler:v13];
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F4DD30]) initWithTokenService:v12 bag:v9];
    v15 = [v14 requestByEncodingRequest:v8 parameters:*(void *)(a1 + 40)];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2;
    v23[3] = &unk_1E6BD2808;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    id v16 = v11;
    id v24 = v16;
    [v15 addFinishBlock:v23];

    objc_destroyWeak(&v25);
    v7 = v21;
    id v5 = v22;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (!v7)
    {
      v7 = VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
      if (!v7) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
      }
    }
    v18 = +[VSFailable failableWithError:v7];
    v19 = +[VSOptional optionalWithObject:v18];
    [WeakRetained setResult:v19];

    [WeakRetained finishExecutionIfPossible];
  }
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    id v9 = v6;
    id v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_2();
    }
  }
  else
  {
    if (v5)
    {
      id v9 = v5;
      id v13 = [*(id *)(a1 + 32) dataTaskPromiseWithRequest:v9];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __42__VSAMSRequestOperation_executionDidBegin__block_invoke_17;
      v15[3] = &unk_1E6BD27E0;
      objc_copyWeak(&v16, v7);
      [v13 addFinishBlock:v15];
      objc_destroyWeak(&v16);

      goto LABEL_8;
    }
    id v14 = VSErrorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_1((uint64_t)WeakRetained, v14);
    }

    VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v11 = +[VSFailable failableWithError:v9];
  id v12 = +[VSOptional optionalWithObject:v11];
  [WeakRetained setResult:v12];

  [WeakRetained finishExecutionIfPossible];
LABEL_8:
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    id v8 = v6;
    id v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_17_cold_2();
    }

LABEL_5:
    id v10 = +[VSFailable failableWithError:v8];
    objc_super v11 = +[VSOptional optionalWithObject:v10];
    [WeakRetained setResult:v11];
    goto LABEL_10;
  }
  if (!v5)
  {
    id v14 = VSErrorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_17_cold_1((uint64_t)WeakRetained, v14);
    }

    VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v8 = v5;
  id v12 = VSDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = WeakRetained;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1DA674000, v12, OS_LOG_TYPE_DEFAULT, "AMS request %@ returned result %@", (uint8_t *)&v15, 0x16u);
  }

  id v10 = [v8 data];
  objc_super v11 = +[VSFailable failableWithObject:v10];
  id v13 = +[VSOptional optionalWithObject:v11];
  [WeakRetained setResult:v13];

LABEL_10:
  [WeakRetained finishExecutionIfPossible];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSAMSRequestOperation;
  [(VSAsyncOperation *)&v4 cancel];
  v3 = [(VSAMSRequestOperation *)self privateQueue];
  [v3 cancelAllOperations];
}

- (void)urlForRequestType:(unint64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(VSAMSBagLoadOperation);
  [(VSAMSBagLoadOperation *)v6 setBagKey:@"countryCode"];
  v7 = objc_alloc_init(VSAMSBagLoadOperation);
  [(VSAMSBagLoadOperation *)v7 setBagKey:@"apps-media-api-host"];
  id v8 = objc_alloc_init(VSAMSBagLoadOperation);
  [(VSAMSBagLoadOperation *)v8 setBagKey:@"language-tag"];
  objc_initWeak(&location, v6);
  objc_initWeak(&from, v7);
  objc_initWeak(&v21, v8);
  objc_initWeak(&v20, self);
  id v9 = (void *)MEMORY[0x1E4F28B48];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__VSAMSRequestOperation_urlForRequestType_completionHandler___block_invoke;
  v14[3] = &unk_1E6BD2858;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, &v21);
  objc_copyWeak(v19, &v20);
  v19[1] = (id)a3;
  id v10 = v5;
  id v15 = v10;
  objc_super v11 = [v9 blockOperationWithBlock:v14];
  id v12 = [(VSAMSRequestOperation *)self privateQueue];
  [v11 addDependency:v6];
  [v11 addDependency:v7];
  [v11 addDependency:v8];
  [v12 addOperation:v6];
  [v12 addOperation:v7];
  [v12 addOperation:v8];
  [v12 addOperation:v11];

  objc_destroyWeak(v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __61__VSAMSRequestOperation_urlForRequestType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v99[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(v1 + 48));
  id v4 = objc_loadWeakRetained((id *)(v1 + 56));
  id v5 = objc_loadWeakRetained((id *)(v1 + 64));
  id v6 = [WeakRetained value];
  v7 = [v3 value];
  id v8 = [v4 value];
  id v9 = [WeakRetained error];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v88 = v5;
    id v12 = v7;
    uint64_t v13 = v1;
    id v14 = WeakRetained;
    id v15 = v6;
    id v16 = v12;
    id v17 = v8;
    id v18 = [v3 error];
    uint64_t v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [v4 error];
    }
    id v21 = v20;

    id v11 = v21;
    id v8 = v17;
    id v22 = v16;
    id v6 = v15;
    id WeakRetained = v14;
    uint64_t v1 = v13;
    v7 = v22;
    id v5 = v88;
  }

  if (v6 && v7 && v8)
  {
    id v84 = v11;
    id v85 = v3;
    id v86 = v4;
    id v92 = v6;
    v79 = v7;
    id v23 = v7;
    v83 = v8;
    id v24 = v8;
    id v25 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v25 setScheme:@"https"];
    v82 = v23;
    [v25 setHost:v23];
    v26 = +[VSDevice currentDevice];
    v27 = (void *)MEMORY[0x1E4F290C8];
    v81 = v26;
    v28 = [v26 stringForAMSPlatform];
    uint64_t v29 = [v27 queryItemWithName:@"platform" value:v28];

    v80 = v24;
    v30 = [MEMORY[0x1E4F290C8] queryItemWithName:@"l" value:v24];
    v87 = (void *)v29;
    v99[0] = v29;
    v99[1] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:2];
    [v25 setQueryItems:v31];

    switch(*(void *)(v1 + 72))
    {
      case 0:
        uint64_t v73 = [NSString stringWithFormat:@"/v1/catalog/%@/tv-providers", v92];
        [v25 setPath:v73];
        v89 = [MEMORY[0x1E4F290C8] queryItemWithName:@"include" value:@"apps"];
        v76 = [MEMORY[0x1E4F290C8] queryItemWithName:@"redef[multiple-system-operators]" value:@"tv-providers"];
        v72 = [MEMORY[0x1E4F290C8] queryItemWithName:@"extend" value:@"externalVersionId"];
        v32 = [v25 queryItems];
        v98[0] = v89;
        v98[1] = v76;
        v98[2] = v72;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
        v34 = v33 = v30;
        v35 = [v32 arrayByAddingObjectsFromArray:v34];
        [v25 setQueryItems:v35];

        v30 = v33;
        v36 = (void *)v73;

        goto LABEL_17;
      case 1:
        uint64_t v74 = [NSString stringWithFormat:@"/v1/catalog/%@/apps", v92];
        [v25 setPath:v74];
        v89 = [MEMORY[0x1E4F290C8] queryItemWithName:@"filter[supportsTVProviders]" value:@"true"];
        v76 = [MEMORY[0x1E4F290C8] queryItemWithName:@"fields" value:@"name,artwork,deviceFamilies"];
        v39 = [v25 queryItems];
        v97[0] = v89;
        v97[1] = v76;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
        v41 = v40 = v30;
        v42 = [v39 arrayByAddingObjectsFromArray:v41];
        [v25 setQueryItems:v42];

        v30 = v40;
        v36 = (void *)v74;

LABEL_17:
        goto LABEL_29;
      case 2:
        [v25 setPath:@"/v1/storefronts"];
        v96[0] = v87;
        v96[1] = v30;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
        [v25 setQueryItems:v36];
        goto LABEL_29;
      case 3:
        v77 = v30;
        v43 = NSString;
        v44 = [v5 request];
        v45 = [v44 providerIdentifier];

        if (!v45) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [[strongSelf request] providerIdentifier] parameter must not be nil."];
        }
        v46 = [v5 request];
        v47 = [v46 providerIdentifier];

        [v43 stringWithFormat:@"/v1/catalog/%@/tv-providers/%@/channel-apps", v92, v47];
        v36 = id v90 = v5;

        [v25 setPath:v36];
        v48 = [MEMORY[0x1E4F290C8] queryItemWithName:@"redef[multiple-system-operators]" value:@"tv-providers"];
        v49 = [MEMORY[0x1E4F290C8] queryItemWithName:@"extend" value:@"externalVersionId"];
        v50 = [v25 queryItems];
        v95[0] = v48;
        v95[1] = v49;
        v51 = (void *)MEMORY[0x1E4F1C978];
        v52 = v95;
        goto LABEL_25;
      case 4:
        v77 = v30;
        v53 = NSString;
        v54 = [v5 request];
        v55 = [v54 providerIdentifier];

        if (!v55) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [[strongSelf request] providerIdentifier] parameter must not be nil."];
        }
        v56 = [v5 request];
        v57 = [v56 providerIdentifier];

        [v53 stringWithFormat:@"/v1/catalog/%@/tv-providers/%@/subscription-apps", v92, v57];
        v36 = id v90 = v5;

        [v25 setPath:v36];
        v48 = [MEMORY[0x1E4F290C8] queryItemWithName:@"redef[multiple-system-operators]" value:@"tv-providers"];
        v49 = [MEMORY[0x1E4F290C8] queryItemWithName:@"extend" value:@"externalVersionId"];
        v50 = [v25 queryItems];
        v94[0] = v48;
        v94[1] = v49;
        v51 = (void *)MEMORY[0x1E4F1C978];
        v52 = v94;
LABEL_25:
        v58 = [v51 arrayWithObjects:v52 count:2];
        v59 = [v50 arrayByAddingObjectsFromArray:v58];
        [v25 setQueryItems:v59];

        id v5 = v90;
        v30 = v77;
        goto LABEL_29;
      case 5:
        v78 = v30;
        v60 = NSString;
        v61 = [v5 request];
        v62 = [v61 providerIdentifier];

        if (!v62) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [[strongSelf request] providerIdentifier] parameter must not be nil."];
        }
        v63 = [v5 request];
        v64 = [v63 providerIdentifier];

        [v60 stringWithFormat:@"/v1/catalog/%@/tv-providers/%@", v92, v64];
        uint64_t v75 = v91 = v5;

        [v25 setPath:v75];
        v65 = [MEMORY[0x1E4F290C8] queryItemWithName:@"redef[multiple-system-operators]" value:@"tv-providers"];
        v66 = [MEMORY[0x1E4F290C8] queryItemWithName:@"extend" value:@"externalVersionId"];
        v67 = [MEMORY[0x1E4F290C8] queryItemWithName:@"include" value:@"apps,channel-apps,subscription-apps"];
        v68 = [v25 queryItems];
        v93[0] = v65;
        v93[1] = v66;
        v93[2] = v67;
        v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];
        v70 = [v68 arrayByAddingObjectsFromArray:v69];
        [v25 setQueryItems:v70];

        id v5 = v91;
        v36 = (void *)v75;
        v30 = v78;
LABEL_29:

        break;
      default:
        break;
    }
    v71 = [v25 URL];
    (*(void (**)(void))(*(void *)(v1 + 32) + 16))();

    id v3 = v85;
    id v4 = v86;
    id v8 = v83;
    id v11 = v84;
    v7 = v79;
  }
  else
  {
    if (v11)
    {
      id v37 = v11;
    }
    else
    {
      VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v37;
    (*(void (**)(void))(*(void *)(v1 + 32) + 16))();
  }
}

- (VSAMSRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "AMS signing request %@ did not return a request or error.", (uint8_t *)&v2, 0xCu);
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "Error signing AMS request %@, returned error: %@");
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_17_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "AMS Request %@ did not return a result or error.", (uint8_t *)&v2, 0xCu);
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_17_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "AMS request %@ returned error: %@");
}

@end