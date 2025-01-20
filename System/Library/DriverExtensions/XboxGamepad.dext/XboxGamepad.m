BOOL XboxUSBDevice::init(IOService *this)
{
  BOOL v2;

  v2 = IOService::init(this);
  if (v2)
  {
    if (!this->ivars) {
      XboxUSBDevice::init();
    }
    this[1].OSObject::OSMetaClassBase::__vftable = (IOService_vtbl *)IOMallocZeroTyped();
  }
  return v2;
}

BOOL non-virtual thunk to'XboxUSBDevice::init(XboxUSBDevice *this)
{
  return XboxUSBDevice::init((IOService *)((char *)this - 24));
}

void XboxUSBDevice::free(IOService *this)
{
  this[1].getMetaClass = 0;
  v2 = this[1].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 8uLL);
    this[1].OSObject::OSMetaClassBase::__vftable = 0;
  }
  IOService::free(this);
}

void non-virtual thunk to'XboxUSBDevice::free(XboxUSBDevice *this)
{
}

uint64_t XboxUSBDevice::Start_Impl(XboxUSBDevice *this, IOService *anObject)
{
  kern_return_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const IOUSBDeviceDescriptor *v9;
  uint32_t v10;
  OSArrayPtr v11;
  OSArray *v12;
  XboxUSBDevice *v13;
  unsigned __int8 v14;
  uint64_t v15;
  const IOUSBConfigurationDescriptor *v16;
  OSDictionary *v17;
  OSDictionary *v18;
  OSDictionary *v19;
  OSDictionary *v20;
  OSObjectPtr Value;
  const OSNumber *v22;
  int v23;
  uint64_t v24;
  const IOUSBConfigurationDescriptor *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v29;
  uint64_t v30;
  const char *ClassName;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint32_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  unsigned int v46;
  OSDictionary *properties;
  unsigned char registryEntryID[12];
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;

  v3 = this;
  properties = 0;
  **((void **)this + 6) = OSMetaClassBase::safeMetaCast(anObject, gIOUSBHostDeviceMetaClass);
  if (!**((void **)v3 + 6))
  {
    v27 = 3758097084;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v27;
    }
    ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)v3);
    *(void *)registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)v3, (uint64_t *)registryEntryID, 0);
    v32 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    v49 = 2048;
    v50 = v32;
    v33 = "[%s 0x%llx] Provider is not an 'IOUSBHostDevice'.\n";
LABEL_40:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v33, registryEntryID, 0x16u);
    return v27;
  }
  uint64_t v4 = IOService::Start((IOService *)v3, anObject, (OSDispatchMethod)&IOService::_Dispatch);
  if (v4) {
    return v4;
  }
  v5 = IOService::CopyProperties((IOService *)v3, &properties, (OSDispatchMethod)&IOService::_Dispatch);
  if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = OSMetaClassBase::GetClassName((OSMetaClassBase *)v3);
    *(void *)registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)v3, (uint64_t *)registryEntryID, 0);
    v7 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v6;
    v49 = 2048;
    v50 = v7;
    v51 = 1024;
    v52 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] #NOTE CopyProperties() failed: %{mach.errno}d\n", registryEntryID, 0x1Cu);
  }
  v8 = (*(uint64_t (**)(void))(***((void ***)v3 + 6) + 64))(**((void **)v3 + 6));
  if (!v8)
  {
    v27 = 3758097086;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v27;
    }
    v34 = OSMetaClassBase::GetClassName((OSMetaClassBase *)v3);
    *(void *)registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)v3, (uint64_t *)registryEntryID, 0);
    v35 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v34;
    v49 = 2048;
    v50 = v35;
    v33 = "[%s 0x%llx] Failed to obtain the device descriptor. CopyDeviceDescriptor() returned NULL.\n";
    goto LABEL_40;
  }
  v9 = (const IOUSBDeviceDescriptor *)v8;
  v10 = *(unsigned __int8 *)(v8 + 17);
  if (v10)
  {
    v11 = OSArray::withCapacity(v10);
    if (v11)
    {
      v12 = v11;
      v13 = v3;
      v46 = v5;
      if (v9->bNumConfigurations)
      {
        v14 = 0;
        while (1)
        {
          v15 = (*(uint64_t (**)(void, void))(***((void ***)v13 + 6) + 72))(**((void **)v13 + 6), v14);
          if (!v15) {
            break;
          }
          v16 = (const IOUSBConfigurationDescriptor *)v15;
          v17 = OSDictionaryCreate();
          if (v17)
          {
            v18 = v17;
            OSDictionarySetUInt64Value(v17, "bLength", v16->bLength);
            OSDictionarySetUInt64Value(v18, "bDescriptorType", v16->bDescriptorType);
            OSDictionarySetUInt64Value(v18, "wTotalLength", v16->wTotalLength);
            OSDictionarySetUInt64Value(v18, "bNumInterfaces", v16->bNumInterfaces);
            OSDictionarySetUInt64Value(v18, "bConfigurationValue", v16->bConfigurationValue);
            OSDictionarySetUInt64Value(v18, "iConfiguration", v16->iConfiguration);
            OSDictionarySetUInt64Value(v18, "bmAttributes", v16->bmAttributes);
            OSDictionarySetUInt64Value(v18, "MaxPower", v16->MaxPower);
            OSArray::setObject(v12, v18);
            ((void (*)(OSDictionary *))v18->release)(v18);
          }
          IOUSBHostFreeDescriptor(v16);
          if (v9->bNumConfigurations <= ++v14) {
            goto LABEL_15;
          }
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v29 = OSMetaClassBase::GetClassName((OSMetaClassBase *)v13);
          *(void *)registryEntryID = 0;
          IOService::GetRegistryEntryID((IOService *)v13, (uint64_t *)registryEntryID, 0);
          v30 = *(void *)registryEntryID;
          *(_DWORD *)registryEntryID = 136315650;
          *(void *)&registryEntryID[4] = v29;
          v49 = 2048;
          v50 = v30;
          v51 = 1024;
          v52 = v14;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] #NOTE CopyConfigurationDescriptor(%d) returned NULL.\n", registryEntryID, 0x1Cu);
        }
        v27 = v46;
        goto LABEL_30;
      }
LABEL_15:
      v19 = OSDictionaryCreate();
      v3 = v13;
      if (v19)
      {
        v20 = v19;
        OSDictionarySetValue(v19, "Configurations", v12);
        IOService::SetProperties((IOService *)v13, v20, 0);
        ((void (*)(OSDictionary *))v20->release)(v20);
      }
      ((void (*)(OSArray *))v12->release)(v12);
    }
    if (properties
      && (Value = OSDictionaryGetValue(properties, "kUSBPreferredConfiguration"),
          (v22 = (const OSNumber *)OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass)) != 0))
    {
      v23 = OSNumber::unsigned8BitValue(v22);
    }
    else
    {
      v23 = 0;
    }
    v24 = IOUSBHostDevice::Open(**((IOUSBHostDevice ***)v3 + 6), (IOService *)v3, 0, 0, 0);
    if (v24)
    {
      v27 = v24;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v39 = OSMetaClassBase::GetClassName((OSMetaClassBase *)v3);
        *(void *)registryEntryID = 0;
        IOService::GetRegistryEntryID((IOService *)v3, (uint64_t *)registryEntryID, 0);
        v40 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v39;
        v49 = 2048;
        v50 = v40;
        v51 = 1024;
        v52 = v27;
        v38 = "[%s 0x%llx] Could not open provider. Open failed: %{mach.errno}d\n";
        v41 = 28;
LABEL_50:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v38, registryEntryID, v41);
      }
    }
    else
    {
      if (v23)
      {
        v25 = 0;
        goto LABEL_27;
      }
      v26 = (*(uint64_t (**)(void, void))(***((void ***)v3 + 6) + 72))(**((void **)v3 + 6), 0);
      if (v26)
      {
        v25 = (const IOUSBConfigurationDescriptor *)v26;
        v23 = *(unsigned __int8 *)(v26 + 5);
LABEL_27:
        v27 = IOUSBHostDevice::SetConfiguration(**((IOUSBHostDevice ***)v3 + 6), v23, 1, 0);
        if (v27 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v42 = OSMetaClassBase::GetClassName((OSMetaClassBase *)v3);
          *(void *)registryEntryID = 0;
          IOService::GetRegistryEntryID((IOService *)v3, (uint64_t *)registryEntryID, 0);
          v43 = *(void *)registryEntryID;
          *(_DWORD *)registryEntryID = 136315906;
          *(void *)&registryEntryID[4] = v42;
          v49 = 2048;
          v50 = v43;
          v51 = 1024;
          v52 = v23;
          v53 = 1024;
          v54 = v27;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Could not apply configuration. SetConfiguration(%d) failed: %{mach.errno}d\n", registryEntryID, 0x22u);
        }
        if (v25) {
          IOUSBHostFreeDescriptor(v25);
        }
        goto LABEL_30;
      }
      v27 = 3758097086;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v44 = OSMetaClassBase::GetClassName((OSMetaClassBase *)v3);
        *(void *)registryEntryID = 0;
        IOService::GetRegistryEntryID((IOService *)v3, (uint64_t *)registryEntryID, 0);
        v45 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315394;
        *(void *)&registryEntryID[4] = v44;
        v49 = 2048;
        v50 = v45;
        v38 = "[%s 0x%llx] CopyConfigurationDescriptor(0) returned NULL.\n";
        goto LABEL_49;
      }
    }
  }
  else
  {
    v27 = 3758097129;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = OSMetaClassBase::GetClassName((OSMetaClassBase *)v3);
      *(void *)registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)v3, (uint64_t *)registryEntryID, 0);
      v37 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v36;
      v49 = 2048;
      v50 = v37;
      v38 = "[%s 0x%llx] Device descriptor has no configurations.\n";
LABEL_49:
      v41 = 22;
      goto LABEL_50;
    }
  }
LABEL_30:
  IOUSBHostFreeDescriptor(v9);
  return v27;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke_3(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke_5(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke_7(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke_9(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke_21(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke_23(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice10Start_ImplEP9IOService_block_invoke_25(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t XboxUSBDevice::Stop_Impl(IOService *this, IOService *a2)
{
  kern_return_t v7;
  const char *v8;
  uint64_t v9;
  unsigned char registryEntryID[12];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  kern_return_t v15;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    v12 = 2048;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Stop\n", registryEntryID, 0x16u);
  }
  getMetaClass = (IOUSBHostDevice *)this[1].getMetaClass;
  if (getMetaClass)
  {
    v7 = IOUSBHostDevice::Close(getMetaClass, this, 0, 0);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      v9 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v8;
      v12 = 2048;
      v13 = v9;
      v14 = 1024;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Close provider interface: %{mach.errno}d\n", registryEntryID, 0x1Cu);
    }
  }
  return IOService::Stop(this, a2, (OSDispatchMethod)&IOService::_Dispatch);
}

uint64_t ___ZN13XboxUSBDevice9Stop_ImplEP9IOService_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxUSBDevice9Stop_ImplEP9IOService_block_invoke_28(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

BOOL XboxHIDDevice::init(IOService *this)
{
  BOOL v2 = IOService::init(this);
  if (v2)
  {
    if (!this->ivars) {
      XboxHIDDevice::init();
    }
    this[1].ivars = (IOService_IVars *)IOMallocZeroTyped();
  }
  return v2;
}

BOOL non-virtual thunk to'XboxHIDDevice::init(XboxHIDDevice *this)
{
  return XboxHIDDevice::init((IOService *)((char *)this - 24));
}

void XboxHIDDevice::free(IOService *this)
{
  ivars = this[1].ivars;
  uint64_t v3 = *((void *)ivars + 19);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
    *((void *)this[1].ivars + 19) = 0;
    ivars = this[1].ivars;
  }
  uint64_t v4 = *((void *)ivars + 20);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
    *((void *)this[1].ivars + 20) = 0;
    ivars = this[1].ivars;
  }
  uint64_t v5 = *((void *)ivars + 18);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
    *((void *)this[1].ivars + 18) = 0;
    ivars = this[1].ivars;
  }
  uint64_t v6 = *((void *)ivars + 17);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
    *((void *)this[1].ivars + 17) = 0;
    ivars = this[1].ivars;
  }
  uint64_t v7 = *((void *)ivars + 16);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
    *((void *)this[1].ivars + 16) = 0;
    ivars = this[1].ivars;
  }
  uint64_t v8 = *((void *)ivars + 14);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
    *((void *)this[1].ivars + 14) = 0;
    ivars = this[1].ivars;
  }
  *((void *)ivars + 13) = 0;
  v9 = this[1].ivars;
  uint64_t v10 = *((void *)v9 + 12);
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
    *((void *)this[1].ivars + 12) = 0;
    v9 = this[1].ivars;
  }
  uint64_t v11 = *((void *)v9 + 6);
  if (v11)
  {
    (*(void (**)(uint64_t))(*(void *)v11 + 16))(v11);
    *((void *)this[1].ivars + 6) = 0;
    v9 = this[1].ivars;
  }
  *((void *)v9 + 5) = 0;
  v12 = this[1].ivars;
  v13 = (const IOUSBDeviceDescriptor *)*((void *)v12 + 2);
  if (v13)
  {
    IOUSBHostFreeDescriptor(v13);
    *((void *)this[1].ivars + 2) = 0;
    v12 = this[1].ivars;
  }
  *((void *)v12 + 3) = 0;
  v14 = this[1].ivars;
  if (*((void *)v14 + 2))
  {
    IOUSBHostFreeDescriptor(*((const IOUSBDeviceDescriptor **)v14 + 2));
    *((void *)this[1].ivars + 2) = 0;
    v14 = this[1].ivars;
  }
  if (*(void *)v14)
  {
    (*(void (**)(void))(**(void **)v14 + 16))(*(void *)v14);
    *(void *)this[1].ivars = 0;
    v14 = this[1].ivars;
  }
  uint64_t v15 = *((void *)v14 + 1);
  if (!v15
    || ((*(void (**)(void))(*(void *)v15 + 16))(*((void *)v14 + 1)),
        *((void *)this[1].ivars + 1) = 0,
        (v14 = this[1].ivars) != 0))
  {
    IOFree(v14, 0xB0uLL);
    this[1].ivars = 0;
  }
  IOService::free(this);
}

void non-virtual thunk to'XboxHIDDevice::free(XboxHIDDevice *this)
{
}

uint64_t XboxHIDDevice::Start_Impl(XboxHIDDevice *this, IOService *a2)
{
  properties = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v103 = _NSConcreteStackBlock;
    uint64_t v104 = 0x40000000;
    v105 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke;
    v106 = &__block_descriptor_tmp_0;
    v107 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v110 = 2048;
    uint64_t v111 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Start\n", registryEntryID, 0x16u);
  }
  uint64_t v6 = OSObject::CopyDispatchQueue((OSObject *)this, "Default", (IODispatchQueue **)(*((void *)this + 11) + 144), 0);
  if (v6)
  {
    uint64_t v37 = v6;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v39 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v98 = _NSConcreteStackBlock;
    uint64_t v99 = 0x40000000;
    v100 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_4;
    v101 = &__block_descriptor_tmp_5;
    v102 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v40 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v39;
    __int16 v110 = 2048;
    uint64_t v111 = v40;
    __int16 v112 = 1024;
    int v113 = v37;
    v41 = "[%s 0x%llx] Failed to obtain 'Default' queue. CopyDispatchQueue() returned %{mach.errno}x\n";
LABEL_60:
    uint32_t v62 = 28;
LABEL_66:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v41, registryEntryID, v62);
    goto LABEL_33;
  }
  *(void *)(*((void *)this + 11) + 8) = OSMetaClassBase::safeMetaCast(a2, gIOUSBHostInterfaceMetaClass);
  uint64_t v7 = *(void *)(*((void *)this + 11) + 8);
  if (!v7)
  {
    uint64_t v37 = 3758097084;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v42 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v93 = _NSConcreteStackBlock;
    uint64_t v94 = 0x40000000;
    v95 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_6;
    v96 = &__block_descriptor_tmp_7;
    v97 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v43 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v42;
    __int16 v110 = 2048;
    uint64_t v111 = v43;
    v41 = "[%s 0x%llx] Provider is not a 'IOUSBHostInterface'.\n";
LABEL_65:
    uint32_t v62 = 22;
    goto LABEL_66;
  }
  (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  uint64_t v8 = IOUSBHostInterface::CopyDevice(*(IOUSBHostInterface **)(*((void *)this + 11) + 8), *((IOUSBHostDevice ***)this + 11), 0);
  if (v8)
  {
    uint64_t v37 = v8;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v44 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v88 = _NSConcreteStackBlock;
    uint64_t v89 = 0x40000000;
    v90 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_8;
    v91 = &__block_descriptor_tmp_9;
    v92 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v45 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v44;
    __int16 v110 = 2048;
    uint64_t v111 = v45;
    __int16 v112 = 1024;
    int v113 = v37;
    v41 = "[%s 0x%llx] Failed to obtain USBHostDevice.  CopyDevice() returned %x\n";
    goto LABEL_60;
  }
  *(void *)(*((void *)this + 11) + 16) = (*(uint64_t (**)(void))(***((void ***)this + 11) + 64))(**((void **)this + 11));
  uint64_t v9 = *((void *)this + 11);
  if (!*(void *)(v9 + 16))
  {
    uint64_t v37 = 3758097086;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v46 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v83 = _NSConcreteStackBlock;
    uint64_t v84 = 0x40000000;
    v85 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_10;
    v86 = &__block_descriptor_tmp_11;
    v87 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v47 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v46;
    __int16 v110 = 2048;
    uint64_t v111 = v47;
    v41 = "[%s 0x%llx] Failed to obtain USB device descriptor.\n";
    goto LABEL_65;
  }
  *(void *)(*((void *)this + 11) + 24) = (*(uint64_t (**)(void))(**(void **)(v9 + 8) + 56))(*(void *)(v9 + 8));
  uint64_t v10 = *((void *)this + 11);
  if (!*(void *)(v10 + 24))
  {
    uint64_t v37 = 3758097086;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v48 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v78 = _NSConcreteStackBlock;
    uint64_t v79 = 0x40000000;
    v80 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_12;
    v81 = &__block_descriptor_tmp_13;
    v82 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v49 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v48;
    __int16 v110 = 2048;
    uint64_t v111 = v49;
    v41 = "[%s 0x%llx] Failed to obtain the current USB configuration descriptor.\n";
    goto LABEL_65;
  }
  *(void *)(*((void *)this + 11) + 32) = (*(uint64_t (**)(void))(**(void **)(v10 + 8) + 64))(*(void *)(v10 + 8));
  if (!*(void *)(*((void *)this + 11) + 32))
  {
    uint64_t v37 = 3758097086;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v50 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v73 = _NSConcreteStackBlock;
    uint64_t v74 = 0x40000000;
    v75 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_14;
    v76 = &__block_descriptor_tmp_15;
    v77 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v51 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v50;
    __int16 v110 = 2048;
    uint64_t v111 = v51;
    v41 = "[%s 0x%llx] Failed to obtain the USB interface descriptor.\n";
    goto LABEL_65;
  }
  uint64_t v11 = IOService::Start((IOService *)this, a2, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if (v11)
  {
    uint64_t v37 = v11;
    goto LABEL_33;
  }
  uint64_t v12 = IOService::CopyProperties((IOService *)this, &properties, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if (v12)
  {
    uint64_t v37 = v12;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v52 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    v68 = _NSConcreteStackBlock;
    uint64_t v69 = 0x40000000;
    v70 = ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_16;
    v71 = &__block_descriptor_tmp_17;
    v72 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v53 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v52;
    __int16 v110 = 2048;
    uint64_t v111 = v53;
    __int16 v112 = 1024;
    int v113 = v37;
    v41 = "[%s 0x%llx] Failed to obtain HIDDevice properties. CopyProperties() returned %{mach.errno}x\n";
    goto LABEL_60;
  }
  uint8_t speed = 0;
  uint64_t v13 = IOUSBHostPipe::GetSpeed(*(const IOUSBHostPipe **)(*((void *)this + 11) + 48), &speed, 0);
  if (v13)
  {
    uint64_t v37 = v13;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v54 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v55 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v54;
    __int16 v110 = 2048;
    uint64_t v111 = v55;
    __int16 v112 = 1024;
    int v113 = v37;
    v41 = "[%s 0x%llx] Failed to get inPipe speed. GetSpeed() returned %{mach.errno}x\n";
    goto LABEL_60;
  }
  *(_DWORD *)(*((void *)this + 11) + 80) = IOUSBGetEndpointIntervalMicroframes(speed, *(const IOUSBEndpointDescriptor **)(*((void *)this + 11) + 40));
  *(_DWORD *)(*((void *)this + 11) + 84) = 125 * *(_DWORD *)(*((void *)this + 11) + 80);
  *(_DWORD *)(*((void *)this + 11) + 56) = IOUSBGetEndpointMaxPacketSize(speed, *(const IOUSBEndpointDescriptor **)(*((void *)this + 11) + 40));
  v14 = (const OSNumber *)(*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 120))(this);
  if (v14
    && (uint64_t v15 = v14,
        uint64_t v16 = OSNumber::unsigned64BitValue(v14),
        ((void (*)(const OSNumber *))v15->release)(v15),
        v16))
  {
    uint64_t v17 = *((void *)this + 11);
    unint64_t v18 = *(unsigned int *)(v17 + 56);
  }
  else
  {
    uint64_t v17 = *((void *)this + 11);
    unint64_t v18 = *(unsigned int *)(v17 + 56);
    if (!v18)
    {
      uint64_t v37 = 3758097084;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v65 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
        *(void *)uint64_t registryEntryID = 0;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
        uint64_t v66 = *(void *)registryEntryID;
        *(_DWORD *)uint64_t registryEntryID = 136315394;
        *(void *)&registryEntryID[4] = v65;
        __int16 v110 = 2048;
        uint64_t v111 = v66;
        v41 = "[%s 0x%llx] Invalid inboundMaxTransferSize.\n";
        goto LABEL_65;
      }
      goto LABEL_33;
    }
    uint64_t v16 = *(unsigned int *)(v17 + 56);
  }
  *(void *)(v17 + 72) = (v16 + (v18 - 1)) / v18 * v18;
  if ((*(_DWORD *)(*((void *)this + 11) + 80) - 1) > 6) {
    uint32_t v19 = 1;
  }
  else {
    uint32_t v19 = 8u / *(_DWORD *)(*((void *)this + 11) + 80);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v20 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v21 = *(void *)registryEntryID;
    uint64_t v22 = *((void *)this + 11);
    BOOL v23 = *(void *)(v22 + 48) != 0;
    int v24 = *(_DWORD *)(v22 + 56);
    uint64_t v25 = *(void *)(v22 + 72);
    int v26 = *(_DWORD *)(v22 + 80);
    LODWORD(v22) = *(_DWORD *)(v22 + 84);
    *(_DWORD *)uint64_t registryEntryID = 136317186;
    *(void *)&registryEntryID[4] = v20;
    __int16 v110 = 2048;
    uint64_t v111 = v21;
    __int16 v112 = 1024;
    int v113 = v23;
    __int16 v114 = 1024;
    int v115 = v16;
    __int16 v116 = 1024;
    int v117 = v24;
    __int16 v118 = 1024;
    int v119 = v25;
    __int16 v120 = 1024;
    int v121 = v26;
    __int16 v122 = 1024;
    int v123 = v22;
    __int16 v124 = 1024;
    uint32_t v125 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] inPipe:%d inboundMaxTransferSize:%d inMaxPacketSize:%d inBufferSize:%d endpointIntervalMicroframes:%d(%d us) numInBuffs:%d\n", registryEntryID, 0x40u);
  }
  *(void *)(*((void *)this + 11) + 96) = OSArray::withCapacity(v19);
  if (!*(void *)(*((void *)this + 11) + 96))
  {
    uint64_t v37 = 3758097085;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v56 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v57 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v56;
    __int16 v110 = 2048;
    uint64_t v111 = v57;
    v41 = "[%s 0x%llx] inputRequestActions\n";
    goto LABEL_65;
  }
  uint64_t v27 = (*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 136))(this);
  if (v27)
  {
    uint64_t v37 = v27;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v58 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v59 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v58;
    __int16 v110 = 2048;
    uint64_t v111 = v59;
    __int16 v112 = 1024;
    int v113 = v37;
    v41 = "[%s 0x%llx] setupAsyncReceive:%{mach.errno}x\n";
    goto LABEL_60;
  }
  uint8_t speed = 0;
  uint64_t v28 = IOUSBHostPipe::GetSpeed(*(const IOUSBHostPipe **)(*((void *)this + 11) + 112), &speed, 0);
  if (v28)
  {
    uint64_t v37 = v28;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v60 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v61 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v60;
    __int16 v110 = 2048;
    uint64_t v111 = v61;
    __int16 v112 = 1024;
    int v113 = v37;
    v41 = "[%s 0x%llx] Failed to get outPipe speed. GetSpeed() returned %{mach.errno}x\n";
    goto LABEL_60;
  }
  *(_DWORD *)(*((void *)this + 11) + 120) = IOUSBGetEndpointMaxPacketSize(speed, *(const IOUSBEndpointDescriptor **)(*((void *)this + 11) + 104));
  v29 = (const OSNumber *)(*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 128))(this);
  if (v29
    && (v30 = v29,
        uint64_t v31 = OSNumber::unsigned64BitValue(v29),
        ((void (*)(const OSNumber *))v30->release)(v30),
        v31))
  {
    uint64_t v32 = *((void *)this + 11);
  }
  else
  {
    uint64_t v32 = *((void *)this + 11);
    LODWORD(v31) = *(_DWORD *)(v32 + 120);
  }
  *(_DWORD *)(v32 + 124) = v31;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v33 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v34 = *(void *)registryEntryID;
    uint64_t v35 = *((void *)this + 11);
    BOOL v36 = *(void *)(v35 + 112) != 0;
    LODWORD(v35) = *(_DWORD *)(v35 + 120);
    *(_DWORD *)uint64_t registryEntryID = 136316162;
    *(void *)&registryEntryID[4] = v33;
    __int16 v110 = 2048;
    uint64_t v111 = v34;
    __int16 v112 = 1024;
    int v113 = v36;
    __int16 v114 = 1024;
    int v115 = v31;
    __int16 v116 = 1024;
    int v117 = v35;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] outPipe:%d outboundMaxTransferSize:%d outMaxPacketSize:%d\n", registryEntryID, 0x28u);
  }
  *(void *)(*((void *)this + 11) + 128) = OSArray::withCapacity(2u);
  if (*(void *)(*((void *)this + 11) + 128))
  {
    uint64_t v37 = (*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 144))(this);
    if (!v37) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v37 = 3758097086;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v63 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v64 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v63;
    __int16 v110 = 2048;
    uint64_t v111 = v64;
    v41 = "[%s 0x%llx] outputReportActions\n";
    goto LABEL_65;
  }
LABEL_33:
  IOService::Stop((IOService *)this, a2, 0);
LABEL_34:
  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v37;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_4(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_6(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_8(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_10(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_12(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_14(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_16(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_18(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_20(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_22(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_24(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_26(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_28(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_30(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice10Start_ImplEP9IOService_block_invoke_32(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t XboxHIDDevice::Stop_Impl(IOService *this, IOService *a2)
{
  kern_return_t v7;
  const char *v8;
  uint64_t v9;
  IOService_IVars *ivars;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  IOService_IVars *v18;
  IODispatchSource *v19;
  uint64_t v20;
  void v22[2];
  uint64_t (*v23)(uint64_t, const OSArray *);
  void *v24;
  void *v25;
  void handler[17];
  unsigned char registryEntryID[24];
  kern_return_t v28;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    handler[12] = _NSConcreteStackBlock;
    handler[13] = 0x40000000;
    handler[14] = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke;
    handler[15] = &__block_descriptor_tmp_34;
    handler[16] = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    *(_WORD *)&unsigned char registryEntryID[12] = 2048;
    *(void *)&registryEntryID[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Stop\n", registryEntryID, 0x16u);
  }
  *((unsigned char *)this[1].ivars + 168) = 1;
  uint64_t v6 = (IOUSBHostInterface *)*((void *)this[1].ivars + 1);
  if (v6)
  {
    uint64_t v7 = IOUSBHostInterface::Close(v6, this, 0, 0);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = OSMetaClassBase::GetClassName(this);
      handler[7] = _NSConcreteStackBlock;
      handler[8] = 0x40000000;
      handler[9] = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_35;
      handler[10] = &__block_descriptor_tmp_36;
      handler[11] = this;
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v9 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v8;
      *(_WORD *)&unsigned char registryEntryID[12] = 2048;
      *(void *)&registryEntryID[14] = v9;
      *(_WORD *)&registryEntryID[22] = 1024;
      uint64_t v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Close interface: 0x%x\n", registryEntryID, 0x1Cu);
    }
  }
  *(void *)uint64_t registryEntryID = 0;
  *(void *)&registryEntryID[8] = registryEntryID;
  *(void *)&registryEntryID[16] = 0x2000000000;
  uint64_t v28 = 0;
  ivars = this[1].ivars;
  uint64_t v11 = *((void *)ivars + 16);
  if (v11)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 72))(v11);
    atomic_fetch_add((atomic_uint *volatile)(*(void *)&registryEntryID[8] + 24), v12);
    ivars = this[1].ivars;
  }
  uint64_t v13 = *((void *)ivars + 12);
  if (v13)
  {
    v14 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 72))(v13);
    atomic_fetch_add((atomic_uint *volatile)(*(void *)&registryEntryID[8] + 24), v14);
    ivars = this[1].ivars;
  }
  uint64_t v15 = *((void *)ivars + 19);
  uint64_t v16 = *(void *)&registryEntryID[8];
  if (v15)
  {
    atomic_fetch_add((atomic_uint *volatile)(*(void *)&registryEntryID[8] + 24), 1u);
    uint64_t v16 = *(void *)&registryEntryID[8];
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 1107296256;
  handler[2] = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_37;
  handler[3] = &__block_descriptor_tmp_39;
  handler[4] = registryEntryID;
  handler[5] = this;
  handler[6] = a2;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 1107296256;
  BOOL v23 = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_40;
  int v24 = &__block_descriptor_tmp_43;
  uint64_t v25 = handler;
  if (atomic_load((unsigned int *)(v16 + 24)))
  {
    unint64_t v18 = this[1].ivars;
    if (*((void *)v18 + 16))
    {
      ((void (*)(void *))v23)(v22);
      unint64_t v18 = this[1].ivars;
    }
    if (*((void *)v18 + 12))
    {
      ((void (*)(void *))v23)(v22);
      unint64_t v18 = this[1].ivars;
    }
    uint32_t v19 = (IODispatchSource *)*((void *)v18 + 19);
    if (v19) {
      IODispatchSource::Cancel(v19, handler, 0);
    }
    v20 = 0;
  }
  else
  {
    v20 = IOService::Stop(this, a2, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  }
  _Block_object_dispose(registryEntryID, 8);
  return v20;
}

uint64_t ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_35(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

IOService *___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_37(uint64_t a1)
{
  result = *(IOService **)(a1 + 40);
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0xFFFFFFFF, memory_order_relaxed) <= 1)return (IOService *)IOService::Stop(result, *(IOService **)(a1 + 48), (OSDispatchMethod)&IOUserHIDDevice::_Dispatch); {
  return result;
  }
}

void __copy_helper_block_8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32r(uint64_t a1)
{
}

uint64_t ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_40(uint64_t a1, const OSArray *a2)
{
  uint64_t result = ((uint64_t (*)(const OSArray *))a2->getCount)(a2);
  if (result)
  {
    uint32_t v5 = 0;
    do
    {
      Object = (OSAction *)OSArray::getObject(a2, v5);
      v9[0] = 0;
      v9[1] = v9;
      v9[2] = 0x2000000000;
      Reference = 0;
      Reference = OSAction::GetReference(Object);
      if (Object)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 1107296256;
        v8[2] = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_2;
        uint64_t v7 = *(void *)(a1 + 32);
        v8[3] = &__block_descriptor_tmp_41;
        v8[4] = v7;
        v8[5] = v9;
        OSAction::Cancel(Object, v8);
      }
      _Block_object_dispose(v9, 8);
      ++v5;
      uint64_t result = ((uint64_t (*)(const OSArray *))a2->getCount)(a2);
    }
    while (v5 < result);
  }
  return result;
}

uint64_t ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (*v2)
  {
    (*(void (**)(void))(*(void *)*v2 + 16))(*v2);
    **(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    BOOL v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  uint64_t v3 = v2[1];
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 8) = 0;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

void __copy_helper_block_8_32b40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(const void **)(a2 + 40);
  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_8_32b40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  BOOL v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 7);
}

void __copy_helper_block_8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32b(uint64_t a1)
{
}

uint64_t XboxHIDDevice::SetPowerState_Impl(IOService *this, uint32_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    uint32_t v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Set power state: %x\n", registryEntryID, 0x1Cu);
  }
  return IOService::SetPowerState(this, a2, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
}

uint64_t ___ZN13XboxHIDDevice18SetPowerState_ImplEj_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t XboxHIDDevice::handleStart(IOUserHIDDevice *this, IOService *a2)
{
  kern_return_t v6;
  const IOUSBEndpointDescriptor *EndpointDescriptor;
  const IOUSBEndpointDescriptor *v8;
  int v9;
  unsigned __int8 v10;
  int v11;
  const char *v12;
  uint64_t v13;
  int v14;
  int v15;
  IOUserHIDDevice *v16;
  uint64_t v17;
  uint64_t v18;
  IOUSBHostPipe **v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  kern_return_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const IOUSBHostPipe *v33;
  kern_return_t v34;
  kern_return_t v35;
  kern_return_t TimeoutOccurred;
  kern_return_t v37;
  uint64_t result;
  kern_return_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint32_t v43;
  kern_return_t v44;
  BOOL v45;
  const char *v46;
  uint64_t v47;
  kern_return_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  kern_return_t v55;
  const char *v56;
  uint64_t v57;
  kern_return_t v58;
  const char *v59;
  uint64_t v60;
  kern_return_t v61;
  const char *v62;
  uint64_t v63;
  kern_return_t v64;
  const char *v65;
  uint64_t v66;
  unint64_t v67;
  uint8_t speed;
  void **v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t);
  void *v72;
  IOUserHIDDevice *v73;
  void **v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t);
  void *v77;
  IOUserHIDDevice *v78;
  void **v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  IOUserHIDDevice *v83;
  void **v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t);
  void *v87;
  IOUserHIDDevice *v88;
  void **v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t);
  void *v92;
  IOUserHIDDevice *v93;
  void **v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t);
  void *v97;
  IOUserHIDDevice *v98;
  void **v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t);
  void *v102;
  IOUserHIDDevice *v103;
  void **v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t);
  void *v107;
  IOUserHIDDevice *v108;
  unsigned char registryEntryID[12];
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  kern_return_t v113;
  __int16 v114;
  int v115;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    uint64_t v104 = _NSConcreteStackBlock;
    v105 = 0x40000000;
    v106 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke;
    v107 = &__block_descriptor_tmp_45;
    v108 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v110 = 2048;
    uint64_t v111 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ::handleStart()\n", registryEntryID, 0x16u);
  }
  if (!IOUserHIDDevice::handleStart(this, a2)) {
    goto LABEL_57;
  }
  uint64_t v6 = IOUSBHostInterface::Open(*(IOUSBHostInterface **)(*(void *)&this[1].refcount + 8), this, 0, 0, 0);
  if (v6)
  {
    v48 = v6;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_57;
    }
    uint64_t v49 = OSMetaClassBase::GetClassName(this);
    uint64_t v99 = _NSConcreteStackBlock;
    v100 = 0x40000000;
    v101 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_46;
    v102 = &__block_descriptor_tmp_47;
    v103 = this;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    v50 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v49;
    __int16 v110 = 2048;
    uint64_t v111 = v50;
    __int16 v112 = 1024;
    int v113 = v48;
    v42 = "[%s 0x%llx] Failed to open interface: %{mach.errno}x\n";
LABEL_55:
    uint64_t v43 = 28;
LABEL_56:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v42, registryEntryID, v43);
    goto LABEL_57;
  }
  EndpointDescriptor = IOUSBGetNextEndpointDescriptor(*(const IOUSBConfigurationDescriptor **)(*(void *)&this[1].refcount + 24), *(const IOUSBInterfaceDescriptor **)(*(void *)&this[1].refcount + 32), 0);
  if (!EndpointDescriptor)
  {
    __int16 v10 = 0;
    uint64_t v9 = 0;
    v67 = 0;
LABEL_39:
    uint64_t v28 = *(void *)&this[1].refcount;
    if (*(void *)(v28 + 48) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v29 = OSMetaClassBase::GetClassName(this);
      uint64_t v84 = _NSConcreteStackBlock;
      v85 = 0x40000000;
      v86 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_52;
      v87 = &__block_descriptor_tmp_53;
      v88 = this;
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      v30 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v29;
      __int16 v110 = 2048;
      uint64_t v111 = v30;
      __int16 v112 = 1024;
      int v113 = v10;
      __int16 v114 = 1024;
      int v115 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] found in pipe (addr:%d, type:%d)\n", registryEntryID, 0x22u);
      uint64_t v28 = *(void *)&this[1].refcount;
    }
    if (*(void *)(v28 + 112) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = OSMetaClassBase::GetClassName(this);
      uint64_t v79 = _NSConcreteStackBlock;
      v80 = 0x40000000;
      v81 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_54;
      v82 = &__block_descriptor_tmp_55;
      v83 = this;
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v32 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v31;
      __int16 v110 = 2048;
      uint64_t v111 = v32;
      __int16 v112 = 1024;
      int v113 = v67;
      __int16 v114 = 1024;
      int v115 = HIDWORD(v67);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] found out pipe (addr:%d, type:%d)\n", registryEntryID, 0x22u);
      uint64_t v28 = *(void *)&this[1].refcount;
    }
    v33 = *(const IOUSBHostPipe **)(v28 + 48);
    if (v33)
    {
      if (*(void *)(v28 + 112))
      {
        uint8_t speed = 0;
        uint64_t v34 = IOUSBHostPipe::GetSpeed(v33, &speed, 0);
        if (v34)
        {
          uint64_t v55 = v34;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_57;
          }
          v56 = OSMetaClassBase::GetClassName(this);
          *(void *)uint64_t registryEntryID = 0;
          IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
          uint64_t v57 = *(void *)registryEntryID;
          *(_DWORD *)uint64_t registryEntryID = 136315650;
          *(void *)&registryEntryID[4] = v56;
          __int16 v110 = 2048;
          uint64_t v111 = v57;
          __int16 v112 = 1024;
          int v113 = v55;
          v42 = "[%s 0x%llx] Failed to get inPipe speed. GetSpeed() returned %{mach.errno}x\n";
        }
        else
        {
          *(_DWORD *)(*(void *)&this[1].refcount + 84) = 125
                                                           * IOUSBGetEndpointIntervalMicroframes(speed, *(const IOUSBEndpointDescriptor **)(*(void *)&this[1].refcount+ 40));
          uint64_t v35 = IOTimerDispatchSource::Create(*(IODispatchQueue **)(*(void *)&this[1].refcount + 144), (IOTimerDispatchSource **)(*(void *)&this[1].refcount + 152));
          if (v35)
          {
            v58 = v35;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_57;
            }
            uint64_t v59 = OSMetaClassBase::GetClassName(this);
            *(void *)uint64_t registryEntryID = 0;
            IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
            v60 = *(void *)registryEntryID;
            *(_DWORD *)uint64_t registryEntryID = 136315650;
            *(void *)&registryEntryID[4] = v59;
            __int16 v110 = 2048;
            uint64_t v111 = v60;
            __int16 v112 = 1024;
            int v113 = v58;
            v42 = "[%s 0x%llx] IOTimerDispatchSource::Create:%x\n";
          }
          else
          {
            TimeoutOccurred = XboxHIDDevice::CreateActionAsyncReadTimeoutOccurred(this, 8uLL, (OSAction **)(*(void *)&this[1].refcount + 160));
            if (TimeoutOccurred)
            {
              uint64_t v61 = TimeoutOccurred;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              uint32_t v62 = OSMetaClassBase::GetClassName(this);
              *(void *)uint64_t registryEntryID = 0;
              IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
              v63 = *(void *)registryEntryID;
              *(_DWORD *)uint64_t registryEntryID = 136315650;
              *(void *)&registryEntryID[4] = v62;
              __int16 v110 = 2048;
              uint64_t v111 = v63;
              __int16 v112 = 1024;
              int v113 = v61;
              v42 = "[%s 0x%llx] CreateActionTimerOccurred:%x\n";
            }
            else
            {
              uint64_t v37 = IOTimerDispatchSource::SetHandler(*(IOTimerDispatchSource **)(*(void *)&this[1].refcount + 152), *(OSAction **)(*(void *)&this[1].refcount + 160), 0);
              if (!v37) {
                return 1;
              }
              uint64_t v64 = v37;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              v65 = OSMetaClassBase::GetClassName(this);
              *(void *)uint64_t registryEntryID = 0;
              IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
              uint64_t v66 = *(void *)registryEntryID;
              *(_DWORD *)uint64_t registryEntryID = 136315650;
              *(void *)&registryEntryID[4] = v65;
              __int16 v110 = 2048;
              uint64_t v111 = v66;
              __int16 v112 = 1024;
              int v113 = v64;
              v42 = "[%s 0x%llx] IOTimerDispatchSource::SetHandler:%x\n";
            }
          }
        }
        goto LABEL_55;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      uint64_t v53 = OSMetaClassBase::GetClassName(this);
      uint64_t v69 = _NSConcreteStackBlock;
      v70 = 0x40000000;
      v71 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_58;
      v72 = &__block_descriptor_tmp_59;
      v73 = this;
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      v54 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v53;
      __int16 v110 = 2048;
      uint64_t v111 = v54;
      v42 = "[%s 0x%llx] missing outPipe\n";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      uint64_t v51 = OSMetaClassBase::GetClassName(this);
      uint64_t v74 = _NSConcreteStackBlock;
      v75 = 0x40000000;
      v76 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_56;
      v77 = &__block_descriptor_tmp_57;
      v78 = this;
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      v52 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v51;
      __int16 v110 = 2048;
      uint64_t v111 = v52;
      v42 = "[%s 0x%llx] missing inPipe\n";
    }
    uint64_t v43 = 22;
    goto LABEL_56;
  }
  __int16 v8 = EndpointDescriptor;
  uint64_t v9 = 0;
  __int16 v10 = 0;
  v67 = 0;
  while (1)
  {
    uint32_t v11 = IOUSBGetEndpointType(v8);
    if (v11 != 3)
    {
      if (v11 == 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = OSMetaClassBase::GetClassName(this);
        uint64_t v94 = _NSConcreteStackBlock;
        v95 = 0x40000000;
        v96 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_48;
        v97 = &__block_descriptor_tmp_49;
        v98 = this;
        *(void *)uint64_t registryEntryID = 0;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
        uint64_t v13 = *(void *)registryEntryID;
        *(_DWORD *)uint64_t registryEntryID = 136315394;
        *(void *)&registryEntryID[4] = v12;
        __int16 v110 = 2048;
        uint64_t v111 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Unexpected Bulk pipe found but ignored.\n", registryEntryID, 0x16u);
      }
      goto LABEL_36;
    }
    v14 = IOUSBGetEndpointDirection(v8);
    uint64_t v15 = v14;
    uint64_t v16 = this;
    uint64_t v17 = *(void *)&this[1].refcount;
    if (v14 == 1) {
      unint64_t v18 = 48;
    }
    else {
      unint64_t v18 = 112;
    }
    if (v14 == 1) {
      uint32_t v19 = (IOUSBHostPipe **)(v17 + 48);
    }
    else {
      uint32_t v19 = (IOUSBHostPipe **)(v17 + 112);
    }
    if (v14 == 1) {
      v20 = 40;
    }
    else {
      v20 = 104;
    }
    uint64_t v21 = *(void *)(v17 + v18);
    if (v21)
    {
      uint64_t v22 = HIDWORD(v67);
      if (v15 == 1) {
        uint64_t v22 = v9;
      }
      if (v22 == 3)
      {
        this = v16;
        goto LABEL_36;
      }
      (*(void (**)(uint64_t))(*(void *)v21 + 16))(v21);
      *(void *)(v17 + v18) = 0;
    }
    BOOL v23 = IOUSBGetEndpointAddress(v8);
    int v24 = HIDWORD(v67);
    if (v15 == 1) {
      uint64_t v9 = 3;
    }
    else {
      int v24 = 3;
    }
    if (v15 == 1) {
      __int16 v10 = v23;
    }
    uint64_t v25 = v67;
    if (v15 != 1) {
      uint64_t v25 = v23;
    }
    v67 = __PAIR64__(v24, v25);
    *(void *)(v17 + v20) = v8;
    this = v16;
    int v26 = IOUSBHostInterface::CopyPipe(*(IOUSBHostInterface **)(*(void *)&v16[1].refcount + 8), v23, v19, 0);
    if (v26) {
      break;
    }
    uint64_t v27 = *(void *)&v16[1].refcount;
    if (*(void *)(v27 + 48) && *(void *)(v27 + 112)) {
      goto LABEL_39;
    }
LABEL_36:
    __int16 v8 = IOUSBGetNextEndpointDescriptor(*(const IOUSBConfigurationDescriptor **)(*(void *)&this[1].refcount + 24), *(const IOUSBInterfaceDescriptor **)(*(void *)&this[1].refcount + 32), (const IOUSBDescriptorHeader *)v8);
    if (!v8) {
      goto LABEL_39;
    }
  }
  v39 = v26;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = OSMetaClassBase::GetClassName(v16);
    uint64_t v89 = _NSConcreteStackBlock;
    v90 = 0x40000000;
    v91 = ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_50;
    v92 = &__block_descriptor_tmp_51;
    v93 = v16;
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(v16, (uint64_t *)registryEntryID, 0);
    v41 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v40;
    __int16 v110 = 2048;
    uint64_t v111 = v41;
    __int16 v112 = 1024;
    int v113 = v39;
    v42 = "[%s 0x%llx] CopyPipe:%x\n";
    goto LABEL_55;
  }
LABEL_57:
  v44 = IOUSBHostInterface::Close(*(IOUSBHostInterface **)(*(void *)&this[1].refcount + 8), this, 0, 0);
  uint64_t v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v45)
  {
    v46 = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v47 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v46;
    __int16 v110 = 2048;
    uint64_t v111 = v47;
    __int16 v112 = 1024;
    int v113 = v44;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Close interface: 0x%x\n", registryEntryID, 0x1Cu);
    return 0;
  }
  return result;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_46(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_48(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_50(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_52(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_54(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_56(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_58(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_60(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_62(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_64(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_66(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice11handleStartEP9IOService_block_invoke_68(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t non-virtual thunk to'XboxHIDDevice::handleStart(XboxHIDDevice *this, IOService *a2)
{
  return XboxHIDDevice::handleStart((IOUserHIDDevice *)((char *)this - 64), a2);
}

OSDictionary *XboxHIDDevice::newDeviceDescription(XboxHIDDevice *this)
{
  kern_return_t v5;
  OSObject *Value;
  OSStringPtr v7;
  OSStringPtr v8;
  OSStringPtr v9;
  OSStringPtr v10;
  OSStringPtr v11;
  OSStringPtr v12;
  const char *ClassName;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  kern_return_t v19;
  const char *v20;
  uint64_t v21;
  OSDictionary *properties;
  unsigned char registryEntryID[12];
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  kern_return_t v27;

  properties = 0;
  BOOL v2 = (const IOUSBDeviceDescriptor *)(*(uint64_t (**)(void))(***((void ***)this + 11) + 64))(**((void **)this + 11));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
      uint64_t v15 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = ClassName;
      int v24 = 2048;
      uint64_t v25 = v15;
      uint64_t v16 = "[%s 0x%llx] CopyDeviceDescriptor\n";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, registryEntryID, 0x16u);
    }
LABEL_22:
    uint64_t v4 = 0;
    goto LABEL_12;
  }
  OSDictionaryPtr v3 = OSDictionary::withCapacity(0xAu);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
      unint64_t v18 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v17;
      int v24 = 2048;
      uint64_t v25 = v18;
      uint64_t v16 = "[%s 0x%llx] OSDictionaryCreate\n";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  uint64_t v4 = v3;
  uint64_t v5 = IOService::CopyProperties(*(IOService **)(*((void *)this + 11) + 8), &properties, 0);
  if (v5)
  {
    uint32_t v19 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
      uint64_t v21 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v20;
      int v24 = 2048;
      uint64_t v25 = v21;
      int v26 = 1024;
      uint64_t v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] CopyProperties:%x\n", registryEntryID, 0x1Cu);
    }
  }
  else
  {
    OSDictionarySetUInt64Value(v4, "ReportInterval", *(unsigned int *)(*((void *)this + 11) + 84));
    OSDictionarySetUInt64Value(v4, "VendorID", v2->idVendor);
    OSDictionarySetUInt64Value(v4, "ProductID", v2->idProduct);
    OSDictionarySetStringValue(v4, "Transport", "USB");
    OSDictionarySetUInt64Value(v4, "VersionNumber", v2->bcdDevice);
    OSDictionarySetUInt64Value(v4, "CountryCode", 0);
    Value = OSDictionaryGetValue(properties, "locationID");
    if (Value) {
      OSDictionarySetValue(v4, "LocationID", Value);
    }
    uint64_t v7 = XboxHIDDevice::copyStringAtIndex((IOService *)this, v2->iManufacturer, 1033);
    if (v7)
    {
      __int16 v8 = v7;
      OSDictionarySetValue(v4, "Manufacturer", v7);
      ((void (*)(OSStringPtr))v8->release)(v8);
    }
    uint64_t v9 = XboxHIDDevice::copyStringAtIndex((IOService *)this, v2->iProduct, 1033);
    if (v9)
    {
      __int16 v10 = v9;
      OSDictionarySetValue(v4, "Product", v9);
      ((void (*)(OSStringPtr))v10->release)(v10);
    }
    uint32_t v11 = XboxHIDDevice::copyStringAtIndex((IOService *)this, v2->iSerialNumber, 1033);
    if (v11)
    {
      uint64_t v12 = v11;
      OSDictionarySetValue(v4, "SerialNumber", v11);
      ((void (*)(OSStringPtr))v12->release)(v12);
    }
  }
LABEL_12:
  if (properties)
  {
    ((void (*)(OSDictionary *))properties->release)(properties);
    properties = 0;
  }
  if (v2) {
    IOUSBHostFreeDescriptor(v2);
  }
  return v4;
}

uint64_t ___ZN13XboxHIDDevice20newDeviceDescriptionEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice20newDeviceDescriptionEv_block_invoke_71(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice20newDeviceDescriptionEv_block_invoke_73(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

OSStringPtr XboxHIDDevice::copyStringAtIndex(IOService *this, int a2, int a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v6 = (const IOUSBStringDescriptor *)(*(uint64_t (**)(void))(**((void **)this[1].ivars + 1) + 72))(*((void *)this[1].ivars + 1));
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)cstring = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)cstring, 0);
      uint64_t v17 = *(void *)cstring;
      *(_DWORD *)cstring = 136315906;
      *(void *)&cstring[4] = ClassName;
      __int16 v20 = 2048;
      uint64_t v21 = v17;
      __int16 v22 = 1024;
      int v23 = a2;
      __int16 v24 = 1024;
      int v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] CopyStringDescriptor(%d,%d)\n", cstring, 0x22u);
    }
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t bLength = v6->bLength;
  if ((bLength & 0xFE) == 2)
  {
    size_t v9 = 0;
  }
  else
  {
    int v10 = 0;
    size_t v9 = 0;
    unint64_t v11 = (unint64_t)(bLength - 2) >> 1;
    unsigned int v12 = 1;
    do
    {
      __int16 v13 = *(_WORD *)&v6->bString[v10];
      if (!v13) {
        break;
      }
      cstring[v9] = v13;
      size_t v9 = v12;
      BOOL v14 = v11 > v12++;
      v10 += 2;
    }
    while (v14);
  }
  cstring[v9] = 0;
  OSStringPtr v15 = OSStringCreate(cstring, v9);
  IOUSBHostFreeDescriptor(v7);
  return v15;
}

OSDictionary *non-virtual thunk to'XboxHIDDevice::newDeviceDescription(XboxHIDDevice *this)
{
  return XboxHIDDevice::newDeviceDescription((XboxHIDDevice *)((char *)this - 64));
}

OSMetaClassBase *XboxHIDDevice::newMaxInboundTransferSize(IOService *this)
{
  kern_return_t v2;
  OSObjectPtr Value;
  OSMetaClassBase *v4;
  OSMetaClassBase *v5;
  kern_return_t v7;
  const char *ClassName;
  uint64_t v9;
  OSDictionary *properties;
  unsigned char registryEntryID[12];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  kern_return_t v15;

  properties = 0;
  BOOL v2 = IOService::CopyProperties(this, &properties, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if (v2)
  {
    uint64_t v7 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      size_t v9 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = ClassName;
      unsigned int v12 = 2048;
      __int16 v13 = v9;
      BOOL v14 = 1024;
      OSStringPtr v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Failed to obtain HIDDevice properties. CopyProperties() returned %{mach.errno}x\n", registryEntryID, 0x1Cu);
    }
    uint64_t v5 = 0;
  }
  else
  {
    Value = OSDictionaryGetValue(properties, "MaxInputReportSize");
    uint64_t v4 = OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass);
    uint64_t v5 = v4;
    if (v4) {
      ((void (*)(OSMetaClassBase *))v4->retain)(v4);
    }
  }
  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v5;
}

uint64_t ___ZN13XboxHIDDevice25newMaxInboundTransferSizeEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

OSMetaClassBase *non-virtual thunk to'XboxHIDDevice::newMaxInboundTransferSize(XboxHIDDevice *this)
{
  return XboxHIDDevice::newMaxInboundTransferSize((IOService *)((char *)this - 80));
}

OSMetaClassBase *XboxHIDDevice::newMaxOutboundTransferSize(IOService *this)
{
  kern_return_t v2;
  OSObjectPtr Value;
  OSMetaClassBase *v4;
  OSObjectPtr v5;
  OSMetaClassBase *v6;
  BOOL v7;
  OSMetaClassBase *v8;
  BOOL v9;
  kern_return_t v11;
  const char *ClassName;
  uint64_t v13;
  OSDictionary *properties;
  unsigned char registryEntryID[12];
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  kern_return_t v19;

  properties = 0;
  BOOL v2 = IOService::CopyProperties(this, &properties, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if (v2)
  {
    unint64_t v11 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      __int16 v13 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = ClassName;
      uint64_t v16 = 2048;
      uint64_t v17 = v13;
      unint64_t v18 = 1024;
      uint32_t v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Failed to obtain HIDDevice properties. CopyProperties() returned %{mach.errno}x\n", registryEntryID, 0x1Cu);
    }
    uint64_t v4 = 0;
  }
  else
  {
    Value = OSDictionaryGetValue(properties, "MaxOutputReportSize");
    uint64_t v4 = OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass);
    uint64_t v5 = OSDictionaryGetValue(properties, "MaxFeatureReportSize");
    uint64_t v6 = OSMetaClassBase::safeMetaCast(v5, gOSNumberMetaClass);
    if (v4) {
      uint64_t v7 = v6 == 0;
    }
    else {
      uint64_t v7 = 0;
    }
    if (v7 || ((__int16 v8 = v6, !v4) ? (v9 = v6 == 0) : (v9 = 1), v9))
    {
      ((void (*)(OSMetaClassBase *))v4->retain)(v4);
    }
    else
    {
      ((void (*)(OSMetaClassBase *))v6->retain)(v6);
      uint64_t v4 = v8;
    }
  }
  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v4;
}

uint64_t ___ZN13XboxHIDDevice26newMaxOutboundTransferSizeEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

OSMetaClassBase *non-virtual thunk to'XboxHIDDevice::newMaxOutboundTransferSize(XboxHIDDevice *this)
{
  return XboxHIDDevice::newMaxOutboundTransferSize((IOService *)((char *)this - 80));
}

uint64_t XboxHIDDevice::setupAsyncReceive(IOService *this)
{
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v3 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v24 = 2048;
    uint64_t v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ::setupAsyncReceive()\n", registryEntryID, 0x16u);
  }
  while (1)
  {
    unsigned int v4 = (*(uint64_t (**)(void))(**((void **)this[1].ivars + 12) + 72))(*((void *)this[1].ivars + 12));
    if (v4 >= (*(unsigned int (**)(void))(**((void **)this[1].ivars + 12) + 80))(*((void *)this[1].ivars + 12))
      && (*(unsigned int (**)(void))(**((void **)this[1].ivars + 12) + 72))(*((void *)this[1].ivars
                                                                                             + 12)))
    {
      return 0;
    }
    uint64_t v5 = (*(uint64_t (**)(void, uint64_t, void, uint64_t *))(**((void **)this[1].ivars + 1) + 88))(*((void *)this[1].ivars + 1), 1, *((void *)this[1].ivars + 9), &v22);
    if (v5)
    {
      uint64_t v12 = v5;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v12;
      }
      BOOL v14 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v15 = *(void *)registryEntryID;
      uint64_t v16 = (OSAction *)*((void *)this[1].ivars + 9);
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v14;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 1024;
      int v29 = v12;
      uint64_t v17 = "[%s 0x%llx] Could not create input buffer. CreateIOBuffer(%{bytes}llu) failed: %{mach.errno}d\n";
      uint32_t v18 = 38;
      goto LABEL_17;
    }
    uint64_t v6 = XboxHIDDevice::CreateActionCompleteAsyncReceive(this, 0x18uLL, &v21);
    if (v6) {
      break;
    }
    uint64_t v7 = v22;
    *((void *)OSAction::GetReference(v21) + 1) = v7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v9 = *(void *)registryEntryID;
      int v10 = v21;
      int v11 = (*(uint64_t (**)(void))(**((void **)this[1].ivars + 12) + 72))(*((void *)this[1].ivars + 12));
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v9;
      __int16 v26 = 2048;
      uint64_t v27 = v10;
      __int16 v28 = 1024;
      int v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Add element %p to input action array: %u\n", registryEntryID, 0x26u);
    }
    OSArray::setObject(*((OSArray **)this[1].ivars + 12), v21);
    if (v21)
    {
      ((void (*)(OSAction *))v21->release)(v21);
      uint64_t v21 = 0;
    }
  }
  uint64_t v12 = v6;
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
    return v12;
  }
  uint32_t v19 = OSMetaClassBase::GetClassName(this);
  *(void *)uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
  uint64_t v20 = *(void *)registryEntryID;
  *(_DWORD *)uint64_t registryEntryID = 136315650;
  *(void *)&registryEntryID[4] = v19;
  __int16 v24 = 2048;
  uint64_t v25 = v20;
  __int16 v26 = 1024;
  LODWORD(v27) = v12;
  uint64_t v17 = "[%s 0x%llx] CreateActionCompleteInputReport:%x\n";
  uint32_t v18 = 28;
LABEL_17:
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, registryEntryID, v18);
  return v12;
}

uint64_t ___ZN13XboxHIDDevice17setupAsyncReceiveEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice17setupAsyncReceiveEv_block_invoke_93(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice17setupAsyncReceiveEv_block_invoke_95(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice17setupAsyncReceiveEv_block_invoke_97(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t non-virtual thunk to'XboxHIDDevice::setupAsyncReceive(XboxHIDDevice *this)
{
  return XboxHIDDevice::setupAsyncReceive((IOService *)((char *)this - 80));
}

uint64_t XboxHIDDevice::scheduleAsyncReceive(IOService *this)
{
  kern_return_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  unsigned char registryEntryID[12];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v3 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    uint64_t v20 = 2048;
    uint64_t v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ::scheduleAsyncReceive()\n", registryEntryID, 0x16u);
  }
  ivars = this[1].ivars;
  if (!*((unsigned char *)ivars + 168))
  {
    uint64_t v5 = *((void *)ivars + 12);
    if (v5)
    {
      if (!(*(unsigned int (**)(uint64_t))(*(void *)v5 + 72))(v5))
      {
        unsigned int v7 = 0;
        char v8 = 1;
        goto LABEL_19;
      }
      uint32_t v6 = 0;
      unsigned int v7 = 0;
      char v8 = 1;
      while (1)
      {
        Object = OSArray::getObject(*((const OSArray **)this[1].ivars + 12), v6);
        int v10 = (OSAction *)OSMetaClassBase::safeMetaCast(Object, gOSActionMetaClass);
        if (!v10)
        {
          unsigned int v7 = -536870206;
          goto LABEL_19;
        }
        int v11 = v10;
        Reference = OSAction::GetReference(v10);
        if (!*((unsigned char *)Reference + 16)) {
          break;
        }
LABEL_16:
        if (++v6 >= (*(unsigned int (**)(void))(**((void **)this[1].ivars + 12) + 72))(*((void *)this[1].ivars + 12))) {
          goto LABEL_19;
        }
      }
      __int16 v13 = (IOMemoryDescriptor **)Reference;
      unsigned int v7 = IOUSBHostPipe::AsyncIO(*((IOUSBHostPipe **)this[1].ivars + 6), *((IOMemoryDescriptor **)Reference + 1), *((_DWORD *)this[1].ivars + 18), v11, 0, 0);
      if (v7 == -536850432)
      {
        BOOL v14 = IOUSBHostPipe::ClearStall(*((IOUSBHostPipe **)this[1].ivars + 6), 0, 0);
        if (v14)
        {
          unsigned int v7 = v14;
LABEL_14:
          char v8 = 0;
          goto LABEL_16;
        }
        unsigned int v7 = IOUSBHostPipe::AsyncIO(*((IOUSBHostPipe **)this[1].ivars + 6), v13[1], *((_DWORD *)this[1].ivars + 18), v11, 0, 0);
      }
      if (!v7)
      {
        *((unsigned char *)v13 + 16) = 1;
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  char v8 = 1;
  unsigned int v7 = -536870185;
LABEL_19:
  if ((v7 != 0) | v8 & 1) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = 3758097084;
  }
  if (v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v17 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v16;
    uint64_t v20 = 2048;
    uint64_t v21 = v17;
    uint64_t v22 = 1024;
    int v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] scheduleAsyncReceive:0x%x\n", registryEntryID, 0x1Cu);
  }
  return v15;
}

uint64_t ___ZN13XboxHIDDevice20scheduleAsyncReceiveEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice20scheduleAsyncReceiveEv_block_invoke_100(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t non-virtual thunk to'XboxHIDDevice::scheduleAsyncReceive(XboxHIDDevice *this)
{
  return XboxHIDDevice::scheduleAsyncReceive((IOService *)((char *)this - 80));
}

void XboxHIDDevice::scheduleAsyncRecieveRetry(IOService *this, kern_return_t a2)
{
  kern_return_t v15;
  kern_return_t v16;
  const char *v17;
  uint64_t v18;
  unsigned char registryEntryID[12];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  kern_return_t v23;
  __int16 v24;
  BOOL v25;
  __int16 v26;
  unint64_t v27;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    uint64_t v20 = 2048;
    uint64_t v21 = v5;
    uint64_t v22 = 1024;
    int v23 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ::scheduleAsyncRecieveRetry(%x)\n", registryEntryID, 0x1Cu);
  }
  ivars = this[1].ivars;
  if (!*((unsigned char *)ivars + 168))
  {
    int v7 = *((_DWORD *)ivars + 22);
    if (v7)
    {
      if (a2 == -536870165)
      {
        uint64_t v8 = (1000 * *((_DWORD *)ivars + 21));
LABEL_12:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = OSMetaClassBase::GetClassName(this);
          *(void *)uint64_t registryEntryID = 0;
          IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
          uint64_t v12 = *(void *)registryEntryID;
          int v13 = *((_DWORD *)this[1].ivars + 22);
          *(_DWORD *)uint64_t registryEntryID = 136316162;
          *(void *)&registryEntryID[4] = v11;
          uint64_t v20 = 2048;
          uint64_t v21 = v12;
          uint64_t v22 = 1024;
          int v23 = a2;
          __int16 v24 = 1024;
          uint64_t v25 = v13;
          __int16 v26 = 2048;
          uint64_t v27 = v8 / 0xF4240uLL;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Schedule retry reason:0x%x count:%d deadline:%llums\n", registryEntryID, 0x2Cu);
        }
        __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        uint64_t v15 = IOTimerDispatchSource::WakeAtTime(*((IOTimerDispatchSource **)this[1].ivars + 19), 0x88uLL, v14 + v8, 0, 0);
        if (v15)
        {
          uint64_t v16 = v15;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = OSMetaClassBase::GetClassName(this);
            *(void *)uint64_t registryEntryID = 0;
            IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
            uint32_t v18 = *(void *)registryEntryID;
            *(_DWORD *)uint64_t registryEntryID = 136315650;
            *(void *)&registryEntryID[4] = v17;
            uint64_t v20 = 2048;
            uint64_t v21 = v18;
            uint64_t v22 = 1024;
            int v23 = v16;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] WakeAtTime:0x%x\n", registryEntryID, 0x1Cu);
          }
        }
        return;
      }
LABEL_11:
      *((_DWORD *)ivars + 22) = v7 - 1;
      uint64_t v8 = 50000000;
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v10 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v9;
      uint64_t v20 = 2048;
      uint64_t v21 = v10;
      uint64_t v22 = 1024;
      int v23 = a2;
      __int16 v24 = 1024;
      uint64_t v25 = a2 != -536870165;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Retries exhausted, reason:0x%x, wantsReset:%d\n\n", registryEntryID, 0x22u);
    }
    if (a2 != -536870165)
    {
      XboxHIDDevice::reset((XboxHIDDevice *)this);
      *((_DWORD *)this[1].ivars + 22) = 10;
      ivars = this[1].ivars;
      int v7 = *((_DWORD *)ivars + 22);
      goto LABEL_11;
    }
  }
}

uint64_t ___ZN13XboxHIDDevice25scheduleAsyncRecieveRetryEi_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice25scheduleAsyncRecieveRetryEi_block_invoke_103(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

void XboxHIDDevice::reset(XboxHIDDevice *this)
{
  kern_return_t v4;
  kern_return_t v5;
  const char *v6;
  uint64_t v7;
  unsigned char registryEntryID[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  kern_return_t v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
    uint64_t v3 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    uint64_t v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] USB Device Reset\n", registryEntryID, 0x16u);
  }
  unsigned int v4 = IOUSBHostDevice::Reset(**((IOUSBHostDevice ***)this + 11), 0);
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v6 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0);
      int v7 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v6;
      uint64_t v9 = 2048;
      uint64_t v10 = v7;
      int v11 = 1024;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Reset:0x%x\n", registryEntryID, 0x1Cu);
    }
  }
}

uint64_t ___ZN13XboxHIDDevice25scheduleAsyncRecieveRetryEi_block_invoke_105(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice25scheduleAsyncRecieveRetryEi_block_invoke_107(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

void non-virtual thunk to'XboxHIDDevice::scheduleAsyncRecieveRetry(XboxHIDDevice *this, kern_return_t a2)
{
}

void XboxHIDDevice::cancelAsyncRecieveRetry(IOService *this)
{
  kern_return_t v4;
  kern_return_t v5;
  const char *v6;
  uint64_t v7;
  unsigned char registryEntryID[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  kern_return_t v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v3 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    uint64_t v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ::cancelAsyncRecieveRetry()\n", registryEntryID, 0x16u);
  }
  unsigned int v4 = IOTimerDispatchSource::WakeAtTime(*((IOTimerDispatchSource **)this[1].ivars + 19), 0, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v6 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      int v7 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v6;
      uint64_t v9 = 2048;
      uint64_t v10 = v7;
      int v11 = 1024;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] WakeAtTime:0x%x\n", registryEntryID, 0x1Cu);
    }
  }
  *((_DWORD *)this[1].ivars + 22) = 10;
}

uint64_t ___ZN13XboxHIDDevice23cancelAsyncRecieveRetryEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice23cancelAsyncRecieveRetryEv_block_invoke_110(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

void non-virtual thunk to'XboxHIDDevice::cancelAsyncRecieveRetry(XboxHIDDevice *this)
{
}

uint64_t XboxHIDDevice::AsyncReadTimeoutOccurred_Impl(IOService *this, OSAction *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v4 = *(void *)registryEntryID;
    int v5 = *((_DWORD *)this[1].ivars + 22);
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] TimerOccurred retry:%d\n", registryEntryID, 0x1Cu);
  }
  IOTimerDispatchSource::WakeAtTime(*((IOTimerDispatchSource **)this[1].ivars + 19), 0, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  uint64_t result = ((uint64_t (*)(IOService *))this->OSObject::OSMetaClassBase::__vftable[2].Dispatch)(this);
  if (result) {
    return ((uint64_t (*)(IOService *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[2].init)(this, result);
  }
  return result;
}

uint64_t ___ZN13XboxHIDDevice29AsyncReadTimeoutOccurred_ImplEP8OSActiony_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

void XboxHIDDevice::CompleteAsyncReceive_Impl(IOService *this, OSAction *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v11 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    __int16 v23 = 1024;
    int v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ::CompleteAsyncReceive(%x)\n", registryEntryID, 0x1Cu);
  }
  Reference = OSAction::GetReference(a2);
  Reference[16] = 0;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v14 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      __int16 v23 = 1024;
      int v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] CompleteInReport:0x%x\n", registryEntryID, 0x1Cu);
    }
    if (*((unsigned char *)this[1].ivars + 168)) {
      return;
    }
LABEL_15:
    ((void (*)(IOService *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[2].init)(this, a3);
    return;
  }
  if (!*((unsigned char *)this[1].ivars + 168))
  {
    uint64_t v15 = Reference;
    ((void (*)(IOService *))this->OSObject::OSMetaClassBase::__vftable[2].free)(this);
    if (*((void *)this[1].ivars + 9) >= (unint64_t)a4)
    {
      ((void (*)(IOService *, uint64_t, void, uint64_t))this->OSObject::OSMetaClassBase::__vftable[2].getMetaClass)(this, a5, *((void *)v15 + 1), a4);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v17 = *(void *)registryEntryID;
      uint64_t v18 = *((void *)this[1].ivars + 9);
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v16;
      __int16 v21 = 2048;
      uint64_t v22 = v17;
      __int16 v23 = 1024;
      int v24 = a4;
      __int16 v25 = 1024;
      int v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] CompleteAsyncReceive actualByteCount:%d inBufferSize:%d\n", registryEntryID, 0x22u);
    }
    uint64_t v19 = ((uint64_t (*)(IOService *))this->OSObject::OSMetaClassBase::__vftable[2].Dispatch)(this);
    if (v19)
    {
      a3 = v19;
      goto LABEL_15;
    }
  }
}

uint64_t ___ZN13XboxHIDDevice25CompleteAsyncReceive_ImplEP8OSActionijy_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice25CompleteAsyncReceive_ImplEP8OSActionijy_block_invoke_114(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice25CompleteAsyncReceive_ImplEP8OSActionijy_block_invoke_116(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

void XboxHIDDevice::CompleteAsyncSend_Impl(IOHIDDevice *this, OSAction *a2, IOReturn a3, uint32_t a4)
{
  kern_return_t v14;
  kern_return_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  OSObjectInterface_vtbl *v20;
  unint64_t free_low;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint32_t bytesTransferred;
  uint64_t returnLength;
  unsigned char registryEntryID[12];
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  IOReturn v32;
  __int16 v33;
  OSAction *v34;

  Reference = OSAction::GetReference(a2);
  uint64_t v9 = *(OSAction **)Reference;
  __int16 v10 = (IOMemoryDescriptor *)*((void *)Reference + 1);
  returnLength = 0;
  bytesTransferred = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v12 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    int v29 = 2048;
    v30 = v12;
    uint64_t v31 = 1024;
    uint64_t v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ::CompleteAsyncSend(%x)\n", registryEntryID, 0x1Cu);
  }
  if (v10) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      __int16 v23 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v22;
      int v29 = 2048;
      v30 = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] ComleteOutputReport: Missing completion info, cannot complete callback.\n", registryEntryID, 0x16u);
    }
  }
  else
  {
    if (a3 == -536850432)
    {
      uint64_t v14 = IOUSBHostPipe::ClearStall((IOUSBHostPipe *)this[1].IOService::OSObject::OSObjectInterface::__vftable[7].init, 1, 0);
      if (v14)
      {
        uint64_t v15 = v14;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = OSMetaClassBase::GetClassName(this);
          *(void *)uint64_t registryEntryID = 0;
          IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
          uint64_t v17 = *(void *)registryEntryID;
          *(_DWORD *)uint64_t registryEntryID = 136315650;
          *(void *)&registryEntryID[4] = v16;
          int v29 = 2048;
          v30 = v17;
          uint64_t v31 = 1024;
          uint64_t v32 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Could not clear stall: 0x%x\n", registryEntryID, 0x1Cu);
        }
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v19 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v18;
      int v29 = 2048;
      v30 = v19;
      uint64_t v31 = 1024;
      uint64_t v32 = a3;
      v33 = 2048;
      uint64_t v34 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] CompleteAsyncSend:0x%x %p\n", registryEntryID, 0x26u);
    }
    if (a3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = OSMetaClassBase::GetClassName(this);
        *(void *)uint64_t registryEntryID = 0;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
        __int16 v25 = *(void *)registryEntryID;
        *(_DWORD *)uint64_t registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v24;
        int v29 = 2048;
        v30 = v25;
        uint64_t v31 = 1024;
        uint64_t v32 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] CompleteAsyncSend:0x%x\n", registryEntryID, 0x1Cu);
      }
    }
    else
    {
      IOMemoryDescriptor::GetLength(v10, &returnLength);
      uint64_t v20 = this[1].IOService::OSObject::OSObjectInterface::__vftable;
      free_low = LODWORD(v20[7].free);
      if (returnLength != free_low && !(returnLength % free_low) && returnLength != HIDWORD(v20[7].free)) {
        IOUSBHostPipe::IO((IOUSBHostPipe *)v20[7].init, (IOMemoryDescriptor *)v20[8].free, 0, &bytesTransferred, 0, 0);
      }
    }
    IOHIDDevice::CompleteReport(this, v9, a3, a4, 0);
  }
  XboxHIDDevice::returnAction(this, a2);
}

uint64_t ___ZN13XboxHIDDevice22CompleteAsyncSend_ImplEP8OSActionijy_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice22CompleteAsyncSend_ImplEP8OSActionijy_block_invoke_119(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice22CompleteAsyncSend_ImplEP8OSActionijy_block_invoke_121(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice22CompleteAsyncSend_ImplEP8OSActionijy_block_invoke_123(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice22CompleteAsyncSend_ImplEP8OSActionijy_block_invoke_125(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

void XboxHIDDevice::returnAction(IOService *this, OSAction *a2)
{
  if (a2)
  {
    Reference = OSAction::GetReference(a2);
    if (*Reference)
    {
      (*(void (**)(void))(*(void *)*Reference + 16))(*Reference);
      void *Reference = 0;
    }
    uint64_t v5 = Reference[1];
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
      Reference[1] = 0;
    }
    *((unsigned char *)Reference + 16) = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v7 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = ClassName;
      __int16 v9 = 2048;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Return action: %p\n", registryEntryID, 0x20u);
    }
  }
}

OSAction *XboxHIDDevice::getAsyncSendAction(IOService *this)
{
  uint64_t v2 = *((void *)this[1].ivars + 16);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v16 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = ClassName;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      uint64_t v17 = "[%s 0x%llx] getAsyncSendAction\n";
      uint32_t v18 = 22;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, registryEntryID, v18);
      return 0;
    }
    return 0;
  }
  if (!(*(unsigned int (**)(uint64_t))(*(void *)v2 + 72))(v2))
  {
LABEL_6:
    int v24 = 0;
    goto LABEL_7;
  }
  uint32_t v3 = 0;
  while (1)
  {
    Object = (OSAction *)OSArray::getObject(*((const OSArray **)this[1].ivars + 16), v3);
    Reference = OSAction::GetReference(Object);
    if (!Reference[16]) {
      break;
    }
    if (++v3 >= (*(unsigned int (**)(void))(**((void **)this[1].ivars + 16) + 72))(*((void *)this[1].ivars + 16))) {
      goto LABEL_6;
    }
  }
  int v24 = Object;
  Reference[16] = 1;
  if (!Object)
  {
LABEL_7:
    int v6 = XboxHIDDevice::CreateActionCompleteAsyncSend(this, 0x18uLL, &v24);
    if (v6)
    {
      int v19 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = OSMetaClassBase::GetClassName(this);
        *(void *)uint64_t registryEntryID = 0;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
        uint64_t v21 = *(void *)registryEntryID;
        *(_DWORD *)uint64_t registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v20;
        __int16 v26 = 2048;
        uint64_t v27 = v21;
        __int16 v28 = 1024;
        LODWORD(v29) = v19;
        uint64_t v17 = "[%s 0x%llx] CreateActionCompleteAsyncSend:%x\n";
LABEL_21:
        uint32_t v18 = 28;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v7 = OSAction::GetReference(v24);
      *uint64_t v7 = 0;
      v7[1] = 0;
      *((unsigned char *)v7 + 16) = 1;
      BOOL v8 = OSArray::setObject(*((OSArray **)this[1].ivars + 16), v24);
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v9)
        {
          uint64_t v10 = OSMetaClassBase::GetClassName(this);
          *(void *)uint64_t registryEntryID = 0;
          IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
          uint64_t v12 = v24;
          uint64_t v11 = *(void *)registryEntryID;
          int v13 = (*(uint64_t (**)(void))(**((void **)this[1].ivars + 16) + 72))(*((void *)this[1].ivars
                                                                                               + 16));
          *(_DWORD *)uint64_t registryEntryID = 136315906;
          *(void *)&registryEntryID[4] = v10;
          __int16 v26 = 2048;
          uint64_t v27 = v11;
          __int16 v28 = 2048;
          int v29 = v12;
          __int16 v30 = 1024;
          int v31 = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Add element %p to output action array: %u\n", registryEntryID, 0x26u);
        }
        ((void (*)(OSAction *))v24->release)(v24);
        return v24;
      }
      if (v9)
      {
        uint64_t v22 = OSMetaClassBase::GetClassName(this);
        *(void *)uint64_t registryEntryID = 0;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
        uint64_t v23 = *(void *)registryEntryID;
        *(_DWORD *)uint64_t registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v22;
        __int16 v26 = 2048;
        uint64_t v27 = v23;
        __int16 v28 = 1024;
        LODWORD(v29) = -536870211;
        uint64_t v17 = "[%s 0x%llx] Out actions array setObject:%x\n";
        goto LABEL_21;
      }
    }
    return 0;
  }
  return Object;
}

uint64_t ___ZN13XboxHIDDevice18getAsyncSendActionEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice18getAsyncSendActionEv_block_invoke_128(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice18getAsyncSendActionEv_block_invoke_130(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice18getAsyncSendActionEv_block_invoke_132(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice12returnActionEP8OSAction_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice5resetEv_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice5resetEv_block_invoke_136(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t XboxHIDDevice::handlePayload(XboxHIDDevice *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return 0;
}

uint64_t non-virtual thunk to'XboxHIDDevice::handlePayload(XboxHIDDevice *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return 0;
}

uint64_t XboxHIDDevice::setReport(IOHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  uint64_t returnLength;
  unsigned char registryEntryID[12];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;

  uint64_t v8 = 3758097086;
  returnLength = 0;
  if (LOBYTE(this[1].IOService::OSObject::OSObjectInterface::__vftable[10].free))
  {
    uint64_t v8 = 3758097111;
    goto LABEL_15;
  }
  if (!a6)
  {
    uint64_t v8 = 3758097090;
    goto LABEL_15;
  }
  IOMemoryDescriptor::GetLength(a2, &returnLength);
  uint64_t v10 = this[1].IOService::OSObject::OSObjectInterface::__vftable;
  if (!v10[7].init || !LODWORD(v10[7].free))
  {
    uint64_t v8 = 3758097112;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v17 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = ClassName;
      __int16 v26 = 2048;
      uint64_t v27 = v17;
      uint32_t v18 = "[%s 0x%llx] Pipes not ready\n";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, registryEntryID, 0x16u);
    }
LABEL_15:
    IOHIDDevice::CompleteReport(this, a6, v8, 0, 0);
    return v8;
  }
  AsyncSendAction = XboxHIDDevice::getAsyncSendAction(this);
  if (!AsyncSendAction)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v20 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v20;
      uint32_t v18 = "[%s 0x%llx] No available action\n";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v12 = AsyncSendAction;
  Reference = OSAction::GetReference(AsyncSendAction);
  void *Reference = a6;
  Reference[1] = a2;
  ((void (*)(IOMemoryDescriptor *))a2->retain)(a2);
  ((void (*)(OSAction *))a6->retain)(a6);
  uint64_t v14 = IOUSBHostPipe::AsyncIO((IOUSBHostPipe *)this[1].IOService::OSObject::OSObjectInterface::__vftable[7].init, a2, returnLength, v12, 0, 0);
  uint64_t v8 = 0;
  if (v14)
  {
    uint64_t v21 = v14;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v23 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v22;
      __int16 v26 = 2048;
      uint64_t v27 = v23;
      __int16 v28 = 1024;
      int v29 = returnLength;
      __int16 v30 = 1024;
      int v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] _outPipe->AsyncIO(%d):0x%x\n", registryEntryID, 0x22u);
    }
    IOHIDDevice::CompleteReport(this, a6, v21, 0, 0);
    XboxHIDDevice::returnAction(this, v12);
    return v21;
  }
  return v8;
}

uint64_t ___ZN13XboxHIDDevice9setReportEP18IOMemoryDescriptor15IOHIDReportTypejjP8OSAction_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice9setReportEP18IOMemoryDescriptor15IOHIDReportTypejjP8OSAction_block_invoke_139(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN13XboxHIDDevice9setReportEP18IOMemoryDescriptor15IOHIDReportTypejjP8OSAction_block_invoke_141(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t non-virtual thunk to'XboxHIDDevice::setReport(XboxHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return XboxHIDDevice::setReport((IOHIDDevice *)((char *)this - 48), a2, a3, a4, a5, a6);
}

uint64_t ___ZN13XboxHIDDevice17copyStringAtIndexEht_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

BOOL Xbox360Gamepad::init(IOService *this)
{
  BOOL result = XboxHIDDevice::init(this);
  if (result && !this->ivars) {
    Xbox360Gamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'Xbox360Gamepad::init(Xbox360Gamepad *this)
{
  return Xbox360Gamepad::init((IOService *)((char *)this - 24));
}

void Xbox360Gamepad::free(IOService *this)
{
  uint64_t v2 = this[2].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 1uLL);
    this[2].OSObject::OSMetaClassBase::__vftable = 0;
  }
  XboxHIDDevice::free(this);
}

void non-virtual thunk to'Xbox360Gamepad::free(Xbox360Gamepad *this)
{
}

uint64_t Xbox360Gamepad::Start_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Start(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
  if (v3) {
    return v3;
  }
  uint64_t v4 = IOService::RegisterService(this, 0);
  if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v7 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] Could not register service: %{mach.errno}d\n", registryEntryID, 0x1Cu);
  }
  return v4;
}

uint64_t ___ZN14Xbox360Gamepad10Start_ImplEP9IOService_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t Xbox360Gamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
}

uint64_t Xbox360Gamepad::handlePayload(Xbox360Gamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return 0;
}

uint64_t non-virtual thunk to'Xbox360Gamepad::handlePayload(Xbox360Gamepad *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return 0;
}

uint64_t Xbox360Gamepad::getReport(Xbox360Gamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095;
}

uint64_t non-virtual thunk to'Xbox360Gamepad::getReport(Xbox360Gamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095;
}

uint64_t Xbox360Gamepad::setReport(IOHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  uint64_t returnLength;

  uint64_t v6 = 3758097090;
  returnLength = 0;
  if (a3 != kIOHIDReportTypeOutput) {
    return 3758097095;
  }
  IOMemoryDescriptor::GetLength(a2, &returnLength);
  if (a4 == 1)
  {
    if (returnLength != 3) {
      return v6;
    }
    return XboxHIDDevice::setReport(this, a2, kIOHIDReportTypeOutput, a4, a5, a6);
  }
  if (!(_BYTE)a4 && returnLength == 8) {
    return XboxHIDDevice::setReport(this, a2, kIOHIDReportTypeOutput, a4, a5, a6);
  }
  return v6;
}

uint64_t non-virtual thunk to'Xbox360Gamepad::setReport(Xbox360Gamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return Xbox360Gamepad::setReport((IOHIDDevice *)((char *)this - 48), a2, a3, a4, a5, a6);
}

OSDictionary *non-virtual thunk to'Xbox360Gamepad::newDeviceDescription(Xbox360Gamepad *this)
{
  return XboxHIDDevice::newDeviceDescription((Xbox360Gamepad *)((char *)this - 64));
}

OSDataPtr Xbox360Gamepad::newReportDescriptor(Xbox360Gamepad *this)
{
  return OSDataCreate(&Xbox360HIDGamepadDeviceDescriptor, 0xD4uLL);
}

OSDataPtr non-virtual thunk to'Xbox360Gamepad::newReportDescriptor(Xbox360Gamepad *this)
{
  return OSDataCreate(&Xbox360HIDGamepadDeviceDescriptor, 0xD4uLL);
}

BOOL XboxOneSGamepad::init(IOService *this)
{
  BOOL result = XboxWirelessGamepad::init(this);
  if (result && !this->ivars) {
    XboxOneSGamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxOneSGamepad::init(XboxOneSGamepad *this)
{
  return XboxOneSGamepad::init((IOService *)((char *)this - 24));
}

void non-virtual thunk to'XboxOneSGamepad::free(XboxOneSGamepad *this)
{
}

uint64_t XboxOneSGamepad::Start_Impl(IOService *this, IOService *a2)
{
  return IOService::Start(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxOneSGamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxOneSGamepad::handlePayload(XboxOneSGamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(XboxOneSGamepad *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*(void *)this + 56))(this, a2, a3, a4, 0, 0);
}

uint64_t non-virtual thunk to'XboxOneSGamepad::handlePayload(XboxOneSGamepad *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return (*(uint64_t (**)(void))(*((void *)this - 10) + 56))();
}

OSDataPtr XboxOneSGamepad::newReportDescriptor(XboxOneSGamepad *this)
{
  return OSDataCreate(&XboxOneSGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

OSDataPtr non-virtual thunk to'XboxOneSGamepad::newReportDescriptor(XboxOneSGamepad *this)
{
  return OSDataCreate(&XboxOneSGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

BOOL XboxSeriesXGamepad::init(IOService *this)
{
  BOOL result = XboxWirelessGamepad::init(this);
  if (result && !this->ivars) {
    XboxSeriesXGamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxSeriesXGamepad::init(XboxSeriesXGamepad *this)
{
  return XboxSeriesXGamepad::init((IOService *)((char *)this - 24));
}

void non-virtual thunk to'XboxSeriesXGamepad::free(XboxSeriesXGamepad *this)
{
}

uint64_t XboxSeriesXGamepad::Start_Impl(IOService *this, IOService *a2)
{
  return IOService::Start(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxSeriesXGamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxSeriesXGamepad::handlePayload(XboxSeriesXGamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(XboxSeriesXGamepad *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*(void *)this + 56))(this, a2, a3, a4, 0, 0);
}

uint64_t non-virtual thunk to'XboxSeriesXGamepad::handlePayload(XboxSeriesXGamepad *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return (*(uint64_t (**)(void))(*((void *)this - 10) + 56))();
}

OSDataPtr XboxSeriesXGamepad::newReportDescriptor(XboxSeriesXGamepad *this)
{
  return OSDataCreate(&XboxSeriesXGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

OSDataPtr non-virtual thunk to'XboxSeriesXGamepad::newReportDescriptor(XboxSeriesXGamepad *this)
{
  return OSDataCreate(&XboxSeriesXGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

BOOL XboxEliteV2Gamepad::init(IOService *this)
{
  BOOL result = XboxWirelessGamepad::init(this);
  if (result && !this->ivars) {
    XboxEliteV2Gamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxEliteV2Gamepad::init(XboxEliteV2Gamepad *this)
{
  return XboxEliteV2Gamepad::init((IOService *)((char *)this - 24));
}

void non-virtual thunk to'XboxEliteV2Gamepad::free(XboxEliteV2Gamepad *this)
{
}

uint64_t XboxEliteV2Gamepad::Start_Impl(IOService *this, IOService *a2)
{
  return IOService::Start(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxEliteV2Gamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxEliteV2Gamepad::handlePayload(XboxEliteV2Gamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(XboxEliteV2Gamepad *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*(void *)this + 56))(this, a2, a3, a4, 0, 0);
}

uint64_t non-virtual thunk to'XboxEliteV2Gamepad::handlePayload(XboxEliteV2Gamepad *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return (*(uint64_t (**)(void))(*((void *)this - 10) + 56))();
}

OSDataPtr XboxEliteV2Gamepad::newReportDescriptor(XboxEliteV2Gamepad *this)
{
  return OSDataCreate(&XboxEliteV2GamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

OSDataPtr non-virtual thunk to'XboxEliteV2Gamepad::newReportDescriptor(XboxEliteV2Gamepad *this)
{
  return OSDataCreate(&XboxEliteV2GamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

BOOL XboxWirelessGamepad::init(IOService *this)
{
  BOOL result = XboxHIDDevice::init(this);
  if (result && !this->ivars) {
    XboxWirelessGamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxWirelessGamepad::init(XboxWirelessGamepad *this)
{
  return XboxWirelessGamepad::init((IOService *)((char *)this - 24));
}

void XboxWirelessGamepad::free(IOService *this)
{
  uint64_t v2 = this[2].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 1uLL);
    this[2].OSObject::OSMetaClassBase::__vftable = 0;
  }
  XboxHIDDevice::free(this);
}

void non-virtual thunk to'XboxWirelessGamepad::free(XboxWirelessGamepad *this)
{
}

uint64_t XboxWirelessGamepad::Start_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Start(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
  if (v3) {
    return v3;
  }
  uint64_t v4 = IOService::RegisterService(this, 0);
  if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t registryEntryID = 0;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
    uint64_t v7 = *(void *)registryEntryID;
    *(_DWORD *)uint64_t registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] RegisterService:0x%x\n\n", registryEntryID, 0x1Cu);
  }
  return v4;
}

uint64_t ___ZN19XboxWirelessGamepad10Start_ImplEP9IOService_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t XboxWirelessGamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
}

uint64_t XboxWirelessGamepad::handlePayload(XboxWirelessGamepad *this, uint64_t a2, IOMemoryDescriptor *a3)
{
  return (*(uint64_t (**)(XboxWirelessGamepad *, uint64_t, IOMemoryDescriptor *, void, void, void))(*(void *)this + 56))(this, a2, a3, 0, 0, 0);
}

uint64_t non-virtual thunk to'XboxWirelessGamepad::handlePayload(XboxWirelessGamepad *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return (*(uint64_t (**)(void))(*((void *)this - 10) + 56))();
}

uint64_t XboxWirelessGamepad::getReport(XboxWirelessGamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095;
}

uint64_t non-virtual thunk to'XboxWirelessGamepad::getReport(XboxWirelessGamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095;
}

uint64_t XboxWirelessGamepad::setReport(IOHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  kern_return_t v12;
  IOMemoryMap *v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  kern_return_t Length;
  uint64_t Address;
  uint64_t v19;
  const char *ClassName;
  uint64_t v21;
  IOMemoryMap *map;
  uint64_t returnLength;
  unsigned char registryEntryID[12];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  kern_return_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;

  uint64_t v6 = 3758097090;
  map = 0;
  returnLength = 0;
  if (a3 != kIOHIDReportTypeOutput) {
    return 3758097095;
  }
  int v12 = IOMemoryDescriptor::CreateMapping(a2, 2uLL, 0, 0, 0, 0, &map, 0);
  int v13 = map;
  uint64_t v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v12 || !v13)
  {
    if (v14)
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v21 = *(void *)registryEntryID;
      *(_DWORD *)uint64_t registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = ClassName;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      __int16 v28 = 1024;
      int v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] CreateMapping:0x%x\n\n", registryEntryID, 0x1Cu);
    }
  }
  else
  {
    if (v14)
    {
      uint64_t v15 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t registryEntryID = 0;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0);
      uint64_t v16 = *(void *)registryEntryID;
      Length = IOMemoryMap::GetLength(map);
      Address = IOMemoryMap::GetAddress(map);
      int v19 = IOMemoryMap::GetLength(map);
      *(_DWORD *)uint64_t registryEntryID = 136316163;
      *(void *)&registryEntryID[4] = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 1040;
      int v29 = Length;
      __int16 v30 = 2097;
      int v31 = Address;
      uint64_t v32 = 2048;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s 0x%llx] %{private}.*P (%{bytes}llu)\n", registryEntryID, 0x30u);
      int v13 = map;
    }
    ((void (*)(IOMemoryMap *))v13->free)(v13);
  }
  IOMemoryDescriptor::GetLength(a2, &returnLength);
  if (a4 == 5)
  {
    if (returnLength != 5) {
      return v6;
    }
    return XboxHIDDevice::setReport(this, a2, kIOHIDReportTypeOutput, a4, a5, a6);
  }
  if (a4 == 1 && returnLength == 13) {
    return XboxHIDDevice::setReport(this, a2, kIOHIDReportTypeOutput, a4, a5, a6);
  }
  return v6;
}

uint64_t ___ZN19XboxWirelessGamepad9setReportEP18IOMemoryDescriptor15IOHIDReportTypejjP8OSAction_block_invoke(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t ___ZN19XboxWirelessGamepad9setReportEP18IOMemoryDescriptor15IOHIDReportTypejjP8OSAction_block_invoke_4(uint64_t a1)
{
  v1 = *(IOService **)(a1 + 32);
  uint64_t registryEntryID = 0;
  IOService::GetRegistryEntryID(v1, &registryEntryID, 0);
  return registryEntryID;
}

uint64_t non-virtual thunk to'XboxWirelessGamepad::setReport(XboxWirelessGamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return XboxWirelessGamepad::setReport((IOHIDDevice *)((char *)this - 48), a2, a3, a4, a5, a6);
}

OSDictionary *non-virtual thunk to'XboxWirelessGamepad::newDeviceDescription(XboxWirelessGamepad *this)
{
  return XboxHIDDevice::newDeviceDescription((XboxWirelessGamepad *)((char *)this - 64));
}

uint64_t XboxHIDDevice_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011048;
  return 0;
}

uint64_t XboxHIDDeviceMetaClass::New(XboxHIDDeviceMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011088;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100011140;
  *(void *)&a2[1].refcount = &off_100011160;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100011190;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000111B8;
  return 0;
}

uint64_t XboxHIDDevice::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxHIDDevice::_Dispatch(this, &v4, a3);
}

uint64_t XboxHIDDevice::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid > 0xE5C9619006DC5EFLL)
  {
    switch(msgid)
    {
      case 0xE5C9619006DC5F0:
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v13 = *(_OWORD *)&a2->message;
          uint64_t v14 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v13;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v12 = *a2;
        uint64_t v8 = (const OSMetaClass *)gOSAction_XboxHIDDevice_CompleteAsyncSendMetaClass;
        __int16 v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, IOReturn, uint32_t, uint64_t))XboxHIDDevice::CompleteAsyncSend_Impl;
        uint64_t v10 = &v12;
        break;
      case 0x4DC93D20F2BBA29ELL:
        if (!OSMetaClassBase::IsRemote(this))
        {
          IORPC v19 = *a2;
          return IOTimerDispatchSource::TimerOccurred_Invoke(&v19, this, (IOTimerDispatchSource::TimerOccurred_Handler)XboxHIDDevice::AsyncReadTimeoutOccurred_Impl, (const OSMetaClass *)gOSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass);
        }
        IORPC invoke = *a2;
        p_IORPC invoke = &invoke;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      case 0x60CC679B9C025AFELL:
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v17 = *(_OWORD *)&a2->message;
          uint64_t v18 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v17;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v15 = *(_OWORD *)&a2->message;
        uint64_t v16 = *(void *)&a2->sendSize;
        uint64_t v8 = (const OSMetaClass *)gOSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass;
        __int16 v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, IOReturn, uint32_t, uint64_t))XboxHIDDevice::CompleteAsyncReceive_Impl;
        uint64_t v10 = (IORPC *)&v15;
        break;
      default:
LABEL_14:
        IORPC v11 = *a2;
        return IOUserHIDDevice::_Dispatch(this, &v11);
    }
    return IOUSBHostPipe::CompleteAsyncIO_Invoke(v10, this, v9, v8);
  }
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v22 = *a2;
    return IOService::Stop_Invoke(&v22, this, (IOService::Stop_Handler)XboxHIDDevice::Stop_Impl);
  }
  if (msgid != 0xAB6F76DDE6D693F2)
  {
    if (msgid == 0xD200FDE7D57ECCA6)
    {
      IORPC rpc = *a2;
      return IOService::SetPowerState_Invoke(&rpc, this, (IOService::SetPowerState_Handler)XboxHIDDevice::SetPowerState_Impl);
    }
    goto LABEL_14;
  }
  IORPC v23 = *a2;
  return IOService::Start_Invoke(&v23, this, (IOService::Start_Handler)XboxHIDDevice::Start_Impl);
}

uint64_t XboxHIDDeviceMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxHIDDevice::CreateActionAsyncReadTimeoutOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x4DC93D20F2BBA29EuLL, 0xF4AB1C3CBB5AE47uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t XboxHIDDevice::CreateActionCompleteAsyncReceive(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_XboxHIDDevice_CompleteAsyncReceive");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x60CC679B9C025AFEuLL, 0xC320A3EEA932C04ALL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t XboxHIDDevice::CreateActionCompleteAsyncSend(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_XboxHIDDevice_CompleteAsyncSend");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0xE5C9619006DC5F0uLL, 0xC320A3EEA932C04ALL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011200;
  return 0;
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass::New(OSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011240;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100011288;
  return 0;
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceive_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_1000112A8;
  return 0;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass::New(OSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000112E8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100011330;
  return 0;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceive::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSend_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011350;
  return 0;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSendMetaClass::New(OSAction_XboxHIDDevice_CompleteAsyncSendMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011390;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000113D8;
  return 0;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSend::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSendMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred::getMetaClass(OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred *this)
{
  return gOSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceive::getMetaClass(OSAction_XboxHIDDevice_CompleteAsyncReceive *this)
{
  return gOSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSend::getMetaClass(OSAction_XboxHIDDevice_CompleteAsyncSend *this)
{
  return gOSAction_XboxHIDDevice_CompleteAsyncSendMetaClass;
}

uint64_t XboxUSBDevice_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011498;
  return 0;
}

uint64_t XboxUSBDeviceMetaClass::New(XboxUSBDeviceMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000114D8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100011520;
  return 0;
}

uint64_t XboxUSBDevice::Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxUSBDevice::_Dispatch(this, &v4, a3);
}

uint64_t XboxUSBDevice::_Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v8 = *a2;
    return IOService::Stop_Invoke(&v8, this, (IOService::Stop_Handler)XboxUSBDevice::Stop_Impl);
  }
  else if (msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxUSBDevice::Start_Impl);
  }
  else
  {
    IORPC v7 = *a2;
    return IOService::_Dispatch(this, &v7);
  }
}

uint64_t XboxUSBDeviceMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t Xbox360Gamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_1000115E0;
  return 0;
}

uint64_t Xbox360GamepadMetaClass::New(Xbox360GamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011620;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_1000116D8;
  *(void *)&a2[1].refcount = &off_1000116F8;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100011728;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011750;
  return 0;
}

uint64_t Xbox360Gamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return Xbox360Gamepad::_Dispatch(this, &v4, a3);
}

uint64_t Xbox360Gamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)Xbox360Gamepad::Stop_Impl);
  }
  else if (msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)Xbox360Gamepad::Start_Impl);
  }
  else
  {
    IORPC v8 = *a2;
    return XboxHIDDevice::_Dispatch(this, &v8, v5);
  }
}

uint64_t Xbox360GamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxWirelessGamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011838;
  return 0;
}

uint64_t XboxWirelessGamepadMetaClass::New(XboxWirelessGamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011878;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100011930;
  *(void *)&a2[1].refcount = &off_100011950;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100011980;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000119A8;
  return 0;
}

uint64_t XboxWirelessGamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxWirelessGamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxWirelessGamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxWirelessGamepad::Stop_Impl);
  }
  else if (msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxWirelessGamepad::Start_Impl);
  }
  else
  {
    IORPC v8 = *a2;
    return XboxHIDDevice::_Dispatch(this, &v8, v5);
  }
}

uint64_t XboxWirelessGamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxSeriesXGamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011A90;
  return 0;
}

uint64_t XboxSeriesXGamepadMetaClass::New(XboxSeriesXGamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011AD0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100011B88;
  *(void *)&a2[1].refcount = &off_100011BA8;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100011BD8;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011C00;
  return 0;
}

uint64_t XboxSeriesXGamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxSeriesXGamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxSeriesXGamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxSeriesXGamepad::Stop_Impl);
  }
  else if (msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxSeriesXGamepad::Start_Impl);
  }
  else
  {
    IORPC v8 = *a2;
    return XboxWirelessGamepad::_Dispatch(this, &v8, v5);
  }
}

uint64_t XboxSeriesXGamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxEliteV2Gamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011CE8;
  return 0;
}

uint64_t XboxEliteV2GamepadMetaClass::New(XboxEliteV2GamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011D28;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100011DE0;
  *(void *)&a2[1].refcount = &off_100011E00;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100011E30;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011E58;
  return 0;
}

uint64_t XboxEliteV2Gamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxEliteV2Gamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxEliteV2Gamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxEliteV2Gamepad::Stop_Impl);
  }
  else if (msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxEliteV2Gamepad::Start_Impl);
  }
  else
  {
    IORPC v8 = *a2;
    return XboxWirelessGamepad::_Dispatch(this, &v8, v5);
  }
}

uint64_t XboxEliteV2GamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxOneSGamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_100011F40;
  return 0;
}

uint64_t XboxOneSGamepadMetaClass::New(XboxOneSGamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100011F80;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100012038;
  *(void *)&a2[1].refcount = &off_100012058;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100012088;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000120B0;
  return 0;
}

uint64_t XboxOneSGamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxOneSGamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxOneSGamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxOneSGamepad::Stop_Impl);
  }
  else if (msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxOneSGamepad::Start_Impl);
  }
  else
  {
    IORPC v8 = *a2;
    return XboxWirelessGamepad::_Dispatch(this, &v8, v5);
  }
}

uint64_t XboxOneSGamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

void XboxUSBDevice::init()
{
}

void XboxHIDDevice::init()
{
}

void Xbox360Gamepad::init()
{
}

void XboxOneSGamepad::init()
{
}

void XboxSeriesXGamepad::init()
{
}

void XboxEliteV2Gamepad::init()
{
}

void XboxWirelessGamepad::init()
{
}

void IOFree(void *address, size_t length)
{
}

uint64_t IOMallocZeroTyped()
{
  return _IOMallocZeroTyped();
}

IORPCMessage *__cdecl IORPCMessageFromMach(IORPCMessageMach *msg, BOOL reply)
{
  return _IORPCMessageFromMach(msg, reply);
}

uint8_t IOUSBGetEndpointAddress(const IOUSBEndpointDescriptor *descriptor)
{
  return _IOUSBGetEndpointAddress(descriptor);
}

uint8_t IOUSBGetEndpointDirection(const IOUSBEndpointDescriptor *descriptor)
{
  return _IOUSBGetEndpointDirection(descriptor);
}

uint32_t IOUSBGetEndpointIntervalMicroframes(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  return _IOUSBGetEndpointIntervalMicroframes(usbDeviceSpeed, descriptor);
}

uint16_t IOUSBGetEndpointMaxPacketSize(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  return _IOUSBGetEndpointMaxPacketSize(usbDeviceSpeed, descriptor);
}

uint8_t IOUSBGetEndpointType(const IOUSBEndpointDescriptor *descriptor)
{
  return _IOUSBGetEndpointType(descriptor);
}

const IOUSBEndpointDescriptor *__cdecl IOUSBGetNextEndpointDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *interfaceDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  return _IOUSBGetNextEndpointDescriptor(configurationDescriptor, interfaceDescriptor, currentDescriptor);
}

OSDataPtr OSDataCreate(const void *bytes, size_t length)
{
  return _OSDataCreate(bytes, length);
}

OSDictionaryPtr OSDictionaryCreate(void)
{
  return _OSDictionaryCreate();
}

OSObjectPtr OSDictionaryGetValue(OSDictionaryPtr obj, const char *key)
{
  return _OSDictionaryGetValue(obj, key);
}

void OSDictionarySetStringValue(OSDictionaryPtr obj, const char *key, const char *value)
{
}

void OSDictionarySetUInt64Value(OSDictionaryPtr obj, const char *key, uint64_t value)
{
}

BOOL OSDictionarySetValue(OSDictionaryPtr obj, const char *key, OSObjectPtr value)
{
  return _OSDictionarySetValue(obj, key, value);
}

OSStringPtr OSStringCreate(const char *cstring, size_t length)
{
  return _OSStringCreate(cstring, length);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void IOUSBHostFreeDescriptor(const IOUSBDeviceDescriptor *descriptor)
{
}

void IOUSBHostFreeDescriptor(const IOUSBStringDescriptor *descriptor)
{
}

void IOUSBHostFreeDescriptor(const IOUSBConfigurationDescriptor *descriptor)
{
}

void IOHIDDevice::CompleteReport(IOHIDDevice *this, OSAction *action, IOReturn status, uint32_t actualByteCount, OSDispatchMethod supermethod)
{
}

uint64_t IOMemoryMap::GetAddress(IOMemoryMap *this)
{
  return IOMemoryMap::GetAddress(this);
}

uint64_t IOMemoryMap::GetLength(IOMemoryMap *this)
{
  return IOMemoryMap::GetLength(this);
}

OSDictionaryPtr OSDictionary::withCapacity(uint32_t capacity)
{
  return OSDictionary::withCapacity(capacity);
}

kern_return_t IOUSBHostPipe::ClearStall(IOUSBHostPipe *this, BOOL withRequest, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::ClearStall(this, withRequest, supermethod);
}

kern_return_t IOUSBHostPipe::CompleteAsyncIO_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUSBHostPipe::CompleteAsyncIO_Handler func, const OSMetaClass *targetActionClass)
{
  return IOUSBHostPipe::CompleteAsyncIO_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IOUSBHostPipe::IO(IOUSBHostPipe *this, IOMemoryDescriptor *dataBuffer, uint32_t dataBufferLength, uint32_t *bytesTransferred, uint32_t completionTimeoutMs, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::IO(this, dataBuffer, dataBufferLength, bytesTransferred, completionTimeoutMs, supermethod);
}

kern_return_t IOUSBHostPipe::AsyncIO(IOUSBHostPipe *this, IOMemoryDescriptor *dataBuffer, uint32_t dataBufferLength, OSAction *completion, uint32_t completionTimeoutMs, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::AsyncIO(this, dataBuffer, dataBufferLength, completion, completionTimeoutMs, supermethod);
}

kern_return_t IOUSBHostDevice::SetConfiguration(IOUSBHostDevice *this, uint8_t bConfigurationValue, BOOL matchInterfaces, OSDispatchMethod supermethod)
{
  return IOUSBHostDevice::SetConfiguration(this, bConfigurationValue, matchInterfaces, supermethod);
}

kern_return_t IOUSBHostDevice::Open(IOUSBHostDevice *this, IOService *forClient, IOOptionBits options, uintptr_t arg, OSDispatchMethod supermethod)
{
  return IOUSBHostDevice::Open(this, forClient, options, arg, supermethod);
}

kern_return_t IOUSBHostDevice::Close(IOUSBHostDevice *this, IOService *forClient, IOOptionBits options, OSDispatchMethod supermethod)
{
  return IOUSBHostDevice::Close(this, forClient, options, supermethod);
}

kern_return_t IOUSBHostDevice::Reset(IOUSBHostDevice *this, OSDispatchMethod supermethod)
{
  return IOUSBHostDevice::Reset(this, supermethod);
}

BOOL IOUserHIDDevice::handleStart(IOUserHIDDevice *this, IOService *provider)
{
  return IOUserHIDDevice::handleStart(this, provider);
}

kern_return_t IOUserHIDDevice::_Dispatch(IOUserHIDDevice *self, const IORPC *rpc)
{
  return IOUserHIDDevice::_Dispatch(self, rpc);
}

const char *__cdecl OSMetaClassBase::GetClassName(OSMetaClassBase *this)
{
  return OSMetaClassBase::GetClassName(this);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

kern_return_t OSMetaClassBase::Dispatch(OSMetaClassBase *this, IORPC *invoke)
{
  return OSMetaClassBase::Dispatch(this, invoke);
}

BOOL OSMetaClassBase::IsRemote(OSMetaClassBase *this)
{
  return OSMetaClassBase::IsRemote(this);
}

kern_return_t IODispatchSource::Cancel(IODispatchSource *this, IODispatchSourceCancelHandler handler, OSDispatchMethod supermethod)
{
  return IODispatchSource::Cancel(this, handler, supermethod);
}

kern_return_t IOMemoryDescriptor::CreateMapping(IOMemoryDescriptor *this, uint64_t options, uint64_t address, uint64_t offset, uint64_t length, uint64_t alignment, IOMemoryMap **map, OSDispatchMethod supermethod)
{
  return IOMemoryDescriptor::CreateMapping(this, options, address, offset, length, alignment, map, supermethod);
}

kern_return_t IOMemoryDescriptor::GetLength(IOMemoryDescriptor *this, uint64_t *returnLength)
{
  return IOMemoryDescriptor::GetLength(this, returnLength);
}

kern_return_t IOUSBHostInterface::CopyDevice(IOUSBHostInterface *this, IOUSBHostDevice **device, OSDispatchMethod supermethod)
{
  return IOUSBHostInterface::CopyDevice(this, device, supermethod);
}

kern_return_t IOUSBHostInterface::Open(IOUSBHostInterface *this, IOService *forClient, IOOptionBits options, uint8_t *arg, OSDispatchMethod supermethod)
{
  return IOUSBHostInterface::Open(this, forClient, options, arg, supermethod);
}

kern_return_t IOUSBHostInterface::Close(IOUSBHostInterface *this, IOService *forClient, IOOptionBits options, OSDispatchMethod supermethod)
{
  return IOUSBHostInterface::Close(this, forClient, options, supermethod);
}

kern_return_t IOUSBHostInterface::CopyPipe(IOUSBHostInterface *this, uint8_t address, IOUSBHostPipe **pipe, OSDispatchMethod supermethod)
{
  return IOUSBHostInterface::CopyPipe(this, address, pipe, supermethod);
}

kern_return_t IOTimerDispatchSource::SetHandler(IOTimerDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IOTimerDispatchSource::SetHandler(this, action, supermethod);
}

kern_return_t IOTimerDispatchSource::WakeAtTime(IOTimerDispatchSource *this, uint64_t options, uint64_t deadline, uint64_t leeway, OSDispatchMethod supermethod)
{
  return IOTimerDispatchSource::WakeAtTime(this, options, deadline, leeway, supermethod);
}

kern_return_t IOTimerDispatchSource::TimerOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOTimerDispatchSource::TimerOccurred_Handler func, const OSMetaClass *targetActionClass)
{
  return IOTimerDispatchSource::TimerOccurred_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IOTimerDispatchSource::Create(IODispatchQueue *queue, IOTimerDispatchSource **source)
{
  return IOTimerDispatchSource::Create(queue, source);
}

OSArrayPtr OSArray::withCapacity(uint32_t capacity)
{
  return OSArray::withCapacity(capacity);
}

BOOL OSArray::setObject(OSArray *this, const OSMetaClassBase *anObject)
{
  return OSArray::setObject(this, anObject);
}

void *__cdecl OSAction::GetReference(OSAction *this)
{
  return OSAction::GetReference(this);
}

kern_return_t OSAction::CreateWithTypeName(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSString *typeName, OSAction **action)
{
  return OSAction::CreateWithTypeName(target, targetmsgid, msgid, referenceSize, typeName, action);
}

kern_return_t OSAction::Cancel(OSAction *this, OSActionCancelHandler handler)
{
  return OSAction::Cancel(this, handler);
}

kern_return_t OSAction::_Dispatch(OSAction *self, const IORPC *rpc)
{
  return OSAction::_Dispatch(self, rpc);
}

kern_return_t OSObject::CopyDispatchQueue(OSObject *this, const IODispatchQueueName name, IODispatchQueue **queue, OSDispatchMethod supermethod)
{
  return OSObject::CopyDispatchQueue(this, name, queue, supermethod);
}

OSStringPtr OSString::withCString(const char *cString)
{
  return OSString::withCString(cString);
}

kern_return_t IOService::Stop_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Stop_Handler func)
{
  return IOService::Stop_Invoke(rpc, target, func);
}

kern_return_t IOService::Start_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Start_Handler func)
{
  return IOService::Start_Invoke(rpc, target, func);
}

kern_return_t IOService::SetPowerState(IOService *this, uint32_t powerFlags, OSDispatchMethod supermethod)
{
  return IOService::SetPowerState(this, powerFlags, supermethod);
}

kern_return_t IOService::SetProperties(IOService *this, OSDictionary *properties, OSDispatchMethod supermethod)
{
  return IOService::SetProperties(this, properties, supermethod);
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

kern_return_t IOService::SetPowerState_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SetPowerState_Handler func)
{
  return IOService::SetPowerState_Invoke(rpc, target, func);
}

kern_return_t IOService::Stop(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Stop(this, provider, supermethod);
}

void IOService::free(IOService *this)
{
}

BOOL IOService::init(IOService *this)
{
  return IOService::init(this);
}

kern_return_t IOService::Start(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Start(this, provider, supermethod);
}

kern_return_t IOService::_Dispatch(IOService *self, const IORPC *rpc)
{
  return IOService::_Dispatch(self, rpc);
}

kern_return_t IOUSBHostPipe::GetSpeed(const IOUSBHostPipe *this, uint8_t *speed, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::GetSpeed(this, speed, supermethod);
}

OSObject *__cdecl OSArray::getObject(const OSArray *this, uint32_t index)
{
  return OSArray::getObject(this, index);
}

uint8_t OSNumber::unsigned8BitValue(const OSNumber *this)
{
  return OSNumber::unsigned8BitValue(this);
}

uint64_t OSNumber::unsigned64BitValue(const OSNumber *this)
{
  return OSNumber::unsigned64BitValue(this);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}