BOOL AppleUserUSBHostHIDDevice::init(IOUserUSBHostHIDDevice *this)
{
  BOOL v2;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;

  v2 = IOUserUSBHostHIDDevice::init(this);
  if (v2)
  {
    if (!this->ivars) {
      sub_1000034DC();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446722;
    v5 = "AppleUserUSBHostHIDDevice.cpp";
    v6 = 1024;
    v7 = 54;
    v8 = 1024;
    v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d]init:%x\n", (uint8_t *)&v4, 0x18u);
  }
  return v2;
}

BOOL non-virtual thunk to'AppleUserUSBHostHIDDevice::init(AppleUserUSBHostHIDDevice *this)
{
  return AppleUserUSBHostHIDDevice::init((IOUserUSBHostHIDDevice *)((char *)this - 24));
}

uint64_t AppleUserUSBHostHIDDevice::Start_Impl(IOService *this, IOService *a2)
{
  uint64_t v4 = 3758097095;
  unsigned int v23 = 0;
  properties = 0;
  IOParseBootArgNumber("AppleUserUSBHostHIDDevice-debug", &v23, 4);
  if (v23) {
    return v4;
  }
  uint64_t v5 = IOService::Start(this, a2, (OSDispatchMethod)&IOUserUSBHostHIDDevice::_Dispatch);
  if (v5)
  {
    uint64_t v19 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__str = 136446722;
      *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
      *(_WORD *)&__str[12] = 1024;
      *(_DWORD *)&__str[14] = 77;
      *(_WORD *)&__str[18] = 1024;
      *(_DWORD *)&__str[20] = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d]Start:0x%x\n", (uint8_t *)__str, 0x18u);
    }
    uint64_t v4 = v19;
    goto LABEL_21;
  }
  if (!IOService::CopyProperties(this, &properties, (OSDispatchMethod)&IOUserUSBHostHIDDevice::_Dispatch))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    memset(__str, 0, sizeof(__str));
    if (IOParseBootArgString("AppleUserUSBHostHIDDevice-blacklist", __str, 256))
    {
      __endptr = __str;
      uint64_t UInt64Value = OSDictionaryGetUInt64Value(properties, "VendorID");
      uint64_t v7 = UInt64Value | (OSDictionaryGetUInt64Value(properties, "ProductID") << 16);
      while (strtoull(__str, &__endptr, 0) != v7)
      {
        if (__endptr <= __str || !*__endptr) {
          goto LABEL_9;
        }
      }
      uint64_t v8 = 3758097095;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)registryEntryID = 0;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
        uint64_t v18 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserUSBHostHIDDevice.cpp";
        __int16 v25 = 1024;
        int v26 = 97;
        __int16 v27 = 2048;
        uint64_t v28 = v18;
        __int16 v29 = 2048;
        uint64_t v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Device blacklisted:0x%llx\n\n\n", registryEntryID, 0x26u);
      }
    }
    else
    {
LABEL_9:
      uint64_t v8 = 0;
    }
    uint64_t v9 = OSDictionaryGetUInt64Value(properties, "AppleUserUSBHostHIDDevice-debug");
    if ((v9 & ~(unint64_t)v23) != 0)
    {
      uint64_t v12 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)registryEntryID = 0;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
        uint64_t v13 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserUSBHostHIDDevice.cpp";
        __int16 v25 = 1024;
        int v26 = 105;
        __int16 v27 = 2048;
        uint64_t v28 = v13;
        __int16 v29 = 2048;
        uint64_t v30 = v12;
        v14 = "[%{public}s:%d][0x%llx] Device support require AppleUserUSBHostHIDDevice-debug:0x%llx\n\n\n";
        v15 = registryEntryID;
        uint32_t v16 = 38;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)v15, v16);
      }
    }
    else
    {
      uint64_t v4 = v8;
      if (!v8) {
        goto LABEL_12;
      }
    }
LABEL_21:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)__str = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)__str, 0);
      uint64_t v17 = *(void *)__str;
      *(_DWORD *)__str = 136446978;
      *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
      *(_WORD *)&__str[12] = 1024;
      *(_DWORD *)&__str[14] = 119;
      *(_WORD *)&__str[18] = 2048;
      *(void *)&__str[20] = v17;
      *(_WORD *)&__str[28] = 1024;
      *(_DWORD *)&__str[30] = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Start failed: 0x%x\n\n", (uint8_t *)__str, 0x22u);
    }
    IOService::Stop(this, a2, 0);
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = IOService::RegisterService(this, 0);
  if (v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(void *)__str = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)__str, 0);
    uint64_t v20 = *(void *)__str;
    *(_DWORD *)__str = 136446978;
    *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
    *(_WORD *)&__str[12] = 1024;
    *(_DWORD *)&__str[14] = 114;
    *(_WORD *)&__str[18] = 2048;
    *(void *)&__str[20] = v20;
    *(_WORD *)&__str[28] = 1024;
    *(_DWORD *)&__str[30] = v4;
    v14 = "[%{public}s:%d][0x%llx] RegisterService:0x%x\n\n\n";
    v15 = __str;
    uint32_t v16 = 34;
    goto LABEL_20;
  }
LABEL_13:
  if (properties)
  {
    ((void (*)(OSDictionary *))properties->release)(properties);
    properties = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)__str = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)__str, 0);
    uint64_t v10 = *(void *)__str;
    *(_DWORD *)__str = 136446978;
    *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
    *(_WORD *)&__str[12] = 1024;
    *(_DWORD *)&__str[14] = 126;
    *(_WORD *)&__str[18] = 2048;
    *(void *)&__str[20] = v10;
    *(_WORD *)&__str[28] = 1024;
    *(_DWORD *)&__str[30] = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Start ret: 0x%x\n\n", (uint8_t *)__str, 0x22u);
  }
  return v4;
}

uint64_t sub_100001428(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_10000145C(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_100001490(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_1000014C4(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_1000014F8(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t AppleUserUSBHostHIDDevice::Stop_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Stop(this, a2, (OSDispatchMethod)&IOUserUSBHostHIDDevice::_Dispatch);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v4 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136446978;
    *(void *)&registryEntryID[4] = "AppleUserUSBHostHIDDevice.cpp";
    __int16 v7 = 1024;
    int v8 = 137;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Stop: 0x%x\n\n", registryEntryID, 0x22u);
  }
  return v3;
}

uint64_t sub_100001688(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t AppleUserHIDEventDriver::init(AppleUserHIDEventDriver *this)
{
  uint64_t v2 = AppleUserHIDEventService::init(this);
  if (v2)
  {
    *((void *)this + 14) = IOMallocZeroTyped();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446722;
    uint64_t v5 = "AppleUserHIDEventDriver.cpp";
    __int16 v6 = 1024;
    int v7 = 78;
    __int16 v8 = 1024;
    int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d]Init:%x\n", (uint8_t *)&v4, 0x18u);
  }
  return v2;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::init(AppleUserHIDEventDriver *this)
{
  return AppleUserHIDEventDriver::init((AppleUserHIDEventDriver *)((char *)this - 24));
}

uint64_t AppleUserHIDEventDriver::free(AppleUserHIDEventDriver *this)
{
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    if (*v2)
    {
      (*(void (**)(void))(*(void *)*v2 + 16))(*v2);
      **((void **)this + 14) = 0;
      uint64_t v2 = (void *)*((void *)this + 14);
    }
    uint64_t v3 = v2[1];
    if (!v3
      || ((*(void (**)(void))(*(void *)v3 + 16))(v2[1]),
          *(void *)(*((void *)this + 14) + 8) = 0,
          (uint64_t v2 = (void *)*((void *)this + 14)) != 0))
    {
      IOFree(v2, 0x18uLL);
      *((void *)this + 14) = 0;
    }
  }
  return AppleUserHIDEventService::free(this);
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::free(AppleUserHIDEventDriver *this)
{
  return AppleUserHIDEventDriver::free((AppleUserHIDEventDriver *)((char *)this - 24));
}

void AppleUserHIDEventDriver::printDescription(AppleUserHIDEventDriver *this)
{
  uint64_t v2 = (OSDictionary *)**((void **)this + 14);
  if (!v2) {
    return;
  }
  OSObjectPtr Value = OSDictionaryGetValue(v2, "Product");
  int v4 = (const OSString *)OSMetaClassBase::safeMetaCast(Value, gOSStringMetaClass);
  OSObjectPtr v5 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsagePage");
  __int16 v6 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v5, gOSNumberMetaClass);
  OSObjectPtr v7 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsage");
  __int16 v8 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v7, gOSNumberMetaClass);
  OSObjectPtr v9 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "VendorID");
  uint64_t v10 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v9, gOSNumberMetaClass);
  OSObjectPtr v11 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "ProductID");
  int v12 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v11, gOSNumberMetaClass);
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
    return;
  }
  *(void *)uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
  uint64_t v13 = *(void *)registryEntryID;
  if (v4)
  {
    CStringNoCopy = OSString::getCStringNoCopy(v4);
    if (v6) {
      goto LABEL_5;
    }
LABEL_12:
    uint32_t v15 = 0;
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  CStringNoCopy = "";
  if (!v6) {
    goto LABEL_12;
  }
LABEL_5:
  uint32_t v15 = OSNumber::unsigned32BitValue(v6);
  if (v8) {
LABEL_6:
  }
    LODWORD(v8) = OSNumber::unsigned32BitValue(v8);
LABEL_7:
  if (v10) {
    LODWORD(v10) = OSNumber::unsigned32BitValue(v10);
  }
  if (v12) {
    uint32_t v16 = OSNumber::unsigned32BitValue(v12);
  }
  else {
    uint32_t v16 = 0;
  }
  *(_DWORD *)uint64_t registryEntryID = 136448002;
  *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
  __int16 v18 = 1024;
  int v19 = 116;
  __int16 v20 = 2048;
  uint64_t v21 = v13;
  __int16 v22 = 2082;
  unsigned int v23 = CStringNoCopy;
  __int16 v24 = 1024;
  uint32_t v25 = v15;
  __int16 v26 = 1024;
  int v27 = (int)v8;
  __int16 v28 = 1024;
  int v29 = (int)v10;
  __int16 v30 = 1024;
  uint32_t v31 = v16;
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] %{public}s usagePage: %d usage: %d vid: %d pid: %d\n\n", registryEntryID, 0x3Eu);
}

uint64_t sub_100001B18(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t AppleUserHIDEventDriver::parseGameControllerElement(IOUserHIDEventDriver *this, IOHIDElement *a2)
{
  if (LOBYTE(this[1].meta->IOUserHIDEventService::IOHIDEventService::IOService::OSObject::meta)) {
    return IOUserHIDEventDriver::parseGameControllerElement(this, a2);
  }
  else {
    return 0;
  }
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::parseGameControllerElement(AppleUserHIDEventDriver *this, IOHIDElement *a2)
{
  if (*(unsigned char *)(*((void *)this + 4) + 16)) {
    return IOUserHIDEventDriver::parseGameControllerElement((IOUserHIDEventDriver *)((char *)this - 80), a2);
  }
  else {
    return 0;
  }
}

uint64_t AppleUserHIDEventDriver::parseLEDElement(AppleUserHIDEventDriver *this, IOHIDElement *a2)
{
  int v4 = &a2->IOHIDElementInterface;
  int v5 = ((uint64_t (*)(IOHIDElementInterface *))a2->getUsagePage)(&a2->IOHIDElementInterface);
  BOOL v6 = ((unsigned int (*)(IOHIDElementInterface *))v4->getUsage)(v4) < 0x10000 && v5 == 8;
  uint64_t v7 = v6;
  if (v6)
  {
    __int16 v8 = *(OSArray **)(*((void *)this + 14) + 8);
    if (v8
      || (*(void *)(*((void *)this + 14) + 8) = OSArray::withCapacity(4u),
          (__int16 v8 = *(OSArray **)(*((void *)this + 14) + 8)) != 0))
    {
      OSArray::setObject(v8, a2);
    }
  }
  return v7;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::parseLEDElement(AppleUserHIDEventDriver *this, IOHIDElement *a2)
{
  return AppleUserHIDEventDriver::parseLEDElement((AppleUserHIDEventDriver *)((char *)this - 80), a2);
}

uint64_t AppleUserHIDEventDriver::handleGameControllerReport(IOUserHIDEventDriver *this, unint64_t a2, unsigned int a3)
{
  return IOUserHIDEventDriver::handleGameControllerReport(this, a2, a3);
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::handleGameControllerReport(AppleUserHIDEventDriver *this, unint64_t a2, unsigned int a3)
{
  return IOUserHIDEventDriver::handleGameControllerReport((IOUserHIDEventDriver *)((char *)this - 80), a2, a3);
}

uint64_t AppleUserHIDEventDriver::postProcessElements(AppleUserHIDEventDriver *this, OSDictionary *a2)
{
  AppleUserHIDEventDriver::setLEDProperties(this, a2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v4 = *(void *)registryEntryID;
    uint64_t v5 = *(void *)(*((void *)this + 14) + 8);
    if (v5) {
      LODWORD(v5) = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 72))(v5);
    }
    *(_DWORD *)uint64_t registryEntryID = 136446978;
    *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
    __int16 v8 = 1024;
    int v9 = 211;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] parseElements: led: %d\n\n", registryEntryID, 0x22u);
  }
  return AppleUserHIDEventService::postProcessElements(this, a2);
}

OSDictionaryPtr AppleUserHIDEventDriver::setLEDProperties(AppleUserHIDEventDriver *this, OSDictionary *a2)
{
  OSDictionaryPtr result = OSDictionary::withCapacity(1u);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(*((void *)this + 14) + 8);
    if (v6)
    {
      uint32_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 72))(v6);
      OSArrayPtr v8 = OSArray::withCapacity(v7);
      if (v8)
      {
        int v9 = v8;
        int v10 = (*(uint64_t (**)(void))(**(void **)(*((void *)this + 14) + 8) + 72))(*(void *)(*((void *)this + 14) + 8));
        if (v10)
        {
          int v11 = v10;
          for (uint32_t i = 0; i != v11; ++i)
          {
            int v13 = *(uint64_t (***)(void))&OSArray::getObject(*(const OSArray **)(*((void *)this + 14) + 8), i)[1].refcount;
            unsigned int v14 = (*v13)();
            OSNumberPtr v15 = OSNumber::withNumber(v14, 0x20uLL);
            OSArray::setObject(v9, v15);
            if (v15) {
              ((void (*)(OSNumberPtr))v15->release)(v15);
            }
          }
        }
        OSDictionary::setObject(v5, "Elements", v9);
        OSDictionary::setObject(a2, "LED", v5);
        ((void (*)(OSArray *))v9->release)(v9);
      }
    }
    release = v5->release;
    return (OSDictionaryPtr)((uint64_t (*)(OSDictionary *))release)(v5);
  }
  return result;
}

uint64_t sub_100001FDC(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::postProcessElements(AppleUserHIDEventDriver *this, OSDictionary *a2)
{
  return AppleUserHIDEventDriver::postProcessElements((AppleUserHIDEventDriver *)((char *)this - 80), a2);
}

uint64_t AppleUserHIDEventDriver::deviceSupported(AppleUserHIDEventDriver *this)
{
  int v24 = 0;
  uint64_t v2 = (OSDictionary *)**((void **)this + 14);
  if (!v2) {
    return 0;
  }
  OSObjectPtr Value = OSDictionaryGetValue(v2, "VendorID");
  uint64_t v4 = (const OSNumber *)OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass);
  OSObjectPtr v5 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "ProductID");
  uint64_t v6 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v5, gOSNumberMetaClass);
  OSObjectPtr v7 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "Product");
  OSArrayPtr v8 = (const OSString *)OSMetaClassBase::safeMetaCast(v7, gOSStringMetaClass);
  if (v8 && OSString::isEqualTo(v8, "KernelOnlyTestHIDUserDevice"))
  {
    uint64_t v14 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    *(_DWORD *)uint64_t registryEntryID = 136446466;
    *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
    __int16 v26 = 1024;
    int v27 = 233;
    __int16 v22 = "[%{public}s:%d]Device has property to force kernel driver matching\n";
    uint32_t v23 = 18;
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v22, registryEntryID, v23);
    return 0;
  }
  if (v4) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_39;
  }
  if (OSNumber::unsigned32BitValue(v4) == 1452
    && (OSNumber::unsigned32BitValue(v6) == 33538 || OSNumber::unsigned32BitValue(v6) == 34304))
  {
    return 1;
  }
  if (OSNumber::unsigned32BitValue(v4) != 1452
    || (OSObjectPtr v10 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsagePage"),
        int v11 = OSMetaClassBase::safeMetaCast(v10, gOSNumberMetaClass),
        OSObjectPtr v12 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsage"),
        int v13 = OSMetaClassBase::safeMetaCast(v12, gOSNumberMetaClass),
        uint64_t v14 = 0,
        v11)
    && v13)
  {
LABEL_39:
    IOParseBootArgNumber("AppleUserHIDEventDriver-debug", &v24, 4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
      uint64_t v15 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136446722;
      *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v26 = 1024;
      int v27 = 262;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Target embedded OS\n\n", registryEntryID, 0x1Cu);
    }
    uint64_t v16 = *((void *)this + 14);
    if ((v24 & 8) != 0)
    {
      *(unsigned char *)(v16 + 16) = 1;
    }
    else
    {
      OSBooleanPtr v17 = (OSBooleanPtr)OSDictionaryGetValue(*(OSDictionaryPtr *)v16, "Authenticated");
      BOOL v18 = OSMetaClassBase::safeMetaCast(v17, gOSBooleanMetaClass) && v17 == kOSBooleanTrue;
      BOOL v19 = v18;
      *(unsigned char *)(*((void *)this + 14) + 16) = v19;
      if (v17) {
        ((void (*)(OSBooleanPtr))v17->release)(v17);
      }
    }
    if (((*(uint64_t (**)(AppleUserHIDEventDriver *, uint64_t, uint64_t))(*(void *)this + 112))(this, 1, 5) & 1) != 0|| (uint64_t v14 = 1, (*(unsigned int (**)(AppleUserHIDEventDriver *, uint64_t, uint64_t))(*(void *)this + 112))(this, 1, 4)))
    {
      if (*(unsigned char *)(*((void *)this + 14) + 16)) {
        return 1;
      }
      uint64_t v14 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v14;
      }
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
      uint64_t v21 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136446722;
      *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v26 = 1024;
      int v27 = 273;
      __int16 v28 = 2048;
      uint64_t v29 = v21;
      __int16 v22 = "[%{public}s:%d][0x%llx] Un-authenticated game controller device attached\n\n";
      uint32_t v23 = 28;
      goto LABEL_33;
    }
  }
  return v14;
}

uint64_t sub_1000024E8(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_10000251C(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t AppleUserHIDEventDriver::handleStart(AppleUserHIDEventDriver *this, IOService *a2)
{
  uint64_t result = AppleUserHIDEventDriver::deviceSupported(this);
  if (result)
  {
    return IOUserHIDEventService::handleStart((IOUserHIDEventService *)this, a2);
  }
  return result;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::handleStart(AppleUserHIDEventDriver *this, IOService *a2)
{
  uint64_t v3 = (IOUserHIDEventService *)((char *)this - 64);
  uint64_t result = AppleUserHIDEventDriver::deviceSupported((AppleUserHIDEventDriver *)((char *)this - 64));
  if (result)
  {
    return IOUserHIDEventService::handleStart(v3, a2);
  }
  return result;
}

uint64_t AppleUserHIDEventDriver::Start_Impl(OSDictionary ***this, IOService *a2)
{
  uint64_t v4 = 3758097084;
  int v12 = 0;
  IOParseBootArgNumber("AppleUserHIDEventDriver-debug", &v12, 4);
  if (v12) {
    return 3758097095;
  }
  IOService::CopyProperties(a2, this[14], 0);
  if (*this[14])
  {
    uint64_t v5 = IOService::Start((IOService *)this, a2, (OSDispatchMethod)&AppleUserHIDEventService::_Dispatch);
    if (v5)
    {
      uint64_t v4 = v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)uint64_t registryEntryID = 0;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
        uint64_t v8 = *(void *)registryEntryID;
        *(_DWORD *)uint64_t registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
        __int16 v14 = 1024;
        int v15 = 311;
        __int16 v16 = 2048;
        uint64_t v17 = v8;
        __int16 v18 = 1024;
        int v19 = v4;
        BOOL v9 = "[%{public}s:%d][0x%llx] Start: 0x%x\n\n";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, registryEntryID, 0x22u);
      }
    }
    else
    {
      uint64_t v4 = IOService::RegisterService((IOService *)this, 0);
      if (!v4)
      {
LABEL_5:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(void *)uint64_t registryEntryID = 0;
          IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
          uint64_t v6 = *(void *)registryEntryID;
          *(_DWORD *)uint64_t registryEntryID = 136446978;
          *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
          __int16 v14 = 1024;
          int v15 = 322;
          __int16 v16 = 2048;
          uint64_t v17 = v6;
          __int16 v18 = 1024;
          int v19 = v4;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Start ret: 0x%x\n\n", registryEntryID, 0x22u);
        }
        AppleUserHIDEventDriver::printDescription((AppleUserHIDEventDriver *)this);
        return v4;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)uint64_t registryEntryID = 0;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
        uint64_t v10 = *(void *)registryEntryID;
        *(_DWORD *)uint64_t registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
        __int16 v14 = 1024;
        int v15 = 314;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 1024;
        int v19 = v4;
        BOOL v9 = "[%{public}s:%d][0x%llx] RegisterService: 0x%x\n\n";
        goto LABEL_14;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
      uint64_t v11 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136446978;
      *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v14 = 1024;
      int v15 = 318;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Start failed: 0x%x\n\n", registryEntryID, 0x22u);
    }
    IOService::Stop((IOService *)this, a2, 0);
    goto LABEL_5;
  }
  return v4;
}

uint64_t sub_100002A9C(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_100002AD0(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_100002B04(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_100002B38(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t AppleUserHIDEventDriver::Stop_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Stop(this, a2, (OSDispatchMethod)&AppleUserHIDEventService::_Dispatch);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v4 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136446978;
    *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
    __int16 v7 = 1024;
    int v8 = 333;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Stop: 0x%x\n\n", registryEntryID, 0x22u);
  }
  return v3;
}

uint64_t sub_100002CC8(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t AppleUserHIDEventDriver::SetLEDState_Impl(IOService *this, int a2, int a3, uint64_t a4)
{
  uint64_t v5 = 3758097095;
  uint64_t v6 = *(void *)&this[2].meta->OSObject::OSObjectInterface::refcount;
  if (v6 && (*(unsigned int (**)(uint64_t))(*(void *)v6 + 72))(v6))
  {
    uint32_t v10 = 0;
    while (1)
    {
      p_refcount = (char *)&OSArray::getObject(*(const OSArray **)&this[2].meta->OSObject::OSObjectInterface::refcount, v10)[1].refcount;
      if ((*(unsigned int (**)(char *))(*(void *)p_refcount + 40))(p_refcount) == a2
        && (*(unsigned int (**)(char *))(*(void *)p_refcount + 48))(p_refcount) == a3)
      {
        break;
      }
      if (++v10 >= (*(unsigned int (**)(void))(**(void **)&this[2].meta->OSObject::OSObjectInterface::refcount
                                                           + 72))(*(void *)&this[2].meta->OSObject::OSObjectInterface::refcount))
        return v5;
    }
    (*(void (**)(char *, uint64_t))(*(void *)p_refcount + 144))(p_refcount, a4);
    uint64_t v5 = (*(uint64_t (**)(char *, uint64_t))(*(void *)p_refcount + 192))(p_refcount, 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v12 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136447490;
      *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v15 = 1024;
      int v16 = 351;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      __int16 v19 = 1024;
      int v20 = a3;
      __int16 v21 = 1024;
      int v22 = a4;
      __int16 v23 = 1024;
      int v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}s:%d][0x%llx] Set LED 0x%x: %d 0x%x\n\n", registryEntryID, 0x2Eu);
    }
  }
  return v5;
}

uint64_t sub_100002FBC(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t sub_100002FF0(void *a1)
{
  *a1 = off_100004438;
  return 0;
}

uint64_t AppleUserUSBHostHIDDeviceMetaClass::New(AppleUserUSBHostHIDDeviceMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100004478;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100004530;
  *(void *)&a2[1].refcount = &off_100004550;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100004580;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000045A8;
  return 0;
}

uint64_t AppleUserUSBHostHIDDevice::Dispatch(IOUserUSBHostHIDDevice *this, IORPC *a2)
{
  IORPC v3 = *a2;
  return AppleUserUSBHostHIDDevice::_Dispatch(this, &v3);
}

uint64_t AppleUserUSBHostHIDDevice::_Dispatch(IOUserUSBHostHIDDevice *a1, IORPC *a2)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v7 = *a2;
    return IOService::Stop_Invoke(&v7, a1, (IOService::Stop_Handler)AppleUserUSBHostHIDDevice::Stop_Impl);
  }
  else if (msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, a1, (IOService::Start_Handler)AppleUserUSBHostHIDDevice::Start_Impl);
  }
  else
  {
    IORPC v6 = *a2;
    return IOUserUSBHostHIDDevice::_Dispatch(a1, &v6);
  }
}

uint64_t AppleUserUSBHostHIDDeviceMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100003230(void *a1)
{
  *a1 = off_100004690;
  return 0;
}

uint64_t AppleUserHIDEventDriverMetaClass::New(AppleUserHIDEventDriverMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000046D0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_1000048A0;
  *(void *)&a2[1].refcount = &off_1000048C0;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100004908;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100004938;
  a2[2].meta = (OSMetaClass *)off_1000049D8;
  return 0;
}

uint64_t AppleUserHIDEventDriver::Dispatch(OSMetaClassBase *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return AppleUserHIDEventDriver::_Dispatch(this, (AppleUserHIDEventDriver *)&v4, a3);
}

uint64_t AppleUserHIDEventDriver::_Dispatch(OSMetaClassBase *this, AppleUserHIDEventDriver *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(*(IORPCMessageMach **)a2, 0)->msgid;
  switch(msgid)
  {
    case 0x98E715041C459FA5:
      *(_OWORD *)&v11.ivars = *(_OWORD *)a2;
      v11.IOHIDEventServiceInterface::__vftable = (IOHIDEventServiceInterface_vtbl *)*((void *)a2 + 2);
      return IOService::Stop_Invoke((const IORPC *)&v11.ivars, this, (IOService::Stop_Handler)AppleUserHIDEventDriver::Stop_Impl);
    case 0xA871AA31861269BALL:
      *(_OWORD *)&v11.IOService::OSObject::OSMetaClassBase::__vftable = *(_OWORD *)a2;
      v11.meta = (OSMetaClass *)*((void *)a2 + 2);
      return IOHIDEventService::SetLEDState_Invoke(&v11, (IORPC *)this, (OSMetaClassBase *)AppleUserHIDEventDriver::SetLEDState_Impl, v6);
    case 0xAB6F76DDE6D693F2:
      IORPC rpc = *(IORPC *)a2;
      return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)AppleUserHIDEventDriver::Start_Impl);
    default:
      long long v9 = *(_OWORD *)a2;
      uint64_t v10 = *((void *)a2 + 2);
      return AppleUserHIDEventService::_Dispatch((AppleUserHIDEventService *)this, (AppleUserHIDEventService *)&v9, v5);
  }
}

uint64_t AppleUserHIDEventDriverMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

void sub_1000034DC()
{
}

void IOFree(void *address, size_t length)
{
}

uint64_t IOMallocZeroTyped()
{
  return _IOMallocZeroTyped();
}

BOOL IOParseBootArgNumber(const char *arg_string, void *arg_ptr, int max_len)
{
  return _IOParseBootArgNumber(arg_string, arg_ptr, max_len);
}

BOOL IOParseBootArgString(const char *arg_string, char *arg_ptr, int strlen)
{
  return _IOParseBootArgString(arg_string, arg_ptr, strlen);
}

IORPCMessage *__cdecl IORPCMessageFromMach(IORPCMessageMach *msg, BOOL reply)
{
  return _IORPCMessageFromMach(msg, reply);
}

uint64_t OSDictionaryGetUInt64Value(OSDictionaryPtr obj, const char *key)
{
  return _OSDictionaryGetUInt64Value(obj, key);
}

OSObjectPtr OSDictionaryGetValue(OSDictionaryPtr obj, const char *key)
{
  return _OSDictionaryGetValue(obj, key);
}

OSDictionaryPtr OSDictionary::withCapacity(uint32_t capacity)
{
  return OSDictionary::withCapacity(capacity);
}

BOOL OSDictionary::setObject(OSDictionary *this, const char *aKey, const OSMetaClassBase *anObject)
{
  return OSDictionary::setObject(this, aKey, anObject);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

kern_return_t OSMetaClassBase::Dispatch(OSMetaClassBase *this, IORPC *invoke)
{
  return OSMetaClassBase::Dispatch(this, invoke);
}

uint64_t IOHIDEventService::SetLEDState_Invoke(IOHIDEventService *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, unsigned int, unsigned int, BOOL))
{
  return IOHIDEventService::SetLEDState_Invoke(this, a2, a3, a4);
}

BOOL IOUserHIDEventService::handleStart(IOUserHIDEventService *this, IOService *provider)
{
  return IOUserHIDEventService::handleStart(this, provider);
}

BOOL IOUserUSBHostHIDDevice::init(IOUserUSBHostHIDDevice *this)
{
  return IOUserUSBHostHIDDevice::init(this);
}

kern_return_t IOUserUSBHostHIDDevice::_Dispatch(IOUserUSBHostHIDDevice *self, const IORPC *rpc)
{
  return IOUserUSBHostHIDDevice::_Dispatch(self, rpc);
}

uint64_t AppleUserHIDEventService::postProcessElements(AppleUserHIDEventService *this, OSDictionary *a2)
{
  return AppleUserHIDEventService::postProcessElements(this, a2);
}

uint64_t AppleUserHIDEventService::init(AppleUserHIDEventService *this)
{
  return AppleUserHIDEventService::init(this);
}

uint64_t AppleUserHIDEventService::_Dispatch(AppleUserHIDEventService *this, AppleUserHIDEventService *a2, IORPC *a3)
{
  return AppleUserHIDEventService::_Dispatch(this, a2, a3);
}

OSArrayPtr OSArray::withCapacity(uint32_t capacity)
{
  return OSArray::withCapacity(capacity);
}

BOOL OSArray::setObject(OSArray *this, const OSMetaClassBase *anObject)
{
  return OSArray::setObject(this, anObject);
}

OSNumberPtr OSNumber::withNumber(uint64_t value, size_t numberOfBits)
{
  return OSNumber::withNumber(value, numberOfBits);
}

kern_return_t IOService::Stop_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Stop_Handler func)
{
  return IOService::Stop_Invoke(rpc, target, func);
}

kern_return_t IOService::Start_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Start_Handler func)
{
  return IOService::Start_Invoke(rpc, target, func);
}

kern_return_t IOService::CopyProperties(IOService *this, OSDictionary **properties, OSDispatchMethod supermethod)
{
  return IOService::CopyProperties(this, properties, supermethod);
}

kern_return_t IOService::RegisterService(IOService *this, OSDispatchMethod supermethod)
{
  return IOService::RegisterService(this, supermethod);
}

kern_return_t IOService::GetRegistryEntryID(IOService *this, uint64_t *registryEntryID, OSDispatchMethod supermethod)
{
  return IOService::GetRegistryEntryID(this, registryEntryID, supermethod);
}

kern_return_t IOService::Stop(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Stop(this, provider, supermethod);
}

kern_return_t IOService::Start(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Start(this, provider, supermethod);
}

OSObject *__cdecl OSArray::getObject(const OSArray *this, uint32_t index)
{
  return OSArray::getObject(this, index);
}

uint32_t OSNumber::unsigned32BitValue(const OSNumber *this)
{
  return OSNumber::unsigned32BitValue(this);
}

const char *__cdecl OSString::getCStringNoCopy(const OSString *this)
{
  return OSString::getCStringNoCopy(this);
}

BOOL OSString::isEqualTo(const OSString *this, const char *cString)
{
  return OSString::isEqualTo(this, cString);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}