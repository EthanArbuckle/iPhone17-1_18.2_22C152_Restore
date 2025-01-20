@interface CiderService
+ (BOOL)IsSimulatedDevice:(unsigned int)a3;
+ (BOOL)ServiceIsRunning;
+ (void)SendRouteConfiguration:(id)a3 withError:(id *)a4;
+ (void)SendSessionConfiguration:(id)a3 withError:(id *)a4;
+ (void)StartService;
+ (void)StopService;
@end

@implementation CiderService

+ (BOOL)IsSimulatedDevice:(unsigned int)a3
{
  return icp::IsSimulatedDevice(*(icp **)&a3);
}

+ (void)SendSessionConfiguration:(id)a3 withError:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  cf = (applesauce::CF::DictionaryRef *)a3;
  if (!+[CiderService ServiceIsRunning])
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"InCider" code:1937010544 userInfo:0];
    goto LABEL_23;
  }
  v5 = cf;
  if (cf)
  {
    CFRetain(cf);
    v5 = applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v14, cf);
  }
  else
  {
    CFTypeRef v14 = 0;
  }
  InCider::InstanceOpt(v5);
  CFTypeRef v7 = v14;
  if (v14) {
    v6 = (InCider *)CFRetain(v14);
  }
  InCider::InstanceOpt(v6);
  if (byte_26972E480)
  {
    v9 = *(const void **)(InCider::InstanceOpt(void)::theInstance + 32);
    *(void *)(InCider::InstanceOpt(void)::theInstance + 32) = v7;
    if (v7) {
      v8 = (util *)CFRetain(v7);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (*(unsigned char *)(InCider::InstanceOpt(void)::theInstance + 48))
    {
      v10 = (util *)(*(uint64_t (**)(void))(*(void *)(InCider::InstanceOpt(void)::theInstance + 40) + 16))();
      util::server_log(v10);
      v11 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        __int16 v17 = 1024;
        int v18 = 921;
        v12 = "%25s:%-5d Stored session configuration and reported to OutCider";
LABEL_18:
        _os_log_impl(&dword_249BFC000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
      }
    }
    else
    {
      util::server_log(v8);
      v11 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        __int16 v17 = 1024;
        int v18 = 925;
        v12 = "%25s:%-5d Stored session configuration, no reporter present";
        goto LABEL_18;
      }
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v14) {
    CFRelease(v14);
  }
LABEL_23:
}

+ (void)SendRouteConfiguration:(id)a3 withError:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  cf = (applesauce::CF::DictionaryRef *)a3;
  if (!+[CiderService ServiceIsRunning])
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"InCider" code:1937010544 userInfo:0];
    goto LABEL_23;
  }
  v5 = cf;
  if (cf)
  {
    CFRetain(cf);
    v5 = applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v14, cf);
  }
  else
  {
    CFTypeRef v14 = 0;
  }
  InCider::InstanceOpt(v5);
  CFTypeRef v7 = v14;
  if (v14) {
    v6 = (InCider *)CFRetain(v14);
  }
  InCider::InstanceOpt(v6);
  if (byte_26972E480)
  {
    v9 = *(const void **)InCider::InstanceOpt(void)::theInstance;
    *(void *)InCider::InstanceOpt(void)::theInstance = v7;
    if (v7) {
      v8 = (util *)CFRetain(v7);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (*(unsigned char *)(InCider::InstanceOpt(void)::theInstance + 16))
    {
      v10 = (util *)(*(uint64_t (**)(void))(*(void *)(InCider::InstanceOpt(void)::theInstance + 8) + 16))();
      util::server_log(v10);
      v11 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        __int16 v17 = 1024;
        int v18 = 904;
        v12 = "%25s:%-5d Stored route configuration and reported to OutCider";
LABEL_18:
        _os_log_impl(&dword_249BFC000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
      }
    }
    else
    {
      util::server_log(v8);
      v11 = (id) util::server_log(void)::sLogCat;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        __int16 v17 = 1024;
        int v18 = 908;
        v12 = "%25s:%-5d Stored route configuration, no reporter present";
        goto LABEL_18;
      }
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v14) {
    CFRelease(v14);
  }
LABEL_23:
}

+ (BOOL)ServiceIsRunning
{
  return byte_26972E480;
}

+ (void)StopService
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  InCider::InstanceOpt((InCider *)a1);
  if (!byte_26972E480)
  {
    util::server_log(v2);
    v4 = (id) util::server_log(void)::sLogCat;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v6 = 136315394;
    CFTypeRef v7 = "InCider.mm";
    __int16 v8 = 1024;
    int v9 = 45;
    v5 = "%25s:%-5d Request to shut down InCider but it is not running => no-op";
    goto LABEL_8;
  }
  InCider::InstanceOpt(v2);
  if (byte_26972E480)
  {
    InCider::~InCider((id **)&InCider::InstanceOpt(void)::theInstance);
    *((unsigned char *)v3 + 24) = 0;
  }
  util::server_log(v3);
  v4 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    CFTypeRef v7 = "InCider.mm";
    __int16 v8 = 1024;
    int v9 = 58;
    v5 = "%25s:%-5d Shut down InCider service";
LABEL_8:
    _os_log_impl(&dword_249BFC000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x12u);
  }
}

+ (void)StartService
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  InCider::InstanceOpt((InCider *)a1);
  if (!byte_26972E480)
  {
    InCider::InstanceOpt(v2);
    if (byte_26972E480)
    {
      InCider::~InCider((id **)&InCider::InstanceOpt(void)::theInstance);
      byte_26972E480 = 0;
    }
    v4 = (char *)operator new(0x58uLL);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)v4 = &unk_26FDCDBD0;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 72) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    InCider::InstanceOpt(void)::theInstance = (uint64_t)(v4 + 24);
    qword_26972E470 = (uint64_t)v4;
    [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.virtualaudio.cider"];
    v5 = [CiderDelegate alloc];
    v6[0] = InCider::InstanceOpt(void)::theInstance;
    v6[1] = qword_26972E470;
    if (qword_26972E470) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(qword_26972E470 + 8), 1uLL, memory_order_relaxed);
    }
    [(CiderDelegate *)v5 init:v6];
    operator new();
  }
  util::server_log(v2);
  v3 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "InCider.mm";
    __int16 v9 = 1024;
    int v10 = 25;
    _os_log_impl(&dword_249BFC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Request to launch InCider but it is already running => no-op", buf, 0x12u);
  }
}

@end