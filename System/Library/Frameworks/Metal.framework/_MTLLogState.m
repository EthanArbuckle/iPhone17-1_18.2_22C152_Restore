@interface _MTLLogState
+ (int64_t)convertToLogLevel:(const char *)a3;
- (BOOL)checkAndGetMessage:(MessageHeader *)a3 logBuffer:(LogBuffer *)a4 message:(void *)a5;
- (_MTLLogState)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5;
- (void)addLogHandler:(id)a3;
- (void)dealloc;
- (void)decodeLog;
- (void)defaultLogHandler:(id)a3 category:(id)a4 level:(int64_t)a5 message:(id)a6;
- (void)invokeLogHandlers:(id)a3 category:(id)a4 level:(int64_t)a5 message:(id)a6;
- (void)populateDefaultLoggerCache:(id)a3 subsystem:(id)a4 category:(id)a5;
@end

@implementation _MTLLogState

- (_MTLLogState)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)_MTLLogState;
  v8 = [(_MTLLogState *)&v28 init];
  v9 = v8;
  if (!v8) {
    return v9;
  }
  id v27 = 0;
  v8->defaultLoggerCache = 0;
  v8->droppedMessages = 0;
  if (a4)
  {
    if ([a4 bufferSize] > 1023)
    {
      if ([a4 bufferSize] > 0x40000000 || objc_msgSend(a4, "bufferSize") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"MTLLogState is not created: Maximum size is %ld bytes.", 0x40000000);
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = &v36;
        v13 = &v35;
      }
      else
      {
        v9->_logBufferSize = [a4 bufferSize];
        v9->_logLevel = [a4 level];
        *(void *)&v9->_logHandlerLock._os_unfair_lock_opaque = 0;
        v20 = (MTLBuffer *)[a3 newBufferWithLength:v9->_logBufferSize options:0];
        v9->_logBuffer = v20;
        if (v20)
        {
          [(MTLBuffer *)v20 setLabel:@"MTLLogBuffer"];
          v21 = (_DWORD *)[(MTLBuffer *)v9->_logBuffer contents];
          _DWORD *v21 = v9->_logBufferSize;
          unint64_t v22 = v9->_logLevel - 1;
          if (v22 > 4) {
            int v23 = 0;
          }
          else {
            int v23 = dword_1828D4EC8[v22];
          }
          v21[1] = v23;
          v24 = objc_opt_new();
          [v24 setInitialCapacity:1];
          [v24 setLabel:@"MTLLogBufferResidencySet"];
          logBufferResidencySet = (MTLResidencySet *)[a3 newResidencySetWithDescriptor:v24 error:&v27];
          v9->_logBufferResidencySet = logBufferResidencySet;
          if (!logBufferResidencySet)
          {
            v26 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v31 = *MEMORY[0x1E4F28568];
            uint64_t v32 = [NSString stringWithFormat:@"Cannot create residency set for MTLLogState: %@", objc_msgSend(v27, "localizedDescription")];
            id v27 = (id)objc_msgSend(v26, "errorWithDomain:code:userInfo:", @"MTLLogStateErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
            logBufferResidencySet = v9->_logBufferResidencySet;
          }
          [(MTLResidencySet *)logBufferResidencySet addAllocation:v9->_logBuffer];
          [(MTLResidencySet *)v9->_logBufferResidencySet commit];

          v9->_handlers = 0;
          goto LABEL_11;
        }
        v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v34 = @"Cannot create MTLLogState";
        v11 = (void *)MEMORY[0x1E4F1C9E8];
        v12 = (uint64_t *)&v34;
        v13 = &v33;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38[0] = objc_msgSend(NSString, "stringWithFormat:", @"MTLLogState is not created: minimum size is %d bytes.", 1024);
      v11 = (void *)MEMORY[0x1E4F1C9E8];
      v12 = v38;
      v13 = &v37;
    }
    uint64_t v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
    v16 = v10;
    uint64_t v17 = 1;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30 = @"MTLLogStateDescriptor is nil, MTLLogState is not created";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v16 = v14;
    uint64_t v17 = 2;
  }
  id v27 = (id)[v16 errorWithDomain:@"MTLLogStateErrorDomain" code:v17 userInfo:v15];
LABEL_11:
  v9->metalSubsystem = (NSString *)@"com.apple.Metal";
  v9->shaderLoggingCategory = (NSString *)@"Shader Logging";
  uint64_t v18 = [NSString stringWithFormat:@"%@%@", @"com.apple.Metal", @"Shader Logging"];
  v9->metalLoggingKey = (NSString *)v18;
  [(_MTLLogState *)v9 populateDefaultLoggerCache:v18 subsystem:v9->metalSubsystem category:v9->shaderLoggingCategory];
  if (v27)
  {
    if (a5) {
      *a5 = v27;
    }

    return 0;
  }
  return v9;
}

- (void)addLogHandler:(id)a3
{
  if (a3)
  {
    p_logHandlerLock = &self->_logHandlerLock;
    os_unfair_lock_lock(&self->_logHandlerLock);
    handlers = self->_handlers;
    if (!handlers)
    {
      handlers = (NSMutableArray *)objc_opt_new();
      self->_handlers = handlers;
    }
    [(NSMutableArray *)handlers addObject:_Block_copy(a3)];
    os_unfair_lock_unlock(p_logHandlerLock);
  }
}

- (void)invokeLogHandlers:(id)a3 category:(id)a4 level:(int64_t)a5 message:(id)a6
{
  handlers = self->_handlers;
  if (handlers)
  {
    if ([(NSMutableArray *)handlers count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = (void *)MEMORY[0x18530C9F0]();
        uint64_t v14 = [(NSMutableArray *)self->_handlers objectAtIndexedSubscript:v12];
        (*(void (**)(uint64_t, id, id, int64_t, id))(v14 + 16))(v14, a3, a4, a5, a6);
        ++v12;
      }
      while ([(NSMutableArray *)self->_handlers count] > v12);
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x18530C9F0](0, a2);
    [(_MTLLogState *)self defaultLogHandler:a3 category:a4 level:a5 message:a6];
  }
}

- (BOOL)checkAndGetMessage:(MessageHeader *)a3 logBuffer:(LogBuffer *)a4 message:(void *)a5
{
  BOOL result = 0;
  uint64_t v6 = atomic_load((unsigned int *)a4->var0 + 3);
  unsigned int v7 = atomic_load((unsigned int *)a4->var0 + 2);
  unint64_t v8 = (*(_DWORD *)a4->var0 - 20);
  unsigned int v9 = (v6 + 16) % v8;
  BOOL v10 = v6 < v7;
  if (v7 < v9)
  {
    BOOL v11 = v6 > v9;
  }
  else
  {
    BOOL v10 = 0;
    BOOL v11 = 0;
  }
  if (v6 != v7 && !v10 && !v11)
  {
    uint64_t v15 = v6 % v8;
    size_t v16 = (v8 - v15);
    uint64_t v17 = (MessageHeader *)&a4->var1[v15];
    if (v16 >= 0x10)
    {
      *a3 = *v17;
    }
    else
    {
      memcpy(a3, v17, v16);
      memcpy((char *)a3 + v16, a4->var1, 16 - v16);
    }
    if (a3->var4)
    {
      signed int v18 = a3->var0 - 16;
      std::vector<unsigned char>::reserve((std::vector<char> *)a5, v18);
      v19 = *(char **)a5;
      unsigned int v20 = *(_DWORD *)a4->var0 - 20;
      uint64_t v21 = ((int)v6 + 16) % v20;
      unint64_t v22 = v20 - v21;
      size_t v23 = v18;
      var1 = &a4->var1[v21];
      BOOL v25 = v18 >= v22;
      size_t v26 = v18 - v22;
      if (v26 != 0 && v25)
      {
        memcpy(v19, var1, v20 - v21);
        id v27 = &v19[v22];
        var1 = a4->var1;
        size_t v23 = v26;
      }
      else
      {
        id v27 = v19;
      }
      memcpy(v27, var1, v23);
      unsigned int var0 = a3->var0;
      unsigned int v29 = *(_DWORD *)a4->var0 - 20;
      if (a3->var0 + (int)v6 <= v29)
      {
        uint64_t v31 = &a4->var1[v6];
      }
      else
      {
        int v30 = v29 - v6;
        bzero(&a4->var1[v6], v29 - v6);
        uint64_t v31 = a4->var1;
        var0 -= v30;
      }
      bzero(v31, var0);
      __dmb(0xBu);
      atomic_store((a3->var0 + (int)v6) % (*(_DWORD *)a4->var0 - 20), (unsigned int *)a4->var0 + 3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)populateDefaultLoggerCache:(id)a3 subsystem:(id)a4 category:(id)a5
{
  defaultLoggerCache = self->defaultLoggerCache;
  if (!defaultLoggerCache)
  {
    defaultLoggerCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->defaultLoggerCache = defaultLoggerCache;
  }
  if (![(NSMutableDictionary *)defaultLoggerCache objectForKey:a3])
  {
    os_log_t v10 = os_log_create((const char *)[a4 UTF8String], (const char *)objc_msgSend(a5, "UTF8String"));
    [(NSMutableDictionary *)self->defaultLoggerCache setObject:v10 forKey:a3];
  }
}

- (void)defaultLogHandler:(id)a3 category:(id)a4 level:(int64_t)a5 message:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@%@", a3, a4];
    [(_MTLLogState *)self populateDefaultLoggerCache:v11 subsystem:a3 category:a4];
    unint64_t v12 = [(NSMutableDictionary *)self->defaultLoggerCache objectForKeyedSubscript:v11];
    v13 = v12;
    unint64_t v14 = 0x111000010200uLL >> (8 * a5);
    if ((unint64_t)a5 >= 6) {
      LOBYTE(v14) = 0;
    }
    os_log_type_t v15 = v14;
    if (os_log_type_enabled(v12, (os_log_type_t)v14))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = a6;
      size_t v16 = v13;
LABEL_11:
      _os_log_impl(&dword_1826F6000, v16, v15, "%@", buf, 0xCu);
    }
  }
  else
  {
    unint64_t v17 = 0x111000010200uLL >> (8 * a5);
    if ((unint64_t)a5 >= 6) {
      LOBYTE(v17) = 0;
    }
    os_log_type_t v15 = v17;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], (os_log_type_t)v17))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = a6;
      size_t v16 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
}

- (void)decodeLog
{
  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1826F6000, a1, a3, "Dropped messages due to insufficient log buffer size", v3);
}

- (void)dealloc
{
  self->defaultLoggerCache = 0;
  int v3 = [(NSMutableArray *)self->_handlers count];
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
      _Block_release((const void *)[(NSMutableArray *)self->_handlers objectAtIndexedSubscript:v4++]);
    while (v5 != v4);
  }

  v6.receiver = self;
  v6.super_class = (Class)_MTLLogState;
  [(_MTLLogState *)&v6 dealloc];
}

+ (int64_t)convertToLogLevel:(const char *)a3
{
  if (!a3) {
    return 2;
  }
  if (!strcmp(a3, "MTLLogLevelInfo")) {
    return 2;
  }
  if (!strcmp(a3, "MTLLogLevelDebug")) {
    return 1;
  }
  if (!strcmp(a3, "MTLLogLevelNotice")) {
    return 3;
  }
  if (!strcmp(a3, "MTLLogLevelError")) {
    return 4;
  }
  if (strcmp(a3, "MTLLogLevelFault"))
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v4) {
      +[_MTLLogState convertToLogLevel:v6];
    }
    return 2;
  }
  return 5;
}

+ (void)convertToLogLevel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1826F6000, MEMORY[0x1E4F14500], a3, "MTLLogLevel provided is invalid, defaulting to MTLLogLevelInfo", v3);
}

@end