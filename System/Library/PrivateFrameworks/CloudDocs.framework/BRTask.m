@interface BRTask
+ (id)sanitizeStringForFilename:(id)a3;
+ (id)taskWithCommand:(id)a3;
+ (id)taskWithCommandWithArguments:(id)a3;
- (BRTask)init;
- (NSArray)argv;
- (NSString)redirectStderrToFileAtPath;
- (NSString)redirectStdoutToFileAtPath;
- (int)exec;
- (int)redirectStderrToFileDescriptor;
- (int)redirectStdoutToFileDescriptor;
- (int)waitStatus;
- (void)exec;
- (void)resetRedirect;
- (void)setArgv:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandWithArguments:(id)a3;
- (void)setRedirectStderrToFileAtPath:(id)a3;
- (void)setRedirectStderrToFileDescriptor:(int)a3;
- (void)setRedirectStdoutToFileAtPath:(id)a3;
- (void)setRedirectStdoutToFileDescriptor:(int)a3;
@end

@implementation BRTask

- (BRTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)BRTask;
  result = [(BRTask *)&v3 init];
  if (result)
  {
    result->_redirectStdoutToFileDescriptor = -1;
    result->_redirectStderrToFileDescriptor = -1;
  }
  return result;
}

+ (id)taskWithCommand:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v10];

  v7 = [a1 taskWithCommandWithArguments:v6];

  return v7;
}

+ (id)taskWithCommandWithArguments:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BRTask);
  [(BRTask *)v4 setCommandWithArguments:v3];

  return v4;
}

+ (id)sanitizeStringForFilename:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

    v6 = [v5 stringByReplacingOccurrencesOfString:@"\" withString:@"'""];
    v7 = ;

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
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(BRTask *)self setCommandWithArguments:v6];
}

- (void)setCommandWithArguments:(id)a3
{
  id v19 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
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
        v12 = v19;
        if ((v13 | v8 | v7)) {
          goto LABEL_18;
        }
      }
      else
      {
        v12 = v19;
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
      v12 = v19;
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
        uint64_t v16 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v9 - v6, 1, &stru_1EF11DA20);

        v15 = (void *)v16;
      }
      [v4 addObject:v15];

      v12 = v19;
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
  [(BRTask *)self setArgv:v4];
}

- (int)exec
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = [(BRTask *)self argv];
  if (![v3 count]) {
    -[BRTask exec]();
  }

  if ((os_variant_has_internal_content() & 1) == 0)
  {
    v4 = [(BRTask *)self argv];
    unint64_t v5 = [v4 objectAtIndex:0];
    char v6 = [v5 containsString:@"/usr/local/"];

    if (v6) {
      return -1;
    }
  }
  int v8 = [(BRTask *)self argv];
  uint64_t v9 = (char **)malloc_type_malloc(8 * [v8 count] + 8, 0x10040436913F5uLL);

  uint64_t v10 = [(BRTask *)self argv];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      BOOL v13 = [(BRTask *)self argv];
      id v14 = [v13 objectAtIndex:v12];
      v9[v12] = strdup((const char *)[v14 fileSystemRepresentation]);

      ++v12;
      v15 = [(BRTask *)self argv];
      unint64_t v16 = [v15 count];
    }
    while (v12 < v16);
  }
  uint64_t v17 = [(BRTask *)self argv];
  v9[[v17 count]] = 0;

  v18 = (posix_spawn_file_actions_t *)malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  int v19 = posix_spawn_file_actions_init(v18);
  if (!v19)
  {
    v33 = [(BRTask *)self redirectStdoutToFileAtPath];
    uint64_t v34 = [v33 length];

    if (v34)
    {
      id v35 = [(BRTask *)self redirectStdoutToFileAtPath];
      int v7 = posix_spawn_file_actions_addopen(v18, 1, (const char *)[v35 fileSystemRepresentation], 521, 0x1B6u);

      if (v7)
      {
        brc_bread_crumbs((uint64_t)"-[BRTask exec]", 191);
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = brc_default_log(1);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        v36 = __error();
        v37 = strerror(*v36);
        *(_DWORD *)buf = 136315394;
        v70 = v37;
        __int16 v71 = 2112;
        v72 = v20;
        v24 = "[WARNING] Unable to redirect stdin (%s).%@";
        goto LABEL_11;
      }
    }
    v38 = [(BRTask *)self redirectStderrToFileAtPath];
    uint64_t v39 = [v38 length];

    if (v39)
    {
      id v40 = [(BRTask *)self redirectStderrToFileAtPath];
      int v7 = posix_spawn_file_actions_addopen(v18, 2, (const char *)[v40 fileSystemRepresentation], 521, 0x1B6u);

      if (v7)
      {
        brc_bread_crumbs((uint64_t)"-[BRTask exec]", 197);
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = brc_default_log(1);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        v41 = __error();
        v42 = strerror(*v41);
        *(_DWORD *)buf = 136315394;
        v70 = v42;
        __int16 v71 = 2112;
        v72 = v20;
        v24 = "[WARNING] Unable to redirect stderr (%s).%@";
        goto LABEL_11;
      }
    }
    if ([(BRTask *)self redirectStdoutToFileDescriptor] == -1
      || (int v43 = posix_spawn_file_actions_adddup2(v18, [(BRTask *)self redirectStdoutToFileDescriptor], 1)) == 0)
    {
      if ([(BRTask *)self redirectStderrToFileDescriptor] == -1
        || (int v46 = posix_spawn_file_actions_adddup2(v18, [(BRTask *)self redirectStderrToFileDescriptor], 2)) == 0)
      {
        pid_t v68 = 0;
        v47 = [(BRTask *)self argv];
        id v48 = [v47 objectAtIndex:0];
        v49 = (const char *)[v48 fileSystemRepresentation];
        int v7 = posix_spawnp(&v68, v49, v18, 0, v9, (char *const *)*MEMORY[0x1E4F147F0]);

        if (v7)
        {
          v50 = brc_bread_crumbs((uint64_t)"-[BRTask exec]", 261);
          v51 = brc_default_log(1);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = [(BRTask *)self argv];
            v53 = [v52 componentsJoinedByString:@", "];
            v54 = strerror(v7);
            *(_DWORD *)buf = 138412802;
            v70 = v53;
            __int16 v71 = 2080;
            v72 = v54;
            __int16 v73 = 2112;
            v74 = v50;
            _os_log_impl(&dword_19ED3F000, v51, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to spawn a new process (argv: [%@], error: %s).%@", buf, 0x20u);
          }
          self->_waitStatus = 0;
        }
        else
        {
          v55 = signal(2, (void (__cdecl *)(int))1);
          if (v55 == (void (__cdecl *)(int))-1)
          {
            brc_bread_crumbs((uint64_t)"-[BRTask exec]", 223);
            v64 = (char *)objc_claimAutoreleasedReturnValue();
            v65 = brc_default_log(1);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v64;
              _os_log_impl(&dword_19ED3F000, v65, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to retrieve handler for SIGINT.%@", buf, 0xCu);
            }

            waitpid(v68, &self->_waitStatus, 0);
          }
          else
          {
            v56 = v55;
            v57 = dispatch_get_global_queue(0, 0);
            dispatch_source_t v58 = dispatch_source_create(MEMORY[0x1E4F14480], 2uLL, 0, v57);

            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __14__BRTask_exec__block_invoke;
            v66[3] = &unk_1E59AF390;
            pid_t v67 = v68;
            v66[4] = self;
            v59 = v58;
            v60 = v66;
            v61 = v60;
            v62 = v60;
            if (brc_block_remember_persona)
            {
              v62 = brc_block_remember_persona(v60);
            }
            dispatch_block_t v63 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v62);
            dispatch_source_set_event_handler(v59, v63);

            dispatch_resume(v59);
            waitpid(v68, &self->_waitStatus, 0);
            signal(2, v56);
            dispatch_source_cancel(v59);
          }
        }
        goto LABEL_13;
      }
      int v7 = v46;
      brc_bread_crumbs((uint64_t)"-[BRTask exec]", 209);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = brc_default_log(1);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
    }
    else
    {
      int v7 = v43;
      brc_bread_crumbs((uint64_t)"-[BRTask exec]", 203);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = brc_default_log(1);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
    }
    v44 = __error();
    v45 = strerror(*v44);
    *(_DWORD *)buf = 136315394;
    v70 = v45;
    __int16 v71 = 2112;
    v72 = v20;
    v24 = "[WARNING] Unable to perform spawn action (%s).%@";
    goto LABEL_11;
  }
  int v7 = v19;
  brc_bread_crumbs((uint64_t)"-[BRTask exec]", 186);
  v20 = (char *)objc_claimAutoreleasedReturnValue();
  v21 = brc_default_log(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = __error();
    v23 = strerror(*v22);
    *(_DWORD *)buf = 136315394;
    v70 = v23;
    __int16 v71 = 2112;
    v72 = v20;
    v24 = "[WARNING] Unable to initialize the file actions properly (%s).%@";
LABEL_11:
    _os_log_impl(&dword_19ED3F000, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
  }
LABEL_12:

LABEL_13:
  v25 = *v9;
  if (*v9)
  {
    v26 = v9 + 1;
    do
    {
      free(v25);
      v27 = *v26++;
      v25 = v27;
    }
    while (v27);
  }
  free(v9);
  if (posix_spawn_file_actions_destroy(v18))
  {
    brc_bread_crumbs((uint64_t)"-[BRTask exec]", 272);
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    v29 = brc_default_log(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = __error();
      v31 = strerror(*v30);
      *(_DWORD *)buf = 136315394;
      v70 = v31;
      __int16 v71 = 2112;
      v72 = v28;
      _os_log_impl(&dword_19ED3F000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to destroy the file actions properly (%s).%@", buf, 0x16u);
    }
  }
  free(v18);
  return v7;
}

void __14__BRTask_exec__block_invoke(uint64_t a1)
{
  fwrite("\b\b", 2uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  kill(*(_DWORD *)(a1 + 40), 9);
  v2 = [*(id *)(a1 + 32) redirectStderrToFileAtPath];
  if ([v2 length])
  {
  }
  else
  {
    int v3 = [*(id *)(a1 + 32) redirectStderrToFileDescriptor];

    if (v3 == -1) {
      return;
    }
  }
  v4 = [*(id *)(a1 + 32) redirectStderrToFileAtPath];

  unint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    char v6 = [v5 redirectStderrToFileAtPath];
    if (v6)
    {
LABEL_6:
      id v10 = v6;
      int v7 = fopen((const char *)[v10 fileSystemRepresentation], "a+");
      if (v7)
      {
        int v8 = v7;
        fwrite("\n\n === Aborted by user", 0x16uLL, 1uLL, v7);
        fclose(v8);
      }
      char v6 = v10;
    }
  }
  else if ([v5 redirectStderrToFileDescriptor] == 1 {
         && ([*(id *)(a1 + 32) redirectStdoutToFileAtPath],
  }
             uint64_t v9 = objc_claimAutoreleasedReturnValue(),
             v9,
             v9))
  {
    char v6 = [*(id *)(a1 + 32) redirectStdoutToFileAtPath];
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    char v6 = 0;
  }
}

- (void)resetRedirect
{
  [(BRTask *)self setRedirectStdoutToFileAtPath:0];
  [(BRTask *)self setRedirectStdoutToFileDescriptor:0xFFFFFFFFLL];
  [(BRTask *)self setRedirectStderrToFileAtPath:0];

  [(BRTask *)self setRedirectStderrToFileDescriptor:0xFFFFFFFFLL];
}

- (NSArray)argv
{
  return self->_argv;
}

- (void)setArgv:(id)a3
{
}

- (NSString)redirectStdoutToFileAtPath
{
  return self->_redirectStdoutToFileAtPath;
}

- (void)setRedirectStdoutToFileAtPath:(id)a3
{
}

- (int)redirectStdoutToFileDescriptor
{
  return self->_redirectStdoutToFileDescriptor;
}

- (void)setRedirectStdoutToFileDescriptor:(int)a3
{
  self->_redirectStdoutToFileDescriptor = a3;
}

- (NSString)redirectStderrToFileAtPath
{
  return self->_redirectStderrToFileAtPath;
}

- (void)setRedirectStderrToFileAtPath:(id)a3
{
}

- (int)redirectStderrToFileDescriptor
{
  return self->_redirectStderrToFileDescriptor;
}

- (void)setRedirectStderrToFileDescriptor:(int)a3
{
  self->_redirectStderrToFileDescriptor = a3;
}

- (int)waitStatus
{
  return self->_waitStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectStderrToFileAtPath, 0);
  objc_storeStrong((id *)&self->_redirectStdoutToFileAtPath, 0);

  objc_storeStrong((id *)&self->_argv, 0);
}

- (void)exec
{
}

@end