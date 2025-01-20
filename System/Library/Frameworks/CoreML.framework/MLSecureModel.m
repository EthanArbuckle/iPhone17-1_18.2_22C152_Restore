@interface MLSecureModel
+ (BOOL)supportsSecureCoding;
+ (id)modelWithContentsOfURL:(id)a3 configuration:(id)a4 decryptCredential:(id)a5 error:(id *)a6;
+ (id)modelWithContentsOfURL:(id)a3 decryptCredential:(id)a4 error:(id *)a5;
+ (id)sandboxExtensionPathsForModelURL:(id)a3;
+ (id)sandboxExtensionTokenForModelURL:(id)a3;
- (CoreMLModelSecurityProtocol)secureModelProxy;
- (MLSecureModel)initWithCoder:(id)a3;
- (NSXPCConnection)connectionToModelSecurityService;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 error:(id *)a4;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionToModelSecurityService:(id)a3;
- (void)setSecureModelProxy:(id)a3;
@end

@implementation MLSecureModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureModelProxy, 0);

  objc_storeStrong((id *)&self->_connectionToModelSecurityService, 0);
}

- (void)setSecureModelProxy:(id)a3
{
}

- (CoreMLModelSecurityProtocol)secureModelProxy
{
  return self->_secureModelProxy;
}

- (void)setConnectionToModelSecurityService:(id)a3
{
}

- (NSXPCConnection)connectionToModelSecurityService
{
  return self->_connectionToModelSecurityService;
}

- (void)dealloc
{
  v3 = [(MLSecureModel *)self connectionToModelSecurityService];

  if (v3)
  {
    v4 = [(MLSecureModel *)self connectionToModelSecurityService];
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)MLSecureModel;
  [(MLSecureModel *)&v5 dealloc];
}

- (MLSecureModel)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"congfiguration"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelDescription"];

  v9.receiver = self;
  v9.super_class = (Class)MLSecureModel;
  v7 = [(MLModel *)&v9 initWithDescription:v6 configuration:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MLModel *)self configuration];
  [v4 encodeObject:v5 forKey:@"congfiguration"];

  id v6 = [(MLModel *)self modelDescription];
  [v4 encodeObject:v6 forKey:@"modelDescription"];
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9809;
  v21 = __Block_byref_object_dispose__9810;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9809;
  v15 = __Block_byref_object_dispose__9810;
  id v16 = 0;
  v7 = [(MLSecureModel *)self secureModelProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__MLSecureModel_parameterValueForKey_error___block_invoke;
  v10[3] = &unk_1E59A41E0;
  v10[4] = &v17;
  v10[5] = &v11;
  [v7 secureParameterValueForKey:v6 withReply:v10];

  if (a4) {
    *a4 = (id) v12[5];
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

void __44__MLSecureModel_parameterValueForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Could not obtain parameterValueForKey from secure model via XPC: error=%@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[MLPredictionOptions defaultOptions];
  uint64_t v8 = [(MLSecureModel *)self predictionsFromBatch:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  int v13 = [(MLSecureModel *)self connectionToModelSecurityService];
  id v14 = [v13 exportedObject];

  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v16 = [v14 serviceToClientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_2;
  block[3] = &unk_1E59A49F0;
  id v17 = v8;
  id v45 = v17;
  id v18 = v15;
  id v46 = v18;
  id v19 = v14;
  id v47 = v19;
  dispatch_sync(v16, block);

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__9809;
  v42 = __Block_byref_object_dispose__9810;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9809;
  v36 = __Block_byref_object_dispose__9810;
  id v37 = 0;
  v20 = [(MLSecureModel *)self secureModelProxy];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_3;
  v31[3] = &unk_1E59A41B8;
  v31[4] = &v38;
  v31[5] = &v32;
  [v20 securePredictionFromLazyBatch:v18 options:v9 withReply:v31];

  v21 = [v19 serviceToClientQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_123;
  v27[3] = &unk_1E59A49F0;
  id v22 = v17;
  id v28 = v22;
  id v23 = v18;
  id v29 = v23;
  id v24 = v19;
  id v30 = v24;
  dispatch_sync(v21, v27);

  if (a5) {
    *a5 = (id) v33[5];
  }
  id v25 = (id)v39[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  v12[2](v12);

  return v25;
}

uint64_t __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_2(id *a1)
{
  uint64_t result = [a1[4] count];
  if (result >= 1)
  {
    for (uint64_t i = 0; i < result; ++i)
    {
      id v4 = [a1[4] featuresAtIndex:i];
      id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
      [a1[5] setObject:v5 atIndexedSubscript:i];
      id v6 = [a1[6] featureProviderCount];
      [v6 addObject:v5];

      v7 = [a1[6] featureProviderMap];
      [v7 setObject:v4 forKeyedSubscript:v5];

      uint64_t result = [a1[4] count];
    }
  }
  return result;
}

void __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Could not batch predict from secure model via XPC: error=%@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __52__MLSecureModel_predictionsFromBatch_options_error___block_invoke_123(id *a1)
{
  uint64_t result = [a1[4] count];
  if (result >= 1)
  {
    for (uint64_t i = 0; i < result; ++i)
    {
      id v4 = [a1[5] objectAtIndexedSubscript:i];
      id v5 = [a1[6] featureProviderCount];
      uint64_t v6 = [v5 countForObject:v4];

      v7 = [a1[6] featureProviderCount];
      [v7 removeObject:v4];

      if (v6 == 1)
      {
        uint64_t v8 = [a1[6] featureProviderMap];
        [v8 removeObjectForKey:v4];
      }
      uint64_t result = [a1[4] count];
    }
  }
  return result;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[MLPredictionOptions defaultOptions];
  uint64_t v8 = [(MLSecureModel *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "hash"));
  uint64_t v11 = [(MLSecureModel *)self connectionToModelSecurityService];
  v12 = [v11 exportedObject];

  int v13 = [v12 serviceToClientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke;
  block[3] = &unk_1E59A49F0;
  id v14 = v12;
  id v40 = v14;
  id v15 = v10;
  id v41 = v15;
  id v16 = v8;
  id v42 = v16;
  dispatch_sync(v13, block);

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__9809;
  id v37 = __Block_byref_object_dispose__9810;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__9809;
  v31 = __Block_byref_object_dispose__9810;
  id v32 = 0;
  id v17 = [(MLSecureModel *)self secureModelProxy];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_2;
  v26[3] = &unk_1E59A4190;
  v26[4] = &v33;
  v26[5] = &v27;
  [v17 securePredictionFromLazyFeatures:v15 options:v9 withReply:v26];

  id v18 = [v14 serviceToClientQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_118;
  v23[3] = &unk_1E59A5458;
  id v19 = v14;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  dispatch_sync(v18, v23);

  if (a5) {
    *a5 = (id) v28[5];
  }
  id v21 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v21;
}

void __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) featureProviderCount];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) featureProviderMap];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Could not predict from secure model via XPC: error=%@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

void __54__MLSecureModel_predictionFromFeatures_options_error___block_invoke_118(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) featureProviderCount];
  uint64_t v3 = [v2 countForObject:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) featureProviderCount];
  [v4 removeObject:*(void *)(a1 + 40)];

  if (v3 == 1)
  {
    id v5 = [*(id *)(a1 + 32) featureProviderMap];
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)modelWithContentsOfURL:(id)a3 decryptCredential:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[MLModelConfiguration defaultConfiguration];
  id v10 = +[MLSecureModel modelWithContentsOfURL:v8 configuration:v9 decryptCredential:v7 error:a5];

  return v10;
}

+ (id)modelWithContentsOfURL:(id)a3 configuration:(id)a4 decryptCredential:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CoreMLModelSecurityService"];
    int v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF14E7D0];
    [v12 setRemoteObjectInterface:v13];

    [v12 setInterruptionHandler:&__block_literal_global_9839];
    [v12 setInvalidationHandler:&__block_literal_global_101];
    id v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF129748];
    [v12 setExportedInterface:v14];

    uint64_t v15 = objc_alloc_init(CoreMLModelSecurityServiceToClient);
    [v12 setExportedObject:v15];

    [v12 resume];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__9809;
    id v42 = __Block_byref_object_dispose__9810;
    id v43 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_108;
    v35[3] = &unk_1E59A4140;
    v36 = @"com.apple.CoreMLModelSecurityService";
    id v37 = &v38;
    id v16 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v35];
    if (a6) {
      *a6 = (id) v39[5];
    }
    if (v39[5])
    {
      id v17 = 0;
    }
    else
    {
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x3032000000;
      id v32 = __Block_byref_object_copy__9809;
      uint64_t v33 = __Block_byref_object_dispose__9810;
      id v34 = 0;
      id v18 = +[MLSecureModel sandboxExtensionTokenForModelURL:v9];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_110;
      v28[3] = &unk_1E59A4168;
      v28[4] = &v38;
      v28[5] = &v29;
      [v16 secureModelWithContentsOfURL:v9 sandboxExtensionToken:v18 configuration:v10 decryptCredential:v11 withReply:v28];

      if (a6) {
        *a6 = (id) v39[5];
      }
      if (v39[5])
      {
        id v17 = 0;
      }
      else
      {
        id v19 = (void *)v30[5];
        if (v19)
        {
          [v19 setConnectionToModelSecurityService:v12];
          [(id)v30[5] setSecureModelProxy:v16];
          objc_msgSend(NSString, "stringWithFormat:", @"com.apple.CoreMLModelSecutiyServiceToClient.%lu", objc_msgSend(v12, "hash"));
          id v20 = objc_claimAutoreleasedReturnValue();
          id v21 = (const char *)[v20 UTF8String];
          id v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
          id v24 = [(id)v30[5] connectionToModelSecurityService];
          id v25 = [v24 exportedObject];
          [v25 setServiceToClientQueue:v23];

          v26 = (void *)v30[5];
        }
        else
        {
          v26 = 0;
        }
        id v17 = v26;
      }
      _Block_object_dispose(&v29, 8);
    }
    _Block_object_dispose(&v38, 8);
  }
  else if (a6)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"nil value for URL"];
    id v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_108(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "Could not create connection to %@ : error=%@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Could not create secure model via XPC: error=%@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke_99()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered invalidationHandler!", v1, 2u);
  }
}

void __78__MLSecureModel_modelWithContentsOfURL_configuration_decryptCredential_error___block_invoke()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered interruptionHandler!", v1, 2u);
  }
}

+ (id)sandboxExtensionTokenForModelURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = +[MLSecureModel sandboxExtensionPathsForModelURL:a3];
  id v5 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_debug_impl(&dword_19E58B000, v5, OS_LOG_TYPE_DEBUG, "%@: modelPathStr=%@", buf, 0x16u);
  }
  if ([(__CFString *)v4 hasPrefix:@"/System/Library/"])
  {
    id v6 = &stru_1EF0E81D0;
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@/", v4];
    [(__CFString *)v7 UTF8String];
    uint64_t v8 = sandbox_extension_issue_file();
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v6 = [NSString stringWithUTF8String:v8];
      free(v9);
    }
    else
    {
      int v10 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v17 = v15;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "%@: sandbox_extension_issue_file() returned NULL. path=%@", buf, 0x16u);
      }
      id v6 = &stru_1EF0E81D0;
    }
  }
  id v11 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v17 = v14;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_debug_impl(&dword_19E58B000, v11, OS_LOG_TYPE_DEBUG, "%@: sandboxExtensionToken=%@", buf, 0x16u);
  }

  return v6;
}

+ (id)sandboxExtensionPathsForModelURL:(id)a3
{
  id v3 = a3;
  if ([v3 hasDirectoryPath])
  {
    id v4 = NSString;
    id v5 = [v3 path];

    id v6 = [v4 stringWithFormat:@"%@/", v5];
  }
  else
  {
    id v5 = [v3 URLByDeletingLastPathComponent];

    uint64_t v7 = NSString;
    uint64_t v8 = [v5 path];
    id v6 = [v7 stringWithFormat:@"%@/", v8];
  }

  return v6;
}

@end