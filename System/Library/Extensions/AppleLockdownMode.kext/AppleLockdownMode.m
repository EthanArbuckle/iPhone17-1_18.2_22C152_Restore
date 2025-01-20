OSMetaClass *AppleLockdownMode::MetaClass::MetaClass(OSMetaClass *this)
{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleLockdownMode", &IOService::gMetaClass, 0x88u);
  result->__vftable = (OSMetaClass_vtbl *)off_206C8;
  return result;
}

{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleLockdownMode", &IOService::gMetaClass, 0x88u);
  result->__vftable = (OSMetaClass_vtbl *)off_206C8;
  return result;
}

void AppleLockdownMode::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleLockdownMode::AppleLockdownMode(AppleLockdownMode *this, const OSMetaClass *a2)
{
  IOService::IOService((IOService *)this, a2)->__vftable = (IOService_vtbl *)off_20170;
}

{
  IOService::IOService((IOService *)this, a2)->__vftable = (IOService_vtbl *)off_20170;
}

void AppleLockdownMode::~AppleLockdownMode(IOService *this)
{
}

{
  IOService::~IOService(this);
}

{
  uint64_t vars8;

  IOService::~IOService(this);

  _OSObject_typed_operator_delete(&AppleLockdownMode_ktv, this, 136);
}

void AppleLockdownMode::operator delete(void *a1, uint64_t a2)
{
}

void *AppleLockdownMode::getMetaClass(AppleLockdownMode *this)
{
  return &AppleLockdownMode::gMetaClass;
}

IOService *AppleLockdownMode::MetaClass::alloc(AppleLockdownMode::MetaClass *this)
{
  v1 = (IOService *)OSObject_typed_operator_new();
  IOService::IOService(v1, &AppleLockdownMode::gMetaClass)->__vftable = (IOService_vtbl *)off_20170;
  OSMetaClass::instanceConstructed(&AppleLockdownMode::gMetaClass);
  return v1;
}

uint64_t AppleLockdownMode::operator new(AppleLockdownMode *this)
{
  return OSObject_typed_operator_new();
}

void AppleLockdownMode::AppleLockdownMode(AppleLockdownMode *this)
{
  IOService::IOService((IOService *)this, &AppleLockdownMode::gMetaClass)->__vftable = (IOService_vtbl *)off_20170;
  OSMetaClass::instanceConstructed(&AppleLockdownMode::gMetaClass);
}

{
  IOService::IOService((IOService *)this, &AppleLockdownMode::gMetaClass)->__vftable = (IOService_vtbl *)off_20170;
  OSMetaClass::instanceConstructed(&AppleLockdownMode::gMetaClass);
}

BOOL PlatformSupportsXART(void)
{
  v0 = IORegistryEntry::fromPath("/arm-io/sep/iop-sep-nub/xART", gIODTPlane, 0, 0, 0);
  v1 = v0;
  if (v0) {
    ((void (*)(IORegistryEntry *))v0->release_0)(v0);
  }
  return v1 != 0;
}

const OSMetaClassBase *LDMShouldEnforceParity(void)
{
  if (PE_parse_boot_argn("-restore", 0, 0))
  {
    IOLog("[AppleLockdownMode - %s] restoreOS check failed\n");
    return 0;
  }
  IOLog("[AppleLockdownMode - %s] restoreOS check passed\n", "LDMShouldEnforceParity");
  v0 = IOService::serviceMatching("AppleSEPManager", 0);
  if (!v0)
  {
    IOLog("[AppleLockdownMode - %s] SEP check failed\n");
    return 0;
  }
  v1 = v0;
  v2 = IOService::waitForMatchingService(v0, 0xFFFFFFFFFFFFFFFFLL);
  if (!v2)
  {
    IOLog("[AppleLockdownMode - %s] SEP check failed\n", "LDMShouldEnforceParity");
    ((void (*)(OSDictionary *))v1->release_0)(v1);
    return 0;
  }
  v3 = v2;
  v4 = IOService::nameMatching("sep-endpoint,scrd", 0);
  if (v4)
  {
    v5 = v4;
    v6 = IOService::waitForMatchingService(v4, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v7 = v6 == 0;
    if (v6)
    {
      v8 = v6;
      IOLog("[AppleLockdownMode - %s] SEP check passed\n", "LDMShouldEnforceParity");
      ((void (*)(IOService *))v8->release_0)(v8);
    }
    else
    {
      IOLog("[AppleLockdownMode - %s] SEP check failed\n", "LDMShouldEnforceParity");
    }
    ((void (*)(OSDictionary *))v5->release_0)(v5);
  }
  else
  {
    IOLog("[AppleLockdownMode - %s] SEP check failed\n", "LDMShouldEnforceParity");
    BOOL v7 = 1;
  }
  ((void (*)(IOService *))v3->release_0)(v3);
  ((void (*)(OSDictionary *))v1->release_0)(v1);
  if (v7) {
    return 0;
  }
  v9 = IOService::serviceMatching("IODTNVRAM", 0);
  if (!v9)
  {
    IOLog("[AppleLockdownMode - %s] MobileObliteration check failed\n");
    return 0;
  }
  v10 = v9;
  v11 = IOService::waitForMatchingService(v9, 0xFFFFFFFFFFFFFFFFLL);
  v12 = v11;
  if (!v11)
  {
    IOLog("[AppleLockdownMode - %s] MobileObliteration check failed\n", "LDMShouldEnforceParity");
LABEL_35:
    (*(void (**)(void *))(*(void *)v10 + 40))(v10);
    return v12;
  }
  v13 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))v11->copyProperty_4)(v11, "oblit-inprogress");
  v14 = (const OSMetaClass *)OSData::metaClass;
  v15 = OSMetaClassBase::safeMetaCast(v13, OSData::metaClass);
  if (v15)
  {
    IOLog("[AppleLockdownMode - %s] MobileObliteration check failed\n", "LDMShouldEnforceParity");
    ((void (*)(OSMetaClassBase *))v15->release_0)(v15);
  }
  else
  {
    if (v13) {
      ((void (*)(const OSMetaClassBase *))v13->release_0)(v13);
    }
    IOLog("[AppleLockdownMode - %s] MobileObliteration check passed\n", "LDMShouldEnforceParity");
  }
  ((void (*)(const OSMetaClassBase *))v12->release_0)(v12);
  (*(void (**)(void *))(*(void *)v10 + 40))(v10);
  if (v15) {
    return 0;
  }
  if (!PlatformSupportsXART())
  {
    v10 = 0;
    v19 = 0;
LABEL_26:
    v12 = (const OSMetaClassBase *)(&dword_0 + 1);
    IOLog("[AppleLockdownMode - %s] ProtectedData check passed\n");
    goto LABEL_32;
  }
  v17 = IORegistryEntry::fromPath("/chosen", gIODTPlane, 0, 0, 0);
  v10 = v17;
  if (!v17) {
    goto LABEL_29;
  }
  v12 = (const OSMetaClassBase *)((uint64_t (*)(IORegistryEntry *, const char *))v17->copyProperty_4)(v17, "protected-data-access");
  v18 = OSMetaClassBase::safeMetaCast(v12, v14);
  if (!v18)
  {
    if (!v12)
    {
LABEL_30:
      v19 = 0;
      goto LABEL_31;
    }
    ((void (*)(const OSMetaClassBase *))v12->release_0)(v12);
LABEL_29:
    v12 = 0;
    goto LABEL_30;
  }
  v19 = v18;
  if (((unsigned int (*)(OSMetaClassBase *))v18->__vftable[1].getMetaClass)(v18) == 4
    && *(_DWORD *)((uint64_t (*)(OSMetaClassBase *))v19->__vftable[2].~OSMetaClassBase_0)(v19))
  {
    goto LABEL_26;
  }
  v12 = 0;
LABEL_31:
  IOLog("[AppleLockdownMode - %s] ProtectedData check failed\n");
LABEL_32:
  if (v19) {
    ((void (*)(OSMetaClassBase *))v19->release_0)(v19);
  }
  if (v10) {
    goto LABEL_35;
  }
  return v12;
}

void LDMCheckParity(void *a1)
{
  if (LDMShouldEnforceParity())
  {
    IOLog("[AppleLockdownMode - %s] enforcing parity check\n", "LDMCheckParity");
    unsigned __int8 v3 = 0;
    uint64_t v2 = 1;
    if (ACMKernGetEnvironmentVariable(41, (uint64_t)&v3, (uint64_t)&v2))
    {
      IOLog("[AppleLockdownMode - %s] could not get environment variable from ACM: %d\n");
    }
    else
    {
      int lockdown_mode_state = get_lockdown_mode_state();
      IOLog("[AppleLockdownMode - %s] state in ACM: %d, in nvram: %d\n", "LDMCheckParity", v3, lockdown_mode_state != 0);
      if (lockdown_mode_state || !v3)
      {
        if (lockdown_mode_state)
        {
          if (!v3)
          {
            IOLog("[AppleLockdownMode - %s] setting state to off in nvram because state in ACM is also off (not rebooting)\n", "LDMCheckParity");
            disable_lockdown_mode();
          }
        }
      }
      else
      {
        IOLog("[AppleLockdownMode - %s] setting state to on in nvram because state in ACM is also on (not rebooting)\n", "LDMCheckParity");
        enable_lockdown_mode();
      }
    }
  }
  else
  {
    IOLog("[AppleLockdownMode - %s] skipping parity check\n");
  }
}

BOOL AppleLockdownMode::start(AppleLockdownMode *this, IOService *a2)
{
  kern_return_t v3;
  BOOL v4;
  thread_t new_thread;

  {
    IOLog("[AppleLockdownMode - %s] started\n", "start");
    new_thread = 0;
    unsigned __int8 v3 = kernel_thread_start((thread_continue_t)LDMCheckParity, this, &new_thread);
    v4 = v3 == 0;
    if (v3) {
      IOLog("[AppleLockdownMode - %s] unable to start LDMCheckParity thread: %d\n", "start", v3);
    }
    else {
      thread_deallocate(new_thread);
    }
  }
  else
  {
    IOLog("[AppleLockdownMode - %s] failed to start IOService\n", "start");
    return 0;
  }
  return v4;
}

uint64_t AppleLockdownMode::stop(AppleLockdownMode *this, IOService *a2)
{
}

OSMetaClass *_GLOBAL__sub_I_AppleLockdownMode_cpp()
{
  result = OSMetaClass::OSMetaClass(&AppleLockdownMode::gMetaClass, "AppleLockdownMode", &IOService::gMetaClass, 0x88u);
  result->__vftable = (OSMetaClass_vtbl *)off_206C8;
  return result;
}

void global destructor keyed to'_a()
{
}

uint64_t ACMKernelTransport(unsigned char *a1, char a2, uint64_t a3, const void *a4, size_t a5, void *a6, IOByteCount *a7)
{
  IOByteCount v33 = 0;
  if (a7)
  {
    if ((a6 != 0) != (*a7 != 0))
    {
LABEL_3:
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "( ((outSize != nullptr && *outSize > 0) && outBuffer != nullptr) || ((outSize == nullptr || *outSize == 0) && outBuffer == nullptr))", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 125);
      uint64_t v13 = 4294967293;
LABEL_37:
      IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelTransport", "ACMKernelTransport", (int)v13);
      return v13;
    }
  }
  else if (a6)
  {
    goto LABEL_3;
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transportContext", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 126);
    uint64_t v13 = 4294967291;
    goto LABEL_37;
  }
  if (ACMKernelTransport::_acmService) {
    goto LABEL_14;
  }
  v14 = IOService::serviceMatching("AppleCredentialManager", 0);
  if (!v14)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "serviceMatchingDict", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 100);
    uint64_t v13 = 4294967291;
LABEL_11:
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelTransport", "initAppleCredentialService", (int)v13);
    goto LABEL_12;
  }
  v15 = v14;
  v16 = IOService::waitForMatchingService(v14, 0xFFFFFFFFFFFFFFFFLL);
  v17 = v16;
  if (v16)
  {
    uint64_t v13 = 0;
    ACMKernelTransport::_acmService = (uint64_t)v16;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "service", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 103);
    uint64_t v13 = 4294967291;
  }
  ((void (*)(OSDictionary *))v15->release_0)(v15);
  if (!v17) {
    goto LABEL_11;
  }
LABEL_12:
  if (v13)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v13, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 130);
    goto LABEL_37;
  }
  if (!ACMKernelTransport::_acmService)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "_acmService", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 131);
    goto LABEL_50;
  }
LABEL_14:
  v18 = LibCall_BuildCommand(a2, 0, 0, a4, a5, &v33);
  if (!v18)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "command", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 135);
LABEL_50:
    uint64_t v13 = 4294967291;
    goto LABEL_37;
  }
  v19 = v18;
  uint64_t v20 = ACMKernelTransport::_acmService;
  if (a7) {
    unsigned int v21 = *(_DWORD *)a7;
  }
  else {
    unsigned int v21 = 0;
  }
  IOByteCount v22 = v33;
  unsigned int v37 = v21;
  if (!ACMKernelTransport::_acmService)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n");
LABEL_43:
    uint64_t v30 = 4294967293;
LABEL_35:
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelTransport", "performCommand", (int)v30);
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v30, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 138);
    goto LABEL_36;
  }
  if (v33 <= 7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inSize >= sizeof(acm_command_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 30);
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelTransport", "validateCommand", -3);
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n");
    goto LABEL_43;
  }
  char v23 = v18[4];
  v24 = OSSymbol::withCString("performCommandV2");
  if (!v24)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "performCommandFunc", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 60);
    uint64_t v30 = 4294967291;
    goto LABEL_35;
  }
  v25 = v24;
  v26 = IOMemoryDescriptor::withAddress(v19, v22, 2u);
  if (v21) {
    v27 = IOMemoryDescriptor::withAddress(a6, *a7, 1u);
  }
  else {
    v27 = 0;
  }
  if (*a1) {
    int v28 = -2;
  }
  else {
    int v28 = -1;
  }
  int v34 = v28;
  uint64_t v35 = 0;
  char v36 = v23;
  uint64_t v29 = (*(uint64_t (**)(uint64_t, const OSSymbol *, uint64_t, IOMemoryDescriptor *, IOMemoryDescriptor *, unsigned int *, int *))(*(void *)v20 + 936))(v20, v25, 1, v26, v27, &v37, &v34);
  uint64_t v30 = v29;
  if (v29)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v29, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 75);
  }
  else if (a7)
  {
    *a7 = v37;
  }
  ((void (*)(const OSSymbol *))v25->release_0)(v25);
  if (v26) {
    ((void (*)(IOMemoryDescriptor *))v26->release_0)(v26);
  }
  if (v27) {
    ((void (*)(IOMemoryDescriptor *))v27->release_0)(v27);
  }
  if (v30) {
    goto LABEL_35;
  }
LABEL_36:
  unint64_t v31 = v33;
  acm_mem_free_info("<data>", v19, v33, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelTransport.cpp", 142, "ACMKernelTransport");
  acm_mem_free_data((uint64_t)v19, v31);
  uint64_t v13 = v30;
  if (v30) {
    goto LABEL_37;
  }
  return v13;
}

unsigned char *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  }
  if (!a4 && a5)
  {
    int v15 = 19;
    v14 = "!dataSize || data";
LABEL_15:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", v14, 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v15);
LABEL_17:
    v12 = 0;
    goto LABEL_10;
  }
  if (!a6)
  {
    int v15 = 20;
    v14 = "commandSize";
    goto LABEL_15;
  }
  if (a5 >= 0xFFFFFFFFFFFFFFF8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "__os_warn_unused(__builtin_add_overflow((sizeof(acm_command_t)), (dataSize), (&cmdSize))) == 0 ", 1, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 21);
    goto LABEL_17;
  }
  v12 = (unsigned char *)acm_mem_alloc_data(a5 + 8);
  acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
  if (v12)
  {
    *a6 = a5 + 8;
    *(_DWORD *)v12 = 1396920900;
    v12[4] = a1;
    v12[5] = a2;
    v12[6] = a3;
    if (a5) {
      memmove(v12 + 8, a4, a5);
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "cmd = (acm_command_t *)({ size_t sizeVal = (cmdSize); void *ptr = acm_mem_alloc_data(sizeVal); acm_mem_alloc_info("
      "\"<data>\", ptr, sizeVal, \"/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall"
      ".c\", 22, __func__); ptr; })",
      0,
      "---",
      "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c",
      22);
  }
LABEL_10:
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  }
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *), uint64_t a2, void *a3, unsigned char *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 47);
LABEL_12:
    unsigned int v12 = 70;
    uint64_t v13 = 4294967293;
    goto LABEL_21;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 48);
    goto LABEL_12;
  }
  v10 = (_DWORD *)IOMallocTypeImpl();
  acm_mem_alloc_info("ACMHandleWithPayload", v10, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handleWithPayload", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 51);
    unsigned int v12 = 70;
    uint64_t v13 = 4294967292;
    goto LABEL_21;
  }
  memset(v18, 0, sizeof(v18));
  if (a5)
  {
    uint64_t v17 = 21;
    uint64_t v11 = a1(a2, 36, 0, 0, 0, v18, &v17);
    if (!v11)
    {
      if (v17 != 21)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseSize == sizeof(response)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 60);
LABEL_26:
        uint64_t v13 = 4294967291;
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    uint64_t v13 = v11;
    if (v11 != -3)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 59);
      goto LABEL_28;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err != kACMErrorBadParameter", 0, "fallback", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 58);
  }
  uint64_t v17 = 17;
  uint64_t v14 = a1(a2, 1, 0, 0, 0, v18, &v17);
  if (v14)
  {
    uint64_t v13 = v14;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v14, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 69);
LABEL_28:
    acm_mem_free_info("ACMHandleWithPayload", v10, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
    IOFreeTypeImpl();
    unsigned int v12 = 70;
    goto LABEL_21;
  }
  if (v17 != 17)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseSize == sizeof(response.body)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 70);
    goto LABEL_26;
  }
LABEL_18:
  int v15 = *(_DWORD *)&v18[17];
  *(_OWORD *)v10 = *(_OWORD *)v18;
  v10[4] = v15;
  *a3 = v10;
  uint64_t v13 = 0;
  if (a4) {
    *a4 = v18[16];
  }
  unsigned int v12 = 10;
LABEL_21:
  if (v12 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextCreateWithExternalForm(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, unsigned char *a5, int a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 102);
LABEL_14:
    unsigned int v13 = 70;
    int v14 = -3;
    goto LABEL_24;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "externalForm", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 103);
LABEL_13:
    a1 = 0;
    goto LABEL_14;
  }
  if (a4 != 16)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 104);
    goto LABEL_13;
  }
  memset(v19, 0, 9);
  if (a6)
  {
    uint64_t v18 = 9;
    int v12 = ((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *))a1)(a2, 37, 0, a3, 16, v19, &v18);
    if (!v12)
    {
      if (v18 != 9)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseSize == sizeof(response)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 113);
LABEL_32:
        int v14 = -5;
        goto LABEL_33;
      }
      goto LABEL_19;
    }
    int v14 = v12;
    if (v12 != -3)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v12, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 112);
      goto LABEL_33;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err != kACMErrorBadParameter", 0, "fallback", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 111);
  }
  uint64_t v18 = 5;
  int v15 = ((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *))a1)(a2, 18, 0, a3, 16, v19, &v18);
  if (!v15)
  {
    if (v18 != 5)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseSize == sizeof(response.body)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 123);
      goto LABEL_32;
    }
LABEL_19:
    if (LODWORD(v19[0]))
    {
      a1 = IOMallocTypeImpl();
      acm_mem_alloc_info("ACMHandleWithPayload", (const void *)a1, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
      if (!a1)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handleWithPayload", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 129);
        unsigned int v13 = 70;
        int v14 = -4;
        goto LABEL_24;
      }
      int v16 = *(_DWORD *)((char *)v19 + 5);
      *(_OWORD *)a1 = *a3;
      *(_DWORD *)(a1 + 16) = v16;
      int v14 = 0;
      if (a5) {
        *a5 = BYTE4(v19[0]);
      }
    }
    else
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "response.body.found", 0, "context not found", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 126);
      int v14 = 0;
      a1 = 0;
    }
    unsigned int v13 = 10;
    goto LABEL_24;
  }
  int v14 = v15;
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v15, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 122);
LABEL_33:
  a1 = 0;
  unsigned int v13 = 70;
LABEL_24:
  if (v13 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  }
  return a1;
}

uint64_t LibCall_ACMContextDelete(uint64_t (*a1)(uint64_t, uint64_t, void, const void *, uint64_t, void, void), uint64_t a2, const void *a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  }
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        int v8 = a1(a2, 2, 0, a3, 16, 0, 0);
        if (v8) {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v8, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 163);
        }
      }
      goto LABEL_8;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 159);
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 158);
    if (a3)
    {
LABEL_8:
      acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
      IOFreeTypeImpl();
      uint64_t v9 = 0;
      unsigned int v10 = 10;
      goto LABEL_9;
    }
  }
  unsigned int v10 = 70;
  uint64_t v9 = 4294967293;
LABEL_9:
  if (v10 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, void, const void *, unint64_t, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  }
  unint64_t v20 = 0;
  if (!a3 && a5 != 2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context || scope == kACMScopeGlobal", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 186);
LABEL_18:
    unsigned int v16 = 70;
    uint64_t v13 = 4294967293;
    goto LABEL_13;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 187);
    goto LABEL_18;
  }
  uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &v20);
  if (SerializedAddCredentialSize)
  {
    uint64_t v18 = SerializedAddCredentialSize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedAddCredentialSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 190);
    unsigned int v16 = 70;
    uint64_t v13 = v18;
    goto LABEL_13;
  }
  uint64_t v11 = v20;
  int v12 = (const void *)acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
  if (!v12)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inputBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 193);
    unsigned int v16 = 70;
    uint64_t v13 = 4294967292;
    goto LABEL_13;
  }
  uint64_t v13 = SerializeAddCredential(a3, a4, a5, (uint64_t)v12, &v20);
  if (v13)
  {
    int v19 = 196;
  }
  else
  {
    uint64_t v14 = a1(a2, 5, 0, v12, v20, 0, 0);
    if (!v14) {
      goto LABEL_10;
    }
    int v19 = 199;
    uint64_t v13 = v14;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v13, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v19);
LABEL_10:
  unint64_t v15 = v20;
  acm_mem_free_info("<data>", v12, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
  acm_mem_free_data((uint64_t)v12, v15);
  if (v13) {
    unsigned int v16 = 70;
  }
  else {
    unsigned int v16 = 10;
  }
LABEL_13:
  if (v16 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void, void), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  }
  if (a3 || a5 == 2)
  {
    unsigned int v10 = (_OWORD *)acm_mem_alloc_data(24);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        _OWORD *v10 = *a3;
      }
      else
      {
        *(void *)unsigned int v10 = 0;
        *((void *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      uint64_t v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      uint64_t v12 = v11;
      if (v11)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 229);
        unsigned int v13 = 70;
      }
      else
      {
        unsigned int v13 = 10;
      }
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data((uint64_t)v10, 0x18uLL);
    }
    else
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inputBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 218);
      unsigned int v13 = 70;
      uint64_t v12 = 4294967292;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context || scope == kACMScopeGlobal", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 215);
    unsigned int v13 = 70;
    uint64_t v12 = 4294967293;
  }
  if (v13 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, const void *, unint64_t, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  }
  unint64_t v20 = 0;
  if (!a3 && a5 != 2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context || scope == kACMScopeGlobal", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 245);
LABEL_18:
    unsigned int v16 = 70;
    uint64_t v13 = 4294967293;
    goto LABEL_13;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 246);
    goto LABEL_18;
  }
  uint64_t v10 = GetSerializedRemoveCredentialSize((uint64_t)a3, a4, a5, &v20);
  if (v10)
  {
    uint64_t v18 = v10;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 249);
    unsigned int v16 = 70;
    uint64_t v13 = v18;
    goto LABEL_13;
  }
  uint64_t v11 = v20;
  uint64_t v12 = (const void *)acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  if (!v12)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inputBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 252);
    unsigned int v16 = 70;
    uint64_t v13 = 4294967292;
    goto LABEL_13;
  }
  uint64_t v13 = SerializeRemoveCredential(a3, a4, a5, (uint64_t)v12, &v20);
  if (v13)
  {
    int v19 = 255;
  }
  else
  {
    uint64_t v14 = a1(a2, 6, 0, v12, v20, 0, 0);
    if (!v14) {
      goto LABEL_10;
    }
    int v19 = 258;
    uint64_t v13 = v14;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v13, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v19);
LABEL_10:
  unint64_t v15 = v20;
  acm_mem_free_info("<data>", v12, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  acm_mem_free_data((uint64_t)v12, v15);
  if (v13) {
    unsigned int v16 = 70;
  }
  else {
    unsigned int v16 = 10;
  }
LABEL_13:
  if (v16 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, void *a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  }
  size_t v38 = 0;
  size_t v39 = 0;
  char v36 = 0;
  unint64_t v37 = 4096;
  size_t v35 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 283);
LABEL_42:
    unsigned int v29 = 70;
    uint64_t v27 = 4294967293;
    goto LABEL_26;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 284);
    goto LABEL_42;
  }
  if (!__s1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policyId", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 285);
    goto LABEL_42;
  }
  if (!a9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policySatisfied", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 286);
    goto LABEL_42;
  }
  if ((!a6 || !a7) && (a6 || a7))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "( (parametersCount > 0 && parameters != ((void*)0)) || ((parametersCount == 0) && parameters == ((void*)0)))", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 287);
    goto LABEL_42;
  }
  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &v39);
  if (SerializedVerifyPolicySize)
  {
    uint64_t v27 = SerializedVerifyPolicySize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedVerifyPolicySize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 291);
    unsigned int v29 = 70;
    goto LABEL_26;
  }
  uint64_t v19 = a2;
  uint64_t v20 = v39;
  unsigned int v21 = (_OWORD *)acm_mem_alloc_data(v39);
  acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  if (!v21)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inputBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 294);
    unsigned int v29 = 70;
    uint64_t v27 = 4294967292;
    goto LABEL_26;
  }
  size_t v38 = v39;
  uint64_t v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &v38);
  if (v22)
  {
    uint64_t v31 = v22;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v22, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 298);
    char v23 = 0;
    uint64_t v27 = v31;
    goto LABEL_21;
  }
  char v23 = (unsigned int *)acm_mem_alloc_data(4096);
  acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  if (!v23)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "reqBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 301);
    uint64_t v27 = 4294967292;
    goto LABEL_21;
  }
  uint64_t v24 = a1(v19, 3, 0, v21, v38, v23, &v37);
  if (v24)
  {
    uint64_t v32 = v24;
    uint64_t v33 = (int)v24;
    int v34 = 304;
LABEL_40:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v33, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v34);
    uint64_t v27 = v32;
    goto LABEL_21;
  }
  unint64_t v25 = v37;
  if (v37 <= 3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "reqBufferSize >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 305);
    uint64_t v27 = 4294967291;
    goto LABEL_21;
  }
  *a9 = *v23 != 0;
  if (!a10)
  {
    uint64_t v27 = 0;
    goto LABEL_21;
  }
  uint64_t v26 = DeserializeRequirement(v23 + 1, v25 - 4, &v36, &v35);
  if (v26)
  {
    uint64_t v32 = v26;
    uint64_t v33 = (int)v26;
    int v34 = 314;
    goto LABEL_40;
  }
  uint64_t v27 = 0;
  *a10 = v36;
LABEL_21:
  unint64_t v28 = v39;
  acm_mem_free_info("<data>", v21, v39, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  acm_mem_free_data((uint64_t)v21, v28);
  if (v23)
  {
    acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
    acm_mem_free_data((uint64_t)v23, 0x1000uLL);
  }
  if (v27) {
    unsigned int v29 = 70;
  }
  else {
    unsigned int v29 = 10;
  }
LABEL_26:
  if (v29 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v27);
  }
  return v27;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 338);
LABEL_12:
    unsigned int v6 = 70;
    uint64_t v5 = 4294967293;
    goto LABEL_7;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 339);
    goto LABEL_12;
  }
  uint64_t v4 = Util_DeallocRequirement(a2);
  uint64_t v5 = v4;
  if (v4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v4, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 342);
    unsigned int v6 = 70;
  }
  else
  {
    unsigned int v6 = 10;
  }
LABEL_7:
  if (v6 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 353);
LABEL_19:
    unsigned int v17 = 70;
    uint64_t v16 = 4294967293;
    goto LABEL_14;
  }
  if (a4) {
    BOOL v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  }
  else {
    BOOL v14 = a5 != 0;
  }
  if (v14)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(data && dataLength && dataLength <= 4096) || (!data && !dataLength)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 354);
    goto LABEL_19;
  }
  __chkstk_darwin();
  unint64_t v15 = (_DWORD *)((char *)&v19 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
  bzero(v15, a5 + 4);
  _DWORD *v15 = a3;
  if (a5)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFFCLL) {
      LibCall_ACMKernelControl_cold_1();
    }
    memcpy(v15 + 1, a4, a5);
  }
  uint64_t v16 = a1(a2, 26, 0, (char *)&v19 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
  if (v16) {
    unsigned int v17 = 70;
  }
  else {
    unsigned int v17 = 10;
  }
LABEL_14:
  if (v17 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v16);
  }
  return v16;
}

void LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1)
  {
    Util_DeallocCredential(a1);
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 385);
  }
}

uint64_t LibCall_ACMCredentialCreate(int a1, void *a2)
{
  return Util_AllocCredential(a1, a2);
}

uint64_t LibCall_ACMCredentialGetType(unsigned int *a1)
{
  if (a1) {
    return *a1;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 399);
  return 0;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, long long *__src, size_t __len)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 410);
    return 4294967293;
  }
  int v4 = __len;
  if ((__src != 0) != (__len != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(data && dataLength) || (!data && !dataLength)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 411);
    return 4294967293;
  }
  if (a2 <= 399)
  {
    if (a2 > 199)
    {
      switch(a2)
      {
        case 300:
          __asm { BTI             j; jumptable 000000000000AE24 case 300 }
          if (*a1 != 3)
          {
            int v29 = 501;
            goto LABEL_169;
          }
          if (__len == 16) {
            goto LABEL_16;
          }
          int v10 = 502;
          goto LABEL_160;
        case 301:
          __asm { BTI             j; jumptable 000000000000AE24 case 301 }
          if (*a1 != 3)
          {
            int v29 = 513;
            goto LABEL_169;
          }
          if (__len == 32)
          {
            uint64_t result = 0;
            long long v19 = *__src;
            *(_OWORD *)(a1 + 21) = __src[1];
            goto LABEL_89;
          }
          int v15 = 514;
          goto LABEL_157;
        case 302:
          __asm { BTI             j; jumptable 000000000000AE24 case 302 }
          if (*a1 != 3)
          {
            int v29 = 507;
            goto LABEL_169;
          }
          if (__len == 16) {
            goto LABEL_92;
          }
          int v10 = 508;
          goto LABEL_160;
        case 303:
          __asm { BTI             j; jumptable 000000000000AE24 case 303 }
          if (*a1 != 3)
          {
            int v29 = 519;
            goto LABEL_169;
          }
          if (__len == 65)
          {
            unsigned int v17 = a1 + 30;
            goto LABEL_96;
          }
          int v28 = 523;
          goto LABEL_163;
        case 304:
          __asm { BTI             j; jumptable 000000000000AE24 case 304 }
          if (*a1 != 3)
          {
            int v29 = 529;
            goto LABEL_169;
          }
          if (__len == 16)
          {
            uint64_t result = 0;
            *(_OWORD *)((char *)a1 + 185) = *__src;
            return result;
          }
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(credData->identityUuid)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 533);
          return 4294967293;
        case 305:
          __asm { BTI             j; jumptable 000000000000AE24 case 305 }
          if (*a1 != 3)
          {
            int v29 = 539;
            goto LABEL_169;
          }
          if (__len == 4)
          {
            uint64_t result = 0;
            *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
            return result;
          }
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(credData->originator)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 543);
          return 4294967293;
        case 306:
          __asm { BTI             j; jumptable 000000000000AE24 case 306 }
          if (*a1 == 3)
          {
            if (__len <= 0x80)
            {
              memmove((char *)a1 + 209, __src, __len);
              uint64_t result = 0;
              *(int *)((char *)a1 + 205) = v4;
              return result;
            }
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength <= sizeof(credData->unlockSecret)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 640);
          }
          else
          {
            int v29 = 637;
LABEL_169:
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeBiometryMatched", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v29);
          }
          return 4294967293;
        default:
          if (a2 != 200)
          {
            if (a2 != 201) {
              goto LABEL_60;
            }
            if (*a1 == 2)
            {
              if (__len == 4) {
                goto LABEL_59;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMPassphrasePurpose)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 488);
              return 4294967293;
            }
            int v30 = 487;
LABEL_172:
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypePassphraseEntered", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v30);
            return 4294967293;
          }
          if (*a1 != 2)
          {
            int v30 = 480;
            goto LABEL_172;
          }
          if (__len < 0x81)
          {
            a1[9] = __len;
            unsigned int v17 = a1 + 10;
            goto LABEL_109;
          }
          int v27 = 481;
          break;
      }
      goto LABEL_174;
    }
    if (a2 <= 100)
    {
      if (a2 == 5)
      {
        if (__len == 4)
        {
          uint64_t result = 0;
          a1[3] = *(_DWORD *)__src;
          return result;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(uid_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 549);
        return 4294967293;
      }
      if (a2 == 100)
      {
        if (__len != 16)
        {
          int v10 = 415;
LABEL_160:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == 16", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v10);
          return 4294967293;
        }
        int v12 = *a1;
        if (*a1 > 8)
        {
          if (v12 == 9)
          {
            uint64_t v13 = (long long *)(a1 + 10);
            a1[9] = 16;
            goto LABEL_121;
          }
          if (v12 == 18)
          {
            uint64_t v13 = (long long *)(a1 + 9);
            goto LABEL_121;
          }
        }
        else
        {
          if (v12 == 1)
          {
            uint64_t v13 = (long long *)(a1 + 11);
            a1[10] = 16;
            goto LABEL_121;
          }
          if (v12 == 3)
          {
            uint64_t v13 = (long long *)(a1 + 26);
            a1[25] = 16;
LABEL_121:
            uint64_t result = 0;
            long long *v13 = *__src;
            return result;
          }
        }
        int v14 = 435;
        goto LABEL_123;
      }
      goto LABEL_60;
    }
    if (a2 == 101)
    {
      if (__len != 4)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 443);
        return 4294967293;
      }
      switch(*a1)
      {
        case 1:
        case 3:
        case 9:
        case 10:
          goto LABEL_59;
        case 2:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          break;
        default:
          if (*a1 == 18) {
            goto LABEL_59;
          }
          break;
      }
      __asm { BTI             j; jumptable 000000000000B084 cases 2,4-8 }
      int v14 = 462;
      goto LABEL_123;
    }
    if (a2 == 102)
    {
      if (__len != 4)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(int32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 468);
        return 4294967293;
      }
      if (*a1 != 1)
      {
        int v14 = 474;
LABEL_123:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v14);
        return 4294967293;
      }
LABEL_70:
      uint64_t result = 0;
      a1[9] = *(_DWORD *)__src;
      return result;
    }
LABEL_60:
    int v14 = 647;
    goto LABEL_123;
  }
  if (a2 > 601)
  {
    if (a2 > 801)
    {
      if (a2 != 802)
      {
        if (a2 != 901)
        {
          if (a2 == 1001)
          {
            if (*a1 == 21)
            {
              if (__len <= 0x80)
              {
                memmove(a1 + 9, __src, __len);
                uint64_t result = 0;
                a1[8] = v4;
                return result;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength <= sizeof(credData->signature)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 630);
            }
            else
            {
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeSignature", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 627);
            }
            return 4294967293;
          }
          goto LABEL_60;
        }
        if (*a1 != 20)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeAP", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 618);
          return 4294967293;
        }
        if (__len != 32)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(credData->confirmationHash)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 621);
          return 4294967293;
        }
        goto LABEL_85;
      }
      if (*a1 != 17)
      {
        int v25 = 608;
        goto LABEL_149;
      }
      if (__len != 65)
      {
        int v28 = 612;
LABEL_163:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(credData->accPubKey)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v28);
        return 4294967293;
      }
      unsigned int v17 = a1 + 12;
LABEL_96:
      unsigned int v21 = __src;
      size_t v22 = 65;
    }
    else
    {
      if (a2 == 602)
      {
        if (*a1 == 12 || *a1 == 15)
        {
          if (__len != 4)
          {
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMKextDenyListRevision)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 593);
            return 4294967293;
          }
          goto LABEL_70;
        }
        int v23 = 592;
        goto LABEL_118;
      }
      if (a2 != 701)
      {
        if (a2 != 801) {
          goto LABEL_60;
        }
        if (*a1 == 17)
        {
          if (__len == 16)
          {
            uint64_t result = 0;
            *((_OWORD *)a1 + 2) = *__src;
            return result;
          }
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(credData->accUUID)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 602);
          return 4294967293;
        }
        int v25 = 598;
LABEL_149:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeSecureIntent", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v25);
        return 4294967293;
      }
      if (*a1 != 13)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypePassphraseExtractable", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 493);
        return 4294967293;
      }
      if (__len >= 0x81)
      {
        int v27 = 494;
LABEL_174:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength <= 128", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v27);
        return 4294967293;
      }
      a1[8] = __len;
      unsigned int v17 = a1 + 9;
LABEL_109:
      unsigned int v21 = __src;
      size_t v22 = __len;
    }
    memmove(v17, v21, v22);
    return 0;
  }
  if (a2 <= 501)
  {
    if (a2 != 400)
    {
      if (a2 != 401)
      {
        if (a2 != 501) {
          goto LABEL_60;
        }
        if (*a1 == 10)
        {
          if (__len == 16)
          {
LABEL_16:
            uint64_t result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
            return result;
          }
          int v18 = 567;
          goto LABEL_147;
        }
        int v24 = 566;
LABEL_145:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypePasscodeValidated2", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v24);
        return 4294967293;
      }
      if (*a1 == 7)
      {
        if (__len == 24)
        {
          uint64_t result = 0;
          long long v16 = *__src;
          *((void *)a1 + 10) = *((void *)__src + 2);
          *((_OWORD *)a1 + 4) = v16;
          return result;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == 24", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 561);
        return 4294967293;
      }
      int v26 = 560;
LABEL_139:
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeUserOutputDisplayed", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v26);
      return 4294967293;
    }
    if (*a1 != 7)
    {
      int v26 = 554;
      goto LABEL_139;
    }
    if (__len != 32)
    {
      int v15 = 555;
LABEL_157:
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == 32", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v15);
      return 4294967293;
    }
LABEL_85:
    uint64_t result = 0;
    long long v20 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v20;
    return result;
  }
  if (a2 == 502)
  {
    if (*a1 == 10)
    {
      if (__len == 16)
      {
LABEL_92:
        uint64_t result = 0;
        *(_OWORD *)(a1 + 13) = *__src;
        return result;
      }
      int v18 = 573;
      goto LABEL_147;
    }
    int v24 = 572;
    goto LABEL_145;
  }
  if (a2 != 503)
  {
    if (a2 != 601) {
      goto LABEL_60;
    }
    if (*a1 == 12 || *a1 == 15)
    {
      if (__len == 4)
      {
LABEL_59:
        __asm { BTI             j; jumptable 000000000000B084 cases 1,3,9,10 }
        uint64_t result = 0;
        a1[8] = *(_DWORD *)__src;
        return result;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMKextDenyListFormat)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 586);
      return 4294967293;
    }
    int v23 = 585;
LABEL_118:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeKextDenyListApplePay || credential->type == kACMCredentialTypeKextDenyListFairPlay", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v23);
    return 4294967293;
  }
  if (*a1 != 10)
  {
    int v24 = 578;
    goto LABEL_145;
  }
  if (__len != 16)
  {
    int v18 = 579;
LABEL_147:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(uuid_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v18);
    return 4294967293;
  }
  uint64_t result = 0;
  long long v19 = *__src;
LABEL_89:
  *(_OWORD *)(a1 + 17) = v19;
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 660);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "data", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 661);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "length", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 662);
    return 4294967293;
  }
  if (a2 <= 399)
  {
    if (a2 > 199)
    {
      switch(a2)
      {
        case 300:
          __asm { BTI             j; jumptable 000000000000B87C case 300 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            uint64_t v11 = a1 + 9;
            goto LABEL_54;
          }
          int v30 = 771;
          goto LABEL_132;
        case 301:
          __asm { BTI             j; jumptable 000000000000B87C case 301 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            size_t v22 = a1 + 17;
            goto LABEL_63;
          }
          int v30 = 783;
          goto LABEL_132;
        case 302:
          __asm { BTI             j; jumptable 000000000000B87C case 302 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            uint64_t v11 = a1 + 13;
            goto LABEL_54;
          }
          int v30 = 777;
          goto LABEL_132;
        case 303:
          __asm { BTI             j; jumptable 000000000000B87C case 303 }
          if (*a1 == 3)
          {
            int v14 = a1 + 30;
            goto LABEL_94;
          }
          int v30 = 789;
          goto LABEL_132;
        case 304:
          __asm { BTI             j; jumptable 000000000000B87C case 304 }
          if (*a1 != 3)
          {
            int v30 = 803;
            goto LABEL_132;
          }
          uint64_t result = 0;
          uint64_t v11 = (int *)((char *)a1 + 185);
LABEL_54:
          *a3 = v11;
          goto LABEL_81;
        case 305:
          __asm { BTI             j; jumptable 000000000000B87C case 305 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            int v23 = (int *)((char *)a1 + 201);
            goto LABEL_89;
          }
          int v30 = 809;
          goto LABEL_132;
        case 306:
          __asm { BTI             j; jumptable 000000000000B87C case 306 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            uint64_t v13 = *(unsigned int *)((char *)a1 + 205);
            int v24 = (int *)((char *)a1 + 209);
            if (!*(int *)((char *)a1 + 205)) {
              int v24 = 0;
            }
            *a3 = v24;
            goto LABEL_91;
          }
          int v30 = 928;
LABEL_132:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeBiometryMatched", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v30);
          return 4294967293;
        default:
          if (a2 == 200)
          {
            if (*a1 == 2)
            {
              uint64_t result = 0;
              *a3 = a1 + 10;
              uint64_t v13 = a1[9];
              goto LABEL_91;
            }
            int v21 = 753;
            goto LABEL_144;
          }
          if (a2 != 201) {
            goto LABEL_106;
          }
          if (*a1 != 2)
          {
            int v21 = 759;
LABEL_144:
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypePassphraseEntered", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v21);
            return 4294967293;
          }
          break;
      }
      goto LABEL_88;
    }
    if (a2 <= 99)
    {
      switch(a2)
      {
        case 1:
          __asm { BTI             j; jumptable 000000000000B908 case 1 }
          uint64_t result = 0;
          *a3 = a1 + 4;
          uint64_t v13 = 8;
          goto LABEL_91;
        case 2:
          __asm { BTI             j; jumptable 000000000000B908 case 2 }
          uint64_t result = 0;
          int v23 = a1 + 6;
          goto LABEL_89;
        case 3:
          __asm { BTI             j; jumptable 000000000000B908 case 3 }
          uint64_t result = 0;
          *a3 = a1;
          goto LABEL_90;
        case 4:
          __asm { BTI             j; jumptable 000000000000B908 case 4 }
          uint64_t result = 0;
          int v23 = a1 + 1;
          goto LABEL_89;
        case 5:
          __asm { BTI             j; jumptable 000000000000B908 case 5 }
          uint64_t result = 0;
          int v23 = a1 + 3;
          goto LABEL_89;
        default:
          goto LABEL_106;
      }
    }
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 == 102)
        {
          if (*a1 != 1)
          {
            int v19 = 746;
LABEL_107:
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v19);
            return 4294967293;
          }
LABEL_72:
          uint64_t result = 0;
          int v23 = a1 + 9;
          goto LABEL_89;
        }
LABEL_106:
        int v19 = 937;
        goto LABEL_107;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0)
      {
        int v19 = 734;
        goto LABEL_107;
      }
LABEL_88:
      uint64_t result = 0;
      int v23 = a1 + 8;
LABEL_89:
      *a3 = v23;
LABEL_90:
      uint64_t v13 = 4;
      goto LABEL_91;
    }
    unsigned int v25 = *a1;
    if (*a1 <= 8)
    {
      if (v25 == 1)
      {
        int v12 = a1 + 11;
        goto LABEL_79;
      }
      if (v25 == 3)
      {
        int v12 = a1 + 26;
        goto LABEL_79;
      }
LABEL_110:
      int v19 = 705;
      goto LABEL_107;
    }
    if (v25 == 9)
    {
      int v12 = a1 + 10;
      goto LABEL_79;
    }
    if (v25 != 18) {
      goto LABEL_110;
    }
    goto LABEL_15;
  }
  if (a2 <= 601)
  {
    if (a2 <= 501)
    {
      switch(a2)
      {
        case 400:
          if (*a1 == 7)
          {
            uint64_t result = 0;
            size_t v22 = a1 + 8;
LABEL_63:
            *a3 = v22;
            uint64_t v13 = 32;
            goto LABEL_91;
          }
          int v33 = 815;
          break;
        case 401:
          if (*a1 == 7)
          {
            uint64_t result = 0;
            *a3 = a1 + 16;
            uint64_t v13 = 24;
            goto LABEL_91;
          }
          int v33 = 821;
          break;
        case 501:
          if (*a1 == 10)
          {
LABEL_15:
            int v12 = a1 + 9;
LABEL_79:
            *a3 = v12;
            uint64_t result = (uint64_t)Util_isNullOrZeroMemory(v12, 16);
            if (result)
            {
              uint64_t result = 0;
              *a4 = 0;
              *a3 = 0;
              return result;
            }
LABEL_81:
            uint64_t v13 = 16;
            goto LABEL_91;
          }
          int v31 = 827;
LABEL_139:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypePasscodeValidated2", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v31);
          return 4294967293;
        default:
          goto LABEL_106;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeUserOutputDisplayed", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v33);
      return 4294967293;
    }
    if (a2 == 502)
    {
      if (*a1 == 10)
      {
        int v12 = a1 + 13;
        goto LABEL_79;
      }
      int v31 = 838;
      goto LABEL_139;
    }
    if (a2 == 503)
    {
      if (*a1 == 10)
      {
        int v12 = a1 + 17;
        goto LABEL_79;
      }
      int v31 = 849;
      goto LABEL_139;
    }
    if (a2 != 601) {
      goto LABEL_106;
    }
    if (*a1 == 12 || *a1 == 15) {
      goto LABEL_88;
    }
    int v18 = 861;
LABEL_114:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeKextDenyListApplePay || credential->type == kACMCredentialTypeKextDenyListFairPlay", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v18);
    return 4294967293;
  }
  if (a2 <= 801)
  {
    if (a2 == 602)
    {
      if (*a1 == 12 || *a1 == 15) {
        goto LABEL_72;
      }
      int v18 = 868;
      goto LABEL_114;
    }
    if (a2 != 701)
    {
      if (a2 != 801) {
        goto LABEL_106;
      }
      if (*a1 == 17)
      {
        int v14 = a1 + 8;
        uint64_t v15 = 16;
        long long v16 = a1 + 8;
        uint64_t v17 = 16;
        goto LABEL_97;
      }
      int v32 = 874;
LABEL_141:
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeSecureIntent", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v32);
      return 4294967293;
    }
    if (*a1 != 13)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypePassphraseExtractable", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 765);
      return 4294967293;
    }
    uint64_t result = 0;
    *a3 = a1 + 9;
    uint64_t v13 = a1[8];
LABEL_91:
    *a4 = v13;
    return result;
  }
  if (a2 == 802)
  {
    if (*a1 == 17)
    {
      int v14 = a1 + 12;
LABEL_94:
      uint64_t v15 = 65;
      long long v16 = v14;
      uint64_t v17 = 65;
      goto LABEL_97;
    }
    int v32 = 888;
    goto LABEL_141;
  }
  if (a2 != 901)
  {
    if (a2 != 1001) {
      goto LABEL_106;
    }
    if (*a1 != 21)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeSignature", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 915);
      return 4294967293;
    }
    long long v20 = a1 + 9;
    if (Util_isNullOrZeroMemory((unsigned char *)a1 + 36, 128))
    {
      long long v20 = 0;
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = a1[8];
    }
    uint64_t result = 0;
    *a3 = v20;
    goto LABEL_91;
  }
  if (*a1 != 20)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential->type == kACMCredentialTypeAP", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 902);
    return 4294967293;
  }
  int v14 = a1 + 8;
  uint64_t v15 = 32;
  long long v16 = a1 + 8;
  uint64_t v17 = 32;
LABEL_97:
  unsigned int v26 = Util_isNullOrZeroMemory(v16, v17);
  uint64_t result = 0;
  _ZF = v26 == 0;
  if (v26) {
    int v28 = 0;
  }
  else {
    int v28 = (int *)v14;
  }
  if (_ZF) {
    uint64_t v29 = v15;
  }
  else {
    uint64_t v29 = 0;
  }
  *a3 = v28;
  *a4 = v29;
  return result;
}

uint64_t LibCall_ACMRequirementGetType(unsigned int *a1)
{
  if (a1) {
    return *a1;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 950);
  return 0;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 4);
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 961);
  return 0;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 8);
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 972);
  return 0;
}

uint64_t LibCall_ACMRequirementGetPropertyData(_DWORD *a1, int a2, void *a3, uint64_t *a4)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 983);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "data", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 984);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 985);
    return 4294967293;
  }
  unsigned int v6 = a1;
  if (a2 <= 399)
  {
    if (a2 > 99)
    {
      switch(a2)
      {
        case 300:
          __asm { BTI             j; jumptable 000000000000C114 case 300 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            int v12 = v6 + 5;
            goto LABEL_48;
          }
          int v21 = 1037;
          goto LABEL_99;
        case 301:
          __asm { BTI             j; jumptable 000000000000C114 case 301 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            int v14 = v6 + 13;
            goto LABEL_66;
          }
          int v21 = 1049;
          goto LABEL_99;
        case 302:
          __asm { BTI             j; jumptable 000000000000C114 case 302 }
          if (*a1 == 3)
          {
            uint64_t result = 0;
            int v12 = v6 + 9;
            goto LABEL_48;
          }
          int v21 = 1043;
          goto LABEL_99;
        case 303:
          __asm { BTI             j; jumptable 000000000000C114 case 303 }
          if (*a1 == 3)
          {
            unint64_t v16 = 0;
            uint64_t v17 = a1 + 21;
            while ((Util_isNullOrZeroMemory(&v17[v16], 16) & 1) == 0)
            {
              _CF = v16 >= 16;
              v16 += 4;
              if (_CF)
              {
                unint64_t v16 = 20;
LABEL_74:
                uint64_t result = 0;
                *a3 = v17;
                *a4 = v16 * 4;
                return result;
              }
            }
            if (!(v16 * 4)) {
              uint64_t v17 = 0;
            }
            goto LABEL_74;
          }
          int v21 = 1055;
LABEL_99:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->type == kACMRequirementTypeBiometryMatched", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v21);
          return 4294967293;
        case 304:
          __asm { BTI             j; jumptable 000000000000C114 case 304 }
          if (*a1 != 3)
          {
            int v21 = 1071;
            goto LABEL_99;
          }
          if (a1[3] > 0x9Bu)
          {
            uint64_t result = 0;
            v6 += 41;
            goto LABEL_61;
          }
          int v22 = 1072;
          goto LABEL_101;
        case 305:
          __asm { BTI             j; jumptable 000000000000C114 case 305 }
          if (*a1 != 3)
          {
            int v21 = 1078;
            goto LABEL_99;
          }
          if (a1[3] > 0x9Bu)
          {
            uint64_t result = 0;
            v6 += 42;
            goto LABEL_61;
          }
          int v22 = 1079;
LABEL_101:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->dataLength >= sizeof(ACMRequirementDataBiometryMatched)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v22);
          return 4294967282;
        case 306:
          __asm { BTI             j; jumptable 000000000000C114 case 306 }
          if (*a1 == 24)
          {
            uint64_t result = 0;
            *a3 = v6 + 5;
            uint64_t v15 = v6[4];
            goto LABEL_67;
          }
          int v23 = 1120;
          goto LABEL_105;
        case 307:
          __asm { BTI             j; jumptable 000000000000C114 case 307 }
          if (*a1 == 24)
          {
            uint64_t result = 0;
            int v14 = v6 + 261;
            goto LABEL_66;
          }
          int v23 = 1129;
LABEL_105:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->type == kACMRequirementTypeAP", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v23);
          return 4294967293;
        default:
          if (a2 != 100)
          {
            if (a2 != 200) {
              goto LABEL_31;
            }
            if (*a1 == 2) {
              break;
            }
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->type == kACMCredentialTypePassphraseEntered", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1031);
            return 4294967293;
          }
          int v18 = *a1;
          if ((int)*a1 > 19)
          {
            if (v18 != 20 && v18 != 21) {
              goto LABEL_77;
            }
          }
          else if (v18 != 1 && v18 != 3)
          {
LABEL_77:
            int v13 = 1026;
            goto LABEL_32;
          }
          break;
      }
LABEL_28:
      uint64_t result = 0;
      v6 += 4;
      goto LABEL_61;
    }
    switch(a2)
    {
      case 1:
        uint64_t result = 0;
        goto LABEL_61;
      case 2:
        uint64_t result = 0;
        ++v6;
        goto LABEL_61;
      case 3:
        uint64_t result = 0;
        v6 += 2;
        goto LABEL_61;
    }
LABEL_31:
    int v13 = 1147;
LABEL_32:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v13);
    return 4294967293;
  }
  if (a2 > 600)
  {
    if (a2 == 601)
    {
      if (*a1 == 26)
      {
        if (a1[3] > 0x1Bu)
        {
          uint64_t result = 0;
          int v12 = v6 + 7;
LABEL_48:
          *a3 = v12;
          uint64_t v15 = 16;
          goto LABEL_67;
        }
        int v20 = 1101;
        goto LABEL_90;
      }
      int v19 = 1100;
LABEL_88:
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->type == kACMRequirementTypeRatchet", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v19);
      return 4294967293;
    }
    if (a2 != 602)
    {
      if (a2 == 700)
      {
        if (*a1 != 7)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->type == kACMRequirementTypeKofN", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1108);
          return 4294967293;
        }
        goto LABEL_28;
      }
      goto LABEL_31;
    }
    if (*a1 != 26)
    {
      int v19 = 1086;
      goto LABEL_88;
    }
    if (a1[3] <= 0x1Bu)
    {
      int v20 = 1087;
      goto LABEL_90;
    }
    uint64_t result = 0;
    *a3 = v6 + 4;
    uint64_t v15 = 8;
LABEL_67:
    *a4 = v15;
    return result;
  }
  if (a2 == 400)
  {
    if (*a1 == 13)
    {
      uint64_t result = 0;
      int v14 = v6 + 4;
LABEL_66:
      *a3 = v14;
      uint64_t v15 = 32;
      goto LABEL_67;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->type == kACMRequirementTypeUserOutputDisplayed", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1114);
    return 4294967293;
  }
  if (a2 == 500)
  {
    if (*a1 != 25)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->type == kACMRequirementTypeKeyRef", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1138);
      return 4294967293;
    }
    uint64_t result = 0;
    *a3 = v6 + 4;
    uint64_t v15 = 43;
    goto LABEL_67;
  }
  if (a2 != 600) {
    goto LABEL_31;
  }
  if (*a1 != 26)
  {
    int v19 = 1093;
    goto LABEL_88;
  }
  if (a1[3] > 0x1Bu)
  {
    uint64_t result = 0;
    v6 += 6;
LABEL_61:
    *a3 = v6;
    uint64_t v15 = 4;
    goto LABEL_67;
  }
  int v20 = 1094;
LABEL_90:
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement->dataLength >= sizeof(ACMRequirementDataRatchet)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v20);
  return 4294967282;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2, uint64_t a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1162);
    goto LABEL_9;
  }
  if (a3 != 29 && a3 != 47)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "opcode == kCmdPing || opcode == kCmdPingOnDoubleClick", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1163);
LABEL_9:
    unsigned int v8 = 70;
    uint64_t v7 = 4294967293;
    goto LABEL_10;
  }
  uint64_t v6 = a1(a2, a3, 0, 0, 0, 0, 0);
  uint64_t v7 = v6;
  if (v6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v6, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1165);
    unsigned int v8 = 70;
  }
  else
  {
    unsigned int v8 = 10;
  }
LABEL_10:
  if (v8 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  }
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  }
  if (a1)
  {
    uint64_t v4 = a1(a2, 28, 0, 0, 0, 0, 0);
    uint64_t v5 = v4;
    if (v4)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v4, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1179);
      unsigned int v6 = 70;
    }
    else
    {
      unsigned int v6 = 10;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1177);
    unsigned int v6 = 70;
    uint64_t v5 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, void *, uint64_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1191);
LABEL_17:
    unsigned int v17 = 70;
    uint64_t v16 = 4294967293;
    goto LABEL_11;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1192);
    goto LABEL_17;
  }
  if (!a6 || !a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "data && dataLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1193);
    goto LABEL_17;
  }
  memset(v20, 0, sizeof(v20));
  uint64_t v19 = 24;
  uint64_t Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, (uint64_t)v20, &v19);
  if (Property_Serialize)
  {
    uint64_t v16 = Property_Serialize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Property_Serialize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1200);
  }
  else if (v19 == 24)
  {
    uint64_t v15 = a1(a2, 33, 0, v20, 24, a6, a7);
    uint64_t v16 = v15;
    if (!v15)
    {
      unsigned int v17 = 10;
      goto LABEL_11;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v15, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1204);
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "commandSize == sizeof(commandBuffer)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1201);
    uint64_t v16 = 4294967291;
  }
  unsigned int v17 = 70;
LABEL_11:
  if (v17 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v16);
  }
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1217);
LABEL_15:
    unsigned int v15 = 70;
    uint64_t v14 = 4294967293;
    goto LABEL_10;
  }
  if (!a5 || !a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "data && dataLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1218);
    goto LABEL_15;
  }
  uint64_t v17 = 8;
  uint64_t v18 = 0;
  uint64_t Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v18, &v17);
  if (Property_Serialize)
  {
    uint64_t v14 = Property_Serialize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Property_Serialize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1225);
  }
  else if (v17 == 8)
  {
    uint64_t v13 = a1(a2, 27, 0, &v18, 8, a5, a6);
    uint64_t v14 = v13;
    if (!v13)
    {
      unsigned int v15 = 10;
      goto LABEL_10;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v13, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1229);
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "commandSize == sizeof(commandBuffer)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1226);
    uint64_t v14 = 4294967291;
  }
  unsigned int v15 = 70;
LABEL_10:
  if (v15 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v14);
  }
  return v14;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  }
  unint64_t v37 = 4096;
  size_t v38 = 0;
  size_t v35 = 0;
  char v36 = 0;
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1249);
LABEL_30:
    uint64_t v26 = 4294967293;
    goto LABEL_18;
  }
  if (!__s1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policyId", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1250);
    goto LABEL_30;
  }
  if (!a9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policySatisfied", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1251);
    goto LABEL_30;
  }
  int v34 = a1;
  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &v38);
  if (SerializedVerifyPolicySize)
  {
    uint64_t v26 = SerializedVerifyPolicySize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedVerifyPolicySize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1255);
    goto LABEL_18;
  }
  uint64_t v19 = v38;
  int v20 = (_OWORD *)acm_mem_alloc_data(v38);
  acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
  if (!v20)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inputBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1258);
    uint64_t v26 = 4294967292;
    goto LABEL_18;
  }
  uint64_t v21 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v20, &v38);
  if (v21)
  {
    uint64_t v30 = v21;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v21, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1261);
    int v22 = 0;
    uint64_t v26 = v30;
    goto LABEL_16;
  }
  int v22 = (unsigned int *)acm_mem_alloc_data(4096);
  acm_mem_alloc_info("<data>", v22, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
  if (!v22)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "reqBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1264);
    uint64_t v26 = 4294967292;
    goto LABEL_16;
  }
  uint64_t v23 = v34(a2, 3, 0, v20, v38, v22, &v37);
  if (v23)
  {
    uint64_t v31 = v23;
    uint64_t v32 = (int)v23;
    int v33 = 1267;
  }
  else
  {
    unint64_t v24 = v37;
    if (v37 <= 3)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "reqBufferSize >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1268);
      uint64_t v26 = 4294967291;
      goto LABEL_16;
    }
    *a9 = *v22 != 0;
    if (!a10)
    {
      uint64_t v26 = 0;
      goto LABEL_16;
    }
    uint64_t v25 = DeserializeRequirement(v22 + 1, v24 - 4, (void **)&v36, &v35);
    if (!v25)
    {
      uint64_t v26 = 0;
      *a10 = v36;
      goto LABEL_16;
    }
    uint64_t v31 = v25;
    uint64_t v32 = (int)v25;
    int v33 = 1279;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v32, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v33);
  uint64_t v26 = v31;
LABEL_16:
  unint64_t v27 = v38;
  acm_mem_free_info("<data>", v20, v38, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
  acm_mem_free_data((uint64_t)v20, v27);
  if (v22)
  {
    acm_mem_free_info("<data>", v22, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
    acm_mem_free_data((uint64_t)v22, 0x1000uLL);
  }
LABEL_18:
  if (v26 && v36) {
    Util_DeallocRequirement(v36);
  }
  if (v26) {
    unsigned int v28 = 70;
  }
  else {
    unsigned int v28 = 10;
  }
  if (v28 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v26);
  }
  return v26;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  }
  *(void *)uint64_t v21 = 0;
  uint64_t v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v21, 0, 1);
  if (v16)
  {
    uint64_t v17 = v16;
    int v20 = 1306;
  }
  else
  {
    uint64_t v17 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v21, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
    if (!v17) {
      goto LABEL_5;
    }
    int v20 = 1309;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v17, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v20);
LABEL_5:
  if (*(void *)v21) {
    LibCall_ACMContextDelete((uint64_t (*)(uint64_t, uint64_t, void, const void *, uint64_t, void, void))a1, a2, *(const void **)v21, 1);
  }
  if (v17) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v13 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1327);
LABEL_13:
    unsigned int v11 = 70;
    uint64_t v10 = 4294967293;
    goto LABEL_8;
  }
  if (!a4 || !a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataOutBuffer && dataInOutLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1328);
    goto LABEL_13;
  }
  uint64_t v9 = a1(a2, 25, 0, &v13, 4, a4, a5);
  uint64_t v10 = v9;
  if (v9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v9, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1331);
    unsigned int v11 = 70;
  }
  else
  {
    unsigned int v11 = 10;
  }
LABEL_8:
  if (v11 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  }
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1346);
LABEL_31:
    unsigned int v23 = 70;
    uint64_t v22 = 4294967293;
    goto LABEL_24;
  }
  if (a6 != 16 * (a5 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(keybagUuid && keybagUuidLength == 16) || (!keybagUuid && !keybagUuidLength)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1347);
    goto LABEL_31;
  }
  if (a7) {
    BOOL v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80;
  }
  else {
    BOOL v16 = a8 != 0;
  }
  if (v16)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(data && dataLength && dataLength <= 128) || (!data && !dataLength)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1348);
    goto LABEL_31;
  }
  unint64_t v17 = a8 + 44;
  __chkstk_darwin();
  unsigned int v18 = (_DWORD *)((char *)&v25 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0));
  bzero(v18, a8 + 44);
  long long v26 = 0uLL;
  _DWORD *v18 = a3;
  v18[1] = 2;
  v18[2] = a8;
  *(_OWORD *)(v18 + 3) = v26;
  *(_OWORD *)(v18 + 7) = 0u;
  if (a4)
  {
    unint64_t v19 = a8 + 32;
    if (v17 < 0xC) {
      unint64_t v19 = 0;
    }
    if (v19 <= 0xF) {
      LibCall_ACMSetEnvironmentVariable_cold_3();
    }
    *(_OWORD *)(v18 + 3) = *a4;
  }
  if (a5)
  {
    unint64_t v20 = a8 + 16;
    if (v17 < 0x1C) {
      unint64_t v20 = 0;
    }
    if (v20 <= 0xF) {
      LibCall_ACMSetEnvironmentVariable_cold_2();
    }
    *(_OWORD *)(v18 + 7) = *a5;
  }
  if (a8)
  {
    if (a8 >= 0xFFFFFFFFFFFFFFD4) {
      LibCall_ACMSetEnvironmentVariable_cold_1();
    }
    memcpy(v18 + 11, a7, a8);
  }
  uint64_t v21 = a1(a2, 44, 0, (char *)&v25 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
  uint64_t v22 = v21;
  if (v21)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v21, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1390);
    unsigned int v23 = 70;
  }
  else
  {
    unsigned int v23 = 10;
  }
LABEL_24:
  if (v23 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1404);
LABEL_13:
    unsigned int v10 = 70;
    uint64_t v9 = 4294967293;
    goto LABEL_8;
  }
  if (!a3 || !a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "stateOutBuffer && stateInOutSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1405);
    goto LABEL_13;
  }
  uint64_t v8 = a1(a2, 38, 0, 0, 0, a3, a4);
  uint64_t v9 = v8;
  if (v8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v8, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1408);
    unsigned int v10 = 70;
  }
  else
  {
    unsigned int v10 = 10;
  }
LABEL_8:
  if (v10 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  }
  if (a1)
  {
    BOOL v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3) {
      BOOL v10 = a4 != 0;
    }
    if (!v10)
    {
      if (a5) {
        uint64_t v11 = 43;
      }
      else {
        uint64_t v11 = 39;
      }
      uint64_t v12 = a1(a2, v11, 0, a3, a4, 0, 0);
      uint64_t v13 = v12;
      if (v12)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v12, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1423);
        unsigned int v14 = 70;
      }
      else
      {
        unsigned int v14 = 10;
      }
      goto LABEL_12;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(state && stateSize && stateSize <= 8192) || (!state && !stateSize)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1420);
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1419);
  }
  unsigned int v14 = 70;
  uint64_t v13 = 4294967293;
LABEL_12:
  if (v14 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  size_t v4 = v3;
  unsigned int v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, _OWORD *, unint64_t *))v0;
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  }
  if (!v9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1442);
LABEL_16:
    unsigned int v14 = 70;
    uint64_t v12 = 4294967293;
    goto LABEL_11;
  }
  if (!v6 || v4 - 4097 <= 0xFFFFFFFFFFFFEFFFLL)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(ctxImage && ctxImageSize && ctxImageSize <= (4 * 1024))", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1443);
    goto LABEL_16;
  }
  BOOL v10 = (_DWORD *)IOMallocTypeImpl();
  acm_mem_alloc_info("ACMHandleWithPayload", v10, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
  if (v10)
  {
    bzero(v20, 0x1005uLL);
    char v19 = 1;
    *(_WORD *)&v20[1] = 6;
    __int16 v21 = v4;
    memcpy(&v22, v6, v4);
    memset(v17, 0, sizeof(v17));
    uint64_t v18 = 0;
    unint64_t v16 = 280;
    uint64_t v11 = v9(v8, 48, 0, &v19, 4102, v17, &v16);
    if (v11)
    {
      uint64_t v12 = v11;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1489);
    }
    else if (v16 <= 0x17)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseBufferSize >= sizeof(Response)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1493);
      uint64_t v12 = 4294967291;
    }
    else
    {
      if (LOBYTE(v17[0]))
      {
        uint64_t v12 = 0;
        int v13 = DWORD1(v17[1]);
        *(_OWORD *)BOOL v10 = *(_OWORD *)((char *)v17 + 4);
        v10[4] = v13;
        void *v2 = v10;
        unsigned int v14 = 10;
        goto LABEL_11;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "response->resVersion > 0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1494);
      uint64_t v12 = 4294967280;
    }
    acm_mem_free_info("ACMHandleWithPayload", v10, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
    IOFreeTypeImpl();
    unsigned int v14 = 70;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handleWithPayload", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1448);
    unsigned int v14 = 70;
    uint64_t v12 = 4294967292;
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  size_t v4 = v3;
  unsigned int v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, int *))v0;
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  }
  if (v9)
  {
    if (v4 && v2)
    {
      long long v21 = 0uLL;
      int v20 = 1310721;
      if (v6) {
        long long v21 = *v6;
      }
      else {
        long long v21 = 0uLL;
      }
      bzero(v17, 0x1106uLL);
      *(void *)unint64_t v16 = 4358;
      uint64_t v10 = v9(v8, 49, 0, &v20, 20, v17, v16);
      if (v10)
      {
        uint64_t v12 = v10;
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1558);
        unsigned int v13 = 70;
      }
      else if (*(void *)v16 <= 5uLL)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseBufferSize >= sizeof(Response)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1562);
        unsigned int v13 = 70;
        uint64_t v12 = 4294967291;
      }
      else if (v17[0])
      {
        uint64_t v15 = v18;
        uint64_t v11 = Util_ReadFromBuffer((uint64_t)v17, *(size_t *)v16, &v15, v4, (unsigned __int16)__len);
        uint64_t v12 = v11;
        if (v11)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1567);
          unsigned int v13 = 70;
        }
        else
        {
          void *v2 = v15 - v18;
          unsigned int v13 = 10;
        }
      }
      else
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "response->resVersion > 0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1563);
        unsigned int v13 = 70;
        uint64_t v12 = 4294967280;
      }
      goto LABEL_14;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "ctxImageOutBuffer && ctxImageInOutSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1525);
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1524);
  }
  unsigned int v13 = 70;
  uint64_t v12 = 4294967293;
LABEL_14:
  if (v13 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, void, const void *, size_t, void, void), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  }
  size_t v26 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1584);
LABEL_20:
    unsigned int v22 = 70;
    uint64_t v19 = 4294967293;
    goto LABEL_14;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1585);
    goto LABEL_20;
  }
  if ((a7 != 0) != (a8 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(inData && inSize) || (!inData && !inSize)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1586);
    goto LABEL_20;
  }
  if (a8 >= 0xE01)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inSize <= (3*1024 + 512)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1587);
    unsigned int v22 = 70;
    uint64_t v19 = 4294967276;
    goto LABEL_14;
  }
  uint64_t Size = LibSer_StorageSetData_GetSize(a8, a5, a6, &v26);
  if (Size)
  {
    uint64_t v24 = Size;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Size, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1591);
    unsigned int v22 = 70;
    uint64_t v19 = v24;
    goto LABEL_14;
  }
  uint64_t v17 = v26;
  unsigned __int16 v18 = (const void *)acm_mem_alloc_data(v26);
  acm_mem_alloc_info("<data>", v18, v17, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
  if (!v18)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "commandBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1594);
    unsigned int v22 = 70;
    uint64_t v19 = 4294967292;
    goto LABEL_14;
  }
  uint64_t v19 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v18, &v26);
  if (v19)
  {
    int v25 = 1597;
  }
  else
  {
    uint64_t v20 = a1(a2, 40, 0, v18, v26, 0, 0);
    if (!v20) {
      goto LABEL_11;
    }
    int v25 = 1600;
    uint64_t v19 = v20;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v19, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v25);
LABEL_11:
  unint64_t v21 = v26;
  acm_mem_free_info("<data>", v18, v26, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
  acm_mem_free_data((uint64_t)v18, v21);
  if (v19) {
    unsigned int v22 = 70;
  }
  else {
    unsigned int v22 = 10;
  }
LABEL_14:
  if (v22 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, void, const void *, unint64_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
  }
  unint64_t v27 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1620);
LABEL_19:
    unsigned int v22 = 70;
    uint64_t Data_Serialize = 4294967293;
    goto LABEL_14;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1621);
    goto LABEL_19;
  }
  if (!a8 || !a9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer && outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1622);
    unsigned int v22 = 70;
    uint64_t Data_Serialize = 4294967293;
    goto LABEL_14;
  }
  uint64_t Size = LibSer_StorageGetData_GetSize(a6, a7, &v27);
  if (Size)
  {
    uint64_t v24 = Size;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Size, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1626);
    unsigned int v22 = 70;
    uint64_t Data_Serialize = v24;
    goto LABEL_14;
  }
  uint64_t v17 = v27;
  unsigned __int16 v18 = (const void *)acm_mem_alloc_data(v27);
  acm_mem_alloc_info("<data>", v18, v17, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
  if (!v18)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "commandBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1629);
    unsigned int v22 = 70;
    uint64_t Data_Serialize = 4294967292;
    goto LABEL_14;
  }
  uint64_t Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v18, &v27);
  if (Data_Serialize)
  {
    int v25 = 1632;
  }
  else
  {
    uint64_t v20 = a1(a2, 41, 0, v18, v27, a8, a9);
    if (!v20) {
      goto LABEL_11;
    }
    int v25 = 1635;
    uint64_t Data_Serialize = v20;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Data_Serialize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v25);
LABEL_11:
  unint64_t v21 = v27;
  acm_mem_free_info("<data>", v18, v27, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
  acm_mem_free_data((uint64_t)v18, v21);
  if (Data_Serialize) {
    unsigned int v22 = 70;
  }
  else {
    unsigned int v22 = 10;
  }
LABEL_14:
  if (v22 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)Data_Serialize);
  }
  return Data_Serialize;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, const void *a3, size_t a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1655);
LABEL_19:
    unsigned int v11 = 70;
    uint64_t v10 = 4294967293;
    goto LABEL_12;
  }
  if (!a3 && a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "!accUUIDsSize || accUUIDs", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1656);
    goto LABEL_19;
  }
  if (a4 >= 0x101)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "accUUIDsSize <= (16 * 16)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1659);
    goto LABEL_19;
  }
  if ((a4 & 0xF) != 0)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "accUUIDsSize % sizeof(uuid_t) == 0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1660);
    goto LABEL_19;
  }
  __chkstk_darwin();
  uint64_t v8 = (_DWORD *)((char *)&v13 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, a4 + 8);
  _DWORD *v8 = 1;
  v8[1] = a4;
  if (a4) {
    memcpy(v8 + 2, a3, a4);
  }
  uint64_t v9 = a1(a2, 45, 0, (char *)&v13 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
  uint64_t v10 = v9;
  if (v9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v9, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1689);
    unsigned int v11 = 70;
  }
  else
  {
    unsigned int v11 = 10;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v10);
  }
  return v10;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, long long *a3, int a4, void *a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  }
  if (a3 && a1 && a5)
  {
    int v16 = 1;
    int v18 = a4;
    long long v17 = *a3;
    memset(v15, 0, 140);
    unint64_t v14 = 140;
    uint64_t v10 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if (v10)
    {
      uint64_t v11 = v10;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1736);
    }
    else if (v14 <= 0xB)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseBufferSize >= sizeof(Response)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1740);
      uint64_t v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        uint64_t v11 = 0;
        *a5 = *(void *)((char *)v15 + 4);
        unsigned int v12 = 10;
        goto LABEL_10;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "response->version >= kCmdCurrentVersion_ContextGetInfo", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1741);
      uint64_t v11 = 4294967281;
    }
    unsigned int v12 = 70;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport && context && value", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1703);
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  }
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, void, void, const void *, unint64_t, unsigned int *, unint64_t *), uint64_t a2, unsigned int a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  }
  unint64_t v44 = 0;
  v42 = 0;
  unint64_t v43 = 4096;
  size_t v41 = 0;
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1921);
LABEL_31:
    uint64_t v31 = 4294967293;
    goto LABEL_19;
  }
  if (!a5 || !a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "aclConstraint && aclConstraintLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1922);
    goto LABEL_31;
  }
  if (!a13)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policySatisfied", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1923);
    goto LABEL_31;
  }
  size_t v38 = a1;
  unsigned int v39 = a3;
  int v21 = a3;
  unsigned int v22 = a8;
  SerializedVerifyAclConstraintuint64_t Size = GetSerializedVerifyAclConstraintSize(v21, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v44);
  if (SerializedVerifyAclConstraintSize)
  {
    uint64_t v31 = SerializedVerifyAclConstraintSize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedVerifyAclConstraintSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1927);
    goto LABEL_19;
  }
  uint64_t v24 = v44;
  int v25 = (const void *)acm_mem_alloc_data(v44);
  acm_mem_alloc_info("<data>", v25, v24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
  if (!v25)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inputBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1930);
    uint64_t v31 = 4294967292;
    goto LABEL_19;
  }
  uint64_t v26 = SerializeVerifyAclConstraint(v39, a4, a5, a6, a7, v22, a9, a12, a10, a11, (uint64_t)v25, &v44);
  if (v26)
  {
    uint64_t v35 = v26;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v26, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1933);
    unint64_t v27 = 0;
  }
  else
  {
    unint64_t v27 = (unsigned int *)acm_mem_alloc_data(4096);
    acm_mem_alloc_info("<data>", v27, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
    if (!v27)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "reqBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1936);
      uint64_t v31 = 4294967292;
      goto LABEL_17;
    }
    uint64_t v28 = v38(a2, v39, 0, v25, v44, v27, &v43);
    if (v28)
    {
      uint64_t v35 = v28;
      uint64_t v36 = (int)v28;
      int v37 = 1939;
    }
    else
    {
      unint64_t v29 = v43;
      if (v43 <= 3)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "reqBufferSize >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1940);
        uint64_t v31 = 4294967291;
        goto LABEL_17;
      }
      *a13 = *v27 != 0;
      if (!a14)
      {
        uint64_t v31 = 0;
        goto LABEL_17;
      }
      uint64_t v30 = DeserializeRequirement(v27 + 1, v29 - 4, (void **)&v42, &v41);
      if (!v30)
      {
        uint64_t v31 = 0;
        *a14 = v42;
        goto LABEL_17;
      }
      uint64_t v35 = v30;
      uint64_t v36 = (int)v30;
      int v37 = 1949;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v36, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v37);
  }
  uint64_t v31 = v35;
LABEL_17:
  unint64_t v32 = v44;
  acm_mem_free_info("<data>", v25, v44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
  acm_mem_free_data((uint64_t)v25, v32);
  if (v27)
  {
    acm_mem_free_info("<data>", v27, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
    acm_mem_free_data((uint64_t)v27, 0x1000uLL);
  }
LABEL_19:
  if (v31 && v42) {
    Util_DeallocRequirement(v42);
  }
  if (v31) {
    unsigned int v33 = 70;
  }
  else {
    unsigned int v33 = 10;
  }
  if (v33 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v31);
  }
  return v31;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, void *a14, unint64_t *a15)
{
  unsigned int v20 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    IOLog("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    unsigned int v20 = gACMLoggingLevel;
  }
  if (v20 <= 0x14)
  {
    IOLog("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    unsigned int v20 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      IOLog("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      unsigned int v20 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        IOLog("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        unsigned int v20 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          IOLog("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          unsigned int v20 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    uint64_t v21 = a6;
    unsigned int v22 = a5;
    do
    {
      if (v20 <= 0x14)
      {
        IOLog("%02x ", *v22);
        unsigned int v20 = gACMLoggingLevel;
      }
      ++v22;
      --v21;
    }
    while (v21);
  }
  if (v20 < 0x15)
  {
    IOLog("\n");
    unsigned int v20 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      IOLog("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      unsigned int v20 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        IOLog("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        unsigned int v20 = gACMLoggingLevel;
      }
    }
  }
  unsigned int v23 = a5;
  int v50 = a3;
  if (a8)
  {
    uint64_t v24 = a8;
    int v25 = a7;
    do
    {
      if (v20 <= 0x14)
      {
        IOLog("%02x ", *v25);
        unsigned int v20 = gACMLoggingLevel;
      }
      ++v25;
      --v24;
    }
    while (v24);
  }
  if (v20 < 0x15)
  {
    IOLog("\n");
    if (gACMLoggingLevel <= 0x14u)
    {
      IOLog("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        IOLog("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          IOLog("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u) {
            IOLog("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
          }
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (!v23 || !a6)
    {
      int v45 = 1893;
      goto LABEL_81;
    }
    if (!a7 || !a8)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "operation && operationLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1894);
      goto LABEL_85;
    }
    if ((a9 != 0) != (a10 != 0))
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(parametersCount == 0 && !parameters) || (parametersCount > 0 && parameters)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1895);
      goto LABEL_85;
    }
    if (!a12)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "constraintState", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1896);
      goto LABEL_85;
    }
    unint64_t v55 = 0;
    unint64_t v54 = 4096;
    if (gACMLoggingLevel <= 0xAu) {
      IOLog("%s: %s: called.\n", "ACM", "processAclInternal");
    }
    SerializedProcessAcluint64_t Size = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)v23, a6, (uint64_t)a7, a8, a11, a9, a10, &v55);
    if (SerializedProcessAclSize)
    {
      uint64_t v46 = SerializedProcessAclSize;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedProcessAclSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1774);
      unsigned int v42 = 70;
      uint64_t v27 = v46;
      goto LABEL_70;
    }
    unint64_t v31 = v55;
    unint64_t v32 = (char *)acm_mem_alloc_data(v55);
    uint64_t v33 = v31;
    int v34 = v32;
    acm_mem_alloc_info("<data>", v32, v33, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v34)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "commandBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1777);
      unsigned int v42 = 70;
      uint64_t v27 = 4294967292;
      goto LABEL_70;
    }
    unint64_t v54 = 4096;
    uint64_t v35 = (_DWORD *)acm_mem_alloc_data(4096);
    acm_mem_alloc_info("<data>", v35, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v35)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1781);
      unint64_t v40 = 0;
      unsigned int v39 = 0;
      uint64_t v27 = 4294967292;
      goto LABEL_64;
    }
    uint64_t v36 = SerializeProcessAcl(a4, v23, a6, a7, a8, a11, a9, a10, (uint64_t)v34, &v55);
    if (v36)
    {
      uint64_t v47 = v36;
      uint64_t v48 = (int)v36;
      int v49 = 1784;
    }
    else
    {
      uint64_t v37 = a1(a2, v50, 0, v34, v55, v35, (uint64_t *)&v54);
      if (!v37)
      {
        unint64_t v38 = v54;
        if (v54 <= 7)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseBufferSize >= 2 * sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1790);
        }
        else
        {
          *a12 = *v35;
          if (a13) {
            *a13 = v35[1] != 0;
          }
          uint64_t v27 = 0;
          unsigned int v39 = 0;
          if (v50 != 30 || !a14)
          {
            unint64_t v40 = 0;
            goto LABEL_63;
          }
          unint64_t v40 = 0;
          if (!a15)
          {
LABEL_63:
            acm_mem_free_info("<data>", v35, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1817, "processAclInternal");
            acm_mem_free_data((uint64_t)v35, 0x1000uLL);
LABEL_64:
            unint64_t v41 = v55;
            acm_mem_free_info("<data>", v34, v55, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1821, "processAclInternal");
            acm_mem_free_data((uint64_t)v34, v41);
            if (v27 && v39)
            {
              acm_mem_free_info("<data>", v39, v40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1825, "processAclInternal");
              acm_mem_free_data((uint64_t)v39, v40);
              unsigned int v42 = 70;
            }
            else if (v27)
            {
              unsigned int v42 = 70;
            }
            else
            {
              unsigned int v42 = 10;
            }
LABEL_70:
            if (v42 >= gACMLoggingLevel) {
              IOLog("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v27);
            }
            if (v27)
            {
              uint64_t v28 = (int)v27;
              int v29 = 1899;
              goto LABEL_94;
            }
LABEL_73:
            unsigned int v43 = 10;
            goto LABEL_74;
          }
          if (v38 > 0xB)
          {
            unint64_t v40 = v35[2];
            if (v40)
            {
              if (v38 >= v40 + 12)
              {
                unsigned int v39 = (void *)acm_mem_alloc_data(v35[2]);
                acm_mem_alloc_info("<data>", v39, v40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1805, "processAclInternal");
                if (v39)
                {
                  memmove(v39, v35 + 3, v40);
                  uint64_t v27 = 0;
                  *a14 = v39;
                  *a15 = v40;
                }
                else
                {
                  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "authMethodInst", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1806);
                  uint64_t v27 = 4294967292;
                }
                goto LABEL_63;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseBufferSize >= 3 * sizeof(uint32_t) + authMethodInstLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1804);
              unsigned int v39 = 0;
              goto LABEL_97;
            }
            unsigned int v39 = 0;
            unint64_t v40 = 0;
            uint64_t v27 = 0;
            goto LABEL_63;
          }
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseBufferSize >= 3 * sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1801);
        }
        unsigned int v39 = 0;
        unint64_t v40 = 0;
LABEL_97:
        uint64_t v27 = 4294967291;
        goto LABEL_63;
      }
      uint64_t v47 = v37;
      uint64_t v48 = (int)v37;
      int v49 = 1789;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v48, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v49);
    unsigned int v39 = 0;
    unint64_t v40 = 0;
    uint64_t v27 = v47;
    goto LABEL_63;
  }
  if (a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "!context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1884);
LABEL_85:
    unsigned int v43 = 70;
    uint64_t v27 = 4294967293;
    goto LABEL_74;
  }
  if (!v23 || !a6)
  {
    int v45 = 1885;
LABEL_81:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "acl && aclLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v45);
    goto LABEL_85;
  }
  if (!a13)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirePasscode", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1886);
    goto LABEL_85;
  }
  uint64_t v26 = aclRequiresPasscodeInternal(a1, a2, v23, a6, a13);
  uint64_t v27 = v26;
  if (!v26) {
    goto LABEL_73;
  }
  uint64_t v28 = (int)v26;
  int v29 = 1889;
LABEL_94:
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v28, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v29);
  unsigned int v43 = 70;
LABEL_74:
  if (v43 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v27);
  }
  return v27;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, void *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, void, void, const void *, unint64_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1982);
LABEL_17:
    unsigned int v23 = 70;
    uint64_t v22 = 4294967293;
    goto LABEL_10;
  }
  if (!a4 || !a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "aclConstraint && aclConstraintLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1983);
    goto LABEL_17;
  }
  if ((a9 != 0) != (a10 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(parametersCount == 0 && !parameters) || (parametersCount > 0 && parameters)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1984);
    goto LABEL_17;
  }
  if (!a12)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "constraintSatisfied", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1985);
    goto LABEL_17;
  }
  uint64_t v21 = verifyAclConstraintInternal(a1, a2, 0xBu, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  uint64_t v22 = v21;
  if (v21)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v21, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1988);
    unsigned int v23 = 70;
  }
  else
  {
    unsigned int v23 = 10;
  }
LABEL_10:
  if (v23 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  }
  BOOL v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3) {
    BOOL v17 = a4 != 0;
  }
  if (v17)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(enrollmentState && enrollmentStateLength && enrollmentStateLength <= (32 + (5 * 16))) || (!enrollmentState && !enrollmentStateLength)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2010);
    goto LABEL_21;
  }
  if (!a8 || a9 != 16)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "keybagUuid && keybagUuidLength == sizeof(uuid_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2011);
LABEL_21:
    unsigned int v23 = 70;
    uint64_t v22 = 4294967293;
    goto LABEL_14;
  }
  if (!a5 || a6 != 16)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "catacombUuid && catacombUuidLength == sizeof(uuid_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2012);
    goto LABEL_21;
  }
  size_t v18 = a4;
  size_t v19 = a4 + 36;
  __chkstk_darwin();
  unsigned int v20 = (_DWORD *)((char *)&v25 - ((v18 + 51) & 0x1FFFFFFF0));
  bzero(v20, v19);
  *unsigned int v20 = a7;
  *(_OWORD *)(v20 + 1) = *a8;
  *(_OWORD *)(v20 + 5) = *a5;
  if (a3) {
    memcpy(v20 + 9, a3, v18);
  }
  uint64_t v21 = a1(a2, 14, 0, (char *)&v25 - ((v18 + 51) & 0x1FFFFFFF0), v19, 0, 0);
  uint64_t v22 = v21;
  if (v21)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v21, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2043);
    unsigned int v23 = 70;
  }
  else
  {
    unsigned int v23 = 10;
  }
LABEL_14:
  if (v23 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, char a3)
{
  char v9 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  }
  int v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  uint64_t v6 = v5;
  if (v5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v5, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2054);
    unsigned int v7 = 70;
  }
  else
  {
    unsigned int v7 = 10;
  }
  if (v7 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", v6);
  }
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  }
  char v16 = 0;
  unint64_t v15 = 1;
  char v14 = 0;
  uint64_t v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v16, (uint64_t)&v15);
  if (v8)
  {
    uint64_t v11 = v8;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v8, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2069);
    unsigned int v12 = 70;
  }
  else if (v15 >= 2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "currentStateSize <= 1", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2070);
    unsigned int v12 = 70;
    uint64_t v11 = 4294967291;
  }
  else
  {
    char v9 = v16 & ~a3;
    if (a4) {
      char v9 = v16 | a3;
    }
    char v14 = v9;
    uint64_t v10 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))a1, a2, 6, 0, 0, 0, &v14, 1uLL);
    uint64_t v11 = v10;
    if (v10)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2075);
      unsigned int v12 = 70;
    }
    else
    {
      unsigned int v12 = 10;
    }
  }
  if (v12 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(void, void, void, void, void, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, unsigned char *a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  }
  memset(v30, 0, sizeof(v30));
  unint64_t v27 = 64;
  char v29 = 0;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 129;
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "context", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2092);
LABEL_26:
    unsigned int v21 = 70;
    uint64_t v20 = 4294967293;
    goto LABEL_14;
  }
  if (!a6 || !a7 || !a8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "unlockSecret && unlockSecretLength && unlockSecretType", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2093);
    goto LABEL_26;
  }
  if ((a4 != 0) != (a5 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "( (parametersCount > 0 && parameters != ((void*)0)) || ((parametersCount == 0) && parameters == ((void*)0)))", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2094);
    goto LABEL_26;
  }
  uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v30, &v27);
  if (UnlockSecret_Serialize)
  {
    uint64_t v20 = UnlockSecret_Serialize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)UnlockSecret_Serialize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2097);
  }
  else
  {
    uint64_t v17 = a1(a2, 50, 0, v30, v27, v28, &v26);
    if (v17)
    {
      uint64_t v20 = v17;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v17, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2100);
      unsigned int v21 = 70;
      goto LABEL_14;
    }
    size_t __len = 0;
    __src = 0;
    char v23 = 0;
    uint64_t UnlockSecretResponse_Deserialize = LibSer_GetUnlockSecretResponse_Deserialize(v28, v26, &__src, &__len, &v23);
    if (UnlockSecretResponse_Deserialize)
    {
      uint64_t v20 = UnlockSecretResponse_Deserialize;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)UnlockSecretResponse_Deserialize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2108);
    }
    else
    {
      size_t v19 = __len;
      if (*a7 < __len)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*unlockSecretLength >= dataSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2109);
        uint64_t v20 = 4294967276;
      }
      else
      {
        if (__src)
        {
          memmove(a6, __src, __len);
          uint64_t v20 = 0;
          *a7 = v19;
          *a8 = v23;
          unsigned int v21 = 10;
          goto LABEL_14;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "data", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2110);
        uint64_t v20 = 4294967291;
      }
    }
  }
  unsigned int v21 = 70;
LABEL_14:
  if (v21 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v20);
  }
  return v20;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, unint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, _OWORD *a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  uint64_t v30 = a8;
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  }
  unint64_t v34 = 0;
  bzero(v35, 0x400uLL);
  unint64_t v33 = 1024;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "transport", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2130);
LABEL_26:
    unsigned int v22 = 70;
    uint64_t v21 = 4294967293;
    goto LABEL_17;
  }
  BOOL v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3) {
    BOOL v16 = a4 != 0;
  }
  if (v16)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(data && dataLength && dataLength <= 4096) || (!data && !dataLength)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2131);
    goto LABEL_26;
  }
  uint64_t Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if (Size)
  {
    uint64_t v27 = Size;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Size, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2136);
    unsigned int v22 = 70;
    uint64_t v21 = v27;
    goto LABEL_17;
  }
  __chkstk_darwin();
  size_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v19, v18);
  uint64_t v20 = LibSer_SEPControl_Serialize(a5, a6, a7, a3, a4, (uint64_t)v19, &v34);
  if (v20)
  {
    uint64_t v21 = v20;
    int v28 = 2144;
LABEL_24:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v21, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", v28);
    unsigned int v22 = 70;
    goto LABEL_17;
  }
  uint64_t v21 = a1(a2, 51, 0, v19, v34, v35, &v33);
  if (v21)
  {
    int v28 = 2148;
    goto LABEL_24;
  }
  unsigned int v22 = 10;
  char v23 = v30;
  if (!v30 || !a9) {
    goto LABEL_17;
  }
  size_t v31 = 0;
  unint64_t v32 = 0;
  uint64_t v24 = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if (v24)
  {
    uint64_t v21 = v24;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v24, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2156);
LABEL_29:
    unsigned int v22 = 70;
    goto LABEL_17;
  }
  size_t v25 = v31;
  if (*a9 < v31)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*resultLength >= dataSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 2157);
    uint64_t v21 = 4294967276;
    goto LABEL_29;
  }
  if (v32) {
    memmove(v23, v32, v31);
  }
  uint64_t v21 = 0;
  *a9 = v25;
  unsigned int v22 = 10;
LABEL_17:
  if (v22 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v21);
  }
  return v21;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, unsigned char *a5)
{
  int v19 = 0;
  uint64_t v18 = 4;
  size_t v10 = a4;
  size_t v11 = a4 + 4;
  __chkstk_darwin();
  unsigned int v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  }
  bzero((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11);
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "acl", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1844);
LABEL_13:
    unsigned int v15 = 70;
    uint64_t v14 = 4294967293;
    goto LABEL_8;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirePasscode", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1845);
    goto LABEL_13;
  }
  unsigned int *v12 = a4;
  memcpy(v12 + 1, a3, v10);
  uint64_t v13 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
  if (v13)
  {
    uint64_t v14 = v13;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v13, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1853);
    unsigned int v15 = 70;
  }
  else if (v18 == 4)
  {
    uint64_t v14 = 0;
    *a5 = 1;
    unsigned int v15 = 10;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseSize == sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibCall.c", 1856);
    unsigned int v15 = 70;
    uint64_t v14 = 4294967291;
  }
LABEL_8:
  if (v15 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  }
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
}

void LibCall_ACMSetEnvironmentVariable_cold_1()
{
}

void LibCall_ACMSetEnvironmentVariable_cold_2()
{
}

void LibCall_ACMSetEnvironmentVariable_cold_3()
{
}

uint64_t acm_explicit_bzero(void *a1, size_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

uint64_t acm_mem_alloc_data(uint64_t a1)
{
  uint64_t v2 = IOMallocZeroData();
  if (v2) {
    _allocatedMem_2 += a1;
  }
  else {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "ptr", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonMem.c", 49);
  }
  return v2;
}

void acm_mem_free_data(uint64_t a1, unint64_t a2)
{
  if (a1)
  {
    IOFreeData();
    if (_allocatedMem_2 < a2)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "_allocatedMem.data >= size", 0, "heap underflow / memory tracking issue?", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonMem.c", 64);
      _allocatedMem_2 = 0;
    }
    else
    {
      _allocatedMem_2 -= a2;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "ptr", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonMem.c", 56);
  }
}

void acm_mem_alloc_info(const char *a1, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    _allocatedMem_0 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    uint64_t v6 = "NULL";
    if (a1) {
      unsigned int v7 = a1;
    }
    else {
      unsigned int v7 = "NULL";
    }
    if (a4) {
      uint64_t v8 = a4;
    }
    else {
      uint64_t v8 = "NULL";
    }
    if (a6) {
      uint64_t v6 = a6;
    }
    IOLog("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, 0, v8, a5, v6);
  }
}

void acm_mem_free_info(const char *a1, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  int v9 = a3;
  if (a2)
  {
    uint64_t v12 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "_allocatedMem.total >= size", 0, "heap underflow / memory tracking issue?", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonMem.c", 113);
      uint64_t v12 = 0;
    }
    _allocatedMem_0 = v12;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    uint64_t v13 = "NULL";
    if (a1) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = "NULL";
    }
    if (a4) {
      unsigned int v15 = a4;
    }
    else {
      unsigned int v15 = "NULL";
    }
    if (a6) {
      uint64_t v13 = a6;
    }
    IOLog("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v14, a2, v9, _allocatedMem_0, 0, _allocatedMem_2, 0, v15, a5, v13);
  }
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, void *a7)
{
  unsigned int v14 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 241);
    return 4294967293;
  }
  if (!__s1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policyId", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 242);
    return 4294967293;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 243);
    return 4294967293;
  }
  size_t v10 = strnlen(__s1, 0x81uLL);
  if (v10 >= 0x81)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policyLength <= 128", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 247);
    return 4294967293;
  }
  size_t v11 = v10;
  uint64_t LengthOfParameters = getLengthOfParameters(a5, a6, &v14);
  if (LengthOfParameters) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == kACMErrorSuccess", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 251);
  }
  else {
    *a7 = v11 + v14 + 26;
  }
  return LengthOfParameters;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  }
  if (a3)
  {
    *a3 = 0;
    int v6 = 0;
    if (!a2)
    {
LABEL_9:
      uint64_t v11 = 0;
      *a3 = v6;
      unsigned int v12 = 10;
      goto LABEL_10;
    }
    uint64_t v7 = a2;
    while (1)
    {
      uint64_t v8 = checkParameter(a1);
      if (v8)
      {
        uint64_t v11 = v8;
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v8, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 109);
        unsigned int v12 = 70;
        goto LABEL_10;
      }
      int v9 = v6 + 8;
      int v10 = a1[4];
      v6 += v10 + 8;
      if (__CFADD__(v10, v9)) {
        break;
      }
      a1 += 6;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersLength + param->parameterDataLength >= parametersLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 111);
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "paramsLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 99);
  }
  unsigned int v12 = 70;
  uint64_t v11 = 4294967293;
LABEL_10:
  if (v12 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  }
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  unint64_t v24 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 276);
    return 4294967293;
  }
  if (!__s1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policyId", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 277);
    return 4294967293;
  }
  if ((a5 != 0) != (a6 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(parameters && parametersCount) || (!parameters && !parametersCount)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 278);
    return 4294967293;
  }
  if (a6 >= 0xB)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount <= 10", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 279);
    return 4294967293;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 280);
    return 4294967293;
  }
  if (!a8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 281);
    return 4294967293;
  }
  int v13 = a4;
  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v24);
  if (SerializedVerifyPolicySize)
  {
    uint64_t v21 = SerializedVerifyPolicySize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedVerifyPolicySize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 285);
    return v21;
  }
  if (*a8 < v24)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 286);
    return 4294967293;
  }
  *a7 = *a1;
  size_t v17 = strnlen(__s1, 0x81uLL);
  if (v17 >= 0x81)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policyLength <= 128", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 294);
    return 4294967293;
  }
  size_t v18 = v17;
  memmove(a7 + 1, __s1, v17 + 1);
  int v19 = (char *)a7 + v18;
  v19[17] = a3;
  *(_DWORD *)(v19 + 18) = v13;
  size_t v23 = v18 + 22;
  uint64_t v20 = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v23);
  uint64_t v21 = v20;
  if (v20) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v20, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 308);
  }
  else {
    *a8 = v23;
  }
  return v21;
}

uint64_t serializeParameters(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t *a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "serializeParameters");
  }
  if (a3 && a4)
  {
    uint64_t v8 = *a4;
    *(_DWORD *)(a3 + v8) = a2;
    uint64_t v9 = v8 + 4;
    if (a2)
    {
      uint64_t v10 = a2;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        size_t __len = *(void *)(a1 + 16);
        uint64_t v11 = checkParameter(__src);
        if (v11) {
          break;
        }
        unsigned int v12 = (_DWORD *)(a3 + v9);
        size_t v13 = __len;
        _DWORD *v12 = __src[0];
        v12[1] = v13;
        v9 += 8;
        if (v13)
        {
          memmove((void *)(a3 + v9), __src[1], v13);
          v9 += v13;
        }
        a1 += 24;
        if (!--v10) {
          goto LABEL_11;
        }
      }
      uint64_t v14 = v11;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 146);
      unsigned int v15 = 70;
    }
    else
    {
LABEL_11:
      uint64_t v14 = 0;
      *a4 = v9;
      unsigned int v15 = 10;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer && offset", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 132);
    unsigned int v15 = 70;
    uint64_t v14 = 4294967293;
  }
  if (v15 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v14);
  }
  return v14;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, BOOL *a5, _DWORD *a6, void *a7, _DWORD *a8)
{
  uint64_t v28 = 0;
  unsigned int v27 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 332);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 333);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policyId", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 334);
    return 4294967293;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "preflight", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 335);
    return 4294967293;
  }
  if (!a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "maxGlobalCredentialAge", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 336);
    return 4294967293;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parameters", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 337);
    return 4294967293;
  }
  if (!a8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 338);
    return 4294967293;
  }
  if (a2 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 341);
    return 4294967293;
  }
  *a3 = *(_OWORD *)a1;
  unsigned int v15 = (const void *)(a1 + 16);
  unint64_t v16 = a2 - 16;
  unint64_t v17 = strnlen((const char *)(a1 + 16), a2 - 16);
  if (v17 >= 0x81)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(policyLength <= 128)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 347);
    return 4294967293;
  }
  if (v16 <= v17)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= (policyLength + 1)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 348);
    return 4294967293;
  }
  uint64_t v26 = a4;
  unint64_t v18 = v17 + 1;
  int v19 = (void *)acm_mem_alloc_data(v17 + 1);
  acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
  if (!v19)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "policy", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 350);
    return 4294967292;
  }
  memmove(v19, v15, v17 + 1);
  unint64_t v29 = v17 + 17;
  if (v17 + 17 == a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint8_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 355);
LABEL_31:
    uint64_t v24 = 4294967293;
    goto LABEL_33;
  }
  BOOL v20 = *(unsigned char *)(a1 + v17 + 17) != 0;
  unint64_t v29 = v17 + 18;
  if (a2 - (v17 + 18) <= 3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 360);
    goto LABEL_31;
  }
  uint64_t v21 = a8;
  int v22 = *(_DWORD *)(a1 + v17 + 18);
  unint64_t v29 = v17 + 22;
  uint64_t v23 = deserializeParameters(a1, a2, &v29, &v28, &v27);
  uint64_t v24 = v23;
  if (!v23)
  {
    void *v26 = v19;
    *a5 = v20;
    *a6 = v22;
    *a7 = v28;
    *uint64_t v21 = v27;
    return v24;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v23, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 366);
  unint64_t v18 = v17 + 1;
LABEL_33:
  acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
  acm_mem_free_data((uint64_t)v19, v18);
  if (v28) {
    Util_SafeDeallocParameters(v28, v27);
  }
  return v24;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4, _DWORD *a5)
{
  uint64_t v10 = (unsigned __int8 *)&kmod_info;
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "deserializeParameters");
  }
  if (!a1 || !a3 || !a4 || !a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer && offset && parameters && parametersCount", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 176);
LABEL_37:
    unsigned int v24 = 70;
    uint64_t v23 = 4294967293;
    goto LABEL_24;
  }
  unint64_t v11 = *a3;
  unint64_t v29 = a4;
  if (a2 <= *a3) {
    goto LABEL_22;
  }
  if (a2 - *a3 <= 3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - newOffset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 182);
    goto LABEL_37;
  }
  uint64_t v12 = *(unsigned int *)(a1 + v11);
  if (v12 >= 0xB)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "paramsCount <= 10", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 185);
    goto LABEL_37;
  }
  v11 += 4;
  if (!v12)
  {
LABEL_22:
    int v22 = 0;
    uint64_t v14 = 0;
LABEL_23:
    uint64_t v23 = 0;
    *unint64_t v29 = v14;
    *a5 = v22;
    unsigned int v24 = 10;
    *a3 = v11;
    goto LABEL_24;
  }
  unsigned int v27 = a5;
  uint64_t v28 = a3;
  int v26 = v12;
  uint64_t v13 = 24 * v12;
  uint64_t v14 = (char *)IOMallocTypeVarImpl();
  acm_mem_alloc_info("array of ACMParameter", v14, v13, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v14)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "params", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 195);
    unsigned int v24 = 70;
    uint64_t v23 = 4294967292;
    goto LABEL_24;
  }
  uint64_t v15 = 0;
  while (1)
  {
    unint64_t v16 = &v14[v15];
    *(void *)&v14[v15 + 8] = 0;
    if (a2 - v11 <= 7)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - newOffset) >= sizeof(ACMParameterType) + sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 199);
LABEL_30:
      unsigned int v24 = 70;
      uint64_t v23 = 4294967293;
      goto LABEL_33;
    }
    *(_DWORD *)unint64_t v16 = *(_DWORD *)(a1 + v11);
    if (a2 - (v11 + 4) <= 3)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - newOffset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 202);
      goto LABEL_30;
    }
    unint64_t v17 = &v14[v15];
    unint64_t v18 = *(unsigned int *)(a1 + v11 + 4);
    *(_DWORD *)&v14[v15 + 16] = v18;
    v11 += 8;
    if (a2 - v11 < v18)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - newOffset) >= params[i].parameterDataLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 206);
      goto LABEL_30;
    }
    uint64_t v19 = checkParameter(&v14[v15]);
    if (v19)
    {
      uint64_t v23 = v19;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v19, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 209);
      unsigned int v24 = 70;
      goto LABEL_33;
    }
    uint64_t v20 = *((unsigned int *)v17 + 4);
    if (v20) {
      break;
    }
LABEL_20:
    v15 += 24;
    if (v13 == v15)
    {
      uint64_t v10 = (unsigned char *)&kmod_info;
      a5 = v27;
      a3 = v28;
      int v22 = v26;
      goto LABEL_23;
    }
  }
  uint64_t v21 = (void *)acm_mem_alloc_data(*((unsigned int *)v17 + 4));
  acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((void *)v16 + 1) = v21;
  if (v21)
  {
    memmove(v21, (const void *)(a1 + v11), *((unsigned int *)v17 + 4));
    v11 += *((unsigned int *)v17 + 4);
    goto LABEL_20;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "params[i].parameterData", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 213);
  unsigned int v24 = 70;
  uint64_t v23 = 4294967292;
LABEL_33:
  uint64_t v10 = (unsigned char *)&kmod_info;
LABEL_24:
  if (v24 >= v10[196]) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v23);
  }
  return v23;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, void *a11)
{
  unsigned int v19 = 0;
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "aclConstraint", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 396);
    return 4294967293;
  }
  if (!a11)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 397);
    return 4294967293;
  }
  if ((a9 != 0) != (a10 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(parameters && parametersCount) || (!parameters && !parametersCount)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 398);
    return 4294967293;
  }
  if (a10 >= 0xB)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount <= 10", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 399);
    return 4294967293;
  }
  uint64_t LengthOfParameters = getLengthOfParameters(a9, a10, &v19);
  if (LengthOfParameters)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == kACMErrorSuccess", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 403);
  }
  else
  {
    uint64_t v15 = 29;
    if (a1 == 32) {
      uint64_t v15 = 33;
    }
    uint64_t v16 = v15 + a4;
    if (a1 == 32) {
      uint64_t v17 = a6;
    }
    else {
      uint64_t v17 = 0;
    }
    *a11 = v16 + v17 + v19;
  }
  return LengthOfParameters;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, uint64_t a8, _DWORD *a9, unsigned int a10, uint64_t a11, unint64_t *a12)
{
  unint64_t v28 = 0;
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "aclConstraint", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 439);
    return 4294967293;
  }
  if ((a9 != 0) != (a10 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(parameters && parametersCount) || (!parameters && !parametersCount)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 440);
    return 4294967293;
  }
  if (a10 >= 0xB)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount <= 10", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 441);
    return 4294967293;
  }
  if (!a11)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 442);
    return 4294967293;
  }
  if (!a12)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 443);
    return 4294967293;
  }
  int v26 = a8;
  SerializedVerifyAclConstraintuint64_t Size = GetSerializedVerifyAclConstraintSize(a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, a6, 0, a8, a9, a10, &v28);
  if (SerializedVerifyAclConstraintSize)
  {
    uint64_t v22 = SerializedVerifyAclConstraintSize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedVerifyAclConstraintSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 447);
    return v22;
  }
  if (*a12 < v28)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 448);
    return 4294967293;
  }
  if (a2)
  {
    *(_OWORD *)a11 = *a2;
  }
  else
  {
    *(void *)a11 = 0;
    *(void *)(a11 + 8) = 0;
  }
  *(_DWORD *)(a11 + 16) = a4;
  memmove((void *)(a11 + 20), a3, a4);
  uint64_t v18 = a4 + 20;
  if (a1 == 32)
  {
    *(_DWORD *)(a11 + v18) = a6;
    uint64_t v19 = a4 + 24;
    memmove((void *)(a11 + v19), a5, a6);
    uint64_t v18 = v19 + a6;
  }
  uint64_t v20 = a11 + v18;
  *(unsigned char *)uint64_t v20 = a7;
  *(_DWORD *)(v20 + 1) = v26;
  unint64_t v27 = v18 + 5;
  uint64_t v21 = serializeParameters((uint64_t)a9, a10, a11, (uint64_t *)&v27);
  uint64_t v22 = v21;
  if (v21) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v21, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 485);
  }
  else {
    *a12 = v27;
  }
  return v22;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, void *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, void *a11, _DWORD *a12)
{
  unint64_t v35 = 0;
  uint64_t v34 = 0;
  unsigned int v33 = 0;
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 513);
LABEL_34:
    uint64_t v29 = 4294967293;
    goto LABEL_47;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 514);
    goto LABEL_34;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "aclConstraint", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 515);
    goto LABEL_34;
  }
  if (!a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "aclConstraintLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 516);
    goto LABEL_34;
  }
  if (!a9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "preflight", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 517);
    goto LABEL_34;
  }
  if (!a10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "maxGlobalCredentialAge", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 518);
    goto LABEL_34;
  }
  if (!a11)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parameters", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 519);
    goto LABEL_34;
  }
  if (!a12)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 520);
    goto LABEL_34;
  }
  if (a3 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 523);
    goto LABEL_34;
  }
  unint64_t v15 = a3;
  *a4 = *(_OWORD *)a2;
  unint64_t v35 = 16;
  if ((a3 & 0xFFFFFFFC) == 0x10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 528);
    goto LABEL_34;
  }
  unint64_t v19 = *(unsigned int *)(a2 + 16);
  unint64_t v35 = 20;
  uint64_t v20 = (void *)acm_mem_alloc_data(v19);
  acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
  if (v20)
  {
    if (v15 - 20 < v19)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= constraintLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 534);
    }
    else
    {
      memmove(v20, (const void *)(a2 + 20), v19);
      unint64_t v21 = v19 + 20;
      unint64_t v35 = v19 + 20;
      unint64_t v32 = a5;
      if (a1 != 32)
      {
        unsigned int v24 = 0;
        LODWORD(v22) = 0;
LABEL_19:
        if (v21 == v15)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint8_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 552);
        }
        else
        {
          BOOL v25 = *(unsigned char *)(a2 + v21) != 0;
          unint64_t v35 = v21 + 1;
          if (v15 - (v21 + 1) > 3)
          {
            unint64_t v31 = v19;
            int v26 = v22;
            size_t v22 = (size_t)v24;
            int v27 = *(_DWORD *)(a2 + v21 + 1);
            unint64_t v35 = v21 + 5;
            uint64_t v28 = deserializeParameters(a2, v15, &v35, &v34, &v33);
            uint64_t v29 = v28;
            if (!v28)
            {
              *unint64_t v32 = v20;
              *a7 = v22;
              *a8 = v26;
              *a6 = v31;
              *a9 = v25;
              *a10 = v27;
              *a11 = v34;
              *a12 = v33;
              return v29;
            }
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v28, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 563);
            unsigned int v24 = (void *)v22;
            LODWORD(v22) = v26;
            unint64_t v19 = v31;
            goto LABEL_45;
          }
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 557);
        }
        goto LABEL_44;
      }
      if (v15 - v21 > 3)
      {
        size_t v22 = *(unsigned int *)(a2 + v21);
        unint64_t v23 = v19 + 24;
        unint64_t v35 = v19 + 24;
        unsigned int v24 = (void *)acm_mem_alloc_data(v22);
        acm_mem_alloc_info("<data>", v24, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
        if (!v24)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "op", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 545);
          uint64_t v29 = 4294967292;
          goto LABEL_45;
        }
        if (v15 - v23 >= v22)
        {
          memmove(v24, (const void *)(a2 + v23), v22);
          unint64_t v21 = v23 + v22;
          unint64_t v35 = v23 + v22;
          goto LABEL_19;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= opLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 546);
LABEL_44:
        uint64_t v29 = 4294967293;
LABEL_45:
        acm_mem_free_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
        acm_mem_free_data((uint64_t)v20, v19);
        if (v24)
        {
          acm_mem_free_info("<data>", v24, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
          acm_mem_free_data((uint64_t)v24, v22);
        }
        goto LABEL_47;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 540);
    }
    unsigned int v24 = 0;
    LODWORD(v22) = 0;
    goto LABEL_44;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "constraint", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 533);
  uint64_t v29 = 4294967292;
LABEL_47:
  if (v34) {
    Util_SafeDeallocParameters(v34, v33);
  }
  return v29;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, void *a9)
{
  unsigned int v13 = 0;
  if (!a2 || !a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "acl && aclLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 601);
    return 4294967293;
  }
  if (!a9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 602);
    return 4294967293;
  }
  if ((a7 != 0) != (a8 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(parameters && parametersCount) || (!parameters && !parametersCount)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 603);
    return 4294967293;
  }
  if (a8 >= 0xB)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount <= 10", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 604);
    return 4294967293;
  }
  uint64_t LengthOfParameters = getLengthOfParameters(a7, a8, &v13);
  if (LengthOfParameters) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == kACMErrorSuccess", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 608);
  }
  else {
    *a9 = a3 + (unint64_t)a5 + v13 + 36;
  }
  return LengthOfParameters;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  unint64_t v24 = 0;
  if (!a2 || !a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "acl && aclLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 634);
    return 4294967293;
  }
  if ((a7 != 0) != (a8 != 0))
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(parameters && parametersCount) || (!parameters && !parametersCount)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 635);
    return 4294967293;
  }
  if (a8 >= 0xB)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount <= 10", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 636);
    return 4294967293;
  }
  if (!a9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 637);
    return 4294967293;
  }
  if (!a10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 638);
    return 4294967293;
  }
  int v16 = a6;
  SerializedProcessAcluint64_t Size = GetSerializedProcessAclSize((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v24);
  if (SerializedProcessAclSize)
  {
    uint64_t v20 = SerializedProcessAclSize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedProcessAclSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 642);
    return v20;
  }
  if (*a10 < v24)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 643);
    return 4294967293;
  }
  if (a1)
  {
    *(_OWORD *)a9 = *a1;
  }
  else
  {
    *(void *)a9 = 0;
    *(void *)(a9 + 8) = 0;
  }
  *(_DWORD *)(a9 + 16) = a3;
  memmove((void *)(a9 + 20), a2, a3);
  *(_DWORD *)(a9 + a3 + 20) = a5;
  uint64_t v18 = a3 + 24;
  if (a5)
  {
    memmove((void *)(a9 + v18), a4, a5);
    v18 += a5;
  }
  *(_DWORD *)(a9 + v18) = v16;
  unint64_t v23 = v18 + 4;
  uint64_t v19 = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v23);
  uint64_t v20 = v19;
  if (v19) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v19, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 677);
  }
  else {
    *a10 = v23;
  }
  return v20;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, void *a4, _DWORD *a5, size_t *a6, _DWORD *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  unint64_t v33 = 0;
  uint64_t v32 = 0;
  unsigned int v31 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 703);
LABEL_35:
    uint64_t v26 = 4294967293;
    goto LABEL_47;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 704);
    goto LABEL_35;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "acl", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 705);
    goto LABEL_35;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "aclLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 706);
    goto LABEL_35;
  }
  if (!a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "operation", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 707);
    goto LABEL_35;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "operationLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 708);
    goto LABEL_35;
  }
  if (!a8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "maxGlobalCredentialAge", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 709);
    goto LABEL_35;
  }
  if (!a9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parameters", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 710);
    goto LABEL_35;
  }
  if (!a10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 711);
    goto LABEL_35;
  }
  if (a2 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 714);
    goto LABEL_35;
  }
  unint64_t v16 = a2;
  *a3 = *(_OWORD *)a1;
  unint64_t v33 = 16;
  if ((a2 & 0xFFFFFFFC) == 0x10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 719);
    goto LABEL_35;
  }
  unint64_t v17 = *(unsigned int *)(a1 + 16);
  unint64_t v33 = 20;
  uint64_t v18 = (void *)acm_mem_alloc_data(v17);
  acm_mem_alloc_info("<data>", v18, v17, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
  if (v18)
  {
    if (v16 - 20 < v17)
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= tmpAclLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 724);
    }
    else
    {
      memmove(v18, (const void *)(a1 + 20), v17);
      unint64_t v33 = v17 + 20;
      if (v16 - (v17 + 20) > 3)
      {
        uint64_t v29 = a4;
        uint64_t v30 = a5;
        size_t v19 = *(unsigned int *)(a1 + v17 + 20);
        unint64_t v20 = v17 + 24;
        unint64_t v33 = v17 + 24;
        if (!v19)
        {
          unint64_t v21 = 0;
          goto LABEL_20;
        }
        unint64_t v21 = (void *)acm_mem_alloc_data(v19);
        acm_mem_alloc_info("<data>", v21, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
        if (!v21)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "op", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 735);
          uint64_t v26 = 4294967292;
          goto LABEL_45;
        }
        if (v16 - v20 >= v19)
        {
          memmove(v21, (const void *)(a1 + v20), v19);
          v20 += v19;
          unint64_t v33 = v20;
LABEL_20:
          if (v16 - v20 > 3)
          {
            int v28 = v19;
            size_t v19 = (size_t)v21;
            size_t v22 = v18;
            unint64_t v23 = a8;
            int v24 = *(_DWORD *)(a1 + v20);
            unint64_t v33 = v20 + 4;
            uint64_t v25 = deserializeParameters(a1, v16, &v33, &v32, &v31);
            uint64_t v26 = v25;
            if (!v25)
            {
              *uint64_t v29 = v22;
              *uint64_t v30 = v17;
              *a6 = v19;
              *a7 = v28;
              *unint64_t v23 = v24;
              *a9 = v32;
              *a10 = v31;
              return v26;
            }
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v25, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 748);
            uint64_t v18 = v22;
            unint64_t v21 = (void *)v19;
            LODWORD(v19) = v28;
            goto LABEL_45;
          }
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 742);
          goto LABEL_44;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= opLen", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 736);
LABEL_44:
        uint64_t v26 = 4294967293;
LABEL_45:
        acm_mem_free_info("<data>", v18, v17, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
        acm_mem_free_data((uint64_t)v18, v17);
        if (v21)
        {
          acm_mem_free_info("<data>", v21, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
          acm_mem_free_data((uint64_t)v21, v19);
        }
        goto LABEL_47;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 729);
    }
    LODWORD(v19) = 0;
    unint64_t v21 = 0;
    goto LABEL_44;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "tmpAcl", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 723);
  uint64_t v26 = 4294967292;
LABEL_47:
  if (v32) {
    Util_SafeDeallocParameters(v32, v31);
  }
  return v26;
}

uint64_t GetSerializedRequirementSize(int *a1, void *a2)
{
  uint64_t v11 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 785);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 786);
    return 4294967293;
  }
  int v4 = *a1;
  if (*a1 > 0x1C) {
    goto LABEL_20;
  }
  if (((1 << v4) & 0x1FFCFF4E) != 0)
  {
    uint64_t v5 = 0;
    *a2 = a1[3] + 16;
    return v5;
  }
  if (((1 << v4) & 0x30) != 0)
  {
    *a2 = 20;
    if (a1[4])
    {
      uint64_t v7 = 0;
      while (1)
      {
        SerializedRequirementuint64_t Size = GetSerializedRequirementSize(*(void *)&a1[2 * v7 + 5], &v11);
        if (SerializedRequirementSize) {
          break;
        }
        *a2 += v11;
        if (++v7 >= (unint64_t)a1[4]) {
          return 0;
        }
      }
      uint64_t v5 = SerializedRequirementSize;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedRequirementSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 822);
      return v5;
    }
    return 0;
  }
  if (v4 != 7)
  {
LABEL_20:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 838);
    return 4294967293;
  }
  *a2 = 24;
  if (!a1[5]) {
    return 0;
  }
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = GetSerializedRequirementSize(*(void *)&a1[2 * v9 + 6], &v11);
    uint64_t v5 = v10;
    if (v10) {
      break;
    }
    *a2 += v11;
    if (++v9 >= (unint64_t)a1[5]) {
      return v5;
    }
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 831);
  return v5;
}

uint64_t SerializeRequirement(int *a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v18 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 858);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 859);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "bufferSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 860);
    return 4294967293;
  }
  SerializedRequirementuint64_t Size = GetSerializedRequirementSize(a1, &v18);
  if (SerializedRequirementSize)
  {
    uint64_t v9 = SerializedRequirementSize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedRequirementSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 864);
    return v9;
  }
  if (v18 > *a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "reqLen <= *bufferSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 865);
    return 4294967293;
  }
  *(_OWORD *)a2 = *(_OWORD *)a1;
  int v7 = *a1;
  if (*a1 > 0x1C)
  {
LABEL_23:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 926);
    return 4294967293;
  }
  if (((1 << v7) & 0x1FFCFF4E) == 0)
  {
    if (((1 << v7) & 0x30) != 0)
    {
      *(_DWORD *)(a2 + 16) = a1[4];
      if (!a1[4])
      {
        uint64_t v8 = 20;
        goto LABEL_9;
      }
      uint64_t v11 = 0;
      uint64_t v8 = 20;
      while (1)
      {
        uint64_t v17 = *a3 - v8;
        uint64_t v12 = SerializeRequirement(*(void *)&a1[2 * v11 + 5], a2 + v8, &v17);
        if (v12) {
          break;
        }
        v8 += v17;
        if (++v11 >= (unint64_t)a1[4]) {
          goto LABEL_9;
        }
      }
      uint64_t v9 = v12;
      uint64_t v15 = (int)v12;
      int v16 = 908;
LABEL_34:
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v15, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v16);
      return v9;
    }
    if (v7 == 7)
    {
      *(void *)(a2 + 16) = *((void *)a1 + 2);
      if (!a1[5])
      {
        uint64_t v8 = 24;
        goto LABEL_9;
      }
      uint64_t v13 = 0;
      uint64_t v8 = 24;
      while (1)
      {
        uint64_t v17 = *a3 - v8;
        uint64_t v14 = SerializeRequirement(*(void *)&a1[2 * v13 + 6], a2 + v8, &v17);
        if (v14) {
          break;
        }
        v8 += v17;
        if (++v13 >= (unint64_t)a1[5]) {
          goto LABEL_9;
        }
      }
      uint64_t v9 = v14;
      uint64_t v15 = (int)v14;
      int v16 = 920;
      goto LABEL_34;
    }
    goto LABEL_23;
  }
  memmove((void *)(a2 + 16), a1 + 4, a1[3]);
  uint64_t v8 = a1[3] + 16;
LABEL_9:
  uint64_t v9 = 0;
  *a3 = v8;
  return v9;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  __dst = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 950);
    return 4294967293;
  }
  if (a2 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMRequirement)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 951);
    goto LABEL_34;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 952);
    goto LABEL_34;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "consumedBytes", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 953);
    goto LABEL_34;
  }
  unsigned int v8 = *a1;
  if (v8 > 0x1C)
  {
LABEL_33:
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1057);
LABEL_34:
    uint64_t v11 = 4294967293;
    goto LABEL_35;
  }
  if (((1 << v8) & 0x1FFCFF4E) != 0)
  {
    size_t v9 = a1[3] + 16;
    if (v9 <= a2)
    {
      uint64_t v10 = Util_AllocRequirement(v8, 0, &__dst);
      if (v10)
      {
        uint64_t v11 = v10;
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 982);
        goto LABEL_35;
      }
      if (__dst)
      {
        memmove(__dst, a1, v9);
LABEL_11:
        uint64_t v11 = 0;
        *a4 = v9;
        *a3 = __dst;
        return v11;
      }
      int v29 = 983;
      goto LABEL_48;
    }
    int v28 = 980;
    goto LABEL_45;
  }
  if (((1 << v8) & 0x30) == 0)
  {
    if (v8 == 7)
    {
      uint64_t v19 = a1[5];
      if (8 * v19 + 24 <= a2)
      {
        uint64_t v20 = Util_AllocRequirement(7, v19, &__dst);
        if (!v20)
        {
          unint64_t v21 = __dst;
          if (__dst)
          {
            if (*((_DWORD *)__dst + 3) == 88)
            {
              uint64_t v22 = *((void *)a1 + 2);
              *(_OWORD *)__dst = *(_OWORD *)a1;
              int v21[2] = v22;
              *((_DWORD *)v21 + 3) = 88;
              if (!a1[5])
              {
                size_t v9 = 24;
                goto LABEL_11;
              }
              uint64_t v23 = 0;
              size_t v9 = 24;
              while (1)
              {
                uint64_t v33 = 0;
                uint64_t v34 = 0;
                uint64_t v24 = DeserializeRequirement((char *)a1 + v9, a2 - v9, &v34, &v33);
                if (v24) {
                  break;
                }
                *((void *)__dst + v23 + 3) = v34;
                v9 += v33;
                if (++v23 >= (unint64_t)a1[5]) {
                  goto LABEL_11;
                }
              }
              uint64_t v25 = v24;
              uint64_t v26 = (int)v24;
              int v27 = 1050;
LABEL_50:
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v26, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v27);
              uint64_t v11 = v25;
              goto LABEL_35;
            }
            IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "req->dataLength == sizeof(ACMRequirementDataKofN)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1037);
            goto LABEL_60;
          }
          int v29 = 1031;
LABEL_48:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "req", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v29);
          uint64_t v11 = 4294967292;
          goto LABEL_35;
        }
        uint64_t v30 = v20;
        uint64_t v31 = (int)v20;
        int v32 = 1030;
LABEL_57:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v31, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v32);
        uint64_t v11 = v30;
        goto LABEL_35;
      }
      int v28 = 1027;
LABEL_45:
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= reqSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v28);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v13 = a1[4];
  if (8 * v13 + 20 > a2)
  {
    int v28 = 994;
    goto LABEL_45;
  }
  uint64_t v14 = Util_AllocRequirement(v8, v13, &__dst);
  if (v14)
  {
    uint64_t v30 = v14;
    uint64_t v31 = (int)v14;
    int v32 = 997;
    goto LABEL_57;
  }
  uint64_t v15 = __dst;
  if (!__dst)
  {
    int v29 = 998;
    goto LABEL_48;
  }
  if (*((_DWORD *)__dst + 3) == 84)
  {
    unsigned int v16 = a1[4];
    *(_OWORD *)__dst = *(_OWORD *)a1;
    v15[3] = 84;
    v15[4] = v16;
    if (!a1[4])
    {
      size_t v9 = 20;
      goto LABEL_11;
    }
    uint64_t v17 = 0;
    size_t v9 = 20;
    while (1)
    {
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v18 = DeserializeRequirement((char *)a1 + v9, a2 - v9, &v34, &v33);
      if (v18) {
        break;
      }
      *(void *)((char *)__dst + 8 * v17 + 20) = v34;
      v9 += v33;
      if (++v17 >= (unint64_t)a1[4]) {
        goto LABEL_11;
      }
    }
    uint64_t v25 = v18;
    uint64_t v26 = (int)v18;
    int v27 = 1017;
    goto LABEL_50;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "req->dataLength == sizeof(ACMRequirementDataAnd)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1004);
LABEL_60:
  uint64_t v11 = 4294967291;
LABEL_35:
  if (__dst) {
    Util_DeallocRequirement((int *)__dst);
  }
  return v11;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, void *a2)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1082);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1083);
    return 4294967293;
  }
  if (*a1 > 0x17u || ((1 << *a1) & 0xFFF7FE) == 0)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1112);
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = a1[7] + 32;
  return result;
}

uint64_t SerializeCredential(_DWORD *a1, void *a2, unint64_t *a3)
{
  unint64_t v9 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1132);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1133);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1134);
    return 4294967293;
  }
  SerializedCredentialuint64_t Size = GetSerializedCredentialSize(a1, &v9);
  if (SerializedCredentialSize)
  {
    uint64_t v7 = SerializedCredentialSize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedCredentialSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1138);
    return v7;
  }
  if (v9 > *a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credLen <= *outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1139);
    return 4294967293;
  }
  if (*a1 > 0x17u || ((1 << *a1) & 0xFFF7FE) == 0)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1169);
    return 4294967293;
  }
  memmove(a2, a1, a1[7] + 32);
  uint64_t v7 = 0;
  *a3 = a1[7] + 32;
  return v7;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, void *a4)
{
  __dst = 0;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (a2 <= 0x1F)
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMCredential)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1197);
        }
        else
        {
          unsigned int v8 = *a1;
          uint64_t v9 = a1[7];
          switch(*a1)
          {
            case 1u:
              __asm { BTI             j; jumptable 0000000000014668 case 1 }
              if (v9 == 28) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataPasscodeValidated)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1232);
              break;
            case 2u:
              __asm { BTI             j; jumptable 0000000000014668 case 2 }
              if (v9 == 136) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataPassphraseEntered)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1220);
              break;
            case 3u:
              __asm { BTI             j; jumptable 0000000000014668 case 3 }
              if (v9 == 305) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataBiometryMatched)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1228);
              break;
            case 4u:
            case 5u:
            case 6u:
            case 8u:
            case 0xEu:
            case 0x10u:
            case 0x13u:
            case 0x16u:
            case 0x17u:
              __asm { BTI             j; jumptable 0000000000014668 cases 4-6,8,14,16,19,22,23 }
              if (!v9) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == 0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1212);
              break;
            case 7u:
              __asm { BTI             j; jumptable 0000000000014668 case 7 }
              if (v9 == 56) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataUserOutputDisplayed)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1224);
              break;
            case 9u:
              __asm { BTI             j; jumptable 0000000000014668 case 9 }
              if (v9 == 24) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataContinuityUnlock)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1240);
              break;
            case 0xAu:
              __asm { BTI             j; jumptable 0000000000014668 case 10 }
              if (v9 == 52) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataPasscodeValidated2)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1236);
              break;
            case 0xCu:
            case 0xFu:
              __asm { BTI             j; jumptable 0000000000014668 cases 12,15 }
              if (v9 == 8) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataKextDenyList)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1245);
              break;
            case 0xDu:
              __asm { BTI             j; jumptable 0000000000014668 case 13 }
              if (v9 == 132) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataPassphraseExtractable)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1216);
              break;
            case 0x11u:
              __asm { BTI             j; jumptable 0000000000014668 case 17 }
              if (v9 == 81) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataSecureIntent)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1249);
              break;
            case 0x12u:
              __asm { BTI             j; jumptable 0000000000014668 case 18 }
              if (v9 == 20) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataBiometryMatchAttempted)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1253);
              break;
            case 0x14u:
              __asm { BTI             j; jumptable 0000000000014668 case 20 }
              if (v9 == 32) {
                goto LABEL_7;
              }
              IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataAP)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1257);
              break;
            case 0x15u:
              __asm { BTI             j; jumptable 0000000000014668 case 21 }
              if (v9 != 132)
              {
                IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataLength == sizeof(ACMCredentialDataSignature)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1261);
                break;
              }
LABEL_7:
              uint64_t v14 = Util_AllocCredential(*a1, &__dst);
              if (v14)
              {
                uint64_t v15 = v14;
                IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v14, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1271);
                goto LABEL_17;
              }
              if (!__dst)
              {
                IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "cred", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1272);
                uint64_t v15 = 4294967292;
                goto LABEL_17;
              }
              if (*((_DWORD *)__dst + 1) >= 4u)
              {
                IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "cred->domain == kACMDomainUnknown || cred->domain == kACMDomainUserMode || cred->domain == kACMDomainKernelMode || cred->domain == kACMDomainSecureEnclave", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1275);
              }
              else if (*((_DWORD *)__dst + 2) >= 0x51u)
              {
                IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "cred->numCredSets <= 80", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1276);
              }
              else if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0)
              {
                if (v9 + 32 <= a2)
                {
                  memmove(__dst, a1, v9 + 32);
                  uint64_t v15 = 0;
                  *a3 = __dst;
                  *a4 = v9 + 32;
                  return v15;
                }
                IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= credSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1301);
              }
              else
              {
                int v17 = 1307;
LABEL_46:
                IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v17);
              }
              break;
            default:
              __asm { BTI             j; jumptable 0000000000014668 default case, case 11 }
              int v17 = 1265;
              goto LABEL_46;
          }
        }
      }
      else
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "consumedBytes", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1196);
      }
    }
    else
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1195);
    }
    uint64_t v15 = 4294967293;
LABEL_17:
    if (__dst) {
      Util_DeallocCredential(__dst);
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1194);
    return 4294967293;
  }
  return v15;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  __dst = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1333);
    return 4294967293;
  }
  if (a2)
  {
    uint64_t v4 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if (v4)
    {
      uint64_t v5 = v4;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v4, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1338);
    }
    else
    {
      if (__dst)
      {
        memmove(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
        uint64_t v5 = 0;
        *a2 = __dst;
        return v5;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "cred", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1339);
      uint64_t v5 = 4294967292;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "copy", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1334);
    uint64_t v5 = 4294967293;
  }
  if (__dst) {
    Util_DeallocCredential(__dst);
  }
  return v5;
}

uint64_t CompareCredentials(char *__s1, char *__s2, BOOL *a3)
{
  if (!__s1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential1", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1380);
    return 4294967293;
  }
  if (!__s2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential2", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1381);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "equal", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1382);
    return 4294967293;
  }
  if (*(_DWORD *)__s1 == *(_DWORD *)__s2 && (uint64_t v6 = *((unsigned int *)__s1 + 7), v6 == *((_DWORD *)__s2 + 7)))
  {
    switch(*(_DWORD *)__s1)
    {
      case 1:
        __asm { BTI             j; jumptable 0000000000014DA0 case 1 }
        if (memcmp(__s1, __s2, 0x20uLL)) {
          goto LABEL_33;
        }
        uint64_t v14 = __s1 + 44;
        uint64_t v15 = __s2 + 44;
        goto LABEL_24;
      case 2:
        __asm { BTI             j; jumptable 0000000000014DA0 case 2 }
        if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8)) {
          goto LABEL_33;
        }
        size_t v16 = *((unsigned int *)__s1 + 9);
        if (v16 != *((_DWORD *)__s2 + 9)) {
          goto LABEL_33;
        }
        int v17 = __s2 + 40;
        uint64_t v18 = __s1 + 40;
        goto LABEL_29;
      case 3:
        __asm { BTI             j; jumptable 0000000000014DA0 case 3 }
        if (memcmp(__s1, __s2, 0x20uLL)) {
          goto LABEL_33;
        }
        uint64_t v14 = __s1 + 104;
        uint64_t v15 = __s2 + 104;
        goto LABEL_24;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xC:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
      case 0x16:
      case 0x17:
        __asm { BTI             j; jumptable 0000000000014DA0 cases 4-6,8,12,14-19,22,23 }
        int v11 = memcmp(__s1, __s2, v6 + 32);
        uint64_t result = 0;
        BOOL isNullOrEqualMem2 = v11 == 0;
        goto LABEL_37;
      case 7:
        __asm { BTI             j; jumptable 0000000000014DA0 case 7 }
        if (memcmp(__s1, __s2, 0x20uLL)
          || !_isNullOrEqualMem2((unint64_t)(__s1 + 32), 0x20uLL, (unint64_t)(__s2 + 32), 32))
        {
          goto LABEL_33;
        }
        uint64_t v14 = __s1 + 64;
        uint64_t v15 = __s2 + 64;
        size_t v19 = 24;
        uint64_t v20 = 24;
        goto LABEL_35;
      case 9:
        __asm { BTI             j; jumptable 0000000000014DA0 case 9 }
        if (memcmp(__s1, __s2, 0x20uLL)) {
          goto LABEL_33;
        }
        uint64_t v14 = __s1 + 40;
        uint64_t v15 = __s2 + 40;
        goto LABEL_24;
      case 0xA:
        __asm { BTI             j; jumptable 0000000000014DA0 case 10 }
        if (memcmp(__s1, __s2, 0x20uLL)
          || !_isNullOrEqualMem2((unint64_t)(__s1 + 36), 0x10uLL, (unint64_t)(__s2 + 36), 16))
        {
          goto LABEL_33;
        }
        uint64_t v14 = __s1 + 52;
        uint64_t v15 = __s2 + 52;
LABEL_24:
        size_t v19 = 16;
        uint64_t v20 = 16;
        goto LABEL_35;
      case 0xD:
        __asm { BTI             j; jumptable 0000000000014DA0 case 13 }
        size_t v16 = *((unsigned int *)__s1 + 8);
        if (v16 != *((_DWORD *)__s2 + 8)) {
          goto LABEL_33;
        }
        int v17 = __s2 + 36;
        uint64_t v18 = __s1 + 36;
LABEL_29:
        BOOL isNullOrEqualMem2 = memcmp(v18, v17, v16) == 0;
        goto LABEL_36;
      case 0x14:
        __asm { BTI             j; jumptable 0000000000014DA0 case 20 }
        if (memcmp(__s1, __s2, 0x20uLL)) {
          goto LABEL_33;
        }
        uint64_t v15 = __s2 + 32;
        uint64_t v14 = __s1 + 32;
        size_t v19 = 32;
        uint64_t v20 = 32;
        goto LABEL_35;
      case 0x15:
        __asm { BTI             j; jumptable 0000000000014DA0 case 21 }
        if (!memcmp(__s1, __s2, 0x20uLL))
        {
          uint64_t v14 = __s1 + 36;
          uint64_t v15 = __s2 + 36;
          size_t v19 = 128;
          uint64_t v20 = 128;
LABEL_35:
          BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)v14, v19, (unint64_t)v15, v20);
        }
        else
        {
LABEL_33:
          BOOL isNullOrEqualMem2 = 0;
        }
LABEL_36:
        uint64_t result = 0;
LABEL_37:
        *a3 = isNullOrEqualMem2;
        break;
      default:
        __asm { BTI             j; jumptable 0000000000014DA0 default case, case 11 }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1489);
        return 4294967293;
    }
  }
  else
  {
    uint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  if (!(__s1 | __s2)) {
    return 1;
  }
  BOOL result = 0;
  BOOL v6 = __s1 == 0;
  if (__s2)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = __s1 == 0;
  }
  if (v7 && !v6) {
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  }
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  uint64_t v8 = 0;
  if (!a1 && a3 != 2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle || scope == kACMScopeGlobal", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1512);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1513);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1514);
    return 4294967293;
  }
  SerializedCredentialuint64_t Size = GetSerializedCredentialSize(a2, &v8);
  uint64_t v6 = SerializedCredentialSize;
  if (SerializedCredentialSize) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedCredentialSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1517);
  }
  else {
    *a4 = v8 + 20;
  }
  return v6;
}

uint64_t SerializeAddCredential(_OWORD *a1, _DWORD *a2, int a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v16 = 0;
  if (!a1 && a3 != 2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle || scope == kACMScopeGlobal", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1538);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1539);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1540);
    return 4294967293;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1541);
    return 4294967293;
  }
  uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &v16);
  if (SerializedAddCredentialSize)
  {
    uint64_t v12 = SerializedAddCredentialSize;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedAddCredentialSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1544);
    return v12;
  }
  if (*a5 < v16)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1545);
    return 4294967293;
  }
  if (a1)
  {
    *(_OWORD *)a4 = *a1;
  }
  else
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
  }
  uint64_t v15 = *a5 - 16;
  uint64_t v11 = SerializeCredential(a2, (void *)(a4 + 16), (unint64_t *)&v15);
  uint64_t v12 = v11;
  if (v11)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1559);
  }
  else
  {
    unint64_t v13 = v15;
    *(_DWORD *)(v15 + a4 + 16) = a3;
    *a5 = v13 + 20;
  }
  return v12;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  *(void *)uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1584);
    return 4294967293;
  }
  if (a2 <= 0x33)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(ACMCredential) + sizeof(ACMScope)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1585);
  }
  else if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        *a3 = *(_OWORD *)a1;
        uint64_t v9 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)v12, &v13);
        if (v9)
        {
          uint64_t v10 = v9;
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v9, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1594);
          goto LABEL_18;
        }
        if (a2 - (v13 + 16) > 3)
        {
          uint64_t v10 = 0;
          *a5 = *(_DWORD *)(a1 + v13 + 16);
          *a4 = *(void *)v12;
          return v10;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size - offset >= sizeof(ACMScope)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1597);
      }
      else
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "scope", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1588);
      }
    }
    else
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1587);
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1586);
  }
  uint64_t v10 = 4294967293;
LABEL_18:
  if (*(void *)v12) {
    Util_DeallocCredential(*(_DWORD **)v12);
  }
  return v10;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (!a1 || !a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer && type", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1618);
    return 4294967293;
  }
  if (a2 <= 0x33)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(ACMCredential) + sizeof(ACMScope)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1619);
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = *(_DWORD *)(a1 + 16);
  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize(a1, a2, a3, a4);
  uint64_t v5 = SerializedAddCredentialSize;
  if (SerializedAddCredentialSize) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedAddCredentialSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1636);
  }
  return v5;
}

uint64_t SerializeRemoveCredential(_OWORD *a1, _DWORD *a2, int a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v5 = SerializeAddCredential(a1, a2, a3, a4, a5);
  uint64_t v6 = v5;
  if (v5) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v5, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1652);
  }
  return v6;
}

uint64_t DeserializeRemoveCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  uint64_t v5 = DeserializeAddCredential(a1, a2, a3, a4, a5);
  uint64_t v6 = v5;
  if (v5) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v5, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1668);
  }
  return v6;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize(a1, a2, a3, a4);
  uint64_t v5 = SerializedAddCredentialSize;
  if (SerializedAddCredentialSize) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)SerializedAddCredentialSize, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1684);
  }
  return v5;
}

uint64_t SerializeReplacePassphraseCredential(_OWORD *a1, _DWORD *a2, int a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v5 = SerializeAddCredential(a1, a2, a3, a4, a5);
  uint64_t v6 = v5;
  if (v5) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v5, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1700);
  }
  return v6;
}

uint64_t DeserializeReplacePassphraseCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  uint64_t v5 = DeserializeAddCredential(a1, a2, a3, a4, a5);
  uint64_t v6 = v5;
  if (v5) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v5, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1716);
  }
  return v6;
}

uint64_t SerializeCredentialList(_DWORD **a1, unsigned int a2, unsigned int *a3, void *a4)
{
  uint64_t v6 = a1;
  uint64_t v13 = 0;
  if (!a1 && a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialList || (count == 0)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1732);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1733);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1734);
    return 4294967293;
  }
  *a3 = a2;
  if (a2)
  {
    uint64_t v7 = a2;
    uint64_t v8 = 4;
    while (1)
    {
      uint64_t v9 = *v6;
      if (!*v6)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialList[i]", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1740);
        return 4294967293;
      }
      uint64_t v13 = *a4 - v8;
      uint64_t v10 = SerializeCredential(v9, (char *)a3 + v8, (unint64_t *)&v13);
      if (v10) {
        break;
      }
      v8 += v13;
      ++v6;
      if (!--v7) {
        goto LABEL_12;
      }
    }
    uint64_t v11 = v10;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1743);
  }
  else
  {
    uint64_t v8 = 4;
LABEL_12:
    uint64_t v11 = 0;
    *a4 = v8;
  }
  return v11;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1767);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialList", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1768);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "count", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1769);
    return 4294967293;
  }
  uint64_t v7 = *a1;
  if (v7 >= 0x3E9)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credCount <= 1000", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1774);
    return 4294967293;
  }
  if (v7)
  {
    uint64_t v9 = (char *)IOMallocTypeVarImpl();
    acm_mem_alloc_info("array of ACMCredentialRef", v9, 8 * v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 4;
      while (1)
      {
        uint64_t v12 = DeserializeCredential((unsigned int *)((char *)a1 + v11), a2 - v11, (void **)&v9[v10], &v15);
        if (v12) {
          break;
        }
        v11 += v15;
        v10 += 8;
        if (8 * v7 == v10) {
          goto LABEL_12;
        }
      }
      uint64_t v13 = v12;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v12, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1783);
      DeallocCredentialList((_DWORD **)v9, v7);
    }
    else
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "list", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1779);
      return 4294967292;
    }
  }
  else
  {
    uint64_t v9 = 0;
LABEL_12:
    uint64_t v13 = 0;
    *a4 = v7;
    *a3 = v9;
  }
  return v13;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v4 = a1;
      uint64_t v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          void *v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMCredentialRef", a1, 8 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    IOFreeTypeVarImpl();
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialList", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1807);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t result = 0;
    *a3 = 20;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1830);
    return 4294967293;
  }
  return result;
}

uint64_t SerializeGetContextProperty(_OWORD *a1, int a2, uint64_t a3, void *a4)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1847);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1848);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1849);
    return 4294967293;
  }
  if (*a4 <= 0x13uLL)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1854);
    return 4294967293;
  }
  uint64_t result = 0;
  *(_OWORD *)a3 = *a1;
  *(_DWORD *)(a3 + 16) = a2;
  *a4 = 20;
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1879);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1880);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "property", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1881);
    return 4294967293;
  }
  if (a2 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1884);
    return 4294967293;
  }
  *a3 = *(_OWORD *)a1;
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0x10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "(size - offset) >= sizeof(ACMContextProperty)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1889);
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = *(_DWORD *)(a1 + 16);
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t result = 0;
    *a2 = 16;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1904);
    return 4294967293;
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_Serialize(_OWORD *a1, _OWORD *a2, void *a3)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1922);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1923);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1924);
    return 4294967293;
  }
  if (*a3 <= 0xFuLL)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1929);
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = *a1;
  *a3 = 16;
  return result;
}

uint64_t LibSer_GetAclAuthMethod_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1949);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1950);
    return 4294967293;
  }
  if (a2 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1953);
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = *a1;
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    uint64_t result = 0;
    *a4 = 24;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1971);
    return 4294967293;
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_Serialize(_OWORD *a1, int a2, int a3, uint64_t a4, void *a5)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1989);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1990);
    return 4294967293;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1991);
    return 4294967293;
  }
  if (*a5 <= 0x17uLL)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 1996);
    return 4294967293;
  }
  uint64_t result = 0;
  *(_OWORD *)a4 = *a1;
  *(_DWORD *)(a4 + 16) = a2;
  *(_DWORD *)(a4 + 20) = a3;
  *a5 = 24;
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, _DWORD *a5)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2025);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2026);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialType", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2027);
    return 4294967293;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialProperty", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2028);
    return 4294967293;
  }
  if (a2 <= 0x17)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(ACMCredentialType) + sizeof(ACMCredentialProperty)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2031);
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = *(_OWORD *)a1;
  *a4 = *(_DWORD *)(a1 + 16);
  *a5 = *(_DWORD *)(a1 + 20);
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(void *a1)
{
  if (a1)
  {
    uint64_t result = 0;
    *a1 = 8;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2060);
    return 4294967293;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, void *a4)
{
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2079);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2080);
    return 4294967293;
  }
  if (*a4 <= 7uLL)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2085);
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = a1;
  a3[1] = a2;
  *a4 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2112);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialType", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2113);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialProperty", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2114);
    return 4294967293;
  }
  if (a2 <= 7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2119);
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = *a1;
  *a4 = a1[1];
  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    uint64_t result = 0;
    *a4 = 24;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2143);
    return 4294967293;
  }
  return result;
}

uint64_t LibSer_RemoveCredentialByType_Serialize(_OWORD *a1, int a2, int a3, uint64_t a4, void *a5)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2161);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2162);
    return 4294967293;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2163);
    return 4294967293;
  }
  if (*a5 <= 0x17uLL)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2168);
    return 4294967293;
  }
  uint64_t result = 0;
  *(_OWORD *)a4 = *a1;
  *(_DWORD *)(a4 + 16) = a2;
  *(_DWORD *)(a4 + 20) = a3;
  *a5 = 24;
  return result;
}

uint64_t LibSer_RemoveCredentialByType_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, _DWORD *a5)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2197);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2198);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credentialType", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2199);
    return 4294967293;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "scope", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2200);
    return 4294967293;
  }
  if (a2 <= 0x17)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(ACMCredentialType) + sizeof(ACMScope)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2203);
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = *(_OWORD *)a1;
  *a4 = *(_DWORD *)(a1 + 16);
  *a5 = *(_DWORD *)(a1 + 20);
  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t result = 0;
    *a2 = 16;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2231);
    return 4294967293;
  }
  return result;
}

uint64_t LibSer_DeleteContext_Serialize(_OWORD *a1, _OWORD *a2, void *a3)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2249);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2250);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2251);
    return 4294967293;
  }
  if (*a3 <= 0xFuLL)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2256);
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = *a1;
  *a3 = 16;
  return result;
}

uint64_t LibSer_DeleteContext_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2277);
    return 4294967293;
  }
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2278);
    return 4294967293;
  }
  if (a2 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2281);
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = *a1;
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2302);
    return 4294967293;
  }
  if (a2 <= 0x13)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(ACMContextDataType)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2303);
    return 4294967293;
  }
  if (a3) {
    *a3 = *(_OWORD *)a1;
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = *(_DWORD *)(a1 + 16);
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v9 = 0;
  if (a4)
  {
    uint64_t LengthOfParameters = getLengthOfParameters(a2, a3, &v9);
    uint64_t v7 = LengthOfParameters;
    if (LengthOfParameters) {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)LengthOfParameters, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2335);
    }
    else {
      *a4 = a1 + v9 + 28;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2332);
    return 4294967291;
  }
  return v7;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  size_t v21 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2355);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataType != kACMContextDataTypeUnknown", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2356);
    return 4294967293;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2357);
    return 4294967293;
  }
  if (!a8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2358);
    return 4294967293;
  }
  uint64_t Size = LibSer_StorageSetData_GetSize(a4, a5, a6, &v21);
  if (Size)
  {
    uint64_t v18 = Size;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Size, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2362);
    return v18;
  }
  if (*a8 < v21)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2363);
    return 4294967293;
  }
  *(_OWORD *)a7 = *a1;
  *(_DWORD *)(a7 + 16) = a2;
  *(_DWORD *)(a7 + 20) = a4;
  memmove((void *)(a7 + 24), a3, a4);
  size_t v20 = a4 + 24;
  uint64_t v17 = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v20);
  uint64_t v18 = v17;
  if (v17) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v17, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2384);
  }
  else {
    *a8 = v20;
  }
  return v18;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2402);
    return 4294967293;
  }
  if (!a6 || !a3 || !a4 || !a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle && dataType && data && dataSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2403);
    return 4294967293;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parameters", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2404);
    return 4294967293;
  }
  if (!a8)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "parametersCount", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2405);
    return 4294967293;
  }
  if (a2 <= 0x17)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(ACMContextDataType) + sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2408);
    return 4294967293;
  }
  *a3 = *(_OWORD *)a1;
  *a4 = *(_DWORD *)(a1 + 16);
  uint64_t v8 = *(unsigned int *)(a1 + 20);
  unint64_t v13 = 24;
  *a6 = v8;
  if (v8)
  {
    unint64_t v9 = v8 + 24;
    if (v9 <= a2)
    {
      *a5 = a1 + 24;
      unint64_t v13 = v9;
      goto LABEL_13;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "offset + *dataSize <= size", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2425);
    return 4294967293;
  }
  *a5 = 0;
LABEL_13:
  uint64_t v10 = deserializeParameters(a1, a2, &v13, a7, a8);
  uint64_t v11 = v10;
  if (v10) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2434);
  }
  return v11;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v7 = 0;
  if (a3)
  {
    uint64_t LengthOfParameters = getLengthOfParameters(a1, a2, &v7);
    uint64_t v5 = LengthOfParameters;
    if (LengthOfParameters) {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)LengthOfParameters, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2455);
    }
    else {
      *a3 = v7 + 25;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2452);
    return 4294967291;
  }
  return v5;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, unint64_t *a7)
{
  unint64_t v19 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2475);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "dataType != kACMContextDataTypeUnknown", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2476);
    return 4294967293;
  }
  if (!a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2477);
    return 4294967293;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2478);
    return 4294967293;
  }
  uint64_t Size = LibSer_StorageGetData_GetSize(a4, a5, &v19);
  if (Size)
  {
    uint64_t v16 = Size;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Size, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2482);
    return v16;
  }
  if (*a7 < v19)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2483);
    return 4294967293;
  }
  *(_OWORD *)a6 = *a1;
  *(_DWORD *)(a6 + 16) = a2;
  *(unsigned char *)(a6 + 20) = a3;
  unint64_t v18 = 21;
  uint64_t v15 = serializeParameters((uint64_t)a4, a5, a6, (uint64_t *)&v18);
  uint64_t v16 = v15;
  if (v15) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v15, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2499);
  }
  else {
    *a7 = v18;
  }
  return v16;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, void *a6, _DWORD *a7)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2517);
    return 4294967293;
  }
  if (!a3 || !a4 || !a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle && dataType && getSizeOnly", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2518);
    return 4294967293;
  }
  if (a2 <= 0x14)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(ACMContextDataType) + sizeof(uint8_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2521);
    return 4294967293;
  }
  *a3 = *(_OWORD *)a1;
  *a4 = *(_DWORD *)(a1 + 16);
  *a5 = *(unsigned char *)(a1 + 20) != 0;
  unint64_t v10 = 21;
  uint64_t v7 = deserializeParameters(a1, a2, &v10, a6, a7);
  uint64_t v8 = v7;
  if (v7) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v7, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2538);
  }
  return v8;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v7 = 0;
  if (a3)
  {
    uint64_t LengthOfParameters = getLengthOfParameters(a1, a2, &v7);
    uint64_t v5 = LengthOfParameters;
    if (LengthOfParameters) {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)LengthOfParameters, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2554);
    }
    else {
      *a3 = v7 + 20;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2551);
    return 4294967291;
  }
  return v5;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, unint64_t *a5)
{
  unint64_t v15 = 0;
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2567);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2568);
    return 4294967293;
  }
  if (!a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2569);
    return 4294967293;
  }
  uint64_t Size = LibSer_GetUnlockSecret_GetSize(a2, a3, &v15);
  if (Size)
  {
    uint64_t v12 = Size;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Size, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2573);
    return v12;
  }
  if (*a5 < v15)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2574);
    return 4294967293;
  }
  *a4 = *a1;
  unint64_t v14 = 16;
  uint64_t v11 = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, (uint64_t *)&v14);
  uint64_t v12 = v11;
  if (v11) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2582);
  }
  else {
    *a5 = v14;
  }
  return v12;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2594);
    return 4294967293;
  }
  if (!a3 || !a4 || !a5)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle && parameters && parametersCount", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2595);
    return 4294967293;
  }
  if (a2 <= 0xF)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2598);
    return 4294967293;
  }
  *a3 = *a1;
  unint64_t v8 = 16;
  uint64_t v5 = deserializeParameters((uint64_t)a1, a2, &v8, a4, a5);
  uint64_t v6 = v5;
  if (v5) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v5, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2606);
  }
  return v6;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t result = 0;
    *a2 = a1 + 1;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2616);
    return 4294967291;
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __len, char a3, unsigned char *a4, void *a5)
{
  if (__src && __len)
  {
    if (a4 && a5)
    {
      size_t v6 = __len + 1;
      if (*a5 >= __len + 1)
      {
        *a4 = a3;
        memmove(a4 + 1, __src, __len);
        uint64_t result = 0;
        *a5 = v6;
        return result;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2634);
    }
    else
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer && outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2629);
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "unlockSecret && unlockSecretSize > 0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2628);
  }
  return 4294967293;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(unsigned char *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  if (!a5 || !a1 || !a3 || !a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer && unlockSecret && unlockSecretSize && unlockSecretType", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2655);
    return 4294967293;
  }
  if (!a2)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMUnlockSecretType)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2658);
    return 4294967293;
  }
  uint64_t result = 0;
  *a5 = *a1;
  *a3 = a1 + 1;
  *a4 = a2 - 1;
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v9 = 0;
  if (a4)
  {
    uint64_t LengthOfParameters = getLengthOfParameters(a2, a3, &v9);
    uint64_t v7 = LengthOfParameters;
    if (LengthOfParameters) {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)LengthOfParameters, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2684);
    }
    else {
      *a4 = a1 + v9 + 24;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2681);
    return 4294967291;
  }
  return v7;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, unint64_t *a7)
{
  unint64_t v21 = 0;
  if (!a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2697);
    return 4294967293;
  }
  if (!a7)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2698);
    return 4294967293;
  }
  uint64_t Size = LibSer_SEPControl_GetSize(a5, a2, a3, &v21);
  if (Size)
  {
    uint64_t v16 = Size;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)Size, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2702);
    return v16;
  }
  if (*a7 < v21)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2703);
    return 4294967293;
  }
  if (a1)
  {
    *(_OWORD *)a6 = *a1;
  }
  else
  {
    *(void *)a6 = 0;
    *(void *)(a6 + 8) = 0;
  }
  uint64_t v20 = 16;
  uint64_t v15 = serializeParameters((uint64_t)a2, a3, a6, &v20);
  uint64_t v16 = v15;
  if (v15)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v15, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2715);
  }
  else
  {
    uint64_t v17 = v20;
    *(_DWORD *)(a6 + v20) = a5;
    uint64_t v18 = v17 + 4;
    uint64_t v20 = v17 + 4;
    memmove((void *)(a6 + v17 + 4), a4, a5);
    *a7 = v18 + a5;
  }
  return v16;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5, unint64_t *a6, void *a7)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2736);
    return 4294967293;
  }
  if (!a7 || !a3 || !a4 || !a5 || !a6)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "handle && parameters && parametersCount && command && commandSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2737);
    return 4294967293;
  }
  if (a2 <= 0x17)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(ACMHandle) + sizeof(uint32_t) + sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2740);
    return 4294967293;
  }
  *a3 = *a1;
  unint64_t v14 = 16;
  uint64_t v10 = deserializeParameters((uint64_t)a1, a2, &v14, a4, a5);
  uint64_t v11 = v10;
  if (v10)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v10, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2748);
  }
  else
  {
    unint64_t v12 = (unint64_t)a1 + v14 + 4;
    *a7 = *(unsigned int *)((char *)a1 + v14);
    *a6 = v12;
  }
  return v11;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t result = 0;
    *a2 = a1 + 4;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2764);
    return 4294967291;
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __len, _DWORD *a3, uint64_t *a4)
{
  if (!a3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outBuffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2779);
    return 4294967293;
  }
  if (!a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2780);
    return 4294967293;
  }
  uint64_t v5 = __len + 4;
  if (*a4 < __len + 4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "*outSize >= requiredSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2785);
    return 4294967293;
  }
  *a3 = __len;
  if (__src) {
    memmove(a3 + 1, __src, __len);
  }
  else {
    uint64_t v5 = 4;
  }
  uint64_t result = 0;
  *a4 = v5;
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, void *a3, void *a4)
{
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "buffer", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2809);
    return 4294967293;
  }
  if (!a3 || !a4)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "responseData && responseDataSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2810);
    return 4294967293;
  }
  if (a2 <= 3)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "size >= sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 2813);
    return 4294967293;
  }
  uint64_t result = 0;
  unsigned int v7 = *a1;
  size_t v6 = a1 + 1;
  *a4 = v7;
  if (!v7) {
    size_t v6 = 0;
  }
  *a3 = v6;
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (a1)
  {
    switch(*a1)
    {
      case 0:
        __asm { BTI             j; jumptable 0000000000018244 case 0 }
        if (!a1[4]) {
          return 0;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "!param->parameterDataLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 33);
        return 4294967293;
      case 1:
        __asm { BTI             j; jumptable 0000000000018244 case 1 }
        if (a1[4] == 4) {
          return 0;
        }
        int v6 = 37;
        goto LABEL_17;
      case 2:
      case 6:
      case 7:
        __asm { BTI             j; jumptable 0000000000018244 cases 2,6,7 }
        if (a1[4] == 16) {
          return 0;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength == 16", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 43);
        return 4294967293;
      case 3:
        __asm { BTI             j; jumptable 0000000000018244 case 3 }
        if ((a1[4] - 1001) > 0xFFFFFC17) {
          return 0;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength && (param->parameterDataLength <= 1000)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 47);
        return 4294967293;
      case 4:
        __asm { BTI             j; jumptable 0000000000018244 case 4 }
        if (a1[4] == 4) {
          return 0;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength == sizeof(uid_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 51);
        return 4294967293;
      case 5:
        __asm { BTI             j; jumptable 0000000000018244 case 5 }
        if (a1[4] == 4) {
          return 0;
        }
        int v6 = 55;
LABEL_17:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength == sizeof(int32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v6);
        return 4294967293;
      case 8:
        __asm { BTI             j; jumptable 0000000000018244 case 8 }
        if (a1[4] == 1) {
          return 0;
        }
        int v7 = 59;
        goto LABEL_22;
      case 9:
        __asm { BTI             j; jumptable 0000000000018244 case 9 }
        if (a1[4] == 1) {
          return 0;
        }
        int v7 = 63;
LABEL_22:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength == sizeof(uint8_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", v7);
        return 4294967293;
      case 0xA:
        __asm { BTI             j; jumptable 0000000000018244 case 10 }
        if (a1[4] == 4) {
          return 0;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength == sizeof(uint32_t)", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 71);
        return 4294967293;
      case 0xB:
        __asm { BTI             j; jumptable 0000000000018244 case 11 }
        if (a1[4] < 0x401u) {
          return 0;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength <= 1024", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 67);
        return 4294967293;
      case 0xC:
        __asm { BTI             j; jumptable 0000000000018244 case 12 }
        if (!a1[4]) {
          return 0;
        }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param->parameterDataLength == 0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 75);
        break;
      default:
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 79);
        return 4294967293;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "param", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/LibSerialization.c", 29);
  }
  return 4294967293;
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

char *Util_isNullOrZeroMemory(unsigned char *a1, uint64_t a2)
{
  if (!a1) {
    return (char *)&dword_0 + 1;
  }
  if (*a1) {
    return 0;
  }
  return (char *)(memcmp(a1, a1 + 1, a2 - 1) == 0);
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  BOOL result = 0;
  if (__s1)
  {
    if (__s2) {
      return memcmp(__s1, __s2, __n) == 0;
    }
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >= a4) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = a2;
  }
  if (v4)
  {
    uint64_t v5 = (unsigned char *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      char v6 = *result++;
      unsigned char *v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, void *a3, void *__src, size_t __len)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  }
  if (a3)
  {
    uint64_t v10 = *a3;
    size_t v11 = *a3 + __len;
    if (__CFADD__(*a3, __len))
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "__os_warn_unused(__builtin_add_overflow((pos), (inDataSize), (&end))) == 0 ", 1, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 54);
LABEL_20:
      uint64_t v12 = 4294967291;
      goto LABEL_21;
    }
    if (!a1 || v11 <= a2)
    {
      if (!a1 || !__src || !__len) {
        goto LABEL_12;
      }
      if (!__CFADD__(a1, v10))
      {
        memmove((void *)(a1 + v10), __src, __len);
LABEL_12:
        uint64_t v12 = 0;
        *a3 = v11;
        unsigned int v13 = 10;
        goto LABEL_13;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "__os_warn_unused(__builtin_add_overflow(((uintptr_t)outBufferOpt), (pos), ((uintptr_t *)&writePtr))) == 0 ", 1, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 59);
      goto LABEL_20;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "!outBufferOpt || end <= outBufferSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 55);
    uint64_t v12 = 4294967276;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "writePos", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 49);
    uint64_t v12 = 4294967293;
  }
LABEL_21:
  unsigned int v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  }
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, void *a3, void *__dst, size_t __len)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  }
  if (a1 && a3)
  {
    uint64_t v10 = *a3;
    size_t v11 = *a3 + __len;
    if (__CFADD__(*a3, __len))
    {
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "__os_warn_unused(__builtin_add_overflow((pos), (outDataSize), (&end))) == 0 ", 1, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 79);
LABEL_19:
      uint64_t v12 = 4294967291;
      goto LABEL_20;
    }
    if (v11 <= a2)
    {
      if (!__dst || !__len) {
        goto LABEL_11;
      }
      if (!__CFADD__(a1, v10))
      {
        memmove(__dst, (const void *)(a1 + v10), __len);
LABEL_11:
        uint64_t v12 = 0;
        *a3 = v11;
        unsigned int v13 = 10;
        goto LABEL_12;
      }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "__os_warn_unused(__builtin_add_overflow(((uintptr_t)inBuffer), (pos), ((uintptr_t *)&readPtr))) == 0 ", 1, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 84);
      goto LABEL_19;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "end <= inBufferSize", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 80);
    uint64_t v12 = 4294967276;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "inBuffer && readPos", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 75);
    uint64_t v12 = 4294967293;
  }
LABEL_20:
  unsigned int v13 = 70;
LABEL_12:
  if (v13 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v12);
  }
  return v12;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 1;
  }
  return v1 & 3;
}

uint64_t Util_SafeDeallocParameters(uint64_t result, unsigned int a2)
{
  if (result)
  {
    uint64_t v2 = (const void *)result;
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v4 = result + 8;
      uint64_t v5 = a2;
      do
      {
        char v6 = *(const void **)v4;
        if (*(void *)v4)
        {
          unint64_t v7 = *(unsigned int *)(v4 + 8);
          *(void *)uint64_t v4 = 0;
          acm_mem_free_info("<data>", v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data((uint64_t)v6, v7);
        }
        v4 += 24;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", v2, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    return IOFreeTypeVarImpl();
  }
  return result;
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  }
  if (a1)
  {
    switch(*a1)
    {
      case 1:
        __asm { BTI             j; jumptable 0000000000018B64 case 1 }
        acm_explicit_bzero(a1, 0x3CuLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataPasscodeValidated", a1, 0x3CuLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 144, "Util_DeallocCredential");
        goto LABEL_20;
      case 2:
        __asm { BTI             j; jumptable 0000000000018B64 case 2 }
        acm_explicit_bzero(a1, 0xA8uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataPassphraseEntered", a1, 0xA8uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 136, "Util_DeallocCredential");
        goto LABEL_20;
      case 3:
        __asm { BTI             j; jumptable 0000000000018B64 case 3 }
        acm_explicit_bzero(a1, 0x151uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataBiometryMatched", a1, 0x151uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 140, "Util_DeallocCredential");
        goto LABEL_20;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        __asm { BTI             j; jumptable 0000000000018B64 cases 4-6,8,14,16,19,22,23 }
        acm_mem_free_info("ACMCredential", a1, 0x20uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 189, "Util_DeallocCredential");
        IOFreeTypeImpl();
        goto LABEL_21;
      case 7:
        __asm { BTI             j; jumptable 0000000000018B64 case 7 }
        acm_explicit_bzero(a1, 0x58uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", a1, 0x58uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 152, "Util_DeallocCredential");
        goto LABEL_20;
      case 9:
        __asm { BTI             j; jumptable 0000000000018B64 case 9 }
        acm_explicit_bzero(a1, 0x38uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataContinuityUnlock", a1, 0x38uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 156, "Util_DeallocCredential");
        goto LABEL_20;
      case 0xA:
        __asm { BTI             j; jumptable 0000000000018B64 case 10 }
        acm_explicit_bzero(a1, 0x54uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataPasscodeValidated2", a1, 0x54uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 148, "Util_DeallocCredential");
        goto LABEL_20;
      case 0xC:
      case 0xF:
        __asm { BTI             j; jumptable 0000000000018B64 cases 12,15 }
        acm_explicit_bzero(a1, 0x28uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataKextDenyList", a1, 0x28uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 161, "Util_DeallocCredential");
        goto LABEL_20;
      case 0xD:
        __asm { BTI             j; jumptable 0000000000018B64 case 13 }
        acm_explicit_bzero(a1, 0xA4uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataPassphraseExtractable", a1, 0xA4uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 132, "Util_DeallocCredential");
        goto LABEL_20;
      case 0x11:
        __asm { BTI             j; jumptable 0000000000018B64 case 17 }
        acm_explicit_bzero(a1, 0x71uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataSecureIntent", a1, 0x71uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 165, "Util_DeallocCredential");
        goto LABEL_20;
      case 0x12:
        __asm { BTI             j; jumptable 0000000000018B64 case 18 }
        acm_explicit_bzero(a1, 0x34uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", a1, 0x34uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 169, "Util_DeallocCredential");
        goto LABEL_20;
      case 0x14:
        __asm { BTI             j; jumptable 0000000000018B64 case 20 }
        acm_explicit_bzero(a1, 0x40uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataAP", a1, 0x40uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 173, "Util_DeallocCredential");
        goto LABEL_20;
      case 0x15:
        __asm { BTI             j; jumptable 0000000000018B64 case 21 }
        acm_explicit_bzero(a1, 0xA4uLL);
        acm_mem_free_info("ACMCredential - ACMCredentialDataSignature", a1, 0xA4uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 177, "Util_DeallocCredential");
LABEL_20:
        IOFreeTypeVarImpl();
LABEL_21:
        uint64_t v6 = 0;
        unsigned int v7 = 10;
        break;
      default:
        __asm { BTI             j; jumptable 0000000000018B64 default case, case 11 }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 193);
        goto LABEL_14;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 128);
LABEL_14:
    uint64_t v6 = 4294967293;
    unsigned int v7 = 70;
  }
  if (v7 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v6);
  }
  return v6;
}

uint64_t Util_AllocCredential(int a1, void *a2)
{
  if (a2)
  {
    switch(a1)
    {
      case 1:
        __asm { BTI             j; jumptable 000000000001908C case 1 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v8, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
        int v9 = 28;
        goto LABEL_4;
      case 2:
        __asm { BTI             j; jumptable 000000000001908C case 2 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v8, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
        int v9 = 136;
        goto LABEL_4;
      case 3:
        __asm { BTI             j; jumptable 000000000001908C case 3 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v8, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
        int v9 = 305;
        goto LABEL_4;
      case 4:
      case 5:
      case 6:
      case 8:
      case 14:
      case 16:
      case 19:
      case 22:
      case 23:
        __asm { BTI             j; jumptable 000000000001908C cases 4-6,8,14,16,19,22,23 }
        unint64_t v8 = (_DWORD *)IOMallocTypeImpl();
        acm_mem_alloc_info("ACMCredential", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
        int v9 = 0;
        goto LABEL_4;
      case 7:
        __asm { BTI             j; jumptable 000000000001908C case 7 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v8, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
        int v9 = 56;
        goto LABEL_4;
      case 9:
        __asm { BTI             j; jumptable 000000000001908C case 9 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v8, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
        int v9 = 24;
        goto LABEL_4;
      case 10:
        __asm { BTI             j; jumptable 000000000001908C case 10 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v8, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
        int v9 = 52;
        goto LABEL_4;
      case 12:
      case 15:
        __asm { BTI             j; jumptable 000000000001908C cases 12,15 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v8, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
        int v9 = 8;
        goto LABEL_4;
      case 13:
        __asm { BTI             j; jumptable 000000000001908C case 13 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        size_t v11 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        uint64_t v12 = v8;
        int v13 = 211;
        goto LABEL_20;
      case 17:
        __asm { BTI             j; jumptable 000000000001908C case 17 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v8, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
        int v9 = 81;
        goto LABEL_4;
      case 18:
        __asm { BTI             j; jumptable 000000000001908C case 18 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v8, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
        int v9 = 20;
        goto LABEL_4;
      case 20:
        __asm { BTI             j; jumptable 000000000001908C case 20 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v8, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
        int v9 = 32;
        goto LABEL_4;
      case 21:
        __asm { BTI             j; jumptable 000000000001908C case 21 }
        unint64_t v8 = (_DWORD *)IOMallocTypeVarImpl();
        size_t v11 = "ACMCredential - ACMCredentialDataSignature";
        uint64_t v12 = v8;
        int v13 = 267;
LABEL_20:
        acm_mem_alloc_info(v11, v12, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", v13, "Util_AllocCredential");
        int v9 = 132;
LABEL_4:
        if (v8)
        {
          uint64_t result = 0;
          _DWORD *v8 = a1;
          v8[1] = 2;
          v8[7] = v9;
          v8[3] = -1;
          *a2 = v8;
        }
        else
        {
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "cred", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 288);
          uint64_t result = 4294967292;
        }
        break;
      default:
        __asm { BTI             j; jumptable 000000000001908C default case, case 11 }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 285);
        return 4294967293;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 207);
    return 4294967293;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, void *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  }
  if (a3)
  {
    switch(a1)
    {
      case 1:
        __asm { BTI             j; jumptable 00000000000195E0 case 1 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        uint64_t v15 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        uint64_t v16 = v10;
        int v17 = 338;
        goto LABEL_52;
      case 2:
        __asm { BTI             j; jumptable 00000000000195E0 case 2 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        uint64_t v15 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        uint64_t v16 = v10;
        int v17 = 343;
        goto LABEL_52;
      case 3:
        __asm { BTI             j; jumptable 00000000000195E0 case 3 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v10, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        int v11 = 156;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      case 4:
        __asm { BTI             j; jumptable 00000000000195E0 case 4 }
        if ((unint64_t)(a2 - 11) > 0xFFFFFFFFFFFFFFF5)
        {
          uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
          uint64_t v18 = "ACMRequirement - ACMRequirementDataOr";
          unint64_t v19 = v10;
          int v20 = 406;
          goto LABEL_31;
        }
        int v21 = 403;
        goto LABEL_61;
      case 5:
        __asm { BTI             j; jumptable 00000000000195E0 case 5 }
        if ((unint64_t)(a2 - 11) <= 0xFFFFFFFFFFFFFFF5)
        {
          int v21 = 395;
          goto LABEL_61;
        }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        uint64_t v18 = "ACMRequirement - ACMRequirementDataAnd";
        unint64_t v19 = v10;
        int v20 = 398;
LABEL_31:
        acm_mem_alloc_info(v18, v19, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", v20, "Util_AllocRequirement");
        int v11 = 84;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        __asm { BTI             j; jumptable 00000000000195E0 cases 6,9-12,14,15,18,19,22,23,27,28 }
        uint64_t v10 = (_DWORD *)IOMallocTypeImpl();
        acm_mem_alloc_info("ACMRequirement", v10, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        int v11 = 0;
        if (v10) {
          goto LABEL_6;
        }
        goto LABEL_53;
      case 7:
        __asm { BTI             j; jumptable 00000000000195E0 case 7 }
        if ((unint64_t)(a2 - 11) <= 0xFFFFFFFFFFFFFFF5)
        {
          int v21 = 389;
LABEL_61:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "subreqCount > 0 && subreqCount <= 10", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", v21);
          goto LABEL_21;
        }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v10, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        int v11 = 88;
        if (!v10)
        {
LABEL_53:
          IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "req", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 442);
          uint64_t v12 = 4294967292;
          goto LABEL_22;
        }
LABEL_6:
        _DWORD *v10 = a1;
        *(void *)(v10 + 1) = 0x100000001;
        v10[3] = v11;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v10[4] = a2;
        }
        else if (a1 == 1000)
        {
          v10[13] = a2;
        }
        else if (a1 == 7)
        {
          v10[5] = a2;
        }
        uint64_t v12 = 0;
        *a3 = v10;
        unsigned int v13 = 10;
        break;
      case 8:
        __asm { BTI             j; jumptable 00000000000195E0 case 8 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v10, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        int v11 = 1024;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      case 13:
        __asm { BTI             j; jumptable 00000000000195E0 case 13 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v10, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        int v11 = 32;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      case 16:
      case 17:
LABEL_20:
        __asm { BTI             j; jumptable 00000000000195E0 cases 16,17 }
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 438);
        goto LABEL_21;
      case 20:
        __asm { BTI             j; jumptable 00000000000195E0 case 20 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        uint64_t v15 = "ACMRequirement - ACMRequirementDataSecureIntent";
        uint64_t v16 = v10;
        int v17 = 353;
        goto LABEL_52;
      case 21:
        __asm { BTI             j; jumptable 00000000000195E0 case 21 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        uint64_t v15 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        uint64_t v16 = v10;
        int v17 = 358;
LABEL_52:
        acm_mem_alloc_info(v15, v16, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", v17, "Util_AllocRequirement");
        int v11 = 4;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      case 24:
        __asm { BTI             j; jumptable 00000000000195E0 case 24 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v10, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        int v11 = 1060;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      case 25:
        __asm { BTI             j; jumptable 00000000000195E0 case 25 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v10, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        int v11 = 43;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      case 26:
        __asm { BTI             j; jumptable 00000000000195E0 case 26 }
        uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v10, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        int v11 = 28;
        if (!v10) {
          goto LABEL_53;
        }
        goto LABEL_6;
      default:
        switch(a1)
        {
          case 1000:
            __asm { BTI             j; jumptable 000000000001968C case 1000 }
            if ((unint64_t)(a2 - 11) <= 0xFFFFFFFFFFFFFFF5)
            {
              int v21 = 412;
              goto LABEL_61;
            }
            uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v10, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            int v11 = 120;
            if (v10) {
              goto LABEL_6;
            }
            break;
          case 1001:
            __asm { BTI             j; jumptable 000000000001968C case 1001 }
            uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v10, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            int v11 = 168;
            if (!v10) {
              goto LABEL_53;
            }
            goto LABEL_6;
          case 1002:
            __asm { BTI             j; jumptable 000000000001968C case 1002 }
            uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
            uint64_t v15 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            uint64_t v16 = v10;
            int v17 = 424;
            goto LABEL_52;
          case 1003:
            __asm { BTI             j; jumptable 000000000001968C case 1003 }
            uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
            uint64_t v15 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            uint64_t v16 = v10;
            int v17 = 429;
            goto LABEL_52;
          case 1004:
            __asm { BTI             j; jumptable 000000000001968C case 1004 }
            uint64_t v10 = (_DWORD *)IOMallocTypeVarImpl();
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v10, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            int v11 = 16;
            if (!v10) {
              goto LABEL_53;
            }
            goto LABEL_6;
          default:
            goto LABEL_20;
        }
        goto LABEL_53;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "requirement", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 316);
LABEL_21:
    uint64_t v12 = 4294967293;
LABEL_22:
    unsigned int v13 = 70;
  }
  if (v13 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v12);
  }
  return v12;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  }
  uint64_t v6 = 0;
  int v4 = Util_AllocRequirement(a1, a2, &v6);
  if (v4) {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", v4, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 478);
  }
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  }
  return v6;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  }
  if (!a1)
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "req", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 489);
LABEL_30:
    uint64_t v11 = 4294967293;
    unsigned int v12 = 70;
    goto LABEL_50;
  }
  int v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        unint64_t v6 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000) {
        goto LABEL_25;
      }
      if (a1[13])
      {
        unint64_t v4 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      unint64_t v5 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5) {
      goto LABEL_25;
    }
    if (a1[4])
    {
      unint64_t v3 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  int v2 = *a1;
LABEL_25:
  switch(v2)
  {
    case 1:
      __asm { BTI             j; jumptable 0000000000019FC8 case 1 }
      acm_explicit_bzero(a1, 0x14uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataPasscodeValidated", a1, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 542, "Util_DeallocRequirement");
      goto LABEL_48;
    case 2:
      __asm { BTI             j; jumptable 0000000000019FC8 case 2 }
      acm_explicit_bzero(a1, 0x14uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataPassphraseEntered", a1, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 546, "Util_DeallocRequirement");
      goto LABEL_48;
    case 3:
      __asm { BTI             j; jumptable 0000000000019FC8 case 3 }
      acm_explicit_bzero(a1, 0xACuLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataBiometryMatched", a1, 0xACuLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 550, "Util_DeallocRequirement");
      goto LABEL_48;
    case 4:
      __asm { BTI             j; jumptable 0000000000019FC8 case 4 }
      acm_explicit_bzero(a1, 0x64uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataOr", a1, 0x64uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 595, "Util_DeallocRequirement");
      goto LABEL_48;
    case 5:
      __asm { BTI             j; jumptable 0000000000019FC8 case 5 }
      acm_explicit_bzero(a1, 0x64uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataAnd", a1, 0x64uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 589, "Util_DeallocRequirement");
      goto LABEL_48;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      __asm { BTI             j; jumptable 0000000000019FC8 cases 6,9-12,14,15,18,19,22,23,27,28 }
      acm_mem_free_info("ACMRequirement", a1, 0x10uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 538, "Util_DeallocRequirement");
      IOFreeTypeImpl();
      goto LABEL_49;
    case 7:
      __asm { BTI             j; jumptable 0000000000019FC8 case 7 }
      acm_explicit_bzero(a1, 0x68uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataKofN", a1, 0x68uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 584, "Util_DeallocRequirement");
      goto LABEL_48;
    case 8:
      __asm { BTI             j; jumptable 0000000000019FC8 case 8 }
      acm_explicit_bzero(a1, 0x410uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataAccessGroups", a1, 0x410uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 574, "Util_DeallocRequirement");
      goto LABEL_48;
    case 13:
      __asm { BTI             j; jumptable 0000000000019FC8 case 13 }
      acm_explicit_bzero(a1, 0x30uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", a1, 0x30uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 562, "Util_DeallocRequirement");
      goto LABEL_48;
    case 16:
    case 17:
LABEL_29:
      __asm { BTI             j; jumptable 0000000000019FC8 cases 16,17 }
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "0", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 621);
      goto LABEL_30;
    case 20:
      __asm { BTI             j; jumptable 0000000000019FC8 case 20 }
      acm_explicit_bzero(a1, 0x14uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataSecureIntent", a1, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 554, "Util_DeallocRequirement");
      goto LABEL_48;
    case 21:
      __asm { BTI             j; jumptable 0000000000019FC8 case 21 }
      acm_explicit_bzero(a1, 0x14uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataBiometryMatchAttempted", a1, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 558, "Util_DeallocRequirement");
      goto LABEL_48;
    case 24:
      __asm { BTI             j; jumptable 0000000000019FC8 case 24 }
      acm_explicit_bzero(a1, 0x434uLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataAP", a1, 0x434uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 566, "Util_DeallocRequirement");
      goto LABEL_48;
    case 25:
      __asm { BTI             j; jumptable 0000000000019FC8 case 25 }
      acm_explicit_bzero(a1, 0x3BuLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataKeyRef", a1, 0x3BuLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 570, "Util_DeallocRequirement");
      goto LABEL_48;
    case 26:
      __asm { BTI             j; jumptable 0000000000019FC8 case 26 }
      acm_explicit_bzero(a1, 0x2CuLL);
      acm_mem_free_info("ACMRequirement - ACMRequirementDataRatchet", a1, 0x2CuLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 579, "Util_DeallocRequirement");
LABEL_48:
      IOFreeTypeVarImpl();
LABEL_49:
      uint64_t v11 = 0;
      unsigned int v12 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          __asm { BTI             j; jumptable 000000000001A034 case 1000 }
          acm_explicit_bzero(a1, 0x88uLL);
          acm_mem_free_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", a1, 0x88uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 601, "Util_DeallocRequirement");
          goto LABEL_48;
        case 1001:
          __asm { BTI             j; jumptable 000000000001A034 case 1001 }
          acm_explicit_bzero(a1, 0xB8uLL);
          acm_mem_free_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", a1, 0xB8uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 605, "Util_DeallocRequirement");
          goto LABEL_48;
        case 1002:
          __asm { BTI             j; jumptable 000000000001A034 case 1002 }
          acm_explicit_bzero(a1, 0x14uLL);
          acm_mem_free_info("ACMRequirement - ACMRequirementDataPushButtonWithAttributes", a1, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 609, "Util_DeallocRequirement");
          goto LABEL_48;
        case 1003:
          __asm { BTI             j; jumptable 000000000001A034 case 1003 }
          acm_explicit_bzero(a1, 0x14uLL);
          acm_mem_free_info("ACMRequirement - ACMRequirementDataSecureStateWithAttributes", a1, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 613, "Util_DeallocRequirement");
          goto LABEL_48;
        case 1004:
          __asm { BTI             j; jumptable 000000000001A034 case 1004 }
          acm_explicit_bzero(a1, 0x20uLL);
          acm_mem_free_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", a1, 0x20uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/common/CommonUtil.c", 617, "Util_DeallocRequirement");
          goto LABEL_48;
        default:
          goto LABEL_29;
      }
  }
LABEL_50:
  if (v12 >= gACMLoggingLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v11);
  }
  return v11;
}

uint64_t ACMKernContextCreate(void *a1)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextCreate");
  }
  uint64_t v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))ACMKernelTransport, (uint64_t)&transportContext, a1, &_logLevel, 0);
  uint64_t v3 = v2;
  if (v2) {
    unsigned int v4 = 70;
  }
  else {
    unsigned int v4 = 10;
  }
  if (v4 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextCreate", (int)v2);
  }
  return v3;
}

const void *ACMKernContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextCreateWithExternalForm");
  }
  unsigned int v4 = (const void *)LibCall_ACMContextCreateWithExternalForm((uint64_t)ACMKernelTransport, (uint64_t)&transportContext, a1, a2, &_logLevel, 0);
  unint64_t v5 = v4;
  if (v4) {
    unsigned int v6 = 30;
  }
  else {
    unsigned int v6 = 70;
  }
  if (v6 >= _logLevel) {
    IOLog("%s: %s: returning, -> ctx = %p.\n", "ACMKernelLib", "ACMKernContextCreateWithExternalForm", v4);
  }
  return v5;
}

uint64_t ACMKernContextDelete(const void *a1, int a2)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextDelete");
  }
  uint64_t v4 = LibCall_ACMContextDelete((uint64_t (*)(uint64_t, uint64_t, void, const void *, uint64_t, void, void))ACMKernelTransport, (uint64_t)&transportContext, a1, a2);
  uint64_t v5 = v4;
  if (v4) {
    unsigned int v6 = 70;
  }
  else {
    unsigned int v6 = 10;
  }
  if (v6 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextDelete", (int)v4);
  }
  return v5;
}

uint64_t ACMKernContextAddCredentialWithScope(_OWORD *a1, _DWORD *a2, int a3)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextAddCredentialWithScope");
  }
  uint64_t v6 = LibCall_ACMContexAddCredentialWithScope((uint64_t (*)(uint64_t, uint64_t, void, const void *, unint64_t, void, void))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, a3);
  uint64_t v7 = v6;
  if (v6) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextAddCredentialWithScope", (int)v6);
  }
  return v7;
}

uint64_t ACMKernGlobalContextAddCredential(_DWORD *a1)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernGlobalContextAddCredential");
  }
  uint64_t v6 = 0;
  if (a1)
  {
    uint64_t v2 = ACMKernContextCreate(&v6);
    if (v2)
    {
      uint64_t v3 = v2;
      IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v2, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelLib.cpp", 96);
    }
    else
    {
      uint64_t v3 = ACMKernContextAddCredentialWithScope(v6, a1, 2);
    }
    if (v6) {
      ACMKernContextDelete(v6, 1);
    }
    if (v3) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "credential", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelLib.cpp", 93);
    unsigned int v4 = 70;
    uint64_t v3 = 4294967293;
  }
  if (v4 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernGlobalContextAddCredential", (int)v3);
  }
  return v3;
}

uint64_t ACMKernContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextRemoveCredentialsByTypeAndScope");
  }
  uint64_t v6 = LibCall_ACMContexRemoveCredentialsByTypeAndScope((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void, void))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, a3);
  uint64_t v7 = v6;
  if (v6) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextRemoveCredentialsByTypeAndScope", (int)v6);
  }
  return v7;
}

uint64_t ACMKernGlobalContextRemoveCredentialsByType(int a1)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernGlobalContextRemoveCredentialsByType");
  }
  uint64_t v6 = 0;
  uint64_t v2 = ACMKernContextCreate(&v6);
  if (v2)
  {
    uint64_t v3 = v2;
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v2, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelLib.cpp", 132);
  }
  else
  {
    uint64_t v3 = ACMKernContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  }
  if (v6) {
    ACMKernContextDelete(v6, 1);
  }
  if (v3) {
    unsigned int v4 = 70;
  }
  else {
    unsigned int v4 = 10;
  }
  if (v4 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernGlobalContextRemoveCredentialsByType", (int)v3);
  }
  return v3;
}

uint64_t ACMKernContextVerifyPolicyAndCopyRequirementEx(_OWORD *a1, char *__s1, _DWORD *a3, unsigned int a4, uint64_t a5, BOOL *a6, void *a7)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextVerifyPolicyAndCopyRequirementEx");
  }
  uint64_t v14 = LibCall_ACMContextVerifyPolicyAndCopyRequirementEx((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ACMKernelTransport, (uint64_t)&transportContext, a1, __s1, 0, a3, a4, a5, a6, a7);
  uint64_t v15 = v14;
  if (v14) {
    unsigned int v16 = 70;
  }
  else {
    unsigned int v16 = 10;
  }
  if (v16 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextVerifyPolicyAndCopyRequirementEx", (int)v14);
  }
  return v15;
}

uint64_t ACMKernGlobalContextVerifyPolicyAndCopyRequirementEx(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, BOOL *a5, void *a6)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernGlobalContextVerifyPolicyAndCopyRequirementEx");
  }
  *(void *)int v17 = 0;
  uint64_t v12 = ACMKernContextCreate(v17);
  if (v12)
  {
    uint64_t v13 = v12;
    int v16 = 168;
  }
  else
  {
    uint64_t v13 = LibCall_ACMContextVerifyPolicyAndCopyRequirementEx((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ACMKernelTransport, (uint64_t)&transportContext, *(_OWORD **)v17, a1, a2, a3, a4, 0xFFFFFFFFLL, a5, a6);
    if (!v13) {
      goto LABEL_5;
    }
    int v16 = 171;
  }
  IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v13, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelLib.cpp", v16);
LABEL_5:
  if (*(void *)v17) {
    ACMKernContextDelete(*(const void **)v17, 1);
  }
  if (v13) {
    unsigned int v14 = 70;
  }
  else {
    unsigned int v14 = 10;
  }
  if (v14 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernGlobalContextVerifyPolicyAndCopyRequirementEx", (int)v13);
  }
  return v13;
}

void ACMKernRequirementDelete(int *a1)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernRequirementDelete");
  }
  int v2 = LibCall_ACMRequirementDelete((uint64_t)ACMKernelTransport, a1);
  if (v2) {
    unsigned int v3 = 70;
  }
  else {
    unsigned int v3 = 10;
  }
  if (v3 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernRequirementDelete", v2);
  }
}

uint64_t ACMKernCredentialCreate(int a1, void *a2)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernCredentialCreate");
  }
  uint64_t v4 = LibCall_ACMCredentialCreate(a1, a2);
  uint64_t v5 = v4;
  if (v4) {
    unsigned int v6 = 70;
  }
  else {
    unsigned int v6 = 10;
  }
  if (v6 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernCredentialCreate", (int)v4);
  }
  return v5;
}

void ACMKernCredentialDelete(_DWORD *a1)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernCredentialDelete");
  }
  LibCall_ACMCredentialDelete(a1);
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: returning.\n", "ACMKernelLib", "ACMKernCredentialDelete");
  }
}

uint64_t ACMKernDoubleClickNotify()
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernDoubleClickNotify");
  }
  uint64_t v0 = LibCall_ACMKernDoubleClickNotify((uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))ACMKernelTransport, (uint64_t)&transportContext);
  uint64_t v1 = v0;
  if (v0) {
    unsigned int v2 = 70;
  }
  else {
    unsigned int v2 = 10;
  }
  if (v2 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernDoubleClickNotify", (int)v0);
  }
  return v1;
}

uint64_t ACMKernPing()
{
  return ACMKernPingOnDoubleClick();
}

uint64_t ACMKernPingOnDoubleClick()
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernPingOnDoubleClick");
  }
  uint64_t v0 = LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))ACMKernelTransport, (uint64_t)&transportContext, 47);
  uint64_t v1 = v0;
  if (v0) {
    unsigned int v2 = 70;
  }
  else {
    unsigned int v2 = 10;
  }
  if (v2 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernPingOnDoubleClick", (int)v0);
  }
  return v1;
}

uint64_t ACMKernControl(int a1, const void *a2, size_t a3, uint64_t a4, uint64_t a5)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernControl");
  }
  uint64_t v10 = LibCall_ACMKernelControl((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, a3, a4, a5);
  uint64_t v11 = v10;
  if (v10) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld, code=%u.\n", "ACMKernelLib", "ACMKernControl", (int)v10, a1);
  }
  return v11;
}

uint64_t ACMKernSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernSetEnvironmentVariable");
  }
  uint64_t v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ACMKernelTransport, (uint64_t)&transportContext, a1, 0, 0, 0, a2, a3);
  uint64_t v7 = v6;
  if (v6) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld, var=%u.\n", "ACMKernelLib", "ACMKernSetEnvironmentVariable", (int)v6, a1);
  }
  return v7;
}

uint64_t ACMKernGetEnvironmentVariable(int a1, uint64_t a2, uint64_t a3)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernGetEnvironmentVariable");
  }
  uint64_t v6 = LibCall_ACMGetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, a3);
  uint64_t v7 = v6;
  if (v6) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld, var=%u.\n", "ACMKernelLib", "ACMKernGetEnvironmentVariable", (int)v6, a1);
  }
  return v7;
}

uint64_t ACMKernContextCredentialGetProperty(_OWORD *a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextCredentialGetProperty");
  }
  uint64_t v10 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, void, void *, uint64_t, uint64_t, uint64_t))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, a3, a4, a5);
  uint64_t v11 = v10;
  if (v10) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextCredentialGetProperty", (int)v10);
  }
  return v11;
}

uint64_t ACMKernContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextSetData");
  }
  uint64_t v8 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, void, const void *, size_t, void, void))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, 0, 0, a3, a4);
  uint64_t v9 = v8;
  if (v8) {
    unsigned int v10 = 70;
  }
  else {
    unsigned int v10 = 10;
  }
  if (v10 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextSetData", (int)v8);
  }
  return v9;
}

uint64_t ACMKernContextGetData(_OWORD *a1, int a2, uint64_t a3, void *a4)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextGetData");
  }
  if (a4)
  {
    if (a3)
    {
      uint64_t v8 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, const void *, unint64_t, uint64_t, uint64_t))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, 0, 0, 0, a3, (uint64_t)a4);
      uint64_t v9 = v8;
      if (v8)
      {
        IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v8, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelLib.cpp", 340);
        unsigned int v10 = 70;
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    unsigned int v14 = 0;
    uint64_t v13 = 4;
    uint64_t v11 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, const void *, unint64_t, uint64_t, uint64_t))ACMKernelTransport, (uint64_t)&transportContext, a1, a2, 1, 0, 0, (uint64_t)&v14, (uint64_t)&v13);
    uint64_t v9 = v11;
    if (!v11)
    {
      *a4 = v14;
LABEL_9:
      unsigned int v10 = 10;
      goto LABEL_10;
    }
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "err == 0 ", (int)v11, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelLib.cpp", 336);
    unsigned int v10 = 70;
  }
  else
  {
    IOLog("AssertMacros: %s (value: 0x%lx), %s, file: %s:%d\n", "outDataLength", 0, "---", "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_KernelLibs/ACMKernelLib/ACMKernelLib.cpp", 330);
    unsigned int v10 = 70;
    uint64_t v9 = 4294967293;
  }
LABEL_10:
  if (v10 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextGetData", (int)v9);
  }
  return v9;
}

uint64_t ACMKernContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4, void *a5)
{
  if (_logLevel <= 0xAu) {
    IOLog("%s: %s: called.\n", "ACMKernelLib", "ACMKernContextGetDataProperty");
  }
  uint64_t Data = ACMKernContextGetData(a1, a2 | (a3 << 16), a4, a5);
  uint64_t v11 = Data;
  if (Data) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= _logLevel) {
    IOLog("%s: %s: returning, err = %ld.\n", "ACMKernelLib", "ACMKernContextGetDataProperty", (int)Data);
  }
  return v11;
}

uint64_t _start()
{
  if (_realmain) {
    return _realmain();
  }
  else {
    return 0;
  }
}

uint64_t _stop()
{
  if (_antimain) {
    return _antimain();
  }
  else {
    return 0;
  }
}

void __chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __chkstk_darwin_probe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v10 = &a9;
  if (v9 >= 0x1000)
  {
    do
    {
      v10 -= 512;
      v9 -= 4096;
    }
    while (v9 > 0x1000);
  }
}

uint64_t IOFreeData()
{
  return _IOFreeData();
}

uint64_t IOFreeTypeImpl()
{
  return _IOFreeTypeImpl();
}

uint64_t IOFreeTypeVarImpl()
{
  return _IOFreeTypeVarImpl();
}

void IOLog(const char *format, ...)
{
}

uint64_t IOMallocTypeImpl()
{
  return _IOMallocTypeImpl();
}

uint64_t IOMallocTypeVarImpl()
{
  return _IOMallocTypeVarImpl();
}

uint64_t IOMallocZeroData()
{
  return _IOMallocZeroData();
}

uint64_t OSObject_typed_operator_new()
{
  return _OSObject_typed_operator_new();
}

BOOLean_t PE_parse_boot_argn(const char *arg_string, void *arg_ptr, int max_arg)
{
  return _PE_parse_boot_argn(arg_string, arg_ptr, max_arg);
}

OSMetaClass *__cdecl OSMetaClass::OSMetaClass(OSMetaClass *this, const char *className, const OSMetaClass *superclass, unsigned int classSize)
{
  return OSMetaClass::OSMetaClass(this, className, superclass, classSize);
}

void OSMetaClass::~OSMetaClass(OSMetaClass *this)
{
}

IORegistryEntry *__cdecl IORegistryEntry::fromPath(const char *path, const IORegistryPlane *plane, char *residualPath, int *residualLength, IORegistryEntry *fromEntry)
{
  return IORegistryEntry::fromPath(path, plane, residualPath, residualLength, fromEntry);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

IOMemoryDescriptor *__cdecl IOMemoryDescriptor::withAddress(void *address, IOByteCount withLength, IODirection withDirection)
{
  return IOMemoryDescriptor::withAddress(address, withLength, withDirection);
}

const OSSymbol *__cdecl OSSymbol::withCString(const char *cString)
{
  return OSSymbol::withCString(cString);
}

OSDictionary *__cdecl IOService::nameMatching(const char *name, OSDictionary *table)
{
  return IOService::nameMatching(name, table);
}

OSDictionary *__cdecl IOService::serviceMatching(const char *className, OSDictionary *table)
{
  return IOService::serviceMatching(className, table);
}

IOService *__cdecl IOService::waitForMatchingService(OSDictionary *matching, uint64_t timeout)
{
  return IOService::waitForMatchingService(matching, timeout);
}

IOService *__cdecl IOService::IOService(IOService *this, const OSMetaClass *a2)
{
  return IOService::IOService(this, a2);
}

void IOService::~IOService(IOService *this)
{
}

void OSMetaClass::instanceConstructed(const OSMetaClass *this)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t disable_lockdown_mode()
{
  return _disable_lockdown_mode();
}

uint64_t enable_lockdown_mode()
{
  return _enable_lockdown_mode();
}

uint64_t get_lockdown_mode_state()
{
  return _get_lockdown_mode_state();
}

kern_return_t kernel_thread_start(thread_continue_t continuation, void *parameter, thread_t *new_thread)
{
  return _kernel_thread_start(continuation, parameter, new_thread);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int memset_s(void *__s, size_t __smax, int __c, size_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

void thread_deallocate(thread_t thread)
{
}