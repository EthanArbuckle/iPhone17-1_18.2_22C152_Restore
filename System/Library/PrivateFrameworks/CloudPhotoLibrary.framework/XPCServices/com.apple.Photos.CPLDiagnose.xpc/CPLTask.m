@interface CPLTask
+ (BOOL)waitForAllLongTasksToFinish;
+ (id)taskWithCommand:(id)a3;
+ (id)taskWithCommandAndArguments:(id)a3;
+ (void)_enqueueTaskCompletionForLaterWait:(id)a3;
- (BOOL)canTimeout;
- (BOOL)cleanupEmptyFiles;
- (BOOL)waitInBackgroundIfTaskTimesOut;
- (CPLTask)init;
- (NSArray)argv;
- (NSPipe)stdinPipe;
- (NSString)command;
- (NSString)redirectStderrToFileAtPath;
- (NSString)redirectStdoutToFileAtPath;
- (char)environ;
- (id)_waitDeadline;
- (int)redirectStderrToFileDescriptor;
- (int)redirectStdoutToFileDescriptor;
- (int)timeout;
- (int)waitStatus;
- (int64_t)exec;
- (int64_t)executeWithPIDHandler:(id)a3 endHandler:(id)a4;
- (void)_updateWaitDeadline;
- (void)resetRedirect;
- (void)setArgv:(id)a3;
- (void)setCanTimeout:(BOOL)a3;
- (void)setCleanupEmptyFiles:(BOOL)a3;
- (void)setCommand:(id)a3;
- (void)setCommandWithArguments:(id)a3;
- (void)setEnviron:(char *)a3;
- (void)setRedirectStderrToFileAtPath:(id)a3;
- (void)setRedirectStderrToFileDescriptor:(int)a3;
- (void)setRedirectStdoutToFileAtPath:(id)a3;
- (void)setRedirectStdoutToFileDescriptor:(int)a3;
- (void)setStdinPipe:(id)a3;
- (void)setTimeout:(int)a3;
- (void)setWaitInBackgroundIfTaskTimesOut:(BOOL)a3;
@end

@implementation CPLTask

+ (void)_enqueueTaskCompletionForLaterWait:(id)a3
{
  id v3 = a3;
  v4 = (void *)qword_100041370;
  id v7 = v3;
  if (!qword_100041370)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = (void *)qword_100041370;
    qword_100041370 = (uint64_t)v5;

    id v3 = v7;
    v4 = (void *)qword_100041370;
  }
  [v4 addObject:v3];
}

+ (BOOL)waitForAllLongTasksToFinish
{
  if (![(id)qword_100041370 count]) {
    return 1;
  }
  v2 = dispatch_group_create();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)qword_100041370;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_group_async(v2, *(dispatch_queue_t *)(*(void *)(*((void *)&v11 + 1) + 8 * i) + 48), &stru_100034B78);
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  BOOL v9 = dispatch_group_wait(v2, v8) == 0;

  return v9;
}

- (CPLTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLTask;
  result = [(CPLTask *)&v3 init];
  if (result)
  {
    result->_redirectStdoutToFileDescriptor = -1;
    result->_redirectStderrToFileDescriptor = -1;
    result->_waitInBackgroundIfTaskTimesOut = 1;
    result->_waitDeadlineLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)taskWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v9];

  uint64_t v6 = [a1 taskWithCommandAndArguments:v5];

  return v6;
}

+ (id)taskWithCommandAndArguments:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CPLTask);
  [(CPLTask *)v4 setCommandWithArguments:v3];

  return v4;
}

- (NSString)command
{
  return (NSString *)[(NSArray *)self->_argv firstObject];
}

- (void)setCommand:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v6];

  [(CPLTask *)self setCommandWithArguments:v5];
}

- (void)setCommandWithArguments:(id)a3
{
  id v19 = a3;
  id v4 = +[NSMutableArray array];
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
    unsigned int v11 = [v19 characterAtIndex:v5];
    if (v11 != 39 || (v7 & 1) != 0)
    {
      if ((v11 != 34) | v8 & 1)
      {
        BOOL v13 = v11 != 32;
        long long v12 = v19;
        if ((v13 | v8 | v7)) {
          goto LABEL_18;
        }
      }
      else
      {
        long long v12 = v19;
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
      long long v12 = v19;
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
      long long v14 = objc_msgSend(v12, "substringWithRange:", v6, v10 - 1);
      v15 = v14;
      if (v9 != -1)
      {
        uint64_t v16 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v9 - v6, 1, &stru_1000359E8);

        v15 = (void *)v16;
      }
      [v4 addObject:v15];

      long long v12 = v19;
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
  while (v5 < (unint64_t)[v12 length]);
  if (v17)
  {
    v18 = objc_msgSend(v19, "substringWithRange:", v6, v17);
    [v4 addObject:v18];
  }
LABEL_22:
  [(CPLTask *)self setArgv:v4];
}

- (void)_updateWaitDeadline
{
  p_waitDeadlineLock = &self->_waitDeadlineLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  unint64_t v5 = sub_100006FAC;
  uint64_t v6 = &unk_100034BA0;
  int v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_waitDeadlineLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_waitDeadlineLock);
}

- (id)_waitDeadline
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1000071C0;
  v18 = sub_1000071D0;
  id v19 = 0;
  p_waitDeadlineLock = &self->_waitDeadlineLock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  uint64_t v10 = sub_1000071D8;
  unsigned int v11 = &unk_100034BC8;
  long long v12 = self;
  BOOL v13 = &v14;
  id v3 = v9;
  os_unfair_lock_lock(p_waitDeadlineLock);
  v10((uint64_t)v3);
  os_unfair_lock_unlock(p_waitDeadlineLock);

  id v4 = (void *)v15[5];
  if (!v4)
  {
    uint64_t v5 = +[NSDate distantFuture];
    uint64_t v6 = (void *)v15[5];
    v15[5] = v5;

    id v4 = (void *)v15[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (int64_t)executeWithPIDHandler:(id)a3 endHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a3;
  id v7 = (void (**)(id, int64_t))a4;
  int v8 = [(CPLTask *)self argv];
  if (![v8 count]) {
    sub_100020224();
  }

  uint64_t v9 = [(CPLTask *)self argv];
  uint64_t v10 = malloc_type_malloc(8 * (void)[v9 count] + 8, 0x10040436913F5uLL);

  unsigned int v11 = [(CPLTask *)self argv];
  id v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [(CPLTask *)self argv];
      id v15 = [v14 objectAtIndex:v13];
      v10[v13] = strdup((const char *)[v15 UTF8String]);

      ++v13;
      uint64_t v16 = [(CPLTask *)self argv];
      id v17 = [v16 count];
    }
    while (v13 < (unint64_t)v17);
  }
  v18 = [(CPLTask *)self argv];
  v10[(void)[v18 count]] = 0;

  id v19 = (posix_spawn_file_actions_t *)malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  int v20 = posix_spawn_file_actions_init(v19);
  int v21 = v20;
  if (v20 && !_CPLSilentLogging)
  {
    v22 = sub_100007E04();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = __error();
      v24 = strerror(*v23);
      *(_DWORD *)buf = 136315138;
      v105 = v24;
      v25 = "Unable to initialize the file actions properly (%s).";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v20) {
    goto LABEL_13;
  }
  v42 = [(CPLTask *)self redirectStdoutToFileAtPath];
  id v43 = [v42 length];

  if (v43)
  {
    if (!_CPLSilentLogging)
    {
      v44 = sub_100007E04();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v45 = (char *)*v10;
        v46 = [(CPLTask *)self redirectStdoutToFileAtPath];
        *(_DWORD *)buf = 136315394;
        v105 = v45;
        __int16 v106 = 2112;
        v107[0] = v46;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Setting up stdout for %s to %@", buf, 0x16u);
      }
    }
    id v47 = [(CPLTask *)self redirectStdoutToFileAtPath];
    int v48 = posix_spawn_file_actions_addopen(v19, 1, (const char *)[v47 fileSystemRepresentation], 513, 0x1B6u);

    if (v48)
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v22 = sub_100007E04();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v49 = __error();
        v50 = strerror(*v49);
        *(_DWORD *)buf = 136315138;
        v105 = v50;
        v25 = "Unable to redirect stdin (%s).";
        goto LABEL_9;
      }
LABEL_10:

LABEL_11:
      int v21 = 1;
LABEL_13:
      int64_t v26 = v21 != 0;
      v27 = (char *)*v10;
      if (*v10)
      {
        v28 = (void **)(v10 + 1);
        do
        {
          free(v27);
          v29 = (char *)*v28++;
          v27 = v29;
        }
        while (v29);
      }
      free(v10);
      if (posix_spawn_file_actions_destroy(v19) && !_CPLSilentLogging)
      {
        v30 = sub_100007E04();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = __error();
          v32 = strerror(*v31);
          *(_DWORD *)buf = 136315138;
          v105 = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to destroy the file actions properly (%s).", buf, 0xCu);
        }
      }
      free(v19);
      goto LABEL_22;
    }
  }
  v51 = [(CPLTask *)self redirectStderrToFileAtPath];
  id v52 = [v51 length];

  if (v52)
  {
    if (!_CPLSilentLogging)
    {
      v53 = sub_100007E04();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        v54 = (char *)*v10;
        v55 = [(CPLTask *)self redirectStderrToFileAtPath];
        *(_DWORD *)buf = 136315394;
        v105 = v54;
        __int16 v106 = 2112;
        v107[0] = v55;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Setting up stderr for %s to %@", buf, 0x16u);
      }
    }
    id v56 = [(CPLTask *)self redirectStderrToFileAtPath];
    int v57 = posix_spawn_file_actions_addopen(v19, 2, (const char *)[v56 fileSystemRepresentation], 513, 0x1B6u);

    if (v57)
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v22 = sub_100007E04();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      v58 = __error();
      v59 = strerror(*v58);
      *(_DWORD *)buf = 136315138;
      v105 = v59;
      v25 = "Unable to redirect stderr (%s).";
      goto LABEL_9;
    }
  }
  v60 = [(CPLTask *)self stdinPipe];

  if (v60)
  {
    if (!_CPLSilentLogging)
    {
      v61 = sub_100007E04();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        v97 = (char *)*v10;
        v98 = [(CPLTask *)self stdinPipe];
        v62 = [v98 fileHandleForReading];
        unsigned int v63 = [v62 fileDescriptor];
        v64 = [(CPLTask *)self stdinPipe];
        v65 = [v64 fileHandleForWriting];
        unsigned int v66 = [v65 fileDescriptor];
        *(_DWORD *)buf = 136315650;
        v105 = v97;
        __int16 v106 = 1024;
        LODWORD(v107[0]) = v63;
        WORD2(v107[0]) = 1024;
        *(_DWORD *)((char *)v107 + 6) = v66;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Setting up stdin for %s to %d (and closing %d)", buf, 0x18u);
      }
    }
    v67 = [(CPLTask *)self stdinPipe];
    v68 = [v67 fileHandleForReading];
    int v69 = posix_spawn_file_actions_adddup2(v19, (int)[v68 fileDescriptor], 0);

    if (v69)
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v22 = sub_100007E04();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
LABEL_73:
      v78 = __error();
      v79 = strerror(*v78);
      *(_DWORD *)buf = 136315138;
      v105 = v79;
      v25 = "Unable to perform spawn action (%s).";
      goto LABEL_9;
    }
    v70 = [(CPLTask *)self stdinPipe];
    v71 = [v70 fileHandleForWriting];
    int v21 = posix_spawn_file_actions_addclose(v19, (int)[v71 fileDescriptor]);

    if (v21) {
      goto LABEL_13;
    }
  }
  if ([(CPLTask *)self redirectStdoutToFileDescriptor] != -1)
  {
    if (!_CPLSilentLogging)
    {
      v72 = sub_100007E04();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        v73 = (char *)*v10;
        unsigned int v74 = [(CPLTask *)self redirectStdoutToFileDescriptor];
        *(_DWORD *)buf = 136315394;
        v105 = v73;
        __int16 v106 = 1024;
        LODWORD(v107[0]) = v74;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Setting up stdout for %s to %d", buf, 0x12u);
      }
    }
    if (posix_spawn_file_actions_adddup2(v19, [(CPLTask *)self redirectStdoutToFileDescriptor], 1))
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v22 = sub_100007E04();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      goto LABEL_73;
    }
  }
  if ([(CPLTask *)self redirectStderrToFileDescriptor] != -1)
  {
    if (!_CPLSilentLogging)
    {
      v75 = sub_100007E04();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
      {
        v76 = (char *)*v10;
        unsigned int v77 = [(CPLTask *)self redirectStderrToFileDescriptor];
        *(_DWORD *)buf = 136315394;
        v105 = v76;
        __int16 v106 = 1024;
        LODWORD(v107[0]) = v77;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "Setting up stderr for %s to %d", buf, 0x12u);
      }
    }
    if (posix_spawn_file_actions_adddup2(v19, [(CPLTask *)self redirectStderrToFileDescriptor], 2))
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v22 = sub_100007E04();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      goto LABEL_73;
    }
  }
  pid_t v103 = 0;
  v80 = [(CPLTask *)self argv];
  id v81 = [v80 objectAtIndex:0];
  v82 = (const char *)[v81 fileSystemRepresentation];
  if (self->_environ) {
    environ = self->_environ;
  }
  else {
    environ = (char **)::environ;
  }
  int v84 = posix_spawnp(&v103, v82, v19, 0, (char *const *)v10, environ);

  if (v84)
  {
    if (!_CPLSilentLogging)
    {
      v85 = sub_100007E04();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v86 = strerror(v84);
        *(_DWORD *)buf = 136315138;
        v105 = v86;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Unable to spawn a new process (%s).", buf, 0xCu);
      }
    }
    self->_waitStatus = 0;
    goto LABEL_11;
  }
  v6[2](v6, v103);
  v87 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cplctl.task", 0);
  waitQueue = self->_waitQueue;
  self->_waitQueue = v87;

  id v89 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  v90 = self->_waitQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007E58;
  block[3] = &unk_100034BF0;
  pid_t v102 = v103;
  block[4] = self;
  id v91 = v89;
  id v101 = v91;
  dispatch_async((dispatch_queue_t)v90, block);
  [(CPLTask *)self _updateWaitDeadline];
  v92 = [(CPLTask *)self _waitDeadline];
  do
  {
    unsigned int v93 = [v91 lockWhenCondition:1 beforeDate:v92];
    if (v93)
    {
      int64_t v26 = 0;
      v94 = v92;
      goto LABEL_91;
    }
    v94 = [(CPLTask *)self _waitDeadline];

    [v94 timeIntervalSinceNow];
    v92 = v94;
  }
  while (v95 > 0.0);
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_100007EAC;
  v99[3] = &unk_100034C10;
  v99[4] = v10;
  v99[5] = v19;
  v96 = objc_retainBlock(v99);
  if (self->_waitInBackgroundIfTaskTimesOut)
  {
    +[CPLTask _enqueueTaskCompletionForLaterWait:self];
    dispatch_async((dispatch_queue_t)self->_waitQueue, v96);
  }
  else
  {
    kill(v103, 15);
    ((void (*)(void *))v96[2])(v96);
  }
  [v91 lock];

  int64_t v26 = 2;
LABEL_91:
  [v91 unlock];
  v7[2](v7, v26);

  if (v93)
  {
    int v21 = 0;
    goto LABEL_13;
  }
LABEL_22:
  if ([(CPLTask *)self cleanupEmptyFiles])
  {
    v33 = [(CPLTask *)self redirectStderrToFileAtPath];
    id v34 = [v33 length];

    if (v34)
    {
      id v35 = [(CPLTask *)self redirectStderrToFileAtPath];
      v36 = (char *)[v35 fileSystemRepresentation];
      sub_100007FB0((int)v36, v36);
    }
    v37 = [(CPLTask *)self redirectStdoutToFileAtPath];
    id v38 = [v37 length];

    if (v38)
    {
      id v39 = [(CPLTask *)self redirectStdoutToFileAtPath];
      v40 = (char *)[v39 fileSystemRepresentation];
      sub_100007FB0((int)v40, v40);
    }
  }

  return v26;
}

- (int64_t)exec
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1000071C0;
  v6[4] = sub_1000071D0;
  id v7 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008174;
  v5[3] = &unk_100034C60;
  v5[5] = v8;
  v5[6] = v6;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100008448;
  v4[3] = &unk_100034CB0;
  v4[4] = v8;
  v4[5] = v6;
  int64_t v2 = [(CPLTask *)self executeWithPIDHandler:v5 endHandler:v4];
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(v8, 8);
  return v2;
}

- (void)resetRedirect
{
  [(CPLTask *)self setRedirectStdoutToFileAtPath:0];
  [(CPLTask *)self setRedirectStdoutToFileDescriptor:0xFFFFFFFFLL];
  [(CPLTask *)self setRedirectStderrToFileAtPath:0];
  [(CPLTask *)self setRedirectStderrToFileDescriptor:0xFFFFFFFFLL];
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

- (NSPipe)stdinPipe
{
  return self->_stdinPipe;
}

- (void)setStdinPipe:(id)a3
{
}

- (BOOL)canTimeout
{
  return self->_canTimeout;
}

- (void)setCanTimeout:(BOOL)a3
{
  self->_canTimeout = a3;
}

- (int)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int)a3
{
  self->_timeout = a3;
}

- (BOOL)waitInBackgroundIfTaskTimesOut
{
  return self->_waitInBackgroundIfTaskTimesOut;
}

- (void)setWaitInBackgroundIfTaskTimesOut:(BOOL)a3
{
  self->_waitInBackgroundIfTaskTimesOut = a3;
}

- (BOOL)cleanupEmptyFiles
{
  return self->_cleanupEmptyFiles;
}

- (void)setCleanupEmptyFiles:(BOOL)a3
{
  self->_cleanupEmptyFiles = a3;
}

- (char)environ
{
  return self->_environ;
}

- (void)setEnviron:(char *)a3
{
  self->_environ = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stdinPipe, 0);
  objc_storeStrong((id *)&self->_waitDeadline, 0);
  objc_storeStrong((id *)&self->_waitQueue, 0);
  objc_storeStrong((id *)&self->_redirectStderrToFileAtPath, 0);
  objc_storeStrong((id *)&self->_redirectStdoutToFileAtPath, 0);
  objc_storeStrong((id *)&self->_argv, 0);
}

@end