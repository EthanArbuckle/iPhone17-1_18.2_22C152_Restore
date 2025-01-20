@interface DMCBacktraceLogger
+ (BOOL)_copyFrameInformation:(unint64_t)a3 destination:(unint64_t)a4 size:(unint64_t)a5;
+ (BOOL)dumpStackshotToPath:(id)a3 fileName:(id)a4;
+ (__darwin_arm_thread_state64)_getThreadStateForThread:(SEL)a3;
+ (id)_getBacktraceFromThread:(unsigned int)a3 bufferSize:(int)a4;
+ (id)_logWithSymbol:(dl_info *)a3 address:(unint64_t)a4 index:(int)a5;
+ (id)callerOfCurrentMethod;
+ (unint64_t)_getFPFromThreadState:(__darwin_arm_thread_state64 *)a3;
+ (unint64_t)_getLRFromThreadState:(__darwin_arm_thread_state64 *)a3;
+ (unint64_t)_getPCFromThreadState:(__darwin_arm_thread_state64 *)a3;
+ (void)_symbolicateBuffer:(const unint64_t *)a3 symbolsBuffer:(dl_info *)a4 count:(int)a5;
- (id)getBacktraceFromTrackedThread;
- (unsigned)trackedThread;
- (void)setTrackedThread:(unsigned int)a3;
- (void)trackCurrentThread;
@end

@implementation DMCBacktraceLogger

+ (id)callerOfCurrentMethod
{
  v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  if ((unint64_t)[v2 count] >= 3)
  {
    v4 = [v2 objectAtIndexedSubscript:2];
    objc_msgSend(v4, "dmc_substringWithPattern:", @".*0x[a-f0-9]*\\s(.*)\\s\\+.*");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"Unknown";
  }

  return v3;
}

+ (BOOL)dumpStackshotToPath:(id)a3 fileName:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  v9 = [a1 callerOfCurrentMethod];
  v10 = [v8 stringWithFormat:@"Requested by: %@", v9];
  int v11 = WriteStackshotReport();

  if (v11)
  {
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v43 = 0;
    v13 = [v12 contentsOfDirectoryAtPath:@"/private/var/mobile/Library/Logs/CrashReporter" error:&v43];
    id v14 = v43;
    BOOL v15 = v14 == 0;
    if (v14)
    {
      v16 = *DMCLogObjects();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v46 = v14;
        _os_log_impl(&dword_1A7863000, v16, OS_LOG_TYPE_ERROR, "Failed to grab all files under crash report folder: %{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
    v38 = objc_opt_new();
    [v38 setDateFormat:@"yyyy-MM-dd-HHmmss"];
    v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v13;
    uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v33 = v13;
      BOOL v34 = v14 == 0;
      v35 = v12;
      v36 = v6;
      v20 = 0;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v24 = objc_msgSend(v23, "dmc_substringWithPattern:", @"stacks-([0-9-]*).*ips");
          v25 = [v38 dateFromString:v24];
          v26 = [v17 laterDate:v25];

          if (v26 != v17)
          {
            id v27 = v25;

            id v28 = v23;
            v20 = v28;
            v17 = v27;
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v19);

      if (!v20)
      {
        id v6 = v36;
        v12 = v35;
        BOOL v15 = v34;
        id v14 = 0;
        v13 = v33;
        goto LABEL_23;
      }
      v12 = v35;
      id v6 = v36;
      id v14 = 0;
      if (([v35 fileExistsAtPath:v36 isDirectory:0] & 1) == 0) {
        [v35 createDirectoryAtPath:v36 withIntermediateDirectories:1 attributes:0 error:0];
      }
      v29 = [v36 stringByAppendingPathComponent:v7];
      v30 = [@"/private/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:v20];
      DMCSafelyCopyItemAtPathToDestinationPathFM(v35, v30, v29, 0);

      v31 = *DMCLogObjects();
      BOOL v15 = v34;
      v13 = v33;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v46 = v29;
        _os_log_impl(&dword_1A7863000, v31, OS_LOG_TYPE_DEFAULT, "DMCBacktraceLogger: stackshot collected. Location: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v20 = 0;
      v29 = obj;
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  BOOL v15 = 0;
LABEL_25:

  return v15;
}

- (void)trackCurrentThread
{
  uint64_t v3 = MEMORY[0x1AD0D1F40](self, a2);
  [(DMCBacktraceLogger *)self setTrackedThread:v3];
}

- (id)getBacktraceFromTrackedThread
{
  uint64_t v2 = [(DMCBacktraceLogger *)self trackedThread];
  return +[DMCBacktraceLogger _getBacktraceFromThread:v2 bufferSize:15];
}

+ (id)_getBacktraceFromThread:(unsigned int)a3 bufferSize:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = &v22[-((8 * a4 + 15) & 0xFFFFFFFF0) - 16];
  v8 = objc_opt_new();
  memset(v22, 0, sizeof(v22));
  [a1 _getThreadStateForThread:v5];
  memcpy(v23, v22, sizeof(v23));
  id v9 = (id)[a1 _getPCFromThreadState:v23];
  v10 = *DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(v23[0]) = 134217984;
    *(void *)((char *)v23 + 4) = v9;
    _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_INFO, "program counter: 0x%lx", (uint8_t *)v23, 0xCu);
  }
  if (v9)
  {
    *id v7 = v9;
    memcpy(v23, v22, sizeof(v23));
    id v9 = (id)[a1 _getLRFromThreadState:v23];
    int v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(v23[0]) = 134217984;
      *(void *)((char *)v23 + 4) = v9;
      _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_INFO, "link register: 0x%lx", (uint8_t *)v23, 0xCu);
    }
    if (v9)
    {
      v7[1] = v9;
      memcpy(v23, v22, sizeof(v23));
      id v9 = (id)[a1 _getFPFromThreadState:v23];
      v12 = *DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LODWORD(v23[0]) = 134217984;
        *(void *)((char *)v23 + 4) = v9;
        _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_INFO, "frame pointer: 0x%lx", (uint8_t *)v23, 0xCu);
      }
      if (v9)
      {
        v23[0] = 0uLL;
        int v13 = [a1 _copyFrameInformation:v9 destination:v23 size:16];
        id v9 = 0;
        if (v13)
        {
          unint64_t v14 = 2;
          if (a4 >= 3 && (uint64_t v15 = *((void *)&v23[0] + 1)) != 0 && *(void *)&v23[0])
          {
            unint64_t v14 = 2;
            while (1)
            {
              v7[v14] = v15;
              if (!objc_msgSend(a1, "_copyFrameInformation:destination:size:", 0, 0)) {
                break;
              }
              ++v14;
              v23[0] = v21;
              if (v14 < a4)
              {
                uint64_t v15 = *((void *)&v23[0] + 1);
                if (*((void *)&v23[0] + 1))
                {
                  if (*(void *)&v23[0]) {
                    continue;
                  }
                }
              }
              goto LABEL_19;
            }
            id v9 = 0;
          }
          else
          {
LABEL_19:
            uint64_t v16 = v14;
            v17 = &v22[-32 * v14 - 16];
            bzero(v17, 32 * v14);
            [a1 _symbolicateBuffer:v7 symbolsBuffer:v17 count:v14];
            uint64_t v18 = 0;
            do
            {
              if (v17[2])
              {
                uint64_t v19 = [a1 _logWithSymbol:v17 address:v7[v18] index:v18];
                [v8 addObject:v19];
              }
              ++v18;
              v17 += 4;
            }
            while (v16 != v18);
            id v9 = v8;
          }
        }
      }
    }
  }

  return v9;
}

+ (__darwin_arm_thread_state64)_getThreadStateForThread:(SEL)a3
{
  *(_OWORD *)&retstr->__lr = 0u;
  *(_OWORD *)&retstr->__pc = 0u;
  *(_OWORD *)&retstr->__x[26] = 0u;
  *(_OWORD *)&retstr->__x[28] = 0u;
  *(_OWORD *)&retstr->__x[22] = 0u;
  *(_OWORD *)&retstr->__x[24] = 0u;
  *(_OWORD *)&retstr->__x[18] = 0u;
  *(_OWORD *)&retstr->__x[20] = 0u;
  *(_OWORD *)&retstr->__x[14] = 0u;
  *(_OWORD *)&retstr->__x[16] = 0u;
  *(_OWORD *)&retstr->__x[10] = 0u;
  *(_OWORD *)&retstr->__x[12] = 0u;
  *(_OWORD *)&retstr->__x[6] = 0u;
  *(_OWORD *)&retstr->__x[8] = 0u;
  *(_OWORD *)&retstr->__x[2] = 0u;
  *(_OWORD *)&retstr->__x[4] = 0u;
  *(_OWORD *)retstr->__x = 0u;
  mach_msg_type_number_t old_stateCnt = 68;
  result = (__darwin_arm_thread_state64 *)thread_get_state(a4, 6, (thread_state_t)retstr, &old_stateCnt);
  if (result)
  {
    uint64_t v5 = *DMCLogObjects();
    result = (__darwin_arm_thread_state64 *)os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "Failed to get thread state", v6, 2u);
    }
  }
  return result;
}

+ (unint64_t)_getPCFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__pc;
}

+ (unint64_t)_getLRFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__lr;
}

+ (unint64_t)_getFPFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__fp;
}

+ (BOOL)_copyFrameInformation:(unint64_t)a3 destination:(unint64_t)a4 size:(unint64_t)a5
{
  kern_return_t v6;
  NSObject *v7;
  vm_size_t outsize;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E4F143B8];
  outsize = 0;
  id v6 = vm_read_overwrite(*MEMORY[0x1E4F14960], a3, a5, a4, &outsize);
  if (v6)
  {
    id v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int v11 = a3;
      _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_ERROR, "Failed to copy frame information from 0x%lx", buf, 0xCu);
    }
  }
  return v6 == 0;
}

+ (void)_symbolicateBuffer:(const unint64_t *)a3 symbolsBuffer:(dl_info *)a4 count:(int)a5
{
  if (a5 >= 1)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 8 * a5;
    id v9 = a4;
    do
    {
      if (v7)
      {
        v10 = (const void *)((a3[v7 / 8] & 0xFFFFFFFFFFFFFFFCLL) - 1);
        int v11 = v9;
      }
      else
      {
        v10 = (const void *)*a3;
        int v11 = a4;
      }
      dladdr(v10, v11);
      v7 += 8;
      ++v9;
    }
    while (v8 != v7);
  }
}

+ (id)_logWithSymbol:(dl_info *)a3 address:(unint64_t)a4 index:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  dli_fname = a3->dli_fname;
  if (a3->dli_fname)
  {
    id v9 = strrchr((char *)a3->dli_fname, 47);
    if (v9) {
      v10 = v9 + 1;
    }
    else {
      v10 = dli_fname;
    }
  }
  else
  {
    v10 = 0;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%2d %-30s  0x%08lx %s + %lu", v5, v10, a4, a3->dli_sname, a4 - (unint64_t)a3->dli_saddr);
}

- (unsigned)trackedThread
{
  return self->_trackedThread;
}

- (void)setTrackedThread:(unsigned int)a3
{
  self->_trackedThread = a3;
}

@end