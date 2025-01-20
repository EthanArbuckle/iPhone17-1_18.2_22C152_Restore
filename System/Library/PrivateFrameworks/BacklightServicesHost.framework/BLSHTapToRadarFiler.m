@interface BLSHTapToRadarFiler
+ (void)fileRadar:(id)a3 log:(id)a4 completion:(id)a5;
@end

@implementation BLSHTapToRadarFiler

+ (void)fileRadar:(id)a3 log:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke;
  block[3] = &unk_264532910;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) toURL];
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  id v7 = 0;
  [v3 openURL:v2 withOptions:MEMORY[0x263EFFA78] error:&v7];
  id v4 = v7;

  v5 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke_cold_1((uint64_t)v2, (uint64_t)v4, v5);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v2;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEFAULT, "filed Tap-To-Radar %@", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v4 == 0, v4);
  }
}

void __48__BLSHTapToRadarFiler_fileRadar_log_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "could not file Tap-To-Radar %@ %@", (uint8_t *)&v3, 0x16u);
}

@end