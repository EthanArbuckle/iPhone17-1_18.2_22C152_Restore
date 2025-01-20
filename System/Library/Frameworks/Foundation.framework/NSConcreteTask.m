@interface NSConcreteTask
- (BOOL)isRunning;
- (BOOL)isSpawnedProcessDisclaimed;
- (BOOL)launchAndReturnError:(id *)a3;
- (BOOL)launchWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)resume;
- (BOOL)suspend;
- (NSConcreteTask)init;
- (id)arguments;
- (id)currentDirectoryPath;
- (id)environment;
- (id)launchPath;
- (id)launchRequirementData;
- (id)preferredArchitectures;
- (id)standardError;
- (id)standardInput;
- (id)standardOutput;
- (id)taskDictionary;
- (id)terminationHandler;
- (int)processIdentifier;
- (int)terminationStatus;
- (int64_t)_platformExitInformation;
- (int64_t)qualityOfService;
- (int64_t)suspendCount;
- (int64_t)terminationReason;
- (void)_setTerminationHandler:(id)a3;
- (void)_withTaskDictionary:(id)a3;
- (void)dealloc;
- (void)launch;
- (void)setArguments:(id)a3;
- (void)setCurrentDirectoryPath:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLaunchPath:(id)a3;
- (void)setLaunchRequirementData:(id)a3;
- (void)setPreferredArchitectures:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setSpawnedProcessDisclaimed:(BOOL)a3;
- (void)setStandardError:(id)a3;
- (void)setStandardInput:(id)a3;
- (void)setStandardOutput:(id)a3;
- (void)setStartsNewProcessGroup:(BOOL)a3;
- (void)setTaskDictionary:(id)a3;
- (void)waitUntilExit;
@end

@implementation NSConcreteTask

- (int64_t)qualityOfService
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char qos = self->_qos;
  if (!qos) {
    char qos = -1;
  }
  int64_t v5 = qos;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setQualityOfService:(int64_t)a3
{
  unint64_t v3 = atomic_load(&self->__exitRunningInfo);
  if ((v3 & 0x100000000) == 0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ((unint64_t)(a3 + 1) > 0x22 || ((1 << (a3 + 1)) & 0x404040401) == 0) {
      LOBYTE(a3) = -1;
    }
    self->_char qos = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setSpawnedProcessDisclaimed:(BOOL)a3
{
}

- (BOOL)isSpawnedProcessDisclaimed
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isSpawnedProcessDisclaimed);
  return v2 & 1;
}

- (id)terminationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_terminationHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setTerminationHandler:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id terminationHandler = self->_terminationHandler;
  if (terminationHandler != a3)
  {

    self->_id terminationHandler = (id)[a3 copy];
  }
  unint64_t v7 = atomic_load(&self->__exitRunningInfo);
  if ((v7 & 0x300000000) == 0x100000000)
  {
    id v8 = self->_terminationHandler;
    if (v8)
    {
      atomic_fetch_or((atomic_ullong *volatile)&self->__exitRunningInfo, 0x800000000uLL);
      qos_class_t v9 = qos_class_main();
      global_queue = dispatch_get_global_queue(v9, 2uLL);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__NSConcreteTask__setTerminationHandler___block_invoke;
      block[3] = &unk_1E51F7EE0;
      block[4] = self;
      block[5] = v8;
      dispatch_async(global_queue, block);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __41__NSConcreteTask__setTerminationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int)terminationStatus
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000) == 0)
  {
    unint64_t v7 = +[NSString stringWithFormat:@"%@: task not launched", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_13;
  }
  if ((v2 & 0x200000000) != 0)
  {
    unint64_t v7 = +[NSString stringWithFormat:@"%@: task still running", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_13:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v7 userInfo:0]);
  }
  int v3 = v2 & 0x7F;
  int v4 = BYTE1(v2);
  if (v3) {
    int v4 = 0;
  }
  if (v3 == 127 || v3 == 0) {
    return v4;
  }
  else {
    return v3;
  }
}

- (int64_t)_platformExitInformation
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000) == 0)
  {
    int v4 = +[NSString stringWithFormat:@"%@: task not launched", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_6;
  }
  if ((v2 & 0x200000000) != 0)
  {
    int v4 = +[NSString stringWithFormat:@"%@: task still running", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_6:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v4 userInfo:0]);
  }
  return v2;
}

- (int64_t)terminationReason
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000) == 0)
  {
    v6 = +[NSString stringWithFormat:@"%@: task not launched", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_10;
  }
  if ((v2 & 0x200000000) != 0)
  {
    v6 = +[NSString stringWithFormat:@"%@: task still running", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  int v3 = v2 & 0x7F;
  int64_t v4 = 1;
  if (v3) {
    int64_t v4 = 2;
  }
  if (v3 == 127) {
    return 0;
  }
  else {
    return v4;
  }
}

- (BOOL)isRunning
{
  unint64_t v2 = atomic_load(&self->__exitRunningInfo);
  return (~v2 & 0x300000000) == 0;
}

- (void)launch
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  os_unfair_lock_unlock(p_lock);

  [(NSConcreteTask *)self launchWithDictionary:dictionary error:0];
}

- (BOOL)launchAndReturnError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  os_unfair_lock_unlock(p_lock);
  [(NSMutableDictionary *)dictionary setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_NSTaskUseErrorsForRuntimeFailures"];

  return [(NSConcreteTask *)self launchWithDictionary:dictionary error:a3];
}

- (BOOL)launchWithDictionary:(id)a3 error:(id *)a4
{
  v108 = a4;
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  int v130 = 2;
  uint64_t v129 = 0x100000000;
  int v107 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"_NSTaskUseErrorsForRuntimeFailures"), "BOOLValue");
  uint64_t v106 = 56;
  unint64_t v6 = atomic_load(&self->__exitRunningInfo);
  if ((v6 & 0x100000000) != 0)
  {
    if (v107)
    {
      BOOL v11 = 0;
      if (v108) {
        id *v108 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3587 userInfo:0];
      }
      return v11;
    }
    v85 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v86 = *MEMORY[0x1E4F1C3C8];
    v87 = @"task already launched";
LABEL_199:
    objc_exception_throw((id)[v85 exceptionWithName:v86 reason:v87 userInfo:0]);
  }
  if (!a3)
  {
    v85 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v86 = *MEMORY[0x1E4F1C3C8];
    v87 = @"need a dictionary";
    goto LABEL_199;
  }
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v109 = 16;
  dictionary = self->_dictionary;
  id v8 = (objc_class *)a3;
  id v104 = a3;
  if (dictionary != a3)
  {
    id v8 = (objc_class *)[v104 mutableCopyWithZone:0];
    *(Class *)((char *)&self->super.super.isa + v109) = v8;
    if (dictionary)
    {

      id v8 = *(Class *)((char *)&self->super.super.isa + v109);
    }
  }
  [(objc_class *)v8 removeObjectForKey:@"_NSTaskTerminationStatus"];
  [*(id *)((char *)&self->super.super.isa + v109) removeObjectForKey:@"_NSTaskHasBeenLaunched"];
  qos_class_t v9 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v109), "objectForKey:", @"_NSTaskExecutablePath"), "stringByStandardizingPath");
  if (([v9 getFileSystemRepresentation:v131 maxLength:1024] & 1) == 0
    || access((const char *)v131, 1))
  {
    if (!v107) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"launch path not accessible" userInfo:0]);
    }
    if (v9)
    {
      if (v108)
      {
        v127 = @"NSFilePath";
        v128 = v9;
        v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1]);
LABEL_18:
        BOOL v11 = 0;
        id *v108 = v10;
        goto LABEL_195;
      }
    }
    else if (v108)
    {
      v10 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:4 userInfo:0];
      goto LABEL_18;
    }
LABEL_34:
    BOOL v11 = 0;
    goto LABEL_195;
  }
  v12 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v109), "objectForKey:", @"_NSTaskDirectoryPath"), "stringByStandardizingPath");
  if (v12
    && ![+[NSFileManager defaultManager] fileExistsAtPath:v12])
  {
    if (!v107) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"working directory doesn't exist." userInfo:0]);
    }
    if (v108)
    {
      v125 = @"NSFilePath";
      v126 = v12;
      v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1]);
      goto LABEL_18;
    }
    goto LABEL_34;
  }
  v13 = (void *)[*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskArgumentArray"];
  uint64_t v14 = [v13 count];
  if (v14 > 4096)
  {
    v88 = +[NSString stringWithFormat:@"too many arguments (%ld) -- limit is 4096", v14];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v88 userInfo:0]);
  }
  v101 = (char *)[v9 fileSystemRepresentation];
  v96 = v93;
  MEMORY[0x1F4188790](v101);
  v17 = (char **)&v93[-((v16 + 31) & 0xFFFFFFFFFFFFFFF0)];
  if (v15 >= 0x200) {
    size_t v18 = 512;
  }
  else {
    size_t v18 = v15;
  }
  bzero(&v93[-((v16 + 31) & 0xFFFFFFFFFFFFFFF0)], v18);
  *v17 = v101;
  v100 = v17;
  if (v14 < 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      v20 = (void *)[v13 objectAtIndex:i];
      char v21 = [v20 isEqual:&stru_1ECA5C228];
      v22 = "";
      if ((v21 & 1) == 0) {
        v22 = (const char *)[v20 fileSystemRepresentation];
      }
      v17[i + 1] = (char *)v22;
    }
  }
  v100[v14 + 1] = 0;
  uint64_t v95 = [v12 fileSystemRepresentation];
  v23 = (void *)[*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskEnvironmentDictionary"];
  v24 = v23;
  if (v23)
  {
    if ([v23 count])
    {
      uint64_t v25 = [v24 count];
      v102 = malloc_type_malloc(8 * v25 + 8, 0x10040436913F5uLL);
      uint64_t v26 = [v24 keyEnumerator];
      if (v25 < 1)
      {
        uint64_t v30 = 0;
      }
      else
      {
        v27 = (void *)v26;
        v28 = v102;
        uint64_t v103 = v25;
        do
        {
          uint64_t v29 = [v27 nextObject];
          *v28++ = -[NSString fileSystemRepresentation](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@=%@", v29, [v24 objectForKey:v29]), "fileSystemRepresentation");
          --v25;
        }
        while (v25);
        uint64_t v30 = v103;
      }
      v102[v30] = 0;
      int v97 = 1;
    }
    else
    {
      int v97 = 0;
      v102 = 0;
    }
  }
  else
  {
    v31 = _NSGetEnviron();
    int v97 = 0;
    v102 = *v31;
  }
  uint64_t v132 = 0;
  memset(v131, 0, sizeof(v131));
  v32 = (void *)[*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskPreferredArchitectureArray"];
  v33 = v32;
  if (v32
    && (long long v123 = 0u,
        long long v124 = 0u,
        long long v121 = 0u,
        long long v122 = 0u,
        (uint64_t v34 = [v32 countByEnumeratingWithState:&v121 objects:v120 count:16]) != 0))
  {
    int v35 = 0;
    uint64_t v36 = *(void *)v122;
    while (2)
    {
      uint64_t v37 = 0;
      int v38 = v35;
      uint64_t v39 = (9 - v35);
      do
      {
        if (*(void *)v122 != v36) {
          objc_enumerationMutation(v33);
        }
        v131[v38 + v37] = [*(id *)(*((void *)&v121 + 1) + 8 * v37) intValue];
        if (v39 == v37)
        {
          int v40 = 10;
          goto LABEL_58;
        }
        ++v37;
      }
      while (v34 != v37);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v121 objects:v120 count:16];
      int v35 = v38 + v37;
      if (v34) {
        continue;
      }
      break;
    }
    int v40 = v38 + v37;
  }
  else
  {
    int v40 = 0;
  }
LABEL_58:
  v41 = (void *)[*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskInputFileHandle"];
  if (v41)
  {
    if (objc_opt_isKindOfClass())
    {
      v42 = (void *)[v41 fileHandleForReading];
      int v43 = [v42 fileDescriptor];
    }
    else
    {
      int v43 = [v41 fileDescriptor];
      v42 = 0;
    }
    LODWORD(v129) = v43;
  }
  else
  {
    v42 = 0;
    LODWORD(v129) = -1;
  }
  v44 = (void *)[*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskOutputFileHandle"];
  if (v44)
  {
    if (objc_opt_isKindOfClass())
    {
      id v45 = (id)[v44 fileHandleForWriting];
      int v46 = [v45 fileDescriptor];
    }
    else
    {
      int v46 = [v44 fileDescriptor];
      id v45 = 0;
    }
  }
  else
  {
    id v45 = 0;
    int v46 = -1;
  }
  HIDWORD(v129) = v46;
  v47 = (void *)[*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskDiagnosticFileHandle"];
  if (v47)
  {
    if (objc_opt_isKindOfClass())
    {
      v47 = (void *)[v47 fileHandleForWriting];
      int v48 = [v47 fileDescriptor];
    }
    else
    {
      int v48 = [v47 fileDescriptor];
      v47 = 0;
    }
  }
  else
  {
    int v48 = -1;
  }
  int v130 = v48;
  uint64_t v49 = [*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskLaunchRequirementData"];
  int v94 = v40;
  id v98 = v42;
  id v99 = v47;
  LODWORD(v103) = open("/dev/null", 2, 0);
  int v119 = -1;
  posix_spawn_file_actions_t v117 = 0;
  uint64_t v118 = -1;
  posix_spawn_file_actions_init(&v117);
  v50 = (void *)v49;
  for (uint64_t j = 0; j != 3; ++j)
  {
    uint64_t v52 = *((unsigned int *)&v129 + j);
    if (j == v52)
    {
      int v53 = dup(*((_DWORD *)&v129 + j));
      if (v53 == -1)
      {
        *((_DWORD *)&v129 + j) = -1;
        goto LABEL_82;
      }
      *((_DWORD *)&v118 + j) = v53;
      uint64_t v54 = posix_spawn_file_actions_adddup2(&v117, v53, j);
      if (v54) {
        goto LABEL_106;
      }
    }
    if (v52 != -1)
    {
      uint64_t v54 = posix_spawn_file_actions_adddup2(&v117, v52, j);
      if (v54) {
        goto LABEL_106;
      }
      continue;
    }
LABEL_82:
    uint64_t v54 = posix_spawn_file_actions_adddup2(&v117, v103, j);
    uint64_t v52 = 0xFFFFFFFFLL;
    if (v54)
    {
LABEL_106:
      for (uint64_t k = 0; k != 12; k += 4)
      {
        int v64 = *(_DWORD *)((char *)&v118 + k);
        if (v64 != -1) {
          close(v64);
        }
      }
      id v65 = v99;
      if (v98) {
        [v98 closeFile];
      }
      if (v45) {
        [v45 closeFile];
      }
      if (v65 && v65 != v45) {
        [v65 closeFile];
      }
      posix_spawn_file_actions_destroy(&v117);
      if (v103 != -1) {
        close(v103);
      }
      if (v97) {
        free(v102);
      }
      if (!v107)
      {
        v89 = +[NSString stringWithFormat:@"Failed to set posix_spawn_file_actions for fd %d at index %d with errno %d", v52, j, v54];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v89 userInfo:0]);
      }
      if (!v108) {
        goto LABEL_194;
      }
      goto LABEL_123;
    }
  }
  posix_spawnattr_t v116 = 0;
  posix_spawnattr_init(&v116);
  id v55 = v45;
  sigset_t v115 = 0;
  sigset_t v114 = -1;
  posix_spawnattr_setsigmask(&v116, &v115);
  posix_spawnattr_setsigdefault(&v116, &v114);
  if ([*(id *)((char *)&self->super.super.isa + v109) objectForKey:@"_NSTaskNoNewProcessGroup"]) {
    __int16 v56 = 16396;
  }
  else {
    __int16 v56 = 16398;
  }
  uint64_t v57 = posix_spawnattr_setflags(&v116, v56);
  uint64_t v58 = v57;
  qos_class_t qos = self->_qos;
  BOOL v60 = qos == QOS_CLASS_BACKGROUND || qos == QOS_CLASS_UTILITY;
  if (v60 && !v57) {
    uint64_t v58 = posix_spawnattr_set_qos_class_np(&v116, qos);
  }
  if (v94 >= 1 && !v58)
  {
    size_t v113 = 0;
    uint64_t v58 = posix_spawnattr_setbinpref_np(&v116, v94, v131, &v113);
  }
  if (v50) {
    amfi_launch_constraint_set_spawnattr((uint64_t)&v116, [v50 bytes], objc_msgSend(v50, "length"));
  }
  uint64_t v61 = 0;
  int v62 = -1;
  if (v95 && !v58)
  {
    int v62 = open(".", 0);
    if (__pthread_fchdir() == -1 && v62 != -1)
    {
      close(v62);
      int v62 = -1;
    }
    if (__pthread_chdir() == -1) {
      uint64_t v61 = *__error();
    }
    else {
      uint64_t v61 = 0;
    }
  }
  if (!(v61 | v58))
  {
LABEL_150:
    uint64_t v69 = 11;
    while (1)
    {
      uint64_t v54 = posix_spawn(&self->_pid, v101, &v117, &v116, v100, (char *const *)v102);
      if (v54 != 35) {
        break;
      }
      if (!--v69)
      {
        __PTHREAD_SPAWN_EAGAIN_OVERLIMIT__();
        uint64_t v54 = 35;
        break;
      }
      if (nanosleep(&launchWithDictionary_error__spawnSleep, 0))
      {
        uint64_t v54 = *__error();
        break;
      }
    }
    for (uint64_t m = 0; m != 12; m += 4)
    {
      int v71 = *(_DWORD *)((char *)&v118 + m);
      if (v71 != -1) {
        close(v71);
      }
    }
    if (v95)
    {
      __pthread_fchdir();
      if (v62 != -1) {
        close(v62);
      }
    }
    if (!v54)
    {
      atomic_fetch_or((atomic_ullong *volatile)((char *)self + v106), 0x300000000uLL);
      uint64_t v72 = v109;
      id v73 = *(Class *)((char *)&self->super.super.isa + v109);
      id v74 = v104;
      if (v73 == v104)
      {
        *(Class *)((char *)&self->super.super.isa + v72) = (Class)[v104 mutableCopyWithZone:0];

        id v73 = *(Class *)((char *)&self->super.super.isa + v72);
      }
      [v73 setObject:@"YES" forKey:@"_NSTaskHasBeenLaunched"];
      if (v98) {
        [v98 closeFile];
      }
      if (v55) {
        [v55 closeFile];
      }
      if (v99 && v99 != v55) {
        [v99 closeFile];
      }
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      v76 = (__CFRunLoop *)CFRetain(Current);
      memset(&v112.retain, 0, 64);
      v112.versiouint64_t n = 0;
      v112.info = self;
      CFAllocatorRef v77 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
      v78 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &v112);
      CFRunLoopAddSource(v76, v78, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      Mutable = (__CFArray *)_CFGetTSD();
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(v77, 1, 0);
        _CFSetTSD();
      }
      CFArrayAppendValue(Mutable, self);
      uintptr_t pid = self->_pid;
      qos_class_t v81 = qos_class_main();
      global_queue = dispatch_get_global_queue(v81, 2uLL);
      v83 = dispatch_source_create(MEMORY[0x1E4F14470], pid, 0x80000000uLL, global_queue);
      v111[0] = MEMORY[0x1E4F143A8];
      v111[1] = 3221225472;
      v111[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke;
      v111[3] = &unk_1E51F71D0;
      v111[4] = v83;
      dispatch_source_set_cancel_handler(v83, v111);
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_2;
      v110[3] = &unk_1E51FA818;
      v110[4] = self;
      v110[5] = self;
      v110[6] = v83;
      v110[7] = v76;
      v110[8] = v78;
      dispatch_source_set_event_handler(v83, v110);
      self->_dsrc = (OS_dispatch_source *)v83;
      dispatch_resume(v83);
      posix_spawnattr_destroy(&v116);
      posix_spawn_file_actions_destroy(&v117);
      close(v103);
      if (v97) {
        free(v102);
      }
      BOOL v11 = 1;
      goto LABEL_195;
    }
    if (v98) {
      [v98 closeFile];
    }
    if (v55) {
      [v55 closeFile];
    }
    if (v99 && v99 != v55) {
      [v99 closeFile];
    }
    posix_spawnattr_destroy(&v116);
    posix_spawn_file_actions_destroy(&v117);
    if (v103 != -1) {
      close(v103);
    }
    if (v97) {
      free(v102);
    }
    if (!v107)
    {
      if (v54 != 86
        || [(NSString *)[+[NSBundle mainBundle] bundleIdentifier] rangeOfString:@"com.mackiev."] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v90 = +[NSString stringWithFormat:@"Couldn't posix_spawn: error %d", v54];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v90 userInfo:0]);
      }
      goto LABEL_194;
    }
    if (!v108) {
      goto LABEL_194;
    }
LABEL_123:
    v66 = +[NSError errorWithDomain:@"NSPOSIXErrorDomain" code:(int)v54 userInfo:0];
LABEL_124:
    BOOL v11 = 0;
    id *v108 = v66;
    goto LABEL_195;
  }
  for (uint64_t n = 0; n != 12; n += 4)
  {
    int v68 = *(_DWORD *)((char *)&v118 + n);
    if (v68 != -1) {
      close(v68);
    }
  }
  if (v98) {
    [v98 closeFile];
  }
  if (v55) {
    [v55 closeFile];
  }
  if (v99 && v99 != v55) {
    [v99 closeFile];
  }
  posix_spawnattr_destroy(&v116);
  posix_spawn_file_actions_destroy(&v117);
  if (v103 != -1) {
    close(v103);
  }
  if (v97) {
    free(v102);
  }
  if (!v58)
  {
    if (v61)
    {
      if (!v107)
      {
        v92 = +[NSString stringWithFormat:@"Failed to set working directory to %s with error %d", v95, v61];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v92 userInfo:0]);
      }
      if (v108)
      {
        v66 = +[NSError errorWithDomain:@"NSPOSIXErrorDomain" code:(int)v61 userInfo:0];
        goto LABEL_124;
      }
      goto LABEL_194;
    }
    goto LABEL_150;
  }
  if (!v107)
  {
    v91 = +[NSString stringWithFormat:@"Failed to setup posix spawn attributes with error %d", v58];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v91 userInfo:0]);
  }
  if (v108)
  {
    v66 = +[NSError errorWithDomain:@"NSPOSIXErrorDomain" code:(int)v58 userInfo:0];
    goto LABEL_124;
  }
LABEL_194:
  BOOL v11 = 0;
LABEL_195:
  os_unfair_lock_unlock(p_lock);
  return v11;
}

void __45__NSConcreteTask_launchWithDictionary_error___block_invoke(uint64_t a1)
{
}

void __45__NSConcreteTask_launchWithDictionary_error___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock(v2);
  *(void *)(*(void *)(a1 + 40) + 32) = 0;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
  int v13 = 0;
  do
    pid_t v3 = waitpid(*(_DWORD *)(*(void *)(a1 + 40) + 48), &v13, 0);
  while (v3 < 0 && *__error() == 4);
  int v4 = v13;
  if (v3 < 0) {
    int v4 = -1;
  }
  atomic_fetch_or((atomic_ullong *volatile)(*(void *)(a1 + 40) + 56), v4);
  atomic_fetch_and((atomic_ullong *volatile)(*(void *)(a1 + 40) + 56), 0xFFFFFFFDFFFFFFFFLL);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v6)
  {
    atomic_fetch_or((atomic_ullong *volatile)(v5 + 56), 0x800000000uLL);
    qos_class_t v7 = qos_class_main();
    global_queue = dispatch_get_global_queue(v7, 2uLL);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_3;
    block[3] = &unk_1E51F7EE0;
    block[4] = *(void *)(a1 + 40);
    block[5] = v6;
    dispatch_async(global_queue, block);
  }
  else
  {
    qos_class_t v9 = *(__CFRunLoop **)(a1 + 56);
    v10 = (const void *)*MEMORY[0x1E4F1D410];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_4;
    v11[3] = &unk_1E51F71D0;
    v11[4] = v5;
    CFRunLoopPerformBlock(v9, v10, v11);
  }
  CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 56), *(CFRunLoopSourceRef *)(a1 + 64), (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 64));
  os_unfair_lock_unlock(v2);
}

uint64_t __45__NSConcreteTask_launchWithDictionary_error___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 _setTerminationHandler:0];
}

uint64_t __45__NSConcreteTask_launchWithDictionary_error___block_invoke_4(uint64_t result)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(result + 32) + 56));
  if ((v1 & 0xC00000000) == 0)
  {
    uint64_t v2 = result;
    atomic_fetch_or((atomic_ullong *volatile)(*(void *)(result + 32) + 56), 0x400000000uLL);
    pid_t v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = *(void *)(v2 + 32);
    return [(NSNotificationCenter *)v3 postNotificationName:@"NSTaskDidTerminateNotification" object:v4 userInfo:0];
  }
  return result;
}

- (void)waitUntilExit
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  _CFAutoreleasePoolPush();
  CFArrayRef v3 = (const __CFArray *)_CFGetTSD();
  if (v3)
  {
    CFArrayRef v4 = v3;
    v17.length = CFArrayGetCount(v3);
    v17.locatiouint64_t n = 0;
    BOOL v5 = CFArrayContainsValue(v4, v17, self) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  memset(&context.retain, 0, 64);
  context.versiouint64_t n = 0;
  context.info = self;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  qos_class_t v7 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &context);
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(Current, v7, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  BOOL v11 = __31__NSConcreteTask_waitUntilExit__block_invoke;
  v12 = &unk_1E51FA840;
  int v13 = self;
  BOOL v14 = v5;
  unint64_t v9 = atomic_load(&self->__exitRunningInfo);
  if ((v9 & 0x200000000) != 0 || (v9 & 0x400000000) == 0 && (v9 & 0x800000000) == 0 && v14)
  {
    do
      CFRunLoopRunInMode(v8, 0.0625, 1u);
    while ((((uint64_t (*)(void *))v11)(v10) & 1) != 0);
  }
  CFRunLoopRemoveSource(Current, v7, v8);
  CFRelease(v7);
  _CFAutoreleasePoolPop();
}

BOOL __31__NSConcreteTask_waitUntilExit__block_invoke(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 56));
  if ((v1 & 0x200000000) != 0) {
    return 1;
  }
  if ((v1 & 0x400000000) != 0) {
    return 0;
  }
  return (v1 & 0x800000000) == 0 && *(unsigned char *)(a1 + 40) != 0;
}

- (void)_withTaskDictionary:(id)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_dictionary) {
    self->_dictionary = (NSMutableDictionary *)+[NSTask currentTaskDictionary];
  }
  (*((void (**)(id))a3 + 2))(a3);

  os_unfair_lock_unlock(p_lock);
}

- (void)setArguments:(id)a3
{
}

- (void)setPreferredArchitectures:(id)a3
{
}

- (void)setLaunchRequirementData:(id)a3
{
}

- (void)setCurrentDirectoryPath:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
  }

  COPY_SETTER_IMPL((uint64_t)self, (uint64_t)v3, @"_NSTaskEnvironmentDictionary", 0);
}

- (void)setLaunchPath:(id)a3
{
}

- (id)launchPath
{
  return COPY_GETTER_IMPL((uint64_t)self, @"_NSTaskExecutablePath");
}

- (id)environment
{
  return COPY_GETTER_IMPL((uint64_t)self, @"_NSTaskEnvironmentDictionary");
}

- (id)arguments
{
  return COPY_GETTER_IMPL((uint64_t)self, @"_NSTaskArgumentArray");
}

- (id)preferredArchitectures
{
  return COPY_GETTER_IMPL((uint64_t)self, @"_NSTaskPreferredArchitectureArray");
}

- (id)launchRequirementData
{
  return COPY_GETTER_IMPL((uint64_t)self, @"_NSTaskLaunchRequirementData");
}

- (id)currentDirectoryPath
{
  return COPY_GETTER_IMPL((uint64_t)self, @"_NSTaskDirectoryPath");
}

- (id)standardInput
{
  return GETTER_IMPL((uint64_t)self, @"_NSTaskInputFileHandle");
}

- (id)standardOutput
{
  return GETTER_IMPL((uint64_t)self, @"_NSTaskOutputFileHandle");
}

- (id)standardError
{
  return GETTER_IMPL((uint64_t)self, @"_NSTaskDiagnosticFileHandle");
}

- (void)setStandardInput:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, @"_NSTaskInputFileHandle");
  }
  else
  {
    qword_1E8EDF350 = (uint64_t)"Standard input can only be an NSFileHandle or NSPipe";
    __break(1u);
  }
}

- (void)setStandardOutput:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, @"_NSTaskOutputFileHandle");
  }
  else
  {
    qword_1E8EDF350 = (uint64_t)"Standard output can only be an NSFileHandle or NSPipe";
    __break(1u);
  }
}

- (void)setStandardError:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, @"_NSTaskDiagnosticFileHandle");
  }
  else
  {
    qword_1E8EDF350 = (uint64_t)"Standard error can only be an NSFileHandle or NSPipe";
    __break(1u);
  }
}

- (void)setTaskDictionary:(id)a3
{
  unint64_t v3 = atomic_load(&self->__exitRunningInfo);
  if ((v3 & 0x100000000) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"task already launched" userInfo:0]);
  }
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  self->_dictionary = (NSMutableDictionary *)[a3 mutableCopyWithZone:0];
  if (dictionary) {

  }
  os_unfair_lock_unlock(p_lock);
}

- (id)taskDictionary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  CFStringRef v8 = __Block_byref_object_copy__15;
  unint64_t v9 = __Block_byref_object_dispose__15;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__NSConcreteTask_taskDictionary__block_invoke;
  v4[3] = &unk_1E51FA868;
  v4[4] = self;
  v4[5] = &v5;
  [(NSConcreteTask *)self _withTaskDictionary:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __32__NSConcreteTask_taskDictionary__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 56));
  if ((v3 & 0x100000000) != 0) {
    id result = (id)[a2 mutableCopyWithZone:0];
  }
  else {
    id result = a2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)suspend
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (BOOL)resume
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (int64_t)suspendCount
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t suspendCount = self->_suspendCount;
  os_unfair_lock_unlock(p_lock);
  return suspendCount;
}

- (NSConcreteTask)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteTask;
  id result = [(NSTask *)&v3 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    atomic_store(0, (unsigned __int8 *)&result->_isSpawnedProcessDisclaimed);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSConcreteTask *)self standardInput];
  if (objc_opt_isKindOfClass()) {
    [v3 _closeOnDealloc];
  }
  id v4 = [(NSConcreteTask *)self standardOutput];
  if (objc_opt_isKindOfClass()) {
    [v4 _closeOnDealloc];
  }
  id v5 = [(NSConcreteTask *)self standardError];
  if (objc_opt_isKindOfClass()) {
    [v5 _closeOnDealloc];
  }

  dsrc = self->_dsrc;
  if (dsrc)
  {
    dispatch_source_cancel(dsrc);
    self->_dsrc = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteTask;
  [(NSConcreteTask *)&v7 dealloc];
}

- (int)processIdentifier
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_pid;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setStartsNewProcessGroup:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSConcreteTask_setStartsNewProcessGroup___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v4 = a3;
  [(NSConcreteTask *)self _withTaskDictionary:v3];
}

uint64_t __43__NSConcreteTask_setStartsNewProcessGroup___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    return [a2 removeObjectForKey:@"_NSTaskNoNewProcessGroup"];
  }
  else
  {
    BOOL v4 = +[NSNumber numberWithBool:1];
    return [a2 setObject:v4 forKey:@"_NSTaskNoNewProcessGroup"];
  }
}

@end