@interface LKBacktraceLogger
- (BOOL)_copyFrameInformation:(unint64_t)a3 destination:(unint64_t)a4 size:(unint64_t)a5;
- (__darwin_arm_thread_state64)_getThreadStateForThread:(SEL)a3;
- (id)_getBacktraceFromThread:(unsigned int)a3;
- (id)_logWithSymbol:(dl_info *)a3 address:(unint64_t)a4 index:(int)a5;
- (id)getBacktraceFromTrackedThread;
- (unint64_t)_getFPFromThreadState:(__darwin_arm_thread_state64 *)a3;
- (unint64_t)_getLRFromThreadState:(__darwin_arm_thread_state64 *)a3;
- (unint64_t)_getPCFromThreadState:(__darwin_arm_thread_state64 *)a3;
- (unsigned)trackedThread;
- (void)_symbolicateBuffer:(const unint64_t *)a3 symbolsBuffer:(dl_info *)a4 count:(int)a5;
- (void)setTrackedThread:(unsigned int)a3;
- (void)trackCurrentThread;
@end

@implementation LKBacktraceLogger

- (void)trackCurrentThread
{
  uint64_t v3 = MEMORY[0x223C95EE0](self, a2);
  [(LKBacktraceLogger *)self setTrackedThread:v3];
}

- (id)getBacktraceFromTrackedThread
{
  uint64_t v3 = [(LKBacktraceLogger *)self trackedThread];
  return [(LKBacktraceLogger *)self _getBacktraceFromThread:v3];
}

- (id)_getBacktraceFromThread:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v19[15] = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  memset(v16, 0, sizeof(v16));
  [(LKBacktraceLogger *)self _getThreadStateForThread:v3];
  memcpy(v18, v16, sizeof(v18));
  id v6 = [(LKBacktraceLogger *)self _getPCFromThreadState:v18];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    LODWORD(v18[0]) = 134217984;
    *(void *)((char *)v18 + 4) = v6;
    _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "program counter: 0x%lx", (uint8_t *)v18, 0xCu);
  }
  if (v6)
  {
    v19[0] = v6;
    memcpy(v18, v16, sizeof(v18));
    id v6 = [(LKBacktraceLogger *)self _getLRFromThreadState:v18];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      -[LKBacktraceLogger _getBacktraceFromThread:]((uint64_t)v6);
      if (!v6) {
        goto LABEL_27;
      }
    }
    else if (!v6)
    {
      goto LABEL_27;
    }
    v19[1] = v6;
    memcpy(v18, v16, sizeof(v18));
    id v6 = [(LKBacktraceLogger *)self _getFPFromThreadState:v18];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      -[LKBacktraceLogger _getBacktraceFromThread:]((uint64_t)v6);
      if (!v6) {
        goto LABEL_27;
      }
    }
    else if (!v6)
    {
      goto LABEL_27;
    }
    v18[0] = 0uLL;
    BOOL v7 = [(LKBacktraceLogger *)self _copyFrameInformation:v6 destination:v18 size:16];
    id v6 = 0;
    if (v7)
    {
      uint64_t v8 = *((void *)&v18[0] + 1);
      uint64_t v9 = 2;
      if (*((void *)&v18[0] + 1) && *(void *)&v18[0])
      {
        unint64_t v10 = 2;
        while (1)
        {
          v19[v10] = v8;
          long long v17 = 0uLL;
          if (!-[LKBacktraceLogger _copyFrameInformation:destination:size:](self, "_copyFrameInformation:destination:size:"))break; {
          uint64_t v9 = v10 + 1;
          }
          v18[0] = v17;
          if (v10 <= 0xD)
          {
            uint64_t v8 = *((void *)&v18[0] + 1);
            if (*((void *)&v18[0] + 1))
            {
              ++v10;
              if (*(void *)&v18[0]) {
                continue;
              }
            }
          }
          goto LABEL_16;
        }
        id v6 = 0;
      }
      else
      {
LABEL_16:
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          LODWORD(v17) = 67109120;
          DWORD1(v17) = v9;
          _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "backtrace's size: %d", (uint8_t *)&v17, 8u);
        }
        uint64_t v11 = v9;
        v12 = &v16[-2 * v9];
        bzero(v12, 32 * v9);
        [(LKBacktraceLogger *)self _symbolicateBuffer:v19 symbolsBuffer:v12 count:v9];
        uint64_t v13 = 0;
        do
        {
          if (v12[2])
          {
            v14 = [(LKBacktraceLogger *)self _logWithSymbol:v12 address:v19[v13] index:v13];
            [v5 addObject:v14];
          }
          ++v13;
          v12 += 4;
        }
        while (v11 != v13);
        id v6 = v5;
      }
    }
  }
LABEL_27:

  return v6;
}

- (__darwin_arm_thread_state64)_getThreadStateForThread:(SEL)a3
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
    result = (__darwin_arm_thread_state64 *)os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (result) {
      -[LKBacktraceLogger _getThreadStateForThread:]();
    }
  }
  return result;
}

- (unint64_t)_getPCFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__pc;
}

- (unint64_t)_getLRFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__lr;
}

- (unint64_t)_getFPFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__fp;
}

- (BOOL)_copyFrameInformation:(unint64_t)a3 destination:(unint64_t)a4 size:(unint64_t)a5
{
  kern_return_t v6;
  vm_size_t outsize;

  outsize = 0;
  id v6 = vm_read_overwrite(*MEMORY[0x263EF8960], a3, a5, a4, &outsize);
  if (v6 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[LKBacktraceLogger _copyFrameInformation:destination:size:](a3);
  }
  return v6 == 0;
}

- (void)_symbolicateBuffer:(const unint64_t *)a3 symbolsBuffer:(dl_info *)a4 count:(int)a5
{
  if (a5 >= 1)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 8 * a5;
    uint64_t v9 = a4;
    do
    {
      if (v7)
      {
        unint64_t v10 = (const void *)((a3[v7 / 8] & 0xFFFFFFFFFFFFFFFCLL) - 1);
        uint64_t v11 = v9;
      }
      else
      {
        unint64_t v10 = (const void *)*a3;
        uint64_t v11 = a4;
      }
      dladdr(v10, v11);
      v7 += 8;
      ++v9;
    }
    while (v8 != v7);
  }
}

- (id)_logWithSymbol:(dl_info *)a3 address:(unint64_t)a4 index:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  dli_fname = a3->dli_fname;
  if (a3->dli_fname)
  {
    uint64_t v9 = strrchr((char *)a3->dli_fname, 47);
    if (v9) {
      unint64_t v10 = v9 + 1;
    }
    else {
      unint64_t v10 = dli_fname;
    }
  }
  else
  {
    unint64_t v10 = 0;
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

- (void)_getBacktraceFromThread:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "frame pointer: 0x%lx", (uint8_t *)&v1, 0xCu);
}

- (void)_getBacktraceFromThread:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "link register: 0x%lx", (uint8_t *)&v1, 0xCu);
}

- (void)_getThreadStateForThread:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to get thread state", v0, 2u);
}

- (void)_copyFrameInformation:(uint64_t)a1 destination:size:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to copy frame information from 0x%lx", (uint8_t *)&v1, 0xCu);
}

@end