@interface PHMediaFormatAssetBundleConversionRequest
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)requiresFormatConversion;
- (BOOL)requiresMetadataChanges;
- (NSArray)subrequests;
- (id)outputFileType;
- (id)outputPathExtension;
- (void)enqueueSubrequestsOnConversionManager:(id)a3;
- (void)enumerateSubrequests:(id)a3;
- (void)setSubrequests:(id)a3;
@end

@implementation PHMediaFormatAssetBundleConversionRequest

- (void).cxx_destruct
{
}

- (void)setSubrequests:(id)a3
{
}

- (NSArray)subrequests
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (id)outputFileType
{
  if (![(PHMediaFormatConversionRequest *)self preflighted])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1938 description:@"Request must be preflighted"];
  }
  v4 = [(PHMediaFormatConversionRequest *)self source];

  if (!v4)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1939 description:@"Invalid request for output type identifier on request without source"];
  }
  v5 = [(PHMediaFormatConversionRequest *)self source];
  v6 = [v5 fileType];

  return v6;
}

- (id)outputPathExtension
{
  if (![(PHMediaFormatConversionRequest *)self preflighted])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1929 description:@"Request must be preflighted"];
  }
  v4 = [(PHMediaFormatConversionRequest *)self source];

  if (!v4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1930 description:@"Invalid request for output path extension on request without source"];
  }
  v5 = [(PHMediaFormatConversionRequest *)self source];
  v6 = [v5 fileURL];
  v7 = [v6 pathExtension];

  return v7;
}

- (BOOL)requiresMetadataChanges
{
  return 0;
}

- (BOOL)requiresFormatConversion
{
  if (![(PHMediaFormatConversionRequest *)self preflighted])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1886 description:@"Request must be preflighted"];
  }
  return 0;
}

- (void)enumerateSubrequests:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(PHMediaFormatAssetBundleConversionRequest *)self subrequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PHMediaFormatConversionCompositeRequest *)self propagateRequestOptionsToSubrequests];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(PHMediaFormatAssetBundleConversionRequest *)self subrequests];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "enqueueConversionRequest:completionHandler:");
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __83__PHMediaFormatAssetBundleConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = 138412290;
    uint64_t v4 = v2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Asset Bundle request subrequest finished: %@", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PHMediaFormatConversionRequest *)self source];
  uint64_t v5 = [v4 fileURL];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F8CBC0]) initWithAssetBundleAtURL:v5];
  if (!v6)
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:5 userInfo:0];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v5 path];
      int v9 = 138412290;
      long long v10 = v8;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create asset photo bundle with path %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v6 != 0;
}

@end