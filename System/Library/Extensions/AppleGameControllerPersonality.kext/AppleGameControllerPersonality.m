OSMetaClass *AppleGCHIDEventDummyService::MetaClass::MetaClass(OSMetaClass *this)
{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleGCHIDEventDummyService", &IOHIDEventService::gMetaClass, 0xD0u);
  result->__vftable = (OSMetaClass_vtbl *)off_C7A8;
  return result;
}

{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleGCHIDEventDummyService", &IOHIDEventService::gMetaClass, 0xD0u);
  result->__vftable = (OSMetaClass_vtbl *)off_C7A8;
  return result;
}

void AppleGCHIDEventDummyService::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleGCHIDEventDummyService::AppleGCHIDEventDummyService(AppleGCHIDEventDummyService *this, const OSMetaClass *a2)
{
  IOHIDEventService::IOHIDEventService((IOHIDEventService *)this, a2)->__vftable = (IOHIDEventService_vtbl *)off_C0B8;
}

{
  IOHIDEventService::IOHIDEventService((IOHIDEventService *)this, a2)->__vftable = (IOHIDEventService_vtbl *)off_C0B8;
}

void AppleGCHIDEventDummyService::~AppleGCHIDEventDummyService(IOHIDEventService *this)
{
}

{
  IOHIDEventService::~IOHIDEventService(this);
}

{
  uint64_t vars8;

  IOHIDEventService::~IOHIDEventService(this);

  _OSObject_typed_operator_delete(&AppleGCHIDEventDummyService_ktv, this, 208);
}

void AppleGCHIDEventDummyService::operator delete(void *a1, uint64_t a2)
{
}

void *AppleGCHIDEventDummyService::getMetaClass(AppleGCHIDEventDummyService *this)
{
  return &AppleGCHIDEventDummyService::gMetaClass;
}

IOHIDEventService *AppleGCHIDEventDummyService::MetaClass::alloc(AppleGCHIDEventDummyService::MetaClass *this)
{
  v1 = (IOHIDEventService *)OSObject_typed_operator_new();
  IOHIDEventService::IOHIDEventService(v1, &AppleGCHIDEventDummyService::gMetaClass)->__vftable = (IOHIDEventService_vtbl *)off_C0B8;
  OSMetaClass::instanceConstructed(&AppleGCHIDEventDummyService::gMetaClass);
  return v1;
}

uint64_t AppleGCHIDEventDummyService::operator new(AppleGCHIDEventDummyService *this)
{
  return OSObject_typed_operator_new();
}

void AppleGCHIDEventDummyService::AppleGCHIDEventDummyService(AppleGCHIDEventDummyService *this)
{
  IOHIDEventService::IOHIDEventService((IOHIDEventService *)this, &AppleGCHIDEventDummyService::gMetaClass)->__vftable = (IOHIDEventService_vtbl *)off_C0B8;
  OSMetaClass::instanceConstructed(&AppleGCHIDEventDummyService::gMetaClass);
}

{
  IOHIDEventService::IOHIDEventService((IOHIDEventService *)this, &AppleGCHIDEventDummyService::gMetaClass)->__vftable = (IOHIDEventService_vtbl *)off_C0B8;
  OSMetaClass::instanceConstructed(&AppleGCHIDEventDummyService::gMetaClass);
}

AppleGCHIDEventDummyService *AppleGCHIDEventDummyService::probe(AppleGCHIDEventDummyService *this, IOService *a2, int *a3)
{
  v5 = (os_log_s *)Log(void)::log;
  if (!Log(void)::log)
  {
    v5 = os_log_create("com.apple.GameController", "Kernel");
    Log(void)::log = (uint64_t)v5;
  }
  _os_log_internal(&dword_0, v5, OS_LOG_TYPE_DEBUG, "AppleGCHIDEventDummyService::probe()");
  v6 = OSMetaClassBase::safeMetaCast(a2, IOHIDInterface::metaClass);
  if (!v6) {
    return 0;
  }
  v7 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *))v6->__vftable[8].serialize)(v6);
  v8 = OSMetaClassBase::safeMetaCast(v7, IOHIDDevice::metaClass);
  if (!v8) {
    return 0;
  }
  v9 = (const OSMetaClassBase *)((uint64_t (*)(OSMetaClassBase *, const char *))v8->__vftable[3].release)(v8, "GameControllerSupportedHIDDevice");
  if (!v9) {
    return 0;
  }
  v10 = v9;
  v11 = OSMetaClassBase::safeMetaCast(v9, OSBoolean::metaClass);
  if (v11
    && ((unsigned int (*)(OSMetaClassBase *, OSBoolean *const))v11->__vftable[1].release_0)(v11, *kOSBooleanTrue))
  {
    v12 = (os_log_s *)Log(void)::log;
    if (!Log(void)::log)
    {
      v12 = os_log_create("com.apple.GameController", "Kernel");
      Log(void)::log = (uint64_t)v12;
    }
    _os_log_internal(&dword_0, v12, OS_LOG_TYPE_DEBUG, "AppleGCHIDEventDummyService::probe() matched!");
  }
  else
  {
    this = 0;
  }
  ((void (*)(const OSMetaClassBase *))v10->release_0)(v10);
  return this;
}

OSMetaClassBase *AppleGCHIDEventDummyService::handleStart(AppleGCHIDEventDummyService *this, IOService *anObject)
{
  result = OSMetaClassBase::safeMetaCast(anObject, IOHIDInterface::metaClass);
  *((void *)this + 25) = result;
  if (result)
  {
    v5 = kOSBooleanTrue;
    ((void (*)(AppleGCHIDEventDummyService *, const char *, OSBoolean *const))setProperty_1)(this, "GamepadHIDServiceSupport", *kOSBooleanTrue);
    ((void (*)(AppleGCHIDEventDummyService *, const char *, OSBoolean *const))setProperty_1)(this, "HIDServiceSupport", *v5);
    v6 = *(uint64_t (**)(void))(**((void **)this + 25) + 1344);
    return (OSMetaClassBase *)v6();
  }
  return result;
}

uint64_t AppleGCHIDEventDummyService::didTerminate(AppleGCHIDEventDummyService *this, IOService *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v8 = *((void *)this + 25);
  if (v8) {
    (*(void (**)(uint64_t, AppleGCHIDEventDummyService *, void))(*(void *)v8 + 712))(v8, this, 0);
  }
  *((void *)this + 25) = 0;

  return ((uint64_t (*)(AppleGCHIDEventDummyService *, IOService *, uint64_t, BOOL *))didTerminate)(this, a2, a3, a4);
}

uint64_t AppleGCHIDEventDummyService::setProperty(AppleGCHIDEventDummyService *this, const OSSymbol *a2, OSObject *a3)
{
  if (!a2
    || (v6 = (const char *)((uint64_t (*)(const OSSymbol *))a2->getCStringNoCopy)(a2)) == 0
    || (uint64_t result = strcmp("IOCFPlugInTypes", v6), result))
  {
    return ((uint64_t (*)(AppleGCHIDEventDummyService *, const OSSymbol *, OSObject *))setProperty)(this, a2, a3);
  }
  return result;
}

OSMetaClass *_GLOBAL__sub_I_AppleGCHIDEventDummyService_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleGCHIDEventDummyService::gMetaClass, "AppleGCHIDEventDummyService", &IOHIDEventService::gMetaClass, 0xD0u);
  result->__vftable = (OSMetaClass_vtbl *)off_C7A8;
  return result;
}

void global destructor keyed to'_a()
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
  return aComAppleGamete;
}

const char *OSKextGetCurrentVersionString(void)
{
  return &aComAppleGamete[64];
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

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

IOHIDEventService *__cdecl IOHIDEventService::IOHIDEventService(IOHIDEventService *this, const OSMetaClass *a2)
{
  return IOHIDEventService::IOHIDEventService(this, a2);
}

void IOHIDEventService::~IOHIDEventService(IOHIDEventService *this)
{
}

void OSMetaClass::instanceConstructed(const OSMetaClass *this)
{
}

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}