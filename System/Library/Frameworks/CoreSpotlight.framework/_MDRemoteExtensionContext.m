@interface _MDRemoteExtensionContext
- (CSImportExtension)importExtension;
- (CSIndexExtensionRequestHandler)requestHandler;
- (NSString)description;
- (id)handleSingleFileURLRequest:(id)a3 providerIdentifier:(id)a4 index:(id)a5 error:(id *)a6;
- (id)hostContext;
- (void)dealloc;
- (void)getLastUpdateTimeWithCompletionHandler:(id)a3;
- (void)performJob:(id)a3 acknowledgementHandler:(id)a4;
- (void)setImportExtension:(id)a3;
- (void)setRequestHandler:(id)a3;
@end

@implementation _MDRemoteExtensionContext

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_DEBUG, "dealloc, %@", v1, 0xCu);
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x192F99810](self, a2);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  v5 = [(_MDRemoteExtensionContext *)self _UUID];
  v6 = [v5 UUIDString];

  v7 = (void *)[[NSString alloc] initWithFormat:@"UUID=%@", v6];
  [v4 addObject:v7];

  v8 = [(_MDRemoteExtensionContext *)self requestHandler];
  if (v8)
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"handler=%p", v8);
    [v4 addObject:v9];
  }
  id v10 = [NSString alloc];
  uint64_t v11 = objc_opt_class();
  v12 = [v4 componentsJoinedByString:@", "];
  v13 = (void *)[v10 initWithFormat:@"<%@:%p; %@>", v11, self, v12];

  return (NSString *)v13;
}

- (id)hostContext
{
  uint64_t v2 = [(_MDRemoteExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_10];

  return v3;
}

- (id)handleSingleFileURLRequest:(id)a3 providerIdentifier:(id)a4 index:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(_MDRemoteExtensionContext *)self requestHandler];
  uint64_t v14 = [v10 jobType];
  uint64_t v15 = [v10 jobType];
  unint64_t v16 = ((unint64_t)[v10 jobOptions] >> 11) & 0xF;
  id v17 = v13;
  if (objc_opt_respondsToSelector())
  {
    v18 = dispatch_group_create();
    dispatch_group_enter(v18);
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__5;
    v43 = __Block_byref_object_dispose__5;
    id v44 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__5;
    v37 = __Block_byref_object_dispose__5;
    id v38 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87___MDRemoteExtensionContext_handleSingleFileURLRequest_providerIdentifier_index_error___block_invoke;
    aBlock[3] = &unk_1E55498D8;
    v31 = &v33;
    v32 = &v39;
    v19 = v18;
    v30 = v19;
    v20 = _Block_copy(aBlock);
    v21 = [v10 providerType];
    [v17 fileURLForSearchableIndex:v12 itemIdentifier:v11 typeIdentifier:v21 options:v16 block:v20];

    dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    if (a6) {
      *a6 = (id) v40[5];
    }
    id v22 = (id)v34[5];

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);

    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    v19 = [v10 providerType];
    uint64_t v23 = [v17 fileURLForSearchableIndex:v12 itemIdentifier:v11 typeIdentifier:v19 options:v16 error:a6];
LABEL_7:
    id v22 = (id)v23;
LABEL_8:

    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v25 = v15 != 15;
    v26 = [v10 providerType];
    [v17 fileURLForSearchableIndex:v12 itemIdentifier:v11 typeIdentifier:v26 inPlace:v14 == 8 allowDownload:v25 error:a6];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v15 == 15) {
      goto LABEL_20;
    }
    if (objc_opt_respondsToSelector())
    {
      BOOL v27 = v14 == 8;
      v19 = [v10 providerType];
      uint64_t v23 = [v17 fileURLForSearchableIndex:v12 itemIdentifier:v11 typeIdentifier:v19 inPlace:v27 error:a6];
      goto LABEL_7;
    }
    if (v14 == 8 || (objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_20:
      id v22 = 0;
    }
    else
    {
      v28 = [v10 providerType];
      id v22 = [v17 searchableIndexProvideFileURLForIndex:v12 identifier:v11 type:v28 error:a6];
    }
  }
LABEL_9:

  return v22;
}

- (void)performJob:(id)a3 acknowledgementHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_MDRemoteExtensionContext performJob:acknowledgementHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  if (performJob_acknowledgementHandler__onceToken != -1) {
    dispatch_once(&performJob_acknowledgementHandler__onceToken, &__block_literal_global_91);
  }
  unint64_t v16 = performJob_acknowledgementHandler__queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2;
  block[3] = &unk_1E5549288;
  id v20 = v6;
  v21 = self;
  id v22 = v7;
  id v17 = v7;
  id v18 = v6;
  dispatch_async(v16, block);
}

- (void)getLastUpdateTimeWithCompletionHandler:(id)a3
{
  v3 = (void (**)(void, double))a3;
  v4 = (void *)MEMORY[0x192F99810]();
  +[CSSearchableIndex lastUpdateTime];
  double v6 = v5;
  id v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_MDRemoteExtensionContext getLastUpdateTimeWithCompletionHandler:](v7, v6);
  }

  if (v3) {
    v3[2](v3, v6);
  }
}

- (CSIndexExtensionRequestHandler)requestHandler
{
  return self->_requestHandler;
}

- (void)setRequestHandler:(id)a3
{
}

- (CSImportExtension)importExtension
{
  return self->_importExtension;
}

- (void)setImportExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importExtension, 0);

  objc_storeStrong((id *)&self->_requestHandler, 0);
}

- (void)performJob:(uint64_t)a3 acknowledgementHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getLastUpdateTimeWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  unint64_t v3 = (unint64_t)a2;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "lastUpdateTime:%llu", (uint8_t *)&v2, 0xCu);
}

@end