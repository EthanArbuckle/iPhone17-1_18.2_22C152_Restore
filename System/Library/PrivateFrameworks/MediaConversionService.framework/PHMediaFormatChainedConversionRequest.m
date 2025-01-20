@interface PHMediaFormatChainedConversionRequest
+ (id)chainedRequestForAdjustmentRenderRequest:(id)a3 dependingOnRequest:(id)a4 error:(id *)a5;
+ (id)chainedRequestForRequest:(id)a3 dependingOnRequest:(id)a4 error:(id *)a5 successUpdateHandler:(id)a6;
+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5;
- (PHMediaFormatConversionRequest)dependentRequest;
- (PHMediaFormatConversionRequest)independentRequest;
- (id)successUpdateHandler;
- (void)enqueueSubrequestsOnConversionManager:(id)a3;
- (void)enumerateSubrequests:(id)a3;
- (void)postProcessSuccessfulCompositeRequest;
- (void)setDependentRequest:(id)a3;
- (void)setIndependentRequest:(id)a3;
- (void)setSuccessUpdateHandler:(id)a3;
@end

@implementation PHMediaFormatChainedConversionRequest

+ (id)chainedRequestForAdjustmentRenderRequest:(id)a3 dependingOnRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__PHMediaFormatChainedConversionRequest_chainedRequestForAdjustmentRenderRequest_dependingOnRequest_error___block_invoke;
  v14[3] = &unk_1E6CFEA78;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  v12 = [a1 chainedRequestForRequest:v10 dependingOnRequest:v11 error:a5 successUpdateHandler:v14];

  return v12;
}

void __107__PHMediaFormatChainedConversionRequest_chainedRequestForAdjustmentRenderRequest_dependingOnRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) destination];
  v3 = [v2 fileSignature];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get output file signature of previous request %@", (uint8_t *)&v6, 0xCu);
  }
  v4 = [*(id *)(a1 + 40) source];
  [v4 setRenderOriginatingSignature:v3];
}

+ (id)chainedRequestForRequest:(id)a3 dependingOnRequest:(id)a4 error:(id *)a5 successUpdateHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v12)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 1959, @"Invalid parameter not satisfying: %@", @"dependentRequest" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 1958, @"Invalid parameter not satisfying: %@", @"independentRequest" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 1960, @"Invalid parameter not satisfying: %@", @"updateHandler" object file lineNumber description];

LABEL_4:
  v14 = objc_opt_new();
  [v14 setIndependentRequest:v12];
  [v12 setParentRequest:v14];
  [v14 setDependentRequest:v11];
  [v11 setParentRequest:v14];
  [v14 setSuccessUpdateHandler:v13];
  id v15 = [v14 compositeRequestCommonInitWithError:a5];

  return v15;
}

+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v5 raise:v6, @"The constructor %@ is unavailable for %@", v7, v9 format];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_successUpdateHandler, 0);
  objc_storeStrong((id *)&self->_dependentRequest, 0);
  objc_storeStrong((id *)&self->_independentRequest, 0);
}

- (void)setSuccessUpdateHandler:(id)a3
{
}

- (id)successUpdateHandler
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setDependentRequest:(id)a3
{
}

- (PHMediaFormatConversionRequest)dependentRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)setIndependentRequest:(id)a3
{
}

- (PHMediaFormatConversionRequest)independentRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 240, 1);
}

- (void)postProcessSuccessfulCompositeRequest
{
  id v4 = [(PHMediaFormatChainedConversionRequest *)self dependentRequest];
  v3 = [v4 destination];
  [(PHMediaFormatConversionRequest *)self setDestination:v3];
}

- (void)enumerateSubrequests:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PHMediaFormatChainedConversionRequest *)self independentRequest];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

  id v7 = [(PHMediaFormatChainedConversionRequest *)self dependentRequest];
  (*((void (**)(id, id))a3 + 2))(v5, v7);
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PHMediaFormatChainedConversionRequest *)self independentRequest];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke;
  v8[3] = &unk_1E6CFEE00;
  v8[4] = self;
  [v4 enqueueConversionRequest:v5 completionHandler:v8];

  uint64_t v6 = [(PHMediaFormatChainedConversionRequest *)self dependentRequest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_799;
  v7[3] = &unk_1E6CFEE00;
  v7[4] = self;
  [v4 enqueueConversionRequest:v6 completionHandler:v7];
}

uint64_t __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v2 = [*(id *)(a1 + 32) independentRequest];
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Chained request independent request finished: %@", (uint8_t *)&v8, 0xCu);
  }
  v3 = [*(id *)(a1 + 32) independentRequest];
  uint64_t v4 = [v3 status];

  if (v4 == 4)
  {
    id v5 = [*(id *)(a1 + 32) successUpdateHandler];
    v5[2]();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [*(id *)(a1 + 32) dependentRequest];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Chained request independent request unsuccessful, cancelling dependent request %@", (uint8_t *)&v8, 0xCu);
    }
    id v5 = [*(id *)(a1 + 32) dependentRequest];
    [v5 markAsCancelled];
  }

  return [*(id *)(a1 + 32) setSuccessUpdateHandler:0];
}

void __79__PHMediaFormatChainedConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_799(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v2 = [*(id *)(a1 + 32) dependentRequest];
    int v3 = 138412290;
    uint64_t v4 = v2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Chained request dependent request finished: %@", (uint8_t *)&v3, 0xCu);
  }
}

@end