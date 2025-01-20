@interface FPTask
+ (BOOL)exec:(id)a3 stdoutString:(id *)a4 stderrString:(id *)a5;
+ (id)sanitizeStringForFilename:(id)a3;
+ (id)taskWithArguments:(id)a3;
+ (id)taskWithCommand:(id)a3;
+ (id)taskWithCommandWithArguments:(id)a3;
+ (id)taskWithRedirectedOutputAndCommand:(id)a3;
- (FPTask)init;
- (NSArray)argv;
- (NSFileHandle)standardError;
- (NSFileHandle)standardOutput;
- (int)_prepareRedirections:(void *)a3;
- (int)exec;
- (int)execAsync;
- (int)waitStatus;
- (void)exec;
- (void)execAsync;
- (void)resetRedirect;
- (void)setArgv:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandWithArguments:(id)a3;
- (void)setStandardError:(id)a3;
- (void)setStandardOutput:(id)a3;
@end

@implementation FPTask

- (FPTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)FPTask;
  v2 = [(FPTask *)&v7 init];
  v3 = v2;
  if (v2)
  {
    standardOutput = v2->_standardOutput;
    v2->_standardOutput = 0;

    standardError = v3->_standardError;
    v3->_standardError = 0;
  }
  return v3;
}

+ (id)taskWithRedirectedOutputAndCommand:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v12];

  objc_super v7 = [a1 taskWithCommandWithArguments:v6];

  v8 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardError];
  [v7 setStandardError:v8];

  v9 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
  [v7 setStandardOutput:v9];

  return v7;
}

+ (id)taskWithCommand:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v10];

  objc_super v7 = [a1 taskWithCommandWithArguments:v6];

  return v7;
}

+ (id)taskWithCommandWithArguments:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FPTask);
  [(FPTask *)v4 setCommandWithArguments:v3];

  return v4;
}

+ (id)taskWithArguments:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setArgv:v4];

  return v5;
}

+ (id)sanitizeStringForFilename:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

    v6 = [v5 stringByReplacingOccurrencesOfString:@"\" withString:@"'""];
    objc_super v7 = ;

    v8 = [v7 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

    if (![(__CFString *)v8 length])
    {

      v8 = @"empty-string";
    }
  }
  else
  {
    v8 = @"nil";
  }

  return v8;
}

- (void)setCommand:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(FPTask *)self setCommandWithArguments:v6];
}

- (void)setCommandWithArguments:(id)a3
{
  id v19 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if (![v19 length]) {
    goto LABEL_22;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  int v7 = 0;
  int v8 = 0;
  uint64_t v9 = -1;
  uint64_t v10 = 1;
  do
  {
    int v11 = [v19 characterAtIndex:v5];
    if (v11 != 39 || (v7 & 1) != 0)
    {
      if ((v11 != 34) | v8 & 1)
      {
        BOOL v13 = v11 != 32;
        uint64_t v12 = v19;
        if ((v13 | v8 | v7)) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v12 = v19;
        if ((v7 & 1) == 0)
        {
          int v8 = 0;
          int v7 = 1;
          goto LABEL_17;
        }
      }
    }
    else
    {
      uint64_t v12 = v19;
      if ((v8 & 1) == 0)
      {
        int v7 = 0;
        int v8 = 1;
LABEL_17:
        uint64_t v9 = v5;
LABEL_18:
        uint64_t v17 = v10;
        goto LABEL_19;
      }
    }
    if (v10 != 1)
    {
      v14 = objc_msgSend(v12, "substringWithRange:", v6, v10 - 1);
      v15 = v14;
      if (v9 != -1)
      {
        uint64_t v16 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v9 - v6, 1, &stru_1EF68D1F8);

        v15 = (void *)v16;
      }
      [v4 addObject:v15];

      uint64_t v12 = v19;
    }
    int v7 = 0;
    int v8 = 0;
    uint64_t v17 = 0;
    v6 += v10;
    uint64_t v9 = -1;
LABEL_19:
    uint64_t v10 = v17 + 1;
    ++v5;
  }
  while (v5 < [v12 length]);
  if (v17)
  {
    v18 = objc_msgSend(v19, "substringWithRange:", v6, v17);
    [v4 addObject:v18];
  }
LABEL_22:
  [(FPTask *)self setArgv:v4];
}

- (int)_prepareRedirections:(void *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(FPTask *)self standardOutput];

  if (v5)
  {
    uint64_t v6 = [(FPTask *)self standardOutput];
    LODWORD(v7) = posix_spawn_file_actions_adddup2(a3, [v6 fileDescriptor], 1);

    if (v7)
    {
      int v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      goto LABEL_9;
    }
  }
  int v7 = [(FPTask *)self standardError];

  if (v7)
  {
    uint64_t v9 = [(FPTask *)self standardError];
    LODWORD(v7) = posix_spawn_file_actions_adddup2(a3, [v9 fileDescriptor], 2);

    if (v7)
    {
      int v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        int v11 = 136315138;
        uint64_t v12 = strerror((int)v7);
        _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to perform spawn action (%s).", (uint8_t *)&v11, 0xCu);
      }
LABEL_9:
    }
  }
  return (int)v7;
}

- (int)execAsync
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [(FPTask *)self argv];
  if (![v3 count]) {
    -[FPTask execAsync]();
  }

  id v4 = [(FPTask *)self argv];
  unint64_t v5 = (char **)malloc_type_malloc(8 * [v4 count] + 8, 0x50040EE9192B6uLL);

  uint64_t v6 = [(FPTask *)self argv];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(FPTask *)self argv];
      id v10 = [v9 objectAtIndex:v8];
      v5[v8] = (char *)[v10 fileSystemRepresentation];

      ++v8;
      int v11 = [(FPTask *)self argv];
      unint64_t v12 = [v11 count];
    }
    while (v8 < v12);
  }
  pid_t v36 = 0;
  uint64_t v13 = [(FPTask *)self argv];
  v5[[v13 count]] = 0;

  posix_spawn_file_actions_t v35 = 0;
  int v14 = posix_spawn_file_actions_init(&v35);
  if (v14)
  {
    int v15 = v14;
    uint64_t v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = strerror(v15);
      *(_DWORD *)buf = 136315138;
      v38 = v17;
      v18 = "[WARNING] Unable to initialize the file actions properly (%s).";
LABEL_11:
      _os_log_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  int v19 = [(FPTask *)self _prepareRedirections:&v35];
  if (v19)
  {
    int v20 = v19;
    uint64_t v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = strerror(v20);
      *(_DWORD *)buf = 136315138;
      v38 = v21;
      v18 = "[WARNING] Unable to setup redirections properly (%s).";
      goto LABEL_11;
    }
LABEL_12:

    int v22 = 0;
    goto LABEL_13;
  }
  v28 = [(FPTask *)self argv];
  id v29 = [v28 objectAtIndex:0];
  v30 = (const char *)[v29 fileSystemRepresentation];
  int v31 = posix_spawnp(&v36, v30, &v35, 0, v5, (char *const *)*MEMORY[0x1E4F147F0]);

  if (v31)
  {
    uint64_t v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [(FPTask *)self argv];
      v33 = [v32 componentsJoinedByString:@", "];
      v34 = strerror(v31);
      *(_DWORD *)buf = 138412546;
      v38 = v33;
      __int16 v39 = 2080;
      v40 = v34;
      _os_log_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to spawn a new process (argv: [%@], error: %s).", buf, 0x16u);
    }
    goto LABEL_12;
  }
  int v22 = 1;
LABEL_13:
  free(v5);
  int v23 = posix_spawn_file_actions_destroy(&v35);
  if (v23)
  {
    int v24 = v23;
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = strerror(v24);
      *(_DWORD *)buf = 136315138;
      v38 = v26;
      _os_log_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to destroy the file actions properly (%s).", buf, 0xCu);
    }
  }
  if (v22) {
    return v36;
  }
  else {
    return -1;
  }
}

- (int)exec
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [(FPTask *)self argv];
  if (![v3 count]) {
    -[FPTask exec]();
  }

  id v4 = [(FPTask *)self argv];
  unint64_t v5 = (char **)malloc_type_malloc(8 * [v4 count] + 8, 0x50040EE9192B6uLL);

  uint64_t v6 = [(FPTask *)self argv];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(FPTask *)self argv];
      id v10 = [v9 objectAtIndexedSubscript:v8];
      int v11 = [v10 hasPrefix:@"~"];

      unint64_t v12 = [(FPTask *)self argv];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v8];
      int v14 = v13;
      if (v11)
      {
        id v15 = [v13 stringByExpandingTildeInPath];
        v5[v8] = (char *)[v15 fileSystemRepresentation];
      }
      else
      {
        v5[v8] = (char *)[v13 UTF8String];
      }

      ++v8;
      uint64_t v16 = [(FPTask *)self argv];
      unint64_t v17 = [v16 count];
    }
    while (v8 < v17);
  }
  v18 = [(FPTask *)self argv];
  v5[[v18 count]] = 0;

  posix_spawn_file_actions_t v47 = 0;
  int v19 = posix_spawn_file_actions_init(&v47);
  if (v19)
  {
    int v20 = v19;
    v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = strerror(v20);
      *(_DWORD *)buf = 136315138;
      v49 = v22;
      _os_log_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to initialize the file actions properly (%s).", buf, 0xCu);
    }
  }
  int v23 = [(FPTask *)self _prepareRedirections:&v47];
  if (v23)
  {
    int v24 = v23;
    v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = strerror(v24);
      *(_DWORD *)buf = 136315138;
      v49 = v26;
      _os_log_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to setup redirections properly (%s).", buf, 0xCu);
    }
  }
  else
  {
    pid_t v45 = 0;
    v27 = signal(20, 0);
    sigset_t v46 = 2;
    pthread_sigmask(1, &v46, 0);
    v28 = [(FPTask *)self argv];
    id v29 = [v28 objectAtIndex:0];
    v30 = (const char *)[v29 fileSystemRepresentation];
    int v24 = posix_spawnp(&v45, v30, &v47, 0, v5, (char *const *)*MEMORY[0x1E4F147F0]);

    if (v24)
    {
      int v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(FPTask *)self argv];
        v33 = [v32 componentsJoinedByString:@", "];
        v34 = strerror(v24);
        *(_DWORD *)buf = 138412546;
        v49 = v33;
        __int16 v50 = 2080;
        v51 = v34;
        _os_log_impl(&dword_1A33AE000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to spawn a new process (argv: [%@], error: %s).", buf, 0x16u);
      }
      self->_waitStatus = 0;
    }
    else
    {
      posix_spawn_file_actions_t v35 = dispatch_get_global_queue(0, 0);
      pid_t v36 = dispatch_source_create(MEMORY[0x1E4F14480], 2uLL, 0, v35);

      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __14__FPTask_exec__block_invoke;
      v43[3] = &unk_1E5AF53B8;
      pid_t v44 = v45;
      v43[4] = self;
      dispatch_source_set_event_handler(v36, v43);
      dispatch_resume(v36);
      p_waitStatus = &self->_waitStatus;
      while (waitpid(v45, p_waitStatus, 0) < 0 && *__error() == 4)
        ;
      if ((*p_waitStatus & 0x7F) != 0) {
        int v24 = 0;
      }
      else {
        int v24 = BYTE1(*p_waitStatus);
      }
      dispatch_source_cancel(v36);
    }
    pthread_sigmask(2, &v46, 0);
    if (v27 != (void (__cdecl *)(int))-1) {
      signal(20, v27);
    }
  }
  free(v5);
  int v38 = posix_spawn_file_actions_destroy(&v47);
  if (v38)
  {
    int v39 = v38;
    v40 = fp_current_or_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = strerror(v39);
      *(_DWORD *)buf = 136315138;
      v49 = v41;
      _os_log_impl(&dword_1A33AE000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to destroy the file actions properly (%s).", buf, 0xCu);
    }
  }
  return v24;
}

void __14__FPTask_exec__block_invoke(uint64_t a1)
{
  fwrite("\b\b", 2uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  kill(*(_DWORD *)(a1 + 40), 9);
  v2 = [*(id *)(a1 + 32) standardError];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) standardError];
    dprintf([v3 fileDescriptor], "\n\n === Aborted by user");
  }
}

+ (BOOL)exec:(id)a3 stdoutString:(id *)a4 stderrString:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = [MEMORY[0x1E4F28F48] pipe];
  uint64_t v9 = [MEMORY[0x1E4F28F48] pipe];
  id v10 = +[FPTask taskWithCommandWithArguments:v7];
  int v11 = [v8 fileHandleForWriting];
  [v10 setStandardOutput:v11];

  unint64_t v12 = [v9 fileHandleForWriting];
  [v10 setStandardError:v12];

  pid_t v13 = [v10 execAsync];
  int v14 = [v8 fileHandleForWriting];
  [v14 closeFile];

  id v15 = [v9 fileHandleForWriting];
  [v15 closeFile];

  if (v13 < 0)
  {
    BOOL v20 = 0;
  }
  else
  {
    uint64_t v16 = dispatch_queue_create("queue for reading the task output and error streams concurrently", MEMORY[0x1E4F14430]);
    uint64_t v35 = 0;
    pid_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    int v38 = __Block_byref_object_copy__24;
    int v39 = __Block_byref_object_dispose__24;
    id v40 = 0;
    if (a4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__FPTask_exec_stdoutString_stderrString___block_invoke;
      block[3] = &unk_1E5AF2168;
      v34 = &v35;
      id v33 = v8;
      dispatch_async(v16, block);
    }
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__24;
    v30 = __Block_byref_object_dispose__24;
    id v31 = 0;
    if (a5)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __41__FPTask_exec_stdoutString_stderrString___block_invoke_41;
      v23[3] = &unk_1E5AF2168;
      v25 = &v26;
      id v24 = v9;
      dispatch_async(v16, v23);
    }
    dispatch_barrier_sync(v16, &__block_literal_global_47);
    if (a4)
    {
      id v17 = [NSString alloc];
      *a4 = (id)[v17 initWithData:v36[5] encoding:4];
    }
    if (a5)
    {
      id v18 = [NSString alloc];
      *a5 = (id)[v18 initWithData:v27[5] encoding:4];
    }
    int v22 = 0;
    BOOL v20 = waitpid(v13, &v22, 0) >= 0 && BYTE1(v22) << 8 == 0;
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v35, 8);
  }

  return v20;
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fileHandleForReading];
  id v8 = 0;
  uint64_t v3 = [v2 readDataToEndOfFileAndReturnError:&v8];
  id v4 = v8;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (v4)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __41__FPTask_exec_stdoutString_stderrString___block_invoke_cold_1(v4);
    }
  }
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke_41(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fileHandleForReading];
  id v8 = 0;
  uint64_t v3 = [v2 readDataToEndOfFileAndReturnError:&v8];
  id v4 = v8;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (v4)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __41__FPTask_exec_stdoutString_stderrString___block_invoke_41_cold_1(v4);
    }
  }
}

- (void)resetRedirect
{
  [(FPTask *)self setStandardOutput:0];

  [(FPTask *)self setStandardError:0];
}

- (NSArray)argv
{
  return self->_argv;
}

- (void)setArgv:(id)a3
{
}

- (NSFileHandle)standardOutput
{
  return self->_standardOutput;
}

- (void)setStandardOutput:(id)a3
{
}

- (NSFileHandle)standardError
{
  return self->_standardError;
}

- (void)setStandardError:(id)a3
{
}

- (int)waitStatus
{
  return self->_waitStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardError, 0);
  objc_storeStrong((id *)&self->_standardOutput, 0);

  objc_storeStrong((id *)&self->_argv, 0);
}

- (void)execAsync
{
}

- (void)exec
{
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Error while reading stdout: %@", v4, v5, v6, v7, 2u);
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke_41_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Error while reading stderr: %@", v4, v5, v6, v7, 2u);
}

@end