@interface DEDaemonHelper
+ (id)generateSandboxExtensionWithDestinationDir:(id)a3 pingTarget:(id)a4;
@end

@implementation DEDaemonHelper

+ (id)generateSandboxExtensionWithDestinationDir:(id)a3 pingTarget:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __72__DEDaemonHelper_generateSandboxExtensionWithDestinationDir_pingTarget___block_invoke;
  v39 = &unk_1E5D304B0;
  v41 = &v42;
  v8 = v7;
  v40 = v8;
  [v6 ping:&v36];
  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = Log_1();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[DEDaemonHelper generateSandboxExtensionWithDestinationDir:pingTarget:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_4:
    v18 = 0;
    goto LABEL_5;
  }
  if (!*((_DWORD *)v43 + 6))
  {
    v10 = Log_1();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[DEDaemonHelper generateSandboxExtensionWithDestinationDir:pingTarget:](v10, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_4;
  }
  v20 = objc_msgSend(v5, "generateSandboxExtensionForProcess:", v36, v37, v38, v39);
  v10 = v20;
  if (!v20 || ![v20 length])
  {
    v21 = Log_1();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[DEDaemonHelper generateSandboxExtensionWithDestinationDir:pingTarget:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

    goto LABEL_4;
  }
  v10 = v10;
  v18 = v10;
LABEL_5:

  _Block_object_dispose(&v42, 8);
  return v18;
}

intptr_t __72__DEDaemonHelper_generateSandboxExtensionWithDestinationDir_pingTarget___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)generateSandboxExtensionWithDestinationDir:(uint64_t)a3 pingTarget:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)generateSandboxExtensionWithDestinationDir:(uint64_t)a3 pingTarget:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)generateSandboxExtensionWithDestinationDir:(uint64_t)a3 pingTarget:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end