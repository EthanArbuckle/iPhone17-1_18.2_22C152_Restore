@interface MLCloudDeploymentUtils
+ (id)extractTeamIdentifierAndReturnError:(id *)a3;
@end

@implementation MLCloudDeploymentUtils

+ (id)extractTeamIdentifierAndReturnError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CoreMLModelSecurityService"];
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF14E7D0];
  [v4 setRemoteObjectInterface:v5];

  [v4 setInterruptionHandler:&__block_literal_global_23043];
  [v4 setInvalidationHandler:&__block_literal_global_85_23044];
  [v4 resume];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23045;
  v20 = __Block_byref_object_dispose__23046;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_86;
  v15[3] = &unk_1E59A5008;
  v15[4] = &v16;
  v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v7 = (void *)v17[5];
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v17[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = @"com.apple.CoreMLModelSecurityService";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Could not create connection to %@ : error=%@", buf, 0x16u);
    }

    [v4 invalidate];
    id v9 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v25 = __Block_byref_object_copy__23045;
    v26 = __Block_byref_object_dispose__23046;
    id v27 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_88;
    v14[3] = &unk_1E59A5030;
    v14[4] = buf;
    v14[5] = &v16;
    [v6 extractTeamIdentifierWithReply:v14];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      [v4 invalidate];
      id v9 = *(id *)(*(void *)&buf[8] + 40);
    }
    else
    {
      if (a3) {
        *a3 = (id) v17[5];
      }
      v10 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = v17[5];
        *(_DWORD *)v22 = 138412290;
        uint64_t v23 = v13;
        _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Could not create team identifier error=%@", v22, 0xCu);
      }

      [v4 invalidate];
      id v9 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_86(uint64_t a1, void *a2)
{
}

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_83()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered invalidationHandler!", v1, 2u);
  }
}

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered interruptionHandler!", v1, 2u);
  }
}

@end