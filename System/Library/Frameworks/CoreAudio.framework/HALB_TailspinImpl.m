@interface HALB_TailspinImpl
+ (BOOL)enableTailspinSync;
+ (id)initOptionsDictionary;
+ (optional<std::string>)dumpTailspinSync:(optional<std::string> *__return_ptr)retstr forReason:;
+ (void)prepareDumpOptions:(unint64_t)a3 outDict:(id *)a4;
@end

@implementation HALB_TailspinImpl

+ (optional<std::string>)dumpTailspinSync:(optional<std::string> *__return_ptr)retstr forReason:
{
  uint64_t v4 = v2;
  v5 = v1;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = v3;
  if (Symbol<tailspin_config * (*)(void)>::operator BOOL()
    && (Symbol<BOOL (*)(tailspin_config *)>::initialize((uint64_t)&weak_tailspin_enabled_get), weak_tailspin_enabled_get)
    && Symbol<void (*)(tailspin_config *)>::operator BOOL()
    && (Symbol<BOOL (*)(int,NSDictionary *)>::initialize(), weak_tailspin_dump_output_with_options_sync))
  {
    uint64_t v8 = NSTemporaryDirectory();
    uint64_t v28 = *MEMORY[0x1E4F28330];
    v29[0] = &unk_1F1490C28;
    v22 = (void *)v8;
    v23 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v27 = 0;
    [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v23 error:&v27];
    id v21 = v27;

    v10 = [MEMORY[0x1E4F1C9C0] date];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v11 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    v12 = NSString;
    v13 = [v11 stringFromDate:v10];
    v14 = [v12 stringWithFormat:@"AudioHAL_%@.tailspin", v13];

    id v15 = [v22 stringByAppendingPathComponent:v14];
    uint64_t v16 = open((const char *)[v15 UTF8String], 514, 438);
    if (v16 == -1) {
      NSLog(&cfstr_FailedToCreate.isa);
    }
    id v26 = [v5 initOptionsDictionary];
    [v5 prepareDumpOptions:v4 outDict:&v26];
    id v17 = v26;
    v18 = get_TSPDumpOptions_ReasonString();
    [v17 setValue:v7 forKey:v18];

    NSLog(&cfstr_DroppingTailsp.isa, v15);
    Symbol<BOOL (*)(int,NSDictionary *)>::initialize();
    if (weak_tailspin_dump_output_with_options_sync) {
      char v19 = ((uint64_t (*)(uint64_t, id))weak_tailspin_dump_output_with_options_sync)(v16, v26);
    }
    else {
      char v19 = 0;
    }
    close(v16);
    if (v19)
    {
      std::string::basic_string[abi:ne180100]<0>(&v24, (char *)[v15 UTF8String]);
      *(_OWORD *)&retstr->var0.var0 = v24;
      *((void *)&retstr->var0.var1.var0.var0.var0.var1 + 2) = v25;
      LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = 1;
    }
    else
    {
      NSLog(&cfstr_FailedToDropTa.isa);
      retstr->var0.var0 = 0;
      LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = 0;
    }
  }
  else
  {
    retstr->var0.var0 = 0;
    LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = 0;
  }

  return result;
}

+ (BOOL)enableTailspinSync
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  Symbol<void (*)(tailspin_config *,BOOL)>::initialize();
  if (weak_tailspin_enabled_set
    && Symbol<void (*)(tailspin_config *)>::operator BOOL()
    && Symbol<tailspin_config * (*)(void)>::operator BOOL())
  {
    Symbol<tailspin_config * (*)(void)>::initialize();
    if (weak_tailspin_config_create_with_current_state) {
      uint64_t v2 = weak_tailspin_config_create_with_current_state();
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v7 = v2;
    Symbol<void (*)(tailspin_config *,BOOL)>::initialize();
    if (weak_tailspin_enabled_set) {
      ((void (*)(uint64_t, uint64_t))weak_tailspin_enabled_set)(v2, 1);
    }
    *(_DWORD *)buf = 1000000;
    Symbol<void (*)(tailspin_config *,unsigned long long)>::operator()<tailspin_config *&,int>(weak_tailspin_oncore_sampling_period_set, &v7, (int *)buf);
    *(_DWORD *)buf = 0;
    Symbol<void (*)(tailspin_config *,unsigned long long)>::operator()<tailspin_config *&,int>(weak_tailspin_full_sampling_period_set, &v7, (int *)buf);
    uint64_t v8 = &weak_tailspin_buffer_size_set;
    if (atomic_load_explicit((atomic_ullong *volatile)&qword_1E9F784C0, memory_order_acquire) != -1)
    {
      v9 = buf;
      *(void *)buf = &v8;
      std::__call_once(&qword_1E9F784C0, &v9, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<Symbol<void (*)(tailspin_config *,unsigned long)>::initialize(void)::{lambda(void)#1} &&>>);
    }
    if (weak_tailspin_buffer_size_set) {
      weak_tailspin_buffer_size_set(v7, 1024);
    }
    *(_DWORD *)buf = 1;
    LODWORD(v9) = 64;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    uint64_t v8 = (uint64_t (**)(void, void))&weak_tailspin_sampling_option_set;
    if (atomic_load_explicit((atomic_ullong *volatile)&qword_1E9F784F0, memory_order_acquire) != -1)
    {
      v9 = buf;
      *(void *)buf = &v8;
      std::__call_once(&qword_1E9F784F0, &v9, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<Symbol<void (*)(tailspin_config *,int,BOOL)>::initialize(void)::{lambda(void)#1} &&>>);
    }
    if (weak_tailspin_sampling_option_set) {
      weak_tailspin_sampling_option_set(v7, 2, 1);
    }
    Symbol<void (*)(tailspin_config *)>::operator()<tailspin_config *&>(weak_tailspin_kdbg_filter_clear, &v7);
    *(_DWORD *)buf = 1;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 1;
    LODWORD(v9) = 3;
    LOBYTE(v8) = 0;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 1;
    LODWORD(v9) = 169;
    LOBYTE(v8) = 0;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 3;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 4;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 5;
    LODWORD(v9) = 7;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 5;
    LODWORD(v9) = 36;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 5;
    LODWORD(v9) = 42;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 6;
    LODWORD(v9) = 11;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 6;
    LODWORD(v9) = 21;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 6;
    LODWORD(v9) = 42;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 7;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 8;
    LODWORD(v9) = 16;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 9;
    LODWORD(v9) = 2;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 10;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 12;
    LODWORD(v9) = 1;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 31;
    LODWORD(v9) = 5;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 31;
    LODWORD(v9) = 7;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 31;
    LODWORD(v9) = 8;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 32;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 33;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 36;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 37;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 39;
    LODWORD(v9) = 240;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 41;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 43;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 46;
    LODWORD(v9) = 2;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 49;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 50;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 128;
    LODWORD(v9) = 1;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 130;
    LODWORD(v9) = 0;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 130;
    LODWORD(v9) = 5;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 130;
    LODWORD(v9) = 6;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 130;
    LODWORD(v9) = 40;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 133;
    LOBYTE(v9) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9);
    *(_DWORD *)buf = 134;
    LODWORD(v9) = 143;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    *(_DWORD *)buf = 135;
    LODWORD(v9) = 0;
    LOBYTE(v8) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v7, buf, (unsigned __int8 *)&v9, (unsigned __int8 *)&v8);
    Symbol<BOOL (*)(tailspin_config *)>::initialize((uint64_t)&weak_tailspin_config_apply_sync);
    if (weak_tailspin_config_apply_sync)
    {
      int v5 = weak_tailspin_config_apply_sync(v7);
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v6)
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "HALB_Tailspin.mm";
          __int16 v11 = 1024;
          int v12 = 297;
          _os_log_impl(&dword_1BAA78000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::enableTailspin: Enabled tailspin.", buf, 0x12u);
        }
        BOOL v3 = 1;
        goto LABEL_29;
      }
      if (!v6) {
        goto LABEL_28;
      }
    }
    else
    {
      BOOL v3 = 0;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "HALB_Tailspin.mm";
    __int16 v11 = 1024;
    int v12 = 300;
    _os_log_impl(&dword_1BAA78000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::enableTailspin: Failed to enable tailspin.", buf, 0x12u);
LABEL_28:
    BOOL v3 = 0;
LABEL_29:
    Symbol<void (*)(tailspin_config *)>::operator()<tailspin_config *&>((void (**)(void))&weak_tailspin_config_free, &v7);
    return v3;
  }
  return 1;
}

+ (void)prepareDumpOptions:(unint64_t)a3 outDict:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v6 = get_TSPDumpOptions_MaxTimestamp();
  if (v6)
  {
    uint64_t v7 = get_TSPDumpOptions_MinTimestamp();

    if (v7)
    {
      unsigned int v8 = dword_1E9F78B8C;
      if (!dword_1E9F78B8C)
      {
        mach_timebase_info((mach_timebase_info_t)&+[HALB_TailspinImpl prepareDumpOptions:outDict:]::s_timebase_info);
        unsigned int v8 = dword_1E9F78B8C;
      }
      unint64_t v9 = 5000000000 * v8;
      unint64_t v10 = +[HALB_TailspinImpl prepareDumpOptions:outDict:]::s_timebase_info;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315650;
        v23 = "HALB_Tailspin.mm";
        __int16 v24 = 1024;
        int v25 = 191;
        __int16 v26 = 2048;
        unint64_t v27 = a3;
        _os_log_impl(&dword_1BAA78000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::dumpTailspin: Current mach time is %llu", (uint8_t *)&v22, 0x1Cu);
      }
      endMachTimeOfLastDump = a3;
      unint64_t v11 = v9 / v10;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315906;
        unint64_t v12 = a3 - v11;
        v23 = "HALB_Tailspin.mm";
        __int16 v24 = 1024;
        int v25 = 195;
        __int16 v26 = 2048;
        unint64_t v27 = 5000;
        __int16 v28 = 2048;
        unint64_t v29 = v12;
        _os_log_impl(&dword_1BAA78000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::dumpTailspin: Looking back %lld ms to time %llu", (uint8_t *)&v22, 0x26u);
      }
      else
      {
        unint64_t v12 = a3 - v11;
      }
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v12];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315906;
        v23 = "HALB_Tailspin.mm";
        __int16 v24 = 1024;
        int v25 = 198;
        __int16 v26 = 2048;
        unint64_t v27 = 0;
        __int16 v28 = 2048;
        unint64_t v29 = a3;
        _os_log_impl(&dword_1BAA78000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::dumpTailspin: Looking forward %lld ms to time %llu", (uint8_t *)&v22, 0x26u);
      }
      v14 = [NSNumber numberWithUnsignedLongLong:endMachTimeOfLastDump];
      id v15 = *a4;
      uint64_t v16 = get_TSPDumpOptions_MaxTimestamp();
      [v15 setValue:v14 forKey:v16];

      id v17 = *a4;
      v18 = get_TSPDumpOptions_MinTimestamp();
      [v17 setValue:v13 forKey:v18];

      id v19 = *a4;
      v20 = [NSNumber numberWithInt:0];
      id v21 = get_TSPDumpOptions_MinTraceBufferDurationSec();
      [v19 setValue:v20 forKey:v21];
    }
  }
}

+ (id)initOptionsDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = get_TSPDumpOptions_MinTimestamp();
  if (!v2) {
    goto LABEL_8;
  }
  BOOL v3 = get_TSPDumpOptions_MaxTimestamp();
  if (!v3)
  {
LABEL_7:

LABEL_8:
    int v5 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = get_TSPDumpOptions_ReasonString();
  if (!v4)
  {

    goto LABEL_7;
  }
  int v5 = get_TSPDumpOptions_MinTraceBufferDurationSec();

  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CA68];
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E0];
    unsigned int v8 = get_TSPDumpOptions_MinTimestamp();
    v15[0] = v8;
    unint64_t v9 = get_TSPDumpOptions_MaxTimestamp();
    v15[1] = v9;
    unint64_t v10 = get_TSPDumpOptions_MinTraceBufferDurationSec();
    v15[2] = v10;
    unint64_t v11 = get_TSPDumpOptions_ReasonString();
    v15[3] = v11;
    unint64_t v12 = [MEMORY[0x1E4F1C970] arrayWithObjects:v15 count:4];
    uint64_t v13 = [v7 sharedKeySetForKeys:v12];
    int v5 = [v6 dictionaryWithSharedKeySet:v13];
  }
LABEL_9:

  return v5;
}

@end