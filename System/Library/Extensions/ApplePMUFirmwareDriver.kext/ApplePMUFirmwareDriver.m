OSMetaClass *ApplePMUFirmwareDriverUserClient::MetaClass::MetaClass(OSMetaClass *this)
{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "ApplePMUFirmwareDriverUserClient", &IOUserClient2022::gMetaClass, 0xE0u);
  result->__vftable = (OSMetaClass_vtbl *)off_C750;
  return result;
}

{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "ApplePMUFirmwareDriverUserClient", &IOUserClient2022::gMetaClass, 0xE0u);
  result->__vftable = (OSMetaClass_vtbl *)off_C750;
  return result;
}

void ApplePMUFirmwareDriverUserClient::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void ApplePMUFirmwareDriverUserClient::ApplePMUFirmwareDriverUserClient(ApplePMUFirmwareDriverUserClient *this, const OSMetaClass *a2)
{
  IOUserClient2022::IOUserClient2022(this, a2);
  void *v2 = off_C160;
}

{
  void *v2;

  IOUserClient2022::IOUserClient2022(this, a2);
  void *v2 = off_C160;
}

void ApplePMUFirmwareDriverUserClient::~ApplePMUFirmwareDriverUserClient(ApplePMUFirmwareDriverUserClient *this)
{
}

{
  IOUserClient2022::~IOUserClient2022(this);
}

{
  uint64_t vars8;

  IOUserClient2022::~IOUserClient2022(this);

  _OSObject_typed_operator_delete(&ApplePMUFirmwareDriverUserClient_ktv, this, 224);
}

void ApplePMUFirmwareDriverUserClient::operator delete(void *a1, uint64_t a2)
{
}

void *ApplePMUFirmwareDriverUserClient::getMetaClass(ApplePMUFirmwareDriverUserClient *this)
{
  return &ApplePMUFirmwareDriverUserClient::gMetaClass;
}

IOUserClient2022 *ApplePMUFirmwareDriverUserClient::MetaClass::alloc(ApplePMUFirmwareDriverUserClient::MetaClass *this)
{
  v1 = (IOUserClient2022 *)OSObject_typed_operator_new();
  IOUserClient2022::IOUserClient2022(v1, &ApplePMUFirmwareDriverUserClient::gMetaClass);
  void *v2 = off_C160;
  OSMetaClass::instanceConstructed(&ApplePMUFirmwareDriverUserClient::gMetaClass);
  return v1;
}

uint64_t ApplePMUFirmwareDriverUserClient::operator new(ApplePMUFirmwareDriverUserClient *this)
{
  return OSObject_typed_operator_new();
}

void ApplePMUFirmwareDriverUserClient::ApplePMUFirmwareDriverUserClient(ApplePMUFirmwareDriverUserClient *this)
{
  IOUserClient2022::IOUserClient2022(this, &ApplePMUFirmwareDriverUserClient::gMetaClass);
  void *v1 = off_C160;
  OSMetaClass::instanceConstructed(&ApplePMUFirmwareDriverUserClient::gMetaClass);
}

{
  void *v1;

  IOUserClient2022::IOUserClient2022(this, &ApplePMUFirmwareDriverUserClient::gMetaClass);
  void *v1 = off_C160;
  OSMetaClass::instanceConstructed(&ApplePMUFirmwareDriverUserClient::gMetaClass);
}

uint64_t ApplePMUFirmwareDriverUserClient::initWithTask(ApplePMUFirmwareDriverUserClient *this, task *a2, void *a3, uint64_t a4, OSDictionary *a5)
{
  if (result) {
    return IOUserClient::clientHasPrivilege(a3, "root") == 0;
  }
  return result;
}

OSMetaClassBase *ApplePMUFirmwareDriverUserClient::start(ApplePMUFirmwareDriverUserClient *this, IOService *anObject)
{
  uint64_t result = OSMetaClassBase::safeMetaCast(anObject, &ApplePMUFirmwareDriver::gMetaClass);
  *((void *)this + 27) = result;
  if (result)
  {
    if (result)
    {
      v5 = kOSBooleanTrue;
      (*(void (**)(ApplePMUFirmwareDriverUserClient *, const char *, OSBoolean *const))(*(void *)this
                                                                                                 + 200))(this, "IOUserClientDefaultLocking", *kOSBooleanTrue);
      (*(void (**)(ApplePMUFirmwareDriverUserClient *, const char *, OSBoolean *const))(*(void *)this
                                                                                                 + 200))(this, "IOUserClientDefaultLockingSetProperties", *v5);
      (*(void (**)(ApplePMUFirmwareDriverUserClient *, const char *, OSBoolean *const))(*(void *)this
                                                                                                 + 200))(this, "IOUserClientDefaultLockingSingleThreadExternalMethod", *v5);
      (*(void (**)(ApplePMUFirmwareDriverUserClient *, const char *, const char *))(*(void *)this + 208))(this, "IOUserClientEntitlements", "com.apple.driver.ApplePMUFirmwareDriver.user-access");
      return (OSMetaClassBase *)(&dword_0 + 1);
    }
  }
  return result;
}

uint64_t ApplePMUFirmwareDriverUserClient::clientClose(ApplePMUFirmwareDriverUserClient *this)
{
  return (*(uint64_t (**)(ApplePMUFirmwareDriverUserClient *, void))(*(void *)this + 752))(this, 0);
}

uint64_t ApplePMUFirmwareDriverUserClient::externalMethod()
{
  return IOUserClient2022::dispatchExternalMethod();
}

uint64_t ApplePMUFirmwareDriverUserClient::mailboxTransaction(ApplePMUFirmwareDriverUserClient *this, void *a2, IOExternalMethodArguments *a3)
{
  unsigned __int8 v11 = 0;
  unsigned int v10 = 0;
  scalarInput = a3->scalarInput;
  uint64_t v6 = *scalarInput;
  uint64_t v5 = scalarInput[1];
  int v12 = v6;
  char v13 = v5;
  uint64_t result = ApplePMUFirmwareDriver::mailboxTransaction(*((void *)this + 27), (uint64_t)&v12, (uint64_t)&v10);
  scalarOutput = a3->scalarOutput;
  uint64_t v9 = v11;
  uint64_t *scalarOutput = v10;
  scalarOutput[1] = v9;
  return result;
}

uint64_t ApplePMUFirmwareDriverUserClient::hostIRQ(ApplePMUFirmwareDriver **this, void *a2, IOExternalMethodArguments *a3)
{
  return ApplePMUFirmwareDriver::writeHostIRQ(this[27], *(unsigned __int8 *)a3->scalarInput);
}

uint64_t ApplePMUFirmwareDriverUserClient::setCPMSRate(ApplePMUFirmwareDriver **this, void *a2, IOExternalMethodArguments *a3)
{
  return ApplePMUFirmwareDriver::setCPMSRate(this[27], *(unsigned __int16 *)a3->scalarInput);
}

uint64_t ApplePMUFirmwareDriverUserClient::setCPMSVDDDroopThreshold(ApplePMUFirmwareDriver **this, void *a2, IOExternalMethodArguments *a3)
{
  return ApplePMUFirmwareDriver::setCPMSVDDDroopThreshold(this[27], *(_DWORD *)a3->scalarInput);
}

OSMetaClass *_GLOBAL__sub_I_ApplePMUFirmwareDriverUserClient_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&ApplePMUFirmwareDriverUserClient::gMetaClass, "ApplePMUFirmwareDriverUserClient", &IOUserClient2022::gMetaClass, 0xE0u);
  result->__vftable = (OSMetaClass_vtbl *)off_C750;
  return result;
}

void global destructor keyed to'_a()
{
}

OSMetaClass *ApplePMUFirmwareDriver::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "ApplePMUFirmwareDriver", &IOService::gMetaClass, 0xD0u);
  result->__vftable = (OSMetaClass_vtbl *)off_CD40;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "ApplePMUFirmwareDriver", &IOService::gMetaClass, 0xD0u);
  result->__vftable = (OSMetaClass_vtbl *)off_CD40;
  return result;
}

void ApplePMUFirmwareDriver::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void ApplePMUFirmwareDriver::ApplePMUFirmwareDriver(ApplePMUFirmwareDriver *this, const OSMetaClass *a2)
{
  IOService::IOService((IOService *)this, a2)->__vftable = (IOService_vtbl *)off_C7E8;
}

{
  IOService::IOService((IOService *)this, a2)->__vftable = (IOService_vtbl *)off_C7E8;
}

void ApplePMUFirmwareDriver::~ApplePMUFirmwareDriver(IOService *this)
{
}

{
  IOService::~IOService(this);
}

{
  uint64_t vars8;

  IOService::~IOService(this);

  _OSObject_typed_operator_delete(&ApplePMUFirmwareDriver_ktv, this, 208);
}

void ApplePMUFirmwareDriver::operator delete(void *a1, uint64_t a2)
{
}

void *ApplePMUFirmwareDriver::getMetaClass(ApplePMUFirmwareDriver *this)
{
  return &ApplePMUFirmwareDriver::gMetaClass;
}

IOService *ApplePMUFirmwareDriver::MetaClass::alloc(ApplePMUFirmwareDriver::MetaClass *this)
{
  v1 = (IOService *)OSObject_typed_operator_new();
  IOService::IOService(v1, &ApplePMUFirmwareDriver::gMetaClass)->__vftable = (IOService_vtbl *)off_C7E8;
  OSMetaClass::instanceConstructed(&ApplePMUFirmwareDriver::gMetaClass);
  return v1;
}

uint64_t ApplePMUFirmwareDriver::operator new(ApplePMUFirmwareDriver *this)
{
  return OSObject_typed_operator_new();
}

void ApplePMUFirmwareDriver::ApplePMUFirmwareDriver(ApplePMUFirmwareDriver *this)
{
  IOService::IOService((IOService *)this, &ApplePMUFirmwareDriver::gMetaClass)->__vftable = (IOService_vtbl *)off_C7E8;
  OSMetaClass::instanceConstructed(&ApplePMUFirmwareDriver::gMetaClass);
}

{
  IOService::IOService((IOService *)this, &ApplePMUFirmwareDriver::gMetaClass)->__vftable = (IOService_vtbl *)off_C7E8;
  OSMetaClass::instanceConstructed(&ApplePMUFirmwareDriver::gMetaClass);
}

uint64_t ApplePMUFirmwareDriver::start(ApplePMUFirmwareDriver *this, IOService *a2)
{
  v4 = (const char *)((uint64_t (*)(IOService *, void))a2->getName)(a2, 0);
  uint64_t v5 = OSString::withCString(v4);
  *((_DWORD *)this + 34) = 3;
  uint64_t v6 = (char *)this + 136;
  *((void *)this + 18) = v5;
  PE_parse_boot_argn("pmu-fw-debug", (char *)this + 136, 4);
  v7 = OSMetaClassBase::safeMetaCast(a2, AppleARMSPMIDevice::metaClass);
  *((void *)this + 19) = v7;
  if (!v7)
  {
    if ((*v6 & 2) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v36 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v36);
      IOLog("(%s) %s::%s: failed to cast provider\n");
    }
    return 0;
  }
  {
    if ((*v6 & 2) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v37 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v37);
      IOLog("(%s) %s::%s: super::start() failed\n");
    }
    return 0;
  }
  v8 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))a2->getProperty_1)(a2, "has-fw");
  uint64_t v9 = (const OSMetaClass *)OSData::metaClass;
  unsigned int v10 = OSMetaClassBase::safeMetaCast(v8, OSData::metaClass);
  if (!v10)
  {
    if ((*v6 & 0x80) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v31 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v31);
      IOLog("(%s) %s::%s: failed to find property with key %s\n");
    }
    goto LABEL_28;
  }
  unsigned __int8 v11 = (int *)((uint64_t (*)(OSMetaClassBase *, void, uint64_t))v10->__vftable[2].release)(v10, 0, 4);
  if (!v11)
  {
    if ((*v6 & 0x80) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v32 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v32);
      IOLog("(%s) %s::%s: failed to get data from key %s\n");
    }
    goto LABEL_28;
  }
  int v12 = *v11;
  if ((*v6 & 0x80) != 0)
  {
    char v13 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
    v14 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
    ClassName = OSMetaClass::getClassName(v14);
    IOLog("(%s) %s::%s: [%s] = 0x%x\n", v13, ClassName, "getDTProperty", "has-fw", v12);
  }
  if (!v12)
  {
LABEL_28:
    if ((*v6 & 2) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v33 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v33);
      IOLog("(%s) %s::%s: expected to find has_fw property\n");
    }
    return 0;
  }
  uint64_t v16 = ((uint64_t (*)(IOService *, void))a2->getName)(a2, 0);
  if (((*(uint64_t (**)(ApplePMUFirmwareDriver *, const char *, uint64_t))(*(void *)this + 208))(this, "PMUName", v16) & 1) == 0)
  {
    if ((*v6 & 2) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v38 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v38);
      IOLog("(%s) %s::%s: setProperty failed\n");
    }
    return 0;
  }
  v17 = IOWorkLoop::workLoop();
  *((void *)this + 20) = v17;
  if (!v17)
  {
    if ((*v6 & 2) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v39 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v39);
      IOLog("(%s) %s::%s: failed to create IOWorkLoop\n");
    }
    return 0;
  }
  v18 = IOCommandGate::commandGate((OSObject *)this, 0);
  *((void *)this + 21) = v18;
  if (!v18)
  {
    if ((*v6 & 2) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v40 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v40);
      IOLog("(%s) %s::%s: failed to create IOCommandGate\n");
    }
    return 0;
  }
  if ((*(unsigned int (**)(void, IOCommandGate *))(**((void **)this + 20) + 160))(*((void *)this + 20), v18))
  {
    if ((*v6 & 2) != 0)
    {
LABEL_48:
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v41 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v41);
      IOLog("(%s) %s::%s: failed to add event source to work loop, rc = 0x%x\n");
    }
    return 0;
  }
  if ((ApplePMUFirmwareDriver::getDTProperty<unsigned short>((uint64_t)this, (uint64_t)a2, "fw-host-irq-address", (unsigned __int16 *)this + 88) & 1) == 0)
  {
LABEL_35:
    if ((*v6 & 2) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v35 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v35);
      IOLog("(%s) %s::%s: failed to find property %s\n");
    }
    return 0;
  }
  if (ApplePMUFirmwareDriver::getDTProperty<unsigned short>((uint64_t)this, (uint64_t)a2, "fw-mcom-address", (unsigned __int16 *)this + 90))
  {
    *((_WORD *)this + 89) = 1;
    *((void *)this + 23) = IOLockAlloc();
    v19 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))a2->getProperty_1)(a2, "fw-mcom-int-index");
    v20 = OSMetaClassBase::safeMetaCast(v19, v9);
    if (v20)
    {
      v21 = (int *)((uint64_t (*)(OSMetaClassBase *, void, uint64_t))v20->__vftable[2].release)(v20, 0, 4);
      if (v21)
      {
        int v22 = *v21;
        *((_DWORD *)this + 48) = *v21;
        if ((*((unsigned char *)this + 136) & 0x80) != 0)
        {
          v23 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
          v24 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
          v25 = OSMetaClass::getClassName(v24);
          IOLog("(%s) %s::%s: [%s] = 0x%x\n", v23, v25, "getDTProperty", "fw-mcom-int-index", *((_DWORD *)this + 48));
          int v22 = *((_DWORD *)this + 48);
        }
        v26 = IOInterruptEventSource::interruptEventSource((OSObject *)this, (IOInterruptEventSource::Action)ApplePMUFirmwareDriver::handleMailboxInterrupt, a2, v22);
        *((void *)this + 25) = v26;
        if (!v26)
        {
          if ((*v6 & 2) != 0)
          {
            (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
            v42 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
            OSMetaClass::getClassName(v42);
            IOLog("(%s) %s::%s: failed to create IOInterruptEventSource\n");
          }
          return 0;
        }
        if (!(*(unsigned int (**)(void, IOInterruptEventSource *))(**((void **)this + 20) + 160))(*((void *)this + 20), v26))
        {
          (*(void (**)(void))(**((void **)this + 25) + 176))(*((void *)this + 25));
          goto LABEL_21;
        }
        if ((*v6 & 2) != 0) {
          goto LABEL_48;
        }
        return 0;
      }
      if ((*v6 & 0x80) != 0)
      {
        (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
        v43 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
        OSMetaClass::getClassName(v43);
        IOLog("(%s) %s::%s: failed to get data from key %s\n");
      }
    }
    else if ((*v6 & 0x80) != 0)
    {
      (*(void (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
      v34 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
      OSMetaClass::getClassName(v34);
      IOLog("(%s) %s::%s: failed to find property with key %s\n");
    }
    goto LABEL_35;
  }
LABEL_21:
  (*(void (**)(ApplePMUFirmwareDriver *, void))(*(void *)this + 672))(this, 0);
  if ((*((unsigned char *)this + 136) & 8) != 0)
  {
    v27 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
    v28 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
    v29 = OSMetaClass::getClassName(v28);
    IOLog("(%s) %s::%s: started\n", v27, v29, "start");
  }
  return 1;
}

uint64_t ApplePMUFirmwareDriver::getDTProperty<unsigned short>(uint64_t a1, uint64_t a2, const char *a3, unsigned __int16 *a4)
{
  v7 = (const OSMetaClassBase *)(*(uint64_t (**)(uint64_t, const char *))(*(void *)a2 + 280))(a2, a3);
  v8 = OSMetaClassBase::safeMetaCast(v7, OSData::metaClass);
  if (!v8)
  {
    if ((*(unsigned char *)(a1 + 136) & 0x80) != 0)
    {
      (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
      v14 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
      OSMetaClass::getClassName(v14);
      IOLog("(%s) %s::%s: failed to find property with key %s\n");
    }
    return 0;
  }
  uint64_t v9 = (unsigned __int16 *)((uint64_t (*)(OSMetaClassBase *, void, uint64_t))v8->__vftable[2].release)(v8, 0, 2);
  if (!v9)
  {
    if ((*(unsigned char *)(a1 + 136) & 0x80) != 0)
    {
      (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
      v15 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
      OSMetaClass::getClassName(v15);
      IOLog("(%s) %s::%s: failed to get data from key %s\n");
    }
    return 0;
  }
  *a4 = *v9;
  if ((*(unsigned char *)(a1 + 136) & 0x80) != 0)
  {
    unsigned int v10 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
    unsigned __int8 v11 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
    ClassName = OSMetaClass::getClassName(v11);
    IOLog("(%s) %s::%s: [%s] = 0x%x\n", v10, ClassName, "getDTProperty", a3, *a4);
  }
  return 1;
}

void ApplePMUFirmwareDriver::handleMailboxInterrupt(ApplePMUFirmwareDriver *this, IOInterruptEventSource *a2, int a3)
{
  if ((*((unsigned char *)this + 136) & 0x80) != 0)
  {
    uint64_t v6 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
    v7 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
    ClassName = OSMetaClass::getClassName(v7);
    IOLog("(%s) %s::%s: source=%p, index=%d, _mailboxSleeping=%d\n", v6, ClassName, "handleMailboxInterrupt", a2, a3, *((unsigned __int8 *)this + 179));
  }
  if (*((unsigned char *)this + 179))
  {
    uint64_t v9 = *(void (**)(void))(**((void **)this + 21) + 264);
    v9();
  }
}

uint64_t ApplePMUFirmwareDriver::free(ApplePMUFirmwareDriver *this)
{
  v2 = (IOLock *)*((void *)this + 23);
  if (v2)
  {
    IOLockFree(v2);
    *((void *)this + 23) = 0;
  }
  uint64_t v3 = *((void *)this + 25);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  *((void *)this + 25) = 0;
  uint64_t v4 = *((void *)this + 21);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 40))(v4);
  }
  *((void *)this + 21) = 0;
  uint64_t v5 = *((void *)this + 20);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
  }
  *((void *)this + 20) = 0;

  return ((uint64_t (*)(ApplePMUFirmwareDriver *))free)(this);
}

uint64_t ApplePMUFirmwareDriver::mailboxTransaction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(a1 + 136);
  if (*(unsigned char *)(a1 + 178))
  {
    if ((v4 & 0x80) != 0)
    {
      v7 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
      v8 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
      ClassName = OSMetaClass::getClassName(v8);
      IOLog("(%s) %s::%s: transmit event=%d, data=0x%x\n", v7, ClassName, "mailboxTransaction", *(unsigned __int8 *)(a2 + 4), *(_DWORD *)a2);
    }
    IOLockLock(*(IOLock **)(a1 + 184));
    unsigned int v10 = *(IOCommandGate **)(a1 + 168);
    action[0] = _NSConcreteStackBlock;
    action[1] = 0x40000000;
    action[2] = ___ZN22ApplePMUFirmwareDriver18mailboxTransactionEP20PMUFWDMailboxMessageS1__block_invoke;
    action[3] = &__block_descriptor_tmp;
    action[4] = a1;
    action[5] = a2;
    action[6] = a3;
    uint64_t v11 = IOCommandGate::runActionBlock(v10, action);
    IOLockUnlock(*(IOLock **)(a1 + 184));
    if ((*(unsigned char *)(a1 + 136) & 0x80) != 0)
    {
      (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
      int v12 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
      OSMetaClass::getClassName(v12);
      IOLog("(%s) %s::%s: rc=0x%x, receive event=%d, data=0x%x\n");
    }
  }
  else
  {
    uint64_t v11 = 3758097095;
    if ((v4 & 2) != 0)
    {
      (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
      v14 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
      OSMetaClass::getClassName(v14);
      IOLog("(%s) %s::%s: mailbox is not supported\n");
    }
  }
  return v11;
}

uint64_t ___ZN22ApplePMUFirmwareDriver18mailboxTransactionEP20PMUFWDMailboxMessageS1__block_invoke(uint64_t *a1)
{
  return ApplePMUFirmwareDriver::mailboxTransactionGated(a1[4], a1[5], a1[6]);
}

uint64_t ApplePMUFirmwareDriver::mailboxTransactionGated(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned __int8 *)(a2 + 4) - 16 <= 0xFFFFFFF0)
  {
    uint64_t v17 = 3758097090;
    if ((*(unsigned char *)(a1 + 136) & 2) != 0)
    {
      (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
      v30 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
      OSMetaClass::getClassName(v30);
      IOLog("(%s) %s::%s: invalid event %d\n");
    }
  }
  else
  {
    char v36 = 15;
    uint64_t v6 = (*(uint64_t (**)(void, void, char *, uint64_t, void))(**(void **)(a1 + 152) + 1424))(*(void *)(a1 + 152), (unsigned __int16)(*(_WORD *)(a1 + 180) + 10), &v36, 1, 0);
    if (v6)
    {
      uint64_t v17 = v6;
      if ((*(unsigned char *)(a1 + 136) & 2) != 0)
      {
        (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
        v31 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
        OSMetaClass::getClassName(v31);
        IOLog("(%s) %s::%s: extRegisterWriteLong(RECEIVE_EVENT) failed, rc=0x%x\n");
      }
    }
    else
    {
      uint64_t v7 = (*(uint64_t (**)(void, void, uint64_t, uint64_t, void))(**(void **)(a1 + 152) + 1424))(*(void *)(a1 + 152), *(unsigned __int16 *)(a1 + 180), a2, 5, 0);
      if (v7)
      {
        uint64_t v17 = v7;
        if ((*(unsigned char *)(a1 + 136) & 2) != 0)
        {
          (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
          v32 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
          OSMetaClass::getClassName(v32);
          IOLog("(%s) %s::%s: extRegisterWriteLong(TRANSMIT0) failed, rc=0x%x\n");
        }
      }
      else
      {
        char v36 = 1;
        uint64_t v8 = (*(uint64_t (**)(void, void, char *, uint64_t, void))(**(void **)(a1 + 152) + 1424))(*(void *)(a1 + 152), (unsigned __int16)(*(_WORD *)(a1 + 180) + 5), &v36, 1, 0);
        if (v8)
        {
          uint64_t v17 = v8;
          if ((*(unsigned char *)(a1 + 136) & 2) != 0)
          {
            (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
            v33 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
            OSMetaClass::getClassName(v33);
            IOLog("(%s) %s::%s: extRegisterWriteLong(TRANSMIT_INTR) failed, rc=0x%x\n");
          }
        }
        else
        {
          uint64_t result = 0;
          clock_interval_to_deadline(1u, 0x3B9ACA00u, &result);
          if ((*(unsigned char *)(a1 + 136) & 0x80) != 0)
          {
            uint64_t v9 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
            unsigned int v10 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
            ClassName = OSMetaClass::getClassName(v10);
            IOLog("(%s) %s::%s: going to sleep\n", v9, ClassName, "mailboxTransactionGated");
          }
          *(unsigned char *)(a1 + 179) = 1;
          int v12 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 168) + 272))(*(void *)(a1 + 168), a1 + 179, result, 2);
          *(unsigned char *)(a1 + 179) = 0;
          if ((*(unsigned char *)(a1 + 136) & 0x80) != 0)
          {
            char v13 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
            v14 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
            v15 = OSMetaClass::getClassName(v14);
            IOLog("(%s) %s::%s: after sleep\n", v13, v15, "mailboxTransactionGated");
          }
          if (v12 == 1)
          {
            if ((*(unsigned char *)(a1 + 136) & 2) != 0)
            {
              v18 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
              v19 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
              v20 = OSMetaClass::getClassName(v19);
              IOLog("(%s) %s::%s: timed out waiting for response\n", v18, v20, "mailboxTransactionGated");
              return 3758097110;
            }
            int v16 = 20;
            return v16 | 0xE00002C2;
          }
          if ((v12 & 0xFFFFFFFE) == 2)
          {
            if ((*(unsigned char *)(a1 + 136) & 2) != 0)
            {
              v26 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
              v27 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
              v28 = OSMetaClass::getClassName(v27);
              IOLog("(%s) %s::%s: interrupted while waiting for response\n", v26, v28, "mailboxTransactionGated");
              return 3758097131;
            }
            int v16 = 41;
            return v16 | 0xE00002C2;
          }
          uint64_t v17 = (*(uint64_t (**)(void, void, uint64_t, uint64_t, void))(**(void **)(a1 + 152) + 1432))(*(void *)(a1 + 152), (unsigned __int16)(*(_WORD *)(a1 + 180) + 6), a3, 5, 0);
          if (v17)
          {
            if ((*(unsigned char *)(a1 + 136) & 2) != 0)
            {
              (*(void (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
              v34 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
              OSMetaClass::getClassName(v34);
              IOLog("(%s) %s::%s: extRegisterReadLong(RECEIVE0) failed, rc=0x%x\n");
            }
          }
          else
          {
            char v36 = 15;
            uint64_t v21 = (*(uint64_t (**)(void, void, char *, uint64_t, void))(**(void **)(a1 + 152) + 1432))(*(void *)(a1 + 152), (unsigned __int16)(*(_WORD *)(a1 + 180) + 10), &v36, 1, 0);
            if (v21)
            {
              uint64_t v22 = v21;
              if ((*(unsigned char *)(a1 + 136) & 2) != 0)
              {
                v23 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 144) + 168))(*(void *)(a1 + 144));
                v24 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
                v25 = OSMetaClass::getClassName(v24);
                IOLog("(%s) %s::%s: extRegisterReadLong(RECEIVE_EVENT) failed, rc=0x%x\n", v23, v25, "mailboxTransactionGated", v22);
              }
              return v22;
            }
          }
        }
      }
    }
  }
  return v17;
}

uint64_t ApplePMUFirmwareDriver::writeHostIRQ(ApplePMUFirmwareDriver *this, int a2)
{
  if ((*((unsigned char *)this + 136) & 0x80) != 0)
  {
    int v4 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
    uint64_t v5 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
    ClassName = OSMetaClass::getClassName(v5);
    IOLog("(%s) %s::%s: trigger_id=%d\n", v4, ClassName, "writeHostIRQ", a2);
  }
  uint64_t v7 = (IOCommandGate *)*((void *)this + 21);
  action[0] = _NSConcreteStackBlock;
  action[1] = 0x40000000;
  action[2] = ___ZN22ApplePMUFirmwareDriver12writeHostIRQEh_block_invoke;
  action[3] = &__block_descriptor_tmp_34;
  action[4] = this;
  char v10 = a2;
  return IOCommandGate::runActionBlock(v7, action);
}

uint64_t ___ZN22ApplePMUFirmwareDriver12writeHostIRQEh_block_invoke(uint64_t a1)
{
  return ApplePMUFirmwareDriver::writeHostIRQGated(*(ApplePMUFirmwareDriver **)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t ApplePMUFirmwareDriver::writeHostIRQGated(ApplePMUFirmwareDriver *this, char a2)
{
  char v8 = a2;
  uint64_t v3 = (*(uint64_t (**)(void, void, char *, uint64_t, void))(**((void **)this + 19) + 1424))(*((void *)this + 19), *((unsigned __int16 *)this + 88), &v8, 1, 0);
  if (v3 && (*((unsigned char *)this + 136) & 2) != 0)
  {
    uint64_t v5 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
    uint64_t v6 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
    ClassName = OSMetaClass::getClassName(v6);
    IOLog("(%s) %s::%s: extRegisterReadLong(HOST_IRQ) failed, address=0x%x, rc=0x%x\n", v5, ClassName, "writeHostIRQGated", *((unsigned __int16 *)this + 88), v3);
  }
  return v3;
}

uint64_t ApplePMUFirmwareDriver::setCPMSRate(ApplePMUFirmwareDriver *this, int a2)
{
  if ((*((unsigned char *)this + 136) & 0x80) != 0)
  {
    int v4 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
    uint64_t v5 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
    ClassName = OSMetaClass::getClassName(v5);
    IOLog("(%s) %s::%s: milliseconds=%d\n", v4, ClassName, "setCPMSRate", a2);
  }
  char v10 = 0;
  int v9 = 0;
  char v12 = 4;
  int v11 = a2;
  LODWORD(result) = ApplePMUFirmwareDriver::mailboxTransaction((uint64_t)this, (uint64_t)&v11, (uint64_t)&v9);
  if (v10 != 6 && result == 0) {
    return 3758097129;
  }
  else {
    return result;
  }
}

uint64_t ApplePMUFirmwareDriver::setCPMSVDDDroopThreshold(ApplePMUFirmwareDriver *this, unsigned int a2)
{
  if ((*((unsigned char *)this + 136) & 0x80) != 0)
  {
    int v4 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 18) + 168))(*((void *)this + 18));
    uint64_t v5 = (const OSMetaClass *)(*(uint64_t (**)(ApplePMUFirmwareDriver *))(*(void *)this + 56))(this);
    ClassName = OSMetaClass::getClassName(v5);
    IOLog("(%s) %s::%s: millivolts=%d.%06d\n", v4, ClassName, "setCPMSVDDDroopThreshold", HIWORD(a2), (1000000 * (unsigned __int16)a2) >> 16);
  }
  char v10 = 0;
  int v9 = 0;
  char v12 = 5;
  unsigned int v11 = a2;
  LODWORD(result) = ApplePMUFirmwareDriver::mailboxTransaction((uint64_t)this, (uint64_t)&v11, (uint64_t)&v9);
  if (v10 != 7 && result == 0) {
    return 3758097129;
  }
  else {
    return result;
  }
}

uint64_t ApplePMUFirmwareDriver::callPlatformFunction(ApplePMUFirmwareDriver *this, const OSSymbol *a2, BOOL a3, unsigned int *a4, uint64_t a5, void *a6, void *a7)
{
  if ((const OSSymbol *)gApplePMUFWDMailboxTransactionKey == a2)
  {
    if (a4 && a5) {
      return ApplePMUFirmwareDriver::mailboxTransaction((uint64_t)this, (uint64_t)a4, a5);
    }
  }
  else if ((const OSSymbol *)gApplePMUFWDHostIRQKey == a2)
  {
    if (a4) {
      return ApplePMUFirmwareDriver::writeHostIRQ(this, *(unsigned __int8 *)a4);
    }
  }
  else if ((const OSSymbol *)gApplePMUFWDSetCPMSRateKey == a2)
  {
    if (a4) {
      return ApplePMUFirmwareDriver::setCPMSRate(this, *(unsigned __int16 *)a4);
    }
  }
  else
  {
    if ((const OSSymbol *)gApplePMUFWDSetCPMSVDDDroopThresholdKey != a2) {
    if (a4)
    }
      return ApplePMUFirmwareDriver::setCPMSVDDDroopThreshold(this, *a4);
  }
  return 3758097090;
}

const OSSymbol *_GLOBAL__sub_I_ApplePMUFirmwareDriver_cpp()
{
  OSMetaClass::OSMetaClass(&ApplePMUFirmwareDriver::gMetaClass, "ApplePMUFirmwareDriver", &IOService::gMetaClass, 0xD0u)->__vftable = (OSMetaClass_vtbl *)off_CD40;
  gApplePMUFWDMailboxTransactionKey = (uint64_t)OSSymbol::withCStringNoCopy("ApplePMUFWDMailboxTransaction");
  gApplePMUFWDHostIRQKey = (uint64_t)OSSymbol::withCStringNoCopy("ApplePMUFWDUCHostIRQ");
  gApplePMUFWDSetCPMSRateKey = (uint64_t)OSSymbol::withCStringNoCopy("ApplePMUFWDSetCPMSRate");
  uint64_t result = OSSymbol::withCStringNoCopy("ApplePMUFWDSetCPMSVDDDroopThreshold");
  gApplePMUFWDSetCPMSVDDDroopThresholdKey = (uint64_t)result;
  return result;
}

void global destructor keyed to'_a_0()
{
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

const char *OSKextGetCurrentIdentifier(void)
{
  return aComAppleDriver_0;
}

const char *OSKextGetCurrentVersionString(void)
{
  return (const char *)&unk_8050;
}

OSKextLoadTag OSKextGetCurrentLoadTag(void)
{
  return dword_800C;
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

IOLock *IOLockAlloc(void)
{
  return _IOLockAlloc();
}

void IOLockFree(IOLock *lock)
{
}

void IOLockLock(IOLock *lock)
{
}

void IOLockUnlock(IOLock *lock)
{
}

void IOLog(const char *format, ...)
{
}

uint64_t OSObject_typed_operator_new()
{
  return _OSObject_typed_operator_new();
}

BOOLean_t PE_parse_boot_argn(const char *arg_string, void *arg_ptr, int max_arg)
{
  return _PE_parse_boot_argn(arg_string, arg_ptr, max_arg);
}

IOWorkLoop *IOWorkLoop::workLoop(void)
{
  return IOWorkLoop::workLoop();
}

OSMetaClass *__cdecl OSMetaClass::OSMetaClass(OSMetaClass *this, const char *className, const OSMetaClass *superclass, unsigned int classSize)
{
  return OSMetaClass::OSMetaClass(this, className, superclass, classSize);
}

void OSMetaClass::~OSMetaClass(OSMetaClass *this)
{
}

IOReturn IOUserClient::clientHasPrivilege(void *securityToken, const char *privilegeName)
{
  return IOUserClient::clientHasPrivilege(securityToken, privilegeName);
}

IOCommandGate *__cdecl IOCommandGate::commandGate(OSObject *owner, IOCommandGate::Action action)
{
  return IOCommandGate::commandGate(owner, action);
}

IOReturn IOCommandGate::runActionBlock(IOCommandGate *this, IOEventSource::ActionBlock action)
{
  return IOCommandGate::runActionBlock(this, action);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

uint64_t IOUserClient2022::dispatchExternalMethod()
{
  return IOUserClient2022::dispatchExternalMethod();
}

void IOUserClient2022::IOUserClient2022(IOUserClient2022 *this, const OSMetaClass *a2)
{
}

void IOUserClient2022::~IOUserClient2022(IOUserClient2022 *this)
{
}

IOInterruptEventSource *__cdecl IOInterruptEventSource::interruptEventSource(OSObject *owner, IOInterruptEventSource::Action action, IOService *provider, int intIndex)
{
  return IOInterruptEventSource::interruptEventSource(owner, action, provider, intIndex);
}

OSString *__cdecl OSString::withCString(const char *cString)
{
  return OSString::withCString(cString);
}

const OSSymbol *__cdecl OSSymbol::withCStringNoCopy(const char *cString)
{
  return OSSymbol::withCStringNoCopy(cString);
}

IOService *__cdecl IOService::IOService(IOService *this, const OSMetaClass *a2)
{
  return IOService::IOService(this, a2);
}

void IOService::~IOService(IOService *this)
{
}

const char *__cdecl OSMetaClass::getClassName(const OSMetaClass *this)
{
  return OSMetaClass::getClassName(this);
}

void OSMetaClass::instanceConstructed(const OSMetaClass *this)
{
}

void clock_interval_to_deadline(uint32_t interval, uint32_t scale_factor, uint64_t *result)
{
}