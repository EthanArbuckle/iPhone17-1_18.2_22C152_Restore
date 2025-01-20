void AppleCellularDataPlaneHelperInterface::AppleCellularDataPlaneHelperInterface(AppleCellularDataPlaneHelperInterface *this)
{
  uint64_t v2;
  IOACIPCBBNetCfgClass *v3;
  NSObject *v4;
  NSObject *v5;
  const __SCDynamicStore *SystemConfigStore;
  void *exception;

  ApplePDPHelperInterface::ApplePDPHelperInterface(this);
  *(void *)(v2 + 152) = 1018212795;
  *(void *)v2 = &unk_26D751A98;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(void *)(v2 + 192) = 0;
  *(void *)(v2 + 200) = 850045863;
  *(_OWORD *)(v2 + 208) = 0u;
  *(_OWORD *)(v2 + 224) = 0u;
  *(_OWORD *)(v2 + 240) = 0u;
  *(void *)(v2 + 256) = 0;
  *(void *)(v2 + 280) = v2 + 288;
  *(void *)(v2 + 288) = 0;
  v3 = (IOACIPCBBNetCfgClass *)(v2 + 304);
  *(void *)(v2 + 296) = 0;
  IOACIPCBBNetCfgClass::IOACIPCBBNetCfgClass((IOACIPCBBNetCfgClass *)(v2 + 304));
  *((_DWORD *)this + 18) = 4;
  IOACIPCBBNetCfgClass::setLogLevel(v3);
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = dispatch_queue_create("ApplePDPHelperDataPlane", v4);
  *((void *)this + 17) = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x223CBE9B0](exception, "Unable to allocate DispatchQueue");
    goto LABEL_6;
  }
  SystemConfigStore = AppleCellularDataPlaneHelperInterface::createSystemConfigStore(this, v5);
  *((void *)this + 18) = SystemConfigStore;
  if (!SystemConfigStore)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x223CBE9B0](exception, "Unable to allocate SystemConfigStore");
LABEL_6:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

void sub_223BFB2F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v5);
  MEMORY[0x223CBE990](v4);
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy((uint64_t)v1 + 280, *((void **)v1 + 36));
  std::mutex::~mutex(v3);
  std::condition_variable::~condition_variable(v2);
  ApplePDPHelperInterface::~ApplePDPHelperInterface(v1);
  _Unwind_Resume(a1);
}

const __SCDynamicStore *AppleCellularDataPlaneHelperInterface::createSystemConfigStore(AppleCellularDataPlaneHelperInterface *this, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  context.version = 0;
  context.info = (char *)this + 152;
  memset(&context.retain, 0, 24);
  v3 = SCDynamicStoreCreate(0, @"ApplePDPHelperDataPlane", (SCDynamicStoreCallBack)handleInterfaceChange, &context);
  if (v3)
  {
    CFStringRef NetworkInterface = (CFStringRef)getNetworkInterfaceKey(void)::key;
    if (!getNetworkInterfaceKey(void)::key)
    {
      CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, (CFStringRef)*MEMORY[0x263F1BC10]);
      getNetworkInterfaceKey(void)::key = (uint64_t)NetworkInterface;
    }
    *(void *)values = NetworkInterface;
    CFArrayRef v5 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x263EFFF70]);
    SCDynamicStoreSetNotificationKeys(v3, v5, 0);
    SCDynamicStoreSetDispatchQueue(v3, a2);
    CFRelease(v5);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = SCError();
    v7 = SCErrorString(v6);
    *(_DWORD *)values = 136315394;
    *(void *)&values[4] = "createSystemConfigStore";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: SCDOpen failed: %s", values, 0x16u);
  }
  return v3;
}

void AppleCellularDataPlaneHelperInterface::~AppleCellularDataPlaneHelperInterface(AppleCellularDataPlaneHelperInterface *this)
{
  *(void *)this = &unk_26D751A98;
  CFRelease(*((CFTypeRef *)this + 18));
  dispatch_release(*((dispatch_object_t *)this + 17));
  MEMORY[0x223CBE990]((char *)this + 304);
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy((uint64_t)this + 280, *((void **)this + 36));
  std::mutex::~mutex((std::mutex *)((char *)this + 200));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 152));
  ApplePDPHelperInterface::~ApplePDPHelperInterface(this);
}

{
  uint64_t vars8;

  AppleCellularDataPlaneHelperInterface::~AppleCellularDataPlaneHelperInterface(this);
  JUMPOUT(0x223CBEA70);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t AppleCellularDataPlaneHelperInterface::connect(AppleCellularDataPlaneHelperInterface *this, int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFDictionaryRef cf = IOServiceMatching("AppleCellularDataPlane");
  uint64_t v4 = (AppleCellularDataPlaneHelperInterface *)((char *)this + 304);
  char v5 = IOACIPCBBNetCfgClass::start(v4, cf);
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v15 = "connect";
      __int16 v16 = 1024;
      int v17 = a2;
      v9 = &_os_log_internal;
      v10 = "::%s: failed to start IOACIPCNetCfgClass (SCDynamicStoreContext context = %u)\n";
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  if (v6)
  {
    *(_DWORD *)buf = 136315394;
    v15 = "connect";
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: started IOACIPCNetCfgClass (SCDynamicStoreContext context = %u)\n", buf, 0x12u);
  }
  int v7 = IOACIPCBBNetCfgClass::open(v4);
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v15 = "connect";
      __int16 v16 = 1024;
      int v17 = a2;
      v9 = &_os_log_internal;
      v10 = "::%s: failed to open IOACIPCNetCfgClass (SCDynamicStoreContext context = %u)\n";
LABEL_9:
      _os_log_impl(&dword_223BFA000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x12u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v8)
  {
    *(_DWORD *)buf = 136315394;
    v15 = "connect";
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: opened IOACIPCNetCfgClass (SCDynamicStoreContext context = %u)\n", buf, 0x12u);
  }
  uint64_t v11 = 1;
LABEL_11:
  CFRelease(cf);
  return v11;
}

void sub_223BFB79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CFTypeRef *a9)
{
}

CFTypeRef **ACDPHelperSentry<AppleCellularDataPlaneHelperInterface::connect(unsigned short)::$_0>::~ACDPHelperSentry(CFTypeRef **a1)
{
  return a1;
}

uint64_t AppleCellularDataPlaneHelperInterface::disconnect(AppleCellularDataPlaneHelperInterface *this)
{
  return IOACIPCBBNetCfgClass::stop((AppleCellularDataPlaneHelperInterface *)((char *)this + 304));
}

uint64_t AppleCellularDataPlaneHelperInterface::ipcConfigSet(uint64_t a1, int *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *a2;
    uint64_t v4 = *((void *)a2 + 1);
    int v5 = *((unsigned __int8 *)a2 + 16);
    int v6 = a2[5];
    int v7 = a2[6];
    int v8 = a2[7];
    int v10 = 136316674;
    uint64_t v11 = "ipcConfigSet";
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 2080;
    uint64_t v15 = v4;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    __int16 v22 = 1024;
    int v23 = v8;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: SCDynamicStoreContext context = %u, config = %s, active = %u, TrafficTypeMask = %x, DataPathType = %x, MaxQueueSets = %d\n", (uint8_t *)&v10, 0x34u);
  }
  return ApplePDPHelperInterface::ipcConfigSet();
}

uint64_t AppleCellularDataPlaneHelperInterface::ipcInterfaceConfig(uint64_t a1, int *a2, unsigned int *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *a2;
    uint64_t v7 = *((void *)a2 + 1);
    int v8 = *((unsigned __int8 *)a2 + 24);
    unsigned int v9 = a2[4];
    int v10 = a2[5];
    uint64_t v11 = *((void *)a2 + 4);
    *(_DWORD *)buf = 136316674;
    *(void *)&uint8_t buf[4] = "ipcInterfaceConfig";
    __int16 v41 = 1024;
    unsigned int v42 = v9;
    __int16 v43 = 1024;
    int v44 = v6;
    __int16 v45 = 2080;
    uint64_t v46 = v7;
    __int16 v47 = 1024;
    int v48 = v8;
    __int16 v49 = 1024;
    int v50 = v10;
    __int16 v51 = 2048;
    uint64_t v52 = v11;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: interface = %u, SCDynamicStoreContext context = %u, config = %s, active = %u, bearerId = 0x%x, qset-id = %llu \n", buf, 0x38u);
  }
  std::mutex::lock((std::mutex *)(a1 + 8));
  if ((*a2 - 1) < 2)
  {
    if (!*((void *)a2 + 1))
    {
      uint64_t v13 = 0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "ipcInterfaceConfig";
        __int16 v14 = &_os_log_internal;
        uint64_t v15 = "::%s: ERROR: config set not assigned\n";
        goto LABEL_12;
      }
      goto LABEL_14;
    }
    __int16 v12 = (unsigned int *)(a2 + 4);
    if (a2[4] >= 0x20)
    {
      uint64_t v13 = 0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "ipcInterfaceConfig";
        __int16 v14 = &_os_log_internal;
        uint64_t v15 = "::%s: ERROR: interface index out of range\n";
LABEL_12:
        _os_log_impl(&dword_223BFA000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    snprintf(__str, 9uLL, "pdp_ip%u", a2[4]);
    if (*((unsigned char *)a2 + 24))
    {
      uint64_t v17 = *(void *)(a1 + 288);
      if (!v17) {
        goto LABEL_27;
      }
      unsigned int v18 = *v12;
      uint64_t v19 = a1 + 288;
      do
      {
        unsigned int v20 = *(_DWORD *)(v17 + 32);
        BOOL v21 = v20 >= v18;
        if (v20 >= v18) {
          __int16 v22 = (uint64_t *)v17;
        }
        else {
          __int16 v22 = (uint64_t *)(v17 + 8);
        }
        if (v21) {
          uint64_t v19 = v17;
        }
        uint64_t v17 = *v22;
      }
      while (*v22);
      if (v19 == a1 + 288 || v18 < *(_DWORD *)(v19 + 32))
      {
LABEL_27:
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 0x40000000;
        v37[2] = ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke;
        v37[3] = &__block_descriptor_tmp;
        v37[4] = a1;
        v37[5] = a2;
        int v23 = AppleCellularDataPlaneHelperInterface::waitForDevicePresence(a1, __str, 0x2710u, 0, (uint64_t)v37);
        if (v23 == 2)
        {
          AppleCellularDataPlaneHelperInterface::removeInterface((AppleCellularDataPlaneHelperInterface *)a1, *v12);
          goto LABEL_13;
        }
        if (v23)
        {
LABEL_13:
          uint64_t v13 = 0;
          goto LABEL_14;
        }
        unsigned int v18 = *v12;
      }
      unsigned int v24 = a2[5];
      if (v24 != -1)
      {
        if (!AppleCellularDataPlaneHelperInterface::addBearer((AppleCellularDataPlaneHelperInterface *)a1, v18, v24))goto LABEL_13; {
        unsigned int v18 = a2[4];
        }
        unsigned int v24 = a2[5];
      }
    }
    else
    {
      uint64_t v25 = *(void *)(a1 + 288);
      if (v25)
      {
        unsigned int v26 = *v12;
        uint64_t v27 = a1 + 288;
        do
        {
          unsigned int v28 = *(_DWORD *)(v25 + 32);
          BOOL v29 = v28 >= v26;
          if (v28 >= v26) {
            v30 = (uint64_t *)v25;
          }
          else {
            v30 = (uint64_t *)(v25 + 8);
          }
          if (v29) {
            uint64_t v27 = v25;
          }
          uint64_t v25 = *v30;
        }
        while (*v30);
        if (v27 != a1 + 288 && v26 >= *(_DWORD *)(v27 + 32))
        {
          int v31 = a2[5];
          if (v31 == -1)
          {
            BOOL v32 = 1;
            unsigned int v33 = -1;
          }
          else
          {
            *(void *)buf = a2 + 4;
            BOOL v32 = v31 == *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 280), (unsigned int *)a2 + 4, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18);
            unsigned int v26 = a2[4];
            unsigned int v33 = a2[5];
          }
          AppleCellularDataPlaneHelperInterface::removeBearer((AppleCellularDataPlaneHelperInterface *)a1, v26, v33);
          if (v32)
          {
            v36[0] = MEMORY[0x263EF8330];
            v36[1] = 0x40000000;
            v36[2] = ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke_2;
            v36[3] = &__block_descriptor_tmp_6;
            v36[4] = a1;
            v36[5] = a2;
            AppleCellularDataPlaneHelperInterface::waitForDevicePresence(a1, __str, 0x2710u, 1, (uint64_t)v36);
            if (std::map<unsigned int,ACDPNetIFConfig>::contains[abi:ne180100](a1 + 280, (unsigned int *)a2 + 4))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v34 = *v12;
                v38 = v12;
                int v35 = *((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 280), v12, (uint64_t)&std::piecewise_construct, &v38)+ 40);
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "ipcInterfaceConfig";
                __int16 v41 = 1024;
                unsigned int v42 = v34;
                __int16 v43 = 1024;
                int v44 = v35;
                _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Enforcing Configuration Removal (interface = %u, rss = %u)\n", buf, 0x18u);
              }
              std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__erase_unique<unsigned int>(a1 + 280, v12);
            }
          }
          AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID(a1, 0xFFFFFFFF, 0xFFFFFFFF, a3);
          goto LABEL_46;
        }
      }
      unsigned int v18 = -1;
      unsigned int v24 = -1;
    }
    AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID(a1, v18, v24, a3);
LABEL_46:
    uint64_t v13 = 1;
    goto LABEL_14;
  }
  uint64_t v13 = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "ipcInterfaceConfig";
    __int16 v14 = &_os_log_internal;
    uint64_t v15 = "::%s: ERROR: wrong ICP Context\n";
    goto LABEL_12;
  }
LABEL_14:
  std::mutex::unlock((std::mutex *)(a1 + 8));
  return v13;
}

void sub_223BFBE40(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL std::map<unsigned int,ACDPNetIFConfig>::contains[abi:ne180100](uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = a1 + 8;
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *a2;
  uint64_t v6 = v2;
  do
  {
    unsigned int v7 = *(_DWORD *)(v3 + 32);
    BOOL v8 = v7 >= v5;
    if (v7 >= v5) {
      unsigned int v9 = (uint64_t *)v3;
    }
    else {
      unsigned int v9 = (uint64_t *)(v3 + 8);
    }
    if (v8) {
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v9;
  }
  while (*v9);
  if (v6 == v2 || v5 < *(_DWORD *)(v6 + 32)) {
LABEL_12:
  }
    uint64_t v6 = v2;
  return v6 != v2;
}

uint64_t AppleCellularDataPlaneHelperInterface::waitForDevicePresence(uint64_t a1, const char *a2, unsigned int a3, int a4, uint64_t a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v24 = "waitForDevicePresence";
      _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: invalid interface name", buf, 0xCu);
    }
    return 1;
  }
  BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (!v10) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315650;
    unsigned int v24 = "waitForDevicePresence";
    __int16 v25 = 2080;
    unsigned int v26 = a2;
    __int16 v27 = 1024;
    unsigned int v28 = a3;
    uint64_t v11 = &_os_log_internal;
    __int16 v12 = "::%s: Waiting for interface absence (%s, timeout = %ums)";
  }
  else
  {
    if (!v10) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315650;
    unsigned int v24 = "waitForDevicePresence";
    __int16 v25 = 2080;
    unsigned int v26 = a2;
    __int16 v27 = 1024;
    unsigned int v28 = a3;
    uint64_t v11 = &_os_log_internal;
    __int16 v12 = "::%s: Waiting for interface presence (%s, timeout = %ums)";
  }
  _os_log_impl(&dword_223BFA000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x1Cu);
LABEL_11:
  v22.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 200);
  v22.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 200));
  if (AppleCellularDataPlaneHelperInterface::checkForDevicePresence((SCDynamicStoreRef *)a1, a2, a4 == 0)
    || *(unsigned char *)(a1 + 276))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v24 = "waitForDevicePresence";
      _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Structor called in wrong state", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (!(*(unsigned int (**)(uint64_t))(a5 + 16))(a5))
  {
LABEL_15:
    uint64_t v13 = 1;
LABEL_16:
    std::mutex::unlock(v22.__m_);
    return v13;
  }
  *(void *)(a1 + 264) = a2;
  *(_DWORD *)(a1 + 272) = a4;
  v15.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 1000000 * a3;
  do
  {
    if (*(unsigned char *)(a1 + 276)) {
      goto LABEL_37;
    }
    if (v15.__d_.__rep_ <= std::chrono::steady_clock::now().__d_.__rep_) {
      break;
    }
    v16.__d_.__rep_ = v15.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
    if (v16.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v17.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (v17.__d_.__rep_)
      {
        if (v17.__d_.__rep_ < 1)
        {
          if ((unint64_t)v17.__d_.__rep_ < 0xFFDF3B645A1CAC09)
          {
            std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18 = 0x8000000000000000;
            goto LABEL_33;
          }
        }
        else if ((unint64_t)v17.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_31;
        }
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18 = 1000 * v17.__d_.__rep_;
      }
      else
      {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18 = 0;
      }
LABEL_31:
      if (v18 > (v16.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
      {
        v19.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_34:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 152), &v22, v19);
        std::chrono::steady_clock::now();
        continue;
      }
LABEL_33:
      v19.__d_.__rep_ = v18 + v16.__d_.__rep_;
      goto LABEL_34;
    }
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < v15.__d_.__rep_);
  if (*(unsigned char *)(a1 + 276))
  {
LABEL_37:
    if (a4)
    {
      if (a4 == 1 && !*(unsigned char *)(a1 + 277))
      {
        uint64_t v13 = 0;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 136315394;
        unsigned int v24 = "waitForDevicePresence";
        __int16 v25 = 2080;
        unsigned int v26 = a2;
        unsigned int v20 = &_os_log_internal;
        BOOL v21 = "::%s: Interface successfully removed (%s)";
LABEL_45:
        _os_log_impl(&dword_223BFA000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
        uint64_t v13 = 0;
        goto LABEL_50;
      }
    }
    else if (*(unsigned char *)(a1 + 277))
    {
      uint64_t v13 = 0;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 136315394;
      unsigned int v24 = "waitForDevicePresence";
      __int16 v25 = 2080;
      unsigned int v26 = a2;
      unsigned int v20 = &_os_log_internal;
      BOOL v21 = "::%s: Interface successfully attached (%s)";
      goto LABEL_45;
    }
    uint64_t v13 = 1;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v24 = "waitForDevicePresence";
      __int16 v25 = 2080;
      unsigned int v26 = a2;
      __int16 v27 = 1024;
      unsigned int v28 = a3;
      _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Timeout Waiting for interface (%s, timeout = %ums)", buf, 0x1Cu);
    }
    uint64_t v13 = 2;
  }
LABEL_50:
  *(void *)(a1 + 264) = 0;
  *(unsigned char *)(a1 + 276) = 0;
  if (v22.__owns_) {
    goto LABEL_16;
  }
  return v13;
}

void sub_223BFC358(_Unwind_Exception *exception_object)
{
}

uint64_t ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke(AppleCellularDataPlaneHelperInterface *a1)
{
  uint64_t v3 = (uint64_t **)*((void *)a1 + 4);
  uint64_t v2 = (unsigned __int16 *)*((void *)a1 + 5);
  unsigned int v4 = *((_DWORD *)v2 + 4);
  int v5 = *v2;
  HasRSS = (AppleCellularDataPlaneHelperInterface *)AppleCellularDataPlaneHelperInterface::ipcConfigSetHasRSS(a1, *((char **)v2 + 1));
  int v7 = (int)HasRSS;
  int HasPrioUL = AppleCellularDataPlaneHelperInterface::ipcConfigSetHasPrioUL(HasRSS, *(char **)(*((void *)a1 + 5) + 8));
  return AppleCellularDataPlaneHelperInterface::addInterface(v3, v4, v5, v7, HasPrioUL);
}

uint64_t AppleCellularDataPlaneHelperInterface::addInterface(uint64_t **this, unsigned int a2, int a3, int a4, int a5)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  unsigned int v59 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "addInterface";
    __int16 v66 = 1024;
    unsigned int v67 = a2;
    __int16 v68 = 1024;
    int v69 = a3;
    __int16 v70 = 1024;
    int v71 = a4;
    __int16 v72 = 1024;
    int v73 = a5;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Adding Network Interface %u (context %u, rss = %u, prioUL = %u)\n", buf, 0x24u);
  }
  if ((AppleCellularDataPlaneHelperInterface::connect((AppleCellularDataPlaneHelperInterface *)this, a3) & 1) == 0)
  {
    uint64_t v17 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "addInterface";
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18 = &_os_log_internal;
    std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v19 = "::%s: ERROR: Failed to connect to ACDP-Driver. Device Reset needed or Device in Reset\n";
    uint32_t v20 = 12;
    goto LABEL_24;
  }
  BOOL v10 = this[36];
  __int16 v11 = v59;
  if (v10)
  {
    __int16 v12 = this + 36;
    do
    {
      unsigned int v13 = *((_DWORD *)v10 + 8);
      BOOL v14 = v13 >= v59;
      if (v13 >= v59) {
        std::chrono::steady_clock::time_point v15 = (uint64_t **)v10;
      }
      else {
        std::chrono::steady_clock::time_point v15 = (uint64_t **)(v10 + 1);
      }
      if (v14) {
        __int16 v12 = (uint64_t **)v10;
      }
      BOOL v10 = *v15;
    }
    while (*v15);
    if (v12 != this + 36 && v59 >= *((_DWORD *)v12 + 8))
    {
      *(void *)buf = &v59;
      if (*((unsigned __int16 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v59, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 21) == a3)
      {
        *(void *)buf = &v59;
        if (*((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v59, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 40) == a4)
        {
          *(void *)buf = &v59;
          if (*((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v59, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 41) == a5)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "addInterface";
              __int16 v66 = 1024;
              unsigned int v67 = v59;
              _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Compatible Network Interface %u is already configured by ACDP-Helper.\n", buf, 0x12u);
            }
            uint64_t v17 = 1;
            goto LABEL_56;
          }
        }
      }
      uint64_t v17 = 0;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_56;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "addInterface";
      __int16 v66 = 1024;
      unsigned int v67 = v59;
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18 = &_os_log_internal;
      std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v19 = "::%s: ERROR: Incompatible Network Interface %u is already configured by ACDP-Helper.\n";
      uint32_t v20 = 18;
LABEL_24:
      _os_log_impl(&dword_223BFA000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
      uint64_t v17 = 0;
      goto LABEL_56;
    }
  }
  bzero(buf, 0x1DEuLL);
  bzero(&v51, 0x1CuLL);
  __int16 v51 = v11;
  char v52 = a5;
  char v53 = a4;
  int v57 = 256;
  if (a4)
  {
    int v56 = 0x2000;
    __int16 v58 = 0x2000;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v61 = 136315906;
    *(void *)v62 = "addInterface";
    *(_WORD *)&v62[8] = 1024;
    *(_DWORD *)&v62[10] = v54;
    *(_WORD *)&v62[14] = 1024;
    *(_DWORD *)&v62[16] = v55;
    LOWORD(v63) = 1024;
    *(_DWORD *)((char *)&v63 + 2) = 256;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: rxPacingTimerUS = %u, rxPacketPacingThresold = %u TRSize = %u)\n", v61, 0x1Eu);
  }
  int v16 = IOACIPCBBNetCfgClass::addNetIf();
  uint64_t v17 = v16 == 0;
  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v61 = 136315138;
      *(void *)v62 = "addInterface";
      _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: ERROR: failed to add network interface\n", v61, 0xCu);
    }
    goto LABEL_56;
  }
  uint8_t v47 = a4;
  uint8_t v48 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  int v23 = &_os_log_internal;
  while (1)
  {
    int v24 = *(_DWORD *)((char *)&v72 + v21);
    if (v24 == 2)
    {
      v30 = (char *)v49 + 12 * v22;
      *(void *)(v30 + 4) = 0xFF00000003;
      int v31 = *(unsigned __int16 *)&v74[v21];
      *((_DWORD *)v30 + 3) = v31;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v61 = 136315394;
        *(void *)v62 = "addInterface";
        *(_WORD *)&v62[8] = 1024;
        *(_DWORD *)&v62[10] = v31;
        _os_log_impl(&dword_223BFA000, v23, OS_LOG_TYPE_DEFAULT, "::%s: DL Pipe configured (id = %u)\n", v61, 0x12u);
      }
      uint64_t v27 = (v22 + 1);
      if (v27 > 0xF) {
        goto LABEL_42;
      }
      goto LABEL_41;
    }
    if (v24 != 1)
    {
      uint64_t v27 = v22;
      goto LABEL_41;
    }
    __int16 v25 = (_DWORD *)v49 + 3 * v22;
    v25[1] = 0;
    v25[2] = 0;
    int v26 = *(unsigned __int16 *)&v74[v21];
    v25[3] = v26;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v61 = 136315394;
      *(void *)v62 = "addInterface";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = v26;
      _os_log_impl(&dword_223BFA000, v23, OS_LOG_TYPE_DEFAULT, "::%s: UL.Default Pipe configured (id = %u)\n", v61, 0x12u);
    }
    uint64_t v27 = (v22 + 1);
    if (v27 > 0xF) {
      goto LABEL_42;
    }
    int v28 = *(unsigned __int16 *)&v74[v21 + 2];
    if (v28 != 0xFFFF)
    {
      uint64_t v29 = (char *)v49 + 12 * v27;
      *(void *)(v29 + 4) = 0x100000000;
      *((_DWORD *)v29 + 3) = v28;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v61 = 136315394;
        *(void *)v62 = "addInterface";
        *(_WORD *)&v62[8] = 1024;
        *(_DWORD *)&v62[10] = v28;
        _os_log_impl(&dword_223BFA000, v23, OS_LOG_TYPE_DEFAULT, "::%s: UL.Prio Pipe configured (id = %u)\n", v61, 0x12u);
      }
      uint64_t v27 = (v22 + 2);
      if (v27 > 0xF) {
        break;
      }
    }
LABEL_41:
    v21 += 28;
    uint64_t v22 = v27;
    if (v21 == 448) {
      goto LABEL_42;
    }
  }
  LODWORD(v27) = 16;
LABEL_42:
  LODWORD(v49[0]) = v27;
  *(_OWORD *)&v64[148] = v49[9];
  *(_OWORD *)&v64[164] = v49[10];
  *(_OWORD *)&v64[180] = v49[11];
  *(_OWORD *)&v64[84] = v49[5];
  *(_OWORD *)&v64[100] = v49[6];
  *(_OWORD *)&v64[116] = v49[7];
  *(_OWORD *)&v64[132] = v49[8];
  *(_OWORD *)&v64[20] = v49[1];
  *(_OWORD *)&v64[36] = v49[2];
  *(_OWORD *)&v64[52] = v49[3];
  *(_OWORD *)&v64[68] = v49[4];
  v61[0] = v47;
  v61[1] = v48;
  *(_WORD *)&v61[2] = a3;
  *(void *)&v62[12] = 0;
  v63 = 0;
  *(void *)&v62[4] = &v62[12];
  *(_DWORD *)v64 = -1;
  *(_DWORD *)&v64[196] = v50;
  *(_OWORD *)&v64[4] = v49[0];
  v60 = &v59;
  BOOL v32 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v59, (uint64_t)&std::piecewise_construct, &v60);
  *((_DWORD *)v32 + 10) = *(_DWORD *)v61;
  unsigned int v33 = (uint64_t *)(v32 + 7);
  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy((uint64_t)(v32 + 6), v32[7]);
  unsigned int v34 = *(uint64_t **)&v62[12];
  v32[6] = *(uint64_t **)&v62[4];
  v32[7] = v34;
  int v35 = v63;
  v32[8] = v63;
  if (v35)
  {
    v34[2] = (uint64_t)v33;
    *(void *)&v62[4] = &v62[12];
    *(void *)&v62[12] = 0;
    v63 = 0;
    unsigned int v34 = 0;
  }
  else
  {
    v32[6] = v33;
  }
  v36 = *(uint64_t **)&v64[192];
  long long v38 = *(_OWORD *)&v64[160];
  long long v37 = *(_OWORD *)&v64[176];
  long long v39 = *(_OWORD *)&v64[128];
  *(_OWORD *)(v32 + 27) = *(_OWORD *)&v64[144];
  *(_OWORD *)(v32 + 29) = v38;
  *(_OWORD *)(v32 + 31) = v37;
  long long v41 = *(_OWORD *)&v64[96];
  long long v40 = *(_OWORD *)&v64[112];
  long long v42 = *(_OWORD *)&v64[64];
  *(_OWORD *)(v32 + 19) = *(_OWORD *)&v64[80];
  *(_OWORD *)(v32 + 21) = v41;
  *(_OWORD *)(v32 + 23) = v40;
  *(_OWORD *)(v32 + 25) = v39;
  long long v44 = *(_OWORD *)&v64[32];
  long long v43 = *(_OWORD *)&v64[48];
  long long v45 = *(_OWORD *)v64;
  *(_OWORD *)(v32 + 11) = *(_OWORD *)&v64[16];
  *(_OWORD *)(v32 + 13) = v44;
  v32[33] = v36;
  *(_OWORD *)(v32 + 15) = v43;
  *(_OWORD *)(v32 + 17) = v42;
  *(_OWORD *)(v32 + 9) = v45;
  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy((uint64_t)&v62[4], v34);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v61 = 136315394;
    *(void *)v62 = "addInterface";
    *(_WORD *)&v62[8] = 1024;
    *(_DWORD *)&v62[10] = v59;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Network Interface %u added.\n", v61, 0x12u);
  }
  uint64_t v17 = v17;
LABEL_56:
  IOACIPCBBNetCfgClass::stop((IOACIPCBBNetCfgClass *)(this + 38));
  return v17;
}

void sub_223BFCBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47)
{
  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(v48, a47);
  IOACIPCBBNetCfgClass::stop((IOACIPCBBNetCfgClass *)(v47 + 304));
  _Unwind_Resume(a1);
}

uint64_t AppleCellularDataPlaneHelperInterface::ipcConfigSetHasRSS(AppleCellularDataPlaneHelperInterface *this, char *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "ipcConfigSetHasRSS";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: config = %s\n", buf, 0x16u);
  }
  if (!a2) {
    return 0;
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "__Internet__");
  std::string::basic_string[abi:ne180100]<0>(__p, "__Internet2__");
  uint64_t v3 = v17;
  std::string::basic_string[abi:ne180100]<0>(v17, a2);
  int v4 = (char)v18;
  int v5 = (void *)v17[0];
  if ((v18 & 0x80u) == 0) {
    size_t v6 = v18;
  }
  else {
    size_t v6 = v17[1];
  }
  if ((v18 & 0x80u) != 0) {
    uint64_t v3 = (void *)v17[0];
  }
  if ((v22 & 0x80u) == 0) {
    size_t v7 = v22;
  }
  else {
    size_t v7 = *(void *)&buf[8];
  }
  if ((v22 & 0x80u) == 0) {
    BOOL v8 = buf;
  }
  else {
    BOOL v8 = *(unsigned char **)buf;
  }
  if (v7 >= v6) {
    size_t v9 = v6;
  }
  else {
    size_t v9 = v7;
  }
  if (memcmp(v3, v8, v9) || v7 != v6)
  {
    if ((v20 & 0x80u) == 0) {
      size_t v11 = v20;
    }
    else {
      size_t v11 = (size_t)__p[1];
    }
    if ((v20 & 0x80u) == 0) {
      __int16 v12 = __p;
    }
    else {
      __int16 v12 = (void **)__p[0];
    }
    if (v11 >= v6) {
      size_t v13 = v6;
    }
    else {
      size_t v13 = v11;
    }
    BOOL v14 = memcmp(v3, v12, v13) == 0;
    uint64_t v15 = v11 == v6 && v14;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  uint64_t v15 = 1;
  if (v4 < 0) {
LABEL_38:
  }
    operator delete(v5);
LABEL_39:
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v22 < 0) {
    operator delete(*(void **)buf);
  }
  return v15;
}

void sub_223BFCDF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AppleCellularDataPlaneHelperInterface::ipcConfigSetHasPrioUL(AppleCellularDataPlaneHelperInterface *this, char *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "ipcConfigSetHasPrioUL";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: config = %s\n", buf, 0x16u);
  }
  if (!a2) {
    return 0;
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "__Internet__");
  std::string::basic_string[abi:ne180100]<0>(__p, "__Internet2__");
  uint64_t v3 = v17;
  std::string::basic_string[abi:ne180100]<0>(v17, a2);
  int v4 = (char)v18;
  int v5 = (void *)v17[0];
  if ((v18 & 0x80u) == 0) {
    size_t v6 = v18;
  }
  else {
    size_t v6 = v17[1];
  }
  if ((v18 & 0x80u) != 0) {
    uint64_t v3 = (void *)v17[0];
  }
  if ((v22 & 0x80u) == 0) {
    size_t v7 = v22;
  }
  else {
    size_t v7 = *(void *)&buf[8];
  }
  if ((v22 & 0x80u) == 0) {
    BOOL v8 = buf;
  }
  else {
    BOOL v8 = *(unsigned char **)buf;
  }
  if (v7 >= v6) {
    size_t v9 = v6;
  }
  else {
    size_t v9 = v7;
  }
  if (memcmp(v3, v8, v9) || v7 != v6)
  {
    if ((v20 & 0x80u) == 0) {
      size_t v11 = v20;
    }
    else {
      size_t v11 = (size_t)__p[1];
    }
    if ((v20 & 0x80u) == 0) {
      __int16 v12 = __p;
    }
    else {
      __int16 v12 = (void **)__p[0];
    }
    if (v11 >= v6) {
      size_t v13 = v6;
    }
    else {
      size_t v13 = v11;
    }
    BOOL v14 = memcmp(v3, v12, v13) == 0;
    uint64_t v15 = v11 == v6 && v14;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  uint64_t v15 = 1;
  if (v4 < 0) {
LABEL_38:
  }
    operator delete(v5);
LABEL_39:
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v22 < 0) {
    operator delete(*(void **)buf);
  }
  return v15;
}

void sub_223BFCFFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AppleCellularDataPlaneHelperInterface::removeInterface(AppleCellularDataPlaneHelperInterface *this, unsigned int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(_DWORD *)unsigned __int8 v18 = a2;
  uint64_t v3 = *((void *)this + 36);
  if (v3)
  {
    int v5 = (uint64_t **)((char *)this + 280);
    size_t v6 = (_DWORD *)((char *)this + 288);
    do
    {
      unsigned int v7 = *(_DWORD *)(v3 + 32);
      BOOL v8 = v7 >= a2;
      if (v7 >= a2) {
        size_t v9 = (uint64_t *)v3;
      }
      else {
        size_t v9 = (uint64_t *)(v3 + 8);
      }
      if (v8) {
        size_t v6 = (_DWORD *)v3;
      }
      uint64_t v3 = *v9;
    }
    while (*v9);
    if (v6 != (_DWORD *)((char *)this + 288) && v6[8] <= a2)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)buf = v18;
        int v12 = *((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, (unsigned int *)v18, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 40);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "removeInterface";
        __int16 v20 = 1024;
        unsigned int v21 = a2;
        __int16 v22 = 1024;
        int v23 = v12;
        _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Removing Network Interface %u (rss = %u)\n", buf, 0x18u);
      }
      *(void *)buf = v18;
      size_t v13 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, (unsigned int *)v18, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      if (AppleCellularDataPlaneHelperInterface::connect(this, *((unsigned __int16 *)v13 + 21)))
      {
        int v14 = IOACIPCBBNetCfgClass::removeNetIf((AppleCellularDataPlaneHelperInterface *)((char *)this + 304));
        BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (!v14)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "removeInterface";
            __int16 v20 = 1024;
            unsigned int v21 = *(_DWORD *)v18;
            _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Network Interface %u removed\n", buf, 0x12u);
          }
          uint64_t v10 = 1;
          goto LABEL_29;
        }
        if (!v15) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "removeInterface";
        int v16 = &_os_log_internal;
        uint64_t v17 = "::%s: Failed to remove network interface. Device Reset needed.\n";
      }
      else
      {
        uint64_t v10 = 0;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
LABEL_29:
          IOACIPCBBNetCfgClass::stop((AppleCellularDataPlaneHelperInterface *)((char *)this + 304));
          std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__erase_unique<unsigned int>((uint64_t)v5, (unsigned int *)v18);
          return v10;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "removeInterface";
        int v16 = &_os_log_internal;
        uint64_t v17 = "::%s: ERROR: Failed to connect to ACDP-Driver. Device Reset needed\n";
      }
      _os_log_impl(&dword_223BFA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
LABEL_25:
      uint64_t v10 = 0;
      goto LABEL_29;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "removeInterface";
    __int16 v20 = 1024;
    unsigned int v21 = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Network Interface %u not configured by ACDP-Helper. Returning Success.\n", buf, 0x12u);
  }
  return 1;
}

void sub_223BFD33C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

uint64_t AppleCellularDataPlaneHelperInterface::addBearer(AppleCellularDataPlaneHelperInterface *this, unsigned int a2, unsigned int a3)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  unsigned int v66 = a3;
  unsigned int v67 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "addBearer";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Adding Bearer %u to Network Interface %u.\n", buf, 0x18u);
  }
  uint64_t v6 = *((void *)this + 36);
  if (v6)
  {
    unsigned int v7 = (uint64_t **)((char *)this + 280);
    BOOL v8 = (_DWORD *)((char *)this + 288);
    do
    {
      unsigned int v9 = *(_DWORD *)(v6 + 32);
      BOOL v10 = v9 >= v67;
      if (v9 >= v67) {
        size_t v11 = (uint64_t *)v6;
      }
      else {
        size_t v11 = (uint64_t *)(v6 + 8);
      }
      if (v10) {
        BOOL v8 = (_DWORD *)v6;
      }
      uint64_t v6 = *v11;
    }
    while (*v11);
    if (v8 != (_DWORD *)((char *)this + 288) && v67 >= v8[8])
    {
      *(void *)buf = &v67;
      int v14 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      uint64_t v17 = v14[7];
      BOOL v15 = v14 + 7;
      int v16 = v17;
      if (v17)
      {
        unsigned __int8 v18 = v15;
        do
        {
          unsigned int v19 = *((_DWORD *)v16 + 8);
          BOOL v20 = v19 >= v66;
          if (v19 >= v66) {
            unsigned int v21 = (uint64_t **)v16;
          }
          else {
            unsigned int v21 = (uint64_t **)(v16 + 1);
          }
          if (v20) {
            unsigned __int8 v18 = (uint64_t **)v16;
          }
          int v16 = *v21;
        }
        while (*v21);
        if (v18 != v15 && v66 >= *((_DWORD *)v18 + 8))
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "addBearer";
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = v66;
            _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Bearer %u is already configured. Returning Success.\n", buf, 0x12u);
          }
          return 1;
        }
      }
      v63 = 0;
      v64 = 0;
      v65 = 0;
      __p = 0;
      v61 = 0;
      v62 = 0;
      __int16 v59 = 0;
      *(void *)buf = &v67;
      __int16 v22 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)[8];
      BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "addBearer";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v66;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v67;
          _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: ERROR: Failed to add Bearer %u on Interface %u. Out of radio resources. Redirecting to Default Bearer\n", buf, 0x18u);
        }
        *(void *)buf = &v67;
        LODWORD(v68) = *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18);
        if (v68 == -1) {
          __assert_rtn("addBearer", "AppleCellularDataPlaneHelper.cpp", 670, "defaultBearerID != kACDPHelperNoBearer");
        }
        *(void *)buf = &v67;
        uint64_t v24 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(void *)buf = &v68;
        __int16 v25 = std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v24 + 6, (unsigned int *)&v68, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(void *)buf = &v67;
        int v26 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(void *)buf = &v66;
        uint64_t v27 = std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v26 + 6, &v66, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        std::__memberwise_copy_assign[abi:ne180100]<std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,0ul,1ul,2ul>((char *)v27 + 40, (uint64_t)(v25 + 5));
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_86;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "addBearer";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v66;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v68;
        int v28 = &_os_log_internal;
        uint64_t v29 = "::%s: Bearer %u redirected to %u\n";
        uint32_t v30 = 24;
      }
      else
      {
        if (v23)
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "addBearer";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v66;
          _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Bearer %u becomes Default Bearer\n", buf, 0x12u);
        }
        *(void *)buf = &v67;
        if (*((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18) != -1)__assert_rtn("addBearer", "AppleCellularDataPlaneHelper.cpp", 639, "config_[interface].defaultBearer == kACDPHelperNoBearer"); {
        *(void *)buf = &v67;
        }
        int v31 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        if (*((_DWORD *)v31 + 19))
        {
          unint64_t v32 = 0;
          do
          {
            int v33 = *((_DWORD *)v31 + 3 * v32 + 20);
            if (v33 == 3)
            {
              v36 = v64;
              if (v64 >= v65)
              {
                long long v44 = (char *)v63;
                uint64_t v45 = v64 - (unsigned char *)v63;
                if (v64 - (unsigned char *)v63 <= -3) {
                  std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v46 = v45 >> 1;
                if (v65 - (unsigned char *)v63 <= (unint64_t)((v45 >> 1) + 1)) {
                  uint64_t v47 = v46 + 1;
                }
                else {
                  uint64_t v47 = v65 - (unsigned char *)v63;
                }
                if ((unint64_t)(v65 - (unsigned char *)v63) >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v48 = v47;
                }
                if (v48)
                {
                  __int16 v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v65, v48);
                  long long v44 = (char *)v63;
                  v36 = v64;
                }
                else
                {
                  __int16 v49 = 0;
                }
                char v52 = &v49[2 * v46];
                *(_WORD *)char v52 = v32;
                long long v37 = v52 + 2;
                while (v36 != v44)
                {
                  __int16 v53 = *((_WORD *)v36 - 1);
                  v36 -= 2;
                  *((_WORD *)v52 - 1) = v53;
                  v52 -= 2;
                }
                v63 = v52;
                v64 = v37;
                v65 = &v49[2 * v48];
                if (v44) {
                  operator delete(v44);
                }
              }
              else
              {
                *(_WORD *)v64 = v32;
                long long v37 = v36 + 2;
              }
              v64 = v37;
            }
            else if (!v33)
            {
              unsigned int v34 = v61;
              if (v61 >= v62)
              {
                long long v38 = (char *)__p;
                uint64_t v39 = v61 - (unsigned char *)__p;
                if (v61 - (unsigned char *)__p <= -3) {
                  std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v40 = v39 >> 1;
                if (v62 - (unsigned char *)__p <= (unint64_t)((v39 >> 1) + 1)) {
                  uint64_t v41 = v40 + 1;
                }
                else {
                  uint64_t v41 = v62 - (unsigned char *)__p;
                }
                if ((unint64_t)(v62 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v42 = v41;
                }
                if (v42)
                {
                  long long v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v62, v42);
                  long long v38 = (char *)__p;
                  unsigned int v34 = v61;
                }
                else
                {
                  long long v43 = 0;
                }
                int v50 = &v43[2 * v40];
                *(_WORD *)int v50 = v32;
                int v35 = v50 + 2;
                while (v34 != v38)
                {
                  __int16 v51 = *((_WORD *)v34 - 1);
                  v34 -= 2;
                  *((_WORD *)v50 - 1) = v51;
                  v50 -= 2;
                }
                __p = v50;
                v61 = v35;
                v62 = &v43[2 * v42];
                if (v38) {
                  operator delete(v38);
                }
              }
              else
              {
                *(_WORD *)v61 = v32;
                int v35 = v34 + 2;
              }
              v61 = v35;
            }
            ++v32;
          }
          while (v32 < *((unsigned int *)v31 + 19));
        }
        unsigned int v54 = v66;
        *(void *)buf = &v67;
        *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18) = v54;
        _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2EEEEJNS_6vectorItNS_9allocatorItEEEES6_tEEC2B8ne180100IJLm0ELm1ELm2EEJS6_S6_tEJEJEJRS6_S9_RtEEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSC_IJDpT2_EEEDpOT3_((uint64_t)buf, (uint64_t)&v63, (uint64_t)&__p, &v59);
        __int16 v68 = &v67;
        int v55 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, &v68);
        __int16 v68 = &v66;
        int v56 = std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v55 + 6, &v66, (uint64_t)&std::piecewise_construct, &v68);
        int v57 = v56[5];
        if (v57)
        {
          v56[6] = v57;
          operator delete(v57);
          v56[5] = 0;
          v56[6] = 0;
          v56[7] = 0;
        }
        __int16 v58 = v56[8];
        *(_OWORD *)(v56 + 5) = *(_OWORD *)buf;
        v56[7] = *(uint64_t **)&buf[16];
        memset(buf, 0, sizeof(buf));
        if (v58)
        {
          v56[9] = v58;
          operator delete(v58);
          v56[8] = 0;
          v56[9] = 0;
          v56[10] = 0;
          __int16 v58 = *(uint64_t **)buf;
        }
        *((_OWORD *)v56 + 4) = v70;
        v56[10] = v71;
        int v71 = 0;
        long long v70 = 0uLL;
        *((_WORD *)v56 + 44) = v72;
        if (v58)
        {
          *(void *)&buf[8] = v58;
          operator delete(v58);
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_86;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "addBearer";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v66;
        int v28 = &_os_log_internal;
        uint64_t v29 = "::%s: Bearer %u added\n";
        uint32_t v30 = 18;
      }
      _os_log_impl(&dword_223BFA000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
LABEL_86:
      if (__p)
      {
        v61 = (char *)__p;
        operator delete(__p);
      }
      if (v63)
      {
        v64 = (char *)v63;
        operator delete(v63);
      }
      return 1;
    }
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v12)
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "addBearer";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v67;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Error: Network Interface %u not configured by ACDP-Helper.\n", buf, 0x12u);
    return 0;
  }
  return result;
}

void sub_223BFDC00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  unsigned int v45 = a2;
  *a4 = 0;
  if (a2 == -1) {
    goto LABEL_48;
  }
  if (a3 == -1) {
    goto LABEL_48;
  }
  uint64_t v5 = *(void *)(a1 + 288);
  if (!v5) {
    goto LABEL_48;
  }
  unsigned int v7 = (uint64_t **)(a1 + 280);
  uint64_t v8 = a1 + 288;
  do
  {
    unsigned int v9 = *(_DWORD *)(v5 + 32);
    BOOL v10 = v9 >= a2;
    if (v9 >= a2) {
      size_t v11 = (uint64_t *)v5;
    }
    else {
      size_t v11 = (uint64_t *)(v5 + 8);
    }
    if (v10) {
      uint64_t v8 = v5;
    }
    uint64_t v5 = *v11;
  }
  while (*v11);
  if (v8 == a1 + 288 || *(_DWORD *)(v8 + 32) > a2)
  {
LABEL_48:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "generateOutputParamsForBearerID";
      BOOL v12 = &_os_log_internal;
      size_t v13 = "::%s: returning 0 pipes\n";
      uint32_t v14 = 12;
LABEL_16:
      _os_log_impl(&dword_223BFA000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
    }
  }
  else
  {
    *(void *)buf = &v45;
    int v16 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 280), &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
    uint64_t v17 = v16[6];
    long long v44 = v16 + 7;
    if (v17 != (uint64_t *)(v16 + 7))
    {
      do
      {
        if (*((_DWORD *)v17 + 8) == a3)
        {
          unsigned __int8 v18 = &_os_log_internal;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "generateOutputParamsForBearerID";
            __int16 v47 = 1024;
            unsigned int v48 = a3;
            __int16 v49 = 1024;
            LODWORD(v50) = v45;
            _os_log_impl(&dword_223BFA000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u found on Interface %u\n", buf, 0x18u);
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = (v17[6] - v17[5]) >> 1;
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "generateOutputParamsForBearerID";
            __int16 v47 = 1024;
            unsigned int v48 = a3;
            __int16 v49 = 2048;
            uint64_t v50 = v19;
            _os_log_impl(&dword_223BFA000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u has %lu RX Pipes\n", buf, 0x1Cu);
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = (v17[9] - v17[8]) >> 1;
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "generateOutputParamsForBearerID";
            __int16 v47 = 1024;
            unsigned int v48 = a3;
            __int16 v49 = 2048;
            uint64_t v50 = v20;
            _os_log_impl(&dword_223BFA000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u has %lu TX Pipes\n", buf, 0x1Cu);
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = *((unsigned __int16 *)v17 + 44);
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "generateOutputParamsForBearerID";
            __int16 v47 = 1024;
            unsigned int v48 = a3;
            __int16 v49 = 1024;
            LODWORD(v50) = v21;
            _os_log_impl(&dword_223BFA000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u is using QueueSet ID %u\n", buf, 0x18u);
          }
          BOOL v23 = (unsigned __int16 *)v17[5];
          __int16 v22 = (unsigned __int16 *)v17[6];
          while (v23 != v22)
          {
            uint64_t v24 = *v23;
            *(void *)buf = &v45;
            __int16 v25 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
            v24 *= 3;
            AppleCellularDataPlaneHelperInterface::printIPCPipeConfig((uint64_t)v25, (_DWORD *)v25 + v24 + 20);
            *(void *)buf = &v45;
            int v26 = (char *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 4 * v24;
            unsigned int v27 = *a4;
            unsigned int v28 = *a4 + 1;
            *a4 = v28;
            uint64_t v29 = &a4[3 * v27];
            uint64_t v30 = *((void *)v26 + 10);
            v29[3] = *((_DWORD *)v26 + 22);
            *(void *)(v29 + 1) = v30;
            if (v28 >= 0x11) {
              AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID();
            }
            ++v23;
          }
          int v31 = (unsigned __int16 *)v17[8];
          unint64_t v32 = (unsigned __int16 *)v17[9];
          while (v31 != v32)
          {
            uint64_t v33 = *v31;
            *(void *)buf = &v45;
            unsigned int v34 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
            v33 *= 3;
            AppleCellularDataPlaneHelperInterface::printIPCPipeConfig((uint64_t)v34, (_DWORD *)v34 + v33 + 20);
            *(void *)buf = &v45;
            int v35 = (char *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 4 * v33;
            unsigned int v36 = *a4;
            unsigned int v37 = *a4 + 1;
            *a4 = v37;
            long long v38 = &a4[3 * v36];
            uint64_t v39 = *((void *)v35 + 10);
            v38[3] = *((_DWORD *)v35 + 22);
            *(void *)(v38 + 1) = v39;
            if (v37 >= 0x11) {
              AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID();
            }
            ++v31;
          }
        }
        uint64_t v40 = (uint64_t *)v17[1];
        if (v40)
        {
          do
          {
            uint64_t v41 = v40;
            uint64_t v40 = (uint64_t *)*v40;
          }
          while (v40);
        }
        else
        {
          do
          {
            uint64_t v41 = (uint64_t *)v17[2];
            BOOL v42 = *v41 == (void)v17;
            uint64_t v17 = v41;
          }
          while (!v42);
        }
        uint64_t v17 = v41;
      }
      while (v41 != (uint64_t *)v44);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v43 = *a4;
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "generateOutputParamsForBearerID";
      __int16 v47 = 1024;
      unsigned int v48 = v43;
      BOOL v12 = &_os_log_internal;
      size_t v13 = "::%s: returning %u pipes\n";
      uint32_t v14 = 18;
      goto LABEL_16;
    }
  }
  return 1;
}

uint64_t AppleCellularDataPlaneHelperInterface::removeBearer(AppleCellularDataPlaneHelperInterface *this, unsigned int a2, unsigned int a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unsigned int v26 = a3;
  unsigned int v27 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "removeBearer";
    __int16 v29 = 1024;
    unsigned int v30 = a3;
    __int16 v31 = 1024;
    unsigned int v32 = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Removing Bearer 0x%x from Network Interface %u.\n", buf, 0x18u);
  }
  uint64_t v6 = *((void *)this + 36);
  if (v6)
  {
    unsigned int v7 = (uint64_t **)((char *)this + 280);
    uint64_t v8 = (_DWORD *)((char *)this + 288);
    do
    {
      unsigned int v9 = *(_DWORD *)(v6 + 32);
      BOOL v10 = v9 >= a2;
      if (v9 >= a2) {
        size_t v11 = (uint64_t *)v6;
      }
      else {
        size_t v11 = (uint64_t *)(v6 + 8);
      }
      if (v10) {
        uint64_t v8 = (_DWORD *)v6;
      }
      uint64_t v6 = *v11;
    }
    while (*v11);
    if (v8 != (_DWORD *)((char *)this + 288) && v8[8] <= a2)
    {
      *(void *)buf = &v27;
      uint32_t v14 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      uint64_t v17 = v14[7];
      BOOL v15 = v14 + 7;
      int v16 = v17;
      if (!v17) {
        goto LABEL_27;
      }
      unsigned __int8 v18 = v15;
      do
      {
        unsigned int v19 = *((_DWORD *)v16 + 8);
        BOOL v20 = v19 >= a3;
        if (v19 >= a3) {
          int v21 = (uint64_t **)v16;
        }
        else {
          int v21 = (uint64_t **)(v16 + 1);
        }
        if (v20) {
          unsigned __int8 v18 = (uint64_t **)v16;
        }
        int v16 = *v21;
      }
      while (*v21);
      if (v18 != v15 && *((_DWORD *)v18 + 8) <= a3)
      {
        *(void *)buf = &v27;
        uint64_t v24 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__erase_unique<unsigned int>((uint64_t)(v24 + 6), &v26);
        unsigned int v25 = v26;
        *(void *)buf = &v27;
        if (v25 == *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18))
        {
          *(void *)buf = &v27;
          *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18) = -1;
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            return 1;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "removeBearer";
          __int16 v29 = 1024;
          unsigned int v30 = v26;
          __int16 v22 = &_os_log_internal;
          BOOL v23 = "::%s: Default Bearer %u removed\n";
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            return 1;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "removeBearer";
          __int16 v29 = 1024;
          unsigned int v30 = v26;
          __int16 v22 = &_os_log_internal;
          BOOL v23 = "::%s: Bearer %u removed\n";
        }
      }
      else
      {
LABEL_27:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "removeBearer";
        __int16 v29 = 1024;
        unsigned int v30 = a3;
        __int16 v22 = &_os_log_internal;
        BOOL v23 = "::%s: Bearer 0x%x is not configured. Returning Success.\n";
      }
      _os_log_impl(&dword_223BFA000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x12u);
      return 1;
    }
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v12)
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "removeBearer";
    __int16 v29 = 1024;
    unsigned int v30 = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Error: Network Interface %u not configured by ACDP-Helper.\n", buf, 0x12u);
    return 0;
  }
  return result;
}

uint64_t ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke_2(uint64_t a1)
{
  return AppleCellularDataPlaneHelperInterface::removeInterface(*(AppleCellularDataPlaneHelperInterface **)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 40) + 16));
}

void AppleCellularDataPlaneHelperInterface::printIPCPipeConfig(uint64_t a1, _DWORD *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    switch(*a2)
    {
      case 0:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315138;
          uint64_t v8 = "printIPCPipeConfig";
          uint64_t v3 = &_os_log_internal;
          int v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_UL_TR\n";
          goto LABEL_11;
        }
        break;
      case 1:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315138;
          uint64_t v8 = "printIPCPipeConfig";
          uint64_t v3 = &_os_log_internal;
          int v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_UL_CR\n";
          goto LABEL_11;
        }
        break;
      case 2:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315138;
          uint64_t v8 = "printIPCPipeConfig";
          uint64_t v3 = &_os_log_internal;
          int v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_DL_TR\n";
          goto LABEL_11;
        }
        break;
      case 3:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315138;
          uint64_t v8 = "printIPCPipeConfig";
          uint64_t v3 = &_os_log_internal;
          int v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_DL_CR\n";
LABEL_11:
          _os_log_impl(&dword_223BFA000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v7, 0xCu);
        }
        break;
      default:
        break;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = a2[1];
      int v7 = 136315394;
      uint64_t v8 = "printIPCPipeConfig";
      __int16 v9 = 1024;
      int v10 = v5;
      _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Priority = %u\n", (uint8_t *)&v7, 0x12u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = a2[2];
      int v7 = 136315394;
      uint64_t v8 = "printIPCPipeConfig";
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: ID = %u\n", (uint8_t *)&v7, 0x12u);
    }
  }
}

uint64_t std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>::~tuple(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t ACDPHelperSentry<AppleCellularDataPlaneHelperInterface::removeInterface(unsigned int)::$_0>::~ACDPHelperSentry(uint64_t a1)
{
  return a1;
}

uint64_t AppleCellularDataPlaneHelperInterface::notifyDedicatedBearer()
{
  return 0;
}

uint64_t AppleCellularDataPlaneHelperInterface::blockPDPTraffic(AppleCellularDataPlaneHelperInterface *this, unsigned int a2, char a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v18 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "blockPDPTraffic";
    __int16 v20 = 1024;
    unsigned int v21 = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Blocking PDP Traffic on Network Interface %u.\n", buf, 0x12u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 8));
  uint64_t v6 = *((void *)this + 36);
  if (v6)
  {
    int v7 = (_DWORD *)((char *)this + 288);
    do
    {
      unsigned int v8 = *(_DWORD *)(v6 + 32);
      BOOL v9 = v8 >= a2;
      if (v8 >= a2) {
        int v10 = (uint64_t *)v6;
      }
      else {
        int v10 = (uint64_t *)(v6 + 8);
      }
      if (v9) {
        int v7 = (_DWORD *)v6;
      }
      uint64_t v6 = *v10;
    }
    while (*v10);
    if (v7 != (_DWORD *)((char *)this + 288) && v7[8] <= a2)
    {
      *(void *)buf = &v18;
      BOOL v12 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v18, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      uint64_t v11 = AppleCellularDataPlaneHelperInterface::connect(this, *((unsigned __int16 *)v12 + 21));
      if (v11)
      {
        size_t v13 = (AppleCellularDataPlaneHelperInterface *)((char *)this + 304);
        if (a3)
        {
          IOACIPCBBNetCfgClass::stopNetIfTx(v13);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "blockPDPTraffic";
            __int16 v20 = 1024;
            unsigned int v21 = v18;
            uint32_t v14 = &_os_log_internal;
            BOOL v15 = "::%s: Network Interface %u blocked\n";
LABEL_24:
            uint32_t v16 = 18;
            goto LABEL_25;
          }
        }
        else
        {
          IOACIPCBBNetCfgClass::startNetIfTx(v13);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "blockPDPTraffic";
            __int16 v20 = 1024;
            unsigned int v21 = v18;
            uint32_t v14 = &_os_log_internal;
            BOOL v15 = "::%s: Network Interface %u resumed\n";
            goto LABEL_24;
          }
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "blockPDPTraffic";
        uint32_t v14 = &_os_log_internal;
        BOOL v15 = "::%s: ERROR: Failed to connect to ACDP-Driver. Device Reset needed\n";
        uint32_t v16 = 12;
LABEL_25:
        _os_log_impl(&dword_223BFA000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
      }
      IOACIPCBBNetCfgClass::stop((AppleCellularDataPlaneHelperInterface *)((char *)this + 304));
      goto LABEL_27;
    }
  }
  uint64_t v11 = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "blockPDPTraffic";
    __int16 v20 = 1024;
    unsigned int v21 = a2;
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: Error: Network Interface %u not configured by ACDP-Helper.\n", buf, 0x12u);
    uint64_t v11 = 0;
  }
LABEL_27:
  std::mutex::unlock((std::mutex *)((char *)this + 8));
  return v11;
}

void sub_223BFEADC(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void handleInterfaceChange(const __SCDynamicStore *a1, const __CFArray *a2, char *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int v5 = (std::mutex *)(a3 + 48);
    std::mutex::lock((std::mutex *)(a3 + 48));
    *((_WORD *)a3 + 62) = 0;
    uint64_t v6 = (const char *)*((void *)a3 + 14);
    if (!v6) {
      goto LABEL_17;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      size_t v13 = "handleInterfaceChange";
      __int16 v14 = 2080;
      BOOL v15 = v6;
      _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: checking for %s", (uint8_t *)&v12, 0x16u);
      uint64_t v6 = (const char *)*((void *)a3 + 14);
    }
    BOOL v7 = checkSCStoreForIfNet(a1, v6);
    a3[125] = v7;
    int v8 = *((_DWORD *)a3 + 30);
    BOOL v9 = !v8 && v7;
    BOOL v10 = v8 != 1 || v7;
    if (v9 || !v10)
    {
      a3[124] = 1;
      std::mutex::unlock(v5);
      std::condition_variable::notify_all((std::condition_variable *)a3);
    }
    else
    {
LABEL_17:
      std::mutex::unlock(v5);
    }
  }
}

BOOL AppleCellularDataPlaneHelperInterface::checkForDevicePresence(SCDynamicStoreRef *this, const char *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (!result) {
      return result;
    }
    int v9 = 136315138;
    BOOL v10 = "checkForDevicePresence";
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: invalid interface name", (uint8_t *)&v9, 0xCu);
    return 0;
  }
  if (a3)
  {
    if (!result) {
      goto LABEL_10;
    }
    int v9 = 136315394;
    BOOL v10 = "checkForDevicePresence";
    __int16 v11 = 2080;
    int v12 = a2;
    BOOL v7 = &_os_log_internal;
    int v8 = "::%s: Check for interface presence (%s)";
  }
  else
  {
    if (!result) {
      goto LABEL_10;
    }
    int v9 = 136315394;
    BOOL v10 = "checkForDevicePresence";
    __int16 v11 = 2080;
    int v12 = a2;
    BOOL v7 = &_os_log_internal;
    int v8 = "::%s: Check for interface absence (%s)";
  }
  _os_log_impl(&dword_223BFA000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
LABEL_10:
  if (checkSCStoreForIfNet(this[18], a2) != a3) {
    return 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    BOOL v10 = "checkForDevicePresence";
    _os_log_impl(&dword_223BFA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "::%s: condition already met", (uint8_t *)&v9, 0xCu);
  }
  return 1;
}

BOOL checkSCStoreForIfNet(SCDynamicStoreRef store, const char *a2)
{
  CFStringRef NetworkInterface = (const __CFString *)getNetworkInterfaceKey(void)::key;
  if (!getNetworkInterfaceKey(void)::key)
  {
    CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, (CFStringRef)*MEMORY[0x263F1BC10]);
    getNetworkInterfaceKey(void)::key = (uint64_t)NetworkInterface;
  }
  CFDictionaryRef v5 = (const __CFDictionary *)SCDynamicStoreCopyValue(store, NetworkInterface);
  p_CFDictionaryRef theDict = &theDict;
  CFDictionaryRef theDict = v5;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v5
    && CFGetTypeID(v5) == TypeID
    && (CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F1BDA8]),
        CFTypeID v8 = CFArrayGetTypeID(),
        Value)
    && CFGetTypeID(Value) == v8
    && (CFStringRef theString2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x600u)) != 0)
  {
    CFIndex Count = CFArrayGetCount(Value);
    if (Count < 1)
    {
      BOOL v11 = 0;
    }
    else
    {
      CFIndex v10 = 0;
      BOOL v11 = 1;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Value, v10);
        if (CFEqual(ValueAtIndex, theString2)) {
          break;
        }
        BOOL v11 = ++v10 < Count;
      }
      while (Count != v10);
    }
    CFRelease(theString2);
  }
  else
  {
    BOOL v11 = 0;
  }
  ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_0>::~ACDPHelperSentry((const void ***)&p_theDict);
  return v11;
}

void sub_223BFEF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CFTypeRef *a9, uint64_t a10, const void **a11)
{
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2646D60F8, MEMORY[0x263F8C060]);
}

void sub_223BFF0B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(a2 + 4);
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
}

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

char *std::__memberwise_copy_assign[abi:ne180100]<std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,0ul,1ul,2ul>(char *result, uint64_t a2)
{
  uint64_t v3 = result;
  if (result != (char *)a2)
  {
    std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>(result, *(char **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
    BOOL result = std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>(v3 + 24, *(char **)(a2 + 24), *(void *)(a2 + 32), (uint64_t)(*(void *)(a2 + 32) - *(void *)(a2 + 24)) >> 1);
  }
  *((_WORD *)v3 + 24) = *(_WORD *)(a2 + 48);
  return result;
}

char *std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *((void *)result + 2);
  int v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(void *)result) >> 1)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    }
    if (v8 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v8 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v10;
    }
    BOOL result = std::vector<unsigned short>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    int v12 = (void **)(v7 + 1);
    int v9 = v13;
LABEL_17:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unsigned int v18 = v9;
      unsigned int v19 = __src;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  int v12 = (void **)(result + 8);
  __int16 v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 1;
  if (v15 >= a4) {
    goto LABEL_17;
  }
  uint64_t v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    BOOL result = (char *)memmove(*(void **)result, __src, v14 - v9);
    int v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unsigned int v18 = v9;
    unsigned int v19 = v16;
LABEL_19:
    BOOL result = (char *)memmove(v18, v19, v17);
  }
LABEL_20:
  const char *v12 = &v9[v17];
  return result;
}

char *std::vector<unsigned short>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  }
  BOOL result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

uint64_t _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2EEEEJNS_6vectorItNS_9allocatorItEEEES6_tEEC2B8ne180100IJLm0ELm1ELm2EEJS6_S6_tEJEJEJRS6_S9_RtEEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSC_IJDpT2_EEEDpOT3_(uint64_t a1, uint64_t a2, uint64_t a3, _WORD *a4)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((void *)a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((void *)(a1 + 24), *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 1);
  *(_WORD *)(a1 + 48) = *a4;
  return a1;
}

void sub_223BFF444(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = std::vector<unsigned short>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_223BFF4C0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

CFTypeRef **ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_1>::~ACDPHelperSentry(CFTypeRef **a1)
{
  return a1;
}

const void ***ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_0>::~ACDPHelperSentry(const void ***a1)
{
  uint64_t v2 = **a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy(a1, a2[1]);
    std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy((uint64_t)(a2 + 6), (void *)a2[7]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        int v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (char *)operator new(0x110uLL);
    *((_DWORD *)v11 + 8) = **a4;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *((void *)v11 + 33) = 0;
    *(_OWORD *)(v11 + 248) = 0u;
    *(_OWORD *)(v11 + 232) = 0u;
    *(_OWORD *)(v11 + 216) = 0u;
    *(_OWORD *)(v11 + 200) = 0u;
    *(_OWORD *)(v11 + 184) = 0u;
    *(_OWORD *)(v11 + 168) = 0u;
    *(_OWORD *)(v11 + 152) = 0u;
    *(_OWORD *)(v11 + 136) = 0u;
    *(_OWORD *)(v11 + 120) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *((void *)v11 + 6) = v11 + 56;
    *((_DWORD *)v11 + 18) = -1;
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  BOOL result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            char *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__erase_unique<unsigned int>(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unsigned int v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    unsigned int v5 = *(_DWORD *)(v2 + 32);
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = (uint64_t *)v2;
    }
    else {
      uint64_t v7 = (uint64_t *)(v2 + 8);
    }
    if (v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32)) {
    return 0;
  }
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::erase((uint64_t **)a1, v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::erase(uint64_t **a1, uint64_t a2)
{
  unsigned int v3 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__remove_node_pointer(a1, (uint64_t *)a2);
  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(a2 + 48, *(void **)(a2 + 56));
  operator delete((void *)a2);
  return v3;
}

uint64_t *std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unsigned int v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      unsigned int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unsigned int v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unsigned int v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unsigned int v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      BOOL result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      BOOL result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        BOOL result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    unint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        unint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *uint64_t v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    size_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      size_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      BOOL result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  unsigned int v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  __int16 v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    size_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    __int16 v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *__int16 v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    unsigned int v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  BOOL v6 = a1[1];
  int v8 = a1 + 1;
  uint64_t v9 = a1 + 1;
  if (v6)
  {
    unsigned int v10 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unsigned int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        BOOL v6 = *v9;
        int v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v11 >= v10) {
        break;
      }
      BOOL v6 = v9[1];
      if (!v6)
      {
        int v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v12 = (char *)operator new(0x60uLL);
    v14[1] = v7;
    *((_DWORD *)v12 + 8) = **a4;
    *((_WORD *)v12 + 44) = 0;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    char v15 = 1;
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(v2 + 4);
    }
    operator delete(v2);
  }
}

uint64_t std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__erase_unique<unsigned int>(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unsigned int v3 = *a2;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unsigned int v5 = *(_DWORD *)(v2 + 32);
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = (uint64_t *)v2;
    }
    else {
      uint64_t v7 = (uint64_t *)(v2 + 8);
    }
    if (v6) {
      uint64_t v4 = (uint64_t *)v2;
    }
    uint64_t v2 = *v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < *((_DWORD *)v4 + 8)) {
    return 0;
  }
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__remove_node_pointer((uint64_t **)a1, v4);
  std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(v4 + 4);
  operator delete(v4);
  return 1;
}

void ApplePDPHelperInterface::ApplePDPHelperInterface(ApplePDPHelperInterface *this)
{
  *(void *)this = &unk_26D751AF8;
  *((void *)this + 1) = 850045863;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 19) = 0;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = (char *)this + 104;
  *((void *)this + 14) = (char *)this + 104;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
}

{
  *(void *)this = &unk_26D751AF8;
  *((void *)this + 1) = 850045863;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 19) = 0;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = (char *)this + 104;
  *((void *)this + 14) = (char *)this + 104;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
}

void ApplePDPHelperInterface::~ApplePDPHelperInterface(ApplePDPHelperInterface *this)
{
  *(void *)this = &unk_26D751AF8;
  uint64_t v2 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  ApplePDPHelperInterface::cleanup_nl(this);
  std::mutex::unlock(v2);
  std::__list_imp<__CFRunLoop *>::clear((void *)this + 13);
  std::mutex::~mutex(v2);
}

{
  uint64_t vars8;

  ApplePDPHelperInterface::~ApplePDPHelperInterface(this);
  JUMPOUT(0x223CBEA70);
}

uint64_t ApplePDPHelperInterface::cleanup_nl(ApplePDPHelperInterface *this)
{
  if (*((void *)this + 15))
  {
    uint64_t v2 = (char *)this + 104;
    unsigned int v3 = (char *)*((void *)this + 14);
    if (v3 != (char *)this + 104)
    {
      CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE78];
      do
      {
        unsigned int v5 = (__CFRunLoop *)*((void *)v3 + 2);
        if (CFRunLoopContainsSource(v5, *((CFRunLoopSourceRef *)this + 12), v4)) {
          CFRunLoopRemoveSource(v5, *((CFRunLoopSourceRef *)this + 12), v4);
        }
        CFRelease(v5);
        unsigned int v3 = (char *)*((void *)v3 + 1);
      }
      while (v3 != v2);
    }
    std::__list_imp<__CFRunLoop *>::clear((void *)this + 13);
  }
  BOOL v6 = (IONotificationPort *)*((void *)this + 16);
  if (v6)
  {
    IONotificationPortDestroy(v6);
    *((void *)this + 16) = 0;
  }
  io_connect_t v7 = *((_DWORD *)this + 20);
  if (v7)
  {
    IOServiceClose(v7);
    *((_DWORD *)this + 20) = 0;
  }
  uint64_t result = *((unsigned int *)this + 19);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 19) = 0;
  }
  return result;
}

uint64_t ApplePDPHelperInterface::init(ApplePDPHelperInterface *this)
{
  kern_return_t v9;
  io_object_t notification;

  uint64_t v2 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  CFDictionaryRef v3 = IOServiceMatching("AppleIPAppender");
  mach_port_t v4 = *MEMORY[0x263F0EC88];
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v3);
  *((_DWORD *)this + 19) = MatchingService;
  if (MatchingService)
  {
    LODWORD(v6) = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)this + 20);
    if (v6 || (BOOL v6 = IONotificationPortCreate(v4), (*((void *)this + 16) = v6) == 0))
    {
      syslog(3, "Could not open service (0x%x)\n", v6);
    }
    else
    {
      notification = 0;
      uint64_t v9 = IOServiceAddInterestNotification(v6, *((_DWORD *)this + 19), "IOGeneralInterest", (IOServiceInterestCallback)ApplePDPHelperInterface::callback, this, &notification);
      *((void *)this + 12) = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)this + 16));
      if (!v9)
      {
        uint64_t v7 = 1;
        goto LABEL_6;
      }
    }
  }
  else
  {
    syslog(3, "Could not find %s service\n", "AppleIPAppender");
  }
  ApplePDPHelperInterface::cleanup_nl(this);
  uint64_t v7 = 0;
LABEL_6:
  std::mutex::unlock(v2);
  return v7;
}

void sub_223C0025C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callback(ApplePDPHelperInterface *this, void *a2, int a3, uint64_t a4, void *a5)
{
  uint64_t result = *((void *)this + 11);
  if (result)
  {
    if (a3 == -469794559)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 24))(result, a4);
    }
    else if (a3 == -469794560)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 16))(result, a4);
    }
  }
  return result;
}

uint64_t ApplePDPHelperInterface::getInstance(ApplePDPHelperInterface *this)
{
  if (ApplePDPHelperInterface::getInstance(void)::onceToken != -1) {
    dispatch_once(&ApplePDPHelperInterface::getInstance(void)::onceToken, &__block_literal_global);
  }
  return ApplePDPHelperInterface::getInstance(void)::sInstance;
}

void ___ZN23ApplePDPHelperInterface11getInstanceEv_block_invoke(ApplePDPHelperInterface *a1)
{
}

void ApplePDPHelperInterface::create(ApplePDPHelperInterface *this)
{
  if (ApplePDPHelperInterface::probeVariant(void)::sOnce != -1) {
    dispatch_once(&ApplePDPHelperInterface::probeVariant(void)::sOnce, &__block_literal_global_56);
  }
  if (ApplePDPHelperInterface::probeVariant(void)::ret == 1) {
    operator new();
  }
  operator new();
}

void sub_223C0046C(_Unwind_Exception *a1)
{
  MEMORY[0x223CBEA70](v1, 0x10F1C4028D990B6);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, unint64_t *a4, uint32_t a5, void *a6, size_t a7, unint64_t *a8, uint32_t *outputCnt, void *outputStruct, unint64_t *a11)
{
  kern_return_t v21;
  uint64_t v22;

  unsigned int v19 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  mach_port_t v20 = *((_DWORD *)this + 20);
  if (v20)
  {
    BOOL v21 = IOConnectCallMethod(v20, a2, a4, a5, a6, a7, a8, outputCnt, outputStruct, a11);
    if (!v21)
    {
      uint64_t v22 = 1;
      goto LABEL_7;
    }
    syslog(3, "ApplePDPHelper: Performing '%s' failed: %d (0x%x)\n", a3, v21, v21);
  }
  else
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
  }
  uint64_t v22 = 0;
LABEL_7:
  std::mutex::unlock(v19);
  return v22;
}

void sub_223C00578(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callScalarMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, unint64_t *a4, uint32_t a5, unint64_t *a6, unsigned int *a7)
{
  kern_return_t v16;
  uint64_t v17;

  uint64_t v14 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  mach_port_t v15 = *((_DWORD *)this + 20);
  if (v15)
  {
    uint64_t v16 = IOConnectCallScalarMethod(v15, a2, a4, a5, a6, a7);
    if (!v16)
    {
      size_t v17 = 1;
      goto LABEL_7;
    }
    syslog(3, "ApplePDPHelper: Performing '%s' failed: 0x%x\n", a3, v16);
  }
  else
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
  }
  size_t v17 = 0;
LABEL_7:
  std::mutex::unlock(v14);
  return v17;
}

void sub_223C00658(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callStructMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, void *a4, unsigned int a5, void *a6, unsigned int *a7)
{
  kern_return_t v16;
  uint64_t v17;
  size_t outputStructCnt;

  uint64_t v14 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  mach_port_t v15 = *((_DWORD *)this + 20);
  if (v15)
  {
    if (a7)
    {
      outputStructCnt = *a7;
      uint64_t v16 = IOConnectCallStructMethod(v15, a2, a4, a5, a6, &outputStructCnt);
      *a7 = outputStructCnt;
    }
    else
    {
      uint64_t v16 = IOConnectCallStructMethod(v15, a2, a4, a5, a6, 0);
    }
    if (!v16)
    {
      size_t v17 = 1;
      goto LABEL_10;
    }
    syslog(3, "ApplePDPHelper: Performing '%s' failed: 0x%x\n", a3, v16);
  }
  else
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
  }
  size_t v17 = 0;
LABEL_10:
  std::mutex::unlock(v14);
  return v17;
}

void sub_223C00768(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL ApplePDPHelperInterface::callAsyncScalarMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, uint64_t a4, unint64_t a5, unint64_t *a6, uint32_t a7, unint64_t *a8, uint32_t *outputCnt)
{
  kern_return_t v21;
  BOOL v22;
  uint64_t reference[2];
  long long v25;
  long long v26;
  long long v27;
  uint64_t v28;

  unsigned int v28 = *MEMORY[0x263EF8340];
  size_t v17 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  mach_port_t v18 = *((_DWORD *)this + 20);
  if (!v18)
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
LABEL_7:
    uint64_t v22 = 0;
    goto LABEL_8;
  }
  unsigned int v19 = (IONotificationPort *)*((void *)this + 16);
  if (!v19)
  {
    syslog(3, "ApplePDPHelper: IONotification port is NULL\n");
    goto LABEL_7;
  }
  reference[0] = 0;
  uint64_t v26 = 0u;
  uint64_t v27 = 0u;
  reference[1] = a4;
  uint64_t v25 = a5;
  mach_port_t MachPort = IONotificationPortGetMachPort(v19);
  BOOL v21 = IOConnectCallAsyncScalarMethod(v18, a2, MachPort, reference, 3u, a6, a7, a8, outputCnt);
  uint64_t v22 = v21 == 0;
  if (v21) {
    syslog(3, "ApplePDPHelper: Performing '%s' failed: 0x%x\n", a3, v21);
  }
LABEL_8:
  std::mutex::unlock(v17);
  return v22;
}

void sub_223C008C0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::enable(ApplePDPHelperInterface *this, unsigned int a2, BOOL *a3)
{
  unsigned int v7 = 1;
  unint64_t v5 = a2;
  unint64_t v6 = 0;
  uint64_t result = ApplePDPHelperInterface::callScalarMethod(this, 3u, "Enable QoS header prepend", &v5, 1u, &v6, &v7);
  if (a3)
  {
    if (result) {
      *a3 = v6 != 0;
    }
  }
  return result;
}

uint64_t ApplePDPHelperInterface::addFlow(ApplePDPHelperInterface *a1, int a2, int a3)
{
  v4[0] = a2;
  v4[1] = a3;
  return ApplePDPHelperInterface::callStructMethod(a1, 0, "Add Traffic class to flow Id mapping", v4, 8u, 0, 0);
}

uint64_t ApplePDPHelperInterface::removeFlow(ApplePDPHelperInterface *a1, unsigned int a2)
{
  unint64_t v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(a1, 1u, "Remove flow Id mapping from traffic class", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getFlow(ApplePDPHelperInterface *a1, unsigned int a2, _DWORD *a3)
{
  unsigned int v7 = 1;
  unint64_t v5 = a2;
  if (!a3) {
    return 0;
  }
  unint64_t v6 = 0;
  uint64_t result = ApplePDPHelperInterface::callScalarMethod(a1, 2u, "Get flow Id mapping for traffic class", &v5, 1u, &v6, &v7);
  if (result)
  {
    *a3 = v6;
    return 1;
  }
  return result;
}

uint64_t ApplePDPHelperInterface::enableMetadataTrailer(ApplePDPHelperInterface *this, unsigned int a2, BOOL *a3)
{
  unsigned int v7 = 1;
  unint64_t v5 = a2;
  unint64_t v6 = 0;
  uint64_t result = ApplePDPHelperInterface::callScalarMethod(this, 0x11u, "Enable metadata trailer append", &v5, 1u, &v6, &v7);
  if (a3)
  {
    if (result) {
      *a3 = v6 != 0;
    }
  }
  return result;
}

uint64_t ApplePDPHelperInterface::setDormancyInterval(ApplePDPHelperInterface *this, int a2, int a3)
{
  v4[0] = a2;
  v4[1] = a3;
  return ApplePDPHelperInterface::callStructMethod(this, 4u, "Set dormancy", v4, 8u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getDormancyTime(ApplePDPHelperInterface *this, unsigned int *a2)
{
  unsigned int v5 = 1;
  unint64_t v4 = 0;
  uint64_t result = ApplePDPHelperInterface::callScalarMethod(this, 5u, "Get dormancy time", 0, 0, &v4, &v5);
  if (result) {
    *a2 = v4;
  }
  return result;
}

uint64_t ApplePDPHelperInterface::getTimeAdjustment(ApplePDPHelperInterface *this, mach_timespec *a2)
{
  unsigned int v3 = 8;
  return ApplePDPHelperInterface::callStructMethod(this, 6u, "Get Sleep time adjustment", 0, 0, a2, &v3);
}

uint64_t ApplePDPHelperInterface::getStatus(ApplePDPHelperInterface *a1, void *a2)
{
  unsigned int v3 = 184;
  return ApplePDPHelperInterface::callStructMethod(a1, 7u, "Get status", 0, 0, a2, &v3);
}

uint64_t ApplePDPHelperInterface::setLinkQualityMetric(ApplePDPHelperInterface *this, int a2)
{
  unint64_t v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(this, 8u, "Set Link Quality metric for network interfaces", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::reportLinkThroughput(ApplePDPHelperInterface *a1, void *a2)
{
  if (a2) {
    return ApplePDPHelperInterface::callStructMethod(a1, 0xBu, "Report throughput for network interfaces", a2, 0x20u, 0, 0);
  }
  else {
    return 0;
  }
}

uint64_t ApplePDPHelperInterface::restartDormancyCheck(ApplePDPHelperInterface *this)
{
  return ApplePDPHelperInterface::callStructMethod(this, 9u, "Restart dormancy check", 0, 0, 0, 0);
}

uint64_t ApplePDPHelperInterface::copyWakeBuffer(ApplePDPHelperInterface *this, unsigned __int8 *a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint32_t outputCnt = 1;
  unint64_t v6 = a3;
  *a4 = a3;
  return ApplePDPHelperInterface::callMethod(this, 0xAu, "Copy wake buffer", &v6, 1u, 0, 0, a5, &outputCnt, a2, a4);
}

uint64_t ApplePDPHelperInterface::fillupPortLists(ApplePDPHelperInterface *this, unsigned __int16 *a2, unsigned int a3, const unsigned __int8 *a4, unint64_t a5, unsigned int *a6, __int16 a7)
{
  if (!a5) {
    return 1;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  while (1)
  {
    unsigned int v9 = a4[v7];
    if (v9) {
      break;
    }
LABEL_11:
    uint64_t v7 = ++v8;
    if (v8 >= a5) {
      return 1;
    }
  }
  unsigned int v10 = 0;
  unsigned __int16 v11 = (a7 << 15) + 8 * v8;
  while (1)
  {
    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v12 = *a6;
    if (v12 >= a3) {
      break;
    }
    *a6 = v12 + 1;
    a2[v12] = v11;
LABEL_8:
    if (v9 >= 2)
    {
      v9 >>= 1;
      ++v11;
      if (v10++ < 7) {
        continue;
      }
    }
    goto LABEL_11;
  }
  syslog(3, "%s: the number of port lists (%u) is more than max number of port lists (%u)\n", "BOOL ApplePDPHelperInterface::fillupPortLists(uint16_t *, const unsigned int, const uint8_t *, const size_t, unsigned int *, const unsigned int)", *a6, a3);
  return 0;
}

uint64_t ApplePDPHelperInterface::getOpenPortsExt(ApplePDPHelperInterface *this, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, unint64_t *a6)
{
  uint64_t v6 = MEMORY[0x270FA5388](this, a2, a3, a4, a5, a6);
  v24[3] = *MEMORY[0x263EF8340];
  if (v9 && (uint64_t v12 = v11) != 0)
  {
    unsigned int v13 = v10;
    *unsigned __int16 v11 = 0;
    if (v10 <= 0x10000)
    {
      mach_port_t v15 = v9;
      uint64_t v16 = (ApplePDPHelperInterface *)v6;
      unint64_t v17 = 0;
      v24[0] = v7;
      v24[1] = v8;
      unint64_t v22 = 4096;
      unsigned int v21 = 0;
      *unsigned __int16 v11 = 0;
      for (char i = 1; ; char i = 0)
      {
        char v19 = i;
        bzero(v23, 0x1000uLL);
        v24[2] = v17;
        uint64_t v20 = ApplePDPHelperInterface::callMethod(v16, 0xCu, "Get open ports (Extension)", v24, 3u, 0, 0, 0, 0, v23, &v22);
        if ((v20 & 1) == 0) {
          break;
        }
        if ((ApplePDPHelperInterface::fillupPortLists((ApplePDPHelperInterface *)v20, v15, v13, v23, 0x1000uLL, &v21, v17) & 1) == 0)return 0; {
        unint64_t v17 = 1;
        }
        if ((v19 & 1) == 0)
        {
          void *v12 = 2 * v21;
          return 1;
        }
      }
      syslog(3, "%s: Failed on getting raw bit buffer.\n");
    }
    else
    {
      syslog(3, "%s: Max number of port lists (%u) cannot be exceeded more than %u\n");
    }
  }
  else
  {
    syslog(3, "%s: portLists/copiedBytes should not be NULL\n");
  }
  return 0;
}

uint64_t ApplePDPHelperInterface::enableLowPowerPDPThrottle(ApplePDPHelperInterface *this, unsigned int a2)
{
  unint64_t v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(this, 0xDu, "Enable LowPower PDP throttle feature", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::activateLowPowerPDPThrottle(ApplePDPHelperInterface *this, unsigned int a2)
{
  unint64_t v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(this, 0xEu, "Activate LowPower PDP throttle feature", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getNumLowPowerPDPThrottleStats(ApplePDPHelperInterface *a1, void *a2)
{
  unsigned int v3 = 12;
  return ApplePDPHelperInterface::callStructMethod(a1, 0xFu, "Get Low power PDP throttle stats", 0, 0, a2, &v3);
}

uint64_t ApplePDPHelperInterface::blockPDPTraffic(ApplePDPHelperInterface *this, unsigned int a2, unsigned int a3)
{
  _DWORD v4[2] = *MEMORY[0x263EF8340];
  v4[0] = a2;
  v4[1] = a3;
  return ApplePDPHelperInterface::callScalarMethod(this, 0x10u, "Block PDP traffic", v4, 2u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getKeepaliveOffloadFrames(ApplePDPHelperInterface *a1, unsigned int a2, void *a3, _DWORD *a4)
{
  uint64_t v4 = 0;
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a4)
    {
      uint64_t v4 = *a4;
      if (v4)
      {
        unint64_t v8 = 132 * v4;
        v9[0] = a2;
        *a4 = 0;
        int v6 = ApplePDPHelperInterface::callMethod(a1, 0x12u, "Get Keepalive Offload Frames", v9, 1u, 0, 0, 0, 0, a3, &v8);
        uint64_t v4 = 0;
        if (v6)
        {
          if (v8 % 0x84)
          {
            syslog(3, "%s: Returned size %zu is not a multiple of frame size %lu\n", "BOOL ApplePDPHelperInterface::getKeepaliveOffloadFrames(unsigned int, AppleIPAppenderKeepaliveOffloadFrame_t *, unsigned int *)", v8, 132);
            return 0;
          }
          else
          {
            *a4 = v8 / 0x84;
            return 1;
          }
        }
      }
    }
  }
  return v4;
}

unint64_t ApplePDPHelperInterface::registerFilterRuleCallBack(ApplePDPHelperInterface *a1, const void *a2, const void *a3)
{
  unint64_t v3 = (unint64_t)a2;
  v8[2] = *MEMORY[0x263EF8340];
  if (a2)
  {
    syslog(6, "client callback: %p, context: %p\n", a2, a3);
    v8[0] = v3;
    v8[1] = (unint64_t)a3;
    uint32_t v7 = 0;
    unint64_t v3 = ApplePDPHelperInterface::callAsyncScalarMethod(a1, 0x14u, "register filter rule callback", (uint64_t)ApplePDPHelperInterface::filterRuleNotification, v3, v8, 2u, 0, &v7);
    if ((v3 & 1) == 0) {
      syslog(3, "Filter rule callback registration failed\n");
    }
  }
  else
  {
    syslog(3, "filter rule callback is NULL\n");
  }
  return v3;
}

void ApplePDPHelperInterface::filterRuleNotification(ApplePDPHelperInterface *this, void *a2, const void *a3, void *a4, void *a5)
{
  if (a2)
  {
    syslog(3, "Error - FilterRule notification, result: 0x%08x\n", a3, a4, a5);
  }
  else
  {
    syslog(6, "refCon: %p, frInfo: %p, context: %p\n", this, a3, a4);
    if (this)
    {
      unint64_t v8 = dispatch_queue_create("filter rule queue", 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___ZN23ApplePDPHelperInterface22filterRuleNotificationEPviS0_S0__block_invoke;
      block[3] = &__block_descriptor_tmp_42;
      block[4] = this;
      block[5] = a3;
      block[6] = a4;
      dispatch_sync(v8, block);
      dispatch_release(v8);
    }
    else
    {
      syslog(3, "NULL client callback reference\n");
    }
  }
}

void ___ZN23ApplePDPHelperInterface22filterRuleNotificationEPviS0_S0__block_invoke(void *a1)
{
  if (a1[5])
  {
    uint64_t v1 = (void (*)(uint64_t, uint64_t))a1[4];
    uint64_t v2 = a1[6];
    uint64_t v3 = a1[5];
    v1(v3, v2);
  }
  else
  {
    syslog(3, "NULL filter rule info\n");
  }
}

uint64_t ApplePDPHelperInterface::notifyDedicatedBearer(ApplePDPHelperInterface *a1, unsigned __int8 *a2, void *a3)
{
  if (!a2)
  {
    syslog(3, "NULL Input args\n");
    return 0;
  }
  if (!a3)
  {
    syslog(3, "NULL Output args\n");
    return 0;
  }
  if (*((_DWORD *)a2 + 2) >= 0xFFu)
  {
    syslog(3, "Invalid bearerID %u\n");
    return 0;
  }
  if (*((int *)a2 + 3) >= 3)
  {
    syslog(3, "Invalid service %u\n");
    return 0;
  }
  unsigned int v6 = 16;
  uint64_t v4 = ApplePDPHelperInterface::callStructMethod(a1, 0x13u, "Notify Dedicated bearer up or down", a2, 0x10u, a3, &v6);
  if ((v4 & 1) == 0) {
    syslog(3, "Notification of dedicated bearer to driver failed, enable %u, interfaceID: %u, bearerID: %u, service: %u\n", *a2, *((_DWORD *)a2 + 1), *((_DWORD *)a2 + 2), *((_DWORD *)a2 + 3));
  }
  return v4;
}

uint64_t ApplePDPHelperInterface::ipcContextConfig()
{
  return 0;
}

uint64_t ApplePDPHelperInterface::ipcConfigSet()
{
  return 1;
}

uint64_t ApplePDPHelperInterface::ipcInterfaceConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIdsInitialized & 1) == 0)
  {
    *(void *)&long long v3 = -1;
    *((void *)&v3 + 1) = -1;
    xmmword_267FC1E38 = v3;
    unk_267FC1E48 = v3;
    ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds = v3;
    unk_267FC1E28 = v3;
    ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIdsInitialized = 1;
  }
  if (*(unsigned char *)(a2 + 24))
  {
    uint64_t v4 = *(unsigned int *)(a2 + 16);
    if (*(void *)(a2 + 32))
    {
      int v5 = 63;
      if (v4 <= 0xF)
      {
        if (*((_DWORD *)&ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds
             + v4) == *(_DWORD *)(a2 + 20))
          int v5 = 127;
        else {
          int v5 = 63;
        }
      }
    }
    else
    {
      if (v4 <= 0xF) {
        *((_DWORD *)&ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds
      }
        + v4) = *(_DWORD *)(a2 + 20);
      int v5 = 255;
    }
    *(void *)a3 = 2;
    int v7 = 3 * v4;
    *(_DWORD *)(a3 + 8) = v5;
    *(_DWORD *)(a3 + 12) = (2 * v7) | 1;
    *(_DWORD *)(a3 + 16) = 3;
    *(_DWORD *)(a3 + 20) = v5;
    *(_DWORD *)(a3 + 24) = 2 * v7 + 2;
  }
  else
  {
    uint64_t v6 = *(unsigned int *)(a2 + 16);
    if (v6 <= 0xF) {
      *((_DWORD *)&ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds
    }
      + v6) = -1;
    *(_DWORD *)a3 = 0;
  }
  return 1;
}

void ApplePDPHelperInterface::registerHandlerInternal(ApplePDPHelperInterface *this, ApplePDPHelperInterface::Handler *a2)
{
  uint64_t v4 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  if (!*((_DWORD *)this + 19))
  {
    unsigned int v10 = "fService != MACH_PORT_NULL";
    int v11 = 748;
    goto LABEL_11;
  }
  if (*((void *)this + 11))
  {
    unsigned int v10 = "fHandler == NULL";
    int v11 = 749;
    goto LABEL_11;
  }
  if (!a2)
  {
    unsigned int v10 = "handler != NULL";
    int v11 = 750;
LABEL_11:
    __assert_rtn("registerHandlerInternal", "ApplePDPHelper.cpp", v11, v10);
  }
  *((void *)this + 11) = a2;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  uint64_t v6 = Current;
  if (!Current) {
    __assert_rtn("registerHandlerInternal", "ApplePDPHelper.cpp", 755, "rl");
  }
  CFRetain(Current);
  int v7 = operator new(0x18uLL);
  uint64_t v9 = *((void *)this + 13);
  unint64_t v8 = (void *)((char *)this + 104);
  v7[1] = v8;
  v7[2] = v6;
  void *v7 = v9;
  *(void *)(v9 + 8) = v7;
  *unint64_t v8 = v7;
  ++v8[2];
  CFRunLoopAddSource(v6, (CFRunLoopSourceRef)*(v8 - 1), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  std::mutex::unlock(v4);
}

void sub_223C016B8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL ApplePDPHelperInterface::isServicePresent(ApplePDPHelperInterface *this, const char *a2)
{
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching((const char *)this);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_service_t v5 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v5 != 0;
}

uint64_t ApplePDPHelperInterface::handleFilterRuleNotification(ApplePDPHelperInterface *this, int a2, void **a3)
{
  return 0;
}

uint64_t ApplePDPHelperInterface::probeVariant(ApplePDPHelperInterface *this)
{
  if (ApplePDPHelperInterface::probeVariant(void)::sOnce != -1) {
    dispatch_once(&ApplePDPHelperInterface::probeVariant(void)::sOnce, &__block_literal_global_56);
  }
  return ApplePDPHelperInterface::probeVariant(void)::ret;
}

void ___ZN23ApplePDPHelperInterface12probeVariantEv_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v8[0] = xmmword_2646D6200;
  v8[1] = *(_OWORD *)&off_2646D6210;
  v8[2] = xmmword_2646D6220;
  unint64_t v8[3] = *(_OWORD *)&off_2646D6230;
  std::map<char const*,ApplePDPHelperInterface::variant>::map[abi:ne180100]((uint64_t)&v6, (unint64_t *)v8, 4);
  uint64_t v1 = v6;
  if (v6 == v7)
  {
LABEL_9:
    int v5 = 1;
  }
  else
  {
    while (!ApplePDPHelperInterface::isServicePresent((ApplePDPHelperInterface *)v1[4], v0))
    {
      mach_port_t v2 = v1[1];
      if (v2)
      {
        do
        {
          CFDictionaryRef v3 = (void **)v2;
          mach_port_t v2 = (void *)*v2;
        }
        while (v2);
      }
      else
      {
        do
        {
          CFDictionaryRef v3 = (void **)v1[2];
          BOOL v4 = *v3 == v1;
          uint64_t v1 = v3;
        }
        while (!v4);
      }
      uint64_t v1 = v3;
      if (v3 == v7) {
        goto LABEL_9;
      }
    }
    int v5 = *((_DWORD *)v1 + 10);
  }
  ApplePDPHelperInterface::probeVariant(void)::ret = v5;
  std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy((uint64_t)&v6, v7[0]);
}

void sub_223C01860(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11)
{
}

uint64_t ApplePDPHelperInterface::setRATConfig(uint64_t result, int a2)
{
  *(_DWORD *)(result + 72) = a2;
  return result;
}

void *std::__list_imp<__CFRunLoop *>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        BOOL v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

uint64_t std::map<char const*,ApplePDPHelperInterface::variant>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  BOOL v4 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,ApplePDPHelperInterface::variant> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 2;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_223C01954(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,ApplePDPHelperInterface::variant> const&>(uint64_t **a1, void *a2, unint64_t *a3, _OWORD *a4)
{
  uint64_t v6 = (void **)std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__find_equal<char const*>(a1, a2, &v11, &v10, a3);
  int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    unint64_t v8 = (uint64_t **)v6;
    int v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

void *std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__find_equal<char const*>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (unint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      unsigned int v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        unsigned int v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          unint64_t v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = (void *)*v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        uint64_t v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      unint64_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    char v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      char v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    uint64_t v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          unsigned int v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = (void *)*v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        uint64_t v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      unsigned int v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID()
{
  __assert_rtn("generateOutputParamsForBearerID", "AppleCellularDataPlaneHelper.cpp", 405, "outputParams.pipesNum <= kAppleIPAppenderMaxIPCPipesParamsNum");
}

{
  __assert_rtn("generateOutputParamsForBearerID", "AppleCellularDataPlaneHelper.cpp", 397, "outputParams.pipesNum <= kAppleIPAppenderMaxIPCPipesParamsNum");
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x270EE4E40](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F20](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05500](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return (CFStringRef)MEMORY[0x270F05530](allocator, domain);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x270F05558](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x270F05570]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x270F05578](*(void *)&status);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t IOACIPCBBNetCfgClass::removeNetIf(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x270F92460](this);
}

uint64_t IOACIPCBBNetCfgClass::setLogLevel(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x270F92468](this);
}

uint64_t IOACIPCBBNetCfgClass::stopNetIfTx(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x270F92470](this);
}

uint64_t IOACIPCBBNetCfgClass::startNetIfTx(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x270F92478](this);
}

uint64_t IOACIPCBBNetCfgClass::open(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x270F92480](this);
}

uint64_t IOACIPCBBNetCfgClass::stop(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x270F92488](this);
}

uint64_t IOACIPCBBNetCfgClass::start(IOACIPCBBNetCfgClass *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F92490](this, a2);
}

uint64_t IOACIPCBBNetCfgClass::addNetIf()
{
  return MEMORY[0x270F92498]();
}

void IOACIPCBBNetCfgClass::IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
}

void IOACIPCBBNetCfgClass::~IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}