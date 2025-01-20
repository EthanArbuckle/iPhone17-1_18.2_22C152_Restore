@interface MLROnDemandPlugin
+ (id)_createXPCConnection:(id)a3 error:(id *)a4;
+ (id)_locateWithExtensionID:(id)a3;
+ (id)onDemandPluginIDs;
+ (id)synchronouslyPerformTask:(id)a3 forPluginID:(id)a4 error:(id *)a5;
+ (void)_performTask:(id)a3 forPluginID:(id)a4 isSynchronous:(BOOL)a5 completionHandler:(id)a6;
+ (void)performTask:(id)a3 forPluginID:(id)a4 completionHandler:(id)a5;
@end

@implementation MLROnDemandPlugin

+ (id)_locateWithExtensionID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263F04DE8] extensionPointIdentifierQuery:@"com.apple.mlruntime.extension-point-ondemand"];
    [MEMORY[0x263F04DF0] executeQuery:v4];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "bundleIdentifier", (void)v13);
          char v11 = [v10 isEqualToString:v3];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_createXPCConnection:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = [a1 _locateWithExtensionID:a3];
  id v6 = v5;
  if (v5)
  {
    a4 = [v5 makeXPCConnectionWithError:a4];
    if (a4)
    {
      uint64_t v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CC7CA58];
      [a4 setRemoteObjectInterface:v7];

      [a4 resume];
    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F3A4A0];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"Fail to find matched plugin.";
    v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a4 = [v8 errorWithDomain:v9 code:8013 userInfo:v10];

    a4 = 0;
  }

  return a4;
}

+ (void)_performTask:(id)a3 forPluginID:(id)a4 isSynchronous:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [MEMORY[0x263F3A428] sendEventEvaluationSessionStartForBundleID:v11];
  id v32 = 0;
  long long v13 = [a1 _createXPCConnection:v11 error:&v32];
  id v14 = v32;
  if (v13)
  {
    if (v7)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke;
      v29[3] = &unk_2643F1F90;
      long long v15 = &v30;
      id v30 = v11;
      BOOL v31 = v7;
      uint64_t v16 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v29];
    }
    else
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57;
      v26[3] = &unk_2643F1F90;
      long long v15 = &v27;
      id v27 = v11;
      char v28 = 0;
      uint64_t v16 = [v13 remoteObjectProxyWithErrorHandler:v26];
    }
    uint64_t v18 = (void *)v16;

    v19 = [MEMORY[0x263F08AB0] processInfo];
    [v19 systemUptime];
    uint64_t v21 = v20;

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_59;
    v22[3] = &unk_2643F1FB8;
    uint64_t v25 = v21;
    id v23 = v11;
    id v24 = v12;
    [v18 performTask:v10 completionHandler:v22];
  }
  else
  {
    v17 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[MLROnDemandPlugin _performTask:forPluginID:isSynchronous:completionHandler:]((uint64_t)v11, (uint64_t)v14, v17);
    }

    if (v12) {
      (*((void (**)(id, void, id))v12 + 2))(v12, 0, v14);
    }
    [MEMORY[0x263F3A428] sendEventEvaluationSessionFinishForBundleID:v11 success:0];
    [MEMORY[0x263F3A428] sendEventErrorForBundleID:v11 error:v14];
  }
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_cold_1();
  }
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57_cold_1();
  }
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263F08AB0] processInfo];
  [v7 systemUptime];
  double v9 = v8 - *(double *)(a1 + 48);

  id v10 = (void *)(a1 + 32);
  [MEMORY[0x263F3A428] sendEventEvaluationSessionFinishForBundleID:*(void *)(a1 + 32) success:v6 == 0];
  *(float *)&double v11 = v9;
  [MEMORY[0x263F3A428] sendEventEvaluationForBundleID:*v10 evaluationID:*v10 duration:0 deferred:v6 == 0 success:v6 error:0 downloadedAttachmentCount:v11];
  if (v6)
  {
    [MEMORY[0x263F3A428] sendEventErrorForBundleID:*v10 error:v6];
    id v12 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_59_cold_2();
    }
  }
  else
  {
    id v12 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_59_cold_1();
    }
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

+ (void)performTask:(id)a3 forPluginID:(id)a4 completionHandler:(id)a5
{
}

+ (id)synchronouslyPerformTask:(id)a3 forPluginID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __64__MLROnDemandPlugin_synchronouslyPerformTask_forPluginID_error___block_invoke;
  v13[3] = &unk_2643F1FE0;
  v13[4] = &v20;
  v13[5] = &v14;
  [a1 _performTask:v8 forPluginID:v9 isSynchronous:1 completionHandler:v13];
  if (a5)
  {
    id v10 = (void *)v21[5];
    if (v10) {
      *a5 = v10;
    }
  }
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __64__MLROnDemandPlugin_synchronouslyPerformTask_forPluginID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)onDemandPluginIDs
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F04DE8] extensionPointIdentifierQuery:@"com.apple.mlruntime.extension-point-ondemand"];
  id v3 = [MEMORY[0x263F04DF0] executeQuery:v2];
  v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "bundleIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)_performTask:(NSObject *)a3 forPluginID:isSynchronous:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_21C376000, a2, a3, "Fail to create XPC connection: plugin=%@, error=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_1(&dword_21C376000, v0, v1, "Fail to perform task: plugin=%@, error=%@, isSynchronous=%D");
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_1(&dword_21C376000, v0, v1, "Fail to perform task: plugin=%@, error=%@, isSynchronous=%d");
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_59_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_21C376000, v0, OS_LOG_TYPE_DEBUG, "plugin=(%@) return result=%@", v1, 0x16u);
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_59_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_21C376000, v0, v1, "Fail to perform task: plugin=%@, error=%@");
}

@end