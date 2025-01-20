@interface COConditionTask
- (BOOL)launchTask:(id *)a3;
- (BOOL)resume;
- (BOOL)running;
- (BOOL)slowTimeout;
- (BOOL)start;
- (BOOL)suspend;
- (BOOL)waitForTaskWithTimeout:(unsigned int)a3;
- (COConditionTask)initWithCommand:(id)a3 arguments:(id)a4;
- (NSArray)arguments;
- (NSFileHandle)stderrFileHandle;
- (NSFileHandle)stdinFileHandle;
- (NSFileHandle)stdoutFileHandle;
- (NSMutableArray)taskFileHandleArray;
- (NSString)launchPath;
- (NSString)stderrFname;
- (NSString)stdinFname;
- (NSString)stdoutFname;
- (OS_dispatch_queue)taskQueue;
- (OS_dispatch_semaphore)termination_sem;
- (double)executionTime;
- (id)description;
- (id)stderrFromResults;
- (id)stdoutFromResults;
- (int)endStatus;
- (int)processIdentifier;
- (int)signalRunningTask:(int)a3;
- (void)interrupt;
- (void)setArguments:(id)a3;
- (void)setEndStatus:(int)a3;
- (void)setExecutionTime:(double)a3;
- (void)setLaunchPath:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSlowTimeout:(BOOL)a3;
- (void)setStderrFileHandle:(id)a3;
- (void)setStderrFname:(id)a3;
- (void)setStdinFileHandle:(id)a3;
- (void)setStdinFname:(id)a3;
- (void)setStdoutFileHandle:(id)a3;
- (void)setStdoutFname:(id)a3;
- (void)setTaskFileHandleArray:(id)a3;
- (void)setTaskQueue:(id)a3;
- (void)setTermination_sem:(id)a3;
- (void)stderrFromResults;
- (void)stdoutFromResults;
- (void)stop;
- (void)stopTask;
- (void)terminate;
- (void)waitForExitInformation:(int)a3;
@end

@implementation COConditionTask

- (COConditionTask)initWithCommand:(id)a3 arguments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[COConditionTask initWithCommand:arguments:]((uint64_t)v7, v8);
  }
  v41.receiver = self;
  v41.super_class = (Class)COConditionTask;
  v9 = [(COConditionTask *)&v41 init];
  if (v9)
  {
    v10 = [MEMORY[0x263F08C38] UUID];
    v11 = [v10 UUIDString];

    id v12 = [NSString alloc];
    v13 = [v7 lastPathComponent];
    uint64_t v14 = [v12 initWithFormat:@"/tmp/%@.%@.stdout.txt", v13, v11];
    stdoutFname = v9->_stdoutFname;
    v9->_stdoutFname = (NSString *)v14;

    id v16 = [NSString alloc];
    v17 = [v7 lastPathComponent];
    uint64_t v18 = [v16 initWithFormat:@"/tmp/%@.%@.stderr.txt", v17, v11];
    stderrFname = v9->_stderrFname;
    v9->_stderrFname = (NSString *)v18;

    id v20 = [NSString alloc];
    v21 = [v7 lastPathComponent];
    uint64_t v22 = [v20 initWithFormat:@"/tmp/%@.%@.stdin.txt", v21, v11];
    stdinFname = v9->_stdinFname;
    v9->_stdinFname = (NSString *)v22;

    uint64_t v24 = open([(NSString *)v9->_stdinFname fileSystemRepresentation], 514, 438);
    if (v24 != -1)
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v24];
      stdinFileHandle = v9->_stdinFileHandle;
      v9->_stdinFileHandle = (NSFileHandle *)v25;
    }
    uint64_t v27 = open([(NSString *)v9->_stdoutFname fileSystemRepresentation], 514, 438);
    if (v27 != -1)
    {
      uint64_t v28 = [objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v27];
      stdoutFileHandle = v9->_stdoutFileHandle;
      v9->_stdoutFileHandle = (NSFileHandle *)v28;
    }
    uint64_t v30 = open([(NSString *)v9->_stderrFname fileSystemRepresentation], 514, 438);
    if (v30 != -1)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v30];
      stderrFileHandle = v9->_stderrFileHandle;
      v9->_stderrFileHandle = (NSFileHandle *)v31;
    }
    if (!v9->_stdinFileHandle || !v9->_stdoutFileHandle || !v8 || !v7 || !v9->_stderrFileHandle)
    {

      v39 = 0;
      goto LABEL_18;
    }
    v9->_processIdentifier = -1;
    objc_storeStrong((id *)&v9->_launchPath, a3);
    objc_storeStrong((id *)&v9->_arguments, a4);
    dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
    termination_sem = v9->_termination_sem;
    v9->_termination_sem = (OS_dispatch_semaphore *)v33;

    dispatch_queue_t v35 = dispatch_queue_create("com.apple.ConditionInducer.common", 0);
    taskQueue = v9->_taskQueue;
    v9->_taskQueue = (OS_dispatch_queue *)v35;

    uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v9->_stdinFileHandle, v9->_stdoutFileHandle, v9->_stderrFileHandle, 0);
    taskFileHandleArray = v9->_taskFileHandleArray;
    v9->_taskFileHandleArray = (NSMutableArray *)v37;
  }
  v39 = v9;
LABEL_18:

  return v39;
}

- (void)waitForExitInformation:(int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v12 = 0;
  memset(&v11, 0, sizeof(v11));
  while (wait4(a3, &v12, 4, &v11) == -1 && *__error() == 4)
    ;
  unsigned int v5 = v12;
  if ((v12 & 0x7F) == 0x7F)
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (v5 >> 8 == 19)
    {
      if (v10)
      {
        v6 = [(COConditionTask *)self launchPath];
        id v7 = [v6 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = v7;
        __int16 v15 = 1024;
        int v16 = v12;
        id v8 = &_os_log_internal;
        v9 = "Unknown state of child process '%@' with wstatus %04x";
        goto LABEL_15;
      }
    }
    else if (v10)
    {
      v6 = [(COConditionTask *)self launchPath];
      id v7 = [v6 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 1024;
      int v16 = v12 >> 8;
      id v8 = &_os_log_internal;
      v9 = "Child process '%@' stopped (but did not terminate) due to signal %d";
      goto LABEL_15;
    }
  }
  else if ((v12 & 0x7F) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      v6 = [(COConditionTask *)self launchPath];
      id v7 = [v6 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 1024;
      int v16 = v12 & 0x7F;
      id v8 = &_os_log_internal;
      v9 = "Child process '%@' terminated due to signal %d";
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v6 = [(COConditionTask *)self launchPath];
    id v7 = [v6 lastPathComponent];
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 1024;
    int v16 = BYTE1(v12);
    id v8 = &_os_log_internal;
    v9 = "Child process '%@' exited with status %d";
LABEL_15:
    _os_log_impl(&dword_22CE75000, v8, OS_LOG_TYPE_INFO, v9, buf, 0x12u);
  }
  -[COConditionTask setRunning:](self, "setRunning:", 0, *(_OWORD *)&v11.ru_utime, *(_OWORD *)&v11.ru_stime, *(_OWORD *)&v11.ru_maxrss, *(_OWORD *)&v11.ru_idrss, *(_OWORD *)&v11.ru_minflt, *(_OWORD *)&v11.ru_nswap, *(_OWORD *)&v11.ru_oublock, *(_OWORD *)&v11.ru_msgrcv, *(_OWORD *)&v11.ru_nvcsw);
  [(COConditionTask *)self setEndStatus:BYTE1(v12)];
}

- (BOOL)waitForTaskWithTimeout:(unsigned int)a3
{
  if ([(COConditionTask *)self running]
    && (!a3 ? (dispatch_time_t v5 = -1) : (dispatch_time_t v5 = dispatch_time(0, 1000000000 * a3)),
        [(COConditionTask *)self termination_sem],
        v6 = objc_claimAutoreleasedReturnValue(),
        intptr_t v7 = dispatch_semaphore_wait(v6, v5),
        v6,
        v7))
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      -[COConditionTask waitForTaskWithTimeout:](self);
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)launchTask:(id *)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  pid_t v78 = -1;
  posix_spawnattr_t v76 = 0;
  posix_spawn_file_actions_t v77 = 0;
  v4 = [(COConditionTask *)self taskQueue];
  dispatch_assert_queue_V2(v4);

  if ([(COConditionTask *)self running])
  {
    dispatch_time_t v5 = 0;
    v6 = 0;
LABEL_3:
    BOOL v7 = 1;
    goto LABEL_36;
  }
  BOOL v8 = [(COConditionTask *)self launchPath];

  if (!v8)
  {
    BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v26) {
      -[COConditionTask launchTask:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_24;
  }
  v9 = [(COConditionTask *)self arguments];
  BOOL v10 = (char **)malloc_type_calloc([v9 count] + 2, 8uLL, 0x10040436913F5uLL);

  if (!v10)
  {
    BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v34) {
      -[COConditionTask launchTask:](v34, v35, v36, v37, v38, v39, v40, v41);
    }
LABEL_24:
    dispatch_time_t v5 = 0;
    v6 = 0;
LABEL_35:
    BOOL v7 = 0;
    goto LABEL_36;
  }
  id v11 = [(COConditionTask *)self launchPath];
  v65 = v10;
  void *v10 = (char *)[v11 fileSystemRepresentation];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  int v12 = [(COConditionTask *)self arguments];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = 0;
    uint64_t v16 = *(void *)v73;
    uint64_t v17 = v10 + 1;
    do
    {
      uint64_t v18 = 0;
      int v19 = v15;
      id v20 = &v17[v15];
      do
      {
        if (*(void *)v73 != v16) {
          objc_enumerationMutation(v12);
        }
        v21 = *(void **)(*((void *)&v72 + 1) + 8 * v18);
        if (objc_msgSend(v21, "length", v65)) {
          uint64_t v22 = (const char *)[v21 fileSystemRepresentation];
        }
        else {
          uint64_t v22 = "";
        }
        v20[v18++] = v22;
      }
      while (v14 != v18);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v72 objects:v83 count:16];
      int v15 = v19 + v18;
    }
    while (v14);
  }

  posix_spawn_file_actions_init(&v77);
  if (v77)
  {
    v23 = [(COConditionTask *)self taskFileHandleArray];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    int v25 = posix_spawn_file_actions_adddup2(&v77, [v24 fileDescriptor], 0);

    if (v25)
    {
      v6 = (char **)v65;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_33:
      }
        -[COConditionTask launchTask:].cold.7(v25);
    }
    else
    {
      v42 = [(COConditionTask *)self taskFileHandleArray];
      v43 = [v42 objectAtIndexedSubscript:1];
      int v25 = posix_spawn_file_actions_adddup2(&v77, [v43 fileDescriptor], 1);

      if (v25)
      {
        v6 = (char **)v65;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
      }
      else
      {
        v44 = [(COConditionTask *)self taskFileHandleArray];
        v45 = [v44 objectAtIndexedSubscript:2];
        int v25 = posix_spawn_file_actions_adddup2(&v77, [v45 fileDescriptor], 2);

        v6 = (char **)v65;
        if (!v25)
        {
          posix_spawnattr_t v76 = copyPOSIXSpawnAttributes();
          if (v76)
          {
            signal(20, 0);
            id v47 = [(COConditionTask *)self launchPath];
            v48 = (const char *)[v47 fileSystemRepresentation];
            v49 = _NSGetEnviron();
            int v50 = posix_spawn(&v78, v48, &v77, &v76, v65, *v49);

            if (v50)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[COConditionTask launchTask:].cold.6(v50);
              }
            }
            else
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
              {
                v59 = [(COConditionTask *)self launchPath];
                v60 = [(COConditionTask *)self arguments];
                v61 = [v60 componentsJoinedByString:@" "];
                *(_DWORD *)buf = 138412546;
                v80 = v59;
                __int16 v81 = 2112;
                v82 = v61;
                _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Spawned %@ with arguments: %@.", buf, 0x16u);
              }
              pid_t v62 = v78;
              -[COConditionTask setProcessIdentifier:](self, "setProcessIdentifier:", v78, v65);
              [(COConditionTask *)self setRunning:1];
              v63 = dispatch_get_global_queue(0, 0);
              dispatch_source_t v64 = dispatch_source_create(MEMORY[0x263EF83E0], v62, 0x80000000uLL, v63);

              if (v64)
              {
                handler[0] = MEMORY[0x263EF8330];
                handler[1] = 3221225472;
                handler[2] = __30__COConditionTask_launchTask___block_invoke;
                handler[3] = &unk_264935B00;
                dispatch_time_t v5 = v64;
                v69 = v5;
                v70 = self;
                pid_t v71 = v62;
                dispatch_source_set_event_handler(v5, handler);
                v66[0] = MEMORY[0x263EF8330];
                v66[1] = 3221225472;
                v66[2] = __30__COConditionTask_launchTask___block_invoke_2;
                v66[3] = &unk_264935B28;
                pid_t v67 = v62;
                v66[4] = self;
                dispatch_source_set_registration_handler(v5, v66);

                dispatch_resume(v5);
                goto LABEL_3;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[COConditionTask launchTask:].cold.5(v62);
              }
            }
          }
          else
          {
            BOOL v51 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v51) {
              -[COConditionTask launchTask:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
            }
          }
          goto LABEL_34;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
      }
    }
LABEL_34:
    dispatch_time_t v5 = 0;
    goto LABEL_35;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[COConditionTask launchTask:]();
  }
  dispatch_time_t v5 = 0;
  BOOL v7 = 0;
  v6 = (char **)v65;
LABEL_36:
  if (v76) {
    posix_spawnattr_destroy(&v76);
  }
  if (v77) {
    posix_spawn_file_actions_destroy(&v77);
  }
  if (v6) {
    free(v6);
  }

  return v7;
}

void __30__COConditionTask_launchTask___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  [*(id *)(a1 + 40) waitForExitInformation:*(unsigned int *)(a1 + 48)];
  v2 = objc_msgSend(*(id *)(a1 + 40), "termination_sem");

  if (v2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "termination_sem");
    dispatch_semaphore_signal(v3);
  }
}

void __30__COConditionTask_launchTask___block_invoke_2(uint64_t a1)
{
  if (kill(*(_DWORD *)(a1 + 40), 19))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __30__COConditionTask_launchTask___block_invoke_2_cold_1(a1);
    }
  }
}

- (void)stopTask
{
  *(void *)&v31[5] = *MEMORY[0x263EF8340];
  v3 = [(COConditionTask *)self taskQueue];
  dispatch_assert_queue_V2(v3);

  if (![(COConditionTask *)self running]) {
    return;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v4 = [(COConditionTask *)self description];
    int v30 = 138412290;
    *(void *)uint64_t v31 = v4;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "Stopping task %@", (uint8_t *)&v30, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v5 = [(COConditionTask *)self launchPath];
    v6 = [v5 lastPathComponent];
    int v30 = 138412290;
    *(void *)uint64_t v31 = v6;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "-->\tInterrupting: '%@'", (uint8_t *)&v30, 0xCu);
  }
  [(COConditionTask *)self interrupt];
  if ([(COConditionTask *)self slowTimeout]) {
    useconds_t v7 = 5500000;
  }
  else {
    useconds_t v7 = 500000;
  }
  usleep(v7);
  BOOL v8 = [(COConditionTask *)self running];
  BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (!v9) {
      return;
    }
    v23 = [(COConditionTask *)self launchPath];
    uint64_t v24 = [v23 lastPathComponent];
    int v30 = 138412290;
    *(void *)uint64_t v31 = v24;
    int v25 = &_os_log_internal;
    BOOL v26 = "-->\tInterrupted: '%@'";
    goto LABEL_29;
  }
  if (v9)
  {
    BOOL v10 = [(COConditionTask *)self launchPath];
    id v11 = [v10 lastPathComponent];
    int v30 = 138412290;
    *(void *)uint64_t v31 = v11;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "-->\tTerminating: '%@'", (uint8_t *)&v30, 0xCu);
  }
  [(COConditionTask *)self terminate];
  if ([(COConditionTask *)self slowTimeout]) {
    useconds_t v12 = 2750000;
  }
  else {
    useconds_t v12 = 250000;
  }
  usleep(v12);
  BOOL v13 = [(COConditionTask *)self running];
  BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
  if (!v13)
  {
    if (!v14) {
      return;
    }
LABEL_28:
    v23 = [(COConditionTask *)self launchPath];
    uint64_t v24 = [v23 lastPathComponent];
    int v30 = 138412290;
    *(void *)uint64_t v31 = v24;
    int v25 = &_os_log_internal;
    BOOL v26 = "-->\tTerminated: '%@'";
LABEL_29:
    _os_log_impl(&dword_22CE75000, v25, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v30, 0xCu);

    return;
  }
  if (v14)
  {
    int v15 = [(COConditionTask *)self launchPath];
    uint64_t v16 = [v15 lastPathComponent];
    int v30 = 138412290;
    *(void *)uint64_t v31 = v16;
    _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "-->\tTask is taking a while to terminate: '%@'", (uint8_t *)&v30, 0xCu);
  }
  sleep(3u);
  if (![(COConditionTask *)self running])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      return;
    }
    goto LABEL_28;
  }
  int v17 = [(COConditionTask *)self processIdentifier];
  BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
  if (v17 <= 0)
  {
    if (v18)
    {
      int v27 = [(COConditionTask *)self processIdentifier];
      uint64_t v28 = [(COConditionTask *)self launchPath];
      uint64_t v29 = [v28 lastPathComponent];
      int v30 = 67109378;
      v31[0] = v27;
      LOWORD(v31[1]) = 2112;
      *(void *)((char *)&v31[1] + 2) = v29;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "-->\t*** [self.task processIdentifier] returned %d; assuming process is dead: '%@'",
        (uint8_t *)&v30,
        0x12u);
    }
  }
  else
  {
    if (v18)
    {
      int v19 = [(COConditionTask *)self processIdentifier];
      id v20 = [(COConditionTask *)self launchPath];
      v21 = [v20 lastPathComponent];
      int v30 = 67109378;
      v31[0] = v19;
      LOWORD(v31[1]) = 2112;
      *(void *)((char *)&v31[1] + 2) = v21;
      _os_log_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_INFO, "-->\tKilling (pid %d): '%@'", (uint8_t *)&v30, 0x12u);
    }
    [(COConditionTask *)self signalRunningTask:9];
    uint64_t v22 = [(COConditionTask *)self termination_sem];
    dispatch_semaphore_signal(v22);
  }
}

- (id)stdoutFromResults
{
  v3 = NSString;
  v4 = [(COConditionTask *)self stdoutFname];
  id v9 = 0;
  dispatch_time_t v5 = [v3 stringWithContentsOfFile:v4 encoding:4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionTask stdoutFromResults](self);
    }
    useconds_t v7 = &stru_26E04D128;
  }
  else
  {
    useconds_t v7 = v5;
  }

  return v7;
}

- (id)stderrFromResults
{
  v3 = NSString;
  v4 = [(COConditionTask *)self stderrFname];
  id v9 = 0;
  dispatch_time_t v5 = [v3 stringWithContentsOfFile:v4 encoding:4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionTask stderrFromResults](self);
    }
    useconds_t v7 = &stru_26E04D128;
  }
  else
  {
    useconds_t v7 = v5;
  }

  return v7;
}

- (BOOL)start
{
  v2 = self;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy_;
  v6[4] = __Block_byref_object_dispose_;
  id v7 = 0;
  v3 = [(COConditionTask *)self taskQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__COConditionTask_start__block_invoke;
  block[3] = &unk_264935B50;
  block[4] = v2;
  block[5] = &v8;
  block[6] = v6;
  dispatch_sync(v3, block);

  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __24__COConditionTask_start__block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 launchTask:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (void)stop
{
  uint64_t v3 = [(COConditionTask *)self taskQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__COConditionTask_stop__block_invoke;
  block[3] = &unk_264935B78;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __23__COConditionTask_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTask];
}

- (void)terminate
{
}

- (void)interrupt
{
}

- (BOOL)suspend
{
  return [(COConditionTask *)self signalRunningTask:17] == 0;
}

- (BOOL)resume
{
  return [(COConditionTask *)self signalRunningTask:19] == 0;
}

- (int)signalRunningTask:(int)a3
{
  return killpg(self->_processIdentifier, a3);
}

- (id)description
{
  uint64_t v3 = NSString;
  char v4 = [(COConditionTask *)self launchPath];
  dispatch_time_t v5 = [(COConditionTask *)self arguments];
  id v6 = [v5 componentsJoinedByString:@" "];
  id v7 = [v3 stringWithFormat:@"%@ %@ (running with PID: %d)", v4, v6, -[COConditionTask processIdentifier](self, "processIdentifier")];

  return v7;
}

- (int)endStatus
{
  return self->_endStatus;
}

- (void)setEndStatus:(int)a3
{
  self->_endStatus = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_semaphore)termination_sem
{
  return self->_termination_sem;
}

- (void)setTermination_sem:(id)a3
{
}

- (NSString)launchPath
{
  return self->_launchPath;
}

- (void)setLaunchPath:(id)a3
{
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSMutableArray)taskFileHandleArray
{
  return self->_taskFileHandleArray;
}

- (void)setTaskFileHandleArray:(id)a3
{
}

- (NSString)stdoutFname
{
  return self->_stdoutFname;
}

- (void)setStdoutFname:(id)a3
{
}

- (NSString)stderrFname
{
  return self->_stderrFname;
}

- (void)setStderrFname:(id)a3
{
}

- (NSString)stdinFname
{
  return self->_stdinFname;
}

- (void)setStdinFname:(id)a3
{
}

- (NSFileHandle)stdinFileHandle
{
  return self->_stdinFileHandle;
}

- (void)setStdinFileHandle:(id)a3
{
}

- (NSFileHandle)stdoutFileHandle
{
  return self->_stdoutFileHandle;
}

- (void)setStdoutFileHandle:(id)a3
{
}

- (NSFileHandle)stderrFileHandle
{
  return self->_stderrFileHandle;
}

- (void)setStderrFileHandle:(id)a3
{
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (BOOL)slowTimeout
{
  return self->_slowTimeout;
}

- (void)setSlowTimeout:(BOOL)a3
{
  self->_slowTimeout = a3;
}

- (OS_dispatch_queue)taskQueue
{
  return self->_taskQueue;
}

- (void)setTaskQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_stderrFileHandle, 0);
  objc_storeStrong((id *)&self->_stdoutFileHandle, 0);
  objc_storeStrong((id *)&self->_stdinFileHandle, 0);
  objc_storeStrong((id *)&self->_stdinFname, 0);
  objc_storeStrong((id *)&self->_stderrFname, 0);
  objc_storeStrong((id *)&self->_stdoutFname, 0);
  objc_storeStrong((id *)&self->_taskFileHandleArray, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_launchPath, 0);

  objc_storeStrong((id *)&self->_termination_sem, 0);
}

- (void)initWithCommand:(uint64_t)a1 arguments:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 componentsJoinedByString:@" "];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_debug_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "COCondition Task Create: %@, %@", (uint8_t *)&v4, 0x16u);
}

- (void)waitForTaskWithTimeout:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 launchPath];
  v2 = [v1 lastPathComponent];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v3, "%@ failed to complete within %d seconds.", v4, v5, v6, v7, v8);
}

- (void)launchTask:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchTask:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchTask:.cold.3()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v1, "posix_spawn_file_actions_init failed: %d (%s)", v2, v3, v4, v5, v6);
}

- (void)launchTask:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchTask:(int)a1 .cold.5(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create dispatch source for pid %d.", (uint8_t *)v1, 8u);
}

- (void)launchTask:(int)a1 .cold.6(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v1, "posix_spawn failed: %d (%s)", v2, v3, v4, v5, v6);
}

- (void)launchTask:(int)a1 .cold.7(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CE75000, &_os_log_internal, v1, "posix_spawn_file_actions_adddup2 failed: %d (%s)", v2, v3, v4, v5, v6);
}

void __30__COConditionTask_launchTask___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) launchPath];
  uint64_t v2 = [v1 lastPathComponent];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v3, "Error resuming process %@.", v4, v5, v6, v7, v8);
}

- (void)stdoutFromResults
{
  uint64_t v1 = [a1 stdoutFname];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v2, "Failed to read from %@", v3, v4, v5, v6, v7);
}

- (void)stderrFromResults
{
  uint64_t v1 = [a1 stderrFname];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v2, "Failed to read from %@", v3, v4, v5, v6, v7);
}

@end