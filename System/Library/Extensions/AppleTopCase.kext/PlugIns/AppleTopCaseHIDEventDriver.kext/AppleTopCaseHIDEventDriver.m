OSMetaClass *AppleDeviceManagementHIDEventService::MetaClass::MetaClass(OSMetaClass *this)
{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleDeviceManagementHIDEventService", &IOHIDEventService::gMetaClass, 0x190u);
  result->__vftable = (OSMetaClass_vtbl *)off_149F0;
  return result;
}

{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleDeviceManagementHIDEventService", &IOHIDEventService::gMetaClass, 0x190u);
  result->__vftable = (OSMetaClass_vtbl *)off_149F0;
  return result;
}

void AppleDeviceManagementHIDEventService::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleDeviceManagementHIDEventService::AppleDeviceManagementHIDEventService(AppleDeviceManagementHIDEventService *this, const OSMetaClass *a2)
{
  v2 = IOHIDEventService::IOHIDEventService((IOHIDEventService *)this, a2);
  v2->__vftable = (IOHIDEventService_vtbl *)&off_14240;
  v2[1].OSObject = 0u;
  *(_OWORD *)&v2[1].IOService::IORegistryEntry::reserved = 0u;
  *(_OWORD *)&v2[1].fPropertyTable = 0u;
  *(_OWORD *)&v2[1].__provider = 0u;
  v2[1].__timeBusy = 0;
  *(_OWORD *)&v2[1].__accumBusy = 0u;
  *(void *)&v2[1].initialized = 0;
  *(void *)&v2[1]._numInterruptSources = 0;
  *(_OWORD *)&v2[1]._keyboardNub = 0u;
  v2[1]._consumerNub = 0;
  v2[1]._reserved = 0;
}

{
  AppleDeviceManagementHIDEventService::AppleDeviceManagementHIDEventService(this, a2);
}

void AppleDeviceManagementHIDEventService::~AppleDeviceManagementHIDEventService(IOHIDEventService *this)
{
  this->__vftable = (IOHIDEventService_vtbl *)&off_14240;
  reserved = this[1]._reserved;
  if (reserved) {
    ((void (*)(IOHIDEventService::ExpansionData *))reserved->provider->reserved)(reserved);
  }
  this[1]._reserved = 0;
  consumerNub = this[1]._consumerNub;
  if (consumerNub) {
    (*(void (**)(IOHIDConsumer *))(*(void *)consumerNub + 40))(consumerNub);
  }
  this[1]._consumerNub = 0;
  pointingNub = this[1]._pointingNub;
  if (pointingNub) {
    (*(void (**)(IOHIDPointing *))(*(void *)pointingNub + 40))(pointingNub);
  }
  this[1]._pointingNub = 0;
  keyboardNub = this[1]._keyboardNub;
  if (keyboardNub) {
    (*(void (**)(IOHIDKeyboard *))(*(void *)keyboardNub + 40))(keyboardNub);
  }
  this[1]._keyboardNub = 0;
  uint64_t v6 = *(void *)&this[1]._numInterruptSources;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
  }
  *(void *)&this[1]._numInterruptSources = 0;
  uint64_t v7 = *(void *)&this[1].initialized;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 40))(v7);
  }
  *(void *)&this[1].initialized = 0;
  pwrMgt = this[1].pwrMgt;
  if (pwrMgt) {
    (*(void (**)(IOServicePM *))(*(void *)pwrMgt + 40))(pwrMgt);
  }
  this[1].pwrMgt = 0;
  uint64_t accumBusy = this[1].__accumBusy;
  if (accumBusy) {
    (*(void (**)(uint64_t))(*(void *)accumBusy + 40))(accumBusy);
  }
  this[1].__uint64_t accumBusy = 0;
  uint64_t timeBusy = this[1].__timeBusy;
  if (timeBusy) {
    (*(void (**)(uint64_t))(*(void *)timeBusy + 40))(timeBusy);
  }
  this[1].__uint64_t timeBusy = 0;
  uint64_t v11 = *(void *)&this[1].__providerGeneration;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 40))(v11);
  }
  *(void *)&this[1].__providerGeneration = 0;
  provider = this[1].__provider;
  if (provider) {
    ((void (*)(IOService *))provider->release_0)(provider);
  }
  this[1].__provider = 0;
  v13 = this[1].IOService::reserved;
  if (v13) {
    (*(void (**)(IOService::ExpansionData *))(v13->authorizationID + 40))(v13);
  }
  this[1].IOService::reserved = 0;
  fPropertyTable = this[1].fPropertyTable;
  if (fPropertyTable) {
    ((void (*)(OSDictionary *))fPropertyTable->release_0)(fPropertyTable);
  }
  this[1].fPropertyTable = 0;
  fRegistryTable = this[1].fRegistryTable;
  if (fRegistryTable) {
    ((void (*)(OSDictionary *))fRegistryTable->release_0)(fRegistryTable);
  }
  this[1].fRegistryTable = 0;
  v16 = this[1].IOService::IORegistryEntry::reserved;
  if (v16) {
    (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)v16 + 40))(v16);
  }
  this[1].IOService::IORegistryEntry::reserved = 0;
  uint64_t v17 = *(void *)&this[1].retainCount;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
  }
  *(void *)&this[1].retainCount = 0;
  v18 = this[1].__vftable;
  if (v18) {
    (*((void (**)(IOHIDEventService_vtbl *))v18->~IOHIDEventService + 5))(v18);
  }
  this[1].__vftable = 0;

  IOHIDEventService::~IOHIDEventService(this);
}

{
  IOHIDEventService::ExpansionData *reserved;
  IOHIDConsumer *consumerNub;
  IOHIDPointing *pointingNub;
  IOHIDKeyboard *keyboardNub;
  uint64_t v6;
  uint64_t v7;
  IOServicePM *pwrMgt;
  uint64_t accumBusy;
  uint64_t timeBusy;
  uint64_t v11;
  IOService *provider;
  IOService::ExpansionData *v13;
  OSDictionary *fPropertyTable;
  OSDictionary *fRegistryTable;
  IORegistryEntry::ExpansionData *v16;
  uint64_t v17;
  IOHIDEventService_vtbl *v18;
  uint64_t vars8;

  this->__vftable = (IOHIDEventService_vtbl *)&off_14240;
  reserved = this[1]._reserved;
  if (reserved) {
    ((void (*)(IOHIDEventService::ExpansionData *))reserved->provider->reserved)(reserved);
  }
  this[1]._reserved = 0;
  consumerNub = this[1]._consumerNub;
  if (consumerNub) {
    (*(void (**)(IOHIDConsumer *))(*(void *)consumerNub + 40))(consumerNub);
  }
  this[1]._consumerNub = 0;
  pointingNub = this[1]._pointingNub;
  if (pointingNub) {
    (*(void (**)(IOHIDPointing *))(*(void *)pointingNub + 40))(pointingNub);
  }
  this[1]._pointingNub = 0;
  keyboardNub = this[1]._keyboardNub;
  if (keyboardNub) {
    (*(void (**)(IOHIDKeyboard *))(*(void *)keyboardNub + 40))(keyboardNub);
  }
  this[1]._keyboardNub = 0;
  uint64_t v6 = *(void *)&this[1]._numInterruptSources;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
  }
  *(void *)&this[1]._numInterruptSources = 0;
  uint64_t v7 = *(void *)&this[1].initialized;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 40))(v7);
  }
  *(void *)&this[1].initialized = 0;
  pwrMgt = this[1].pwrMgt;
  if (pwrMgt) {
    (*(void (**)(IOServicePM *))(*(void *)pwrMgt + 40))(pwrMgt);
  }
  this[1].pwrMgt = 0;
  uint64_t accumBusy = this[1].__accumBusy;
  if (accumBusy) {
    (*(void (**)(uint64_t))(*(void *)accumBusy + 40))(accumBusy);
  }
  this[1].__uint64_t accumBusy = 0;
  uint64_t timeBusy = this[1].__timeBusy;
  if (timeBusy) {
    (*(void (**)(uint64_t))(*(void *)timeBusy + 40))(timeBusy);
  }
  this[1].__uint64_t timeBusy = 0;
  uint64_t v11 = *(void *)&this[1].__providerGeneration;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 40))(v11);
  }
  *(void *)&this[1].__providerGeneration = 0;
  provider = this[1].__provider;
  if (provider) {
    ((void (*)(IOService *))provider->release_0)(provider);
  }
  this[1].__provider = 0;
  v13 = this[1].IOService::reserved;
  if (v13) {
    (*(void (**)(IOService::ExpansionData *))(v13->authorizationID + 40))(v13);
  }
  this[1].IOService::reserved = 0;
  fPropertyTable = this[1].fPropertyTable;
  if (fPropertyTable) {
    ((void (*)(OSDictionary *))fPropertyTable->release_0)(fPropertyTable);
  }
  this[1].fPropertyTable = 0;
  fRegistryTable = this[1].fRegistryTable;
  if (fRegistryTable) {
    ((void (*)(OSDictionary *))fRegistryTable->release_0)(fRegistryTable);
  }
  this[1].fRegistryTable = 0;
  v16 = this[1].IOService::IORegistryEntry::reserved;
  if (v16) {
    (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)v16 + 40))(v16);
  }
  this[1].IOService::IORegistryEntry::reserved = 0;
  uint64_t v17 = *(void *)&this[1].retainCount;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
  }
  *(void *)&this[1].retainCount = 0;
  v18 = this[1].__vftable;
  if (v18) {
    (*((void (**)(IOHIDEventService_vtbl *))v18->~IOHIDEventService + 5))(v18);
  }
  this[1].__vftable = 0;

  IOHIDEventService::~IOHIDEventService(this);
}

{
  uint64_t vars8;

  AppleDeviceManagementHIDEventService::~AppleDeviceManagementHIDEventService(this);

  _OSObject_typed_operator_delete(&AppleDeviceManagementHIDEventService_ktv, this, 400);
}

void AppleDeviceManagementHIDEventService::operator delete(void *a1, uint64_t a2)
{
}

void *AppleDeviceManagementHIDEventService::getMetaClass(AppleDeviceManagementHIDEventService *this)
{
  return &AppleDeviceManagementHIDEventService::gMetaClass;
}

void AppleDeviceManagementHIDEventService::MetaClass::alloc(AppleDeviceManagementHIDEventService::MetaClass *this)
{
  v1 = (AppleDeviceManagementHIDEventService *)OSObject_typed_operator_new();

  AppleDeviceManagementHIDEventService::AppleDeviceManagementHIDEventService(v1);
}

uint64_t AppleDeviceManagementHIDEventService::operator new(AppleDeviceManagementHIDEventService *this)
{
  return OSObject_typed_operator_new();
}

void AppleDeviceManagementHIDEventService::AppleDeviceManagementHIDEventService(AppleDeviceManagementHIDEventService *this)
{
}

{
  IOHIDEventService *v1;

  v1 = IOHIDEventService::IOHIDEventService((IOHIDEventService *)this, &AppleDeviceManagementHIDEventService::gMetaClass);
  v1->__vftable = (IOHIDEventService_vtbl *)&off_14240;
  v1[1].OSObject = 0u;
  *(_OWORD *)&v1[1].IOService::IORegistryEntry::reserved = 0u;
  *(_OWORD *)&v1[1].fPropertyTable = 0u;
  *(_OWORD *)&v1[1].__provider = 0u;
  v1[1].__uint64_t timeBusy = 0;
  *(_OWORD *)&v1[1].__uint64_t accumBusy = 0u;
  *(void *)&v1[1].initialized = 0;
  *(void *)&v1[1]._numInterruptSources = 0;
  *(_OWORD *)&v1[1]._keyboardNub = 0u;
  v1[1]._consumerNub = 0;
  v1[1]._reserved = 0;
  OSMetaClass::instanceConstructed(&AppleDeviceManagementHIDEventService::gMetaClass);
}

uint64_t AppleDeviceManagementHIDEventService::init(AppleDeviceManagementHIDEventService *this, OSDictionary *a2)
{
  if (result)
  {
    v4 = IOBufferMemoryDescriptor::withCapacity(0x1000uLL, 3u, 0);
    uint64_t v5 = *((void *)this + 35);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
    }
    *((void *)this + 35) = v4;
    if (v4)
    {
      ((void (*)(IOBufferMemoryDescriptor *, void))v4->prepare)(v4, 0);
      *((unsigned char *)this + 376) = 0;
      *((unsigned char *)this + 384) = 0;
      *(_WORD *)((char *)this + 377) = -1;
      *((_DWORD *)this + 95) = 0;
      *((void *)this + 33) = 0;
      *((void *)this + 34) = 0;
      *((void *)this + 45) = thread_call_allocate((thread_call_func_t)AppleDeviceManagementHIDEventService::resumeFromSleepThreadEnter, this);
      *((_WORD *)this + 156) = 0;
      *((_WORD *)this + 164) = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void AppleDeviceManagementHIDEventService::resumeFromSleepThreadEnter(const OSMetaClassBase *this, OSObject *a2)
{
  v2 = OSMetaClassBase::safeMetaCast(this, &AppleDeviceManagementHIDEventService::gMetaClass);
  if (v2)
  {
    v3 = v2;
    v4 = v2[40].__vftable;
    if (v4)
    {
      uint64_t v5 = v2->__vftable[18].~OSMetaClassBase_0;
      if (!v5)
      {
        v8.ptr = (void (*)(void))AppleDeviceManagementHIDEventService::_resumeFromSleepGated;
        v8.adj = 0;
        OSMetaClassBase::_ptf_t v6 = OSMetaClassBase::_ptmf2ptf(v2, v8);
        if (v6) {
          uint64_t v5 = v6;
        }
        else {
          uint64_t v5 = 0;
        }
      }
      (*((void (**)(OSMetaClassBase_vtbl *, void *, OSMetaClassBase *, void, void, void, void))v4->~OSMetaClassBase
       + 32))(v4, v5, v3, 0, 0, 0, 0);
    }
    uint64_t v7 = v3[49].__vftable;
    if (v7) {
      (*((void (**)(OSMetaClassBase_vtbl *))v7->~OSMetaClassBase + 5))(v7);
    }
    v3[49].__vftable = 0;
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to cast target to AppleDeviceManagementHIDEventService\n", "ATC", "AppleDeviceManagementHIDEventService", "resumeFromSleepThreadEnter");
  }
}

uint64_t AppleDeviceManagementHIDEventService::free(AppleDeviceManagementHIDEventService *this)
{
  v2 = (thread_call *)*((void *)this + 45);
  if (v2)
  {
    thread_call_free(v2);
    *((void *)this + 45) = 0;
  }

  return ((uint64_t (*)(AppleDeviceManagementHIDEventService *))free)(this);
}

uint64_t AppleDeviceManagementHIDEventService::start(AppleDeviceManagementHIDEventService *this, IOService *a2)
{
  if (v3)
  {
    v4 = *(IOReturn (__cdecl **)(void *, void *, UInt32, IOService *, void *, vm_size_t))(*(void *)this + 1920);
    if (!v4)
    {
      v22.ptr = (void (*)(void))AppleDeviceManagementHIDEventService::systemPowerChangeHandler;
      v22.adj = 0;
      OSMetaClassBase::_ptf_t v5 = OSMetaClassBase::_ptmf2ptf((const OSMetaClassBase *)this, v22);
      if (v5) {
        v4 = (IOReturn (__cdecl *)(void *, void *, UInt32, IOService *, void *, vm_size_t))v5;
      }
      else {
        v4 = 0;
      }
    }
    uint64_t v7 = registerPrioritySleepWakeInterest(v4, this, 0);
    uint64_t v8 = *((void *)this + 44);
    *((void *)this + 44) = v7;
    if (v7) {
      ((void (*)(IONotifier *))v7->retain)(v7);
    }
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 40))(v8);
    }
    PMRootDomain = IOService::getPMRootDomain();
    *((void *)this + 46) = PMRootDomain;
    if (PMRootDomain) {
      IOService::registerInterestedDriver(PMRootDomain, (IOService *)this);
    }
    v10 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "ConnectionNotificationType");
    v21 = v10;
    uint64_t v11 = OSDynamicPtrCast<OSString,OSObject>(&v21);
    if (v10) {
      ((void (*)(const OSMetaClassBase *))v10->release_0)(v10);
    }
    if (v11) {
      libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 27, (uint64_t)v11);
    }
    else {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Property %s not found\n", "ATC", "AppleDeviceManagementHIDEventService", "start", "ConnectionNotificationType");
    }
    v12 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "DisconnectionNotificationType");
    v21 = v12;
    v13 = OSDynamicPtrCast<OSString,OSObject>(&v21);
    if (v11) {
      ((void (*)(OSMetaClassBase *))v11->release_0)(v11);
    }
    if (v12) {
      ((void (*)(const OSMetaClassBase *))v12->release_0)(v12);
    }
    if (v13) {
      libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 28, (uint64_t)v13);
    }
    else {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Property %s not found\n", "ATC", "AppleDeviceManagementHIDEventService", "start", "DisconnectionNotificationType");
    }
    v14 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "PoweredOffNotificationType");
    v21 = v14;
    v15 = OSDynamicPtrCast<OSString,OSObject>(&v21);
    if (v13) {
      ((void (*)(OSMetaClassBase *))v13->release_0)(v13);
    }
    if (v14) {
      ((void (*)(const OSMetaClassBase *))v14->release_0)(v14);
    }
    if (v15) {
      libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 29, (uint64_t)v15);
    }
    else {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Property %s not found\n", "ATC", "AppleDeviceManagementHIDEventService", "start", "PoweredOffNotificationType");
    }
    v16 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "HostTransportSwitchNotificationType");
    v21 = v16;
    uint64_t v17 = OSDynamicPtrCast<OSString,OSObject>(&v21);
    if (v15) {
      ((void (*)(OSMetaClassBase *))v15->release_0)(v15);
    }
    if (v16) {
      ((void (*)(const OSMetaClassBase *))v16->release_0)(v16);
    }
    if (v17) {
      libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 30, (uint64_t)v17);
    }
    else {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Property %s not found\n", "ATC", "AppleDeviceManagementHIDEventService", "start", "HostTransportSwitchNotificationType");
    }
    v18 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "BatteryLowPowerDisconnectionNotificationType");
    v21 = v18;
    OSMetaClassBase::_ptf_t v6 = OSDynamicPtrCast<OSString,OSObject>(&v21);
    if (v17) {
      ((void (*)(OSMetaClassBase *))v17->release_0)(v17);
    }
    if (v18) {
      ((void (*)(const OSMetaClassBase *))v18->release_0)(v18);
    }
    if (v6) {
      libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 31, (uint64_t)v6);
    }
    else {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Property %s not found\n", "ATC", "AppleDeviceManagementHIDEventService", "start", "BatteryLowPowerDisconnectionNotificationType");
    }
    if (*((unsigned char *)this + 312)) {
      (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1936))(this);
    }
  }
  else
  {
    OSMetaClassBase::_ptf_t v6 = 0;
  }
  uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID((IORegistryEntry *)this);
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s [0x%llX] Successfully started\n", "ATC", "AppleDeviceManagementHIDEventService", "start", RegistryEntryID);
  if (v6) {
    ((void (*)(OSMetaClassBase *))v6->release_0)(v6);
  }
  return v3;
}

uint64_t AppleDeviceManagementHIDEventService::systemPowerChangeHandler(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1920))(a1);
}

OSMetaClassBase *OSDynamicPtrCast<OSString,OSObject>(const OSMetaClassBase **a1)
{
  v1 = OSMetaClassBase::safeMetaCast(*a1, OSString::metaClass);
  v2 = v1;
  if (v1) {
    ((void (*)(OSMetaClassBase *))v1->retain)(v1);
  }
  return v2;
}

uint64_t AppleDeviceManagementHIDEventService::stop(IOService *this, IOService *a2)
{
  uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s [0x%llX] Entered\n", "ATC", "AppleDeviceManagementHIDEventService", "stop", RegistryEntryID);
  reserved = this[2].IORegistryEntry::reserved;
  if (reserved)
  {
    (*(void (**)(IORegistryEntry::ExpansionData *))(*(void *)reserved + 312))(reserved);
    provider = this[2].__provider;
    if (provider) {
      ((void (*)(IOService *, IORegistryEntry::ExpansionData *))provider->init_0)(provider, this[2].IORegistryEntry::reserved);
    }
  }
  fRegistryTable = this[2].fRegistryTable;
  if (fRegistryTable)
  {
    ((void (*)(OSDictionary *))fRegistryTable->getObject_1)(fRegistryTable);
    uint64_t v8 = this[2].__provider;
    if (v8) {
      ((void (*)(IOService *, OSDictionary *))v8->init_0)(v8, this[2].fRegistryTable);
    }
  }
  fPropertyTable = this[2].fPropertyTable;
  if (fPropertyTable)
  {
    ((void (*)(OSDictionary *))fPropertyTable->getObject_1)(fPropertyTable);
    v10 = this[2].__provider;
    if (v10) {
      ((void (*)(IOService *, OSDictionary *))v10->init_0)(v10, this[2].fPropertyTable);
    }
  }
  uint64_t timeBusy = this[2].__timeBusy;
  if (timeBusy)
  {
    (*(void (**)(uint64_t))(*(void *)timeBusy + 120))(timeBusy);
    uint64_t v12 = this[2].__timeBusy;
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 40))(v12);
    }
    this[2].__uint64_t timeBusy = 0;
  }
  pwrMgt = (IOService *)this[2].pwrMgt;
  if (pwrMgt)
  {
    IOService::deRegisterInterestedDriver(pwrMgt, this);
    this[2].pwrMgt = 0;
  }

  return ((uint64_t (*)(IOService *, IOService *))stop)(this, a2);
}

uint64_t AppleDeviceManagementHIDEventService::didTerminate(AppleDeviceManagementHIDEventService *this, IOService *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v8 = *((void *)this + 43);
  if (v8) {
    (*(void (**)(uint64_t, AppleDeviceManagementHIDEventService *, void))(*(void *)v8 + 712))(v8, this, 0);
  }

  return ((uint64_t (*)(AppleDeviceManagementHIDEventService *, IOService *, uint64_t, BOOL *))didTerminate)(this, a2, a3, a4);
}

uint64_t AppleDeviceManagementHIDEventService::attach(AppleDeviceManagementHIDEventService *this, IOService *a2)
{
}

uint64_t AppleDeviceManagementHIDEventService::detach(AppleDeviceManagementHIDEventService *this, IOService *a2)
{
}

uint64_t AppleDeviceManagementHIDEventService::handleStart(AppleDeviceManagementHIDEventService *this, IOService *a2)
{
  if (result)
  {
    uint64_t v5 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 888))(this);
    uint64_t v6 = *((void *)this + 40);
    *((void *)this + 40) = v5;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 32))(v5);
    }
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
    }
    if (!*((void *)this + 40))
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s failed to get work loop\n", "ATC", "AppleDeviceManagementHIDEventService", "handleStart");
      return 0;
    }
    uint64_t v7 = *(void (__cdecl **)(OSObject *, IOTimerEventSource *))(*(void *)this + 1888);
    if (!v7)
    {
      v49.ptr = (void (*)(void))AppleDeviceManagementHIDEventService::handleDeviceInitDone;
      v49.adj = 0;
      OSMetaClassBase::_ptf_t v8 = OSMetaClassBase::_ptmf2ptf((const OSMetaClassBase *)this, v49);
      if (v8) {
        uint64_t v7 = (void (__cdecl *)(OSObject *, IOTimerEventSource *))v8;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    v9 = IOTimerEventSource::timerEventSource((OSObject *)this, v7);
    uint64_t v10 = *((void *)this + 38);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 40))(v10);
    }
    *((void *)this + 38) = v9;
    if (v9) {
      (*(void (**)(void, IOTimerEventSource *))(**((void **)this + 40) + 160))(*((void *)this + 40), v9);
    }
    uint64_t v11 = OSMetaClassBase::safeMetaCast(a2, IOHIDInterface::metaClass);
    uint64_t v12 = *((void *)this + 43);
    *((void *)this + 43) = v11;
    if (v11) {
      ((void (*)(OSMetaClassBase *))v11->retain)(v11);
    }
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 40))(v12);
    }
    uint64_t v13 = *((void *)this + 43);
    if (!v13) {
      return 0;
    }
    OSMetaClassBase::_ptf_t v14 = *(OSMetaClassBase::_ptf_t *)(*(void *)this + 1896);
    if (!v14)
    {
      v50.ptr = (void (*)(void))AppleDeviceManagementHIDEventService::handleInterruptReport;
      v50.adj = 0;
      OSMetaClassBase::_ptf_t v15 = OSMetaClassBase::_ptmf2ptf((const OSMetaClassBase *)this, v50);
      if (v15) {
        OSMetaClassBase::_ptf_t v14 = v15;
      }
      else {
        OSMetaClassBase::_ptf_t v14 = 0;
      }
    }
    int v16 = (*(uint64_t (**)(uint64_t, AppleDeviceManagementHIDEventService *, void, OSMetaClassBase::_ptf_t, void))(*(void *)v13 + 1344))(v13, this, 0, v14, 0);
    uint64_t result = 0;
    if (v16)
    {
      uint64_t v17 = this;
      while (1)
      {
        uint64_t v18 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const IORegistryPlane *))(*(void *)v17 + 376))(v17, gIOServicePlane);
        if (!v18) {
          break;
        }
        uint64_t v17 = (AppleDeviceManagementHIDEventService *)v18;
        v19 = (const OSMetaClass *)(*(uint64_t (**)(uint64_t))(*(void *)v18 + 56))(v18);
        ClassName = OSMetaClass::getClassName(v19);
        size_t v21 = strlen("AppleUSBVHCIPort");
        int v22 = strncmp(ClassName, "AppleUSBVHCIPort", v21);
        if (!v22) {
          goto LABEL_32;
        }
      }
      uint64_t v23 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1360))(this);
      LOBYTE(v22) = (*(uint64_t (**)(uint64_t, const char *))(*(void *)v23 + 184))(v23, "USB");
LABEL_32:
      *((unsigned char *)this + 312) = v22;
      uint64_t v24 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1360))(this);
      *((unsigned char *)this + 313) = (*(uint64_t (**)(uint64_t, const char *))(*(void *)v24 + 184))(v24, "Bluetooth");
      v25 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "CurrentBatteryPercentNotificationType");
      v48 = v25;
      v26 = OSDynamicPtrCast<OSString,OSObject>(&v48);
      if (v25) {
        ((void (*)(const OSMetaClassBase *))v25->release_0)(v25);
      }
      if (v26) {
        libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 25, (uint64_t)v26);
      }
      v27 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "BatteryLowNotificationType");
      v48 = v27;
      v28 = OSDynamicPtrCast<OSString,OSObject>(&v48);
      if (v26) {
        ((void (*)(OSMetaClassBase *))v26->release_0)(v26);
      }
      if (v27) {
        ((void (*)(const OSMetaClassBase *))v27->release_0)(v27);
      }
      if (v28) {
        libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 26, (uint64_t)v28);
      }
      v29 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "LowBatteryNotificationPercentage");
      v30 = OSMetaClassBase::safeMetaCast(v29, OSNumber::metaClass);
      v31 = v30;
      if (v30) {
        ((void (*)(OSMetaClassBase *))v30->retain)(v30);
      }
      if (v29) {
        ((void (*)(const OSMetaClassBase *))v29->release_0)(v29);
      }
      if (v31) {
        *((unsigned char *)this + 384) = ((uint64_t (*)(OSMetaClassBase *))v31->__vftable[1].serialize)(v31);
      }
      (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1792))(this);
      (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1808))(this);
      v32 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "Built-In");
      v33 = (const OSMetaClass *)OSBoolean::metaClass;
      v34 = OSMetaClassBase::safeMetaCast(v32, OSBoolean::metaClass);
      v35 = (OSBoolean *)v34;
      if (v32 && !v34) {
        ((void (*)(const OSMetaClassBase *))v32->release_0)(v32);
      }
      if (v35 == *kOSBooleanFalse)
      {
        v36 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "BluetoothDevice");
        v37 = OSMetaClassBase::safeMetaCast(v36, v33);
        v38 = (OSBoolean *)v37;
        if (v36 && !v37) {
          ((void (*)(const OSMetaClassBase *))v36->release_0)(v36);
        }
        v39 = kOSBooleanTrue;
        if (v38 == *kOSBooleanTrue) {
          (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1784))(this);
        }
        v40 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "HasBattery");
        v41 = OSMetaClassBase::safeMetaCast(v40, v33);
        v42 = (OSBoolean *)v41;
        if (v40 && !v41) {
          ((void (*)(const OSMetaClassBase *))v40->release_0)(v40);
        }
        if (v42 == *v39)
        {
          (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1752))(this);
          v43 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "SupportsExtendedBatteryState");
          v44 = OSMetaClassBase::safeMetaCast(v43, v33);
          v45 = (OSBoolean *)v44;
          if (v43 && !v44) {
            ((void (*)(const OSMetaClassBase *))v43->release_0)(v43);
          }
          if (v45 == *v39) {
            (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1760))(this);
          }
          if (v45) {
            ((void (*)(OSBoolean *))v45->release_0)(v45);
          }
        }
        if (v42) {
          ((void (*)(OSBoolean *))v42->release_0)(v42);
        }
        if (v38) {
          ((void (*)(OSBoolean *))v38->release_0)(v38);
        }
      }
      (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1888))(this);
      (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1856))(this);
      v46 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 328))(this, "LogPowerStateBeforeSleep");
      v47 = (OSBoolean *)OSMetaClassBase::safeMetaCast(v46, v33);
      if (v47)
      {
        *((unsigned char *)this + 328) = v47 == *kOSBooleanTrue;
        ((void (*)(OSBoolean *))v47->release_0)(v47);
        if (!v35)
        {
LABEL_75:
          if (v31) {
            ((void (*)(OSMetaClassBase *))v31->release_0)(v31);
          }
          if (v28) {
            ((void (*)(OSMetaClassBase *))v28->release_0)(v28);
          }
          return 1;
        }
      }
      else
      {
        if (v46) {
          ((void (*)(const OSMetaClassBase *))v46->release_0)(v46);
        }
        *((unsigned char *)this + 328) = *kOSBooleanTrue == 0;
        if (!v35) {
          goto LABEL_75;
        }
      }
      ((void (*)(OSBoolean *))v35->release_0)(v35);
      goto LABEL_75;
    }
  }
  return result;
}

uint64_t AppleDeviceManagementHIDEventService::handleDeviceInitDone(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1888))(a1);
}

uint64_t AppleDeviceManagementHIDEventService::handleInterruptReport(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1896))(a1);
}

void AppleDeviceManagementHIDEventService::handleInterruptReport(IOHIDEventService *this, unint64_t a2, IOMemoryDescriptor *a3, IOHIDReportType a4, int a5, void *a6)
{
  if (!IOHIDEventService::readyForReports(this)
    || IOService::isInactive(this)
    || !a3
    || !this[1].__timeBusy
    || !((uint64_t (*)(IOMemoryDescriptor *))a3->getLength)(a3))
  {
    return;
  }
  unint64_t v9 = ((uint64_t (*)(IOMemoryDescriptor *))a3->getLength)(a3);
  if (v9 > (*(uint64_t (**)(void))(*(void *)this[1].__timeBusy + 320))())
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Input report length (%llu bytes) > capacity. Dropping report.\n", "ATC", "AppleDeviceManagementHIDEventService", "handleInterruptReport", v9);
    return;
  }
  uint64_t v10 = (unsigned char *)(*(uint64_t (**)(uint64_t))(*(void *)this[1].__timeBusy + 328))(this[1].__timeBusy);
  unint64_t v11 = v9 - 1;
  ((void (*)(IOMemoryDescriptor *, uint64_t, unsigned char *, unint64_t))a3->readBytes)(a3, 1, v10, v11);
  if (a5 > 154)
  {
    if (a5 == 155)
    {
      isEqualTo = (void (*)(IOHIDEventService *, unsigned char *, unint64_t))this->__vftable[1].isEqualTo;
      OSMetaClassBase::_ptf_t v14 = this;
      OSMetaClassBase::_ptf_t v15 = v10;
      unint64_t v16 = v11;
    }
    else
    {
      if (a5 != 224) {
        goto LABEL_29;
      }
      isEqualTo = (void (*)(IOHIDEventService *, unsigned char *, unint64_t))this->__vftable[1].free;
      OSMetaClassBase::_ptf_t v14 = this;
      OSMetaClassBase::_ptf_t v15 = v10;
      unint64_t v16 = v11;
    }
    isEqualTo(v14, v15, v16);
    return;
  }
  if (a5 != 96)
  {
    if (a5 == 144)
    {
      getMetaClass = this->__vftable[1].getMetaClass;
      ((void (*)(IOHIDEventService *, unsigned char *, unint64_t, void))getMetaClass)(this, v10, v11, 0);
      return;
    }
LABEL_29:
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Ignoring interrupt report id = 0x%08x, length = %llu\n", "ATC", "AppleDeviceManagementHIDEventService", "handleInterruptReport", a5, v11);
    return;
  }
  if (v11 == 1 && *v10 == 2)
  {
    uint64_t v17 = *(void *)&this[1].initialized;
    if (v17)
    {
      uint64_t v18 = *(void (**)(void))(*(void *)v17 + 248);
      v18();
    }
  }
}

void AppleDeviceManagementHIDEventService::getBatteryState(AppleDeviceManagementHIDEventService *this)
{
  memset(v7, 0, sizeof(v7));
  int v2 = 5;
  unsigned int v6 = 512;
  do
  {
    int v3 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, uint64_t, _OWORD *, unsigned int *, void))(*(void *)this + 1904))(this, 144, v7, &v6, 0);
    int v4 = v2--;
    if (v3) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
  }
  while (!v5);
  if (v3) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not get battery status (reportID = 0x%02x, Return Value = 0x%08x)\n", "ATC", "AppleDeviceManagementHIDEventService", "getBatteryState", 144, v3);
  }
  else {
    (*(void (**)(AppleDeviceManagementHIDEventService *, _OWORD *, void, void))(*(void *)this + 1768))(this, v7, v6, 0);
  }
}

void AppleDeviceManagementHIDEventService::getBatteryStateExtended(AppleDeviceManagementHIDEventService *this)
{
  memset(v7, 0, sizeof(v7));
  int v2 = 5;
  unsigned int v6 = 512;
  do
  {
    int v3 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, uint64_t, _OWORD *, unsigned int *, void))(*(void *)this + 1904))(this, 155, v7, &v6, 0);
    int v4 = v2--;
    if (v3) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
  }
  while (!v5);
  if (v3) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not get battery status (reportID = 0x%02x, Return Value = 0x%08x)\n", "ATC", "AppleDeviceManagementHIDEventService", "getBatteryStateExtended", 155, v3);
  }
  else {
    (*(void (**)(AppleDeviceManagementHIDEventService *, _OWORD *, void))(*(void *)this + 1776))(this, v7, v6);
  }
}

void AppleDeviceManagementHIDEventService::processBatteryState(AppleDeviceManagementHIDEventService *this, unsigned __int8 *a2, unint64_t a3)
{
  if (a3 > 1)
  {
    if (HIDWORD(a3)) {
      os_detail::panic_trapping_policy::trap("bounded_array_ref: Can't construct from a size greater than UINT32_MAX");
    }
    if (&a2[a3] < a2 || HIDWORD(a3)) {
      os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
    }
    if ((a3 & 0xFFFFFFFE) == 0) {
      os_detail::panic_trapping_policy::trap("bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally");
    }
    uint64_t v3 = a2 == (unsigned __int8 *)-1;
    uint64_t v4 = v3 << 63 >> 63;
    if (v4 != v3 || v4 < 0) {
      os_detail::panic_trapping_policy::trap("This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.");
    }
    uint64_t v6 = *a2;
    uint64_t v7 = a2[1];
    (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, uint64_t, uint64_t))(*(void *)this + 224))(this, "BatteryStatusFlags", v6, 8);
    (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, uint64_t, uint64_t))(*(void *)this + 224))(this, "BatteryPercent", v7, 8);
    *((unsigned char *)this + 376) = v6;
    *((unsigned char *)this + 377) = v7;
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Report ID 0x%02X payload has invalid size %llu\n", "ATC", "AppleDeviceManagementHIDEventService", "processBatteryState", 144, a3);
  }
}

void AppleDeviceManagementHIDEventService::processBatteryStateExtended(AppleDeviceManagementHIDEventService *this, unsigned __int8 *a2, unint64_t a3)
{
  if (a3 <= 0xC)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Report ID 0x%02X payload has invalid size %llu\n", "ATC", "AppleDeviceManagementHIDEventService", "processBatteryStateExtended", 155, a3);
    return;
  }
  if (HIDWORD(a3)) {
    os_detail::panic_trapping_policy::trap("bounded_array_ref: Can't construct from a size greater than UINT32_MAX");
  }
  unsigned int v4 = a3;
  if (&a2[a3] < a2 || HIDWORD(a3)) {
    os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
  }
  if (a3 <= 2) {
    goto LABEL_45;
  }
  uint64_t v5 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFELL;
  uint64_t v6 = v5 << 63 >> 63;
  if (v6 != v5 || v6 < 0) {
    goto LABEL_46;
  }
  OSMetaClassBase::_ptf_t v8 = OSNumber::withNumber(a2[2], 8u);
  int v9 = ((uint64_t (*)(OSNumber *))v8->unsigned8BitValue)(v8);
  if ((v4 & 0xFFFFFFFC) == 0) {
    goto LABEL_45;
  }
  uint64_t v10 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v11 = v10 << 63 >> 63;
  if (v11 != v10 || v11 < 0) {
LABEL_46:
  }
    os_detail::panic_trapping_policy::trap("This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.");
  int v12 = v9;
  int v13 = *((unsigned __int8 *)this + 378);
  OSMetaClassBase::_ptf_t v14 = OSNumber::withNumber(a2[3], 8u);
  if (v4 <= 4) {
LABEL_45:
  }
    os_detail::panic_trapping_policy::trap("bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally");
  uint64_t v15 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v16 = v15 << 63 >> 63;
  if (v16 != v15 || v16 < 0) {
    goto LABEL_46;
  }
  uint64_t v17 = v14;
  uint64_t v18 = OSNumber::withNumber(a2[4], 8u);
  v19 = OSNumber::withNumber(*(unsigned int *)(a2 + 5), 0x20u);
  v20 = OSNumber::withNumber(*(unsigned int *)(a2 + 9), 0x20u);
  size_t v21 = OSDictionary::withCapacity(5u);
  anObject = v17;
  if (v17) {
    ((void (*)(OSMetaClassBase *))v17->retain)(v17);
  }
  OSDictionary::setObject(v21, "CurrentState", (const OSMetaClassBase *const *)&anObject);
  if (anObject) {
    ((void (*)(OSMetaClassBase *))anObject->release_0)(anObject);
  }
  anObject = v18;
  if (v18) {
    ((void (*)(OSNumber *))v18->retain)(v18);
  }
  OSDictionary::setObject(v21, "PreviousState", (const OSMetaClassBase *const *)&anObject);
  if (anObject) {
    ((void (*)(OSMetaClassBase *))anObject->release_0)(anObject);
  }
  anObject = v19;
  if (v19) {
    ((void (*)(OSNumber *))v19->retain)(v19);
  }
  OSDictionary::setObject(v21, "CurrentStateSeconds", (const OSMetaClassBase *const *)&anObject);
  if (anObject) {
    ((void (*)(OSMetaClassBase *))anObject->release_0)(anObject);
  }
  anObject = v20;
  if (v20) {
    ((void (*)(OSNumber *))v20->retain)(v20);
  }
  OSDictionary::setObject(v21, "PreviousStateSeconds", (const OSMetaClassBase *const *)&anObject);
  if (anObject) {
    ((void (*)(OSMetaClassBase *))anObject->release_0)(anObject);
  }
  anObject = v8;
  ((void (*)(OSNumber *))v8->retain)(v8);
  OSDictionary::setObject(v21, "BatteryPercentTrue", (const OSMetaClassBase *const *)&anObject);
  if (anObject) {
    ((void (*)(OSMetaClassBase *))anObject->release_0)(anObject);
  }
  (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, OSDictionary *))(*(void *)this + 200))(this, "KioskMode", v21);
  *((unsigned char *)this + 378) = v12;
  (*(void (**)(AppleDeviceManagementHIDEventService *, unsigned __int8 *, uint64_t, BOOL))(*(void *)this + 1768))(this, a2, 2, v12 != v13);
  if (v21) {
    ((void (*)(OSDictionary *))v21->release_0)(v21);
  }
  if (v20) {
    ((void (*)(OSNumber *))v20->release_0)(v20);
  }
  if (v19) {
    ((void (*)(OSNumber *))v19->release_0)(v19);
  }
  if (v18) {
    ((void (*)(OSNumber *))v18->release_0)(v18);
  }
  if (v17) {
    ((void (*)(OSMetaClassBase *))v17->release_0)(v17);
  }
  ((void (*)(OSNumber *))v8->release_0)(v8);
}

uint64_t libkern::bounded_array_ref<unsigned char,os_detail::panic_trapping_policy>::slice(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ((a3 + a2) >> 32) {
    os_detail::panic_trapping_policy::trap("bounded_array_ref: n + m is larger than the size of any bounded_array_ref");
  }
  if (a3 + a2 > *(unsigned int *)(a1 + 8)) {
    os_detail::panic_trapping_policy::trap("bounded_array_ref: invalid slice provided, the indices are of bounds for the bounded_array_ref");
  }
  if (HIDWORD(a3)) {
    os_detail::panic_trapping_policy::trap("bounded_array_ref: Can't construct from a size greater than UINT32_MAX");
  }
  return *(void *)a1 + a2;
}

void AppleDeviceManagementHIDEventService::getBluetoothInfo(AppleDeviceManagementHIDEventService *this)
{
  if (!*((unsigned char *)this + 329))
  {
    int v2 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *))(*(void *)this + 280))(this, "BluetoothDevice");
    if (OSMetaClassBase::safeMetaCast(v2, OSBoolean::metaClass) == *(OSMetaClassBase **)kOSBooleanFalse)
    {
      *((unsigned char *)this + 329) = 1;
    }
    else
    {
      memset(v10, 0, sizeof(v10));
      int v6 = 512;
      *(void *)__str = 0;
      uint64_t v8 = 0;
      int v9 = 0;
      int v3 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, uint64_t, _OWORD *, int *, uint64_t))(*(void *)this + 1904))(this, 52, v10, &v6, 2);
      if (v3)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s simpleGetReport for reportID 0x%02x returned 0x%08X\n", "ATC", "AppleDeviceManagementHIDEventService", "getBluetoothInfo", 52, v3);
      }
      else if (v6 == 76)
      {
        if (LOBYTE(v10[0]) == 3)
        {
          snprintf(__str, 0x14uLL, "%02x-%02x-%02x-%02x-%02x-%02x", BYTE3(v10[0]), BYTE4(v10[0]), BYTE5(v10[0]), BYTE6(v10[0]), BYTE7(v10[0]), BYTE8(v10[0]));
          unsigned int v4 = OSData::withBytes((char *)v10 + 3, 6u);
          if (v4) {
            (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, OSData *))(*(void *)this + 200))(this, "BD_ADDR", v4);
          }
          (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, char *))(*(void *)this + 208))(this, "DeviceAddress", __str);
          uint64_t v5 = OSNumber::withNumber(*(unsigned __int16 *)((char *)v10 + 1), 0x10u);
          if (v5) {
            (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, OSNumber *))(*(void *)this + 200))(this, "BTFW Version", v5);
          }
          *((unsigned char *)this + 329) = 1;
          if (v4) {
            ((void (*)(OSData *))v4->release_0)(v4);
          }
          if (v5) {
            ((void (*)(OSNumber *))v5->release_0)(v5);
          }
        }
        else
        {
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s reportVersion mismatch: bluetoothInfo->reportVersion = %u, BT_INFO_STRUCT_VERSION = %u\n", "ATC", "AppleDeviceManagementHIDEventService", "getBluetoothInfo", LOBYTE(v10[0]), 3);
        }
      }
      else
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s getReport result size (%d) does not match BTInfo struct size (%lu)\n", "ATC", "AppleDeviceManagementHIDEventService", "getBluetoothInfo", v6, 76);
      }
    }
  }
}

uint64_t AppleDeviceManagementHIDEventService::getFirmwareVersions(AppleDeviceManagementHIDEventService *this)
{
  memset(v18, 0, sizeof(v18));
  if (!(*(unsigned int (**)(void))(*(void *)this + 1904))())
  {
    unsigned int v3 = 0;
    for (i = 0; ; unsigned int v3 = i)
    {
      int v5 = *(unsigned __int16 *)((char *)v18 + i);
      int v6 = OSNumber::withNumber(*(unsigned __int16 *)((char *)v18 + (v3 | 2)), 0x10u);
      if (v6)
      {
        uint64_t v7 = v6;
        if (v5 > 159)
        {
          if (v5 <= 191)
          {
            uint64_t v17 = "BootLoaderFW Version";
            if (v5 != 176) {
              uint64_t v17 = "UnknownFW Version";
            }
            if (v5 == 160) {
              int v12 = "VibeWaveformFW Version";
            }
            else {
              int v12 = v17;
            }
          }
          else
          {
            switch(v5)
            {
              case 192:
                __asm { BTI             j; jumptable 00000000000078AC case 192 }
                int v12 = "KeyCalFW Version";
                break;
              case 193:
                __asm { BTI             j; jumptable 00000000000078AC case 193 }
                int v12 = "MTCalFW Version";
                break;
              case 194:
                __asm { BTI             j; jumptable 00000000000078AC case 194 }
                int v12 = "ForceCalFW Version";
                break;
              case 195:
                __asm { BTI             j; jumptable 00000000000078AC case 195 }
                int v12 = "ActCalFW Version";
                break;
              case 196:
                __asm { BTI             j; jumptable 00000000000078AC case 196 }
                int v12 = "AccelCalFW Version";
                break;
              case 197:
                __asm { BTI             j; jumptable 00000000000078AC case 197 }
                int v12 = "AudioCalFW Version";
                break;
              default:
                if (v5 == 223) {
                  int v12 = "TestFW Version";
                }
                else {
                  int v12 = "UnknownFW Version";
                }
                break;
            }
          }
        }
        else
        {
          uint64_t v8 = "TrustedAccessoryFW Version";
          if (v5 != 112) {
            uint64_t v8 = "UnknownFW Version";
          }
          if (v5 == 96) {
            uint64_t v8 = "AccelAlgsFW Version";
          }
          if (v5 == 88) {
            uint64_t v8 = "PowerFW Version";
          }
          int v9 = "ChargerFW Version";
          if (v5 != 80) {
            int v9 = "UnknownFW Version";
          }
          if (v5 == 65) {
            int v9 = "AudioCalFW Version";
          }
          if (v5 <= 87) {
            uint64_t v8 = v9;
          }
          if (v5 == 64) {
            uint64_t v10 = "AudioFW Version";
          }
          else {
            uint64_t v10 = "UnknownFW Version";
          }
          if (v5 == 49) {
            uint64_t v10 = "RadioDiagsFW Version";
          }
          if (v5 == 48) {
            uint64_t v10 = "RadioFW Version";
          }
          if (v5 == 32) {
            uint64_t v11 = "MTFW Version";
          }
          else {
            uint64_t v11 = "UnknownFW Version";
          }
          if (v5 == 1) {
            uint64_t v11 = "STFW Version";
          }
          if (v5 <= 47) {
            uint64_t v10 = v11;
          }
          if (v5 <= 64) {
            int v12 = v10;
          }
          else {
            int v12 = v8;
          }
        }
        (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, OSNumber *))(*(void *)this
                                                                                                 + 200))(this, v12, v6);
        ((void (*)(OSNumber *))v7->release_0)(v7);
      }
      i += 4;
    }
  }
  return (*(uint64_t (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1800))(this);
}

void AppleDeviceManagementHIDEventService::getSTFirmwareVersion(AppleDeviceManagementHIDEventService *this)
{
  int v1 = (*(uint64_t (**)(void))(*(void *)this + 1904))();
  if (v1) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s simpleGetReport for reportID 0x%02x returned 0x%08x\n", "ATC", "AppleDeviceManagementHIDEventService", "getSTFirmwareVersion", 180, v1);
  }
  else {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s getReport result size (%u) does not match expected size (%lu)\n", "ATC", "AppleDeviceManagementHIDEventService", "getSTFirmwareVersion", 512, 2);
  }
}

void AppleDeviceManagementHIDEventService::getHardwareId(AppleDeviceManagementHIDEventService *this)
{
  int v1 = (*(uint64_t (**)(void))(*(void *)this + 1904))();
  if (v1) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s simpleGetReport for reportID 0x%02x returned 0x%08x\n", "ATC", "AppleDeviceManagementHIDEventService", "getHardwareId", 188, v1);
  }
  else {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s getReport result size (%u) does not match expected size (%lu)\n", "ATC", "AppleDeviceManagementHIDEventService", "getHardwareId", 512, 2);
  }
}

uint64_t AppleDeviceManagementHIDEventService::handleDeviceInitDone(AppleDeviceManagementHIDEventService *this)
{
  return (*(uint64_t (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 1816))(this);
}

void AppleDeviceManagementHIDEventService::getCriticalError(AppleDeviceManagementHIDEventService *this)
{
  memset(v3, 0, sizeof(v3));
  int v2 = (*(uint64_t (**)(void))(*(void *)this + 1904))();
  if (v2) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not get critical error (reportID = 0x%02x, Return Value = 0x%08x)\n", "ATC", "AppleDeviceManagementHIDEventService", "getCriticalError", 224, v2);
  }
  else {
    (*(void (**)(AppleDeviceManagementHIDEventService *, _OWORD *, uint64_t))(*(void *)this + 1824))(this, v3, 512);
  }
}

BOOL AppleDeviceManagementHIDEventService::processCriticalError(AppleDeviceManagementHIDEventService *this, unsigned __int8 *a2, uint64_t a3)
{
  if (a3 == 4)
  {
    if (a2 + 4 < a2) {
      os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
    }
    uint64_t v5 = *(unsigned int *)a2;
    if (v5 && v5 != *((_DWORD *)this + 95))
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Received Critical Error: 0x%08x\n", "ATC", "AppleDeviceManagementHIDEventService", "processCriticalError", v5);
      (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, uint64_t, uint64_t))(*(void *)this + 224))(this, "LastCriticalError", v5, 32);
    }
    *((_DWORD *)this + 95) = v5;
  }
  return a3 == 4;
}

void AppleDeviceManagementHIDEventService::getWakeReason(AppleDeviceManagementHIDEventService *this)
{
  memset(v3, 0, sizeof(v3));
  int v2 = (*(uint64_t (**)(void))(*(void *)this + 1904))();
  if (v2)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not get wake reason (reportID = 0x%02x, Return Value = 0x%08x)\n", "ATC", "AppleDeviceManagementHIDEventService", "getWakeReason", 197, v2);
  }
  else if (((*(uint64_t (**)(AppleDeviceManagementHIDEventService *, _OWORD *, uint64_t))(*(void *)this {
                                                                                                  + 1840))(this, v3, 512) & 1) == 0)
  }
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not process wake reason\n", "ATC", "AppleDeviceManagementHIDEventService", "getWakeReason");
  }
}

BOOL AppleDeviceManagementHIDEventService::processWakeReason(AppleDeviceManagementHIDEventService *this, unsigned __int8 *a2, unint64_t a3)
{
  if (HIDWORD(a3)) {
    os_detail::panic_trapping_policy::trap("bounded_array_ref: Can't construct from a size greater than UINT32_MAX");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  *(_OWORD *)__str = 0u;
  long long v13 = 0u;
  if (a3 == 1)
  {
    if (a2 + 1 < a2) {
      os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
    }
    unsigned int v5 = *a2;
    if (v5 <= 0x1F)
    {
      int v6 = "Unknown";
      switch(*a2)
      {
        case 0u:
          goto LABEL_23;
        case 1u:
          __asm { BTI             j; jumptable 000000000000829C case 1 }
          int v6 = "Host";
          break;
        case 2u:
          __asm { BTI             j; jumptable 000000000000829C case 2 }
          int v6 = "Keyboard";
          break;
        case 3u:
          __asm { BTI             j; jumptable 000000000000829C case 3 }
          int v6 = "Button";
          break;
        case 4u:
          __asm { BTI             j; jumptable 000000000000829C case 4 }
          int v6 = "Trackpad";
          break;
        case 5u:
          __asm { BTI             j; jumptable 000000000000829C case 5 }
          int v6 = "Accel";
          break;
        case 6u:
          __asm { BTI             j; jumptable 000000000000829C case 6 }
          int v6 = "Battery";
          break;
        case 7u:
          __asm { BTI             j; jumptable 000000000000829C case 7 }
          int v6 = "PowerSwitch";
          break;
        default:
          goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (*a2 > 0x3Fu)
    {
      if (v5 == 64)
      {
        int v6 = "ControlData";
        goto LABEL_23;
      }
      if (v5 == 224)
      {
        int v6 = "CriticalErrors";
        goto LABEL_23;
      }
    }
    else
    {
      if (v5 == 32)
      {
        int v6 = "Message";
        goto LABEL_23;
      }
      if (v5 == 33)
      {
        int v6 = "AutoInputReport";
LABEL_23:
        __asm { BTI             j; jumptable 000000000000829C case 0 }
        snprintf(__str, 0x100uLL, "%s (0x%02X)", v6, v5);
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Wake reason: %s\n", "ATC", "AppleDeviceManagementHIDEventService", "processWakeReason", __str);
        (*(void (**)(AppleDeviceManagementHIDEventService *, const char *, char *))(*(void *)this + 208))(this, "WakeReason", __str);
        return a3 == 1;
      }
    }
LABEL_22:
    int v6 = "Invalid";
    goto LABEL_23;
  }
  return a3 == 1;
}

uint64_t AppleDeviceManagementHIDEventService::setWakeReason(AppleDeviceManagementHIDEventService *this, char a2)
{
  char v5 = a2;
  uint64_t v2 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, uint64_t, char *, uint64_t))(*(void *)this + 1912))(this, 197, &v5, 1);
  uint64_t v3 = v2;
  if (v2) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Error setting wake reason (reportID = 0x%02x, Return Value = 0x%08x)\n", "ATC", "AppleDeviceManagementHIDEventService", "setWakeReason", 197, v2);
  }
  return v3;
}

uint64_t AppleDeviceManagementHIDEventService::getDeviceColor(AppleDeviceManagementHIDEventService *this)
{
  memset(v5, 0, sizeof(v5));
  int v4 = 512;
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Getting device color, legacy devices may not support this.\n", "ATC", "AppleDeviceManagementHIDEventService", "getDeviceColor");
  uint64_t v2 = 0;
  if (!(*(unsigned int (**)(AppleDeviceManagementHIDEventService *, uint64_t, _OWORD *, int *, uint64_t))(*(void *)this + 1904))(this, 20, v5, &v4, 2)&& v4 == 1)
  {
    uint64_t v2 = LOBYTE(v5[0]);
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Device Color ID = [%u]\n", "ATC", "AppleDeviceManagementHIDEventService", "getDeviceColor", LOBYTE(v5[0]));
  }
  return (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *, uint64_t, uint64_t))(*(void *)this + 224))(this, "ColorID", v2, 8);
}

void AppleDeviceManagementHIDEventService::getDevicePowerState(AppleDeviceManagementHIDEventService *this)
{
  int v1 = (*(uint64_t (**)(void))(*(void *)this + 1904))();
  if (v1) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not get system power state (reportID = 0x%02x, Return Value = 0x%08x)\n", "ATC", "AppleDeviceManagementHIDEventService", "getDevicePowerState", 205, v1);
  }
}

uint64_t AppleDeviceManagementHIDEventService::getSerialNumber(AppleDeviceManagementHIDEventService *this)
{
  uint64_t result = *((void *)this + 42);
  if (!result)
  {
    uint64_t v3 = (void *)((char *)this + 336);
    libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset((uint64_t *)this + 42, v4);
    uint64_t v5 = *((void *)this + 42);
    if (!v5
      || (int v6 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v5 + 168))(v5),
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Serial number fetched from super: %s\n", "ATC", "AppleDeviceManagementHIDEventService", "getSerialNumber", v6), (uint64_t result = *v3) == 0))
    {
      uint64_t v7 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, const char *, const IORegistryPlane *, uint64_t))(*(void *)this + 120))(this, "SerialNumber", gIOServicePlane, 3);
      *(void *)&v14[4] = v7;
      uint64_t v8 = OSDynamicPtrCast<OSString,OSObject>((const OSMetaClassBase **)&v14[4]);
      uint64_t v9 = *((void *)this + 42);
      if (v9) {
        (*(void (**)(uint64_t))(*(void *)v9 + 40))(v9);
      }
      void *v3 = v8;
      if (v8)
      {
        uint64_t v10 = (const char *)((uint64_t (*)(OSMetaClassBase *))v8->__vftable[1].isEqualTo)(v8);
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Serial number fetched from parents: %s\n", "ATC", "AppleDeviceManagementHIDEventService", "getSerialNumber", v10);
      }
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 40))(v7);
      }
      uint64_t result = *v3;
      if (!*v3)
      {
        memset(&v14[4], 0, 512);
        *(_DWORD *)long long v14 = 512;
        if (!(*(unsigned int (**)(AppleDeviceManagementHIDEventService *, uint64_t, unsigned char *, unsigned char *, uint64_t))(*(void *)this + 1904))(this, 17, &v14[4], v14, 2)&& *(_DWORD *)v14)
        {
          uint64_t v12 = OSString::withCString((OSString *)&v14[4], (const char *)*(unsigned int *)v14, v11);
          if (*v3) {
            (*(void (**)(void))(*(void *)*v3 + 40))(*v3);
          }
          void *v3 = v12;
          long long v13 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 168))(v12);
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Serial number fetched from feature report: %s\n", "ATC", "AppleDeviceManagementHIDEventService", "getSerialNumber", v13);
        }
        return *v3;
      }
    }
  }
  return result;
}

uint64_t *libkern::intrusive_shared_ptr<OSString,intrusive_osobject_retainer>::reset(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 32))(a2);
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  return a1;
}

uint64_t AppleDeviceManagementHIDEventService::getProductID(AppleDeviceManagementHIDEventService *this)
{
  if (!result)
  {
    memset(v6, 0, sizeof(v6));
    int v5 = 512;
    int v3 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, uint64_t, _OWORD *, int *, uint64_t))(*(void *)this + 1904))(this, 21, v6, &v5, 2);
    if (v5 == 2 && v3 == 0) {
      return LOWORD(v6[0]);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t AppleDeviceManagementHIDEventService::simpleGetReport(const IOService *this, uint64_t a2, unsigned __int8 *a3, unsigned int *a4, uint64_t a5)
{
  uint64_t v10 = 3758097111;
  if (!IOService::isInactive(this))
  {
    if (*(void *)this[2].__state)
    {
      uint64_t v10 = 3758097090;
      if (a3)
      {
        if (a4)
        {
          vm_size_t v11 = *a4;
          if (v11 <= 0x200)
          {
            uint64_t v12 = IOBufferMemoryDescriptor::withCapacity(v11, 3u, 0);
            if (v12)
            {
              long long v13 = v12;
              uint64_t v10 = (*(uint64_t (**)(void, IOBufferMemoryDescriptor *, uint64_t, uint64_t, void))(**(void **)this[2].__state + 1464))(*(void *)this[2].__state, v12, a5, a2, 0);
              if (!v10
                && (unint64_t)((uint64_t (*)(IOBufferMemoryDescriptor *))v13->getLength)(v13) >= 2)
              {
                *a4 = ((uint64_t (*)(IOBufferMemoryDescriptor *))v13->getLength)(v13) - 1;
                uint64_t v14 = ((uint64_t (*)(IOBufferMemoryDescriptor *))v13->getBytesNoCopy)(v13);
                uint64_t v19 = 0;
                unint64_t v15 = ((uint64_t (*)(IOBufferMemoryDescriptor *))v13->getLength)(v13);
                uint64_t v18 = v14;
                LODWORD(v19) = v15;
                if (HIDWORD(v15)) {
                  os_detail::panic_trapping_policy::trap("bounded_array_ref: Can't construct from a size greater than UINT32_MAX");
                }
                long long v16 = (const void *)libkern::bounded_array_ref<unsigned char,os_detail::panic_trapping_policy>::slice((uint64_t)&v18, 1, *a4);
                memmove(a3, v16, *a4);
              }
              ((void (*)(IOBufferMemoryDescriptor *))v13->release_0)(v13);
            }
            else
            {
              return 3758097086;
            }
          }
          else
          {
            return 3758097128;
          }
        }
      }
    }
  }
  return v10;
}

uint64_t AppleDeviceManagementHIDEventService::simpleSetReport(const IOService *this, char a2, unsigned __int8 *a3, unsigned int a4)
{
  uint64_t v8 = 3758097111;
  if (IOService::isInactive(this)) {
    return v8;
  }
  if (!*(void *)this[2].__state) {
    return v8;
  }
  uint64_t v8 = 3758097090;
  if (!a3 || !a4) {
    return v8;
  }
  vm_size_t v9 = a4 + 1;
  if (v9 > 0x200) {
    return 3758097128;
  }
  uint64_t v10 = IOBufferMemoryDescriptor::withCapacity(v9, 3u, 0);
  if (!v10) {
    return 3758097086;
  }
  vm_size_t v11 = v10;
  uint64_t v12 = (unsigned char *)((uint64_t (*)(IOBufferMemoryDescriptor *))v10->getBytesNoCopy)(v10);
  uint64_t v18 = 0;
  unint64_t v13 = ((uint64_t (*)(IOBufferMemoryDescriptor *))v11->getLength)(v11);
  long long v17 = v12;
  LODWORD(v18) = v13;
  if (HIDWORD(v13)) {
    os_detail::panic_trapping_policy::trap("bounded_array_ref: Can't construct from a size greater than UINT32_MAX");
  }
  if (&v12[v13] < v12 || HIDWORD(v13)) {
    os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
  }
  if (!v13) {
    os_detail::panic_trapping_policy::trap("bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally");
  }
  unsigned char *v12 = a2;
  uint64_t v14 = (void *)libkern::bounded_array_ref<unsigned char,os_detail::panic_trapping_policy>::slice((uint64_t)&v17, 1, a4);
  memmove(v14, a3, a4);
  uint64_t v15 = (*(uint64_t (**)(void, IOBufferMemoryDescriptor *))(**(void **)this[2].__state + 1456))(*(void *)this[2].__state, v11);
  ((void (*)(IOBufferMemoryDescriptor *))v11->release_0)(v11);
  return v15;
}

uint64_t AppleDeviceManagementHIDEventService::systemPowerChangeHandler(AppleDeviceManagementHIDEventService *this, void *a2, int a3, IOService *a4, _DWORD *a5)
{
  if (a3 == -536870080)
  {
    int v6 = a5[4];
    int v5 = a5[5];
    int v7 = a5[2];
    if (v7 == 1)
    {
      if ((v6 & 1) != 0 && (v5 & 1) == 0 && *((unsigned char *)this + 328)) {
        AppleDeviceManagementHIDEventService::getDevicePowerState(this);
      }
    }
    else if (v7 == 2 && (v6 & 1) == 0 && (v5 & 1) != 0)
    {
      (*(void (**)(AppleDeviceManagementHIDEventService *, void *))(*(void *)this + 1872))(this, a2);
    }
  }
  return 0;
}

void AppleDeviceManagementHIDEventService::scheduleResumeFromSleep(AppleDeviceManagementHIDEventService *this)
{
  if (*((void *)this + 45))
  {
    uint64_t v2 = *((void *)this + 49);
    *((void *)this + 49) = this;
    (*(void (**)(AppleDeviceManagementHIDEventService *))(*(void *)this + 32))(this);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
    }
    if (thread_call_enter(*((thread_call_t *)this + 45)) == 1)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Resume from sleep thread call is already pending\n", "ATC", "AppleDeviceManagementHIDEventService", "scheduleResumeFromSleep");
      uint64_t v3 = *((void *)this + 49);
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
      }
      *((void *)this + 49) = 0;
    }
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s _resumeFromSleepThread is NULL\n", "ATC", "AppleDeviceManagementHIDEventService", "scheduleResumeFromSleep");
  }
}

uint64_t AppleDeviceManagementHIDEventService::_resumeFromSleepGated(const IOService *this)
{
  uint64_t result = IOService::isInactive(this);
  if ((result & 1) == 0)
  {
    if (LOBYTE(this[2].reserved)) {
      ((void (*)(const IOService *))this->__vftable[1].init_1)(this);
    }
    uint64_t v3 = (const OSMetaClassBase *)((uint64_t (*)(const IOService *, const char *))this->copyProperty_4)(this, "Built-In");
    uint64_t v4 = (const OSMetaClass *)OSBoolean::metaClass;
    int v5 = OSMetaClassBase::safeMetaCast(v3, OSBoolean::metaClass);
    int v6 = (OSBoolean *)v5;
    if (v3) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      ((void (*)(const OSMetaClassBase *))v3->release_0)(v3);
    }
    uint64_t v8 = (const OSMetaClassBase *)((uint64_t (*)(const IOService *, const char *))this->copyProperty_4)(this, "HasBattery");
    vm_size_t v9 = OSMetaClassBase::safeMetaCast(v8, v4);
    uint64_t v10 = (OSBoolean *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      ((void (*)(const OSMetaClassBase *))v8->release_0)(v8);
    }
    if (v6 == *kOSBooleanFalse && v10 == *kOSBooleanTrue) {
      ((void (*)(const IOService *))this->__vftable[1].isChild)(this);
    }
    uint64_t result = ((uint64_t (*)(const IOService *))this->__vftable[1].detachAbove)(this);
    if (v10) {
      uint64_t result = ((uint64_t (*)(OSBoolean *))v10->release_0)(v10);
    }
    if (v6)
    {
      release_0 = v6->release_0;
      return ((uint64_t (*)(OSBoolean *))release_0)(v6);
    }
  }
  return result;
}

uint64_t AppleDeviceManagementHIDEventService::_resumeFromSleepGated(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1880))(a1);
}

uint64_t AppleDeviceManagementHIDEventService::powerStateWillChangeTo(IOService **this, char a2, unint64_t a3, IOService *a4)
{
  if ((a2 & 0x84) != 0 && this[46] == a4 && *((unsigned char *)this + 312)) {
    ((void (*)(IOService **))(*this)[14].fRegistryTable)(this);
  }
  return v7;
}

uint64_t AppleDeviceManagementHIDEventService::prepareDeviceForSystemSleep(AppleDeviceManagementHIDEventService *this)
{
  return (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, uint64_t))(*(void *)this + 1864))(this, 1);
}

uint64_t AppleDeviceManagementHIDEventService::prepareDeviceForIdleSleep(AppleDeviceManagementHIDEventService *this)
{
  return (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, void))(*(void *)this + 1864))(this, 0);
}

uint64_t AppleDeviceManagementHIDEventService::setUSBSleepOnSuspend(AppleDeviceManagementHIDEventService *this, char a2)
{
  char v5 = a2;
  uint64_t v2 = (*(uint64_t (**)(AppleDeviceManagementHIDEventService *, uint64_t, char *, uint64_t))(*(void *)this + 1912))(this, 195, &v5, 1);
  uint64_t v3 = v2;
  if (v2) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not set USB sleep on suspend (reportID = 0x%02x, Return Value = 0x%08x\n", "ATC", "AppleDeviceManagementHIDEventService", "setUSBSleepOnSuspend", 195, v2);
  }
  return v3;
}

void os_detail::panic_trapping_policy::trap(const char *message)
{
}

{
  panic("\"%s\" @%s:%d", message, "OSBoundedPtr.h", 53);
}

{
  panic("\"%s\" @%s:%d", message, "OSBoundedPtr.h", 53);
}

{
  panic("\"%s\" @%s:%d", message, "OSBoundedPtr.h", 53);
}

OSMetaClass *_GLOBAL__sub_I_AppleDeviceManagementHIDEventService_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleDeviceManagementHIDEventService::gMetaClass, "AppleDeviceManagementHIDEventService", &IOHIDEventService::gMetaClass, 0x190u);
  result->__vftable = (OSMetaClass_vtbl *)off_149F0;
  return result;
}

void global destructor keyed to'_a()
{
}

uint64_t _atc_extractTrackingAndButtonState(unsigned char *a1, unsigned char *a2, unsigned int a3, int a4)
{
  switch(a4)
  {
    case 117:
      return _atc_extractButtonStateFromBinaryV4Header((uint64_t)a1, (unint64_t)a2, a3);
    case 49:
      return _atc_extractButtonStateFromV7Header((uint64_t)a1, a2, a3);
    case 2:
      return _atc_parseSimpleMouseV2Packet(a1, a2, a3);
  }
  return 0;
}

uint64_t _atc_parseSimpleMouseV2Packet(unsigned char *a1, unsigned char *a2, int a3)
{
  if (a1) {
    BOOL v3 = a3 == 8;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = !v3 || a2 == 0;
  int v5 = v4;
  if (!v4)
  {
    if (a2 + 8 < a2) {
      os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
    }
    *a1 = *a2;
    uint64_t v6 = a2 == (unsigned char *)-1;
    uint64_t v7 = v6 << 63 >> 63;
    if (v7 != v6) {
      goto LABEL_28;
    }
    if (v7 < 0) {
      goto LABEL_28;
    }
    a1[1] = a2[1];
    uint64_t v8 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFELL;
    uint64_t v9 = v8 << 63 >> 63;
    if (v9 != v8) {
      goto LABEL_28;
    }
    if (v9 < 0) {
      goto LABEL_28;
    }
    a1[2] = a2[2];
    uint64_t v10 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v11 = v10 << 63 >> 63;
    if (v11 != v10) {
      goto LABEL_28;
    }
    if (v11 < 0) {
      goto LABEL_28;
    }
    a1[3] = a2[3];
    uint64_t v12 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v13 = v12 << 63 >> 63;
    if (v13 != v12) {
      goto LABEL_28;
    }
    if (v13 < 0) {
      goto LABEL_28;
    }
    a1[4] = a2[4];
    uint64_t v14 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFBLL;
    uint64_t v15 = v14 << 63 >> 63;
    if (v15 != v14
      || v15 < 0
      || (a1[5] = a2[5], v16 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFALL, uint64_t v17 = v16 << 63 >> 63, v17 ^ v16)
      || v17 < 0
      || (a1[7] = a2[6], uint64_t v18 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFF9, v19 = v18 << 63 >> 63, v19 ^ v18)
      || v19 < 0)
    {
LABEL_28:
      os_detail::panic_trapping_policy::trap("This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.");
    }
    a1[6] = a2[7];
  }
  return v5 ^ 1u;
}

uint64_t _atc_extractButtonStateFromBinaryV4Header(uint64_t a1, unint64_t a2, unsigned int a3)
{
  *(void *)a1 = 0;
  if (!a2) {
    return 0;
  }
  long long v5 = 0u;
  long long v6 = 0u;
  uint64_t result = MTBinaryV4HeaderUnpack((uint64_t)&v5, a2, a3);
  if (result)
  {
    *(unsigned char *)(a1 + 1) = BYTE7(v6);
    *(unsigned char *)(a1 + 6) = *(unsigned char *)(a1 + 6) & 0xFD | (2 * (BYTE12(v5) & 1));
    return 1;
  }
  return result;
}

uint64_t _atc_extractButtonStateFromV7Header(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  *(void *)a1 = 0;
  if (!a2) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t result = MTCompactV7HeaderUnpack((uint64_t)&v5, a2, a3);
  if (result)
  {
    *(unsigned char *)(a1 + 1) = BYTE1(v5);
    *(unsigned char *)(a1 + 6) = *(unsigned char *)(a1 + 6) & 0xFD | (2 * (BYTE3(v5) != 0));
    return 1;
  }
  return result;
}

uint64_t _atc_parseSimpleMouseV3Packet(uint64_t a1, unint64_t a2, int a3)
{
  if (a1) {
    BOOL v3 = a3 == 8;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = !v3 || a2 == 0;
  int v5 = v4;
  if (!v4)
  {
    if (a2 + 8 < a2) {
      os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
    }
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v6 = a2 == -1;
    uint64_t v7 = v6 << 63 >> 63;
    if (v7 != v6) {
      goto LABEL_20;
    }
    if (v7 < 0) {
      goto LABEL_20;
    }
    *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
    *(_WORD *)(a1 + 2) = *(_WORD *)(a2 + 2);
    *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
    uint64_t v8 = a2 >= 0xFFFFFFFFFFFFFFFALL;
    uint64_t v9 = v8 << 63 >> 63;
    if (v9 != v8
      || v9 < 0
      || (*(unsigned char *)(a1 + 6) = *(unsigned char *)(a2 + 6), v10 = a2 >= 0xFFFFFFFFFFFFFFF9, uint64_t v11 = v10 << 63 >> 63, v11 ^ v10)
      || v11 < 0)
    {
LABEL_20:
      os_detail::panic_trapping_policy::trap("This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.");
    }
    *(unsigned char *)(a1 + 7) = *(unsigned char *)(a2 + 7);
  }
  return v5 ^ 1u;
}

uint64_t MTCompactV7HeaderUnpack(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 4)
  {
    if (&a2[a3] < a2) {
      os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
    }
    *(unsigned char *)a1 = *a2;
    if ((a3 & 0xFFFFFFFE) != 0)
    {
      BOOL v4 = a2 + 1;
      uint64_t v5 = a2 == (unsigned char *)-1;
      uint64_t v6 = v5 << 63 >> 63;
      if (v6 != v5) {
        goto LABEL_17;
      }
      if (v6 < 0) {
        goto LABEL_17;
      }
      *(unsigned char *)(a1 + 1) = *v4 & 1;
      *(unsigned char *)(a1 + 2) = (*v4 & 2) != 0;
      *(unsigned char *)(a1 + 3) = (*v4 & 4) != 0;
      uint64_t v7 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFELL;
      uint64_t v8 = v7 << 63 >> 63;
      if (v8 != v7 || v8 < 0) {
        goto LABEL_17;
      }
      if ((a3 & 0xFFFFFFFC) != 0)
      {
        uint64_t v9 = (unint64_t)a2 >= 0xFFFFFFFFFFFFFFFDLL;
        uint64_t v10 = v9 << 63 >> 63;
        if (v10 == v9 && (v10 & 0x8000000000000000) == 0)
        {
          *(_DWORD *)(a1 + 4) = (*v4 >> 3) | (32 * a2[2]) | (a2[3] << 13);
          return 8;
        }
LABEL_17:
        os_detail::panic_trapping_policy::trap("This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.");
      }
    }
    os_detail::panic_trapping_policy::trap("bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally");
  }
  return v3;
}

uint64_t MTBinaryV4HeaderUnpack(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 && a3 >= 0x20)
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
    if (a2 + a3 < a2) {
      os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
    }
    uint64_t v4 = a2 >= 0xFFFFFFFFFFFFFFE9;
    uint64_t v5 = v4 << 63 >> 63;
    if (v5 != v4 || v5 < 0) {
      os_detail::panic_trapping_policy::trap("This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.");
    }
    *(unsigned char *)(a1 + 23) = *(unsigned char *)(a2 + 23);
    return 32;
  }
  return v3;
}

OSMetaClass *AppleMultitouchInputHIDEventDriver::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMultitouchInputHIDEventDriver", &AppleMultitouchHIDEventDriverV2::gMetaClass, 0x198u);
  result->__vftable = (OSMetaClass_vtbl *)off_15210;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMultitouchInputHIDEventDriver", &AppleMultitouchHIDEventDriverV2::gMetaClass, 0x198u);
  result->__vftable = (OSMetaClass_vtbl *)off_15210;
  return result;
}

void AppleMultitouchInputHIDEventDriver::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(AppleMultitouchInputHIDEventDriver *this, const OSMetaClass *a2)
{
  AppleMultitouchHIDEventDriverV2::AppleMultitouchHIDEventDriverV2(this, a2);
  void *v2 = off_14A88;
  v2[42] = 0;
  v2[44] = 0;
  v2[46] = 0;
  v2[48] = 0;
  v2[49] = 0;
}

{
  void *v2;

  AppleMultitouchHIDEventDriverV2::AppleMultitouchHIDEventDriverV2(this, a2);
  void *v2 = off_14A88;
  v2[42] = 0;
  v2[44] = 0;
  v2[46] = 0;
  v2[48] = 0;
  v2[49] = 0;
}

void AppleMultitouchInputHIDEventDriver::~AppleMultitouchInputHIDEventDriver(AppleMultitouchInputHIDEventDriver *this)
{
  *(void *)this = off_14A88;
  uint64_t v2 = *((void *)this + 49);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
  }
  *((void *)this + 49) = 0;
  uint64_t v3 = *((void *)this + 48);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  *((void *)this + 48) = 0;
  uint64_t v4 = *((void *)this + 46);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 40))(v4);
  }
  *((void *)this + 46) = 0;
  uint64_t v5 = *((void *)this + 44);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
  }
  *((void *)this + 44) = 0;
  uint64_t v6 = *((void *)this + 42);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
  }
  *((void *)this + 42) = 0;

  AppleMultitouchHIDEventDriverV2::~AppleMultitouchHIDEventDriverV2(this);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars8;

  *(void *)this = off_14A88;
  uint64_t v2 = *((void *)this + 49);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
  }
  *((void *)this + 49) = 0;
  uint64_t v3 = *((void *)this + 48);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  *((void *)this + 48) = 0;
  uint64_t v4 = *((void *)this + 46);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 40))(v4);
  }
  *((void *)this + 46) = 0;
  uint64_t v5 = *((void *)this + 44);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
  }
  *((void *)this + 44) = 0;
  uint64_t v6 = *((void *)this + 42);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
  }
  *((void *)this + 42) = 0;

  AppleMultitouchHIDEventDriverV2::~AppleMultitouchHIDEventDriverV2(this);
}

{
  uint64_t vars8;

  AppleMultitouchInputHIDEventDriver::~AppleMultitouchInputHIDEventDriver(this);

  _OSObject_typed_operator_delete(&AppleMultitouchInputHIDEventDriver_ktv, this, 408);
}

void AppleMultitouchInputHIDEventDriver::operator delete(void *a1, uint64_t a2)
{
}

void *AppleMultitouchInputHIDEventDriver::getMetaClass(AppleMultitouchInputHIDEventDriver *this)
{
  return &AppleMultitouchInputHIDEventDriver::gMetaClass;
}

void AppleMultitouchInputHIDEventDriver::MetaClass::alloc(AppleMultitouchInputHIDEventDriver::MetaClass *this)
{
  int v1 = (AppleMultitouchInputHIDEventDriver *)OSObject_typed_operator_new();

  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(v1);
}

uint64_t AppleMultitouchInputHIDEventDriver::operator new(AppleMultitouchInputHIDEventDriver *this)
{
  return OSObject_typed_operator_new();
}

void AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(AppleMultitouchInputHIDEventDriver *this)
{
}

{
  void *v1;

  AppleMultitouchHIDEventDriverV2::AppleMultitouchHIDEventDriverV2(this, &AppleMultitouchInputHIDEventDriver::gMetaClass);
  AppleMultitouchInputHIDEventDriver *v1 = off_14A88;
  v1[42] = 0;
  v1[44] = 0;
  v1[46] = 0;
  v1[48] = 0;
  v1[49] = 0;
  OSMetaClass::instanceConstructed(&AppleMultitouchInputHIDEventDriver::gMetaClass);
}

uint64_t AppleMultitouchInputHIDEventDriver::init(OSMetaClassBase *this, OSDictionary *a2)
{
  {
    uint64_t v3 = IOBufferMemoryDescriptor::withCapacity(0x1000uLL, 3u, 0);
    uint64_t v4 = this[42].__vftable;
    if (v4) {
      (*((void (**)(OSMetaClassBase_vtbl *))v4->~OSMetaClassBase + 5))(v4);
    }
    this[42].__vftable = (OSMetaClassBase_vtbl *)v3;
    if (v3)
    {
      uint64_t v5 = OSDictionary::withCapacity(1u);
      uint64_t v6 = this[44].__vftable;
      if (v6) {
        (*((void (**)(OSMetaClassBase_vtbl *))v6->~OSMetaClassBase + 5))(v6);
      }
      this[44].__vftable = (OSMetaClassBase_vtbl *)v5;
      if (v5)
      {
        uint64_t v7 = IORecursiveLockAlloc();
        this[45].__vftable = (OSMetaClassBase_vtbl *)v7;
        if (v7)
        {
          release = (void (__cdecl *)(thread_call_param_t, thread_call_param_t))this->__vftable[18].release;
          if (!release)
          {
            v12.ptr = (void (*)(void))AppleMultitouchInputHIDEventDriver::unleashThreadEnter;
            v12.adj = 0;
            OSMetaClassBase::_ptf_t v9 = OSMetaClassBase::_ptmf2ptf(this, v12);
            if (v9) {
              release = (void (__cdecl *)(thread_call_param_t, thread_call_param_t))v9;
            }
            else {
              release = 0;
            }
          }
          thread_call_t v11 = thread_call_allocate(release, this);
          this[47].__vftable = (OSMetaClassBase_vtbl *)v11;
          if (v11)
          {
            return 1;
          }
          else
          {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to allocate _unleashThread\n", "ATC", "AppleMultitouchInputHIDEventDriver", "init");
            return 0;
          }
        }
        else
        {
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to allocate _mtPrefsLock\n", "ATC", "AppleMultitouchInputHIDEventDriver", "init");
          return 0;
        }
      }
      else
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to allocate _mtPreferences\n", "ATC", "AppleMultitouchInputHIDEventDriver", "init");
        return 0;
      }
    }
    else
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to allocate _inputReportBuffer\n", "ATC", "AppleMultitouchInputHIDEventDriver", "init");
      return 0;
    }
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s super::init() failed\n", "ATC", "AppleMultitouchInputHIDEventDriver", "init");
    return 0;
  }
}

uint64_t AppleMultitouchInputHIDEventDriver::unleashThreadEnter(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1888))(a1);
}

uint64_t AppleMultitouchInputHIDEventDriver::free(AppleMultitouchInputHIDEventDriver *this)
{
  uint64_t v2 = (thread_call *)*((void *)this + 47);
  if (v2)
  {
    thread_call_free(v2);
    *((void *)this + 47) = 0;
  }
  uint64_t v3 = (IORecursiveLock *)*((void *)this + 45);
  if (v3)
  {
    IORecursiveLockFree(v3);
    *((void *)this + 45) = 0;
  }

  return v4(this);
}

uint64_t AppleMultitouchInputHIDEventDriver::handleStart(OSMetaClassBase *this, IOService *a2)
{
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s super::handleStart failed\n", "ATC", "AppleMultitouchInputHIDEventDriver", "handleStart");
    return 0;
  }
  uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *))this->__vftable[8].getMetaClass)(this);
  uint64_t v5 = this[49].__vftable;
  this[49].__vftable = (OSMetaClassBase_vtbl *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 32))(v4);
  }
  if (v5) {
    (*((void (**)(OSMetaClassBase_vtbl *))v5->~OSMetaClassBase + 5))(v5);
  }
  if (!this[49].__vftable)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s failed to get work loop\n", "ATC", "AppleMultitouchInputHIDEventDriver", "handleStart");
    return 0;
  }
  uint64_t v6 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))this->__vftable[3].release)(this, "InterfaceAvailableOnDeviceReadyNotification");
  uint64_t v7 = (const OSMetaClass *)OSBoolean::metaClass;
  uint64_t v8 = (OSBoolean *)OSMetaClassBase::safeMetaCast(v6, OSBoolean::metaClass);
  OSMetaClassBase::_ptf_t v9 = kOSBooleanTrue;
  if (v8)
  {
    uint64_t v10 = this + 50;
    LOBYTE(this[50].__vftable) = v8 == *kOSBooleanTrue;
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v10 = this + 50;
    LOBYTE(this[50].__vftable) = *kOSBooleanTrue == 0;
    if (!v6) {
      goto LABEL_13;
    }
  }
  ((void (*)(const OSMetaClassBase *))v6->release_0)(v6);
LABEL_13:
  $C0E0325F155B7E7CE2BD0701CF49B8F1 v12 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))this->__vftable[3].release)(this, "UnleashUnsupported");
  uint64_t v13 = OSMetaClassBase::safeMetaCast(v12, v7);
  if (v13)
  {
    uint64_t v14 = (char *)&this[50].__vftable + 1;
    BYTE1(this[50].__vftable) = v13 != *(OSMetaClassBase **)v9;
    $C0E0325F155B7E7CE2BD0701CF49B8F1 v12 = v13;
  }
  else
  {
    uint64_t v14 = (char *)&this[50].__vftable + 1;
    BYTE1(this[50].__vftable) = *v9 != 0;
    if (!v12) {
      goto LABEL_17;
    }
  }
  ((void (*)(const OSMetaClassBase *))v12->release_0)(v12);
LABEL_17:
  if (LOBYTE(v10->__vftable))
  {
    if (*v14)
    {
      uint64_t v15 = (const OSMetaClass *)AIDInterface::metaClass;
      while (1)
      {
        uint64_t v16 = OSMetaClassBase::safeMetaCast(a2, v15);
        if (v16) {
          break;
        }
        a2 = (IOService *)((uint64_t (*)(IOService *, const IORegistryPlane *))a2->getParentEntry)(a2, gIOServicePlane);
        if (!a2) {
          return 1;
        }
      }
      uint64_t v19 = v16;
      uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(a2);
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Transport interface 0x%08llX\n", "ATC", "AppleMultitouchInputHIDEventDriver", "handleStart", RegistryEntryID);
      int v21 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *, void (*)(IORegistryEntry *, OSNumber *)))v19->__vftable[13].retain)(v19, this, AppleMultitouchInputHIDEventDriver::handleInterfaceNotification);
      if (v21)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s setNotifyHandler error 0x%08X\n", "ATC", "AppleMultitouchInputHIDEventDriver", "handleStart", v21);
        return 0;
      }
      return 1;
    }
    return 0;
  }
  else
  {
    if (!*v14) {
      return 1;
    }
    uint64_t v17 = (IOReturn (__cdecl *)(void *, void *, UInt32, IOService *, void *, vm_size_t))this->__vftable[18].~OSMetaClassBase;
    if (!v17)
    {
      v24.ptr = (void (*)(void))AppleMultitouchInputHIDEventDriver::systemPowerChangeHandler;
      v24.adj = 0;
      OSMetaClassBase::_ptf_t v18 = OSMetaClassBase::_ptmf2ptf(this, v24);
      if (v18) {
        uint64_t v17 = (IOReturn (__cdecl *)(void *, void *, UInt32, IOService *, void *, vm_size_t))v18;
      }
      else {
        uint64_t v17 = 0;
      }
    }
    long long v22 = registerPrioritySleepWakeInterest(v17, this, 0);
    long long v23 = this[46].__vftable;
    this[46].__vftable = (OSMetaClassBase_vtbl *)v22;
    if (v22) {
      ((void (*)(IONotifier *))v22->retain)(v22);
    }
    if (v23) {
      (*((void (**)(OSMetaClassBase_vtbl *))v23->~OSMetaClassBase + 5))(v23);
    }
    if (this[46].__vftable) {
      return 1;
    }
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s registerPrioritySleepWakeInterest failed\n", "ATC", "AppleMultitouchInputHIDEventDriver", "handleStart");
    return 0;
  }
}

void AppleMultitouchInputHIDEventDriver::handleInterfaceNotification(IORegistryEntry *this, OSNumber *a2)
{
  if (a2)
  {
    if (((unsigned int (*)(OSNumber *))a2->unsigned32BitValue)(a2) == 2)
    {
      uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Device ready notification for registry ID 0x%08llX\n", "ATC", "AppleMultitouchInputHIDEventDriver", "handleInterfaceNotification", RegistryEntryID);
      taggedRelease = this->__vftable[3].taggedRelease;
      ((void (*)(IORegistryEntry *))taggedRelease)(this);
    }
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s NULL notification received\n", "ATC", "AppleMultitouchInputHIDEventDriver", "handleInterfaceNotification");
  }
}

uint64_t AppleMultitouchInputHIDEventDriver::systemPowerChangeHandler(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1872))(a1);
}

uint64_t AppleMultitouchInputHIDEventDriver::stop(AppleMultitouchInputHIDEventDriver *this, IOService *a2)
{
  uint64_t v4 = *((void *)this + 46);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 120))(v4);
    uint64_t v5 = *((void *)this + 46);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
    }
    *((void *)this + 46) = 0;
  }

  return v6(this, a2);
}

uint64_t AppleMultitouchInputHIDEventDriver::setProperties(const OSMetaClassBase *this, OSObject *anObject)
{
  uint64_t v4 = OSMetaClassBase::safeMetaCast(anObject, OSDictionary::metaClass);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))v4->__vftable[3].~OSMetaClassBase)(v4, "UserPreferences");
    uint64_t v7 = (OSBoolean *)OSMetaClassBase::safeMetaCast(v6, OSBoolean::metaClass);
    if (v7) {
      BOOL v8 = v7 == *kOSBooleanTrue;
    }
    else {
      BOOL v8 = 0;
    }
    OSMetaClassBase::_ptf_t v9 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))v5->__vftable[3].~OSMetaClassBase)(v5, "UserPreferences");
    uint64_t v10 = OSMetaClassBase::safeMetaCast(v9, OSNumber::metaClass);
    if (v10)
    {
      if (((unsigned int (*)(OSMetaClassBase *))v10->__vftable[1].isEqualTo)(v10))
      {
LABEL_7:
        thread_call_t v11 = this[49].__vftable;
        taggedRelease = this->__vftable[17].taggedRelease;
        if (!taggedRelease)
        {
          v17.ptr = (void (*)(void))AppleMultitouchInputHIDEventDriver::setMultitouchPreferences;
          v17.adj = 0;
          OSMetaClassBase::_ptf_t v13 = OSMetaClassBase::_ptmf2ptf(this, v17);
          if (v13) {
            taggedRelease = v13;
          }
          else {
            taggedRelease = 0;
          }
        }
        (*((void (**)(OSMetaClassBase_vtbl *, void *, const OSMetaClassBase *, OSMetaClassBase *, void, void, void))v11->~OSMetaClassBase
         + 32))(v11, taggedRelease, this, v5, 0, 0, 0);
        return 0;
      }
    }
    else if (v8)
    {
      goto LABEL_7;
    }
  }

  return v14(this, anObject);
}

uint64_t AppleMultitouchInputHIDEventDriver::setMultitouchPreferences(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1848))(a1);
}

uint64_t AppleMultitouchInputHIDEventDriver::message(AppleMultitouchInputHIDEventDriver *this, unsigned int a2, IOService *a3, void *a4)
{
  return 0;
}

uint64_t AppleMultitouchInputHIDEventDriver::multitouchDeviceDidStart(IORecursiveLock **this)
{
  uint64_t v2 = (*((uint64_t (**)(IORecursiveLock **))*this + 220))(this);
  if (!v2) {
    return 3758097088;
  }
  uint64_t v3 = v2;
  IORecursiveLockLock(this[45]);
  (*(void (**)(uint64_t, IORecursiveLock *))(*(void *)v3 + 1536))(v3, this[44]);
  (*(void (**)(IORecursiveLock *))(*(void *)this[44] + 184))(this[44]);
  IORecursiveLockUnlock(this[45]);
  uint64_t result = (*((uint64_t (**)(IORecursiveLock **, const char *))*this + 41))(this, "HIDPointerResolution");
  if (result)
  {
    uint64_t v5 = result;
    (*(void (**)(uint64_t, const char *, uint64_t))(*(void *)v3 + 200))(v3, "HIDPointerResolution", result);
    (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
    return 0;
  }
  return result;
}

uint64_t AppleMultitouchInputHIDEventDriver::multitouchDeviceWillTerminate(AppleMultitouchInputHIDEventDriver *this)
{
  *((unsigned char *)this + 344) = 0;
  return 0;
}

uint64_t AppleMultitouchInputHIDEventDriver::setMultitouchPreferences(AppleMultitouchInputHIDEventDriver *this, OSDictionary *a2)
{
  uint64_t v4 = 3758097090;
  if (IOService::isInactive((const IOService *)this)) {
    return 3758097111;
  }
  if (a2)
  {
    IORecursiveLockLock(*((IORecursiveLock **)this + 45));
    if ((*(uint64_t (**)(AppleMultitouchInputHIDEventDriver *))(*(void *)this + 1760))(this))
    {
      uint64_t v5 = (*(uint64_t (**)(AppleMultitouchInputHIDEventDriver *))(*(void *)this + 1760))(this);
      (*(void (**)(uint64_t, OSDictionary *))(*(void *)v5 + 1536))(v5, a2);
    }
    else
    {
      (*(void (**)(void, OSDictionary *))(**((void **)this + 44) + 288))(*((void *)this + 44), a2);
    }
    IORecursiveLockUnlock(*((IORecursiveLock **)this + 45));
    return 0;
  }
  return v4;
}

uint64_t AppleMultitouchInputHIDEventDriver::enableMultitouchEvents(OSMetaClassBase *self, unsigned int a2)
{
  uint64_t v4 = self[49].__vftable;
  taggedRelease_0 = self->__vftable[17].taggedRelease_0;
  if (!taggedRelease_0)
  {
    v10.ptr = (void (*)(void))AppleMultitouchInputHIDEventDriver::enableMultitouchEventsGated;
    v10.adj = 0;
    OSMetaClassBase::_ptf_t v6 = OSMetaClassBase::_ptmf2ptf(self, v10);
    if (v6) {
      taggedRelease_0 = (void (__cdecl *)(const OSMetaClassBase *__hidden, const void *, const int))v6;
    }
    else {
      taggedRelease_0 = 0;
    }
  }
  uint64_t v7 = (uint64_t (*)(OSMetaClassBase_vtbl *, void (__cdecl *)(const OSMetaClassBase *__hidden, const void *, const int), OSMetaClassBase *, void, void, void, void))*((void *)v4->~OSMetaClassBase + 32);

  return v7(v4, taggedRelease_0, self, a2, 0, 0, 0);
}

uint64_t AppleMultitouchInputHIDEventDriver::enableMultitouchEventsGated(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1856))(a1);
}

uint64_t AppleMultitouchInputHIDEventDriver::enableMultitouchEventsGated(const IOService *this, int a2)
{
  if (IOService::isInactive(this)) {
    return 3758097112;
  }
  if (LOBYTE(this[2].__state[0]) != a2)
  {
    LOBYTE(this[2].__state[0]) = a2;
    if (((uint64_t (*)(const IOService *))this->__vftable[1].isParent)(this))
    {
      uint64_t v5 = ((uint64_t (*)(const IOService *))this->__vftable[1].isParent)(this);
      if (LOBYTE(this[2].__state[0])) {
        OSMetaClassBase::_ptf_t v6 = "true";
      }
      else {
        OSMetaClassBase::_ptf_t v6 = "false";
      }
      (*(void (**)(uint64_t, const IOService *, const char *, ...))(*(void *)v5 + 1504))(v5, this, "AppleMultitouchInputHIDEventDriver::enableMultitouchEvents(%s)", v6);
    }
    if (BYTE1(this[2]._interruptSources))
    {
      int v7 = ((uint64_t (*)(const IOService *, void))this->__vftable[1].copyName)(this, LOBYTE(this[2].__state[0]));
      if (v7) {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to set device leash state. Result = 0x%08x\n", "ATC", "AppleMultitouchInputHIDEventDriver", "enableMultitouchEventsGated", v7);
      }
    }
    if (LOBYTE(this[2].__state[0])) {
      ((void (*)(const IOService *))this->__vftable[1].setName)(this);
    }
  }
  return 0;
}

uint64_t AppleMultitouchInputHIDEventDriver::systemPowerChangeHandler(IORegistryEntry *this, void *a2, int a3, IOService *a4, _DWORD *a5)
{
  if (a3 == -536870080 && a5[2] == 2 && (a5[4] & 1) == 0 && (a5[5] & 1) != 0)
  {
    uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Priority wake notification for registry ID 0x%08llX\n", "ATC", "AppleMultitouchInputHIDEventDriver", "systemPowerChangeHandler", RegistryEntryID);
    ((void (*)(IORegistryEntry *))this->__vftable[3].taggedRelease)(this);
  }
  return 0;
}

void AppleMultitouchInputHIDEventDriver::scheduleUnleash(IORegistryEntry *this)
{
  uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(this);
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s schedule unleash for registry ID 0x%08llX\n", "ATC", "AppleMultitouchInputHIDEventDriver", "scheduleUnleash", RegistryEntryID);
  if (this[9].reserved)
  {
    fRegistryTable = this[9].fRegistryTable;
    this[9].fRegistryTable = (OSDictionary *)this;
    ((void (*)(IORegistryEntry *))this->retain)(this);
    if (fRegistryTable) {
      ((void (*)(OSDictionary *))fRegistryTable->release_0)(fRegistryTable);
    }
    if (thread_call_enter(this[9].reserved) == 1)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] %s::%s Schedule unleash thread call is already pending\n", "ATC", "AppleMultitouchInputHIDEventDriver", "scheduleUnleash");
      uint64_t v4 = this[9].fRegistryTable;
      if (v4) {
        ((void (*)(OSDictionary *))v4->release_0)(v4);
      }
      this[9].fRegistryTable = 0;
    }
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s _unleashThread is NULL\n", "ATC", "AppleMultitouchInputHIDEventDriver", "scheduleUnleash");
  }
}

OSMetaClassBase_vtbl *AppleMultitouchInputHIDEventDriver::unleashThreadEnter(OSMetaClassBase *self)
{
  uint64_t v2 = self[49].__vftable;
  getRetainCount = self->__vftable[18].getRetainCount;
  if (!getRetainCount)
  {
    v6.ptr = (void (*)(void))AppleMultitouchInputHIDEventDriver::unleashDeviceGated;
    v6.adj = 0;
    OSMetaClassBase::_ptf_t v4 = OSMetaClassBase::_ptmf2ptf(self, v6);
    if (v4) {
      getRetainCount = (int (__cdecl *)(const OSMetaClassBase *__hidden))v4;
    }
    else {
      getRetainCount = 0;
    }
  }
  (*((void (**)(OSMetaClassBase_vtbl *, int (__cdecl *)(const OSMetaClassBase *__hidden), OSMetaClassBase *, void, void, void, void))v2->~OSMetaClassBase
   + 32))(v2, getRetainCount, self, 0, 0, 0, 0);
  uint64_t result = self[48].__vftable;
  if (result) {
    uint64_t result = (OSMetaClassBase_vtbl *)(*((uint64_t (**)(OSMetaClassBase_vtbl *))result->~OSMetaClassBase + 5))(result);
  }
  self[48].__vftable = 0;
  return result;
}

uint64_t AppleMultitouchInputHIDEventDriver::unleashDeviceGated(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1896))(a1);
}

void AppleMultitouchInputHIDEventDriver::unleashDeviceGated(const IOService *this)
{
  char v7 = 0;
  unsigned int v6 = 1;
  if (((uint64_t (*)(const IOService *))this->__vftable[1].isParent)(this) && !IOService::isInactive(this))
  {
    int v2 = ((uint64_t (*)(const IOService *, uint64_t, char *, unsigned int *, uint64_t))this->__vftable[1].getDepth)(this, 2, &v7, &v6, 3);
    if (v2)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to get device leash state. Error = 0x%08x\n", "ATC", "AppleMultitouchInputHIDEventDriver", "unleashDeviceGated", v2);
    }
    else if (!v7)
    {
      if (((uint64_t (*)(const IOService *))this->__vftable[1].isParent)(this))
      {
        uint64_t v3 = ((uint64_t (*)(const IOService *))this->__vftable[1].isParent)(this);
        if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 1400))(v3))
        {
          char v5 = 1;
          int v4 = ((uint64_t (*)(const IOService *, void, char *, void, uint64_t))this->__vftable[1].attachToParent)(this, 0, &v5, v6, 3);
          if (v4) {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to set device leash state. Error = 0x%08x\n", "ATC", "AppleMultitouchInputHIDEventDriver", "unleashDeviceGated", v4);
          }
        }
      }
    }
  }
}

void AppleMultitouchInputHIDEventDriver::clearButtonStateForUnleash(AppleMultitouchInputHIDEventDriver *this)
{
  if ((*(uint64_t (**)(AppleMultitouchInputHIDEventDriver *))(*(void *)this + 1760))(this))
  {
    int v2 = *(void (**)(void))(*(void *)(*(uint64_t (**)(AppleMultitouchInputHIDEventDriver *))(*(void *)this + 1760))(this)
                          + 1488);
    v2();
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Could not clear button state because AMD is not available!\n", "ATC", "AppleMultitouchInputHIDEventDriver", "clearButtonStateForUnleash");
  }
}

OSMetaClass *_GLOBAL__sub_I_AppleMultitouchInputHIDEventDriver_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleMultitouchInputHIDEventDriver::gMetaClass, "AppleMultitouchInputHIDEventDriver", &AppleMultitouchHIDEventDriverV2::gMetaClass, 0x198u);
  result->__vftable = (OSMetaClass_vtbl *)off_15210;
  return result;
}

void global destructor keyed to'_a_0()
{
}

OSMetaClass *AppleMultitouchTrackpadHIDEventDriver::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMultitouchTrackpadHIDEventDriver", &AppleMultitouchInputHIDEventDriver::gMetaClass, 0x1B0u);
  result->__vftable = (OSMetaClass_vtbl *)off_15A50;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMultitouchTrackpadHIDEventDriver", &AppleMultitouchInputHIDEventDriver::gMetaClass, 0x1B0u);
  result->__vftable = (OSMetaClass_vtbl *)off_15A50;
  return result;
}

void AppleMultitouchTrackpadHIDEventDriver::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleMultitouchTrackpadHIDEventDriver::AppleMultitouchTrackpadHIDEventDriver(AppleMultitouchTrackpadHIDEventDriver *this, const OSMetaClass *a2)
{
  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, a2);
  void *v2 = off_152A8;
  v2[51] = 0;
  v2[52] = 0;
}

{
  void *v2;

  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, a2);
  void *v2 = off_152A8;
  v2[51] = 0;
  v2[52] = 0;
}

void AppleMultitouchTrackpadHIDEventDriver::~AppleMultitouchTrackpadHIDEventDriver(AppleMultitouchTrackpadHIDEventDriver *this)
{
  *(void *)this = off_152A8;
  uint64_t v2 = *((void *)this + 52);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
  }
  *((void *)this + 52) = 0;
  uint64_t v3 = *((void *)this + 51);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  *((void *)this + 51) = 0;

  AppleMultitouchInputHIDEventDriver::~AppleMultitouchInputHIDEventDriver(this);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = off_152A8;
  uint64_t v2 = *((void *)this + 52);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
  }
  *((void *)this + 52) = 0;
  uint64_t v3 = *((void *)this + 51);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  *((void *)this + 51) = 0;

  AppleMultitouchInputHIDEventDriver::~AppleMultitouchInputHIDEventDriver(this);
}

{
  uint64_t vars8;

  AppleMultitouchTrackpadHIDEventDriver::~AppleMultitouchTrackpadHIDEventDriver(this);

  _OSObject_typed_operator_delete(&AppleMultitouchTrackpadHIDEventDriver_ktv, this, 432);
}

void AppleMultitouchTrackpadHIDEventDriver::operator delete(void *a1, uint64_t a2)
{
}

void *AppleMultitouchTrackpadHIDEventDriver::getMetaClass(AppleMultitouchTrackpadHIDEventDriver *this)
{
  return &AppleMultitouchTrackpadHIDEventDriver::gMetaClass;
}

AppleMultitouchInputHIDEventDriver *AppleMultitouchTrackpadHIDEventDriver::MetaClass::alloc(AppleMultitouchTrackpadHIDEventDriver::MetaClass *this)
{
  int v1 = (AppleMultitouchInputHIDEventDriver *)OSObject_typed_operator_new();
  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(v1, &AppleMultitouchTrackpadHIDEventDriver::gMetaClass);
  void *v2 = off_152A8;
  v2[51] = 0;
  v2[52] = 0;
  OSMetaClass::instanceConstructed(&AppleMultitouchTrackpadHIDEventDriver::gMetaClass);
  return v1;
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::operator new(AppleMultitouchTrackpadHIDEventDriver *this)
{
  return OSObject_typed_operator_new();
}

void AppleMultitouchTrackpadHIDEventDriver::AppleMultitouchTrackpadHIDEventDriver(AppleMultitouchTrackpadHIDEventDriver *this)
{
  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, &AppleMultitouchTrackpadHIDEventDriver::gMetaClass);
  void *v1 = off_152A8;
  v1[51] = 0;
  v1[52] = 0;
  OSMetaClass::instanceConstructed(&AppleMultitouchTrackpadHIDEventDriver::gMetaClass);
}

{
  void *v1;

  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, &AppleMultitouchTrackpadHIDEventDriver::gMetaClass);
  void *v1 = off_152A8;
  v1[51] = 0;
  v1[52] = 0;
  OSMetaClass::instanceConstructed(&AppleMultitouchTrackpadHIDEventDriver::gMetaClass);
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::init(AppleMultitouchTrackpadHIDEventDriver *this, OSDictionary *a2)
{
  uint64_t v3 = AppleMultitouchInputHIDEventDriver::init((OSMetaClassBase *)this, a2);
  if (v3)
  {
    *(_DWORD *)((char *)this + 402) = 0;
    *((unsigned char *)this + 425) = 0;
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s super::init() failed\n", "ATC", "AppleMultitouchTrackpadHIDEventDriver", "init");
  }
  return v3;
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::free(AppleMultitouchTrackpadHIDEventDriver *this)
{
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 128))(v2);
  }
  uint64_t v3 = *((void *)this + 52);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 128))(v3);
  }

  return AppleMultitouchInputHIDEventDriver::free(this);
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::start(AppleMultitouchTrackpadHIDEventDriver *this, IOService *a2)
{
  uint64_t v4 = AppleMultitouchHIDEventDriverV2::start(this, a2);
  if ((v4 & 1) == 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s super::start failed\n", "ATC", "AppleMultitouchTrackpadHIDEventDriver", "start");
    (*(void (**)(AppleMultitouchTrackpadHIDEventDriver *, IOService *))(*(void *)this + 696))(this, a2);
  }
  return v4;
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::stop(AppleMultitouchTrackpadHIDEventDriver *this, IOService *a2)
{
  uint64_t v4 = *((void *)this + 51);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 128))(v4);
  }
  uint64_t v5 = *((void *)this + 52);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 128))(v5);
  }

  return AppleMultitouchInputHIDEventDriver::stop(this, a2);
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::CheckOtherMouseEntry(AppleMultitouchTrackpadHIDEventDriver *this, OSObject *a2, void *a3, IOService *a4, IONotifier *a5)
{
  if (this) {
    (*(void (**)(AppleMultitouchTrackpadHIDEventDriver *, OSObject *, void *, IOService *, IONotifier *))(*(void *)this + 1912))(this, a2, a3, a4, a5);
  }
  return 1;
}

BOOL AppleMultitouchTrackpadHIDEventDriver::isValidPointingDevice(IORegistryEntry *this, IOHIDDevice *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = (const OSMetaClassBase *)((uint64_t (*)(IORegistryEntry *, const char *))this->copyProperty_4)(this, "HIDVirtualDevice");
  uint64_t v5 = OSMetaClassBase::safeMetaCast(v4, OSBoolean::metaClass);
  unsigned int v6 = (OSBoolean *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    ((void (*)(const OSMetaClassBase *))v4->release_0)(v4);
  }
  if (v6 == *kOSBooleanTrue)
  {
    BOOL v14 = 0;
    goto LABEL_24;
  }
  uint64_t v8 = ((uint64_t (*)(IOHIDDevice *))a2->newPrimaryUsageNumber)(a2);
  uint64_t v9 = ((uint64_t (*)(IOHIDDevice *))a2->newPrimaryUsagePageNumber)(a2);
  uint64_t v10 = v9;
  if (!v8)
  {
    BOOL v14 = 0;
    goto LABEL_18;
  }
  if (!v9)
  {
    BOOL v14 = 0;
    goto LABEL_23;
  }
  int v11 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 168))(v9);
  unsigned int v12 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 168))(v8) - 1;
  if (v11 == 1 && v12 <= 1)
  {
    do
    {
      uint64_t RegistryEntryID = IORegistryEntry::getRegistryEntryID(a2);
      uint64_t v17 = IORegistryEntry::getRegistryEntryID(v3);
      BOOL v7 = RegistryEntryID == v17;
      BOOL v14 = RegistryEntryID != v17;
      if (v7) {
        break;
      }
      uint64_t v3 = (IORegistryEntry *)((uint64_t (*)(IORegistryEntry *, const IORegistryPlane *))v3->getParentEntry)(v3, gIOServicePlane);
    }
    while (v3);
LABEL_18:
    if (!v10) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  BOOL v14 = 0;
LABEL_19:
  (*(void (**)(uint64_t))(*(void *)v10 + 40))(v10);
LABEL_20:
  if (v8) {
LABEL_23:
  }
    (*(void (**)(uint64_t))(*(void *)v8 + 40))(v8);
LABEL_24:
  if (v6) {
    ((void (*)(OSBoolean *))v6->release_0)(v6);
  }
  return v14;
}

OSDictionary *AppleMultitouchTrackpadHIDEventDriver::checkOtherMouse(AppleMultitouchTrackpadHIDEventDriver *this)
{
  uint64_t v2 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleMultitouchTrackpadHIDEventDriver *, const char *))(*(void *)this + 328))(this, "TrackpadEmbedded");
  uint64_t result = (OSDictionary *)OSMetaClassBase::safeMetaCast(v2, OSBoolean::metaClass);
  uint64_t v4 = (OSBoolean *)result;
  if (v2) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    uint64_t result = (OSDictionary *)((uint64_t (*)(const OSMetaClassBase *))v2->release_0)(v2);
  }
  if (v4 != *kOSBooleanTrue)
  {
    unsigned int v6 = 0;
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  uint64_t result = IOService::serviceMatching("IOHIDDevice", 0);
  unsigned int v6 = result;
  if (!result) {
    goto LABEL_9;
  }
  uint64_t result = (OSDictionary *)IOService::getMatchingServices(result);
  BOOL v7 = result;
  if (result)
  {
    uint64_t result = (OSDictionary *)((uint64_t (*)(OSDictionary *))result->getNextObjectForIterator)(result);
    if (!result) {
      goto LABEL_27;
    }
    uint64_t v9 = result;
    int v10 = 0;
    do
    {
      v10 += (*(uint64_t (**)(AppleMultitouchTrackpadHIDEventDriver *, OSDictionary *))(*(void *)this
                                                                                                + 1904))(this, v9);
      uint64_t result = (OSDictionary *)((uint64_t (*)(OSDictionary *))v7->getNextObjectForIterator)(v7);
      uint64_t v9 = result;
    }
    while (result);
    if (v10)
    {
      if (*((unsigned char *)this + 402)) {
        goto LABEL_10;
      }
      uint64_t v11 = 1;
    }
    else
    {
LABEL_27:
      if (!*((unsigned char *)this + 402)) {
        goto LABEL_10;
      }
      uint64_t v11 = 0;
    }
    uint64_t result = (OSDictionary *)(*(uint64_t (**)(AppleMultitouchTrackpadHIDEventDriver *, uint64_t))(*(void *)this + 1920))(this, v11);
  }
LABEL_10:
  if (v4) {
    uint64_t result = (OSDictionary *)((uint64_t (*)(OSBoolean *))v4->release_0)(v4);
  }
  if (v7) {
    uint64_t result = (OSDictionary *)((uint64_t (*)(OSDictionary *))v7->release_0)(v7);
  }
  if (v6)
  {
    release_0 = v6->release_0;
    return (OSDictionary *)((uint64_t (*)(OSDictionary *))release_0)(v6);
  }
  return result;
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::setSystemProperties(AppleMultitouchTrackpadHIDEventDriver *this, OSDictionary *a2)
{
  uint64_t v4 = (const OSMetaClassBase *)(*(uint64_t (**)(AppleMultitouchTrackpadHIDEventDriver *, const char *))(*(void *)this + 328))(this, "TrackpadEmbedded");
  BOOL v5 = OSMetaClassBase::safeMetaCast(v4, OSBoolean::metaClass);
  unsigned int v6 = (OSBoolean *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    ((void (*)(const OSMetaClassBase *))v4->release_0)(v4);
  }
  if (v6 == *kOSBooleanTrue)
  {
    uint64_t v8 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->getObject_1)(a2, "TrackpadUserPreferences");
    uint64_t v9 = OSMetaClassBase::safeMetaCast(v8, OSDictionary::metaClass);
    if (v9)
    {
      int v10 = v9;
      uint64_t v11 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))v9->__vftable[3].~OSMetaClassBase)(v9, "USBMouseStopsTrackpad");
      unsigned int v12 = (const OSMetaClass *)OSNumber::metaClass;
      OSMetaClassBase::_ptf_t v13 = OSMetaClassBase::safeMetaCast(v11, OSNumber::metaClass);
      if (v13)
      {
        int v14 = ((uint64_t (*)(OSMetaClassBase *))v13->__vftable[1].isEqualTo)(v13);
        int v15 = v14 != 0;
        if (*((unsigned __int8 *)this + 424) != v15)
        {
          *((unsigned char *)this + 424) = v15;
          if (!v14)
          {
            (*(void (**)(AppleMultitouchTrackpadHIDEventDriver *, void))(*(void *)this + 1920))(this, 0);
            uint64_t v16 = *((void *)this + 51);
            if (v16)
            {
              (*(void (**)(uint64_t))(*(void *)v16 + 128))(v16);
              uint64_t v17 = *((void *)this + 51);
              if (v17) {
                (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
              }
              *((void *)this + 51) = 0;
            }
            uint64_t v18 = *((void *)this + 52);
            if (v18)
            {
              (*(void (**)(uint64_t))(*(void *)v18 + 128))(v18);
              uint64_t v19 = *((void *)this + 52);
              if (v19) {
                (*(void (**)(uint64_t))(*(void *)v19 + 40))(v19);
              }
              *((void *)this + 52) = 0;
            }
          }
        }
      }
      long long v20 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))v10->__vftable[3].~OSMetaClassBase)(v10, "MouseKeysStopsTrackpad");
      int v21 = OSMetaClassBase::safeMetaCast(v20, v12);
      if (v21) {
        *((unsigned char *)this + 405) = ((unsigned int (*)(OSMetaClassBase *))v21->__vftable[1].isEqualTo)(v21) != 0;
      }
      long long v22 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))v10->__vftable[3].~OSMetaClassBase)(v10, "HIDMouseKeysOn");
      long long v23 = OSMetaClassBase::safeMetaCast(v22, v12);
      if (v23)
      {
        BOOL v24 = ((uint64_t (*)(OSMetaClassBase *))v23->__vftable[1].isEqualTo)(v23) != 0;
        *((unsigned char *)this + 404) = v24;
        if (v24)
        {
LABEL_24:
          BOOL v25 = *((unsigned char *)this + 405) != 0;
LABEL_27:
          (*(void (**)(AppleMultitouchTrackpadHIDEventDriver *, BOOL))(*(void *)this + 1928))(this, v25);
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)this + 404))
      {
        goto LABEL_24;
      }
      BOOL v25 = 0;
      goto LABEL_27;
    }
  }
LABEL_28:
  uint64_t v26 = IOHIDEventService::setSystemProperties((IOHIDEventService *)this, a2);
  if (v6) {
    ((void (*)(OSBoolean *))v6->release_0)(v6);
  }
  return v26;
}

void AppleMultitouchTrackpadHIDEventDriver::handleInterruptReport(AppleMultitouchTrackpadHIDEventDriver *this, unint64_t a2, IOMemoryDescriptor *a3, IOHIDReportType a4, int a5)
{
  if (a3 && *((void *)this + 42) && ((uint64_t (*)(IOMemoryDescriptor *))a3->getLength)(a3))
  {
    unsigned int v10 = ((uint64_t (*)(IOMemoryDescriptor *))a3->getLength)(a3);
    unint64_t v11 = v10;
    if (v10 > (unint64_t)(*(uint64_t (**)(void))(**((void **)this + 42) + 320))())
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Input report length (%u bytes) > capacity. Dropping report.\n", "ATC", "AppleMultitouchTrackpadHIDEventDriver", "handleInterruptReport", v10);
      return;
    }
    unsigned int v12 = (unsigned char *)(*(uint64_t (**)(void))(**((void **)this + 42) + 328))(*((void *)this + 42));
    ((void (*)(IOMemoryDescriptor *, void, unsigned char *, void))a3->readBytes)(a3, 0, v12, v10);
    uint64_t v24 = 0;
    if (*((unsigned char *)this + 424))
    {
      OSMetaClassBase::_ptf_t v13 = IOService::serviceMatching("IOHIDDevice", 0);
      if (!*((void *)this + 51))
      {
        int v14 = IOService::addMatchingNotification(gIOFirstMatchNotification, v13, (IOServiceMatchingNotificationHandler)AppleMultitouchTrackpadHIDEventDriver::CheckOtherMouseEntry, this, 0, 0);
        uint64_t v15 = *((void *)this + 51);
        if (v15) {
          (*(void (**)(uint64_t))(*(void *)v15 + 40))(v15);
        }
        *((void *)this + 51) = v14;
      }
      if (!*((void *)this + 52))
      {
        uint64_t v16 = IOService::addMatchingNotification(gIOTerminatedNotification, v13, (IOServiceMatchingNotificationHandler)AppleMultitouchTrackpadHIDEventDriver::CheckOtherMouseEntry, this, 0, 0);
        uint64_t v17 = *((void *)this + 52);
        if (v17) {
          (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
        }
        *((void *)this + 52) = v16;
      }
      if (v13) {
        ((void (*)(OSDictionary *))v13->release_0)(v13);
      }
    }
    (*(void (**)(void, void))(**((void **)this + 42) + 304))(*((void *)this + 42), v10);
    if (a5 == 2)
    {
      if (v10 <= 7)
      {
        a5 = 2;
LABEL_47:
        AppleMultitouchHIDEventDriverV2::handleInterruptReport(this, a2, *((IOMemoryDescriptor **)this + 42), a4, a5);
        return;
      }
    }
    else if (a5 != 117 && a5 != 49)
    {
      goto LABEL_47;
    }
    if ((*(uint64_t (**)(AppleMultitouchTrackpadHIDEventDriver *))(*(void *)this + 1760))(this))
    {
      unsigned int v18 = a5 == 2 ? 8 : v10;
      if (_atc_extractTrackingAndButtonState(&v24, v12, v18, a5))
      {
        if (*((unsigned char *)this + 344) && v10 >= 9) {
          WORD1(v24) = 0;
        }
        if (!*((unsigned char *)this + 402) && !*((unsigned char *)this + 403) && (v24 & 0x2000000000000) == 0)
        {
          uint64_t v19 = (*(uint64_t (**)(AppleMultitouchTrackpadHIDEventDriver *))(*(void *)this + 1760))(this);
          (*(void (**)(uint64_t, void, void, void, void))(*(void *)v19 + 1488))(v19, SBYTE2(v24), SBYTE3(v24), BYTE1(v24), 0);
        }
        if (!*((unsigned char *)this + 425) && (v24 & 0x2000000000000) != 0)
        {
          uint64_t v20 = (*(uint64_t (**)(AppleMultitouchTrackpadHIDEventDriver *))(*(void *)this + 1760))(this);
          (*(void (**)(uint64_t, void, void, void, void))(*(void *)v20 + 1488))(v20, 0, 0, 0, 0);
        }
        *((unsigned char *)this + 425) = (v24 & 0x2000000000000) != 0;
      }
    }
    if (v10 != 8)
    {
      if (a5 == 2)
      {
        if (&v12[v10] < v12) {
          os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
        }
        if (v10 <= 8) {
          os_detail::panic_trapping_policy::trap("bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally");
        }
        uint64_t v21 = (unint64_t)v12 >= 0xFFFFFFFFFFFFFFF8;
        uint64_t v22 = v21 << 63 >> 63;
        if (v22 != v21 || v22 < 0) {
          os_detail::panic_trapping_policy::trap("This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.");
        }
        size_t v23 = v10 - 8;
        if (v23 >= 0xFFFFFFF8) {
          os_detail::panic_trapping_policy::trap("bounded_array_ref: n + m is larger than the size of any bounded_array_ref");
        }
        if (v23 + 8 > v11) {
          os_detail::panic_trapping_policy::trap("bounded_array_ref: invalid slice provided, the indices are of bounds for the bounded_array_ref");
        }
        a5 = v12[8];
        memmove(v12, v12 + 8, v23);
        (*(void (**)(void))(**((void **)this + 42) + 304))();
      }
      goto LABEL_47;
    }
  }
}

uint64_t AppleMultitouchTrackpadHIDEventDriver::multitouchDeviceDidStart(IORecursiveLock **this)
{
  uint64_t v2 = AppleMultitouchInputHIDEventDriver::multitouchDeviceDidStart(this);
  if (v2)
  {
    uint64_t v3 = v2;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s super::multitouchDeviceDidStart returned 0x%08x\n", "ATC", "AppleMultitouchTrackpadHIDEventDriver", "multitouchDeviceDidStart", v2);
  }
  else if ((*((uint64_t (**)(IORecursiveLock **))*this + 220))(this))
  {
    uint64_t v4 = (*((uint64_t (**)(IORecursiveLock **))*this + 220))(this);
    if (*((unsigned char *)this + 402)) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = *((unsigned char *)this + 403) != 0;
    }
    (*(void (**)(uint64_t, BOOL))(*(void *)v4 + 1776))(v4, v5);
    return 0;
  }
  else
  {
    return 3758097084;
  }
  return v3;
}

unsigned char *AppleMultitouchTrackpadHIDEventDriver::setBuiltinTrackpadDisablingMouseAttached(unsigned char *this, char a2)
{
  uint64_t v2 = this;
  if (this[402]) {
    int v3 = 1;
  }
  else {
    int v3 = this[403];
  }
  this[402] = a2;
  int v4 = (a2 & 1) != 0 || this[403] != 0;
  if (v3 != v4)
  {
    this = (unsigned char *)(*(uint64_t (**)(unsigned char *))(*(void *)this + 1760))(this);
    if (this)
    {
      BOOL v5 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 1760))(v2) + 1776);
      return (unsigned char *)v5();
    }
  }
  return this;
}

unsigned __int8 *AppleMultitouchTrackpadHIDEventDriver::setBuiltinTrackpadDisablingMouseKeysEnabled(unsigned __int8 *this, int a2)
{
  uint64_t v2 = this;
  int v3 = this[402];
  if (this[402]) {
    int v4 = 1;
  }
  else {
    int v4 = this[403];
  }
  this[403] = a2;
  if (v3) {
    int v5 = 1;
  }
  else {
    int v5 = a2;
  }
  if (v4 != v5)
  {
    this = (unsigned __int8 *)(*(uint64_t (**)(unsigned __int8 *))(*(void *)this + 1760))(this);
    if (this)
    {
      unsigned int v6 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unsigned __int8 *))(*(void *)v2 + 1760))(v2)
                               + 1776);
      return (unsigned __int8 *)v6();
    }
  }
  return this;
}

OSMetaClass *_GLOBAL__sub_I_AppleMultitouchTrackpadHIDEventDriver_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleMultitouchTrackpadHIDEventDriver::gMetaClass, "AppleMultitouchTrackpadHIDEventDriver", &AppleMultitouchInputHIDEventDriver::gMetaClass, 0x1B0u);
  result->__vftable = (OSMetaClass_vtbl *)off_15A50;
  return result;
}

void global destructor keyed to'_a_1()
{
}

OSMetaClass *AppleMultitouchMouseHIDEventDriver::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMultitouchMouseHIDEventDriver", &AppleMultitouchInputHIDEventDriver::gMetaClass, 0x198u);
  result->__vftable = (OSMetaClass_vtbl *)off_16288;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMultitouchMouseHIDEventDriver", &AppleMultitouchInputHIDEventDriver::gMetaClass, 0x198u);
  result->__vftable = (OSMetaClass_vtbl *)off_16288;
  return result;
}

void AppleMultitouchMouseHIDEventDriver::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleMultitouchMouseHIDEventDriver::AppleMultitouchMouseHIDEventDriver(AppleMultitouchMouseHIDEventDriver *this, const OSMetaClass *a2)
{
  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, a2);
  void *v2 = off_15AE8;
}

{
  void *v2;

  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, a2);
  void *v2 = off_15AE8;
}

void AppleMultitouchMouseHIDEventDriver::~AppleMultitouchMouseHIDEventDriver(AppleMultitouchMouseHIDEventDriver *this)
{
}

{
  AppleMultitouchInputHIDEventDriver::~AppleMultitouchInputHIDEventDriver(this);
}

{
  uint64_t vars8;

  AppleMultitouchInputHIDEventDriver::~AppleMultitouchInputHIDEventDriver(this);

  _OSObject_typed_operator_delete(&AppleMultitouchMouseHIDEventDriver_ktv, this, 408);
}

void AppleMultitouchMouseHIDEventDriver::operator delete(void *a1, uint64_t a2)
{
}

void *AppleMultitouchMouseHIDEventDriver::getMetaClass(AppleMultitouchMouseHIDEventDriver *this)
{
  return &AppleMultitouchMouseHIDEventDriver::gMetaClass;
}

AppleMultitouchInputHIDEventDriver *AppleMultitouchMouseHIDEventDriver::MetaClass::alloc(AppleMultitouchMouseHIDEventDriver::MetaClass *this)
{
  int v1 = (AppleMultitouchInputHIDEventDriver *)OSObject_typed_operator_new();
  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(v1, &AppleMultitouchMouseHIDEventDriver::gMetaClass);
  void *v2 = off_15AE8;
  OSMetaClass::instanceConstructed(&AppleMultitouchMouseHIDEventDriver::gMetaClass);
  return v1;
}

uint64_t AppleMultitouchMouseHIDEventDriver::operator new(AppleMultitouchMouseHIDEventDriver *this)
{
  return OSObject_typed_operator_new();
}

void AppleMultitouchMouseHIDEventDriver::AppleMultitouchMouseHIDEventDriver(AppleMultitouchMouseHIDEventDriver *this)
{
  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, &AppleMultitouchMouseHIDEventDriver::gMetaClass);
  void *v1 = off_15AE8;
  OSMetaClass::instanceConstructed(&AppleMultitouchMouseHIDEventDriver::gMetaClass);
}

{
  void *v1;

  AppleMultitouchInputHIDEventDriver::AppleMultitouchInputHIDEventDriver(this, &AppleMultitouchMouseHIDEventDriver::gMetaClass);
  void *v1 = off_15AE8;
  OSMetaClass::instanceConstructed(&AppleMultitouchMouseHIDEventDriver::gMetaClass);
}

uint64_t AppleMultitouchMouseHIDEventDriver::init(AppleMultitouchMouseHIDEventDriver *this, OSDictionary *a2)
{
  uint64_t v3 = AppleMultitouchInputHIDEventDriver::init((OSMetaClassBase *)this, a2);
  if (v3) {
    *(_WORD *)((char *)this + 403) = 14083;
  }
  else {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s super::init() failed\n", "ATC", "AppleMultitouchMouseHIDEventDriver", "init");
  }
  return v3;
}

uint64_t AppleMultitouchMouseHIDEventDriver::free(AppleMultitouchMouseHIDEventDriver *this)
{
  return AppleMultitouchInputHIDEventDriver::free(this);
}

uint64_t AppleMultitouchMouseHIDEventDriver::start(AppleMultitouchMouseHIDEventDriver *this, IOService *a2)
{
  uint64_t v4 = AppleMultitouchHIDEventDriverV2::start(this, a2);
  if (v4)
  {
    if (!*((unsigned char *)this + 405)) {
      (*(void (**)(AppleMultitouchMouseHIDEventDriver *))(*(void *)this + 1912))(this);
    }
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s super::start failed\n", "ATC", "AppleMultitouchMouseHIDEventDriver", "start");
    (*(void (**)(AppleMultitouchMouseHIDEventDriver *, IOService *))(*(void *)this + 696))(this, a2);
  }
  return v4;
}

uint64_t AppleMultitouchMouseHIDEventDriver::stop(AppleMultitouchMouseHIDEventDriver *this, IOService *a2)
{
  return AppleMultitouchInputHIDEventDriver::stop(this, a2);
}

void AppleMultitouchMouseHIDEventDriver::handleInterruptReport(AppleMultitouchMouseHIDEventDriver *this, unint64_t a2, IOMemoryDescriptor *a3, IOHIDReportType a4, unsigned int a5)
{
  uint64_t v17 = 0;
  unsigned int v10 = ((uint64_t (*)(IOMemoryDescriptor *))a3->getLength)(a3);
  unint64_t v11 = v10;
  if (v10 <= (unint64_t)(*(uint64_t (**)(void))(**((void **)this + 42) + 320))())
  {
    unsigned int v12 = (unsigned __int8 *)(*(uint64_t (**)(void))(**((void **)this + 42) + 328))(*((void *)this + 42));
    ((void (*)(IOMemoryDescriptor *, void, unsigned __int8 *, void))a3->readBytes)(a3, 0, v12, v10);
    (*(void (**)(void))(**((void **)this + 42) + 304))();
    if (a5 == 18)
    {
      if (v10 == 8 || (((_BYTE)v10 + 2) & 7) == 0)
      {
        (*(void (**)(void, void))(**((void **)this + 42) + 304))(*((void *)this + 42), v10);
        if ((*(uint64_t (**)(AppleMultitouchMouseHIDEventDriver *))(*(void *)this + 1760))(this))
        {
          if (_atc_parseSimpleMouseV3Packet((uint64_t)&v17, (unint64_t)v12, 8))
          {
            uint64_t v14 = (*(uint64_t (**)(AppleMultitouchMouseHIDEventDriver *))(*(void *)this + 1760))(this);
            (*(void (**)(uint64_t, void, void, void, uint64_t))(*(void *)v14 + 1488))(v14, SWORD1(v17), SWORD2(v17), BYTE1(v17) & 3, 1600);
            if (*((unsigned char *)this + 402) != BYTE1(v17) >> 7)
            {
              *((unsigned char *)this + 402) = BYTE1(v17) >> 7;
              uint64_t v15 = *(void *)(*(uint64_t (**)(AppleMultitouchMouseHIDEventDriver *))(*(void *)this + 1760))(this);
              (*(void (**)(void))(v15 + 1496))();
            }
          }
          if (v10 >= 9uLL)
          {
            size_t v16 = v10 - 8;
            if (v16 >= 0xFFFFFFF8) {
              os_detail::panic_trapping_policy::trap("bounded_array_ref: n + m is larger than the size of any bounded_array_ref");
            }
            if (v16 + 8 > v11) {
              os_detail::panic_trapping_policy::trap("bounded_array_ref: invalid slice provided, the indices are of bounds for the bounded_array_ref");
            }
            memmove(v12, v12 + 8, v16);
            (*(void (**)(void))(**((void **)this + 42) + 304))();
            if (&v12[v11] < v12 || HIDWORD(v11)) {
              os_detail::panic_trapping_policy::trap("The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range");
            }
            AppleMultitouchHIDEventDriverV2::handleInterruptReport(this, a2, *((IOMemoryDescriptor **)this + 42), a4, *v12);
          }
        }
      }
      else
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Received 0x%02X report of incorrect size!\n", "ATC", "AppleMultitouchMouseHIDEventDriver", "handleInterruptReport", 18);
      }
    }
    else
    {
      AppleMultitouchHIDEventDriverV2::handleInterruptReport(this, a2, a3, a4, a5);
    }
  }
  else
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Input report length (%u bytes) > capacity. Dropping report.\n", "ATC", "AppleMultitouchMouseHIDEventDriver", "handleInterruptReport", v10);
  }
}

uint64_t AppleMultitouchMouseHIDEventDriver::setSystemProperties(IOHIDEventService *this, OSDictionary *a2)
{
  uint64_t v4 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->getObject_1)(a2, "MouseUserPreferences");
  int v5 = OSMetaClassBase::safeMetaCast(v4, OSDictionary::metaClass);
  if (v5)
  {
    setProperty_0 = this->__vftable[1].setProperty_0;
    return ((uint64_t (*)(IOHIDEventService *, OSMetaClassBase *))setProperty_0)(this, v5);
  }
  else
  {
    return IOHIDEventService::setSystemProperties(this, a2);
  }
}

uint64_t AppleMultitouchMouseHIDEventDriver::setMultitouchPreferences(AppleMultitouchMouseHIDEventDriver *this, OSDictionary *a2)
{
  uint64_t result = AppleMultitouchInputHIDEventDriver::setMultitouchPreferences(this, a2);
  if (!result)
  {
    int v5 = *(uint64_t (**)(AppleMultitouchMouseHIDEventDriver *, OSDictionary *))(*(void *)this + 1904);
    return v5(this, a2);
  }
  return result;
}

uint64_t AppleMultitouchMouseHIDEventDriver::setMousePreferences(AppleMultitouchMouseHIDEventDriver *this, OSDictionary *a2)
{
  uint64_t v4 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->getObject_1)(a2, "MouseButtonMode");
  int v5 = OSMetaClassBase::safeMetaCast(v4, OSString::metaClass);
  unsigned int v6 = v5;
  if (v5)
  {
    if (((uint64_t (*)(OSMetaClassBase *, const char *))v5->__vftable[1].taggedRelease)(v5, "TwoButton"))
    {
      int v7 = 1;
    }
    else if (((uint64_t (*)(OSMetaClassBase *, const char *))v6->__vftable[1].taggedRelease)(v6, "TwoButtonSwapped"))
    {
      int v7 = 2;
    }
    else
    {
      if (!((unsigned int (*)(OSMetaClassBase *, const char *))v6->__vftable[1].taggedRelease)(v6, "OneButton"))
      {
LABEL_9:
        LODWORD(v6) = 0;
        goto LABEL_11;
      }
      int v7 = 3;
    }
    if (v7 != *((unsigned __int8 *)this + 403))
    {
      *((unsigned char *)this + 403) = v7;
      LODWORD(v6) = 1;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_11:
  uint64_t v8 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->getObject_1)(a2, "MouseButtonDivision");
  uint64_t v9 = OSMetaClassBase::safeMetaCast(v8, OSNumber::metaClass);
  if (v9
    && (unsigned int v10 = ((uint64_t (*)(OSMetaClassBase *))v9->__vftable[1].serialize)(v9), v10 <= 0x64)
    && v10 != *((unsigned __int8 *)this + 404))
  {
    *((unsigned char *)this + 404) = v10;
  }
  else if (!v6)
  {
    return 0;
  }
  *((unsigned char *)this + 405) = 1;
  unsigned int v12 = *(uint64_t (**)(AppleMultitouchMouseHIDEventDriver *))(*(void *)this + 1912);

  return v12(this);
}

uint64_t AppleMultitouchMouseHIDEventDriver::syncMousePreferences(const OSMetaClassBase *this)
{
  if (!((uint64_t (*)(const OSMetaClassBase *))this->__vftable[8].getMetaClass)(this)) {
    return 3758097112;
  }
  uint64_t v2 = ((uint64_t (*)(const OSMetaClassBase *))this->__vftable[8].getMetaClass)(this);
  serialize = this->__vftable[18].serialize;
  if (!serialize)
  {
    v8.ptr = (void (*)(void))AppleMultitouchMouseHIDEventDriver::syncMousePreferencesGated;
    v8.adj = 0;
    OSMetaClassBase::_ptf_t v4 = OSMetaClassBase::_ptmf2ptf(this, v8);
    if (v4) {
      serialize = v4;
    }
    else {
      serialize = 0;
    }
  }
  unsigned int v6 = *(uint64_t (**)(uint64_t, void *, const OSMetaClassBase *, void, void, void, void))(*(void *)v2 + 256);

  return v6(v2, serialize, this, 0, 0, 0, 0);
}

uint64_t AppleMultitouchMouseHIDEventDriver::syncMousePreferencesGated(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 1920))(a1);
}

uint64_t AppleMultitouchMouseHIDEventDriver::syncMousePreferencesGated(AppleMultitouchMouseHIDEventDriver *this)
{
  __int16 v2 = *(_WORD *)((char *)this + 403);
  return (*(uint64_t (**)(AppleMultitouchMouseHIDEventDriver *, uint64_t, __int16 *, uint64_t, uint64_t))(*(void *)this + 1784))(this, 6, &v2, 2, 3);
}

OSMetaClass *_GLOBAL__sub_I_AppleMultitouchMouseHIDEventDriver_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleMultitouchMouseHIDEventDriver::gMetaClass, "AppleMultitouchMouseHIDEventDriver", &AppleMultitouchInputHIDEventDriver::gMetaClass, 0x198u);
  result->__vftable = (OSMetaClass_vtbl *)off_16288;
  return result;
}

void global destructor keyed to'_a_2()
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
  return aComAppleDriver;
}

const char *OSKextGetCurrentVersionString(void)
{
  return (const char *)&unk_10050;
}

OSKextLoadTag OSKextGetCurrentLoadTag(void)
{
  return dword_1000C;
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

IORecursiveLock *IORecursiveLockAlloc(void)
{
  return _IORecursiveLockAlloc();
}

void IORecursiveLockFree(IORecursiveLock *lock)
{
}

void IORecursiveLockLock(IORecursiveLock *lock)
{
}

void IORecursiveLockUnlock(IORecursiveLock *lock)
{
}

uint64_t OSObject_typed_operator_new()
{
  return _OSObject_typed_operator_new();
}

OSMetaClass *__cdecl OSMetaClass::OSMetaClass(OSMetaClass *this, const char *className, const OSMetaClass *superclass, unsigned int classSize)
{
  return OSMetaClass::OSMetaClass(this, className, superclass, classSize);
}

void OSMetaClass::~OSMetaClass(OSMetaClass *this)
{
}

OSDictionary *__cdecl OSDictionary::withCapacity(unsigned int capacity)
{
  return OSDictionary::withCapacity(capacity);
}

BOOL OSDictionary::setObject(OSDictionary *this, const char *aKey, const OSMetaClassBase *const *anObject)
{
  return OSDictionary::setObject(this, aKey, anObject);
}

uint64_t IORegistryEntry::getRegistryEntryID(IORegistryEntry *this)
{
  return IORegistryEntry::getRegistryEntryID(this);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

OSMetaClassBase::_ptf_t OSMetaClassBase::_ptmf2ptf(const OSMetaClassBase *self, $C0E0325F155B7E7CE2BD0701CF49B8F1 func)
{
  return OSMetaClassBase::_ptmf2ptf(self, func);
}

BOOL IOHIDEventService::readyForReports(IOHIDEventService *this)
{
  return IOHIDEventService::readyForReports(this);
}

IOHIDEventService *__cdecl IOHIDEventService::IOHIDEventService(IOHIDEventService *this, const OSMetaClass *a2)
{
  return IOHIDEventService::IOHIDEventService(this, a2);
}

void IOHIDEventService::~IOHIDEventService(IOHIDEventService *this)
{
}

IOTimerEventSource *__cdecl IOTimerEventSource::timerEventSource(OSObject *owner, IOTimerEventSource::Action action)
{
  return IOTimerEventSource::timerEventSource(owner, action);
}

IOBufferMemoryDescriptor *__cdecl IOBufferMemoryDescriptor::withCapacity(vm_size_t capacity, IODirection withDirection, BOOL withContiguousMemory)
{
  return IOBufferMemoryDescriptor::withCapacity(capacity, withDirection, withContiguousMemory);
}

void AppleMultitouchHIDEventDriverV2::AppleMultitouchHIDEventDriverV2(AppleMultitouchHIDEventDriverV2 *this, const OSMetaClass *a2)
{
}

OSData *__cdecl OSData::withBytes(const void *bytes, unsigned int numBytes)
{
  return OSData::withBytes(bytes, numBytes);
}

OSNumber *__cdecl OSNumber::withNumber(unint64_t value, unsigned int numberOfBits)
{
  return OSNumber::withNumber(value, numberOfBits);
}

uint64_t OSString::withCString(OSString *this, const char *a2, unint64_t a3)
{
  return OSString::withCString(this, a2, a3);
}

IOPMrootDomain *IOService::getPMRootDomain(void)
{
  return IOService::getPMRootDomain();
}

OSDictionary *__cdecl IOService::serviceMatching(const char *className, OSDictionary *table)
{
  return IOService::serviceMatching(className, table);
}

OSIterator *__cdecl IOService::getMatchingServices(OSDictionary *matching)
{
  return IOService::getMatchingServices(matching);
}

IONotifier *__cdecl IOService::addMatchingNotification(const OSSymbol *type, OSDictionary *matching, IOServiceMatchingNotificationHandler handler, void *target, void *ref, SInt32 priority)
{
  return IOService::addMatchingNotification(type, matching, handler, target, ref, priority);
}

IOPMPowerFlags IOService::registerInterestedDriver(IOService *this, IOService *theDriver)
{
  return IOService::registerInterestedDriver(this, theDriver);
}

IOReturn IOService::deRegisterInterestedDriver(IOService *this, IOService *theDriver)
{
  return IOService::deRegisterInterestedDriver(this, theDriver);
}

const char *__cdecl OSMetaClass::getClassName(const OSMetaClass *this)
{
  return OSMetaClass::getClassName(this);
}

void OSMetaClass::instanceConstructed(const OSMetaClass *this)
{
}

BOOL IOService::isInactive(const IOService *this)
{
  return IOService::isInactive(this);
}

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void panic(const char *string, ...)
{
}

IONotifier *__cdecl registerPrioritySleepWakeInterest(IOServiceInterestHandler handler, void *self, void *ref)
{
  return _registerPrioritySleepWakeInterest(handler, self, ref);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

thread_call_t thread_call_allocate(thread_call_func_t func, thread_call_param_t param0)
{
  return _thread_call_allocate(func, param0);
}

BOOLean_t thread_call_enter(thread_call_t call)
{
  return _thread_call_enter(call);
}

BOOLean_t thread_call_free(thread_call_t call)
{
  return _thread_call_free(call);
}