@interface FIUIStateMachineExporter
+ (void)exportWithName:(id)a3 graphDescription:(id)a4;
@end

@implementation FIUIStateMachineExporter

+ (void)exportWithName:(id)a3 graphDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x263F0A980] isAppleInternalInstall])
  {
    v7 = dispatch_get_global_queue(17, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke;
    v8[3] = &unk_2644A7AF0;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, v8);
  }
}

void __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  v4 = (uint64_t *)(a1 + 32);
  id v5 = [NSString stringWithFormat:@"/%@.dot", *(void *)(a1 + 32)];
  id v6 = [v3 stringByAppendingPathComponent:v5];

  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x263F09970];
  v8 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *v4;
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21E433000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Writing finite state machine dot file to: %@", buf, 0x16u);
  }
  id v10 = *(void **)(a1 + 40);
  id v13 = 0;
  [v10 writeToFile:v6 atomically:0 encoding:4 error:&v13];
  id v11 = v13;
  if (v11)
  {
    _HKInitializeLogging();
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke_cold_1(v4, (uint64_t)v11, v12);
    }
  }
}

void __60__FIUIStateMachineExporter_exportWithName_graphDescription___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "[%@] Could not write finite state machine dot file with error: %@", (uint8_t *)&v4, 0x16u);
}

@end