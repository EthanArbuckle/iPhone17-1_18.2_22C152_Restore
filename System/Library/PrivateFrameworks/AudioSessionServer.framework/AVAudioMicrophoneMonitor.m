@interface AVAudioMicrophoneMonitor
+ (id)sharedInstance;
- (AVAudioMicrophoneMonitor)init;
- (BOOL)setState:(BOOL)a3 clientType:(int64_t)a4 clientID:(unint64_t)a5 clientDescription:(const char *)a6;
- (id).cxx_construct;
@end

@implementation AVAudioMicrophoneMonitor

- (BOOL)setState:(BOOL)a3 clientType:(int64_t)a4 clientID:(unint64_t)a5 clientDescription:(const char *)a6
{
  BOOL v9 = a3;
  if (!MediaSafetyNetLibraryCore(0)) {
    return 0;
  }
  v11 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  if (!v9)
  {
    *(void *)&long long __p = a4;
    *((void *)&__p + 1) = a5;
    v19 = std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::find<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>((uint64_t)self + 8, (uint64_t *)&__p);
    if ((uint64_t *)((char *)self + 16) != v19)
    {
      std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::__remove_node_pointer((uint64_t **)self + 1, v19);
      operator delete(v19);
      if (!*((void *)self + 3))
      {
        BOOL v18 = 1;
        goto LABEL_20;
      }
    }
    goto LABEL_19;
  }
  *(void *)&long long __p = a4;
  *((void *)&__p + 1) = a5;
  std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::__emplace_unique_key_args<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>,std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>((uint64_t **)self + 1, (uint64_t *)&__p, &__p);
  char v13 = v12;
  if (a6)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a6);
    if (SHIBYTE(v24) >= 0) {
      uint64_t v14 = HIBYTE(v24);
    }
    else {
      uint64_t v14 = *((void *)&__p + 1);
    }
    if (SHIBYTE(v24) < 0) {
      operator delete((void *)__p);
    }
    if (!v14) {
      a6 = 0;
    }
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v15 = (void (*)(const char *))getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr;
  v30 = getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr;
  if (!getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr)
  {
    *(void *)&long long __p = MEMORY[0x1E4F143A8];
    *((void *)&__p + 1) = 3221225472;
    v24 = ___ZL45getMSNMonitorSetLastMicrophoneClientSymbolLocv_block_invoke;
    v25 = &unk_1E6875A48;
    v26 = &v27;
    v16 = MediaSafetyNetLibrary();
    v17 = dlsym(v16, "MSNMonitorSetLastMicrophoneClient");
    *(void *)(v26[1] + 24) = v17;
    getMSNMonitorSetLastMicrophoneClientSymbolLoc(void)::ptr = *(_UNKNOWN **)(v26[1] + 24);
    v15 = (void (*)(const char *))v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (v15)
  {
    v15(a6);
    if (v13)
    {
      BOOL v18 = 1;
LABEL_20:
      std::mutex::unlock(v11);
      return v18;
    }
LABEL_19:
    BOOL v18 = 0;
    goto LABEL_20;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  v22 = [NSString stringWithUTF8String:"void ATMSNMonitorSetLastMicrophoneClient(const char *)"];
  objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"MSNSoftLink.h", 23, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (id)sharedInstance
{
  {
    +[AVAudioMicrophoneMonitor sharedInstance]::gShared = objc_alloc_init(AVAudioMicrophoneMonitor);
  }
  v2 = (void *)+[AVAudioMicrophoneMonitor sharedInstance]::gShared;
  return v2;
}

- (AVAudioMicrophoneMonitor)init
{
  if (MediaSafetyNetLibraryCore(0))
  {
    v4.receiver = self;
    v4.super_class = (Class)AVAudioMicrophoneMonitor;
    return [(AVAudioMicrophoneMonitor *)&v4 init];
  }
  else
  {

    return 0;
  }
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 32));
  v3 = (void *)*((void *)self + 2);
  std::__tree<std::pair<AVAudioMicrophoneMonitorClientType,unsigned long long>>::destroy((uint64_t)self + 8, v3);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 850045863;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 11) = 0;
  return self;
}

@end