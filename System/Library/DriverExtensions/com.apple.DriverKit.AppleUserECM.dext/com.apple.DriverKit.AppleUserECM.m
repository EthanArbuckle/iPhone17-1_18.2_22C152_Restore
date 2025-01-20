uint64_t AppleUserECMData::Start_Impl(IOService *this, IOService *a2)
{
  OSMetaClassBase *v4;
  OSMetaClassBase *v5;
  uint64_t v6;
  const IOUSBConfigurationDescriptor *v7;
  AppleUserECMData *v8;
  const IOUSBInterfaceDescriptor *v9;
  BOOL matched;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  const char *v15;
  int v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v16 = 0;
  IOParseBootArgNumber("AppleUserECM-debug", &v16, 4);
  if (v16)
  {
    v13 = 3758097084;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    *(_DWORD *)buf = 136315650;
    v18 = "AppleUserECMData.cpp";
    v19 = 1024;
    v20 = 61;
    v21 = 2080;
    v22 = "(debugMask & kAppleUserECMDebugDisabled) == 0";
    v15 = "[%s:%d] Assertion failed: %s.  driver disabled via boot-arg; aborting\n\n";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 0x1Cu);
    return v13;
  }
  v4 = OSMetaClassBase::safeMetaCast(a2, gIOUSBHostInterfaceMetaClass);
  if (!v4)
  {
    v13 = 3758097084;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    *(_DWORD *)buf = 136315650;
    v18 = "AppleUserECMData.cpp";
    v19 = 1024;
    v20 = 64;
    v21 = 2080;
    v22 = "interface != NULL";
    v15 = "[%s:%d] Assertion failed: %s.  AppleUserECMData failed start. interface == NULL\n\n";
    goto LABEL_16;
  }
  v5 = v4;
  v6 = ((uint64_t (*)(OSMetaClassBase *))v4->__vftable[1].release)(v4);
  if (!v6)
  {
    v13 = 3758097084;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    *(_DWORD *)buf = 136315650;
    v18 = "AppleUserECMData.cpp";
    v19 = 1024;
    v20 = 67;
    v21 = 2080;
    v22 = "configurationDescriptor != NULL";
    v15 = "[%s:%d] Assertion failed: %s.  AppleUserECMData failed start. configurationDescriptor == NULL\n\n";
    goto LABEL_16;
  }
  v7 = (const IOUSBConfigurationDescriptor *)v6;
  v8 = (AppleUserECMData *)((uint64_t (*)(OSMetaClassBase *, uint64_t))v5->__vftable[1].isEqualTo)(v5, v6);
  if (v8)
  {
    v9 = (const IOUSBInterfaceDescriptor *)v8;
    matched = AppleUserECMData::matchControlInterfaceWithUnionFunctionalDescriptor(v8, v7, (const IOUSBInterfaceDescriptor *)v8);
    v11 = matched;
    v12 = AppleUserECMData::matchControlInterfaceWithInterfaceAssociationDescriptor((AppleUserECMData *)matched, v7, v9);
    if (v11 || v12) {
      v13 = IOService::Start(this, a2, (OSDispatchMethod)&IOService::_Dispatch);
    }
    else {
      v13 = 3758097084;
    }
  }
  else
  {
    v13 = 3758097084;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "AppleUserECMData.cpp";
      v19 = 1024;
      v20 = 70;
      v21 = 2080;
      v22 = "myInterfaceDescriptor != NULL";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s:%d] Assertion failed: %s.  AppleUserECMData failed start. myInterfaceDescriptor == NULL\n\n", buf, 0x1Cu);
    }
  }
  IOUSBHostFreeDescriptor(v7);
  return v13;
}

BOOL AppleUserECMData::matchControlInterfaceWithUnionFunctionalDescriptor(AppleUserECMData *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *a3)
{
  InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(configurationDescriptor, 0);
  BOOL v6 = InterfaceDescriptor != 0;
  if (InterfaceDescriptor)
  {
    v7 = (const IOUSBDescriptorHeader *)InterfaceDescriptor;
    do
    {
      if (v7[2].bDescriptorType == 2 && v7[3].bLength == 6)
      {
        v8 = configurationDescriptor;
        v9 = v7;
        v10 = 0;
        while (1)
        {
          AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType(v8, v9, v10, 0x24u);
          v10 = AssociatedDescriptorWithType;
          if (!AssociatedDescriptorWithType) {
            break;
          }
          if (AssociatedDescriptorWithType->bLength >= 4u && AssociatedDescriptorWithType[1].bLength == 6)
          {
            int bLength = AssociatedDescriptorWithType[2].bLength;
            if (bLength == a3->bInterfaceNumber)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v13 = v7[1].bLength;
                v15[0] = 67109376;
                v15[1] = bLength;
                __int16 v16 = 1024;
                int v17 = v13;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleUserECMData interface %d belongs to ECM, matched with UNF (%d)\n", (uint8_t *)v15, 0xEu);
              }
              return v6;
            }
          }
          v8 = configurationDescriptor;
          v9 = v7;
        }
      }
      v7 = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceDescriptor(configurationDescriptor, v7);
      BOOL v6 = v7 != 0;
    }
    while (v7);
  }
  return v6;
}

BOOL AppleUserECMData::matchControlInterfaceWithInterfaceAssociationDescriptor(AppleUserECMData *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *a3)
{
  InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor(configurationDescriptor, 0);
  BOOL v6 = InterfaceAssociationDescriptor != 0;
  if (InterfaceAssociationDescriptor)
  {
    while (1)
    {
      if (InterfaceAssociationDescriptor[2].bLength == 2 && InterfaceAssociationDescriptor[2].bDescriptorType == 6)
      {
        int bInterfaceNumber = a3->bInterfaceNumber;
        if (bInterfaceNumber - 1 == InterfaceAssociationDescriptor[1].bLength
          && InterfaceAssociationDescriptor[1].bDescriptorType == 2)
        {
          break;
        }
      }
      InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor(configurationDescriptor, InterfaceAssociationDescriptor);
      BOOL v6 = InterfaceAssociationDescriptor != 0;
      if (!InterfaceAssociationDescriptor) {
        return v6;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = bInterfaceNumber;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleUserECMData interface %d belongs to ECM, matched with IAD\n", (uint8_t *)v9, 8u);
    }
  }
  return v6;
}

uint64_t AppleUserECM::init(AppleUserECM *this)
{
  uint64_t result = IOMallocZeroTyped();
  *((void *)this + 9) = result;
  if (result)
  {
    uint64_t result = IOUserNetworkEthernet::init((IOUserNetworkEthernet *)this);
    if (result)
    {
      IOParseBootArgNumber("AppleUserECM-debug", *((void **)this + 9), 4);
      **((_DWORD **)this + 9) |= 2u;
      *(_DWORD *)(*((void *)this + 9) + 316) = 1518;
      *(_WORD *)(*((void *)this + 9) + 324) = 12;
      return 1;
    }
  }
  return result;
}

uint64_t non-virtual thunk to'AppleUserECM::init(AppleUserECM *this)
{
  return AppleUserECM::init((AppleUserECM *)((char *)this - 24));
}

void AppleUserECM::free(IOUserNetworkEthernet *this)
{
  v2 = *(unsigned char **)&this[1].refcount;
  if (v2)
  {
    if ((*v2 & 8) == 0
      || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
      || (int v3 = 136315394,
          v4 = "AppleUserECM",
          __int16 v5 = 2080,
          BOOL v6 = "free",
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v3, 0x16u), (v2 = *(unsigned char **)&this[1].refcount) != 0))
    {
      IOFree(v2, 0x158uLL);
      *(void *)&this[1].refcount = 0;
    }
  }
  IOUserNetworkEthernet::free(this);
}

void non-virtual thunk to'AppleUserECM::free(AppleUserECM *this)
{
}

uint64_t AppleUserECM::Start_Impl(IOService *this, IOService *provider)
{
  v38 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  memset(&v37, 0, sizeof(v37));
  v4 = this[1].OSObject::OSObjectInterface::__vftable;
  if (((uint64_t)v4->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "AppleUserECM";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Start_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  int init = (int)v4->init;
  if ((uint64_t)v4->init)
  {
    uint64_t v8 = 3758097131;
    if ((init & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "AppleUserECM";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Start_Impl";
      v9 = "%s::%s: driver disabled via boot-arg; aborting\n";
      uint32_t v10 = 22;
LABEL_53:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      return v8;
    }
    return v8;
  }
  uint64_t v6 = IOService::Start(this, provider, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
  v7 = this[1].OSObject::OSObjectInterface::__vftable;
  if (v6)
  {
    uint64_t v8 = v6;
    if (v7 && ((uint64_t)v7->init & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "AppleUserECM";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Start_Impl";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v8;
      v9 = "%s::%s: Start(provider, SUPERDISPATCH) returned 0x%08x\n";
LABEL_52:
      uint32_t v10 = 28;
      goto LABEL_53;
    }
    return v8;
  }
  uint64_t ActionTxPacketsAvailable = OSObject::CopyDispatchQueue(this, "Default", (IODispatchQueue **)&v7->free, 0);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = IODispatchQueue::Create("AppleUserECMRxDispatchQueue", 0, 0, (IODispatchQueue **)&this[1].OSObject::OSObjectInterface::__vftable[1]);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = OSObject::SetDispatchQueue(this, "rxDispatchQueue", (IODispatchQueue *)this[1].OSObject::OSObjectInterface::__vftable[1].init, 0);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  this[1].OSObject::OSObjectInterface::__vftable[1].free = (void (__cdecl *)(OSObjectInterface *__hidden))OSMetaClassBase::safeMetaCast(provider, gIOUSBHostInterfaceMetaClass);
  free = this[1].OSObject::OSObjectInterface::__vftable[1].free;
  if (!free)
  {
    uint64_t v8 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "AppleUserECM.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 247;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "ivars->controlInterface != NULL";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%s:%d] Assertion failed: %s.  provider not an IOUSBHostInterface\n", buf, 0x1Cu);
      uint64_t v8 = 0;
    }
    goto LABEL_48;
  }
  (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)free + 8))(free);
  uint64_t DataInterface = AppleUserECM::findDataInterface((AppleUserECM *)this, (IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[1].free, (IOUSBHostInterface **)&this[1].OSObject::OSObjectInterface::__vftable[2]);
  if (DataInterface)
  {
    uint64_t v8 = DataInterface;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 251;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to find dataInterface\n";
    goto LABEL_80;
  }
  uint64_t v14 = IOUSBHostInterface::Open((IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[1].free, this, 0, 0, 0);
  if (v14)
  {
    uint64_t v8 = v14;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 254;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to open our control interface\n";
    goto LABEL_80;
  }
  uint64_t v15 = IOUSBHostInterface::Open((IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[2].init, this, 0, 0, 0);
  if (v15)
  {
    uint64_t v8 = v15;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 257;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to open our data interface\n";
    goto LABEL_80;
  }
  uint64_t v16 = IOUSBHostInterface::SelectAlternateSetting((IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[2].init, 0, 0);
  if (v16)
  {
    uint64_t v8 = v16;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 260;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to select alt setting 0\n\n";
    goto LABEL_80;
  }
  uint64_t v17 = IOUSBHostInterface::SelectAlternateSetting((IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[2].init, (uint8_t)this[1].OSObject::OSObjectInterface::__vftable[4].init, 0);
  if (v17)
  {
    uint64_t v8 = v17;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    int init_low = LOBYTE(this[1].OSObject::OSObjectInterface::__vftable[4].init);
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 263;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    __int16 v40 = 1024;
    int v41 = init_low;
    v34 = "[%s:%d] Assertion failed: %s.  failed to select alt setting %d\n\n";
    uint32_t v36 = 34;
LABEL_81:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_47;
  }
  uint64_t ActionTxPacketsAvailable = AppleUserECM::activate((AppleUserECM *)this);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  AppleUserECM::updateEthernetPacketFilter((AppleUserECM *)this);
  uint64_t FunctionalDescriptors = AppleUserECM::getFunctionalDescriptors((AppleUserECM *)this);
  if (FunctionalDescriptors)
  {
    uint64_t v8 = FunctionalDescriptors;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 273;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to parse functional descriptors\n";
    goto LABEL_80;
  }
  v19 = this[1].OSObject::OSObjectInterface::__vftable;
  if (((uint64_t)v19->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = BYTE4(v19[19].init);
    int v21 = BYTE5(v19[19].init);
    int v22 = BYTE6(v19[19].init);
    int init_high = HIBYTE(v19[19].init);
    int free_low = LOBYTE(v19[19].free);
    int v25 = BYTE1(v19[19].free);
    *(_DWORD *)buf = 136316930;
    *(void *)&buf[4] = "AppleUserECM";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Start_Impl";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v20;
    __int16 v40 = 1024;
    int v41 = v21;
    __int16 v42 = 1024;
    int v43 = v22;
    __int16 v44 = 1024;
    int v45 = init_high;
    __int16 v46 = 1024;
    int v47 = free_low;
    __int16 v48 = 1024;
    int v49 = v25;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: Calling RegisterEthernetInterface(MAC address = %02x:%02x:%02x:%02x:%02x:%02x\n", buf, 0x3Au);
    v19 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  v37.packetCount = (uint32_t)v19[21].init;
  v37.bufferCount = v37.packetCount;
  *(void *)&v37.bufferSize = 0x100000800;
  v37.poolFlags = 0x10000000;
  uint64_t v26 = IOUserNetworkPacketBufferPool::CreateWithOptions(0, "AppleUserECM", &v37, (IOUserNetworkPacketBufferPool **)&v19[15]);
  if (v26)
  {
    uint64_t v8 = v26;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 296;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkPacketBufferPool\n";
    goto LABEL_80;
  }
  uint64_t v27 = IOUserNetworkTxCompletionQueue::Create((IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init, this, (uint32_t)this[1].OSObject::OSObjectInterface::__vftable[20].free, 0, (IODispatchQueue *)this[1].free, (IOUserNetworkTxCompletionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[16]);
  if (v27)
  {
    uint64_t v8 = v27;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 306;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkTxCompletionQueue\n";
    goto LABEL_80;
  }
  uint64_t v28 = IOUserNetworkTxSubmissionQueue::Create((IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init, this, (uint32_t)this[1].OSObject::OSObjectInterface::__vftable[20].free, 0, (IODispatchQueue *)this[1].free, (IOUserNetworkTxSubmissionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[15].free);
  if (v28)
  {
    uint64_t v8 = v28;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 314;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkTxSubmissionQueue\n";
    goto LABEL_80;
  }
  uint64_t ActionTxPacketsAvailable = AppleUserECM::CreateActionTxPacketsAvailable(this, 8uLL, (OSAction **)&this[1].OSObject::OSObjectInterface::__vftable[17].free);
  if (ActionTxPacketsAvailable
    || (uint64_t ActionTxPacketsAvailable = (*(uint64_t (**)(void (__cdecl *)(OSObjectInterface *__hidden), IODataQueueDispatchSource **))(*(void *)this[1].OSObject::OSObjectInterface::__vftable[15].free + 72))(this[1].OSObject::OSObjectInterface::__vftable[15].free, &v38), ActionTxPacketsAvailable))
  {
LABEL_55:
    uint64_t v8 = ActionTxPacketsAvailable;
    goto LABEL_47;
  }
  uint64_t v8 = IODataQueueDispatchSource::SetDataAvailableHandler(v38, (OSAction *)this[1].OSObject::OSObjectInterface::__vftable[17].free, 0);
  if (v38)
  {
    ((void (*)(IODataQueueDispatchSource *))v38->release)(v38);
    v38 = 0;
  }
  if (v8) {
    goto LABEL_47;
  }
  uint64_t v29 = IOUserNetworkRxSubmissionQueue::Create((IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init, this, HIDWORD(this[1].OSObject::OSObjectInterface::__vftable[20].free), 0, (IODispatchQueue *)this[1].free, (IOUserNetworkRxSubmissionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[16].free);
  if (v29)
  {
    uint64_t v8 = v29;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 334;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkRxSubmissionQueue\n";
    goto LABEL_80;
  }
  uint64_t v30 = IOUserNetworkRxCompletionQueue::Create((IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init, this, HIDWORD(this[1].OSObject::OSObjectInterface::__vftable[20].free), 0, (IODispatchQueue *)this[1].free, (IOUserNetworkRxCompletionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[17]);
  if (v30)
  {
    uint64_t v8 = v30;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 342;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkRxCompletionQueue\n";
LABEL_80:
    uint32_t v36 = 28;
    goto LABEL_81;
  }
  uint64_t ActionTxPacketsAvailable = AppleUserECM::CreateActionRxPacketsAvailable(this, 8uLL, (OSAction **)&this[1].OSObject::OSObjectInterface::__vftable[18]);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = (*(uint64_t (**)(void (__cdecl *)(OSObjectInterface *__hidden), IODataQueueDispatchSource **))(*(void *)this[1].OSObject::OSObjectInterface::__vftable[16].free + 72))(this[1].OSObject::OSObjectInterface::__vftable[16].free, &v38);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t v8 = IODataQueueDispatchSource::SetDataAvailableHandler(v38, (OSAction *)this[1].OSObject::OSObjectInterface::__vftable[18].init, 0);
  if (v38)
  {
    ((void (*)(IODataQueueDispatchSource *))v38->release)(v38);
    v38 = 0;
  }
  if (v8) {
    goto LABEL_47;
  }
  *(_OWORD *)buf = xmmword_10000A150;
  *(void *)&buf[16] = 0x10003600100030;
  *(_DWORD *)&buf[24] = 1048631;
  uint64_t ActionTxPacketsAvailable = ((uint64_t (*)(IOService *, unsigned char *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[1].release)(this, buf, 7);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = IOUserNetworkEthernet::SelectMediaType((IOUserNetworkEthernet *)this, 0x22u, 0);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = IOUserNetworkEthernet::SetSoftwareVlanSupport((IOUserNetworkEthernet *)this, 1);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  v31 = this[1].OSObject::OSObjectInterface::__vftable;
  long long v50 = *(_OWORD *)&v31[15].free;
  long long v51 = *(_OWORD *)&v31[16].free;
  uint64_t ActionTxPacketsAvailable = ((uint64_t (*)(IOService *, unint64_t, BOOL (__cdecl *)(OSObjectInterface *__hidden), long long *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[1].getMetaClass)(this, HIDWORD(v31[19].init) | ((unint64_t)LOWORD(v31[19].free) << 32), v31[15].init, &v50, 4);
  if (ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t v8 = IOService::RegisterService(this, 0);
  if (v8) {
LABEL_47:
  }
    IOService::Stop(this, provider, 0);
LABEL_48:
  v32 = this[1].OSObject::OSObjectInterface::__vftable;
  if (v32 && ((uint64_t)v32->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Start_Impl";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v8;
    v9 = "%s::%s: 0x%08x\n";
    goto LABEL_52;
  }
  return v8;
}

uint64_t AppleUserECM::findDataInterface(AppleUserECM *this, IOUSBHostInterface *a2, IOUSBHostInterface **a3)
{
  interface = 0;
  device = 0;
  uintptr_t ref = 0;
  unsigned __int8 v30 = -1;
  uint64_t v6 = (unsigned char *)*((void *)this + 9);
  if (v6 && (*v6 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "AppleUserECM";
    __int16 v36 = 2080;
    IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }
  uint64_t v7 = 3758097136;
  if (a3)
  {
    uint64_t v8 = (const IOUSBConfigurationDescriptor *)((uint64_t (*)(IOUSBHostInterface *))a2->CopyConfigurationDescriptor)(a2);
    if (v8)
    {
      uint64_t v9 = ((uint64_t (*)(IOUSBHostInterface *, const IOUSBConfigurationDescriptor *))a2->GetInterfaceDescriptor)(a2, v8);
      if (v9)
      {
        uint32_t v10 = (const IOUSBDescriptorHeader *)v9;
        *(unsigned char *)(*((void *)this + 9) + 65) = *(unsigned char *)(v9 + 2);
        uint64_t v11 = IOUSBHostInterface::CopyDevice(a2, &device, 0);
        if (v11 || (uint64_t v11 = IOUSBHostDevice::CreateInterfaceIterator(device, &ref, 0), v11))
        {
          uint64_t v7 = v11;
        }
        else
        {
          BOOL DataInterfaceWithUnionFunctionalDescriptor = AppleUserECM::findDataInterfaceWithUnionFunctionalDescriptor(this, v8, v10, &v30);
          BOOL DataInterfaceWithInterfaceAssociationDescriptor = AppleUserECM::findDataInterfaceWithInterfaceAssociationDescriptor(this, v8, (const IOUSBInterfaceDescriptor *)v10, &v30);
          if (DataInterfaceWithUnionFunctionalDescriptor || DataInterfaceWithInterfaceAssociationDescriptor)
          {
            uint64_t v7 = IOUSBHostDevice::CopyInterface(device, ref, &interface, 0);
            if (!v7)
            {
              uint64_t v14 = interface;
              if (interface)
              {
                while (1)
                {
                  uint64_t v15 = ((uint64_t (*)(IOUSBHostInterface *, const IOUSBConfigurationDescriptor *))v14->GetInterfaceDescriptor)(v14, v8);
                  if (v15)
                  {
                    InterfaceDescriptor = (const IOUSBDescriptorHeader *)v15;
                    uint64_t v17 = (unsigned char *)*((void *)this + 9);
                    if (v17)
                    {
                      if ((*v17 & 8) == 0
                        || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
                        || (*(_DWORD *)buf = 136315394,
                            v35 = "AppleUserECM",
                            __int16 v36 = 2080,
                            IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface",
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: ----------------------\n", buf, 0x16u), (uint64_t v17 = (unsigned char *)*((void *)this + 9)) != 0))
                      {
                        if ((*v17 & 8) == 0) {
                          goto LABEL_76;
                        }
                        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_76;
                        }
                        int bLength = InterfaceDescriptor->bLength;
                        *(_DWORD *)buf = 136315650;
                        v35 = "AppleUserECM";
                        __int16 v36 = 2080;
                        IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                        __int16 v38 = 1024;
                        int v39 = bLength;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bLength = 0x%x", buf, 0x1Cu);
                        uint64_t v17 = (unsigned char *)*((void *)this + 9);
                        if (v17)
                        {
LABEL_76:
                          if ((*v17 & 8) == 0) {
                            goto LABEL_77;
                          }
                          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                            goto LABEL_77;
                          }
                          int bDescriptorType = InterfaceDescriptor->bDescriptorType;
                          *(_DWORD *)buf = 136315650;
                          v35 = "AppleUserECM";
                          __int16 v36 = 2080;
                          IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                          __int16 v38 = 1024;
                          int v39 = bDescriptorType;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bDescriptorType = 0x%x", buf, 0x1Cu);
                          uint64_t v17 = (unsigned char *)*((void *)this + 9);
                          if (v17)
                          {
LABEL_77:
                            if ((*v17 & 8) == 0) {
                              goto LABEL_78;
                            }
                            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_78;
                            }
                            int v20 = InterfaceDescriptor[1].bLength;
                            *(_DWORD *)buf = 136315650;
                            v35 = "AppleUserECM";
                            __int16 v36 = 2080;
                            IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                            __int16 v38 = 1024;
                            int v39 = v20;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bInterfaceNumber = 0x%x", buf, 0x1Cu);
                            uint64_t v17 = (unsigned char *)*((void *)this + 9);
                            if (v17)
                            {
LABEL_78:
                              if ((*v17 & 8) == 0) {
                                goto LABEL_79;
                              }
                              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_79;
                              }
                              int v21 = InterfaceDescriptor[1].bDescriptorType;
                              *(_DWORD *)buf = 136315650;
                              v35 = "AppleUserECM";
                              __int16 v36 = 2080;
                              IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                              __int16 v38 = 1024;
                              int v39 = v21;
                              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: bAlternateSetting = 0x%x", buf, 0x1Cu);
                              uint64_t v17 = (unsigned char *)*((void *)this + 9);
                              if (v17)
                              {
LABEL_79:
                                if ((*v17 & 8) == 0) {
                                  goto LABEL_80;
                                }
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_80;
                                }
                                int v22 = InterfaceDescriptor[2].bLength;
                                *(_DWORD *)buf = 136315650;
                                v35 = "AppleUserECM";
                                __int16 v36 = 2080;
                                IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                __int16 v38 = 1024;
                                int v39 = v22;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: bNumEndpoints = 0x%x", buf, 0x1Cu);
                                uint64_t v17 = (unsigned char *)*((void *)this + 9);
                                if (v17)
                                {
LABEL_80:
                                  if ((*v17 & 8) == 0) {
                                    goto LABEL_81;
                                  }
                                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                    goto LABEL_81;
                                  }
                                  int v23 = InterfaceDescriptor[2].bDescriptorType;
                                  *(_DWORD *)buf = 136315650;
                                  v35 = "AppleUserECM";
                                  __int16 v36 = 2080;
                                  IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                  __int16 v38 = 1024;
                                  int v39 = v23;
                                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: bInterfaceClass = 0x%x", buf, 0x1Cu);
                                  uint64_t v17 = (unsigned char *)*((void *)this + 9);
                                  if (v17)
                                  {
LABEL_81:
                                    if ((*v17 & 8) == 0) {
                                      goto LABEL_82;
                                    }
                                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                      goto LABEL_82;
                                    }
                                    int v24 = InterfaceDescriptor[3].bLength;
                                    *(_DWORD *)buf = 136315650;
                                    v35 = "AppleUserECM";
                                    __int16 v36 = 2080;
                                    IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                    __int16 v38 = 1024;
                                    int v39 = v24;
                                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: bInterfaceSubClass = 0x%x", buf, 0x1Cu);
                                    uint64_t v17 = (unsigned char *)*((void *)this + 9);
                                    if (v17)
                                    {
LABEL_82:
                                      if ((*v17 & 8) == 0) {
                                        goto LABEL_83;
                                      }
                                      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                        goto LABEL_83;
                                      }
                                      int v25 = InterfaceDescriptor[3].bDescriptorType;
                                      *(_DWORD *)buf = 136315650;
                                      v35 = "AppleUserECM";
                                      __int16 v36 = 2080;
                                      IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                      __int16 v38 = 1024;
                                      int v39 = v25;
                                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: bInterfaceProtocol = 0x%x", buf, 0x1Cu);
                                      uint64_t v17 = (unsigned char *)*((void *)this + 9);
                                      if (v17)
                                      {
LABEL_83:
                                        if ((*v17 & 8) != 0
                                          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                        {
                                          int v26 = InterfaceDescriptor[4].bLength;
                                          *(_DWORD *)buf = 136315650;
                                          v35 = "AppleUserECM";
                                          __int16 v36 = 2080;
                                          IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                          __int16 v38 = 1024;
                                          int v39 = v26;
                                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: iInterface = 0x%x", buf, 0x1Cu);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    if (InterfaceDescriptor[2].bDescriptorType == 10
                      && !InterfaceDescriptor[3].bLength
                      && !InterfaceDescriptor[3].bDescriptorType
                      && InterfaceDescriptor[1].bLength == v30)
                    {
                      break;
                    }
                  }
                  if (interface)
                  {
                    ((void (*)(IOUSBHostInterface *))interface->release)(interface);
                    interface = 0;
                  }
                  uint64_t v7 = IOUSBHostDevice::CopyInterface(device, ref, &interface, 0);
                  uint64_t v14 = interface;
                  if (v7) {
                    BOOL v27 = 1;
                  }
                  else {
                    BOOL v27 = interface == 0;
                  }
                  if (v27) {
                    goto LABEL_57;
                  }
                }
                *a3 = interface;
                while (InterfaceDescriptor[2].bLength != 2)
                {
                  InterfaceDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceDescriptor(v8, InterfaceDescriptor);
                  if (!InterfaceDescriptor)
                  {
                    uint64_t v7 = 3758097136;
                    goto LABEL_57;
                  }
                }
                uint64_t v29 = (unsigned char *)*((void *)this + 9);
                if ((*v29 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v35 = "AppleUserECM";
                  __int16 v36 = 2080;
                  IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: alt setting found\n", buf, 0x16u);
                  uint64_t v29 = (unsigned char *)*((void *)this + 9);
                }
                uint64_t v7 = 0;
                v29[64] = InterfaceDescriptor[1].bDescriptorType;
              }
            }
LABEL_57:
            IOUSBHostDevice::DestroyInterfaceIterator(device, ref, 0);
          }
          else
          {
            uint64_t v7 = 0;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (device)
  {
    ((void (*)(IOUSBHostDevice *))device->release)(device);
    device = 0;
  }
  if (v8) {
    IOUSBHostFreeDescriptor(v8);
  }
  return v7;
}

uint64_t AppleUserECM::activate(AppleUserECM *this)
{
  uint8_t speed = 0;
  uint64_t USBPipe = AppleUserECM::findUSBPipe(this, *(IOUSBHostInterface **)(*((void *)this + 9) + 32), 0, 2, (IOUSBHostPipe **)(*((void *)this + 9) + 144), (unsigned __int16 *)(*((void *)this + 9) + 152));
  if (USBPipe)
  {
    uint64_t v15 = USBPipe;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 977;
    __int16 v24 = 2080;
    int v25 = "status == kIOReturnSuccess";
    uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find our tx pipe\n";
    goto LABEL_45;
  }
  uint64_t v3 = IOUSBHostPipe::GetSpeed(*(const IOUSBHostPipe **)(*((void *)this + 9) + 144), &speed, 0);
  if (v3)
  {
    uint64_t v15 = v3;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 980;
    __int16 v24 = 2080;
    int v25 = "status == kIOReturnSuccess";
    uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find speed\n";
    goto LABEL_45;
  }
  unsigned int v4 = speed;
  if (!speed)
  {
    uint64_t v15 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 981;
    __int16 v24 = 2080;
    int v25 = "speed > kIOUSBHostConnectionSpeedNone";
    v18 = "[%s:%d] Assertion failed: %s.  invalid speed\n";
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, buf, 0x1Cu);
    return 0;
  }
  if (speed >= 4u)
  {
    unsigned int v4 = 4;
    uint8_t speed = 4;
  }
  __int16 v5 = (_DWORD *)((char *)&unk_10000A160 + 16 * v4);
  *(_DWORD *)(*((void *)this + 9) + 184) = *v5;
  *(_DWORD *)(*((void *)this + 9) + 232) = v5[1];
  *(_DWORD *)(*((void *)this + 9) + 328) = v5[2];
  *(_DWORD *)(*((void *)this + 9) + 332) = v5[3];
  *(_DWORD *)(*((void *)this + 9) + 336) = *(_DWORD *)(*((void *)this + 9) + 332)
                                             + *(_DWORD *)(*((void *)this + 9) + 328);
  *(void *)(*((void *)this + 9) + 160) = AppleUserECM::allocateUSBPackets(this, *(IOUSBHostPipe **)(*((void *)this + 9) + 144), *(_DWORD *)(*((void *)this + 9) + 184), 2048);
  uint64_t v6 = *((void *)this + 9);
  if (!*(void *)(v6 + 160))
  {
    uint64_t v15 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 995;
    __int16 v24 = 2080;
    int v25 = "ivars->usbTxPackets != NULL";
    v18 = "[%s:%d] Assertion failed: %s.  failed to allocate our tx packets\n";
    goto LABEL_34;
  }
  *(_DWORD *)(v6 + 168) = *(_DWORD *)(v6 + 184);
  uint64_t ActionTxComplete = AppleUserECM::CreateActionTxComplete((OSObject *)this, 8uLL, (OSAction **)(*((void *)this + 9) + 176));
  if (ActionTxComplete) {
    return ActionTxComplete;
  }
  uint64_t v8 = AppleUserECM::findUSBPipe(this, *(IOUSBHostInterface **)(*((void *)this + 9) + 32), 1, 2, (IOUSBHostPipe **)(*((void *)this + 9) + 192), 0);
  if (v8)
  {
    uint64_t v15 = v8;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 1004;
    __int16 v24 = 2080;
    int v25 = "status == kIOReturnSuccess";
    uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find our rx pipe\n";
    goto LABEL_45;
  }
  *(void *)(*((void *)this + 9) + 200) = AppleUserECM::allocateUSBPackets(this, *(IOUSBHostPipe **)(*((void *)this + 9) + 192), *(_DWORD *)(*((void *)this + 9) + 232), 2048);
  uint64_t v9 = *((void *)this + 9);
  if (!*(void *)(v9 + 200))
  {
    uint64_t v15 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 1007;
    __int16 v24 = 2080;
    int v25 = "ivars->usbRxPackets != NULL";
    v18 = "[%s:%d] Assertion failed: %s.  failed to allocate our rx packets\n";
    goto LABEL_34;
  }
  *(_DWORD *)(v9 + 216) = *(_DWORD *)(v9 + 232);
  uint64_t ActionTxComplete = AppleUserECM::CreateActionRxComplete((OSObject *)this, 8uLL, (OSAction **)(*((void *)this + 9) + 224));
  if (!ActionTxComplete)
  {
    uint64_t v10 = AppleUserECM::findUSBPipe(this, *(IOUSBHostInterface **)(*((void *)this + 9) + 24), 1, 3, (IOUSBHostPipe **)(*((void *)this + 9) + 72), (unsigned __int16 *)(*((void *)this + 9) + 88));
    if (v10)
    {
      uint64_t v15 = v10;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v15;
      }
      *(_DWORD *)buf = 136315650;
      int v21 = "AppleUserECM.cpp";
      __int16 v22 = 1024;
      int v23 = 1020;
      __int16 v24 = 2080;
      int v25 = "status == kIOReturnSuccess";
      uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find our interrupt pipe\n";
    }
    else
    {
      uint64_t v11 = IOTimerDispatchSource::Create(*(IODispatchQueue **)(*((void *)this + 9) + 8), (IOTimerDispatchSource **)(*((void *)this + 9) + 128));
      if (v11)
      {
        uint64_t v15 = v11;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          return v15;
        }
        *(_DWORD *)buf = 136315650;
        int v21 = "AppleUserECM.cpp";
        __int16 v22 = 1024;
        int v23 = 1023;
        __int16 v24 = 2080;
        int v25 = "status == kIOReturnSuccess";
        uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to create interrupt read timer source\n";
      }
      else
      {
        uint64_t TimerOccurred = AppleUserECM::CreateActionInterruptReadTimerOccurred((OSObject *)this, 8uLL, (OSAction **)(*((void *)this + 9) + 136));
        if (TimerOccurred)
        {
          uint64_t v15 = TimerOccurred;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            return v15;
          }
          *(_DWORD *)buf = 136315650;
          int v21 = "AppleUserECM.cpp";
          __int16 v22 = 1024;
          int v23 = 1026;
          __int16 v24 = 2080;
          int v25 = "status == kIOReturnSuccess";
          uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to create interrupt read timer action\n";
        }
        else
        {
          uint64_t v13 = IOTimerDispatchSource::SetHandler(*(IOTimerDispatchSource **)(*((void *)this + 9) + 128), *(OSAction **)(*((void *)this + 9) + 136), 0);
          if (v13)
          {
            uint64_t v15 = v13;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              return v15;
            }
            *(_DWORD *)buf = 136315650;
            int v21 = "AppleUserECM.cpp";
            __int16 v22 = 1024;
            int v23 = 1029;
            __int16 v24 = 2080;
            int v25 = "status == kIOReturnSuccess";
            uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to set interrupt read timer handler\n";
          }
          else
          {
            uint64_t ActionTxComplete = (*(uint64_t (**)(void, uint64_t, void, uint64_t))(**(void **)(*((void *)this + 9) + 24)
                                                                                           + 88))(*(void *)(*((void *)this + 9) + 24), 1, *(unsigned __int16 *)(*((void *)this + 9) + 88), *((void *)this + 9) + 80);
            if (ActionTxComplete) {
              return ActionTxComplete;
            }
            uint64_t ActionTxComplete = IOMemoryDescriptor::Map(*(IOMemoryDescriptor **)(*((void *)this + 9) + 80), 0, 0, 0, IOVMPageSize, (uint64_t *)(*((void *)this + 9) + 96), (uint64_t *)(*((void *)this + 9) + 104));
            if (ActionTxComplete) {
              return ActionTxComplete;
            }
            uint64_t ActionTxComplete = AppleUserECM::CreateActionInterruptReadComplete((OSObject *)this, 8uLL, (OSAction **)(*((void *)this + 9) + 112));
            if (ActionTxComplete) {
              return ActionTxComplete;
            }
            uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(*((void *)this + 9)
                                                                                             + 24)
                                                                               + 88))(*(void *)(*((void *)this + 9) + 24), 3, 1024, *((void *)this + 9) + 40);
            if (!v14) {
              return IOMemoryDescriptor::Map(*(IOMemoryDescriptor **)(*((void *)this + 9) + 40), 0, 0, 0, IOVMPageSize, (uint64_t *)(*((void *)this + 9) + 48), (uint64_t *)(*((void *)this + 9) + 56));
            }
            uint64_t v15 = v14;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              return v15;
            }
            *(_DWORD *)buf = 136315650;
            int v21 = "AppleUserECM.cpp";
            __int16 v22 = 1024;
            int v23 = 1051;
            __int16 v24 = 2080;
            int v25 = "status == kIOReturnSuccess";
            uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to allocate our device request buffer\n";
          }
        }
      }
    }
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, buf, 0x1Cu);
    return v15;
  }
  return ActionTxComplete;
}

uint64_t AppleUserECM::updateEthernetPacketFilter(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  if (*(unsigned char *)(v2 + 296)) {
    uint64_t v3 = *(unsigned __int16 *)(v2 + 324);
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int16 *)(v2 + 324);
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "AppleUserECM";
    __int16 v10 = 2080;
    uint64_t v11 = "updateEthernetPacketFilter";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: filter = 0x%04x / 0x%04x\n", buf, 0x22u);
    uint64_t v2 = *((void *)this + 9);
  }
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void, void, void, void, int))(**(void **)(v2 + 24) + 104))(*(void *)(v2 + 24), 33, 67, v3, *(unsigned __int8 *)(v2 + 65), 0, 0, 0, 5000);
  if (v5)
  {
    uint64_t v6 = (unsigned char *)*((void *)this + 9);
    if (v6)
    {
      if ((*v6 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v9 = "AppleUserECM";
        __int16 v10 = 2080;
        uint64_t v11 = "updateEthernetPacketFilter";
        __int16 v12 = 1024;
        int v13 = v3;
        __int16 v14 = 1024;
        int v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: updateEthernetPacketFilter() for 0x%x failed with 0x%x\n", buf, 0x22u);
      }
    }
  }
  return v5;
}

uint64_t AppleUserECM::getFunctionalDescriptors(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  if ((*(unsigned char *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    __int16 v22 = "AppleUserECM";
    __int16 v23 = 2080;
    __int16 v24 = "getFunctionalDescriptors";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v21, 0x16u);
    uint64_t v2 = *((void *)this + 9);
  }
  uint64_t v3 = 3758097136;
  uint64_t v4 = *(void *)(v2 + 24);
  if (v4)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 56))(v4);
    if (v5)
    {
      uint64_t v6 = (const IOUSBConfigurationDescriptor *)v5;
      uint64_t v7 = (const IOUSBDescriptorHeader *)(*(uint64_t (**)(void, uint64_t))(**(void **)(*((void *)this + 9) + 24)
                                                                                     + 64))(*(void *)(*((void *)this + 9) + 24), v5);
      if (v7)
      {
        uint64_t v8 = v7;
        *(_DWORD *)(*((void *)this + 9) + 320) = 0;
        AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType(v6, v7, 0, 0x24u);
        if (AssociatedDescriptorWithType)
        {
          __int16 v10 = AssociatedDescriptorWithType;
          while (v10->bLength <= 0xCu || v10[1].bLength != 15)
          {
            __int16 v10 = IOUSBGetNextAssociatedDescriptorWithType(v6, v8, v10, 0x24u);
            if (!v10) {
              goto LABEL_29;
            }
          }
          unsigned int v11 = (unsigned __int16)v10[4];
          uint64_t v12 = *((void *)this + 9);
          if (*(_DWORD *)(v12 + 316) > v11)
          {
            *(_DWORD *)(v12 + 316) = v11;
            uint64_t v12 = *((void *)this + 9);
          }
          *(_DWORD *)(v12 + 320) = (unsigned __int16)v10[5];
          int v13 = (const IOUSBStringDescriptor *)(*(uint64_t (**)(void, void))(**(void **)(*((void *)this + 9) + 24)
                                                                                         + 80))(*(void *)(*((void *)this + 9) + 24), v10[1].bDescriptorType);
          if (v13)
          {
            if (v13->bLength < 3u)
            {
LABEL_27:
              uint64_t v3 = 0;
              goto LABEL_28;
            }
            uint64_t v14 = 0;
            int v15 = 0;
            while (1)
            {
              int v16 = v13->bString[v14];
              char v17 = v16 - 48;
              if ((v16 - 48) >= 0xA)
              {
                if ((v16 - 97) > 5)
                {
                  if ((v16 - 65) > 5)
                  {
                    uint64_t v3 = 3758096385;
LABEL_28:
                    IOUSBHostFreeDescriptor(v13);
                    break;
                  }
                  char v17 = v16 - 55;
                }
                else
                {
                  char v17 = v16 - 87;
                }
              }
              if ((v14 & 2) != 0)
              {
                uint64_t v19 = *((void *)this + 9) + v15++;
                char v18 = *(unsigned char *)(v19 + 308) | v17;
              }
              else
              {
                char v18 = 16 * v17;
                uint64_t v19 = *((void *)this + 9) + v15;
              }
              *(unsigned char *)(v19 + 308) = v18;
              v14 += 2;
              if (v14 >= v13->bLength - 2) {
                goto LABEL_27;
              }
            }
          }
        }
      }
LABEL_29:
      IOUSBHostFreeDescriptor(v6);
    }
  }
  return v3;
}

uint64_t AppleUserECM::reportMediaCapabilities(AppleUserECM *this)
{
  long long v2 = xmmword_10000A150;
  uint64_t v3 = 0x10003600100030;
  int v4 = 1048631;
  return (*(uint64_t (**)(AppleUserECM *, long long *, uint64_t))(*(void *)this + 72))(this, &v2, 7);
}

uint64_t AppleUserECM::Stop_Impl(IOService *this, IOService *provider)
{
  int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  if (v4 && ((uint64_t)v4->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "AppleUserECM";
    __int16 v23 = 2080;
    __int16 v24 = "Stop_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  if (LOBYTE(v4[18].free)) {
    sub_100009C04();
  }
  int init = (IOUSBHostInterface *)v4[2].init;
  if (init)
  {
    IOUSBHostInterface::Close(init, this, 0, 0);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  free = (IOUSBHostInterface *)v4[1].free;
  if (free)
  {
    IOUSBHostInterface::Close(free, this, 0, 0);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  uint64_t v7 = (IODispatchQueue *)v4[1].init;
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_10000572C;
    block[3] = &unk_10000C298;
    block[4] = this;
    IODispatchQueue::DispatchSync(v7, block);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  uint64_t v8 = v4[17].init;
  if (v8)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v8 + 16))(v8);
    this[1].OSObject::OSObjectInterface::__vftable[17].int init = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  uint64_t v9 = v4[16].free;
  if (v9)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v9 + 16))(v9);
    this[1].OSObject::OSObjectInterface::__vftable[16].free = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  __int16 v10 = v4[16].init;
  if (v10)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v10 + 16))(v10);
    this[1].OSObject::OSObjectInterface::__vftable[16].int init = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  unsigned int v11 = v4[15].free;
  if (v11)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v11 + 16))(v11);
    this[1].OSObject::OSObjectInterface::__vftable[15].free = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  uint64_t v12 = v4[18].init;
  if (v12)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v12 + 16))(v12);
    this[1].OSObject::OSObjectInterface::__vftable[18].int init = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  int v13 = v4[17].free;
  if (v13)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v13 + 16))(v13);
    this[1].OSObject::OSObjectInterface::__vftable[17].free = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  uint64_t v14 = v4[15].init;
  if (v14)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v14 + 16))(v14);
    this[1].OSObject::OSObjectInterface::__vftable[15].int init = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  int v15 = v4[1].free;
  if (v15)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v15 + 16))(v15);
    this[1].OSObject::OSObjectInterface::__vftable[1].free = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  int v16 = v4[2].init;
  if (v16)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v16 + 16))(v16);
    this[1].OSObject::OSObjectInterface::__vftable[2].int init = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  char v17 = v4[1].init;
  if (v17)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v17 + 16))(v17);
    this[1].OSObject::OSObjectInterface::__vftable[1].int init = 0;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }
  char v18 = v4->free;
  if (v18)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v18 + 16))(v18);
    this[1].free = 0;
  }
  return IOService::Stop(this, provider, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
}

uint64_t sub_10000572C(uint64_t a1)
{
  return AppleUserECM::deactivate(*(AppleUserECM **)(a1 + 32));
}

uint64_t AppleUserECM::deactivate(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  uint64_t v3 = *(IODispatchSource **)(v2 + 128);
  if (v3)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100008204;
    handler[3] = &unk_10000C378;
    handler[4] = this;
    IODispatchSource::Cancel(v3, handler, 0);
    uint64_t v2 = *((void *)this + 9);
  }
  uint64_t v4 = *(void *)(v2 + 136);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
    *(void *)(*((void *)this + 9) + 136) = 0;
    uint64_t v2 = *((void *)this + 9);
  }
  uint64_t v5 = *(void *)(v2 + 72);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
    *(void *)(*((void *)this + 9) + 72) = 0;
    uint64_t v2 = *((void *)this + 9);
  }
  uint64_t v6 = *(void *)(v2 + 112);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
    *(void *)(*((void *)this + 9) + 112) = 0;
    uint64_t v2 = *((void *)this + 9);
  }
  uint64_t v7 = *(void *)(v2 + 80);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
    *(void *)(*((void *)this + 9) + 80) = 0;
    uint64_t v2 = *((void *)this + 9);
  }
  *(unsigned char *)(v2 + 120) = 0;
  uint64_t v8 = *((void *)this + 9);
  uint64_t v9 = *(void *)(v8 + 192);
  if (v9)
  {
    (*(void (**)(uint64_t))(*(void *)v9 + 16))(v9);
    *(void *)(*((void *)this + 9) + 192) = 0;
    uint64_t v8 = *((void *)this + 9);
  }
  uint64_t v10 = *(void *)(v8 + 224);
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
    *(void *)(*((void *)this + 9) + 224) = 0;
    uint64_t v8 = *((void *)this + 9);
  }
  AppleUserECM::freeUSBPackets(this, *(void **)(v8 + 200), *(_DWORD *)(v8 + 232));
  *(void *)(*((void *)this + 9) + 200) = 0;
  *(_DWORD *)(*((void *)this + 9) + 212) = 0;
  *(_DWORD *)(*((void *)this + 9) + 208) = 0;
  uint64_t v11 = *((void *)this + 9);
  uint64_t v12 = *(void *)(v11 + 144);
  if (v12)
  {
    (*(void (**)(uint64_t))(*(void *)v12 + 16))(v12);
    *(void *)(*((void *)this + 9) + 144) = 0;
    uint64_t v11 = *((void *)this + 9);
  }
  uint64_t v13 = *(void *)(v11 + 176);
  if (v13)
  {
    (*(void (**)(uint64_t))(*(void *)v13 + 16))(v13);
    *(void *)(*((void *)this + 9) + 176) = 0;
    uint64_t v11 = *((void *)this + 9);
  }
  AppleUserECM::freeUSBPackets(this, *(void **)(v11 + 160), *(_DWORD *)(v11 + 184));
  *(void *)(*((void *)this + 9) + 160) = 0;
  *(_DWORD *)(*((void *)this + 9) + 172) = 0;
  uint64_t result = *(void *)(*((void *)this + 9) + 40);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
    *(void *)(*((void *)this + 9) + 40) = 0;
  }
  return result;
}

uint64_t AppleUserECM::SetInterfaceEnable_Impl(AppleUserECM *this, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = 0;
  uint64_t v4 = *((void *)this + 9);
  if ((*(unsigned char *)v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v16 = "AppleUserECM";
    __int16 v17 = 2080;
    char v18 = "SetInterfaceEnable_Impl";
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: isEnable %d\n", buf, 0x1Cu);
    uint64_t v4 = *((void *)this + 9);
  }
  uint64_t v5 = *(IODispatchQueue **)(v4 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 1107296256;
  block[2] = sub_100005C44;
  block[4] = &v11;
  void block[5] = this;
  char v10 = a2;
  block[3] = &unk_10000C2B8;
  IODispatchQueue::DispatchSync(v5, block);
  uint64_t v6 = (unsigned char *)*((void *)this + 9);
  if (v6 && (*v6 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((_DWORD *)v12 + 6);
    *(_DWORD *)buf = 136315650;
    int v16 = "AppleUserECM";
    __int16 v17 = 2080;
    char v18 = "SetInterfaceEnable_Impl";
    __int16 v19 = 1024;
    int v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: 0x%08x\n", buf, 0x1Cu);
  }
  if (a2) {
    a2 = *((unsigned int *)v12 + 6);
  }
  else {
    *((_DWORD *)v12 + 6) = 0;
  }
  ++qword_100010000;
  _Block_object_dispose(&v11, 8);
  return a2;
}

uint64_t sub_100005C44(uint64_t a1)
{
  v1 = *(AppleUserECM **)(a1 + 40);
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_12;
  }
  *(unsigned char *)(*((void *)v1 + 9) + 296) = 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = AppleUserECM::updateEthernetPacketFilter(v1);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_12;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9)+ 248), 1, 0);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_12;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9)+ 256), 1, 0);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_12;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9)+ 264), 1, 0);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_12;
  }
  uint64_t v3 = *((void *)v1 + 9);
  if ((*(unsigned char *)v3 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 136315650;
    int v7 = "AppleUserECM";
    __int16 v8 = 2080;
    uint64_t v9 = "SetInterfaceEnable_Impl_block_invoke";
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: rxCompletionQueue isEnable %d\n", (uint8_t *)&v6, 0x1Cu);
    uint64_t v3 = *((void *)v1 + 9);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(v3 + 272), 1, 0);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOUserNetworkEthernet::SelectMediaType((IOUserNetworkEthernet *)v1, 0x20u, 0)) != 0|| (uint64_t result = AppleUserECM::readInterruptPipe(v1), (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result) != 0))
  {
LABEL_12:
    *(unsigned char *)(*((void *)v1 + 9) + 296) = 0;
    AppleUserECM::updateEthernetPacketFilter(v1);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 248), 0, 0);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 256), 0, 0);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 264), 0, 0);
    return IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 272), 0, 0);
  }
  return result;
}

uint64_t AppleUserECM::readInterruptPipe(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  if ((*(unsigned char *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "AppleUserECM";
    __int16 v6 = 2080;
    int v7 = "readInterruptPipe";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v4, 0x16u);
    uint64_t v2 = *((void *)this + 9);
  }
  if (*(unsigned char *)(v2 + 120)) {
    return 0;
  }
  bzero(*(void **)(v2 + 96), *(void *)(v2 + 104));
  uint64_t result = IOUSBHostPipe::AsyncIO(*(IOUSBHostPipe **)(*((void *)this + 9) + 72), *(IOMemoryDescriptor **)(*((void *)this + 9) + 80), *(_DWORD *)(*((void *)this + 9) + 104), *(OSAction **)(*((void *)this + 9) + 112), 0, 0);
  if (result == -536850432)
  {
    IOUSBHostPipe::ClearStall(*(IOUSBHostPipe **)(*((void *)this + 9) + 72), 1, 0);
    uint64_t result = IOUSBHostPipe::AsyncIO(*(IOUSBHostPipe **)(*((void *)this + 9) + 72), *(IOMemoryDescriptor **)(*((void *)this + 9) + 80), *(_DWORD *)(*((void *)this + 9) + 104), *(OSAction **)(*((void *)this + 9) + 112), 0, 0);
  }
  *(unsigned char *)(*((void *)this + 9) + 120) = result == 0;
  return result;
}

void sub_100006020(uint64_t a1, uint64_t a2)
{
}

void sub_100006030(uint64_t a1)
{
}

uint64_t AppleUserECM::SetPromiscuousModeEnable_Impl(AppleUserECM *this, __int16 a2)
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = -536870198;
  int v4 = (unsigned char *)*((void *)this + 9);
  if (v4 && (*v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v14 = "AppleUserECM";
    __int16 v15 = 2080;
    int v16 = "SetPromiscuousModeEnable_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }
  *(_WORD *)(*((void *)this + 9) + 324) = *(_WORD *)(*((void *)this + 9) + 324) & 0xFFFE | a2;
  uint64_t v5 = *(IODispatchQueue **)(*((void *)this + 9) + 16);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1000061CC;
  v8[4] = &v9;
  v8[5] = this;
  v8[3] = &unk_10000C2E8;
  IODispatchQueue::DispatchSync(v5, v8);
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t sub_1000061CC(uint64_t a1)
{
  uint64_t result = AppleUserECM::updateEthernetPacketFilter(*(AppleUserECM **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t AppleUserECM::SetAllMulticastModeEnable_Impl(AppleUserECM *this, int a2)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = -536870198;
  int v4 = (unsigned char *)*((void *)this + 9);
  if (v4 && (*v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "AppleUserECM";
    __int16 v16 = 2080;
    __int16 v17 = "SetAllMulticastModeEnable_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }
  if (a2) {
    __int16 v5 = 2;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)(*((void *)this + 9) + 324) = *(_WORD *)(*((void *)this + 9) + 324) & 0xFFFD | v5;
  uint64_t v6 = *(IODispatchQueue **)(*((void *)this + 9) + 16);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  _DWORD v9[2] = sub_10000639C;
  v9[4] = &v10;
  v9[5] = this;
  v9[3] = &unk_10000C318;
  IODispatchQueue::DispatchSync(v6, v9);
  uint64_t v7 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t sub_10000639C(uint64_t a1)
{
  uint64_t result = AppleUserECM::updateEthernetPacketFilter(*(AppleUserECM **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t AppleUserECM::setMulticastAddresses(AppleUserECM *this, const ether_addr *__src, unsigned int a3)
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2000000000;
  int v18 = -536870201;
  unsigned __int16 v14 = 0;
  uint64_t v6 = *((void *)this + 9);
  if ((*(unsigned char *)v6 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v20 = "AppleUserECM";
    __int16 v21 = 2080;
    __int16 v22 = "setMulticastAddresses";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v6 = *((void *)this + 9);
  }
  if ((*(_DWORD *)(v6 + 320) & 0x8000) == 0 && (*(_DWORD *)(v6 + 320) & 0x7FFFu) >= a3)
  {
    if (!a3)
    {
      *(_WORD *)(v6 + 324) &= ~0x10u;
      goto LABEL_12;
    }
    unint64_t v7 = 2 * ((3 * (_WORD)a3) & 0x7FFF);
    if (*(void *)(v6 + 56) >= v7)
    {
      memcpy(*(void **)(v6 + 48), __src, 2 * ((3 * (_WORD)a3) & 0x7FFF));
      int v8 = (*(uint64_t (**)(void, uint64_t, uint64_t, void, void, uint64_t, void, unsigned __int16 *, int))(**(void **)(*((void *)this + 9) + 24) + 104))(*(void *)(*((void *)this + 9) + 24), 33, 64, (unsigned __int16)a3, *(unsigned __int8 *)(*((void *)this + 9) + 65), 2 * ((3 * (_WORD)a3) & 0x7FFF), *(void *)(*((void *)this + 9) + 40), &v14, 5000);
      uint64_t v9 = v16;
      *((_DWORD *)v16 + 6) = v8;
      if (v14 != v7)
      {
        *((_DWORD *)v9 + 6) = -536870198;
        goto LABEL_14;
      }
      if (!v8)
      {
        *(_WORD *)(*((void *)this + 9) + 324) |= 0x10u;
LABEL_12:
        uint64_t v10 = *(IODispatchQueue **)(*((void *)this + 9) + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 1107296256;
        block[2] = sub_100006630;
        block[3] = &unk_10000C348;
        block[4] = &v15;
        void block[5] = this;
        IODispatchQueue::DispatchSync(v10, block);
      }
    }
  }
LABEL_14:
  uint64_t v11 = *((unsigned int *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t sub_100006630(uint64_t a1)
{
  uint64_t result = AppleUserECM::updateEthernetPacketFilter(*(AppleUserECM **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t non-virtual thunk to'AppleUserECM::setMulticastAddresses(AppleUserECM *this, const ether_addr *a2, unsigned int a3)
{
  return AppleUserECM::setMulticastAddresses((AppleUserECM *)((char *)this - 48), a2, a3);
}

uint64_t AppleUserECM::SelectMediaType_Impl(AppleUserECM *this, int a2)
{
  uint64_t v4 = *((void *)this + 9);
  if ((*(unsigned char *)v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "AppleUserECM";
    __int16 v9 = 2080;
    uint64_t v10 = "SelectMediaType_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v7, 0x16u);
    uint64_t v4 = *((void *)this + 9);
  }
  *(_DWORD *)(v4 + 304) = a2;
  *(_DWORD *)(*((void *)this + 9) + 300) = 1;
  *(unsigned char *)(*((void *)this + 9) + 297) = 0;
  uint64_t v5 = *((void *)this + 9);
  if ((*(_DWORD *)(v5 + 304) | 2) != 0x22) {
    return 3758097095;
  }
  (*(void (**)(AppleUserECM *, void))(*(void *)this + 128))(this, *(unsigned int *)(v5 + 300));
  return 0;
}

uint64_t AppleUserECM::TxPacketsAvailable_Impl(AppleUserECM *this, OSAction *a2)
{
  uint64_t v3 = (unsigned char *)*((void *)this + 9);
  if ((*v3 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "AppleUserECM";
    __int16 v7 = 2080;
    int v8 = "TxPacketsAvailable_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v3 = (unsigned char *)*((void *)this + 9);
  }
  if (v3[296]) {
    return AppleUserECM::handleTxPacketsAvailable(this);
  }
  else {
    return IOLog("AppleUserECM::TxPacketsAvailable() called with isEnabledCounter=%lld and isEnabled=false\n", qword_100010000);
  }
}

uint64_t AppleUserECM::handleTxPacketsAvailable(AppleUserECM *this)
{
  kern_return_t v14;
  kern_return_t v15;
  uint32_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  unsigned int v21;
  unsigned char *v22;
  unsigned int v23;
  uint32_t ioTransferAcceptedCount;
  uint8_t v25[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  kern_return_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  _OWORD v35[32];

  memset(v35, 0, sizeof(v35));
  uint64_t v2 = *((void *)this + 9);
  uint64_t v3 = *(void *)(v2 + 160);
  signed int v4 = *(_DWORD *)(v2 + 172);
  ioTransferAcceptedCount = 0;
  if ((*(unsigned char *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "AppleUserECM";
    v33 = 2080;
    v34 = "handleTxPacketsAvailable";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v2 = *((void *)this + 9);
  }
  uint64_t result = (*(uint64_t (**)(void, _OWORD *, void))(**(void **)(v2 + 248) + 104))(*(void *)(v2 + 248), v35, (*(_DWORD *)(v2 + 168) / 2));
  if (!result) {
    return result;
  }
  uint64_t v6 = 0;
  uint32_t v7 = 0;
  __int16 v23 = result;
  uint64_t v8 = result - 1;
  while (1)
  {
    unsigned int v9 = (*(uint64_t (**)(void))(**((void **)v35 + v6) + 224))(*((void *)v35 + v6));
    uint64_t v10 = (*(uint64_t (**)(void))(**((void **)v35 + v6) + 184))(*((void *)v35 + v6));
    unsigned __int8 v11 = (*(uint64_t (**)(void))(**((void **)v35 + v6) + 240))(*((void *)v35 + v6));
    memcpy(*(void **)(v3 + 24 * v4 + 8), (const void *)(v10 + v11), v9);
    *(_DWORD *)&buf[4 * v7] = v9;
    uint64_t v12 = *((void *)this + 9);
    if (!(v9 % *(unsigned __int16 *)(v12 + 152)))
    {
      ++v7;
      ++v4;
      *(_DWORD *)&buf[4 * v7] = 0;
    }
    ++v7;
    if (v8 != v6 && v7 < 0xF)
    {
      unsigned int v13 = *(_DWORD *)(v12 + 184);
      if (v4 + 1 < v13) {
        unsigned int v13 = 0;
      }
      signed int v4 = v4 + 1 - v13;
      goto LABEL_19;
    }
    ioTransferAcceptedCount = 0;
    unsigned __int16 v14 = IOUSBHostPipe::AsyncIOBundled(*(IOUSBHostPipe **)(v12 + 144), *(_DWORD *)(v12 + 172), v7, &ioTransferAcceptedCount, (const unsigned int *)buf, v7, *(OSAction **)(v12 + 176), 0, 0);
    uint64_t v15 = v14;
    __int16 v16 = ioTransferAcceptedCount;
    *(_DWORD *)(*((void *)this + 9) + 168) -= ioTransferAcceptedCount;
    *(_DWORD *)(*((void *)this + 9) + 172) += v16;
    uint64_t v17 = *((void *)this + 9);
    int v18 = *(_DWORD *)(v17 + 172);
    __int16 v19 = *(_DWORD *)(v17 + 184);
    int v20 = v18 >= v19;
    __int16 v21 = v18 - v19;
    if (v20) {
      *(_DWORD *)(v17 + 172) = v21;
    }
    if (v14) {
      break;
    }
    if (v8 == v6) {
      return (*(uint64_t (**)(void, _OWORD *, void))(**(void **)(*((void *)this + 9) + 256) + 88))(*(void *)(*((void *)this + 9) + 256), v35, v23);
    }
    uint32_t v7 = 0;
    signed int v4 = *(_DWORD *)(*((void *)this + 9) + 172);
LABEL_19:
    ++v6;
  }
  __int16 v22 = (unsigned char *)*((void *)this + 9);
  if (v22 && (*v22 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v25 = 136315650;
    int v26 = "AppleUserECM";
    BOOL v27 = 2080;
    uint64_t v28 = "handleTxPacketsAvailable";
    uint64_t v29 = 1024;
    unsigned __int8 v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: Error on AsyncIOBundled = 0x%08x\n", v25, 0x1Cu);
  }
  return (*(uint64_t (**)(void, _OWORD *, void))(**(void **)(*((void *)this + 9) + 256) + 88))(*(void *)(*((void *)this + 9) + 256), v35, v23);
}

void AppleUserECM::RxPacketsAvailable_Impl(AppleUserECM *this, OSAction *a2)
{
  uint64_t v3 = (unsigned char *)*((void *)this + 9);
  if ((*v3 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "AppleUserECM";
    __int16 v6 = 2080;
    uint32_t v7 = "RxPacketsAvailable_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v4, 0x16u);
    uint64_t v3 = (unsigned char *)*((void *)this + 9);
  }
  if (v3[296]) {
    AppleUserECM::handleRxPacketsAvailable(this);
  }
}

void AppleUserECM::handleRxPacketsAvailable(AppleUserECM *this)
{
  kern_return_t v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;

  uint64_t v2 = *((void *)this + 9);
  int v3 = *(_DWORD *)(v2 + 216);
  if ((*(unsigned char *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int16 v14 = "AppleUserECM";
    uint64_t v15 = 2080;
    __int16 v16 = "handleRxPacketsAvailable";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }
  if (v3)
  {
    do
    {
      if (v3 >= 16) {
        uint32_t v4 = 16;
      }
      else {
        uint32_t v4 = v3;
      }
      *(_DWORD *)buf = 0;
      uint64_t v5 = IOUSBHostPipe::AsyncIOBundled(*(IOUSBHostPipe **)(*((void *)this + 9) + 192), *(_DWORD *)(*((void *)this + 9) + 208), v4, (uint32_t *)buf, dword_10000A1B0, v4, *(OSAction **)(*((void *)this + 9) + 224), 0, 0);
      __int16 v6 = *(_DWORD *)buf;
      *(_DWORD *)(*((void *)this + 9) + 216) -= *(_DWORD *)buf;
      *(_DWORD *)(*((void *)this + 9) + 208) += v6;
      uint32_t v7 = *((void *)this + 9);
      uint64_t v8 = *(_DWORD *)(v7 + 208);
      unsigned int v9 = *(_DWORD *)(v7 + 232);
      uint64_t v10 = v8 >= v9;
      unsigned __int8 v11 = v8 - v9;
      if (v10) {
        *(_DWORD *)(v7 + 208) = v11;
      }
      v3 -= v4;
      if (v5) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v3 == 0;
      }
    }
    while (!v12);
  }
}

void AppleUserECM::TxComplete_Impl(AppleUserECM *this, OSAction *a2, unsigned int a3, int a4, const unsigned int *a5, int a6, const int *a7)
{
  uint64_t v9 = *((void *)this + 9);
  if ((*(unsigned char *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(v9 + 168);
    int v11 = 136315650;
    uint64_t v12 = "AppleUserECM";
    __int16 v13 = 2080;
    unsigned __int16 v14 = "TxComplete_Impl";
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: usbTxPacketsAvailable %d\n", (uint8_t *)&v11, 0x1Cu);
    uint64_t v9 = *((void *)this + 9);
  }
  *(_DWORD *)(v9 + 168) += a4;
  if (*(unsigned char *)(*((void *)this + 9) + 296)) {
    AppleUserECM::handleTxPacketsAvailable(this);
  }
}

void AppleUserECM::RxComplete_Impl(AppleUserECM *this, OSAction *a2, unsigned int a3, int a4, const unsigned int *a5, int a6, const int *a7)
{
  LODWORD(v9) = a4;
  memset(v33, 0, sizeof(v33));
  uint64_t v11 = *((void *)this + 9);
  int v12 = *(_DWORD *)(v11 + 212);
  if ((*(unsigned char *)v11 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v30 = "AppleUserECM";
    __int16 v31 = 2080;
    v32 = "RxComplete_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v11 = *((void *)this + 9);
  }
  if (*(unsigned char *)(v11 + 296))
  {
    uint64_t v13 = 0;
    if (v9)
    {
      unsigned __int16 v14 = a7;
      __int16 v15 = a5;
      uint64_t v16 = v9;
      do
      {
        if (!*v14++)
        {
          if (*v15) {
            uint64_t v13 = (v13 + 1);
          }
          else {
            uint64_t v13 = v13;
          }
        }
        ++v15;
        --v16;
      }
      while (v16);
    }
    uint64_t v18 = (*(uint64_t (**)(void, _OWORD *, uint64_t))(**(void **)(v11 + 264) + 104))(*(void *)(v11 + 264), v33, v13);
    if (v9)
    {
      signed int v19 = 0;
      int v28 = v9;
      uint64_t v9 = v9;
      do
      {
        if (*a5)
        {
          BOOL v20 = *a7 || v19 >= v18;
          if (!v20)
          {
            (*(void (**)(void, void))(**((void **)v33 + v19) + 232))(*((void *)v33 + v19), 0);
            (*(void (**)(void, void))(**((void **)v33 + v19) + 216))(*((void *)v33 + v19), *a5);
            __int16 v21 = (void *)(*(uint64_t (**)(void))(**((void **)v33 + v19) + 184))(*((void *)v33 + v19));
            ++v19;
            uint64_t v22 = *(void *)(*((void *)this + 9) + 200) + 24 * v12;
            memcpy(v21, *(const void **)(v22 + 8), *a5);
            (*(void (**)(AppleUserECM *, void, void))(*(void *)this + 384))(this, *(void *)(v22 + 8), *a5);
          }
        }
        uint64_t v23 = *((void *)this + 9);
        if (v12 + 1 == *(_DWORD *)(v23 + 232)) {
          int v12 = 0;
        }
        else {
          ++v12;
        }
        ++a7;
        ++a5;
        --v9;
      }
      while (v9);
      LODWORD(v9) = v28;
    }
    else
    {
      uint64_t v23 = *((void *)this + 9);
    }
    *(_DWORD *)(v23 + 212) = v12;
    *(_DWORD *)(*((void *)this + 9) + 216) += v9;
    (*(void (**)(void, _OWORD *, uint64_t))(**(void **)(*((void *)this + 9) + 272) + 88))(*(void *)(*((void *)this + 9) + 272), v33, v18);
    if (v18 >= v13) {
      AppleUserECM::handleRxPacketsAvailable(this);
    }
  }
  else
  {
    *(_DWORD *)(v11 + 216) += v9;
    *(_DWORD *)(*((void *)this + 9) + 212) += v9;
    uint64_t v24 = *((void *)this + 9);
    unsigned int v25 = *(_DWORD *)(v24 + 212);
    unsigned int v26 = *(_DWORD *)(v24 + 232);
    BOOL v20 = v25 >= v26;
    unsigned int v27 = v25 - v26;
    if (v20) {
      *(_DWORD *)(v24 + 212) = v27;
    }
  }
}

void AppleUserECM::InterruptReadComplete_Impl(AppleUserECM *this, OSAction *a2, kern_return_t a3, unsigned int a4)
{
  kern_return_t v8;
  uint64_t v9;
  uint64_t v10;
  kern_return_t v11;
  int v12;
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint32_t v17;
  __uint64_t v18;
  kern_return_t v19;
  unsigned char *v20;
  kern_return_t v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  kern_return_t v36;
  __int16 v37;
  kern_return_t v38;
  __int16 v39;
  unsigned int v40;

  uint32_t v7 = (unsigned char *)*((void *)this + 9);
  if ((*v7 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7[296];
    __int16 v31 = 136316162;
    v32 = "AppleUserECM";
    v33 = 2080;
    v34 = "InterruptReadComplete_Impl";
    v35 = 1024;
    __int16 v36 = v8;
    IOUserNetworkPacketBufferPoolOptions v37 = 1024;
    __int16 v38 = a3;
    int v39 = 1024;
    __int16 v40 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: isEnabled %d, status 0x%x, actualByteCount %d\n", (uint8_t *)&v31, 0x28u);
    uint32_t v7 = (unsigned char *)*((void *)this + 9);
  }
  v7[120] = 0;
  uint64_t v9 = *((void *)this + 9);
  if (*(unsigned char *)(v9 + 296))
  {
    if (a3 == -536870186 || a3 == -536870165)
    {
      if ((*(unsigned char *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v31 = 136315394;
        v32 = "AppleUserECM";
        v33 = 2080;
        v34 = "InterruptReadComplete_Impl";
        uint64_t v16 = "%s::%s: kIOReturnTimeout or kIOReturnAborted\n";
        uint64_t v17 = 22;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v31, v17);
      }
    }
    else
    {
      if (!a3)
      {
        if (a4 >= 8)
        {
          int v10 = *(void *)(v9 + 96);
          if (*(unsigned char *)(v10 + 1) == 42)
          {
            if ((*(unsigned char *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v31 = 136315394;
              v32 = "AppleUserECM";
              v33 = 2080;
              v34 = "InterruptReadComplete_Impl";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: kUSBCDCNotificationTypeConnectionSpeedChange\n", (uint8_t *)&v31, 0x16u);
            }
            if (a4 >= 0x10 && *(unsigned __int16 *)(v10 + 6) >= 8u)
            {
              uint64_t v22 = *(_DWORD *)(v10 + 12);
              if (*(_DWORD *)(v10 + 8) > v22) {
                uint64_t v22 = *(_DWORD *)(v10 + 8);
              }
              uint64_t v23 = 1048630;
              uint64_t v24 = 1048624;
              unsigned int v25 = 1048614;
              if (v22 <= 0x98967F) {
                unsigned int v26 = 34;
              }
              else {
                unsigned int v26 = 1048611;
              }
              if (v22 <= 0x5F5E0FF) {
                unsigned int v25 = v26;
              }
              if (v22 <= 0x3B9AC9FF) {
                uint64_t v24 = v25;
              }
              if (v22 <= 0x9502F8FF) {
                uint64_t v23 = v24;
              }
              if (v22 == 705032704) {
                unsigned int v27 = 1048631;
              }
              else {
                unsigned int v27 = v23;
              }
              int v28 = *((void *)this + 9);
              if (v27 != *(_DWORD *)(v28 + 304))
              {
                uint64_t v29 = *(_DWORD *)(v28 + 300);
                if (v29 == 1 || (v27 != 34 ? (unsigned __int8 v30 = v29 == 3) : (unsigned __int8 v30 = 0), v30))
                {
                  (*(void (**)(AppleUserECM *))(*(void *)this + 128))(this);
                  int v28 = *((void *)this + 9);
                }
                *(_DWORD *)(v28 + 304) = v27;
              }
            }
          }
          else if (!*(unsigned char *)(v10 + 1))
          {
            if ((*(unsigned char *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = *(unsigned __int16 *)(v10 + 2);
              __int16 v31 = 136315650;
              v32 = "AppleUserECM";
              v33 = 2080;
              v34 = "InterruptReadComplete_Impl";
              v35 = 1024;
              __int16 v36 = v11;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: kUSBCDCNotificationTypeNetworkConnection %u\n", (uint8_t *)&v31, 0x1Cu);
              uint64_t v9 = *((void *)this + 9);
            }
            int v12 = *(unsigned __int16 *)(v10 + 2);
            uint64_t v13 = *(_WORD *)(v10 + 2) != 0;
            if (*(unsigned __int8 *)(v9 + 297) != v13)
            {
              if ((*(unsigned char *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v31 = 136315650;
                v32 = "AppleUserECM";
                v33 = 2080;
                v34 = "InterruptReadComplete_Impl";
                v35 = 1024;
                __int16 v36 = v13;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: Link state change: 0x%02x\n", (uint8_t *)&v31, 0x1Cu);
                uint64_t v9 = *((void *)this + 9);
              }
              if (v12) {
                unsigned __int16 v14 = 3;
              }
              else {
                unsigned __int16 v14 = 1;
              }
              __int16 v15 = *(unsigned int *)(v9 + 304);
              if (!v12 || v15 != 34)
              {
                (*(void (**)(AppleUserECM *, uint64_t, uint64_t))(*(void *)this + 128))(this, v14, v15);
                uint64_t v9 = *((void *)this + 9);
              }
              *(_DWORD *)(v9 + 300) = v14;
              *(unsigned char *)(*((void *)this + 9) + 297) = v13;
            }
          }
        }
        goto LABEL_32;
      }
      if ((*(unsigned char *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v31 = 136315650;
        v32 = "AppleUserECM";
        v33 = 2080;
        v34 = "InterruptReadComplete_Impl";
        v35 = 1024;
        __int16 v36 = a3;
        uint64_t v16 = "%s::%s: Unknown status 0x%08x on Interrupt pipe\n";
        uint64_t v17 = 28;
        goto LABEL_31;
      }
    }
LABEL_32:
    uint64_t v18 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    signed int v19 = IOTimerDispatchSource::WakeAtTime(*(IOTimerDispatchSource **)(*((void *)this + 9) + 128), 0x88uLL, v18 + 100000000, 0, 0);
    if (v19)
    {
      BOOL v20 = (unsigned char *)*((void *)this + 9);
      if (v20)
      {
        if ((*v20 & 2) != 0)
        {
          __int16 v21 = v19;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v31 = 136315650;
            v32 = "AppleUserECM";
            v33 = 2080;
            v34 = "InterruptReadComplete_Impl";
            v35 = 1024;
            __int16 v36 = v21;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: error setting interrupt read timer 0x%08x\n", (uint8_t *)&v31, 0x1Cu);
          }
        }
      }
    }
  }
}

uint64_t AppleUserECM::findUSBPipe(AppleUserECM *this, IOUSBHostInterface *a2, int a3, int a4, IOUSBHostPipe **a5, unsigned __int16 *a6)
{
  int v12 = (unsigned char *)*((void *)this + 9);
  if (v12 && (*v12 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315394;
    v34 = "AppleUserECM";
    __int16 v35 = 2080;
    __int16 v36 = "findUSBPipe";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v33, 0x16u);
  }
  uint64_t v13 = 3758097136;
  uint64_t v14 = ((uint64_t (*)(IOUSBHostInterface *))a2->CopyConfigurationDescriptor)(a2);
  if (v14)
  {
    __int16 v15 = (const IOUSBConfigurationDescriptor *)v14;
    uint64_t v16 = ((uint64_t (*)(IOUSBHostInterface *, uint64_t))a2->GetInterfaceDescriptor)(a2, v14);
    if (v16)
    {
      uint64_t v17 = (const IOUSBInterfaceDescriptor *)v16;
      uint64_t v18 = (unsigned char *)*((void *)this + 9);
      if (v18)
      {
        if ((*v18 & 8) == 0
          || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
          || (int v33 = 136315394,
              v34 = "AppleUserECM",
              __int16 v35 = 2080,
              __int16 v36 = "findUSBPipe",
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: ----------------------\n", (uint8_t *)&v33, 0x16u), (uint64_t v18 = (unsigned char *)*((void *)this + 9)) != 0))
        {
          if ((*v18 & 8) == 0) {
            goto LABEL_51;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          int bLength = v17->bLength;
          int v33 = 136315650;
          v34 = "AppleUserECM";
          __int16 v35 = 2080;
          __int16 v36 = "findUSBPipe";
          __int16 v37 = 1024;
          int v38 = bLength;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bLength = 0x%x", (uint8_t *)&v33, 0x1Cu);
          uint64_t v18 = (unsigned char *)*((void *)this + 9);
          if (v18)
          {
LABEL_51:
            if ((*v18 & 8) == 0) {
              goto LABEL_52;
            }
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_52;
            }
            int bDescriptorType = v17->bDescriptorType;
            int v33 = 136315650;
            v34 = "AppleUserECM";
            __int16 v35 = 2080;
            __int16 v36 = "findUSBPipe";
            __int16 v37 = 1024;
            int v38 = bDescriptorType;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bDescriptorType = 0x%x", (uint8_t *)&v33, 0x1Cu);
            uint64_t v18 = (unsigned char *)*((void *)this + 9);
            if (v18)
            {
LABEL_52:
              if ((*v18 & 8) == 0) {
                goto LABEL_53;
              }
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_53;
              }
              int bInterfaceNumber = v17->bInterfaceNumber;
              int v33 = 136315650;
              v34 = "AppleUserECM";
              __int16 v35 = 2080;
              __int16 v36 = "findUSBPipe";
              __int16 v37 = 1024;
              int v38 = bInterfaceNumber;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bInterfaceNumber = 0x%x", (uint8_t *)&v33, 0x1Cu);
              uint64_t v18 = (unsigned char *)*((void *)this + 9);
              if (v18)
              {
LABEL_53:
                if ((*v18 & 8) == 0) {
                  goto LABEL_54;
                }
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_54;
                }
                int bAlternateSetting = v17->bAlternateSetting;
                int v33 = 136315650;
                v34 = "AppleUserECM";
                __int16 v35 = 2080;
                __int16 v36 = "findUSBPipe";
                __int16 v37 = 1024;
                int v38 = bAlternateSetting;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bAlternateSetting = 0x%x", (uint8_t *)&v33, 0x1Cu);
                uint64_t v18 = (unsigned char *)*((void *)this + 9);
                if (v18)
                {
LABEL_54:
                  if ((*v18 & 8) == 0) {
                    goto LABEL_55;
                  }
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_55;
                  }
                  int bNumEndpoints = v17->bNumEndpoints;
                  int v33 = 136315650;
                  v34 = "AppleUserECM";
                  __int16 v35 = 2080;
                  __int16 v36 = "findUSBPipe";
                  __int16 v37 = 1024;
                  int v38 = bNumEndpoints;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bNumEndpoints = 0x%x", (uint8_t *)&v33, 0x1Cu);
                  uint64_t v18 = (unsigned char *)*((void *)this + 9);
                  if (v18)
                  {
LABEL_55:
                    if ((*v18 & 8) == 0) {
                      goto LABEL_56;
                    }
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_56;
                    }
                    int bInterfaceClass = v17->bInterfaceClass;
                    int v33 = 136315650;
                    v34 = "AppleUserECM";
                    __int16 v35 = 2080;
                    __int16 v36 = "findUSBPipe";
                    __int16 v37 = 1024;
                    int v38 = bInterfaceClass;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bInterfaceClass = 0x%x", (uint8_t *)&v33, 0x1Cu);
                    uint64_t v18 = (unsigned char *)*((void *)this + 9);
                    if (v18)
                    {
LABEL_56:
                      if ((*v18 & 8) == 0) {
                        goto LABEL_57;
                      }
                      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_57;
                      }
                      int bInterfaceSubClass = v17->bInterfaceSubClass;
                      int v33 = 136315650;
                      v34 = "AppleUserECM";
                      __int16 v35 = 2080;
                      __int16 v36 = "findUSBPipe";
                      __int16 v37 = 1024;
                      int v38 = bInterfaceSubClass;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bInterfaceSubClass = 0x%x", (uint8_t *)&v33, 0x1Cu);
                      uint64_t v18 = (unsigned char *)*((void *)this + 9);
                      if (v18)
                      {
LABEL_57:
                        if ((*v18 & 8) == 0) {
                          goto LABEL_58;
                        }
                        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_58;
                        }
                        int bInterfaceProtocol = v17->bInterfaceProtocol;
                        int v33 = 136315650;
                        v34 = "AppleUserECM";
                        __int16 v35 = 2080;
                        __int16 v36 = "findUSBPipe";
                        __int16 v37 = 1024;
                        int v38 = bInterfaceProtocol;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int bInterfaceProtocol = 0x%x", (uint8_t *)&v33, 0x1Cu);
                        uint64_t v18 = (unsigned char *)*((void *)this + 9);
                        if (v18)
                        {
LABEL_58:
                          if ((*v18 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            int iInterface = v17->iInterface;
                            int v33 = 136315650;
                            v34 = "AppleUserECM";
                            __int16 v35 = 2080;
                            __int16 v36 = "findUSBPipe";
                            __int16 v37 = 1024;
                            int v38 = iInterface;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: int iInterface = 0x%x", (uint8_t *)&v33, 0x1Cu);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      EndpointDescriptor = IOUSBGetNextEndpointDescriptor(v15, v17, 0);
      if (EndpointDescriptor)
      {
        uint64_t v29 = EndpointDescriptor;
        int v30 = a3 << 7;
        while (1)
        {
          if ((v29->bmAttributes & 3) == a4)
          {
            uint8_t bEndpointAddress = v29->bEndpointAddress;
            if (v30 == (bEndpointAddress & 0x80)) {
              break;
            }
          }
          uint64_t v29 = IOUSBGetNextEndpointDescriptor(v15, v17, (const IOUSBDescriptorHeader *)v29);
          if (!v29) {
            goto LABEL_47;
          }
        }
        if (a6) {
          *a6 = v29->wMaxPacketSize;
        }
        uint64_t v13 = IOUSBHostInterface::CopyPipe(a2, bEndpointAddress, a5, 0);
      }
    }
LABEL_47:
    IOUSBHostFreeDescriptor(v15);
  }
  return v13;
}

void *AppleUserECM::allocateUSBPackets(AppleUserECM *this, IOUSBHostPipe *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = (unsigned char *)*((void *)this + 9);
  if (v8 && (*v8 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    uint64_t v14 = "AppleUserECM";
    __int16 v15 = 2080;
    uint64_t v16 = "allocateUSBPackets";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v9 = (void *)IOMallocZeroTyped();
  if (!v9 || IOUSBHostPipe::CreateMemoryDescriptorRing(a2, a3, 0))
  {
LABEL_15:
    AppleUserECM::freeUSBPackets(this, v9, a3);
    return 0;
  }
  if (a3)
  {
    uint64_t v10 = 0;
    for (i = v9;
          !(*(unsigned int (**)(void, uint64_t, uint64_t, void *))(**(void **)(*((void *)this + 9)
                                                                                            + 32)
                                                                              + 88))(*(void *)(*((void *)this + 9) + 32), 3, a4, i);
          i += 3)
    {
      if (!*i) {
        return v9;
      }
      if (IOMemoryDescriptor::Map((IOMemoryDescriptor *)*i, 0, 0, 0, IOVMPageSize, i + 1, i + 2)
        || IOUSBHostPipe::SetMemoryDescriptor(a2, (IOMemoryDescriptor *)*i, v10, 0))
      {
        break;
      }
      if (a3 == ++v10) {
        return v9;
      }
    }
    goto LABEL_15;
  }
  return v9;
}

uint64_t sub_100008204(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(*(void *)(v1 + 72) + 128);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
    *(void *)(*(void *)(v1 + 72) + 128) = 0;
  }
  return result;
}

void AppleUserECM::freeUSBPackets(AppleUserECM *this, void *address, unsigned int a3)
{
  uint64_t v5 = (unsigned char *)*((void *)this + 9);
  if (v5 && (*v5 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "AppleUserECM";
    __int16 v11 = 2080;
    int v12 = "freeUSBPackets";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", (uint8_t *)&v9, 0x16u);
  }
  if (address)
  {
    if (a3)
    {
      uint64_t v6 = a3;
      uint32_t v7 = address;
      do
      {
        if (*v7)
        {
          (*(void (**)(void))(*(void *)*v7 + 16))(*v7);
          void *v7 = 0;
        }
        v7 += 3;
        --v6;
      }
      while (v6);
      size_t v8 = 24 * a3;
    }
    else
    {
      size_t v8 = 0;
    }
    IOFree(address, v8);
  }
}

BOOL AppleUserECM::findDataInterfaceWithUnionFunctionalDescriptor(AppleUserECM *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, unsigned __int8 *a4)
{
  AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType(configurationDescriptor, parentDescriptor, 0, 0x24u);
  BOOL v9 = AssociatedDescriptorWithType != 0;
  if (AssociatedDescriptorWithType)
  {
    while (AssociatedDescriptorWithType->bLength < 4u || AssociatedDescriptorWithType[1].bLength != 6)
    {
      AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType(configurationDescriptor, parentDescriptor, AssociatedDescriptorWithType, 0x24u);
      BOOL v9 = AssociatedDescriptorWithType != 0;
      if (!AssociatedDescriptorWithType) {
        return v9;
      }
    }
    int bLength = AssociatedDescriptorWithType[2].bLength;
    *a4 = bLength;
    int v12 = (unsigned char *)*((void *)this + 9);
    if (v12 && (*v12 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = parentDescriptor[1].bLength;
      int v14 = 136315906;
      __int16 v15 = "AppleUserECM";
      __int16 v16 = 2080;
      uint64_t v17 = "findDataInterfaceWithUnionFunctionalDescriptor";
      __int16 v18 = 1024;
      int v19 = v13;
      __int16 v20 = 1024;
      int v21 = bLength;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: AppleUserECM interface %d found suitable UNF (%d)\n", (uint8_t *)&v14, 0x22u);
    }
  }
  return v9;
}

BOOL AppleUserECM::findDataInterfaceWithInterfaceAssociationDescriptor(AppleUserECM *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *a3, unsigned __int8 *a4)
{
  InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor(configurationDescriptor, 0);
  BOOL v9 = InterfaceAssociationDescriptor != 0;
  if (InterfaceAssociationDescriptor)
  {
    while (1)
    {
      if (InterfaceAssociationDescriptor[2].bLength == 2 && InterfaceAssociationDescriptor[2].bDescriptorType == 6)
      {
        int bLength = InterfaceAssociationDescriptor[1].bLength;
        if (bLength == a3->bInterfaceNumber && InterfaceAssociationDescriptor[1].bDescriptorType == 2) {
          break;
        }
      }
      InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor(configurationDescriptor, InterfaceAssociationDescriptor);
      BOOL v9 = InterfaceAssociationDescriptor != 0;
      if (!InterfaceAssociationDescriptor) {
        return v9;
      }
    }
    *a4 = bLength + 1;
    int v12 = (unsigned char *)*((void *)this + 9);
    if (v12 && (*v12 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int bInterfaceNumber = a3->bInterfaceNumber;
      int v14 = 136315650;
      __int16 v15 = "AppleUserECM";
      __int16 v16 = 2080;
      uint64_t v17 = "findDataInterfaceWithInterfaceAssociationDescriptor";
      __int16 v18 = 1024;
      int v19 = bInterfaceNumber;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: AppleUserECM interface %d found suitable IAD\n", (uint8_t *)&v14, 0x1Cu);
    }
  }
  return v9;
}

void AppleUserECM::printPacket(AppleUserECM *this, unsigned __int8 *a2, int a3)
{
  if ((**((unsigned char **)this + 9) & 4) != 0) {
    IOLogBuffer("AppleUserECM::printPacket", a2, a3);
  }
}

void non-virtual thunk to'AppleUserECM::printPacket(AppleUserECM *this, unsigned __int8 *a2, int a3)
{
  if ((**((unsigned char **)this + 1) & 4) != 0) {
    IOLogBuffer("AppleUserECM::printPacket", a2, a3);
  }
}

uint64_t sub_1000086B8(void *a1)
{
  *a1 = off_10000C448;
  return 0;
}

uint64_t AppleUserECMDataMetaClass::New(AppleUserECMDataMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C488;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000C4D0;
  return 0;
}

uint64_t AppleUserECMData::Dispatch(IOService *this, IORPC *a2)
{
  IORPC v3 = *a2;
  return AppleUserECMData::_Dispatch(this, &v3);
}

uint64_t AppleUserECMData::_Dispatch(IOService *a1, IORPC *a2)
{
  if (IORPCMessageFromMach(a2->message, 0)->msgid == 0xAB6F76DDE6D693F2)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, a1, (IOService::Start_Handler)AppleUserECMData::Start_Impl);
  }
  else
  {
    IORPC v5 = *a2;
    return IOService::_Dispatch(a1, &v5);
  }
}

uint64_t AppleUserECMDataMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10000884C(void *a1)
{
  *a1 = off_10000C950;
  return 0;
}

uint64_t AppleUserECMMetaClass::New(AppleUserECMMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C990;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000CB28;
  *(void *)&a2[1].refcount = &off_10000CB48;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CCA0;
  return 0;
}

uint64_t AppleUserECM::Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return AppleUserECM::_Dispatch(this, &v4, a3);
}

uint64_t AppleUserECM::_Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid <= 0x18F06319DAB994C1)
  {
    if (msgid > (uint64_t)0xE042A87972611224)
    {
      switch(msgid)
      {
        case 0xE042A87972611225:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v37 = *a2;
            return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(&v37, this, (IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler)AppleUserECM::SetAllMulticastModeEnable_Impl);
          }
          long long v38 = *(_OWORD *)&a2->message;
          uint64_t v39 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v38;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        case 0xE072FCC26CF639ACLL:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v40 = *a2;
            return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(&v40, this, (IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler)AppleUserECM::SetPromiscuousModeEnable_Impl);
          }
          long long v41 = *(_OWORD *)&a2->message;
          uint64_t v42 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v41;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        case 0xF421A9D80F9A1FDALL:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v43 = *a2;
            return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(&v43, this, (IOUserNetworkEthernet::SetInterfaceEnable_Handler)AppleUserECM::SetInterfaceEnable_Impl);
          }
          long long v44 = *(_OWORD *)&a2->message;
          uint64_t v45 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v44;
          return OSMetaClassBase::Dispatch(this, p_invoke);
      }
    }
    else
    {
      switch(msgid)
      {
        case 0x98E715041C459FA5:
          IORPC rpc = *a2;
          return IOService::Stop_Invoke(&rpc, this, (IOService::Stop_Handler)AppleUserECM::Stop_Impl);
        case 0xAB6F76DDE6D693F2:
          IORPC v47 = *a2;
          return IOService::Start_Invoke(&v47, this, (IOService::Start_Handler)AppleUserECM::Start_Impl);
        case 0xC3E63AC546EBD1FELL:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v34 = *a2;
            return IOUserNetworkEthernet::SelectMediaType_Invoke(&v34, this, (IOUserNetworkEthernet::SelectMediaType_Handler)AppleUserECM::SelectMediaType_Impl);
          }
          long long v35 = *(_OWORD *)&a2->message;
          uint64_t v36 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v35;
          return OSMetaClassBase::Dispatch(this, p_invoke);
      }
    }
LABEL_40:
    IORPC v14 = *a2;
    return IOUserNetworkEthernet::_Dispatch(this, &v14);
  }
  if (msgid <= 0x49B96B1A38AA6597)
  {
    if (msgid == 0x18F06319DAB994C2)
    {
      if (!OSMetaClassBase::IsRemote(this))
      {
        IORPC v15 = *a2;
        return IOTimerDispatchSource::TimerOccurred_Invoke(&v15, this, (IOTimerDispatchSource::TimerOccurred_Handler)AppleUserECM::InterruptReadTimerOccurred_Impl, (const OSMetaClass *)gOSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass);
      }
      long long v16 = *(_OWORD *)&a2->message;
      uint64_t v17 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v16;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    if (msgid != 0x1A87CDD6BE193E74)
    {
      if (msgid != 0x39F9B9387C35AD11) {
        goto LABEL_40;
      }
      if (OSMetaClassBase::IsRemote(this))
      {
        long long v22 = *(_OWORD *)&a2->message;
        uint64_t v23 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v22;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      long long v20 = *(_OWORD *)&a2->message;
      uint64_t v21 = *(void *)&a2->sendSize;
      size_t v8 = (const OSMetaClass *)gOSAction_AppleUserECM_RxCompleteMetaClass;
      BOOL v9 = AppleUserECM::RxComplete_Impl;
      uint64_t v10 = (IORPC *)&v20;
      return IOUSBHostPipe::CompleteAsyncIOBundled_Invoke(v10, this, (IOUSBHostPipe::CompleteAsyncIOBundled_Handler)v9, v8);
    }
    if (OSMetaClassBase::IsRemote(this))
    {
      long long v28 = *(_OWORD *)&a2->message;
      uint64_t v29 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v28;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    IORPC v27 = *a2;
    __int16 v11 = (const OSMetaClass *)gOSAction_AppleUserECM_RxPacketsAvailableMetaClass;
    int v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))AppleUserECM::RxPacketsAvailable_Impl;
    int v13 = &v27;
    return IODataQueueDispatchSource::DataAvailable_Invoke(v13, this, v12, v11);
  }
  if (msgid == 0x49B96B1A38AA6598)
  {
    if (OSMetaClassBase::IsRemote(this))
    {
      long long v25 = *(_OWORD *)&a2->message;
      uint64_t v26 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v25;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    IORPC v24 = *a2;
    size_t v8 = (const OSMetaClass *)gOSAction_AppleUserECM_TxCompleteMetaClass;
    BOOL v9 = AppleUserECM::TxComplete_Impl;
    uint64_t v10 = &v24;
    return IOUSBHostPipe::CompleteAsyncIOBundled_Invoke(v10, this, (IOUSBHostPipe::CompleteAsyncIOBundled_Handler)v9, v8);
  }
  if (msgid != 0x6D29AF5C0FF1913ALL)
  {
    if (msgid != 0x720B4D3E4DAE28B5) {
      goto LABEL_40;
    }
    if (OSMetaClassBase::IsRemote(this))
    {
      long long v32 = *(_OWORD *)&a2->message;
      uint64_t v33 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v32;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    long long v30 = *(_OWORD *)&a2->message;
    uint64_t v31 = *(void *)&a2->sendSize;
    __int16 v11 = (const OSMetaClass *)gOSAction_AppleUserECM_TxPacketsAvailableMetaClass;
    int v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))AppleUserECM::TxPacketsAvailable_Impl;
    int v13 = (IORPC *)&v30;
    return IODataQueueDispatchSource::DataAvailable_Invoke(v13, this, v12, v11);
  }
  if (!OSMetaClassBase::IsRemote(this))
  {
    IORPC v18 = *a2;
    return IOUSBHostPipe::CompleteAsyncIO_Invoke(&v18, this, (IOUSBHostPipe::CompleteAsyncIO_Handler)AppleUserECM::InterruptReadComplete_Impl, (const OSMetaClass *)gOSAction_AppleUserECM_InterruptReadCompleteMetaClass);
  }
  IORPC invoke = *a2;
  p_IORPC invoke = &invoke;
  return OSMetaClassBase::Dispatch(this, p_invoke);
}

uint64_t AppleUserECMMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t AppleUserECM::CreateActionTxPacketsAvailable(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_TxPacketsAvailable");
  if (!v6) {
    return 3758097085;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x720B4D3E4DAE28B5uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionRxPacketsAvailable(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_RxPacketsAvailable");
  if (!v6) {
    return 3758097085;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x1A87CDD6BE193E74uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionTxComplete(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_TxComplete");
  if (!v6) {
    return 3758097085;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x49B96B1A38AA6598uLL, 0xDD0623CAA00A3C04, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionRxComplete(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_RxComplete");
  if (!v6) {
    return 3758097085;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x39F9B9387C35AD11uLL, 0xDD0623CAA00A3C04, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionInterruptReadComplete(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_InterruptReadComplete");
  if (!v6) {
    return 3758097085;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6D29AF5C0FF1913AuLL, 0xC320A3EEA932C04ALL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionInterruptReadTimerOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_InterruptReadTimerOccurred");
  if (!v6) {
    return 3758097085;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x18F06319DAB994C2uLL, 0xF4AB1C3CBB5AE47uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_10000937C(void *a1)
{
  *a1 = off_10000CCB8;
  return 0;
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailableMetaClass::New(OSAction_AppleUserECM_TxPacketsAvailableMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CCF8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CD40;
  return 0;
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailable::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailable::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailableMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000094DC(void *a1)
{
  *a1 = off_10000CD60;
  return 0;
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailableMetaClass::New(OSAction_AppleUserECM_RxPacketsAvailableMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CDA0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CDE8;
  return 0;
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailable::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailable::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailableMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10000963C(void *a1)
{
  *a1 = off_10000CE08;
  return 0;
}

uint64_t OSAction_AppleUserECM_TxCompleteMetaClass::New(OSAction_AppleUserECM_TxCompleteMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CE48;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CE90;
  return 0;
}

uint64_t OSAction_AppleUserECM_TxComplete::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_TxComplete::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_TxCompleteMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10000979C(void *a1)
{
  *a1 = off_10000CEB0;
  return 0;
}

uint64_t OSAction_AppleUserECM_RxCompleteMetaClass::New(OSAction_AppleUserECM_RxCompleteMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CEF0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CF38;
  return 0;
}

uint64_t OSAction_AppleUserECM_RxComplete::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_RxComplete::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_RxCompleteMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000098FC(void *a1)
{
  *a1 = off_10000CF58;
  return 0;
}

uint64_t OSAction_AppleUserECM_InterruptReadCompleteMetaClass::New(OSAction_AppleUserECM_InterruptReadCompleteMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CF98;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CFE0;
  return 0;
}

uint64_t OSAction_AppleUserECM_InterruptReadComplete::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_InterruptReadComplete::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_InterruptReadCompleteMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100009A5C(void *a1)
{
  *a1 = off_10000D000;
  return 0;
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass::New(OSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D040;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000D088;
  return 0;
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurred::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100009BBC()
{
  return gOSAction_AppleUserECM_TxPacketsAvailableMetaClass;
}

uint64_t sub_100009BC8()
{
  return gOSAction_AppleUserECM_RxPacketsAvailableMetaClass;
}

uint64_t sub_100009BD4()
{
  return gOSAction_AppleUserECM_TxCompleteMetaClass;
}

uint64_t sub_100009BE0()
{
  return gOSAction_AppleUserECM_RxCompleteMetaClass;
}

uint64_t sub_100009BEC()
{
  return gOSAction_AppleUserECM_InterruptReadCompleteMetaClass;
}

uint64_t sub_100009BF8()
{
  return gOSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass;
}

void sub_100009C04()
{
}

void IOFree(void *address, size_t length)
{
}

int IOLog(const char *format, ...)
{
  return _IOLog(format);
}

void IOLogBuffer(const char *title, const void *buffer, size_t size)
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

IORPCMessage *__cdecl IORPCMessageFromMach(IORPCMessageMach *msg, BOOL reply)
{
  return _IORPCMessageFromMach(msg, reply);
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextAssociatedDescriptorWithType(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, const IOUSBDescriptorHeader *currentDescriptor, const uint8_t type)
{
  return _IOUSBGetNextAssociatedDescriptorWithType(configurationDescriptor, parentDescriptor, currentDescriptor, type);
}

const IOUSBEndpointDescriptor *__cdecl IOUSBGetNextEndpointDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *interfaceDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  return _IOUSBGetNextEndpointDescriptor(configurationDescriptor, interfaceDescriptor, currentDescriptor);
}

const IOUSBInterfaceAssociationDescriptor *__cdecl IOUSBGetNextInterfaceAssociationDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  return _IOUSBGetNextInterfaceAssociationDescriptor(configurationDescriptor, currentDescriptor);
}

const IOUSBInterfaceDescriptor *__cdecl IOUSBGetNextInterfaceDescriptor(const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  return _IOUSBGetNextInterfaceDescriptor(configurationDescriptor, currentDescriptor);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void IOUSBHostFreeDescriptor(const IOUSBStringDescriptor *descriptor)
{
}

void IOUSBHostFreeDescriptor(const IOUSBConfigurationDescriptor *descriptor)
{
}

kern_return_t IOUSBHostPipe::ClearStall(IOUSBHostPipe *this, BOOL withRequest, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::ClearStall(this, withRequest, supermethod);
}

kern_return_t IOUSBHostPipe::AsyncIOBundled(IOUSBHostPipe *this, uint32_t ioTransferIndex, uint32_t ioTransferCount, uint32_t *ioTransferAcceptedCount, const unsigned int *dataBufferLengthArray, int dataBufferLengthArrayCount, OSAction *completion, uint32_t completionTimeoutMs, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::AsyncIOBundled(this, ioTransferIndex, ioTransferCount, ioTransferAcceptedCount, dataBufferLengthArray, dataBufferLengthArrayCount, completion, completionTimeoutMs, supermethod);
}

kern_return_t IOUSBHostPipe::SetMemoryDescriptor(IOUSBHostPipe *this, IOMemoryDescriptor *memoryDescriptor, uint32_t index, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::SetMemoryDescriptor(this, memoryDescriptor, index, supermethod);
}

kern_return_t IOUSBHostPipe::CompleteAsyncIO_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUSBHostPipe::CompleteAsyncIO_Handler func, const OSMetaClass *targetActionClass)
{
  return IOUSBHostPipe::CompleteAsyncIO_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IOUSBHostPipe::CreateMemoryDescriptorRing(IOUSBHostPipe *this, uint32_t size, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::CreateMemoryDescriptorRing(this, size, supermethod);
}

kern_return_t IOUSBHostPipe::CompleteAsyncIOBundled_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUSBHostPipe::CompleteAsyncIOBundled_Handler func, const OSMetaClass *targetActionClass)
{
  return IOUSBHostPipe::CompleteAsyncIOBundled_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IOUSBHostPipe::AsyncIO(IOUSBHostPipe *this, IOMemoryDescriptor *dataBuffer, uint32_t dataBufferLength, OSAction *completion, uint32_t completionTimeoutMs, OSDispatchMethod supermethod)
{
  return IOUSBHostPipe::AsyncIO(this, dataBuffer, dataBufferLength, completion, completionTimeoutMs, supermethod);
}

void IODispatchQueue::DispatchSync(IODispatchQueue *this, IODispatchBlock block)
{
}

kern_return_t IODispatchQueue::Create(const IODispatchQueueName name, uint64_t options, uint64_t priority, IODispatchQueue **queue)
{
  return IODispatchQueue::Create(name, options, priority, queue);
}

kern_return_t IOUSBHostDevice::CopyInterface(IOUSBHostDevice *this, uintptr_t ref, IOUSBHostInterface **interface, OSDispatchMethod supermethod)
{
  return IOUSBHostDevice::CopyInterface(this, ref, interface, supermethod);
}

kern_return_t IOUSBHostDevice::CreateInterfaceIterator(IOUSBHostDevice *this, uintptr_t *ref, OSDispatchMethod supermethod)
{
  return IOUSBHostDevice::CreateInterfaceIterator(this, ref, supermethod);
}

kern_return_t IOUSBHostDevice::DestroyInterfaceIterator(IOUSBHostDevice *this, uintptr_t ref, OSDispatchMethod supermethod)
{
  return IOUSBHostDevice::DestroyInterfaceIterator(this, ref, supermethod);
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

kern_return_t IOMemoryDescriptor::Map(IOMemoryDescriptor *this, uint64_t options, uint64_t address, uint64_t length, uint64_t alignment, uint64_t *returnAddress, uint64_t *returnLength)
{
  return IOMemoryDescriptor::Map(this, options, address, length, alignment, returnAddress, returnLength);
}

kern_return_t IOUSBHostInterface::CopyDevice(IOUSBHostInterface *this, IOUSBHostDevice **device, OSDispatchMethod supermethod)
{
  return IOUSBHostInterface::CopyDevice(this, device, supermethod);
}

kern_return_t IOUSBHostInterface::SelectAlternateSetting(IOUSBHostInterface *this, uint8_t bAlternateSetting, OSDispatchMethod supermethod)
{
  return IOUSBHostInterface::SelectAlternateSetting(this, bAlternateSetting, supermethod);
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

kern_return_t IOUserNetworkEthernet::SelectMediaType(IOUserNetworkEthernet *this, IOUserNetworkMediaType mediaType, OSDispatchMethod supermethod)
{
  return IOUserNetworkEthernet::SelectMediaType(this, mediaType, supermethod);
}

kern_return_t IOUserNetworkEthernet::SelectMediaType_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SelectMediaType_Handler func)
{
  return IOUserNetworkEthernet::SelectMediaType_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetSoftwareVlanSupport(IOUserNetworkEthernet *this, BOOL isSupported)
{
  return IOUserNetworkEthernet::SetSoftwareVlanSupport(this, isSupported);
}

kern_return_t IOUserNetworkEthernet::SetInterfaceEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetInterfaceEnable_Handler func)
{
  return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler func)
{
  return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler func)
{
  return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(rpc, target, func);
}

void IOUserNetworkEthernet::free(IOUserNetworkEthernet *this)
{
}

BOOL IOUserNetworkEthernet::init(IOUserNetworkEthernet *this)
{
  return IOUserNetworkEthernet::init(this);
}

kern_return_t IOUserNetworkEthernet::_Dispatch(IOUserNetworkEthernet *self, const IORPC *rpc)
{
  return IOUserNetworkEthernet::_Dispatch(self, rpc);
}

kern_return_t IOUserNetworkPacketQueue::SetEnable(IOUserNetworkPacketQueue *this, BOOL isEnable, OSDispatchMethod supermethod)
{
  return IOUserNetworkPacketQueue::SetEnable(this, isEnable, supermethod);
}

kern_return_t IODataQueueDispatchSource::DataAvailable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataAvailable_Handler func, const OSMetaClass *targetActionClass)
{
  return IODataQueueDispatchSource::DataAvailable_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IODataQueueDispatchSource::SetDataAvailableHandler(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IODataQueueDispatchSource::SetDataAvailableHandler(this, action, supermethod);
}

kern_return_t IOUserNetworkPacketBufferPool::CreateWithOptions(IOService *device, const char *name, const IOUserNetworkPacketBufferPoolOptions *options, IOUserNetworkPacketBufferPool **pool)
{
  return IOUserNetworkPacketBufferPool::CreateWithOptions(device, name, options, pool);
}

kern_return_t IOUserNetworkRxCompletionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkRxCompletionQueue **queue)
{
  return IOUserNetworkRxCompletionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkRxSubmissionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkRxSubmissionQueue **queue)
{
  return IOUserNetworkRxSubmissionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkTxCompletionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkTxCompletionQueue **queue)
{
  return IOUserNetworkTxCompletionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkTxSubmissionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkTxSubmissionQueue **queue)
{
  return IOUserNetworkTxSubmissionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t OSAction::CreateWithTypeName(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSString *typeName, OSAction **action)
{
  return OSAction::CreateWithTypeName(target, targetmsgid, msgid, referenceSize, typeName, action);
}

kern_return_t OSAction::_Dispatch(OSAction *self, const IORPC *rpc)
{
  return OSAction::_Dispatch(self, rpc);
}

kern_return_t OSObject::SetDispatchQueue(OSObject *this, const IODispatchQueueName name, IODispatchQueue *queue, OSDispatchMethod supermethod)
{
  return OSObject::SetDispatchQueue(this, name, queue, supermethod);
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

kern_return_t IOService::RegisterService(IOService *this, OSDispatchMethod supermethod)
{
  return IOService::RegisterService(this, supermethod);
}

kern_return_t IOService::Stop(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Stop(this, provider, supermethod);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}