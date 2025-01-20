@interface ABCFileCleaner
- (ABCFileCleaner)initWithQueue:(id)a3;
- (NSArray)filesToDelete;
- (NetDiagnosticsShim)netDiags;
- (OS_dispatch_queue)queue;
- (SymptomsFileCleanerDelegate)delegate;
- (void)cleanupFiles:(id)a3;
- (void)netDiagnosticTaskStatusChangedFor:(id)a3 toStatus:(int)a4;
- (void)setDelegate:(id)a3;
- (void)setFilesToDelete:(id)a3;
- (void)setNetDiags:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ABCFileCleaner

- (ABCFileCleaner)initWithQueue:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ABCFileCleaner;
  v5 = [(ABCFileCleaner *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      queue = v5->_queue;
      v5->_queue = v6;
    }
    else
    {
      queue = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.symptoms.autobugcapture.cleanup", queue);
      v9 = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v8;
    }
    v10 = [[NetDiagnosticsShim alloc] initWithTaskName:@"deletefilesforsymptoms" queue:v5->_queue];
    netDiags = v5->_netDiags;
    v5->_netDiags = v10;

    [(NetDiagnosticsShim *)v5->_netDiags setDelegate:v5];
  }

  return v5;
}

- (void)cleanupFiles:(id)a3
{
  id v4 = a3;
  [(ABCFileCleaner *)self setFilesToDelete:v4];
  v5 = [(ABCFileCleaner *)self netDiags];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    [v6 setObject:@"deletefilesforsymptoms" forKeyedSubscript:@"taskName"];
    [v6 setObject:v4 forKeyedSubscript:@"taskFileDicts"];
    v7 = [(ABCFileCleaner *)self queue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __31__ABCFileCleaner_cleanupFiles___block_invoke;
    v9[3] = &unk_263FC3430;
    id v10 = v5;
    id v11 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

uint64_t __31__ABCFileCleaner_cleanupFiles___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startNetDiagnosticTaskWithOptions:*(void *)(a1 + 40) reply:&__block_literal_global_2];
}

void __31__ABCFileCleaner_cleanupFiles___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  v6 = symptomsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "SymptomsFileCleaner NetDiagnosticShim start called:%@ error:%@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)netDiagnosticTaskStatusChangedFor:(id)a3 toStatus:(int)a4
{
  int v6 = [a3 isEqualToString:@"deletefilesforsymptoms"];
  if (a4 == 3 && v6)
  {
    int v7 = symptomsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Completed kNetDiagTaskDeleteFilesForSymptoms", v11, 2u);
    }

    id v8 = [(ABCFileCleaner *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(ABCFileCleaner *)self delegate];
      [v10 fileCleanupComplete];
    }
    [(NetDiagnosticsShim *)self->_netDiags setDelegate:0];
  }
}

- (SymptomsFileCleanerDelegate)delegate
{
  return (SymptomsFileCleanerDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NetDiagnosticsShim)netDiags
{
  return (NetDiagnosticsShim *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetDiags:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSArray)filesToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFilesToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesToDelete, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_netDiags, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end