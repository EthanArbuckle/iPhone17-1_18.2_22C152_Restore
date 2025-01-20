OSMetaClass *AppleUSBTopCaseHIDDriver::MetaClass::MetaClass(OSMetaClass *this)
{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleUSBTopCaseHIDDriver", &IOUSBHostHIDDevice::gMetaClass, 0x168u);
  result->__vftable = (OSMetaClass_vtbl *)off_C790;
  return result;
}

{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleUSBTopCaseHIDDriver", &IOUSBHostHIDDevice::gMetaClass, 0x168u);
  result->__vftable = (OSMetaClass_vtbl *)off_C790;
  return result;
}

void AppleUSBTopCaseHIDDriver::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleUSBTopCaseHIDDriver::AppleUSBTopCaseHIDDriver(AppleUSBTopCaseHIDDriver *this, const OSMetaClass *a2)
{
  IOUSBHostHIDDevice::IOUSBHostHIDDevice((IOUSBHostHIDDevice *)this, a2)->__vftable = (IOUSBHostHIDDevice_vtbl *)off_C098;
}

{
  IOUSBHostHIDDevice::IOUSBHostHIDDevice((IOUSBHostHIDDevice *)this, a2)->__vftable = (IOUSBHostHIDDevice_vtbl *)off_C098;
}

void AppleUSBTopCaseHIDDriver::~AppleUSBTopCaseHIDDriver(IOUSBHostHIDDevice *this)
{
}

{
  IOUSBHostHIDDevice::~IOUSBHostHIDDevice(this);
}

{
  uint64_t vars8;

  IOUSBHostHIDDevice::~IOUSBHostHIDDevice(this);

  _OSObject_typed_operator_delete(&AppleUSBTopCaseHIDDriver_ktv, this, 360);
}

void AppleUSBTopCaseHIDDriver::operator delete(void *a1, uint64_t a2)
{
}

void *AppleUSBTopCaseHIDDriver::getMetaClass(AppleUSBTopCaseHIDDriver *this)
{
  return &AppleUSBTopCaseHIDDriver::gMetaClass;
}

IOUSBHostHIDDevice *AppleUSBTopCaseHIDDriver::MetaClass::alloc(AppleUSBTopCaseHIDDriver::MetaClass *this)
{
  v1 = (IOUSBHostHIDDevice *)OSObject_typed_operator_new();
  IOUSBHostHIDDevice::IOUSBHostHIDDevice(v1, &AppleUSBTopCaseHIDDriver::gMetaClass)->__vftable = (IOUSBHostHIDDevice_vtbl *)off_C098;
  OSMetaClass::instanceConstructed(&AppleUSBTopCaseHIDDriver::gMetaClass);
  return v1;
}

uint64_t AppleUSBTopCaseHIDDriver::operator new(AppleUSBTopCaseHIDDriver *this)
{
  return OSObject_typed_operator_new();
}

void AppleUSBTopCaseHIDDriver::AppleUSBTopCaseHIDDriver(AppleUSBTopCaseHIDDriver *this)
{
  IOUSBHostHIDDevice::IOUSBHostHIDDevice((IOUSBHostHIDDevice *)this, &AppleUSBTopCaseHIDDriver::gMetaClass)->__vftable = (IOUSBHostHIDDevice_vtbl *)off_C098;
  OSMetaClass::instanceConstructed(&AppleUSBTopCaseHIDDriver::gMetaClass);
}

{
  IOUSBHostHIDDevice::IOUSBHostHIDDevice((IOUSBHostHIDDevice *)this, &AppleUSBTopCaseHIDDriver::gMetaClass)->__vftable = (IOUSBHostHIDDevice_vtbl *)off_C098;
  OSMetaClass::instanceConstructed(&AppleUSBTopCaseHIDDriver::gMetaClass);
}

uint64_t AppleUSBTopCaseHIDDriver::handleStart(AppleUSBTopCaseHIDDriver *this, IOService *a2)
{
  if (result)
  {
    v5 = OSMetaClassBase::safeMetaCast(a2, IOUSBHostInterface::metaClass);
    if (v5)
    {
      v6 = v5;
      char v7 = ((uint64_t (*)(OSMetaClassBase *))v5->__vftable[14].Dispatch)(v5);
      if ((v7 & 0xF) == 2) {
        uint64_t v8 = 100;
      }
      else {
        uint64_t v8 = 0;
      }
      if ((v7 & 0xF) == 2) {
        uint64_t v9 = 3000;
      }
      else {
        uint64_t v9 = 0;
      }
      int v10 = ((uint64_t (*)(OSMetaClassBase *, uint64_t))v6->__vftable[13].release)(v6, v9);
      if (v10)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s hostInterfaceProvider->setIdlePolicy() returned 0x%08X\n", "ATC", "AppleUSBTopCaseHIDDriver", "handleStart", v10);
        return 0;
      }
      else
      {
        uint64_t v11 = *((void *)this + 31);
        if (v11 && (int v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v11 + 328))(v11, v8)) != 0)
        {
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s _interruptPipe->setIdlePolicy() returned 0x%08X\n", "ATC", "AppleUSBTopCaseHIDDriver", "handleStart", v12);
          return 0;
        }
        else
        {
          uint64_t v13 = *((void *)this + 32);
          if (v13 && (int v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v13 + 328))(v13, v8)) != 0)
          {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s _interruptOutPipe->setIdlePolicy() returned 0x%08X\n", "ATC", "AppleUSBTopCaseHIDDriver", "handleStart", v14);
            return 0;
          }
          else
          {
            return 1;
          }
        }
      }
    }
    else
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[HID] [%s] [Error] %s::%s Failed to cast provider to IOUSBHostInterface!\n", "ATC", "AppleUSBTopCaseHIDDriver", "handleStart");
      return 0;
    }
  }
  return result;
}

OSMetaClass *_GLOBAL__sub_I_AppleUSBTopCaseHIDDriver_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleUSBTopCaseHIDDriver::gMetaClass, "AppleUSBTopCaseHIDDriver", &IOUSBHostHIDDevice::gMetaClass, 0x168u);
  result->__vftable = (OSMetaClass_vtbl *)off_C790;
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
  return aComAppleDriver;
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

IOUSBHostHIDDevice *__cdecl IOUSBHostHIDDevice::IOUSBHostHIDDevice(IOUSBHostHIDDevice *this, const OSMetaClass *a2)
{
  return IOUSBHostHIDDevice::IOUSBHostHIDDevice(this, a2);
}

void IOUSBHostHIDDevice::~IOUSBHostHIDDevice(IOUSBHostHIDDevice *this)
{
}

void OSMetaClass::instanceConstructed(const OSMetaClass *this)
{
}

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
}