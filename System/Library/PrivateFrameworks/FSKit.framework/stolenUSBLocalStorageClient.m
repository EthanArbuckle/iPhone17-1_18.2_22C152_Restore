@interface stolenUSBLocalStorageClient
+ (id)newManager;
- (id)loadVolumes:(id)a3 ofType:(id)a4 withError:(id *)a5;
@end

@implementation stolenUSBLocalStorageClient

+ (id)newManager
{
  return (id)[a1 newConnectionForService:@"machp://com.apple.filesystems.localLiveFiles"];
}

- (id)loadVolumes:(id)a3 ofType:(id)a4 withError:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[stolenUSBLocalStorageClient loadVolumes:ofType:withError:]();
  }

  v11 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke;
  v18[3] = &unk_26530B770;
  v18[4] = &v25;
  v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__stolenUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2;
  v17[3] = &unk_26530C2E8;
  v17[4] = &v25;
  v17[5] = &v19;
  [v12 addDisk:v8 fileSystemType:v9 reply:v17];
  if (v26[5] || ![(id)v20[5] count])
  {
    if (a5) {
      *a5 = (id) v26[5];
    }
  }
  else
  {
    v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = v20[5];
      *(_DWORD *)buf = 136315906;
      v32 = "-[stolenUSBLocalStorageClient loadVolumes:ofType:withError:]";
      __int16 v33 = 2112;
      id v34 = v8;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      uint64_t v38 = v16;
      _os_log_debug_impl(&dword_24DDB2000, v13, OS_LOG_TYPE_DEBUG, "%s:finish:%@:%@:%@", buf, 0x2Au);
    }
  }
  id v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (void)loadVolumes:ofType:withError:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_24DDB2000, v2, OS_LOG_TYPE_DEBUG, "%s:start:%@:%@", (uint8_t *)v3, 0x20u);
}

@end