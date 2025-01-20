@interface HDDaemonDiagnosticOperation
- (id)_daemonUserDefaultValueForKey:(id)a3;
- (id)reportFilename;
- (void)run;
@end

@implementation HDDaemonDiagnosticOperation

- (id)reportFilename
{
  return @"HealthDaemon.txt";
}

- (void)run
{
  id v3 = objc_alloc_init(MEMORY[0x263F0A410]);
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A308]) initWithHealthStore:v3];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __34__HDDaemonDiagnosticOperation_run__block_invoke;
  v23[3] = &unk_264866C80;
  v25 = &v26;
  v23[4] = self;
  v6 = v5;
  v24 = v6;
  [v4 fetchDiagnosticsForKeys:MEMORY[0x263EFFA68] completion:v23];
  v7 = [MEMORY[0x263F0A980] sharedBehavior];
  if ([v7 isAppleInternalInstall]) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  [(HDDiagnosticOperation *)self appendFormat:@"Apple Internal: %s", v8];
  int v9 = [v7 futureMigrationsEnabled];
  v10 = "disabled";
  if (v9) {
    v10 = "ENABLED";
  }
  [(HDDiagnosticOperation *)self appendFormat:@"Future Migrations: %s", v10];
  if ([v7 isRunningStoreDemoMode]) {
    v11 = "YES";
  }
  else {
    v11 = "NO";
  }
  [(HDDiagnosticOperation *)self appendFormat:@"Store Demo Mode: %s", v11];
  if ([v7 isTestingDevice]) {
    v12 = "YES";
  }
  else {
    v12 = "NO";
  }
  [(HDDiagnosticOperation *)self appendFormat:@"Testing Device: %s", v12];
  if ([MEMORY[0x263F0A990] usingDemoDataDatabase]) {
    v13 = "YES";
  }
  else {
    v13 = "NO";
  }
  [(HDDiagnosticOperation *)self appendFormat:@"Using Demo Data Database: %s", v13];
  [(HDDiagnosticOperation *)self appendNewline];
  v14 = [MEMORY[0x263F43168] backupInfoUserDefaultsKey];
  v15 = [(HDDaemonDiagnosticOperation *)self _daemonUserDefaultValueForKey:v14];

  if (v15) {
    [(HDDiagnosticOperation *)self appendFormat:@"Authorization Backup Info: %@", v15];
  }
  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v16)) {
    [(HDDiagnosticOperation *)self log:@"Timed out attempting collect healthd diagnostics."];
  }
  if (v27[5])
  {
    v17 = [(HDDiagnosticOperation *)self attachmentDirectoryURL];
    v18 = [v17 URLByAppendingPathComponent:@"healthd-diagnostics.txt"];

    v19 = (void *)v27[5];
    id v22 = 0;
    char v20 = [v19 writeToURL:v18 atomically:1 encoding:4 error:&v22];
    id v21 = v22;
    if (v20) {
      [(HDDiagnosticOperation *)self log:@"Successfully captured healthd diagnostics to 'healthd-diagnostics.txt'."];
    }
    else {
      [(HDDiagnosticOperation *)self log:@"Failed to write out healthd diagnostics:\n%@", v27[5]];
    }
  }
  _Block_object_dispose(&v26, 8);
}

void __34__HDDaemonDiagnosticOperation_run__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else {
    [*(id *)(a1 + 32) log:@"Failed to collect healthd diagnostics: %@", a3];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_daemonUserDefaultValueForKey:(id)a3
{
  id v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)*MEMORY[0x263F0AD48], (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);
  return v3;
}

@end