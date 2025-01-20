@interface ANEClient
@end

@implementation ANEClient

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:kANEFModelHasCacheURLIdentifierKey[0]];
  char v3 = [v2 BOOLValue];

  if (v3)
  {
    v4 = 0;
LABEL_6:
    v8 = [*(id *)(a1 + 48) connectionForLoadingModel:*(void *)(a1 + 40) options:*(void *)(a1 + 32)];
    uint64_t v10 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    uint64_t v11 = *(unsigned int *)(a1 + 80);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2;
    v12[3] = &unk_1E6C1C640;
    uint64_t v15 = *(void *)(a1 + 72);
    id v13 = v9;
    int8x16_t v14 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    int v16 = *(_DWORD *)(a1 + 80);
    [v8 loadModel:v13 sandboxExtension:v4 options:v10 qos:v11 withReply:v12];

    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v17 = *(id *)(v6 + 40);
  v4 = +[_ANESandboxingHelper issueSandboxExtensionForModel:v5 error:&v17];
  objc_storeStrong((id *)(v6 + 40), v17);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    goto LABEL_6;
  }
  v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
    __45___ANEClient_compileModel_options_qos_error___block_invoke_cold_1(a1, v7);
  }
LABEL_7:
}

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v18 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    aSelector = *(const char **)(a1 + 56);
    v26 = v18;
    NSStringFromSelector(aSelector);
    aSelectora = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138414082;
    v31 = aSelectora;
    __int16 v32 = 2048;
    uint64_t v33 = v27;
    __int16 v34 = 1024;
    int v35 = a2;
    __int16 v36 = 2048;
    uint64_t v37 = a4;
    __int16 v38 = 2048;
    uint64_t v39 = a5;
    __int16 v40 = 1024;
    int v41 = a6;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v44 = 2112;
    id v45 = v17;
    _os_log_debug_impl(&dword_1DB8AB000, v26, OS_LOG_TYPE_DEBUG, "%@: model[%p] : success=%d : progamHandle=0x%llx : intermediateBufferHandle=%llu : queueDepth=%d : modelCacheIdentifier=%@ : err=%@", buf, 0x4Au);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  v20 = (id *)(a1 + 32);
  v19 = *(void **)(a1 + 32);
  if (!a2)
  {
    [v19 updateModelAttributes:v15 state:5];
    if (!v17) {
      goto LABEL_12;
    }
LABEL_11:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a8);
    goto LABEL_12;
  }
  [v19 updateModelAttributes:v15 state:3 programHandle:a4 intermediateBufferHandle:a5 queueDepth:a6];
  [*v20 setCacheURLIdentifier:v16];
  v21 = +[_ANEDeviceController controllerWithProgramHandle:a4];
  v22 = +[_ANEProgramForEvaluation programWithController:v21 intermediateBufferHandle:a5 queueDepth:a6];
  [*v20 setProgram:v22];

  v23 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_2(a1 + 32, v23);
  }
  v24 = +[_ANEProgramIOSurfacesMapper mapperWithController:v21];
  [*v20 setMapper:v24];

  v25 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_1(a1 + 32, v25);
  }

  if (v17) {
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();
}

void __48___ANEClient_connectionForLoadingModel_options___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    v7 = [*(id *)(a1 + 40) connections];
    uint64_t v8 = [v7 objectForKeyedSubscript:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

uint64_t __30___ANEClient_sharedConnection__block_invoke()
{
  sharedConnection_client = [[_ANEClient alloc] initWithRestrictedAccessAllowed:0];
  return MEMORY[0x1F41817F8]();
}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke(uint64_t a1)
{
  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_cold_1(a1, v2);
  }
}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6(uint64_t a1)
{
  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6_cold_1(a1, v2);
  }
}

void __33___ANEClient_fastConnWithoutLock__block_invoke(uint64_t a1)
{
  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_cold_1(a1, v2);
  }
}

void __33___ANEClient_fastConnWithoutLock__block_invoke_10(uint64_t a1)
{
  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6_cold_1(a1, v2);
  }
}

void __44___ANEClient_connectionUsedForLoadingModel___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    v7 = [*(id *)(a1 + 40) connections];
    uint64_t v8 = [v7 objectForKeyedSubscript:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

void __45___ANEClient_compileModel_options_qos_error___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v20 = *(id *)(v4 + 40);
  uint64_t v5 = +[_ANESandboxingHelper issueSandboxExtensionForModel:v2 error:&v20];
  objc_storeStrong((id *)(v4 + 40), v20);
  if (*(void *)(*(void *)(*(void *)(v3 + 24) + 8) + 40))
  {
    uint64_t v6 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      __45___ANEClient_compileModel_options_qos_error___block_invoke_cold_1(a1, v6);
    }
  }
  else
  {
    v7 = [*(id *)(a1 + 40) conn];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(unsigned int *)(a1 + 80);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45___ANEClient_compileModel_options_qos_error___block_invoke_2;
    v14[3] = &unk_1E6C1C500;
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 72);
    uint64_t v16 = v11;
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 56);
    id v15 = v12;
    uint64_t v17 = v13;
    int v19 = *(_DWORD *)(a1 + 80);
    [v7 compileModel:v12 sandboxExtension:v5 options:v9 qos:v10 withReply:v14];
  }
}

void __45___ANEClient_compileModel_options_qos_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(const char **)(a1 + 56);
    int8x16_t v14 = v12;
    id v15 = NSStringFromSelector(v13);
    int v16 = 138413058;
    uint64_t v17 = v15;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_debug_impl(&dword_1DB8AB000, v14, OS_LOG_TYPE_DEBUG, "%@: success=%d : cacheURLIdentifier=%@ : err=%@", (uint8_t *)&v16, 0x26u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (a2)
  {
    [*(id *)(a1 + 32) updateModelAttributes:v9 state:2];
    [*(id *)(a1 + 32) setCacheURLIdentifier:v10];
  }
  if (v11) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  }
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();
}

void __46___ANEClient_doUnloadModel_options_qos_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(unsigned int *)(a1 + 80);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___ANEClient_doUnloadModel_options_qos_error___block_invoke_2;
  v5[3] = &unk_1E6C1C550;
  uint64_t v8 = *(void *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  int v9 = v4;
  id v6 = v1;
  [v2 unloadModel:v6 options:v3 qos:v4 withReply:v5];
}

void __46___ANEClient_doUnloadModel_options_qos_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(const char **)(a1 + 56);
    int v9 = v7;
    id v10 = NSStringFromSelector(v8);
    int v11 = 138412802;
    id v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_INFO, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();
}

void __37___ANEClient_compiledModelExistsFor___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(const char **)(a1 + 56);
    int v11 = v9;
    id v12 = NSStringFromSelector(v10);
    int v13 = 138413058;
    int v14 = v12;
    __int16 v15 = 1024;
    int v16 = a2;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_debug_impl(&dword_1DB8AB000, v11, OS_LOG_TYPE_DEBUG, "%@: success=%d : cacheURLIdentifier=%@ : err=%@", (uint8_t *)&v13, 0x26u);
  }
  [*(id *)(a1 + 32) setCacheURLIdentifier:v7];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();
}

void __33___ANEClient_purgeCompiledModel___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    id v8 = *(const char **)(a1 + 56);
    int v9 = v7;
    id v10 = NSStringFromSelector(v8);
    int v11 = 138412802;
    id v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();
}

void __46___ANEClient_compiledModelExistsMatchingHash___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (const char *)a1[6];
    int v9 = v7;
    id v10 = NSStringFromSelector(v8);
    int v11 = 138412802;
    id v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  kdebug_trace();
}

void __45___ANEClient_purgeCompiledModelMatchingHash___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (const char *)a1[6];
    int v9 = v7;
    id v10 = NSStringFromSelector(v8);
    int v11 = 138412802;
    id v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  kdebug_trace();
}

uint64_t __37___ANEClient_sharedPrivateConnection__block_invoke()
{
  sharedPrivateConnection_client = [[_ANEClient alloc] initWithRestrictedAccessAllowed:1];
  return MEMORY[0x1F41817F8]();
}

void __31___ANEClient_beginRealTimeTask__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  id v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    id v7 = *(const char **)(a1 + 40);
    id v8 = v6;
    int v9 = NSStringFromSelector(v7);
    int v10 = 138412802;
    int v11 = v9;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v10, 0x1Cu);
  }
}

void __29___ANEClient_endRealTimeTask__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  id v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    id v7 = *(const char **)(a1 + 40);
    id v8 = v6;
    int v9 = NSStringFromSelector(v7);
    int v10 = 138412802;
    int v11 = v9;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v10, 0x1Cu);
  }
}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:kANEFBaseModelIdentifierKey[0]];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v3 = [*(id *)(v1 + 40) procedureArray];
  uint64_t v26 = [v3 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v26)
  {
    uint64_t v4 = *(void *)v42;
    uint64_t v5 = v1 + 64;
    uint64_t v29 = v1;
    v30 = v2;
    v28 = v3;
    uint64_t v25 = *(void *)v42;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v27 = v6;
        id v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v8 = objc_msgSend(v7, "weightArray", v25);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v38;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v38 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              __int16 v14 = [v13 weightURL];
              id v15 = [v14 path];
              uint64_t v16 = *(void *)(*(void *)v5 + 8);
              id obj = *(id *)(v16 + 40);
              uint64_t v17 = +[_ANESandboxingHelper issueSandboxExtensionForPath:v15 error:&obj];
              objc_storeStrong((id *)(v16 + 40), obj);
              [v13 setSandboxExtension:v17];

              if (*(void *)(*(void *)(*(void *)v5 + 8) + 40))
              {
                id v18 = (void *)gLogger_1;
                uint64_t v1 = v29;
                if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
                  __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_2(v29, v18);
                }

                uint64_t v2 = v30;
                uint64_t v3 = v28;
                goto LABEL_20;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v27 + 1;
        uint64_t v1 = v29;
        uint64_t v2 = v30;
        uint64_t v3 = v28;
        uint64_t v4 = v25;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [v28 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v26);
  }
LABEL_20:

  if (v2 || !*(void *)(*(void *)(*(void *)(v1 + 64) + 8) + 40))
  {
    __int16 v19 = [*(id *)(v1 + 48) connectionForLoadingModel:*(void *)(v1 + 56) options:*(void *)(v1 + 32)];
    id v20 = *(void **)(v1 + 56);
    uint64_t v21 = *(void *)(v1 + 32);
    uint64_t v22 = *(void *)(v1 + 40);
    uint64_t v23 = *(unsigned int *)(v1 + 88);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_29;
    v31[3] = &unk_1E6C1C640;
    uint64_t v34 = *(void *)(v1 + 80);
    id v32 = v20;
    int8x16_t v33 = vextq_s8(*(int8x16_t *)(v1 + 64), *(int8x16_t *)(v1 + 64), 8uLL);
    int v35 = *(_DWORD *)(v1 + 88);
    [v19 loadModelNewInstance:v32 options:v21 modelInstParams:v22 qos:v23 withReply:v31];
  }
  else
  {
    uint64_t v24 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR)) {
      __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_1(v1, v24);
    }
  }
}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_29(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    aSelector = *(const char **)(a1 + 56);
    uint64_t v26 = v18;
    NSStringFromSelector(aSelector);
    aSelectora = (char *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138414082;
    v31 = aSelectora;
    __int16 v32 = 2048;
    uint64_t v33 = v27;
    __int16 v34 = 1024;
    int v35 = a2;
    __int16 v36 = 2048;
    uint64_t v37 = a4;
    __int16 v38 = 2048;
    uint64_t v39 = a5;
    __int16 v40 = 1024;
    int v41 = a6;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v44 = 2112;
    id v45 = v17;
    _os_log_debug_impl(&dword_1DB8AB000, v26, OS_LOG_TYPE_DEBUG, "%@: model[%p] : success=%d : progamHandle=0x%llx : intermediateBufferHandle=%llu : queueDepth=%d : modelCacheIdentifier=%@ : err=%@", buf, 0x4Au);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  id v20 = (id *)(a1 + 32);
  __int16 v19 = *(void **)(a1 + 32);
  if (!a2)
  {
    [v19 updateModelAttributes:v15 state:5];
    if (!v17) {
      goto LABEL_12;
    }
LABEL_11:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a8);
    goto LABEL_12;
  }
  [v19 updateModelAttributes:v15 state:3 programHandle:a4 intermediateBufferHandle:a5 queueDepth:a6];
  [*v20 setCacheURLIdentifier:v16];
  uint64_t v21 = +[_ANEDeviceController controllerWithProgramHandle:a4];
  uint64_t v22 = +[_ANEProgramForEvaluation programWithController:v21 intermediateBufferHandle:a5 queueDepth:a6];
  [*v20 setProgram:v22];

  uint64_t v23 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_2(a1 + 32, v23);
  }
  uint64_t v24 = +[_ANEProgramIOSurfacesMapper mapperWithController:v21];
  [*v20 setMapper:v24];

  uint64_t v25 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG)) {
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_1(a1 + 32, v25);
  }

  if (v17) {
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();
}

uint64_t __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(unsigned int *)(a1 + 88);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke_2;
  v7[3] = &unk_1E6C1C5F0;
  uint64_t v9 = *(void *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  return [v2 prepareChainingWithModel:v1 options:v3 chainingReq:v4 qos:v5 withReply:v7];
}

void __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke_2(void *a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    long long v8 = (const char *)a1[6];
    uint64_t v9 = v7;
    uint64_t v10 = NSStringFromSelector(v8);
    int v11 = 138412802;
    __int16 v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  kdebug_trace();
}

uint64_t __55___ANEClient_reportEvaluateFailure_failureReason_qIdx___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportTelemetryToPPS:*(void *)(a1 + 40) playload:*(void *)(a1 + 48)];
}

void __19___ANEClient_echo___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  id v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    id v7 = *(const char **)(a1 + 40);
    long long v8 = v6;
    uint64_t v9 = NSStringFromSelector(v7);
    int v10 = 138412802;
    int v11 = v9;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v10, 0x1Cu);
  }
}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_19_0(a1, a2);
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1DB8AB000, v5, v6, "%@: interruptHandler", v7, v8, v9, v10, v11);
}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_19_0(a1, a2);
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_4_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1DB8AB000, v5, v6, "%@: invalidationHandler", v7, v8, v9, v10, v11);
}

void __45___ANEClient_compileModel_options_qos_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v5 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_1DB8AB000, v6, v7, "%@: Failed to issue sandbox extension model=%@", v8, v9, v10, v11, v12);
}

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_18_0(a1, a2);
  id v3 = [(id)OUTLINED_FUNCTION_4_2() mapper];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1DB8AB000, v4, v5, "mapperForModel p=%@", v6, v7, v8, v9, v10);
}

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_18_0(a1, a2);
  id v3 = [(id)OUTLINED_FUNCTION_4_2() program];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1DB8AB000, v4, v5, "evaluateOnlyProgramForModel p=%@", v6, v7, v8, v9, v10);
}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v5 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_1DB8AB000, v6, v7, "%@: Failed to issue sandbox extension model=%@", v8, v9, v10, v11, v12);
}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v5 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_1DB8AB000, v6, v7, "%@: issueSandboxExtensionForPath error=%@", v8, v9, v10, v11, v12);
}

@end