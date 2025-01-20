@interface _ShellLauncher
- (_ShellLauncher)init;
- (void)_queue_completeWithPid:(int)a3 error:(id)a4;
- (void)_queue_launchWithCompletion:(id)a3;
- (void)_queue_launchWithRetries:(int)a3;
- (void)launchWithCompletion:(id)a3;
@end

@implementation _ShellLauncher

- (_ShellLauncher)init
{
  v8.receiver = self;
  v8.super_class = (Class)_ShellLauncher;
  v2 = [(_ShellLauncher *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PreviewShellLauncherQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_launching = 0;
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    launchCompletions = v2->_launchCompletions;
    v2->_launchCompletions = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)launchWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23091A730;
  v7[3] = &unk_264B908C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_queue_launchWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    launchCompletions = self->_launchCompletions;
    v7 = _Block_copy(v4);
    [(NSMutableArray *)launchCompletions addObject:v7];
  }
  BOOL launching = self->_launching;
  v9 = DTUVPreviewServiceLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (launching)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23087D000, v9, OS_LOG_TYPE_INFO, "Launch/connect to preview shell already underway; not initiating new request",
        buf,
        2u);
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_23087D000, v9, OS_LOG_TYPE_INFO, "Initiating request to launch/connect to preview shell", v11, 2u);
    }

    self->_BOOL launching = 1;
    [(_ShellLauncher *)self _queue_launchWithRetries:3];
  }
}

- (void)_queue_launchWithRetries:(int)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_23091AA1C;
  aBlock[3] = &unk_264B8F178;
  int v15 = a3;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  uint64_t v5 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  uint64_t v18 = *MEMORY[0x263F3F528];
  v19[0] = &unk_26E5344B0;
  id v6 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v7 = (void *)MEMORY[0x263F3F778];
  uint64_t v8 = *MEMORY[0x263F3F5E8];
  v16[0] = *MEMORY[0x263F3F5A0];
  v16[1] = v8;
  v17[0] = v6;
  v17[1] = MEMORY[0x263EFFA88];
  v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  BOOL v10 = [v7 optionsWithDictionary:v9];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_23091AB48;
  v12[3] = &unk_264B90918;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [v5 openApplication:@"com.apple.PreviewShell" withOptions:v10 completion:v12];
}

- (void)_queue_completeWithPid:(int)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_launchCompletions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->_launchCompletions removeAllObjects];
  self->_BOOL launching = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchCompletions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end